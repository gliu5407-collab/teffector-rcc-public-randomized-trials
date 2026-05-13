# V19A Supplementary Consistency Patch Report

## Decision

V19A_DECISION = SUPPLEMENTARY_CONSISTENCY_PATCH_PASS

Primary analysis changed: NO.
Numerical results changed: NO.
Biomarker changed: NO.
Endpoint changed: NO.
Cutoff changed: NO.
Formal figures created: NO.

## Issues addressed

1. Main manuscript and Supplementary Appendix table numbering were inconsistent. The manuscript Supplementary Table list was replaced with the V19A Supplementary Appendix sequence S1-S18.
2. Supplementary Figure lists were inconsistent. The Supplementary Appendix now lists S1-S11 to match the manuscript figure blueprint; no publication-quality figures were created.
3. Table S18 was renamed from Future validation and reproducibility notes to Reproducibility materials and source-data availability notes. Future validation scenarios remain in the Discussion and are not treated as a formal supplementary results table.
4. Matched random-gene benchmark methods were expanded to describe the gene universe, exclusion of T-effector genes, low/missing expression handling, within-set sampling without replacement, reuse across iterations, sparse-bin fallback, valid retained sets, seed, and HR/P-value extremity criteria.
5. Construct-validity wording was revised to distinguish tissue-level orthogonal CD8 IHC context from RNA-based deconvolution as complementary computational immune-context support.
6. Supplementary tables remain separate CSV files; an index and file-presence audit were created.
7. Table S4 biomarker-evaluable subset audit was expanded with parent population rows.
8. Table S17 forbidden-claims summary was expanded to include key reviewer-risk phrases and safe alternatives.

## Residual notes

- IMmotion150 matched random benchmark retained 9,999 valid sets after one Cox-model failure among 10,000 requested draws; JAVELIN retained 10,000 valid sets.
- The matched random-gene benchmark remains a sensitivity/negative-control analysis, not formal multiple-testing correction and not independent validation.
- Formal figure production remains deferred.
