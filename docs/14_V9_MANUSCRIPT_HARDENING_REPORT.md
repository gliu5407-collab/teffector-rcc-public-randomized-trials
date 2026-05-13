# V9 Manuscript Hardening — Final Report

**Public-archive scope note (V21F):** Historical/private workspace references in this document are provenance notes from manuscript development. They are not claims that those private workspace files, one-command scripts, raw source datasets, or full locked-pipeline directories are included in this public GitHub/Zenodo archive. The current public archive scope is defined by `README.md`, `DATA_AVAILABILITY.md`, `CODE_AVAILABILITY.md`, and `docs/13_REPRODUCIBILITY_MANIFEST.md`.


Date: 2026-05-12
Pipeline: V9 manuscript hardening pass (no primary analysis change; no new biomarker; no ML).

---

## Required answers

### 1. Did V9 change the primary analysis?
**NO.** All primary frozen values are unchanged:
- IMmotion150 V5.5: n=177, events=113, HR_int=0.521 (95% CI 0.351–0.774), p=0.001249.
- JAVELIN Gate1.5: n=726, events=358, HR_int=0.777 (95% CI 0.601–1.004), p=0.0536 (NOT statistically significant for Cox interaction).
- Comparable two-trial meta (FE): 0.690 (95% CI 0.556–0.856), p=0.000729.

### 2. Was any new biomarker introduced?
**NO.** The frozen gene list remains CD8A, EOMES, PRF1, IFNG, CD274. CD274 was not replaced by GZMA. No alternative gene list was searched.

### 3. Were the manuscript locks created?
**YES.**
- output_v9/manuscript_framework/06_SAP_v1_0_LOCKED.md
- output_v9/manuscript_framework/07_MASTER_RESULTS_TABLE_LOCKED.md (+ .csv)
- output_v9/manuscript_framework/08_CLAIMS_LEDGER_LOCKED.md
- output_v9/manuscript_framework/09_FORBIDDEN_CLAIMS_LOCKED.md
- output_v9/manuscript_framework/10_MANUSCRIPT_FRAMEWORK.md

### 4. Were biomarker-evaluable subset and endpoint harmonization tables created?
**YES.**
- output_v9/02_biomarker_evaluable_subset_audit.md (+ tables/02_…csv).
  - JAVELIN evaluable (n=726) vs non-evaluable (n=160): balanced on treatment arm (SMD −0.11), PFS time (SMD +0.03), age, sex; PFS event proportion SMD +0.18; PD-L1 SMD +0.42 (explained by 46% PD-L1 missingness in non-evaluable).
  - IMmotion150 full-ITT vs RNA-evaluable comparison: not feasible from public data here; limitation reported.
  - CheckMate CM-025 RNA-evaluable (n=250) vs non-evaluable (n=553): balanced on arm, age, sex, PFS/OS event proportion, MSKCC poor-risk (all |SMD| ≤ 0.10).
- output_v9/03_endpoint_harmonization_table.md (+ tables/03_…csv).

### 5. Were literature triangulation and non-availability boundaries created?
**YES.** output_v9/04_literature_triangulation_summary.md (+ tables/04_…csv).
- KEYNOTE-426, CLEAR, CheckMate 9ER: literature context only; no public patient-level Teff5+outcome data; not used as direct validation.
- CheckMate-025: contextual only; excluded from primary comparable meta.

### 6. Were SAP, Master Results Table, Claims Ledger, Forbidden Claims created?
**YES.** All four locks are present in output_v9/manuscript_framework/.

### 7. Was a reviewer attack-response table created?
**YES.** output_v9/reviewer_package/11_REVIEWER_ATTACK_RESPONSE_TABLE.md (30 entries covering all required reviewer angles plus subset bias, JAVELIN p=0.0536, CheckMate mixed direction, biomarker re-optimization, ML avoidance, KEYNOTE-426 non-availability, RMST τ choice, Bayesian sensitivity, vibration, clinical actionability).

### 8. Is the project still 88–89, or did V9 reveal any issue?
**Still 88–89/100.** V9 is a manuscript-hardening pass and does not generate new external validation evidence. No hidden contradiction was uncovered. The locked V5.5 / Gate1.5 / V7 results are internally consistent with the V9 master results table.

### 9. What exact files should be used for drafting?

Mandatory files for the manuscript draft:
1. output_v9/manuscript_framework/06_SAP_v1_0_LOCKED.md — SAP
2. output_v9/manuscript_framework/07_MASTER_RESULTS_TABLE_LOCKED.md — Master Results Table (numerical source of truth)
3. output_v9/manuscript_framework/08_CLAIMS_LEDGER_LOCKED.md — what to say
4. output_v9/manuscript_framework/09_FORBIDDEN_CLAIMS_LOCKED.md — what NOT to say (and allowed replacements)
5. output_v9/manuscript_framework/10_MANUSCRIPT_FRAMEWORK.md — title, abstract skeleton, results 1–7 outline
6. output_v9/02_biomarker_evaluable_subset_audit.md — limitations paragraph
7. output_v9/03_endpoint_harmonization_table.md — methods table
8. output_v9/04_literature_triangulation_summary.md — discussion boundaries
9. output_v9/05_future_validation_planning_summary.md — future-work paragraph
10. output_v9/reviewer_package/11_REVIEWER_ATTACK_RESPONSE_TABLE.md — response-to-reviewers seed
11. output_v9/checklists/12_REPORTING_CHECKLIST_DRAFT.md — REMARK/SAMPL checklist
12. output_v9/13_REPRODUCIBILITY_MANIFEST.md — data/code availability

### 10. What remains before manuscript writing?
- Confirm author list, affiliations, and corresponding-author details.
- Confirm the journal target (this informs CONSORT/REMARK section wording).
- Generate publication-quality figures from the locked R/Python outputs (F1–F6 per output_v9/manuscript_framework/10_MANUSCRIPT_FRAMEWORK.md §10). Locked numerical inputs are already in place.
- Finalize AI-use disclosure language with co-authors.
- Final figure legends and supplementary structure.
- IRB / ethics statement confirmation (secondary analysis of public data — no new approval needed in most jurisdictions, but verify per institution).

---

## V9 decision

**V9_DECISION = HARDENING_PASS**

- All required lock files created.
- No primary analysis changed.
- No hidden contradiction surfaced.
- One acknowledged limitation: IMmotion150 full-ITT biomarker-evaluable comparison is not feasible from the public data accessible in this project and is reported transparently.

---

## Terminal summary

```
V9_DECISION = HARDENING_PASS
PRIMARY_ANALYSIS_CHANGED = NO
NEW_BIOMARKER_INTRODUCED = NO
SAP_LOCKED = YES
MASTER_RESULTS_LOCKED = YES
CLAIMS_LEDGER_LOCKED = YES
FORBIDDEN_CLAIMS_LOCKED = YES
MANUSCRIPT_FRAMEWORK_CREATED = YES
OUTPUT_ZIP = immotion150_v9_manuscript_hardening_outputs_for_chatgpt.zip
```
