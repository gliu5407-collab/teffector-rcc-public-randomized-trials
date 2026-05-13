# V18H: Expression/variance-matched random five-gene negative-control benchmark
# Strict: no change to primary biomarker/endpoint/contrast or locked numerics.
suppressPackageStartupMessages({
  library(data.table)
  library(survival)
})

set.seed(20260513)

ROOT <- Sys.getenv("V18H_ROOT", getwd())
OUT      <- file.path(ROOT, "output_v18h")
FIG      <- file.path(ROOT, "figures_v18h")
LOG      <- file.path(ROOT, "logs_v18h")
dir.create(OUT, FALSE, TRUE); dir.create(FIG, FALSE, TRUE); dir.create(LOG, FALSE, TRUE)

TEFF5 <- c("CD8A","EOMES","PRF1","IFNG","CD274")
N_BINS_MEAN <- 10L
N_BINS_SD   <- 10L

R_TARGET    <- 10000L   # matched random sets per dataset
R_MIN       <- 3000L
R_REPORTED  <- R_TARGET # will be cut if needed

# Locked observed Teff5 HR_int, p (recovered for reporting only — do not refit/change)
locked <- list(
  IMmotion150 = list(HR_int = 0.521469230652954, p = 0.00124902867211007,
                     beta_int = -0.651105007906224, n = 177L, events = 113L,
                     reference_arm = "Sunitinib", test_arm = "AtezoBev"),
  JAVELIN     = list(HR_int = 0.7767395071379628, p = 0.0535742196969482,
                     beta_int = -0.2526502394735894, n = 726L, events = 358L,
                     reference_arm = "Sunitinib", test_arm = "Avelumab+Axitinib")
)

logf <- file.path(LOG, "10_main.log")
lg <- function(...) {
  msg <- paste(..., collapse=" ")
  cat(msg, "\n", file=logf, append=TRUE)
  cat(msg, "\n")
}
cat("", file=logf) # truncate
lg("V18H started:", as.character(Sys.time()))

# ------------------------------------------------------------------
# 1. IMmotion150 inputs
# ------------------------------------------------------------------
lg("\n=== IMmotion150 prep ===")
core <- readRDS(Sys.getenv("IM150_CORE_RDS", "path/to/analysis_dataset_v3_core.rds"))
core <- as.data.table(core)
# Restrict to locked primary comparison
im_dat <- core[ARM_STD %in% c("AtezoBev","Sunitinib")
               & !is.na(PFS_TIME) & !is.na(PFS_EVENT)
               & !is.na(IM150_Teff_5gene), ]
lg("IMmotion150 locked primary set: n =", nrow(im_dat),
   " events =", sum(im_dat$PFS_EVENT))
stopifnot(nrow(im_dat) == 177L)
stopifnot(sum(im_dat$PFS_EVENT) == 113L)

# Read full TPM matrix (genes x samples)
tpm_path <- Sys.getenv("IM150_TPM", "path/to/data_mrna_seq_tpm.txt")
tpm <- fread(tpm_path)
setnames(tpm, 1, "gene")
all_samples_tpm <- setdiff(colnames(tpm), "gene")
lg("IMmotion150 TPM: genes =", nrow(tpm), " samples in matrix =", length(all_samples_tpm))

# Confirm sample IDs match RDS
in_both <- intersect(all_samples_tpm, im_dat$SAMPLE_ID)
lg("samples present in both TPM and locked PFS set:", length(in_both))
stopifnot(length(in_both) == nrow(im_dat))

# Subset TPM to those samples
tpm_sub <- tpm[, c("gene", in_both), with = FALSE]
# log2(TPM+1) — TPM not in log scale per IMmotion150 cBio convention
genes <- tpm_sub$gene
mat <- as.matrix(tpm_sub[, -1, with = FALSE])
storage.mode(mat) <- "double"
mat_log <- log2(mat + 1)
rownames(mat_log) <- genes

# Gene-level QC
gene_mean <- rowMeans(mat_log, na.rm = TRUE)
gene_sd   <- apply(mat_log, 1, sd, na.rm = TRUE)
gene_miss <- rowMeans(is.na(mat_log))
gene_max  <- apply(mat_log, 1, max, na.rm = TRUE)

