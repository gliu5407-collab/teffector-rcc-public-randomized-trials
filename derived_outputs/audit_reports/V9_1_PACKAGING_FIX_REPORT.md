# V9.1 Packaging Fix Report

**Public-archive scope note (V21F):** Historical/private workspace references in this document are provenance notes from manuscript development. They are not claims that those private workspace files, one-command scripts, raw source datasets, or full locked-pipeline directories are included in this public GitHub/Zenodo archive. The current public archive scope is defined by `README.md`, `DATA_AVAILABILITY.md`, `CODE_AVAILABILITY.md`, and `docs/13_REPRODUCIBILITY_MANIFEST.md`.


Date: 2026-05-12
Pipeline: V9.1 packaging fix (standalone reproducibility bundle). No primary analysis change.

## Bundle contents (immotion150_v9_full_locked_bundle/)

- output/                            — V5.5 frozen primary analysis
- output_v6_gate15/                  — Gate1.5 JAVELIN + CheckMate locks
- output_v7/                         — V7 strengthening
- output_v8/AUDIT_REPORT_NOT_AVAILABLE.md  — V8 not available (placeholder)
- output_v9/                         — V9 manuscript hardening
- run_reproduce_locked_results.sh    — standalone verification script

## Answers

- All prior locked files included: **YES** (21 locked V5.5 / Gate1.5 / V7 files plus full V9 manuscript-hardening tree).
- V8 audit file included: **NO** (V8 not available; placeholder AUDIT_REPORT_NOT_AVAILABLE.md created; manifest notes updated: "V8 not primary evidence; absence does not affect IMmotion150/JAVELIN locked analysis.")
- run_reproduce_locked_results.sh status: **PASS** — executed from the bundle root, verified 21 locked SHA-256 fingerprints and 20 V9 outputs.
- Primary analysis changed: **NO**.
- Numerical results changed: **NO**.

## Terminal summary

```
V9_1_PACKAGING_FIX = PASS
STANDALONE_REPRODUCTION = PASS
PRIMARY_ANALYSIS_CHANGED = NO
NUMERICAL_RESULTS_CHANGED = NO
OUTPUT_ZIP = immotion150_v9_full_locked_bundle_for_chatgpt.zip
```
