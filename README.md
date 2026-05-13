# Five-gene T-effector treatment-effect heterogeneity in metastatic ccRCC

This repository provides code-support materials, derived outputs, supplementary tables, audit reports, and provenance notes for a public randomized-trial reanalysis evaluating a fixed five-gene T-effector score (`CD8A`, `EOMES`, `PRF1`, `IFNG`, `CD274`) as a candidate treatment-effect modifier for ICI-containing VEGF/VEGFR-directed combinations versus sunitinib in metastatic clear-cell renal-cell carcinoma.

## Scope

This repository is intended to support reproducibility and transparency for the manuscript submission. It includes:

- Supplementary Tables S1-S18 as CSV files;
- derived non-identifying analysis outputs and audit reports;
- source-data access notes and third-party data redistribution policy;
- scripts and parameterized helpers for available reproducibility checks;
- checksum manifests and a repository integrity check.

## What is not included

This repository does **not** redistribute raw third-party source clinical-trial datasets, raw RNA-seq matrices, cBioPortal study files, published supplementary workbooks, controlled-access data, or any identifiable private information. Users should obtain source data from the original public releases and published supplementary materials listed in `data_source_notes/DATA_SOURCE_REGISTER.csv`.

## Key interpretation boundary

JAVELIN Renal 101 is treated as directionally consistent external support, not statistical confirmation. CheckMate-025 is contextual only. KEYNOTE-426, CLEAR/KEYNOTE-581, and CheckMate 9ER are literature-context/non-availability boundaries for the planned frozen-score patient-level interaction analysis.

## Integrity check

After cloning or downloading the repository, run:

```bash
bash checks/verify_repository_integrity.sh
```

The check verifies SHA-256 fingerprints of files listed in `manifests/PUBLIC_REPOSITORY_FILE_MANIFEST.csv`. It does not re-download or redistribute third-party data.

## Citation

Please cite the associated manuscript and this archived repository release. A Zenodo DOI should be generated after creating the GitHub release and should then be used in the manuscript Data/Code availability statements.