im_qc <- data.table(gene = genes, mean_log2tpm1 = gene_mean,
                    sd_log2tpm1 = gene_sd, missingness = gene_miss,
                    max_log2tpm1 = gene_max)
im_qc[, included := sd_log2tpm1 > 0 & is.finite(mean_log2tpm1) & missingness < 0.10 & !is.na(gene) & gene != ""]
# Exclude all-zero / extremely low expression: keep only if mean > 0 OR sd > 0
lg("IMmotion150 genes before filter:", nrow(im_qc),
   " kept:", sum(im_qc$included))

# Check Teff genes present
miss_teff_im <- setdiff(TEFF5, im_qc$gene[im_qc$included])
if (length(miss_teff_im) > 0) {
  lg("WARNING: IMmotion150 missing Teff genes from pool:", paste(miss_teff_im, collapse=", "))
}
im_qc[gene %in% TEFF5, is_teff5 := TRUE]
im_qc[!gene %in% TEFF5, is_teff5 := FALSE]

# Bin construction using included non-Teff genes
im_pool <- im_qc[included == TRUE & is_teff5 == FALSE]
# Quantile breaks on mean
m_brk <- quantile(im_pool$mean_log2tpm1, probs = seq(0, 1, length.out = N_BINS_MEAN + 1), na.rm = TRUE)
m_brk[1] <- m_brk[1] - 1e-9; m_brk[length(m_brk)] <- m_brk[length(m_brk)] + 1e-9
s_brk <- quantile(im_pool$sd_log2tpm1, probs = seq(0, 1, length.out = N_BINS_SD + 1), na.rm = TRUE)
s_brk[1] <- s_brk[1] - 1e-9; s_brk[length(s_brk)] <- s_brk[length(s_brk)] + 1e-9
# Apply to ALL genes (including Teff5) so we can locate Teff bins
im_qc[, mean_bin := as.integer(cut(mean_log2tpm1, breaks = m_brk, include.lowest = TRUE))]
im_qc[, sd_bin   := as.integer(cut(sd_log2tpm1, breaks = s_brk, include.lowest = TRUE))]
im_qc[, bin_id   := mean_bin * 100L + sd_bin]
im_pool <- im_qc[included == TRUE & is_teff5 == FALSE]
im_qc[, dataset := "IMmotion150"]

# Identify Teff5 bin assignments
im_teff_bins <- im_qc[gene %in% TEFF5, .(gene, mean_log2tpm1, sd_log2tpm1, mean_bin, sd_bin, bin_id)]
lg("\nIMmotion150 Teff5 bins:")
for (i in seq_len(nrow(im_teff_bins))) {
  lg(sprintf("  %s mean=%.3f sd=%.3f mean_bin=%d sd_bin=%d bin=%d",
             im_teff_bins$gene[i], im_teff_bins$mean_log2tpm1[i], im_teff_bins$sd_log2tpm1[i],
             im_teff_bins$mean_bin[i], im_teff_bins$sd_bin[i], im_teff_bins$bin_id[i]))
}

# ------------------------------------------------------------------
# 2. JAVELIN inputs
# ------------------------------------------------------------------
lg("\n=== JAVELIN prep ===")
jav_clin <- fread(Sys.getenv("JAVELIN_CLINICAL_CSV", "path/to/javelin_clinical.csv"))
jav_clin[, treatment := TRT01P]
jav_dat <- jav_clin[treatment %in% c("Avelumab+Axitinib","Sunitinib")
                    & !is.na(PFS_P) & !is.na(PFS_P_CNSR), ]
jav_dat[, PFS_time := PFS_P]
jav_dat[, PFS_event := 1 - PFS_P_CNSR] # CNSR=1 means censored → event=0
lg("JAVELIN clinical filtered (pre-S13 intersect): n =", nrow(jav_dat),
   " events =", sum(jav_dat$PFS_event))

