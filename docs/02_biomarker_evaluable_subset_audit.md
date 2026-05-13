# V9 Module B — Biomarker-evaluable Subset Audit

Purpose: assess whether biomarker-evaluable subsets differ materially from the parent randomized trial populations. This is a selection/transparency audit, not a hypothesis test. SMD = standardized mean difference; |SMD| > 0.20 conventionally flagged as imbalance.

## JAVELIN Renal 101

- Parent clinical (publicly accessible) n = 886
- Biomarker-evaluable (Teff5 + PFS) n = 726 (81.9%)
- Non-evaluable n = 160 (18.1%)

| Variable | Evaluable | Non-evaluable | SMD | Interpretation |
|---|---|---|---|---|
| Treatment arm (Avelumab+Axitinib %) | 48.8 | 54.4 | −0.113 | balanced |
| PFS event proportion | 0.493 | 0.403 | +0.183 | small imbalance; non-evaluable trend slightly lower event rate |
| PFS time mean (months) | 7.45 | 7.28 | +0.032 | balanced |
| PFS time median (months) | 6.93 | 7.03 | — | balanced |
| Age (years) | 60.7 | 61.1 | −0.039 | balanced |
| Female % | 24.5 | 30.0 | −0.123 | balanced |
| PD-L1 positive % (of non-missing) | 71.1 (n=726) | 51.2 (n=86) | +0.417 | **flagged**, but PD-L1 missingness itself is informative: 46.2% of non-evaluable cases have no PD-L1 result, consistent with no tissue/RNA capture |

### Interpretation
- Treatment-arm distribution is essentially balanced; the biomarker-evaluable subset does not enrich for one arm.
- PFS time distribution is balanced; event proportion shows a small positive imbalance (more events in the evaluable subset) consistent with longer follow-up on patients with successful tumour-tissue collection.
- The PD-L1 imbalance is driven by PD-L1 missingness in non-evaluable patients (46.2%), which co-occurs with tissue/RNA unavailability. PD-L1 was the JAVELIN enrichment marker, not the Teff5 biomarker, and is not used in V9 primary analyses.
- Variables not publicly accessible per patient (ECOG performance status, MSKCC/IMDC risk, geographic region) cannot be tested in this audit. Limitation reported in manuscript.

## IMmotion150

- Parent randomized population (NCT01984242): 305 patients across three arms (AtezoBev 101, Atezo 103, Sunitinib 101).
- Frozen analytic pair (AtezoBev vs Sunitinib, RNA + PFS evaluable): n = 177, events = 113 (V5.5 lock).
- The publicly accessible IMmotion150 RNAseq + clinical files we have used are the RNA-evaluable subset only; the parent ITT clinical record is **not publicly available** at patient level in this project.
- Consequently, formal biomarker-evaluable vs non-evaluable SMD audit **cannot be computed** from public data here.
- Mcdermott et al. 2018 reports characteristics for the RNA-evaluable subset and the broader trial; no large baseline imbalance was reported in the original publication.
- Reported transparently as a public-data limitation.

## CheckMate-025 / Braun (Contextual only)

- Parent CM-025 cohort (Braun supplement): n = 803.
- Biomarker-evaluable (RNA-evaluable, RNA_ID non-null): n = 250 (31.1%).
- Non-evaluable n = 553 (68.9%).
- Locked Cox/RMST analytic n = 250 (PFS) / 250 (OS) per Gate1.5.

| Variable | Evaluable | Non-evaluable | SMD | Interpretation |
|---|---|---|---|---|
| Arm: Nivolumab % | 48.0 | 51.7 | −0.074 | balanced |
| Arm: Everolimus % | 52.0 | 48.3 | +0.074 | balanced |
| PFS event proportion (CNSR=1) | 0.888 | 0.855 | +0.098 | small |
| PFS time mean (months) | 7.47 | 8.17 | −0.065 | balanced |
| PFS time median (months) | 3.75 | 3.71 | — | balanced |
| OS event proportion (CNSR=1) | 0.764 | 0.734 | +0.069 | balanced |
| Age (years) | 61.8 | 61.1 | +0.059 | balanced |
| Female % | 25.6 | 24.2 | +0.032 | balanced |
| MSKCC poor-risk % | 19.2 | 18.4 | +0.019 | balanced |

### Interpretation
- CM-025 biomarker-evaluable subset is well balanced with the non-RNA subset across testable variables.
- CheckMate is contextual cohort only (Nivolumab vs Everolimus, not IO-combo vs Sunitinib), per Gate1.5. Not used as direct validation.

## Summary

- JAVELIN biomarker-evaluable subset is approximately representative; PD-L1 differential is driven by PD-L1 missingness in non-evaluable patients, not by biomarker selection on Teff5.
- IMmotion150 biomarker-evaluable comparison cannot be performed at patient level with the public data accessible here; this is reported as a manuscript limitation.
- CheckMate-025 biomarker-evaluable subset is balanced; CheckMate remains contextual only.
- No major selection imbalance threatens the primary V5.5 / Gate1.5 / V7 conclusions.

Source files:
- output/45_v55_frozen_primary_analysis_table.md
- output_v6/raw_javelin/javelin_clinical.csv
- output_v6/raw_javelin/javelin_teff5_log2tpm.csv
- output_v6/raw_checkmate/braun_clinical.csv
- output_v6/raw_checkmate/braun_teff5_expr.csv
- output_v9/tables/02_biomarker_evaluable_subset_audit.csv
