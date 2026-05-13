# V9 Forbidden Claims — LOCKED (drafting guide)

Use this as a writing-side checklist. Every forbidden phrasing has an allowed replacement.

---

### 1. Forbidden: "JAVELIN significantly validated the interaction."
Reason: JAVELIN Cox interaction Wald p = 0.0536; >0.05.
Allowed replacement: **"JAVELIN provided directionally consistent external support for the IMmotion150 finding; the Cox interaction did not reach statistical significance (HR_int 0.777, 95% CI 0.601–1.004, p = 0.0536), but the 24-month PFS RMST in the Teff-high subgroup was +3.83 months (95% CI 1.64–5.90) longer with Avelumab+Axitinib vs Sunitinib."**

### 2. Forbidden: "CheckMate-025 validated the biomarker."
Reason: Different regimen (Nivolumab vs Everolimus), different line of therapy (post-VEGFi refractory); mixed direction across endpoints.
Allowed replacement: **"CheckMate-025 is a contextual cohort, not direct validation. In a different regimen and treatment context, the OS Cox interaction did not support the hypothesis (HR_int 1.245, p = 0.32), while the PFS Cox interaction was near null (HR_int 0.964, p = 0.85) and the OS RMST τ=24 difference in the Teff-high subgroup was +2.45 months with a CI crossing zero. CheckMate is reported for transparency, not as validation."**

### 3. Forbidden: "Teff5 is a newly discovered biomarker."
Reason: The 5-gene T-effector concept has prior literature lineage; published immune signatures (MCDERMOTT_TEFF, Merck18, Bindea CD8, ImmuneNet) correlate strongly with Teff5.
Allowed replacement: **"A frozen 5-gene T-effector signature, conceptually consistent with prior published immune signatures, modifies the AtezoBev vs Sunitinib PFS benefit in IMmotion150."**

### 4. Forbidden: "Teff5 is clinically ready / a clinical biomarker."
Reason: This is a public secondary biomarker analysis; no analytic-validity, clinical-validity, or clinical-utility study has been done.
Allowed replacement: **"Teff5 is a research signature suitable for hypothesis generation and prospective evaluation; clinical-assay validation and prospective confirmatory testing are required before clinical use."**

### 5. Forbidden: "Teff5 directly guides therapy."
Reason: No prospective treatment-allocation trial has been performed; no decision rule is approved.
Allowed replacement: **"Teff5 may serve as a hypothesis-generating candidate for future prospective biomarker-stratified trials of IO+TKI vs anti-VEGF in clear-cell RCC."**

### 6. Forbidden: "Policy value is proven."
Reason: Out of scope; no policy-value or treatment-policy analysis is included as primary evidence in V9.
Allowed replacement: **(omit; do not introduce a policy-value claim)**.

### 7. Forbidden: "GZMA replaces CD274 in the primary signature."
Reason: Gene list is locked to CD8A, EOMES, PRF1, IFNG, CD274.
Allowed replacement: **"The primary biomarker is the frozen five-gene signature CD8A, EOMES, PRF1, IFNG, CD274; no gene substitution was performed."**

### 8. Forbidden: "KEYNOTE-426 / CLEAR / CheckMate 9ER directly validated Teff5."
Reason: No public patient-level Teff5+outcome data; reconstruction is not possible.
Allowed replacement: **"KEYNOTE-426, CLEAR, and CheckMate 9ER are referenced only as literature context for the IO+TKI vs Sunitinib regimen class; their patient-level Teff5+outcome data are not publicly available and were not analyzed."**

### 9. Forbidden: "The Teff5 score is 90+ / 95+ / definitive."
Reason: Current internal evidence score is 88–89/100; V9 strengthens manuscript quality but does not generate new external validation evidence.
Allowed replacement: **"The evidence supports the predictive role of Teff5 in IMmotion150 with directionally consistent external support from JAVELIN; further prospective validation remains necessary."**

### 10. Forbidden: "We trained a machine-learning model (LASSO/XGBoost/SHAP/random forest/causal forest/deep learning) for the primary biomarker."
Reason: No ML model is part of primary evidence; primary biomarker is the frozen Teff5.
Allowed replacement: **(omit; do not introduce ML as primary)**.

### 11. Forbidden: "We re-optimized the gene list to improve the result."
Reason: No re-optimization; the gene list is frozen.
Allowed replacement: **"The gene list was frozen prior to validation analyses; no cutoff optimization or list re-tuning was performed."**

### 12. Forbidden: "JAVELIN p = 0.0536 is functionally equivalent to p < 0.05."
Reason: It is not.
Allowed replacement: **"The JAVELIN Cox interaction Wald p was 0.0536; we therefore describe JAVELIN as directionally consistent external support rather than statistically significant validation."**

### 13. Forbidden: "CheckMate was included in the primary comparable meta."
Reason: CheckMate is contextual only; locked exclusion from primary pool.
Allowed replacement: **"The primary comparable meta-analysis includes IMmotion150 and JAVELIN only. CheckMate-025 is reported separately as contextual cohort."**

### 14. Forbidden: "Our analysis is confirmatory."
Reason: This is a secondary biomarker analysis on publicly available data.
Allowed replacement: **"Our analysis is a public secondary biomarker analysis; primary discovery is in IMmotion150 and directionally consistent external support is provided by JAVELIN."**

Source: output_v9/manuscript_framework/08_CLAIMS_LEDGER_LOCKED.md.
