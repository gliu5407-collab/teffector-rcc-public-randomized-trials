# V9 Reviewer Attack-Response Table

**Public-archive scope note (V21F):** Historical/private workspace references in this document are provenance notes from manuscript development. They are not claims that those private workspace files, one-command scripts, raw source datasets, or full locked-pipeline directories are included in this public GitHub/Zenodo archive. The current public archive scope is defined by `README.md`, `DATA_AVAILABILITY.md`, `CODE_AVAILABILITY.md`, and `docs/13_REPRODUCIBILITY_MANIFEST.md`.


Each entry has the likely reviewer criticism, our response, the locked source file supporting the response, and what we must NOT say.

---

### 1. Why these 5 genes?
**Response:** The frozen Teff5 = {CD8A, EOMES, PRF1, IFNG, CD274} is a small CD8/T-effector composite chosen *a priori* and frozen prior to validation. It is biologically minimal (cytotoxic effectors EOMES/PRF1, the canonical CD8 marker, IFN-γ, and PD-L1 as the licensed checkpoint ligand), and it correlates strongly with prior published immune signatures (MCDERMOTT_TEFF, Merck18, Bindea CD8) in construct-validity analyses on JAVELIN and CheckMate.
**Source:** output_v7/07_construct_validity_summary.md; output_v9/manuscript_framework/06_SAP_v1_0_LOCKED.md.
**Do NOT say:** the genes were optimized after seeing the results, or that GZMA replaced CD274.

### 2. Is this post hoc?
**Response:** The gene list, statistical model (Cox `PFS ~ trt + Teff_z + trt:Teff_z`), endpoint (PFS), and contrast (IO-combo vs Sunitinib) are pre-locked in the SAP. Any deviation is recorded as an SAP amendment. JAVELIN was analyzed only after the IMmotion150 V5.5 frozen lock.
**Source:** output_v9/manuscript_framework/06_SAP_v1_0_LOCKED.md; output/45_v55_frozen_primary_analysis_table.md.
**Do NOT say:** "we tried multiple gene lists." We did not.

### 3. Why no KEYNOTE-426 validation?
**Response:** Patient-level Teff5+outcome reconstruction from KEYNOTE-426 is not feasible from public data. We therefore do not cite KEYNOTE-426 as direct validation; we reference it as literature context for the IO+TKI vs Sunitinib regimen class and explicitly state this boundary.
**Source:** output_v9/04_literature_triangulation_summary.md; output_v9/03_endpoint_harmonization_table.md.
**Do NOT say:** KEYNOTE-426 directly validates Teff5.

### 4. JAVELIN p = 0.0536 is not significant.
**Response:** We agree, and we explicitly state this throughout. JAVELIN's Cox interaction Wald p = 0.0536 is reported as **directionally consistent external support**, not statistically significant validation. The 24-month PFS RMST in Teff-high JAVELIN patients is +3.83 months (95% CI 1.64–5.90), which is an absolute-benefit signal supporting directional consistency without overclaiming.
**Source:** output_v9/manuscript_framework/07_MASTER_RESULTS_TABLE_LOCKED.md (R5, R6); output_v9/manuscript_framework/09_FORBIDDEN_CLAIMS_LOCKED.md (item 1).
**Do NOT say:** p = 0.0536 is functionally significant.

### 5. CheckMate does not support.
**Response:** CheckMate-025 is contextual only because the regimen (Nivolumab vs Everolimus) and line of therapy (post-VEGFi) are not comparable to front-line IO+TKI vs Sunitinib. We report CheckMate transparently: OS Cox HR_int = 1.245 (not supportive), PFS Cox HR_int = 0.964 (near null), OS RMST τ=24 Teff-high NIVO−EVERO = +2.45 mo (CI crosses 0). CheckMate is excluded from the primary comparable meta.
**Source:** output_v6_gate15/18_cross_trial_synthesis_lock.md; output_v6_gate15/14_checkmate_os_pfs_cox_lock.csv; output_v9/04_literature_triangulation_summary.md.
**Do NOT say:** CheckMate validated the biomarker, or hide the OS Cox HR>1 result.

### 6. PFS not OS.
**Response:** PFS is the locked primary endpoint of this biomarker analysis, consistent with the original IMmotion150 primary endpoint reading and the JAVELIN biomarker reading. OS is reported contextually in CheckMate only and is not the primary endpoint here. Crossover in front-line ccRCC complicates OS biomarker readings; we note this transparently.
**Source:** output_v9/manuscript_framework/06_SAP_v1_0_LOCKED.md §9.
**Do NOT say:** OS is not relevant; or that we will switch to OS if asked.