# Read S13
s13_path <- Sys.getenv("JAVELIN_S13_EXPRESSION_CSV", file.path(ROOT, "data", "javelin_S13_full_expression_log2tpm.csv"))
# Header on row 2; row 1 is title
hdr_test <- readLines(s13_path, n = 2)
# Re-read skipping first descriptive row
jav_expr <- fread(s13_path, skip = 1L)
setnames(jav_expr, 1, "gene")
lg("JAVELIN S13: genes =", nrow(jav_expr), " sample cols =", ncol(jav_expr) - 1)

# Match samples
jav_sample_cols <- setdiff(colnames(jav_expr), "gene")
in_both_j <- intersect(jav_sample_cols, jav_dat$ID)
lg("JAVELIN samples in both expr + clinical:", length(in_both_j))
# Sometimes one sample may be missing from S13; restrict analysis cohort to those with expression
jav_dat <- jav_dat[ID %in% in_both_j, ]
lg("JAVELIN after restricting to samples with S13 expression: n =", nrow(jav_dat),
   " events =", sum(jav_dat$PFS_event))
stopifnot(nrow(jav_dat) == 726L)
stopifnot(sum(jav_dat$PFS_event) == 358L)

jav_sub <- jav_expr[, c("gene", in_both_j), with = FALSE]
jav_genes <- jav_sub$gene
jav_mat <- as.matrix(jav_sub[, -1, with = FALSE])
storage.mode(jav_mat) <- "double"
# S13 is already log2 TPM (Motzer 2020 supplement). Do not double-log.
jav_mean <- rowMeans(jav_mat, na.rm = TRUE)
jav_sd   <- apply(jav_mat, 1, sd, na.rm = TRUE)
jav_miss <- rowMeans(is.na(jav_mat))
jav_max  <- apply(jav_mat, 1, max, na.rm = TRUE)

jav_qc <- data.table(gene = jav_genes, mean_log2tpm = jav_mean,
                     sd_log2tpm = jav_sd, missingness = jav_miss,
                     max_log2tpm = jav_max)
jav_qc[, included := sd_log2tpm > 0 & is.finite(mean_log2tpm) & missingness < 0.10 & !is.na(gene) & gene != ""]
lg("JAVELIN genes before filter:", nrow(jav_qc), " kept:", sum(jav_qc$included))

miss_teff_j <- setdiff(TEFF5, jav_qc$gene[jav_qc$included])
if (length(miss_teff_j) > 0) lg("WARNING: JAVELIN missing Teff genes from pool:", paste(miss_teff_j, collapse=", "))

jav_qc[gene %in% TEFF5, is_teff5 := TRUE]
jav_qc[!gene %in% TEFF5, is_teff5 := FALSE]
jav_pool <- jav_qc[included == TRUE & is_teff5 == FALSE]

m_brk_j <- quantile(jav_pool$mean_log2tpm, probs = seq(0, 1, length.out = N_BINS_MEAN + 1), na.rm = TRUE)
m_brk_j[1] <- m_brk_j[1] - 1e-9; m_brk_j[length(m_brk_j)] <- m_brk_j[length(m_brk_j)] + 1e-9
s_brk_j <- quantile(jav_pool$sd_log2tpm, probs = seq(0, 1, length.out = N_BINS_SD + 1), na.rm = TRUE)
s_brk_j[1] <- s_brk_j[1] - 1e-9; s_brk_j[length(s_brk_j)] <- s_brk_j[length(s_brk_j)] + 1e-9
jav_qc[, mean_bin := as.integer(cut(mean_log2tpm, breaks = m_brk_j, include.lowest = TRUE))]
jav_qc[, sd_bin   := as.integer(cut(sd_log2tpm, breaks = s_brk_j, include.lowest = TRUE))]
jav_qc[, bin_id   := mean_bin * 100L + sd_bin]
jav_pool <- jav_qc[included == TRUE & is_teff5 == FALSE]
jav_qc[, dataset := "JAVELIN"]

