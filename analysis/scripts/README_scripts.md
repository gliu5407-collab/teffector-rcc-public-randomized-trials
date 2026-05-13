# Analysis script notes

The scripts in this folder are parameterized helpers for reproducing the expression/variance-matched random five-gene negative-control workflow. They do not include source clinical-trial data or raw expression matrices.

Required local source files include:

- IMmotion150 analysis dataset RDS generated from public cBioPortal/iAtlas files;
- IMmotion150 `data_mrna_seq_tpm.txt` obtained from the public cBioPortal/DataHub source;
- JAVELIN clinical table obtained from the public supplementary workbook;
- JAVELIN S13 expression table extracted from the public supplementary workbook.

For the R script, set environment variables before running:

```bash
export V18H_ROOT=/path/to/output/workdir
export IM150_CORE_RDS=/path/to/analysis_dataset_v3_core.rds
export IM150_TPM=/path/to/data_mrna_seq_tpm.txt
export JAVELIN_CLINICAL_CSV=/path/to/javelin_clinical.csv
export JAVELIN_S13_EXPRESSION_CSV=/path/to/javelin_S13_full_expression_log2tpm.csv
Rscript analysis/scripts/10_v18h_matched_negative_control.R
```

The fixed random seed used in the manuscript analysis was `20260513`.
