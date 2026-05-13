# V9 Reporting Checklist (draft)

**Public-archive scope note (V21F):** Historical/private workspace references in this document are provenance notes from manuscript development. They are not claims that those private workspace files, one-command scripts, raw source datasets, or full locked-pipeline directories are included in this public GitHub/Zenodo archive. The current public archive scope is defined by `README.md`, `DATA_AVAILABILITY.md`, `CODE_AVAILABILITY.md`, and `docs/13_REPRODUCIBILITY_MANIFEST.md`.


Reporting elements aligned with REMARK (biomarker), SAMPL (statistics), and selected CONSORT-style transparency. We do **not** claim formal CONSORT compliance for the original trials; this is a public secondary biomarker analysis.

---

## REMARK-style tumor marker reporting

- Marker definition (genes, transformation, scoring rule, locking date): output_v9/manuscript_framework/06_SAP_v1_0_LOCKED.md §4–5.
- Patient population per trial (selection, inclusion, biomarker-evaluable counts): output_v9/02_biomarker_evaluable_subset_audit.md.
- Marker measurement assay and platform: see Methods (IMmotion150 RNAseq supplementary; JAVELIN Motzer 2020 S11–S16; CheckMate Braun 2020 supplement).
- Endpoint definitions and event coding: output_v9/03_endpoint_harmonization_table.md.
- Statistical analysis plan: output_v9/manuscript_framework/06_SAP_v1_0_LOCKED.md.
- Reproducibility of primary finding: output/46_v55_independent_reproduction_audit_report.md.
- Falsification and negative-control testing: output/41_v55_independent_permutation.csv; output/43_v55_negative_control_summary.csv; output_v6_gate15/10_javelin_negative_control_summary.csv.
- Construct validity: output_v7/07_construct_validity_summary.md.
- Predictive vs prognostic decomposition: output_v7/10_predictive_vs_prognostic_summary.md.
- Existing-signature benchmarks: output_v7/17_existing_signature_benchmark_summary.md.
- Limits of generalization: output_v9/04_literature_triangulation_summary.md.

## CONSORT-style secondary-analysis transparency

(Applied to our secondary analysis flow, NOT to the original randomized trials.)

- Locking of biomarker and analytic decisions before validation: SAP v1.0 (output_v9/manuscript_framework/06_SAP_v1_0_LOCKED.md).
- Manifest of locked input files with SHA-256 fingerprints: output_v9/01_locked_input_manifest.csv.
- Pre-specified hypotheses, models, and endpoints: SAP §2–§17.
- Pre-specified analyses that were not added later: SAP §18 (forbidden).
- Subset/selection audit: output_v9/02_biomarker_evaluable_subset_audit.md.
- Reasons for excluding KEYNOTE-426 / CLEAR / CheckMate 9ER from direct validation: output_v9/04_literature_triangulation_summary.md.
- Reasons for excluding CheckMate-025 from primary comparable meta: output_v6_gate15/18_cross_trial_synthesis_lock.md.

## SAMPL-style statistical reporting

- Effect estimates with 95% CIs and p-values for primary and key secondary tests: output_v9/manuscript_framework/07_MASTER_RESULTS_TABLE_LOCKED.md.
- Statistical models named (Cox PH, RMST with bootstrap CI, permutation, fixed/random-effects meta, Bayesian normal–normal): SAP §11–§15.
- Software and version reporting: output_v9/13_REPRODUCIBILITY_MANIFEST.md.
- Heterogeneity reporting (Q, I², τ²): output_v6_gate15/16_corrected_comparable_meta.csv.
- Bayesian prior sensitivity reporting: output_v7/13_bayesian_synthesis_summary.md.
- Multiverse stability reporting: output_v7/15_vibration_summary.md.

## Data availability

Public sources:
- IMmotion150 (NCT01984242) RNAseq + PFS (public supplementary materials and associated portal).
- JAVELIN Renal 101 (NCT02684006): Motzer et al. 2020 supplement S11–S16.
- CheckMate-025 (NCT01668784): Braun et al. 2020 supplement.

Locked outputs:
- output/ (V5.5)
- output_v6_gate15/ (Gate1.5)
- output_v7/ (V7 strengthening)
- output_v9/ (V9 manuscript hardening)

## Code availability

- Locked scripts: scripts/, scripts_v6_gate15/, scripts_v7/, scripts_v6/.
- Reproduction script: run_reproduce_locked_results.sh.
- Reproducibility manifest: output_v9/13_REPRODUCIBILITY_MANIFEST.md / .csv.

## Human participants / ethics

- This is a secondary analysis of public, de-identified, previously consented clinical trial data.
- No new patient consent or ethics approval required for this secondary analysis.
- Original trial ethics: per the IMmotion150, JAVELIN Renal 101, CheckMate-025 primary publications.

## AI-use disclosure

- An LLM-based code-and-analysis assistant (Claude Code) was used to harmonize endpoints, audit subsets, generate the locked input manifest, draft the reviewer attack-response, and produce manuscript-hardening framework files.
- The frozen primary statistical results (Cox, RMST, permutation, random-signature negative control, meta-analysis, Bayesian synthesis, construct validity) were produced by locked R/Python pipelines on public patient-level data, not by an LLM.
- Authors verified every numerical value against locked output files (output_v9/01_locked_input_manifest.csv).

## Reproducibility materials

- Locked input manifest with SHA-256 fingerprints: output_v9/01_locked_input_manifest.csv.
- Reproducibility manifest: output_v9/13_REPRODUCIBILITY_MANIFEST.md, .csv.
- One-command reproduction script: run_reproduce_locked_results.sh.
- Locked outputs are read-only; any rerun is checksum-verified.