jav_teff_bins <- jav_qc[gene %in% TEFF5, .(gene, mean_log2tpm, sd_log2tpm, mean_bin, sd_bin, bin_id)]
lg("\nJAVELIN Teff5 bins:")
for (i in seq_len(nrow(jav_teff_bins))) {
  lg(sprintf("  %s mean=%.3f sd=%.3f mean_bin=%d sd_bin=%d bin=%d",
             jav_teff_bins$gene[i], jav_teff_bins$mean_log2tpm[i], jav_teff_bins$sd_log2tpm[i],
             jav_teff_bins$mean_bin[i], jav_teff_bins$sd_bin[i], jav_teff_bins$bin_id[i]))
}

# ------------------------------------------------------------------
# Write per-gene QC
# ------------------------------------------------------------------
qc_out_im  <- copy(im_qc); qc_out_im[, dataset := "IMmotion150"]
qc_out_jav <- copy(jav_qc); qc_out_jav[, dataset := "JAVELIN"]
setnames(qc_out_im, c("mean_log2tpm1","sd_log2tpm1","max_log2tpm1"),
                    c("mean_expr","sd_expr","max_expr"))
setnames(qc_out_jav, c("mean_log2tpm","sd_log2tpm","max_log2tpm"),
                     c("mean_expr","sd_expr","max_expr"))
keep_cols <- c("dataset","gene","mean_expr","sd_expr","max_expr","missingness",
               "included","is_teff5","mean_bin","sd_bin","bin_id")
qc_all <- rbindlist(list(qc_out_im[, ..keep_cols], qc_out_jav[, ..keep_cols]))
fwrite(qc_all, file.path(OUT, "01_expression_scale_and_gene_pool_qc.csv"))
lg("\nWrote 01_expression_scale_and_gene_pool_qc.csv (rows=", nrow(qc_all), ")")

# ------------------------------------------------------------------
# Matched pool QC (Teff5 bin sizes)
# ------------------------------------------------------------------
get_pool <- function(qc_pool, mb, sb) {
  # exact bin first, else nearest by Chebyshev distance
  exact <- qc_pool[mean_bin == mb & sd_bin == sb, gene]
  if (length(exact) >= 50) return(list(genes = exact, expansion = 0L))
  # Expand by Chebyshev radius until we reach >=50 genes
  for (r in 1:5) {
    cand <- qc_pool[abs(mean_bin - mb) <= r & abs(sd_bin - sb) <= r, gene]
    if (length(cand) >= 50) return(list(genes = cand, expansion = r))
  }
  return(list(genes = cand, expansion = 5L)) # fallback widest
}

pool_qc_rows <- list()
im_teff_pools  <- list()
for (g in TEFF5) {
  mb <- im_qc[gene == g, mean_bin]; sb <- im_qc[gene == g, sd_bin]
  if (length(mb) == 0 || is.na(mb)) {
    im_teff_pools[[g]] <- list(genes = character(0), expansion = NA_integer_)
    pool_qc_rows[[length(pool_qc_rows) + 1L]] <- data.table(dataset="IMmotion150", teff_gene=g,
            mean_bin=NA_integer_, sd_bin=NA_integer_, pool_size=0, expansion_radius=NA_integer_)
    next
  }
  p <- get_pool(im_pool, mb, sb)
  im_teff_pools[[g]] <- p
  pool_qc_rows[[length(pool_qc_rows) + 1L]] <- data.table(
    dataset="IMmotion150", teff_gene=g, mean_bin=mb, sd_bin=sb,
    pool_size=length(p$genes), expansion_radius=p$expansion)
}
jav_teff_pools <- list()
for (g in TEFF5) {
  mb <- jav_qc[gene == g, mean_bin]; sb <- jav_qc[gene == g, sd_bin]
  if (length(mb) == 0 || is.na(mb)) {
    jav_teff_pools[[g]] <- list(genes = character(0), expansion = NA_integer_)
    pool_qc_rows[[length(pool_qc_rows) + 1L]] <- data.table(dataset="JAVELIN", teff_gene=g,
            mean_bin=NA_integer_, sd_bin=NA_integer_, pool_size=0, expansion_radius=NA_integer_)
    next
  }
  p <- get_pool(jav_pool, mb, sb)
  jav_teff_pools[[g]] <- p
  pool_qc_rows[[length(pool_qc_rows) + 1L]] <- data.table(
    dataset="JAVELIN", teff_gene=g, mean_bin=mb, sd_bin=sb,
    pool_size=length(p$genes), expansion_radius=p$expansion)
}
pool_qc <- rbindlist(pool_qc_rows)
fwrite(pool_qc, file.path(OUT, "02_matched_pool_qc.csv"))
lg("\nMatched pool sizes (IMmotion150 + JAVELIN):")
for (i in seq_len(nrow(pool_qc))) {
  lg(sprintf("  %s %s mean_bin=%s sd_bin=%s size=%d expansion=%s",
             pool_qc$dataset[i], pool_qc$teff_gene[i],
             as.character(pool_qc$mean_bin[i]), as.character(pool_qc$sd_bin[i]),
             pool_qc$pool_size[i], as.character(pool_qc$expansion_radius[i])))
}

