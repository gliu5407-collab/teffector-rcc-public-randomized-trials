# IMmotion150 Teff5 Manuscript — Statistical Analysis Plan v1.0 (LOCKED)

Version: v1.0
Lock date: 2026-05-12
Status: LOCKED

This SAP freezes the analytic decisions for the manuscript. No reviewer-driven change to a primary analytic choice will be made after this date without an amendment recorded in section 20.

---

## 1. Study objective

Determine, using public patient-level data, whether the frozen 5-gene T-effector signature **IM150_Teff_5gene = {CD8A, EOMES, PRF1, IFNG, CD274}** modifies the treatment effect of immune-combination therapy versus Sunitinib on progression-free survival in metastatic clear-cell renal cell carcinoma, and to characterize the strength and limits of that signal across discovery, external validation, and contextual cohorts.

This is a **public secondary biomarker analysis**, not a confirmatory clinical trial, not a clinical-assay validation, and not a treatment recommendation.

## 2. Primary discovery analysis

- Trial: IMmotion150 (NCT01984242), AtezoBev vs Sunitinib arms only (pair-restricted).
- Cohort: V5.5 frozen analytic cohort, n = 177, events = 113.
- Primary model: Cox proportional hazards with continuous z-scored T-effector signature:
  - `PFS ~ trt + Teff_z + trt:Teff_z`
  - HR_int = exp(beta_int) for `trt:Teff_z`.
- Primary estimand: HR_int (treatment × biomarker interaction).
- Locked result (frozen, do not recompute): HR_int = 0.521 (95% CI 0.351–0.774), Wald p = 0.001249.

## 3. Primary external validation analysis

- Trial: JAVELIN Renal 101 (NCT02684006).
- Cohort: Gate1.5 locked, n = 726, events = 358.
- Primary model: Cox PH `PFS_P ~ trt + Teff_z + trt:Teff_z`. event = 1 − PFS_P_CNSR.
- Locked result (frozen, do not recompute): HR_int = 0.777 (95% CI 0.601–1.004), Wald p = 0.0536.
- **The JAVELIN Cox interaction is NOT statistically significant.** It is reported as **directionally consistent external support**, supported by the 24-month RMST difference in the Teff-high subgroup of +3.83 months (95% CI 1.64–5.90).

## 4. Primary biomarker definition (LOCKED)

- Genes: **CD8A, EOMES, PRF1, IFNG, CD274** (no substitution; CD274 is NOT replaced by GZMA).
- Transformation pipeline (locked): log2-TPM (or supplement-derived equivalent) → per-gene z-score within cohort → mean across the five genes → cohort-wise z-score for the signature → Teff_z.
- Primary analytic form: continuous z-scored Teff_z.
- Secondary clinical-interpretation form: Teff_high = above-median split within the analytic cohort.

## 5. Signature calculation

- Recomputed in V7 from public log2-TPM in each trial (output_v7/03_teff5_recompute_external.csv; output_v7/04_teff5_gene_coverage_v7.csv).
- 5/5 gene coverage required; no signature is computed for a sample missing any of the 5 genes.
- Identical signature definition is used across IMmotion150, JAVELIN, and CheckMate.

## 6. Discovery trial

- IMmotion150 V5.5 frozen lock (see output/45_v55_frozen_primary_analysis_table.md; output/46_v55_independent_reproduction_audit_report.md).

## 7. Validation trial

- JAVELIN Renal 101 Gate1.5 locked (output_v6_gate15/05_javelin_primary_cox_lock.csv; output_v6_gate15/19_v6_gate15_external_audit_lock_report.md).

## 8. Contextual cohort

- CheckMate-025 / Braun 2020, n = 250 (Cox / RMST primary lock cohort).
- Used for triangulation only. Excluded from primary comparable meta. Regimen Nivolumab vs Everolimus is not comparable to front-line IO+TKI vs Sunitinib.

## 9. Primary endpoint

- **Progression-free survival (PFS).** No protocol change.
- OS is reported only as a contextual triangulation in CheckMate-025; OS is not a primary endpoint of this biomarker analysis.

## 10. Secondary endpoints / analyses

- 24-month RMST difference in Teff-high subgroup (clinical-magnitude interpretation):
  - IMmotion150 frozen: +4.61 months (95% CI 1.01–8.50).
  - JAVELIN locked: +3.83 months (95% CI 1.64–5.90).
