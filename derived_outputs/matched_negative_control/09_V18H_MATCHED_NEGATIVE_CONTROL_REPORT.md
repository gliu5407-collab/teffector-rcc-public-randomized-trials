# V18H — Expression/variance-matched random five-gene negative-control benchmark — final report

Date generated: 2026-05-13
Seed: 20260513
R per dataset: 10,000 (target met; minimum was 3,000)

This run strictly follows `CLAUDE_CODE_V18H_MATCHED_NEGATIVE_CONTROL_PROMPT.md`.

## 0. Strict invariants (verified)

| Invariant | Result |
|---|---|
| Frozen primary biomarker | CD8A, EOMES, PRF1, IFNG, CD274 — unchanged |
| Frozen primary endpoint | PFS — unchanged |
| Frozen primary contrasts | IMmotion150 AtezoBev vs Sunitinib; JAVELIN Avelumab+Axitinib vs Sunitinib — unchanged |
| Frozen Cox model | `Surv(PFS_time, PFS_event) ~ treatment + score_z + treatment:score_z`, Sunitinib reference — unchanged |
| Locked observed Teff5 HR_int / p re-fit or changed? | NO — used existing locked values for comparator |
| New biomarker introduced? | NO |

## 1. Input availability

| Item | Path | Status |
|---|---|---|
| IMmotion150 TPM matrix | `data/data_mrna_seq_tpm.txt` (59,409 genes × 263 samples) | OK |
| IMmotion150 locked clinical/score | `output/analysis_dataset_v3_core.rds` | OK |
| JAVELIN S13 full expression matrix | `output_v6/raw_javelin/javelin_MOESM3.xlsx → S13_Gene_expression_TPM` (22,956 genes × 727 samples), extracted to CSV | OK |
| JAVELIN clinical | `output_v6/raw_javelin/javelin_clinical.csv` | OK |

`DATA_MISSING` cases: none.

## 2. Cohort reconstruction (used same sample set as locked primary analysis)

| Dataset | Filter | n samples | events (PFS) |
|---|---|---|---|
| IMmotion150 | ARM_STD ∈ {AtezoBev, Sunitinib}, non-NA PFS, score available | 177 | 113 |
| JAVELIN | TRT01P ∈ {Avelumab+Axitinib, Sunitinib}, non-NA PFS, sample present in S13 | 726 | 358 |

These match the locked primary-analysis n/events exactly.

## 3. Expression scale handling (documented)

- IMmotion150: input is raw TPM. Applied `log2(TPM + 1)` to all genes before gene-level QC and matching. No double-log.
- JAVELIN: S13 is published as log2 TPM with values < 0.01 set to 0.01 (per supplement header). **Not** re-logged.

## 4. Gene pool QC

| Dataset | Genes total | Kept (sd>0, miss<10 %) | Excluded |
|---|---|---|---|
| IMmotion150 | 59,409 | 43,684 | 15,725 |
| JAVELIN | 22,956 | 22,955 | 1 |

Per-gene QC table: `output_v18h/01_expression_scale_and_gene_pool_qc.csv`.

## 5. Matched pool construction

- 10 × 10 deciles on (mean expression, expression SD) using included non-Teff genes only.
- Each T-effector gene located to one mean × SD bin within each dataset.
- All five Teff5 genes excluded from the random-pool universe.
- For every random set, one gene is sampled from each Teff5 gene's matching bin; expansion-radius logic available but not triggered (all pool sizes ≥ 133).

| Dataset | Teff gene | mean bin | sd bin | matched-pool size | expansion |
|---|---|---|---|---|---|
| IMmotion150 | CD8A | 9 | 5 | 293 | 0 |
| IMmotion150 | EOMES | 8 | 6 | 512 | 0 |
| IMmotion150 | PRF1 | 8 | 5 | 760 | 0 |
| IMmotion150 | IFNG | 6 | 10 | 2,221 | 0 |
| IMmotion150 | CD274 | 8 | 5 | 760 | 0 |
| JAVELIN | CD8A | 7 | 10 | 213 | 0 |
| JAVELIN | EOMES | 6 | 10 | 309 | 0 |
| JAVELIN | PRF1 | 8 | 9 | 133 | 0 |
| JAVELIN | IFNG | 4 | 10 | 697 | 0 |
| JAVELIN | CD274 | 5 | 9 | 465 | 0 |

## 6. Score construction

For each random five-gene set: gene-wise z-score across the locked analysis samples, then mean of the five z-scores per sample; that score is then standardised within the model frame (score_z) — identical mechanics to the locked primary T-eff5 score.

No training or optimization performed.

## 7. Random-set generation

| Dataset | R_requested | R_valid | R_invalid | Fail reasons |
|---|---|---|---|---|
| IMmotion150 | 10,000 | 9,999 | 1 | COXPH_FAIL on 1 set (rank-deficient) |
| JAVELIN | 10,000 | 10,000 | 0 | — |