# ------------------------------------------------------------------
# Helper: z-score across samples for a vector of gene rows
# returns a single per-sample score (mean of z's) over the given sample columns
# ------------------------------------------------------------------
zscore_score <- function(mat, gene_idx) {
  if (length(gene_idx) == 0) return(rep(NA_real_, ncol(mat)))
  sub <- mat[gene_idx, , drop = FALSE]
  mu  <- rowMeans(sub, na.rm = TRUE)
  sg  <- apply(sub, 1, sd, na.rm = TRUE)
  # z per gene, sample-wise
  z <- (sub - mu) / pmax(sg, 1e-12)
  colMeans(z, na.rm = TRUE)
}

# ------------------------------------------------------------------
# IMmotion150 negative-control loop
# ------------------------------------------------------------------
lg("\n=== IMmotion150 matched random sets (R =", R_TARGET, ") ===")
# Align sample order: matrix columns must match im_dat order
im_mat_log <- mat_log[, im_dat$SAMPLE_ID, drop = FALSE]
gene_to_row_im <- setNames(seq_len(nrow(im_mat_log)), rownames(im_mat_log))

# pre-compute treatment factor with Sunitinib as reference
trt_im <- factor(im_dat$ARM_STD, levels = c("Sunitinib","AtezoBev"))
surv_im <- Surv(im_dat$PFS_TIME, im_dat$PFS_EVENT)

im_res <- data.table(
  dataset = "IMmotion150",
  random_set_id = integer(R_TARGET),
  genes = character(R_TARGET),
  HR_int = NA_real_, beta_int = NA_real_, p_value = NA_real_,
  direction_supportive = NA, notes = ""
)
# Pre-compute pool gene-row indices
im_pool_idx <- lapply(TEFF5, function(g) gene_to_row_im[im_teff_pools[[g]]$genes])

t_start <- Sys.time()
for (r in seq_len(R_TARGET)) {
  # Sample one gene per Teff bin; ensure 5 unique genes
  picks <- integer(5)
  attempts <- 0
  repeat {
    picks <- sapply(im_pool_idx, function(idx) sample(idx, 1))
    if (anyDuplicated(picks) == 0) break
    attempts <- attempts + 1
    if (attempts > 20) {
      # extremely unlikely; just take unique
      picks <- unique(picks)
      break
    }
  }
  score <- zscore_score(im_mat_log, picks)
  score_z <- as.numeric(scale(score))
  ok <- !is.na(score_z) & is.finite(score_z)
  if (sum(ok) < 50) {
    im_res[r, `:=`(notes = "INSUFFICIENT_SAMPLES")]
    next
  }
  # Cox model
  fit <- tryCatch(coxph(surv_im[ok] ~ trt_im[ok] + score_z[ok] + trt_im[ok]:score_z[ok]),
                  error = function(e) NULL, warning = function(w) NULL)
  if (is.null(fit)) {
    im_res[r, `:=`(notes = "COXPH_FAIL")]
    next
  }
  cf <- summary(fit)$coefficients
  # Interaction is the term with ':' in its name
  int_row <- grep(":", rownames(cf), value = TRUE)
  if (length(int_row) != 1) {
    im_res[r, `:=`(notes = "NO_INTERACTION_ROW")]
    next
  }
  beta_int <- cf[int_row, "coef"]
  hr_int   <- exp(beta_int)
  p_int    <- cf[int_row, "Pr(>|z|)"]
  im_res[r, `:=`(
    random_set_id = r,
    genes = paste(rownames(im_mat_log)[picks], collapse=";"),
    HR_int = hr_int, beta_int = beta_int, p_value = p_int,
    direction_supportive = hr_int < 1
  )]
  if (r %% 1000L == 0L) {
    lg(sprintf("  IMmotion150 r=%d elapsed=%.1fs", r,
               as.numeric(difftime(Sys.time(), t_start, units = "secs"))))
  }
}
fwrite(im_res, file.path(OUT, "04_immotion150_matched_negative_control.csv"))
lg("Wrote 04_immotion150_matched_negative_control.csv  rows =", nrow(im_res),
   " valid =", sum(!is.na(im_res$HR_int)))

