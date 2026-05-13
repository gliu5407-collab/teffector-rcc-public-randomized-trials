# Analysis and reproducibility notes

This repository provides derived outputs, supplementary tables, audit documents, and scripts available for the public cross-trial reanalysis.

The repository does **not** redistribute third-party source clinical-trial datasets, raw RNA-seq matrices, cBioPortal study files, or published supplementary workbooks. Users must obtain source datasets from the original public sources listed in `data_source_notes/DATA_SOURCE_REGISTER.csv` and cited in the manuscript.

The scripts in `analysis/scripts/` are parameterized templates for the matched random-gene negative-control workflow. They require users to provide local paths to source data via command-line arguments or environment variables. They do not contain local user paths and do not include source data.

The main repository integrity check is:

```bash
bash checks/verify_repository_integrity.sh
```

This verifies that the repository files match the SHA-256 manifest. It does not re-download or redistribute third-party data.