- 18-month RMST as supportive sensitivity.
- Comparable two-trial meta (IMmotion150 + JAVELIN):
  - Fixed-effect HR_int = 0.690 (95% CI 0.556–0.856), p = 0.000729.
  - Random-effects HR_int = 0.655 (95% CI 0.445–0.965), p = 0.0323.

## 11. Statistical models

- Cox PH with treatment, continuous z-scored Teff, and their interaction (primary).
- Within-arm Cox `PFS ~ Teff_z` per arm (predictive-vs-prognostic decomposition, V7 Module C).
- Cox interaction with median-split Teff_high (secondary; for RMST subgroup definition).
- Fixed-effect and random-effects (DerSimonian–Laird) two-trial meta on log(HR_int).
- Bayesian normal–normal synthesis with weakly informative N(0,1.5²), moderate skeptical N(0,0.75²), strong skeptical N(0,0.5²) priors on the pooled log(HR_int).

## 12. RMST analyses

- τ = 24 months as primary clinical readout (front-line RCC).
- τ = 12, 18 months as supportive sensitivity.
- Bootstrap 95% CI; B reported per analysis (e.g., B=2000 for JAVELIN, B=1000 for CheckMate).

## 13. Falsification tests

- Permutation test on the treatment × biomarker interaction (IMmotion150, B = 5,000; observed empirical p = 0.0012).
- Negative-control random-gene signatures (IMmotion150, R = 10,000; JAVELIN, R = 10,000; CheckMate, R = 10,000).
  - IMmotion150: 18/10,000 random 5-gene signatures ≤ observed Teff p; specificity empirical p = 0.0019.
  - **Do NOT use the older V5 4/1000 value as final evidence.**

## 14. Bayesian synthesis

- See V7 Module D (output_v7/13_bayesian_synthesis_summary.md).
- Fixed-effect Bayesian Pr(HR_int<1) ≈ 0.9995–0.9996 across three prior settings.
- Random-effects Bayesian Pr(HR_int<1) ≈ 0.9768–0.9831 across three prior settings.

## 15. Vibration-of-effects

- Predeclared multiverse grid: three score transforms (z, rank, winsorized), three Cox specs (continuous, median-split, RMST-high), three RMST cutoffs (median, tertile, quartile), two trials (IMmotion150, JAVELIN), PFS only.
- Total 33 specifications. Direction-supportive in 33/33 (Cox 15/15 HR<1; RMST 18/18 diff>0).
- CheckMate excluded from this grid (contextual only).

## 16. Existing-signature benchmarks

- Teff5 compared to existing immune signatures inside each trial without replacing it (V7 Module F).
- In JAVELIN: 8/8 immune-tagged signatures point in the same direction; Teff5 ranks 1/8.
- In IMmotion150: 22 iAtlas/Bindea signatures evaluated; Teff5 retains primary status.

## 17. Analyses explicitly exploratory

- All within-arm decompositions (predictive vs prognostic, V7 Module C).
- All existing-signature benchmarks (V7 Module F).
- All Bayesian sensitivities to prior choice.
- All RMST τ values other than 24 months.
- Future-validation sample-size planning (V9 Module E).

## 18. Analyses explicitly forbidden

The following are **not part of the SAP** and must not appear as primary evidence:
- Replacing CD274 with GZMA (or any other gene) in the primary biomarker.
- Changing the primary endpoint from PFS to OS.
- Changing the primary contrast.
- Re-running analyses to chase significance.
- Training LASSO, XGBoost, random forest, deep learning, SHAP, or causal-forest models as primary evidence (these are not in this SAP and must not be added later as primary).
- Including CheckMate in the primary comparable meta.
- Calling JAVELIN Cox p=0.0536 statistically significant.
- Citing KEYNOTE-426 / CLEAR / CheckMate 9ER as direct validation of Teff5.
- Claiming clinical implementation readiness or direct treatment guidance.

## 19. Version and date

- Version: v1.0
- Lock date: 2026-05-12
- Locked by: V9 manuscript hardening pipeline.

## 20. Amendment policy

- Any change after lock must be recorded in a SAP amendment with:
  - Date.
  - Reason.
  - Person/process making the change.
  - Whether the change affects a primary or exploratory analysis.
  - The version number is incremented (v1.1, v1.2, …).
- No amendment may convert a forbidden analysis (Section 18) into a primary analysis without revisiting the entire manuscript framework.

---

Source files referenced in this SAP are listed in output_v9/01_locked_input_manifest.csv.
