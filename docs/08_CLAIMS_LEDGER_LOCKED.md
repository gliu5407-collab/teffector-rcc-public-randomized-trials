# V9 Claims Ledger — LOCKED

Every claim that can appear in the manuscript falls into one of four buckets. Anything else is forbidden.

---

## A. Main claims (allowed)

| # | Claim | Source (Master Results Table) |
|---|---|---|
| A1 | The frozen 5-gene T-effector signature (CD8A, EOMES, PRF1, IFNG, CD274) significantly modified the AtezoBev vs Sunitinib PFS benefit in IMmotion150 (HR_int = 0.521; 95% CI 0.351–0.774; Wald p = 0.001249). | R1, R2, R3, R4 |
| A2 | In Teff-high IMmotion150 patients, 24-month PFS RMST was approximately 4.6 months longer with AtezoBev vs Sunitinib (95% CI 1.0–8.5). | R2 |
| A3 | JAVELIN Renal 101 provided directionally consistent external support: Cox interaction HR_int = 0.777 (95% CI 0.601–1.004; Wald p = 0.0536, **NOT** statistically significant), with a positive 24-month RMST absolute-benefit signal of +3.83 months (95% CI 1.64–5.90) in the Teff-high subgroup. | R5, R6 |
| A4 | The IMmotion150 + JAVELIN comparable two-trial PFS synthesis supports a pooled interaction HR < 1 (fixed-effect 0.690, 95% CI 0.556–0.856, p<0.001; random-effects 0.655, 95% CI 0.445–0.965, p=0.032). | R8, R9 |

## B. Supportive claims (allowed)

| # | Claim | Source |
|---|---|---|
| B1 | The frozen Teff5 has construct validity: it correlates with published CD8/T-cell/IFN-γ readouts in trials it was never tuned on, and is independent of an angiogenesis (anti-CD8) reference. | R13 |
| B2 | Teff5 is treatment-modifying (predictive), not purely prognostic: within-arm decomposition shows essentially no effect in the Sunitinib arm and HR<1 in the immune-combo arm in both IMmotion150 and JAVELIN. | R14 |
| B3 | The result is robust to a predeclared multiverse of 33 reasonable specifications (Cox 15/15 HR<1; RMST 18/18 diff>0). | R12 |
| B4 | Bayesian synthesis with weakly informative, moderate, and strong skeptical priors gives posterior Pr(HR_int<1) ≈ 0.9995–0.9996 anchored on the fixed-effect estimate, and 0.977–0.983 anchored on the random-effects estimate. | R10, R11 |
| B5 | Among published immune signatures evaluated head-to-head, frozen Teff5 ranks first by HR<1 strength in JAVELIN (8/8 immune-tagged signatures point in the same direction), and remains primary in IMmotion150. | R7 (existing-signature benchmark, V7 Module F) |
| B6 | Random-signature negative controls and treatment-permutation falsifications support specificity in IMmotion150 (specificity empirical p = 0.0019). | R3, R4 |

## C. Supplement-only claims

| # | Claim | Source |
|---|---|---|
| C1 | CheckMate-025 (Braun) provides contextual triangulation in a different regimen (Nivolumab vs Everolimus, post-VEGFi). OS RMST direction is supportive (+2.45 mo, CI crosses 0); OS Cox direction is not supportive (HR_int=1.245). | R15 |
| C2 | Future-validation sample-size planning is reported as a hypothesis-generating illustration only. | output_v9/05_future_validation_planning_summary.md |
| C3 | JAVELIN biomarker-evaluable subset is approximately representative; PDL1 differential reflects PDL1 missingness in non-evaluable patients. | output_v9/02_biomarker_evaluable_subset_audit.md |

## D. Forbidden claims

| # | Claim | Why forbidden |
|---|---|---|
| D1 | "JAVELIN significantly validated the Cox interaction." | JAVELIN Cox Wald p = 0.0536 > 0.05. |
| D2 | "CheckMate validated the biomarker." | Different regimen, different line of therapy; mixed direction across Cox/RMST endpoints. |
| D3 | "Teff5 is a newly discovered biomarker." | Teff5 is the frozen primary biomarker; existing immune signatures from prior literature (Bindea, ImmuneNet, MCDERMOTT_TEFF, Merck18) are correlated and biologically equivalent in the construct-validity tests. |
| D4 | "Teff5 is clinically ready." | This is a public secondary biomarker analysis, not a clinical-assay validation. |
| D5 | "Teff5 directly guides therapy." | We do not provide treatment-allocation guidance; no prospective trial. |
| D6 | "Policy value is proven." | Out of scope; no policy-value claim is made in V9. |
| D7 | "GZMA version is primary." | The primary biomarker is CD8A, EOMES, PRF1, IFNG, CD274. CD274 is not replaced by GZMA. |
| D8 | "KEYNOTE-426 / CLEAR / CheckMate 9ER directly validated Teff5." | No public patient-level Teff5+outcome data; cannot be reconstructed; literature context only. |
| D9 | "The project is 90+ / 95+ score." | Current internal scoring is 88–89/100. V9 hardens manuscript quality but does not change the external evidence base. |
| D10 | "We trained a model to predict response." | No LASSO, XGBoost, random forest, deep learning, SHAP, or causal-forest model is in primary evidence. |
| D11 | "We changed CD274 to GZMA after seeing the results." | The gene list is locked; no swap. |
| D12 | "Replication failure: CheckMate refutes the signature." | CheckMate is contextual, not direct validation; the claim must be balanced and explicit. |

Source: output_v9/tables/07_MASTER_RESULTS_TABLE_LOCKED.csv; output_v7/18_claims_ledger_v7.md (predecessor).