### 7. Sunitinib is less clinically central today.
**Response:** All three relevant trials (IMmotion150, JAVELIN, KEYNOTE-426, CLEAR, CheckMate 9ER) used Sunitinib as the comparator in the regulatory primary analyses; the analytic question of whether T-effector biology predicts greater IO+TKI vs Sunitinib benefit remains scientifically informative. We do not claim Sunitinib is current first-line standard; we report what the available randomized public data support.
**Source:** output_v9/manuscript_framework/06_SAP_v1_0_LOCKED.md §2–3.
**Do NOT say:** the conclusion immediately generalizes to other IO+TKI vs Sunitinib regimens.

### 8. Biomarker-evaluable subset bias.
**Response:** JAVELIN biomarker-evaluable (n=726) vs non-evaluable (n=160) subsets are balanced on treatment-arm, PFS-time, age, sex; PFS event proportion shows a modest imbalance (SMD +0.18); PDL1 shows an imbalance (SMD +0.42), explained largely by PDL1 missingness in 46% of non-evaluable patients. IMmotion150 full-ITT comparison is not feasible from public data; reported as a limitation. CheckMate biomarker-evaluable vs non-evaluable subsets in CM-025 are well balanced (SMDs <0.10).
**Source:** output_v9/02_biomarker_evaluable_subset_audit.md.
**Do NOT say:** there is no possible selection bias.

### 9. Multiple testing.
**Response:** A single locked Cox interaction on a single locked endpoint with a single locked biomarker in IMmotion150 is the primary test. All other tests (construct validity, RMST sensitivity, multiverse, Bayesian, existing-signature benchmark) are explicitly secondary/exploratory. The random 5-gene 10,000-iteration negative control directly addresses the family-wise concern that "any random 5-gene set would have produced a similarly small p" — only 18/10,000 random signatures do.
**Source:** output/43_v55_negative_control_summary.csv; output_v9/manuscript_framework/06_SAP_v1_0_LOCKED.md §13.
**Do NOT say:** multiple testing is irrelevant.

### 10. Endpoint harmonization.
**Response:** Endpoint definitions are locked (output_v9/03_endpoint_harmonization_table.md). IMmotion150 uses V5.5 frozen mapping. JAVELIN uses event = 1 − PFS_P_CNSR. CheckMate uses event = CNSR (Braun convention; empirically validated in Gate1.5). The harmonization is documented and identical across all V9 outputs.
**Source:** output_v9/03_endpoint_harmonization_table.md; output_v6_gate15/12_checkmate_event_coding_lock.csv.

### 11. Assay differences across trials.
**Response:** IMmotion150 RNAseq is processed to log2-TPM; JAVELIN supplement provides log2-TPM; CheckMate (Braun) provides expression on its own normalized scale. The Teff5 pipeline applies the *same* within-cohort per-gene z-score → mean → cohort-z transformation in each trial, removing scale differences. Construct validity (rho up to 0.94 with MCDERMOTT_TEFF; rho ~0.80 with HALLMARK_INTERFERON_GAMMA_RESPONSE in CheckMate) confirms biological invariance.
**Source:** output_v7/04b_teff5_scale_audit.csv; output_v7/07_construct_validity_summary.md.

### 12. Is T-eff prognostic only?
**Response:** No. Within-arm decomposition shows essentially no Teff5 effect in the Sunitinib arm (IMmotion150 HR per SD 1.233, p=0.16; JAVELIN HR per SD 1.035, p=0.69) and HR<1 in the IO-combo arm (IMmotion150 HR per SD 0.654, p=0.0019; JAVELIN HR per SD 0.799, p=0.025). This is the signature of a treatment-modifying (predictive) marker, not a pure prognostic gradient.
**Source:** output_v7/10_predictive_vs_prognostic_summary.md (R14).

### 13. Is this overfitted?
**Response:** The Teff5 gene list and statistical model are frozen prior to JAVELIN/CheckMate analysis. The IMmotion150 primary HR_int = 0.521 was locked in V5.5. The JAVELIN result was generated by applying the *same* frozen pipeline. The 10,000-iteration random 5-gene negative control bounds the false-positive rate empirically (specificity p = 0.0019 in IMmotion150).
**Source:** output/45_v55_frozen_primary_analysis_table.md; output/43_v55_negative_control_summary.csv.

