# V19C Supplementary Minor Patch Report

## Decision

`V19C_DECISION = CLEAN_PASS_AFTER_MINOR_CORRECTION`

## Scope

This patch does not rerun any analysis and does not change the primary biomarker, endpoint, treatment contrasts, cutoff, locked numerical results, main manuscript, or any statistical model.

## Issue review

### 1. Table S18 filename mismatch

The V19B audit reported a Table S18 filename mismatch because it did not use the complete V19A package and instead combined older V19 supplementary files with V19A DOCX files. In the actual V19A package reviewed here, the Supplementary Appendix and CSV file are already synchronized:

- Appendix-referenced filename: `Table_S18_reproducibility_materials_and_source_data_availability_notes.csv`
- Actual CSV filename in `supplementary_tables/`: `Table_S18_reproducibility_materials_and_source_data_availability_notes.csv`

Therefore, no Table S18 filename change was required.

### 2. Matched random-gene seed value

The V19B audit correctly identified that the literal seed value `20260513` was missing from Supplementary Appendix v1.3 Section 7. This patch restored the seed value in the matched random-gene benchmark methods.

The corrected wording now states:

> The random-number seed was fixed at 20260513.

## Files created

- `supplementary/IMmotion150_JAVELIN_Supplementary_Appendix_v1_4_V19C_SEED_LOCK_CLEAN.md`
- `supplementary/IMmotion150_JAVELIN_Supplementary_Appendix_v1_4_V19C_SEED_LOCK_CLEAN.docx`
- `output_v19c/V19C_SUPPLEMENTARY_MINOR_PATCH_REPORT.md`
- `output_v19c/V19C_STATUS.csv`

## Final status

- Primary analysis changed: NO
- Numerical results changed: NO
- Biomarker changed: NO
- Endpoint changed: NO
- Cutoff changed: NO
- Main manuscript changed: NO
- Supplementary Appendix seed restored: YES
- Table S18 filename synchronized in actual V19A package: YES
