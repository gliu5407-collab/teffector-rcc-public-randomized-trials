# V9 Module D — Literature Triangulation and Non-availability

Purpose: transparently document which trials were analyzable and which were not, and why.

## Trials and roles

| Trial | Regimen | Public patient-level Teff5+outcome? | Direct validation possible? | Role in manuscript |
|---|---|---|---|---|
| IMmotion150 (NCT01984242) | AtezoBev vs Sunitinib | YES | self | Primary discovery |
| JAVELIN Renal 101 (NCT02684006) | Avelumab+Axitinib vs Sunitinib | YES | YES — primary external validation | Primary external validation (directionally consistent, Cox p=0.0536 not significant) |
| CheckMate-025 / Braun 2020 | Nivolumab vs Everolimus (post-VEGFi) | YES | NO — different regimen and line of therapy | Contextual triangulation only |
| KEYNOTE-426 (NCT02853331) | Pembro + Axi vs Sun | NO | NO | Literature context only |
| CLEAR / KEYNOTE-581 (NCT02811861) | Lenva + Pembro vs Sun | NO | NO | Literature context only |
| CheckMate 9ER (NCT03141177) | Nivo + Cabo vs Sun | NO | NO | Literature context only |

## Boundaries

- IMmotion151 is not analyzed in this project (no patient-level Teff5+outcome public file accessible here).
- KEYNOTE-426 / CLEAR / CheckMate 9ER cannot be reconstructed at patient level from public data: trial-level summary statistics (HR, KM curves) cannot be combined with the frozen Teff5 score per patient. They therefore cannot serve as direct validation in this manuscript and are referenced only as literature context for the IO+TKI vs Sunitinib regimen class.
- CheckMate-025 IS patient-level analyzable, but its regimen (Nivolumab vs Everolimus) and line of therapy (post-VEGFi refractory) are not comparable to the primary front-line IO+TKI vs Sunitinib comparison. CheckMate is therefore contextual only and is excluded from the primary comparable meta-analysis.
- All discussion of these external trials in the manuscript must respect the boundaries above.

Source files: output_v9/tables/04_literature_triangulation_table.csv.