### 14. Why not machine learning?
**Response:** A 5-gene composite has a transparent biological interpretation and harmonizes across heterogeneous RNAseq platforms more reliably than a high-parameter ML model trained on one trial. Hot-trained ML on IMmotion150 alone would risk severe overfit at this sample size, and ML models do not survive across-platform deployment without re-tuning. We deliberately avoided LASSO, XGBoost, SHAP, random forest, deep learning, and causal forests as primary evidence.
**Source:** output_v9/manuscript_framework/06_SAP_v1_0_LOCKED.md §18.

### 15. Why exclude GZMA?
**Response:** Including GZMA would constitute a post-hoc gene-list change. The frozen list is CD8A, EOMES, PRF1, IFNG, CD274. GZMA is biologically related (cytotoxic granule constituent) but is not in the locked signature, and we did not perform a substitution.
**Source:** output_v9/manuscript_framework/06_SAP_v1_0_LOCKED.md §4.

### 16. Why no IMmotion151?
**Response:** Patient-level Teff5+outcome reconstruction from IMmotion151 is not feasible from public data accessible here. IMmotion151 is referenced only as literature context.
**Source:** output_v9/04_literature_triangulation_summary.md.

### 17. Why no policy claim?
**Response:** This is a public secondary biomarker analysis, not a treatment-policy study. Policy value (PV) claims require prospective treatment allocation and IPCW/policy estimands, which are out of scope for V9 and are not in the SAP.
**Source:** output_v9/manuscript_framework/06_SAP_v1_0_LOCKED.md §1, §18.

### 18. Why not combine CheckMate in meta?
**Response:** CheckMate-025 is Nivolumab vs Everolimus in post-VEGFi refractory disease. This is not the same regimen class as IO+TKI vs Sunitinib in front-line and would violate comparability. Pooling would dilute the question being asked.
**Source:** output_v6_gate15/18_cross_trial_synthesis_lock.md; output_v9/04_literature_triangulation_summary.md.

### 19. Does Teff5 differ from published signatures?
**Response:** Teff5 is biologically equivalent to several published T-effector signatures (MCDERMOTT_TEFF rho=1.0 by construction in JAVELIN S16; Merck18 rho=0.94; Bindea CD8 rho=0.58). We do not claim "biomarker discovery." Among 8 immune-tagged signatures in JAVELIN, Teff5 ranks 1/8 by HR<1 strength; in IMmotion150, Teff5 is the locked primary.
**Source:** output_v7/17_existing_signature_benchmark_summary.md.

### 20. Is CD274 appropriate?
**Response:** CD274 (PD-L1 transcript) is biologically meaningful in this immune-IFN-γ axis and is mechanistically linked to checkpoint inhibition. Within the construct-validity tests, the Teff5 composite (including CD274) does not behave like a generic angiogenesis or non-immune signal: it correlates near-1.0 with published T-effector and IFN-γ scores, and uncorrelated (rho≈0) with MCDERMOTT_ANGIO. We freeze CD274; we do not swap it for GZMA.
**Source:** output_v7/07_construct_validity_summary.md; output_v9/manuscript_framework/06_SAP_v1_0_LOCKED.md §4.

### 21. Is RMST post hoc?
**Response:** 24-month RMST in Teff-high is the locked secondary clinical-magnitude readout in the SAP (§10, §12). Sensitivity to τ (12, 18 months) is reported. RMST avoids the proportional-hazards assumption and provides an interpretable months-of-PFS-benefit number, complementing Cox.
**Source:** output_v9/manuscript_framework/06_SAP_v1_0_LOCKED.md §10, §12; output/40_v55_independent_rmst.csv; output_v6_gate15/07_javelin_rmst_bootstrap_lock.csv.

### 22. Is Bayesian analysis overclaiming?
**Response:** Bayesian synthesis is reported across three priors (weakly informative, moderate skeptical, strong skeptical), anchored on both fixed-effect and random-effects pooled estimates. Pr(HR_int<1) ≈ 0.9995–0.9996 (FE) and 0.977–0.983 (RE). The wider uncertainty under the RE anchor is honestly reflected. Bayesian results are supportive evidence, not primary.
**Source:** output_v7/13_bayesian_synthesis_summary.md.