# ------------------------------------------------------------------
# JAVELIN negative-control loop
# ------------------------------------------------------------------
lg("\n=== JAVELIN matched random sets (R =", R_TARGET, ") ===")
# Align sample order
jav_mat_aligned <- jav_mat[, jav_dat$ID, drop = FALSE]
rownames(jav_mat_aligned) <- jav_genes
gene_to_row_jav <- setNames(seq_len(nrow(jav_mat_aligned)), jav_genes)

trt_j <- factor(jav_dat$treatment, levels = c("Sunitinib","Avelumab+Axitinib"))
surv_j <- Surv(jav_dat$PFS_time, jav_dat$PFS_event)

jav_res <- data.table(
  dataset = "JAVELIN",
  random_set_id = integer(R_TARGET),
  genes = character(R_TARGET),
  HR_int = NA_real_, beta_int = NA_real_, p_value = NA_real_,
  direction_supportive = NA, notes = ""
)
jav_pool_idx <- lapply(TEFF5, function(g) gene_to_row_jav[jav_teff_pools[[g]]$genes])

t_start <- Sys.time()
for (r in seq_len(R_TARGET)) {
  picks <- integer(5)
  attempts <- 0
  repeat {
    picks <- sapply(jav_pool_idx, function(idx) sample(idx, 1))
    if (anyDuplicated(picks) == 0) break
    attempts <- attempts + 1
    if (attempts > 20) { picks <- unique(picks); break }
  }
  score <- zscore_score(jav_mat_aligned, picks)
  score_z <- as.numeric(scale(score))
  ok <- !is.na(score_z) & is.finite(score_z)
  if (sum(ok) < 50) { jav_res[r, `:=`(notes = "INSUFFICIENT_SAMPLES")]; next }
  fit <- tryCatch(coxph(surv_j[ok] ~ trt_j[ok] + score_z[ok] + trt_j[ok]:score_z[ok]),
                  error = function(e) NULL, warning = function(w) NULL)
  if (is.null(fit)) { jav_res[r, `:=`(notes = "COXPH_FAIL")]; next }
  cf <- summary(fit)$coefficients
  int_row <- grep(":", rownames(cf), value = TRUE)
  if (length(int_row) != 1) { jav_res[r, `:=`(notes = "NO_INTERACTION_ROW")]; next }
  beta_int <- cf[int_row, "coef"]
  hr_int   <- exp(beta_int)
  p_int    <- cf[int_row, "Pr(>|z|)"]
  jav_res[r, `:=`(
    random_set_id = r,
    genes = paste(rownames(jav_mat_aligned)[picks], collapse=";"),
    HR_int = hr_int, beta_int = beta_int, p_value = p_int,
    direction_supportive = hr_int < 1
  )]
  if (r %% 1000L == 0L) {
    lg(sprintf("  JAVELIN r=%d elapsed=%.1fs", r,
               as.numeric(difftime(Sys.time(), t_start, units = "secs"))))
  }
}
fwrite(jav_res, file.path(OUT, "05_javelin_matched_negative_control.csv"))
lg("Wrote 05_javelin_matched_negative_control.csv  rows =", nrow(jav_res),
   " valid =", sum(!is.na(jav_res$HR_int)))

