# V9 Master Results Table — LOCKED

This is the single authoritative results table for manuscript drafting. Every numeric claim in the manuscript must map to a row here, and the `source_file` column is the locked file that produced the value. No re-running. No new biomarker. No machine-learning model added later.

## Locked rows

| # | Role | Dataset | Endpoint | Contrast | Estimate type | Estimate | 95% CI | p | n | events | Source |
|---|---|---|---|---|---|---|---|---|---|---|---|
| R1 | Primary discovery — Cox interaction | IMmotion150 (V5.5) | PFS | AtezoBev vs Sunitinib | HR_int | **0.521** | 0.351–0.774 | **0.001249** | 177 | 113 | output/39_v55_independent_primary_cox.csv |
| R2 | Primary discovery — RMST τ=24 in Teff-high | IMmotion150 (V5.5) | PFS | AtezoBev vs Sunitinib (Teff-high) | RMST diff (mo) | **+4.61** | 1.01–8.50 | — | 89 | — | output/40_v55_independent_rmst.csv |
| R3 | Permutation falsification | IMmotion150 (V5.5) | PFS | AtezoBev vs Sunitinib | Empirical p (B=5000) | 0.0012 | — | 0.0012 | 177 | 113 | output/41_v55_independent_permutation.csv |
| R4 | Random-signature negative control 10k | IMmotion150 (V5.5) | PFS | AtezoBev vs Sunitinib | Specificity emp p | **0.0019** (18/10,000) | — | 0.0019 | 177 | 113 | output/43_v55_negative_control_summary.csv |
| R5 | Primary external validation — Cox interaction | JAVELIN Renal 101 (Gate1.5) | PFS_P | Avelumab+Axitinib vs Sunitinib | HR_int | **0.777** | 0.601–1.004 | **0.0536 (NOT significant)** | 726 | 358 | output_v6_gate15/05_javelin_primary_cox_lock.csv |
| R6 | Primary external validation — RMST τ=24 in Teff-high | JAVELIN Renal 101 (Gate1.5) | PFS_P | Avelumab+Axitinib vs Sunitinib (Teff-high) | RMST diff (mo) | **+3.83** | 1.64–5.90 | bootstrap Pr(>0)=0.999 | 363 | — | output_v6_gate15/07_javelin_rmst_bootstrap_lock.csv |
| R7 | JAVELIN random-signature negative control 10k | JAVELIN Renal 101 (Gate1.5) | PFS | Avelumab+Axitinib vs Sunitinib | Specificity emp p | 0.262 | — | 0.262 | 726 | 358 | output_v6_gate15/10_javelin_negative_control_summary.csv |
| R8 | Comparable two-trial meta — fixed-effect | IMmotion150 + JAVELIN | PFS | IO-combo vs Sunitinib | Pooled HR_int (FE) | **0.690** | 0.556–0.856 | **0.000729** | 903 | 471 | output_v6_gate15/16_corrected_comparable_meta.csv |
| R9 | Comparable two-trial meta — random-effects | IMmotion150 + JAVELIN | PFS | IO-combo vs Sunitinib | Pooled HR_int (RE) | **0.655** | 0.445–0.965 | **0.0323** | 903 | 471 | output_v6_gate15/16_corrected_comparable_meta.csv |
| R10 | Bayesian synthesis — FE anchor | IMmotion150 + JAVELIN | PFS | IO-combo vs Sunitinib | Posterior Pr(HR<1) | **0.9995–0.9996** | — | — | 903 | 471 | output_v7/13_bayesian_synthesis_summary.md |
| R11 | Bayesian synthesis — RE anchor | IMmotion150 + JAVELIN | PFS | IO-combo vs Sunitinib | Posterior Pr(HR<1) | **0.9768–0.9831** | — | — | 903 | 471 | output_v7/13_bayesian_synthesis_summary.md |
| R12 | Vibration-of-effects (multiverse) | IMmotion150 + JAVELIN | PFS | IO-combo vs Sunitinib | Direction-supportive count | **33/33** | — | — | 903 | 471 | output_v7/15_vibration_summary.md |
| R13 | Construct validity | JAVELIN + CheckMate | N/A | N/A | Spearman ρ vs published immune readouts | JAVELIN: 9 markers ρ≥0.5 FDR<0.05; CheckMate: 10 markers ρ≥0.5 FDR<0.05 | — | FDR<0.05 | JAVELIN 726; CheckMate 311 | — | output_v7/07_construct_validity_summary.md |
| R14 | Predictive vs prognostic decomposition | IMmotion150 + JAVELIN | PFS | Within-arm Teff5 effect | Within-arm HR per SD | IM150 Sun=1.233, IO=0.654; JAVELIN Sun=1.035, IO=0.799 | see source | IM150 IO p=0.0019; JAVELIN IO p=0.0248 | IM150 177; JAVELIN 726 | IM150 113; JAVELIN 358 | output_v7/10_predictive_vs_prognostic_summary.md |
| R15 | Contextual cohort | CheckMate-025 (Braun) | OS and PFS | Nivolumab vs Everolimus | Cox HR_int and RMST τ=24 | OS Cox HR_int=1.245; PFS Cox HR_int=0.964; OS RMST τ=24 Teff-high NIVO−EVERO = +2.45 mo | OS Cox 0.807–1.922; PFS Cox 0.651–1.426; OS RMST τ=24 −0.54 to 5.48 | OS Cox 0.322; PFS Cox 0.853 | 250 | OS 191; PFS 222 | output_v6_gate15/14_checkmate_os_pfs_cox_lock.csv; output_v6_gate15/15_checkmate_rmst_lock.csv |

## Forbidden in the table

- **R5 (JAVELIN Cox p=0.0536) is NOT to be presented as statistically significant.** Use the wording "directionally consistent external support" in the manuscript.
- **R15 (CheckMate) is contextual only and must NOT be moved into the primary comparable meta.**
- **R14 (within-arm) is exploratory and must NOT be elevated to primary evidence.**
- No additional rows from new biomarkers, gene-list swaps, or machine-learning models may be added; this table is locked.

Source: output_v9/tables/07_MASTER_RESULTS_TABLE_LOCKED.csv.