### 23. Is random-gene control sufficient?
**Response:** The 10,000-iteration random-signature negative control directly measures empirical specificity: in IMmotion150, only 18/10,000 random 5-gene signatures yielded a Cox interaction p as small or smaller than Teff5 (specificity p = 0.0019). This addresses the "any 5 genes would do" critique directly. JAVELIN's lower specificity (≈0.26) is consistent with the more attenuated JAVELIN Cox HR_int.
**Source:** output/43_v55_negative_control_summary.csv; output_v6_gate15/10_javelin_negative_control_summary.csv.

### 24. Does vibration inflate analyses?
**Response:** Vibration-of-effects is a stability check, not an additional inference. The 33 specifications are predeclared (3 score transforms × 3 model classes × variants; 2 trials; PFS only). We report all 33 results without selection. Result: 33/33 direction-supportive; no gerrymandering possible.
**Source:** output_v7/15_vibration_summary.md.

### 25. Is this clinically actionable?
**Response:** No. We explicitly do not make a clinical-readiness or treatment-guidance claim. The analysis is hypothesis-generating; prospective biomarker-stratified evaluation with analytic-validity and clinical-validity work is required before clinical use. Sample-size planning scenarios (output_v9/05_future_validation_planning_summary.md) are illustrative only.
**Source:** output_v9/manuscript_framework/09_FORBIDDEN_CLAIMS_LOCKED.md items 4–5; output_v9/05_future_validation_planning_summary.md.

### 26. Why no formal CONSORT?
**Response:** This is a secondary public-data biomarker analysis, not a CONSORT-eligible randomized trial report. We use REMARK-style biomarker-reporting principles in the supplement and SAMPL-style statistical reporting. CONSORT-style transparency is reported for the secondary analysis flow (selection, locking, falsification), without claiming formal CONSORT compliance for the original trials.
**Source:** output_v9/checklists/12_REPORTING_CHECKLIST_DRAFT.md.

### 27. Are the V5.5 / Gate1.5 / V7 results reproducible?
**Response:** Yes; the locked input manifest (output_v9/01_locked_input_manifest.csv) lists every locked file with SHA-256 fingerprints, and the reproducibility manifest (output_v9/13_REPRODUCIBILITY_MANIFEST.md and .csv) lists scripts and software versions. A one-command script (run_reproduce_locked_results.sh) re-runs the locked pipeline only and does not re-search biomarkers.
**Source:** output_v9/01_locked_input_manifest.csv; output_v9/13_REPRODUCIBILITY_MANIFEST.md.

### 28. Why is the JAVELIN PD-L1 imbalance not contaminating?
**Response:** PD-L1 is the JAVELIN-specific enrichment marker, not the Teff5 biomarker. The PD-L1 differential (SMD +0.42) between biomarker-evaluable and non-evaluable JAVELIN patients is driven by PD-L1 missingness in 46% of non-evaluable patients (no tissue sample). The Teff5 analysis adjusts for treatment arm and is conducted on the RNA-evaluable cohort; PD-L1 is not a covariate in the primary model.
**Source:** output_v9/02_biomarker_evaluable_subset_audit.md.

### 29. Why include Bayesian RE if heterogeneity I²=63.7%?
**Response:** Precisely because heterogeneity is non-trivial in a two-trial pool. The RE Bayesian Pr(HR_int<1) ≈ 0.977–0.983 reflects this heterogeneity honestly. We present both FE and RE rather than choosing one to look better.
**Source:** output_v7/13_bayesian_synthesis_summary.md.

### 30. Could the JAVELIN finding be a Type-II error or Type-I error?
**Response:** Both are possible and we say so. JAVELIN Cox interaction Wald p = 0.0536 has a 95% CI that crosses 1 (upper bound 1.004). The wider context — IMmotion150 HR_int = 0.521 (p < 0.001) with a 10,000-random-gene specificity p = 0.0019, the pooled FE HR_int = 0.690 (p < 0.001), and the +3.83-month 24-month RMST in JAVELIN Teff-high — provides directional consistency without resolving the JAVELIN Cox-significance question alone. We do not promote JAVELIN to significance.
**Source:** output_v9/manuscript_framework/07_MASTER_RESULTS_TABLE_LOCKED.md (R5, R6, R8); output_v9/manuscript_framework/09_FORBIDDEN_CLAIMS_LOCKED.md item 1.

Source: output_v9/manuscript_framework/07_MASTER_RESULTS_TABLE_LOCKED.md; output_v9/manuscript_framework/06_SAP_v1_0_LOCKED.md.