## 8. Summary metrics

| Metric | IMmotion150 | JAVELIN |
|---|---|---|
| Locked observed Teff5 HR_int | 0.5215 | 0.7767 |
| Locked observed Teff5 p (Wald) | 0.00125 | 0.05357 |
| Matched random HR_int median (IQR) | 0.909 (0.783–1.054) | 1.190 (1.065–1.318) |
| Matched random HR_int range | 0.433–2.282 | 0.672–1.909 |
| Matched random p median (IQR) | 0.406 (0.164–0.697) | 0.097 (0.011–0.402) |
| Matched random p range | 2.5e-05 – 0.9999 | 6.2e-09 – 0.9995 |
| Frac random HR_int ≤ observed | **0.0049** | **0.0033** |
| Frac random p ≤ observed | **0.0044** | 0.4183 |
| Percentile observed HR by extremity (lower tail) | 99.5 % | 99.7 % |
| Percentile observed p by extremity (lower tail) | 99.6 % | 58.2 % |

In IMmotion150, the locked Teff5 HR_int and p both sit in the lower 0.5 % of the matched random null. In JAVELIN, the HR_int direction is even more extreme than in IMmotion150 (lower 0.33 %); however, because the absolute JAVELIN Teff5 p ≈ 0.054 is only borderline, random sets that happen to produce a large effect in either direction frequently achieve a smaller p — hence ~42 % of matched random sets have p ≤ 0.054. This reflects, correctly, that JAVELIN supports T-eff5 through **directional consistency**, not through a smaller raw p than expected by chance.

## 9. Per-protocol Q&A

1. **Which datasets had full expression matrices available?**
   IMmotion150 (full cBioPortal TPM matrix) and JAVELIN Renal 101 (Supplementary Table S13 extracted from MOESM3.xlsx).
2. **Did the matched random-gene benchmark run for IMmotion150?** Yes, R = 10,000 (9,999 valid).
3. **Did it run for JAVELIN?** Yes, R = 10,000 (10,000 valid).
4. **Did matched benchmarks support or weaken the original random-gene negative-control claim?** They **strengthen** it. The observed Teff5 HR_int direction is in the lower 0.5 % of expression-and-variance-matched random five-gene sets in IMmotion150 and in the lower 0.33 % in JAVELIN.
5. **Did V18H change the primary biomarker?** NO.
6. **Did V18H change primary endpoint / contrast / model?** NO.
7. **Did V18H change any locked numerical result?** NO. Observed HR_int/p values are the locked ones from `output/10_core_pairwise_interactions.csv` and `output_v6_gate15/05_javelin_primary_cox_lock.csv`.
8. **Does manuscript require wording changes?** Optional. A three-sentence patch (Methods, Results/Supplement, Limitations) is proposed in `08_manuscript_wording_patch_suggestions.md`.

## 10. Decision

**V18H_DECISION = STRONG_SUPPORT**

Rationale: Full expression available for both datasets; observed Teff5 remains in an extreme tail (≤ 0.5 %) of matched random five-gene sets in the IMmotion150 discovery cohort, and is directionally supportive in JAVELIN (lower 0.33 % by interaction-HR direction). The HR-direction tail behaviour in JAVELIN is even stronger than in IMmotion150; the p-value comparator there is mid-rank because the locked Teff5 p ≈ 0.054 is itself borderline. This is recorded transparently and incorporated into the limitations wording.

## 11. Terminal summary fields

```
V18H_DECISION = STRONG_SUPPORT
IM150_MATCHED_NEGCTRL = PASS
JAVELIN_MATCHED_NEGCTRL = PASS
PRIMARY_ANALYSIS_CHANGED = NO
NUMERICAL_RESULTS_CHANGED = NO
NEW_BIOMARKER_INTRODUCED = NO
OUTPUT_ZIP = immotion150_v18h_matched_negative_control_outputs_for_chatgpt.zip
```

## 12. Files

- `01_expression_scale_and_gene_pool_qc.csv`
- `02_matched_pool_qc.csv`
- `03_random_set_generation_summary.csv`
- `04_immotion150_matched_negative_control.csv`
- `05_javelin_matched_negative_control.csv`
- `06_matched_negative_control_summary.csv`
- `07_matched_negative_control_summary.md`
- `08_manuscript_wording_patch_suggestions.md`
- `09_V18H_MATCHED_NEGATIVE_CONTROL_REPORT.md`  (this file)
- `figures_v18h/v18h_random_HR_int_IMmotion150.png`
- `figures_v18h/v18h_random_HR_int_JAVELIN.png`
- `scripts/00_extract_javelin_s13.py`, `01_inspect_inputs.R`, `02_inspect_im150_more.R`, `10_v18h_matched_negative_control.R`
- `logs_v18h/00_extract_javelin_s13.log`, `10_main.log`