# ------------------------------------------------------------------
# Generation summary
# ------------------------------------------------------------------
gen_summary <- data.table(
  dataset      = c("IMmotion150","JAVELIN"),
  R_requested  = R_TARGET,
  R_valid      = c(sum(!is.na(im_res$HR_int)), sum(!is.na(jav_res$HR_int))),
  R_invalid    = c(sum(is.na(im_res$HR_int)),   sum(is.na(jav_res$HR_int))),
  fail_reasons = c(paste(unique(im_res$notes[im_res$notes != ""]), collapse=";"),
                   paste(unique(jav_res$notes[jav_res$notes != ""]), collapse=";"))
)
fwrite(gen_summary, file.path(OUT, "03_random_set_generation_summary.csv"))
lg("\nGeneration summary:"); print(gen_summary)

# ------------------------------------------------------------------
# Per-dataset summary metrics
# ------------------------------------------------------------------
summarise_ds <- function(res, locked_x, ds_label) {
  v <- res[!is.na(HR_int)]
  obs_HR <- locked_x$HR_int; obs_p <- locked_x$p
  frac_HR_le <- mean(v$HR_int <= obs_HR)
  frac_p_le  <- mean(v$p_value <= obs_p)
  pct_HR <- mean(v$HR_int >= obs_HR) * 100  # observed sits at lower tail; "extremity by HR"
  data.table(
    dataset = ds_label,
    obs_Teff_HR_int = obs_HR,
    obs_Teff_p = obs_p,
    R_total = nrow(res),
    R_valid = nrow(v),
    frac_random_HR_le_obs = frac_HR_le,
    frac_random_p_le_obs  = frac_p_le,
    percentile_obs_HR_extremity = pct_HR,           # fraction of randoms HR >= obs (obs is low → high % = extreme)
    percentile_obs_p_extremity  = mean(v$p_value >= obs_p) * 100,
    HR_median = median(v$HR_int),
    HR_q25 = quantile(v$HR_int, 0.25), HR_q75 = quantile(v$HR_int, 0.75),
    HR_min = min(v$HR_int), HR_max = max(v$HR_int),
    p_median = median(v$p_value),
    p_q25 = quantile(v$p_value, 0.25), p_q75 = quantile(v$p_value, 0.75),
    p_min = min(v$p_value), p_max = max(v$p_value)
  )
}
sum_im  <- summarise_ds(im_res, locked$IMmotion150, "IMmotion150")
sum_jav <- summarise_ds(jav_res, locked$JAVELIN, "JAVELIN")
summary_dt <- rbind(sum_im, sum_jav)
fwrite(summary_dt, file.path(OUT, "06_matched_negative_control_summary.csv"))
lg("\n=== Summary metrics ===")
print(summary_dt)

