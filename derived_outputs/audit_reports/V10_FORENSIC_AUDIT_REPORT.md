# V10 Pre-manuscript Forensic Audit — Final Report

**Bundle:** `immotion150_v9_full_locked_bundle/`
**Audit date:** 2026-05-12
**Scope:** verify locked V9.1 bundle for primary-definition errors, stale numerical values in active files, cutoff/subgroup misclassification, endpoint/event-coding inconsistency, forbidden claims, dataset-role misclassification, and reporting-readiness gaps. No re-analysis, no new biomarker, no cutoff tuning, no ML.

---

## Required answers

### 1. Did V10 find any primary analysis definition error?
**NO.** All 11 V10 definition checks PASS. Gene list is locked to CD8A, EOMES, PRF1, IFNG, CD274; CD274 is not replaced by GZMA; primary discovery contrast is AtezoBev vs Sunitinib; primary validation contrast is Avelumab+Axitinib vs Sunitinib; primary endpoint is PFS; primary model is Cox treatment × continuous z-scored Teff; Teff-high median is supportive RMST only; tertile/quartile are sensitivity only; CheckMate is contextual; policy is exploratory/forbidden; KEYNOTE-426/CLEAR/CheckMate 9ER are literature context only. See `output_v10/03_primary_definition_audit.md`.

### 2. Did V10 find any cutoff/subgroup misclassification?
**NO.** All 6 cutoff/subgroup checks PASS. Continuous z-scored Teff is primary across SAP §2/§4, Master Results Table R1/R5, and Manuscript Framework §4. Median-high is restricted to RMST clinical interpretation; tertile/quartile appear only inside the predeclared vibration multiverse; no "optimal cutoff", "tuned cutoff", or JAVELIN-derived cutoff wording appears in active files. See `output_v10/05_cutoff_subgroup_audit.md`.

### 3. Did V10 find any stale numerical value in active manuscript files?
**NO.** All canonical primary numbers in active V9 files match the locked raw inputs. The stale-value scan was performed for IMmotion150 HR=0.504, events=140, n=263; JAVELIN HR=0.807 as primary; JAVELIN p called significant; "Cox 18/18" instead of 15/15; and "RE Bayesian all ≥0.99". Each of those stale tokens appears ONLY in clearly-labeled correction trails or pre-correction backup files in `output_v6_gate15/` or `output_v7/`, never inside any V9 active manuscript file. Minor rounding observation: the V10 prompt lists FE meta CI_low as 0.557, but the locked raw CSV value is 0.5564529… → V9 active files use 0.556 consistently with their own raw input. Not an error. See `output_v10/04_numerical_consistency_audit.md`.

### 4. Did V10 find any endpoint/event coding inconsistency?
**NO.** All 6 endpoint/event-coding checks PASS. IMmotion150 PFS uses V5.5 frozen mapping; JAVELIN PFS uses event = 1 − PFS_P_CNSR (SAS standard, empirically verified); CheckMate uses event = CNSR (Braun convention, empirically validated in Gate1.5). No JAVELIN OS claim; no CheckMate primary validation claim; no OS replacing PFS in the primary. See `output_v10/06_endpoint_event_coding_audit.md`.

### 5. Did V10 find any forbidden claim in active files?
**NO.** Every risky phrase searched for ("validated", "significant validation", "clinically actionable", "novel biomarker", "discovered", "JAVELIN validated", "CheckMate validated", "KEYNOTE validated", "CLEAR validated", "95+/90+", "policy proven", "treatment policy") appears in active V9 files only as (a) explicit negation inside the Forbidden Claims ledger / Reviewer "Do NOT say" rows, or (b) methodological reference (e.g., "empirically validated event coding"), or (c) factually correct positive claim restricted to where it is true (e.g., IMmotion150 "significantly modified" at p=0.001249). See `output_v10/07_claim_language_audit.md`.

### 6. Did V10 find any dataset role misclassification?
**NO.** All 6 dataset role assignments are consistent across active files. IMmotion150 = discovery/internal locked primary; JAVELIN = external directionally consistent support (Cox NOT significant); CheckMate-025 = contextual non-identical cohort; KEYNOTE-426/CLEAR/CheckMate 9ER = literature context only with no public patient-level Teff5+outcome data. See `output_v10/08_dataset_role_audit.md`.

### 7. Did V10 find any reporting-readiness gaps?
**NO blocking gap.** All required reporting-readiness elements (data availability, code availability, AI-use disclosure, ethics/IRB, REMARK, SAMPL, CONSORT-style transparency, figure/table plan, reviewer attack-response) are present in DRAFT form. Remaining work items (author list, journal target, publication-quality figures, AI-use language finalization, figure legends, institutional IRB confirmation) are normal manuscript-finalization tasks that V9 §10 already enumerates. See `output_v10/09_reporting_readiness_audit.md`.

### 8. Is manuscript drafting allowed to proceed?
**YES.** No blocking issue was found in any active manuscript file.

---

## Observations (non-blocking)

These are housekeeping recommendations only. They do NOT change the V10 decision.

1. **Identical-SHA filenames in V7** — `output_v7/19_v7_strengthening_without_contamination_report.md` and `output_v7/19_v7_strengthening_without_contamination_report_v7_1_CORRECTED.md` are byte-identical (SHA-16 = `71806d05d272dcdf`). Reviewer-facing clarity would benefit from a one-line note in `13_REPRODUCIBILITY_MANIFEST.md` stating that the un-suffixed file is retained for backward path stability and the `_v7_1_CORRECTED` filename is the canonical pointer.
2. **Pre-correction backup retention** — `output_v7/19_*_ORIGINAL_UNCORRECTED.md` retains the pre-correction "Cox 18/18" and "all ≥0.99" wording for audit transparency. It is not part of the active manuscript framework. Recommend adding a one-line note in `13_REPRODUCIBILITY_MANIFEST.md` that this file plus `output_v7/V7_final_report_correction_log.md` are retained for audit trail only.
3. **FE meta CI rounding convention** — the V10 prompt cites FE CI_low as 0.557; V9 uses 0.556 consistently. Both are valid roundings of `0.5564529`. Recommend keeping V9's 0.556 in the manuscript to stay consistent with the locked raw input.

---

## V10 decision

```
V10_DECISION = CLEAN_PASS
PRIMARY_DEFINITION_ERROR = NO
CUTOFF_ERROR = NO
STALE_NUMBER_IN_ACTIVE_FILES = NO
ENDPOINT_EVENT_ERROR = NO
FORBIDDEN_CLAIM_FOUND = NO
DATASET_ROLE_ERROR = NO
REPORTING_GAP_BLOCKING = NO
MANUSCRIPT_DRAFTING_ALLOWED = YES
```

Categorical justification: **V10 CLEAN PASS** because no active-manuscript-file error of any kind was found. All flagged items are either pre-correction backups (explicitly retained for audit), historical correction trails (explicitly retained for audit), or accepted limitations already documented in V9. The three observations above are housekeeping recommendations, not corrections.
