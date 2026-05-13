# V9 Module C — Endpoint Harmonization Table

Purpose: declare endpoint definitions, event coding, censoring coding, and meta-analysis inclusion for every trial referenced in the manuscript. This freezes the harmonization decisions used in V5.5, Gate1.5, V7 and V9.

## Locked rules

1. **Primary endpoint = PFS** (investigator-assessed). OS is not the primary endpoint of this biomarker analysis.
2. **JAVELIN PFS:** time = PFS_P; event = 1 − PFS_P_CNSR.
3. **IMmotion150 PFS:** V5.5 locked event mapping (output/35_v55_pfs_event_mapping_check.csv).
4. **CheckMate-025 (Braun):** CNSR = 1 means EVENT (opposite of SAS convention), empirically validated in Gate1.5 lock (output_v6_gate15/12_checkmate_event_coding_lock.csv). CheckMate is contextual only.
5. **KEYNOTE-426, CLEAR/KEYNOTE-581, CheckMate 9ER:** not patient-level analyzable from public data; literature context only, not direct validation.

## Harmonization table

| Trial | Role | Contrast | Endpoint | Time unit | Event coding | OS used? | In primary meta? | Notes |
|---|---|---|---|---|---|---|---|---|
| IMmotion150 | Primary discovery | AtezoBev vs Sunitinib | PFS | months | V5.5 frozen mapping | No | **YES** | n=177 pair, events=113 |
| JAVELIN Renal 101 | Primary external validation | Avelumab+Axitinib vs Sunitinib | PFS (PFS_P) | months | event = 1 − PFS_P_CNSR | No | **YES** | n=726, events=358; HR_int 0.777 (0.601–1.004), p=0.0536 (NOT significant) |
| CheckMate-025 / Braun | Contextual only | Nivolumab vs Everolimus | OS and PFS | months | event = CNSR (Braun) | Yes (contextual) | **NO** | Different regimen and line of therapy; mixed direction (OS Cox HR_int=1.245; PFS Cox HR_int=0.964; OS RMST τ=24 = +2.45 mo with CI crossing 0) |
| KEYNOTE-426 | Literature context | Pembro+Axi vs Sun | PFS, OS (trial-level only) | months | N/A | N/A | NO | No patient-level Teff5+outcome public file |
| CLEAR / KEYNOTE-581 | Literature context | Lenva+Pembro vs Sun | PFS, OS (trial-level only) | months | N/A | N/A | NO | No patient-level Teff5+outcome public file |
| CheckMate 9ER | Literature context | Nivo+Cabo vs Sun | PFS, OS (trial-level only) | months | N/A | N/A | NO | No patient-level Teff5+outcome public file |

## Comparable two-trial primary meta (locked)

Only IMmotion150 + JAVELIN are in the primary comparable PFS meta:
- Fixed-effect pooled HR_int = 0.690 (95% CI 0.556–0.856), p = 0.000729.
- Random-effects (DerSimonian–Laird) pooled HR_int = 0.655 (95% CI 0.445–0.965), p = 0.0323.

Source: output_v6_gate15/16_corrected_comparable_meta.csv; output_v6_gate15/18_cross_trial_synthesis_lock.md.

## Forbidden in this harmonization

- Do NOT treat JAVELIN Cox p=0.0536 as statistically significant.
- Do NOT include CheckMate in the primary comparable meta.
- Do NOT cite KEYNOTE-426 / CLEAR / CheckMate 9ER as direct validation; they remain literature context unless and until patient-level Teff5+outcome public data become available.

Source files: output_v9/tables/03_endpoint_harmonization_table.csv.