# ------------------------------------------------------------------
# Markdown summary
# ------------------------------------------------------------------
md <- c(
  "# V18H — Matched negative-control summary",
  "",
  paste0("Generated: ", as.character(Sys.time())),
  "",
  paste0("- Seed: 20260513"),
  paste0("- Bins: ", N_BINS_MEAN, " mean quantiles x ", N_BINS_SD, " SD quantiles"),
  paste0("- R requested per dataset: ", R_TARGET),
  "",
  "## IMmotion150 (AtezoBev vs Sunitinib, PFS)",
  sprintf("- Observed locked Teff5 HR_int = %.4f, p = %.4f", sum_im$obs_Teff_HR_int, sum_im$obs_Teff_p),
  sprintf("- R valid = %d / %d", sum_im$R_valid, sum_im$R_total),
  sprintf("- Random HR_int median (IQR) = %.3f (%.3f-%.3f); range = %.3f-%.3f",
          sum_im$HR_median, sum_im$HR_q25, sum_im$HR_q75, sum_im$HR_min, sum_im$HR_max),
  sprintf("- Random p median (IQR) = %.3f (%.3f-%.3f)",
          sum_im$p_median, sum_im$p_q25, sum_im$p_q75),
  sprintf("- Fraction matched random sets with HR_int <= observed = %.4f", sum_im$frac_random_HR_le_obs),
  sprintf("- Fraction matched random sets with p <= observed     = %.4f", sum_im$frac_random_p_le_obs),
  "",
  "## JAVELIN Renal 101 (Avelumab+Axitinib vs Sunitinib, PFS)",
  sprintf("- Observed locked Teff5 HR_int = %.4f, p = %.4f", sum_jav$obs_Teff_HR_int, sum_jav$obs_Teff_p),
  sprintf("- R valid = %d / %d", sum_jav$R_valid, sum_jav$R_total),
  sprintf("- Random HR_int median (IQR) = %.3f (%.3f-%.3f); range = %.3f-%.3f",
          sum_jav$HR_median, sum_jav$HR_q25, sum_jav$HR_q75, sum_jav$HR_min, sum_jav$HR_max),
  sprintf("- Random p median (IQR) = %.3f (%.3f-%.3f)",
          sum_jav$p_median, sum_jav$p_q25, sum_jav$p_q75),
  sprintf("- Fraction matched random sets with HR_int <= observed = %.4f", sum_jav$frac_random_HR_le_obs),
  sprintf("- Fraction matched random sets with p <= observed     = %.4f", sum_jav$frac_random_p_le_obs),
  "",
  "Interpretation rules per V18H protocol: supportive only — does not change primary biomarker, endpoint, contrast, model, or any locked numerical result."
)
writeLines(md, file.path(OUT, "07_matched_negative_control_summary.md"))
lg("\nWrote 07_matched_negative_control_summary.md")

# ------------------------------------------------------------------
# Figure: histogram of random HR_int with observed marker (per dataset)
# ------------------------------------------------------------------
plot_ok <- TRUE
plot_ok <- tryCatch({
  png(file.path(FIG, "v18h_random_HR_int_IMmotion150.png"), width=1200, height=800, res=150)
  par(mar=c(4,4,3,1))
  v <- im_res$HR_int[!is.na(im_res$HR_int)]
  hist(log(v), breaks=60, main="IMmotion150 matched random HR_int (log)",
       xlab="log(HR_int)", col="grey85", border="grey60")
  abline(v=log(sum_im$obs_Teff_HR_int), col="red", lwd=2)
  legend("topright", legend=c(sprintf("Observed Teff5 HR_int = %.3f", sum_im$obs_Teff_HR_int),
                              sprintf("Frac random <= obs = %.4f", sum_im$frac_random_HR_le_obs)),
         bty="n", text.col=c("red","black"))
  dev.off()
  png(file.path(FIG, "v18h_random_HR_int_JAVELIN.png"), width=1200, height=800, res=150)
  par(mar=c(4,4,3,1))
  v <- jav_res$HR_int[!is.na(jav_res$HR_int)]
  hist(log(v), breaks=60, main="JAVELIN matched random HR_int (log)",
       xlab="log(HR_int)", col="grey85", border="grey60")
  abline(v=log(sum_jav$obs_Teff_HR_int), col="red", lwd=2)
  legend("topright", legend=c(sprintf("Observed Teff5 HR_int = %.3f", sum_jav$obs_Teff_HR_int),
                              sprintf("Frac random <= obs = %.4f", sum_jav$frac_random_HR_le_obs)),
         bty="n", text.col=c("red","black"))
  dev.off()
  TRUE
}, error=function(e){ message("Plot failed: ",conditionMessage(e)); FALSE })

# ------------------------------------------------------------------
# Save summary list to RDS for downstream decision script
# ------------------------------------------------------------------
saveRDS(list(sum_im=sum_im, sum_jav=sum_jav,
             gen_summary=gen_summary,
             locked=locked,
             im_teff_bins=im_teff_bins, jav_teff_bins=jav_teff_bins,
             pool_qc=pool_qc),
        file.path(OUT, "_v18h_state.rds"))
lg("\nV18H main script DONE:", as.character(Sys.time()))
