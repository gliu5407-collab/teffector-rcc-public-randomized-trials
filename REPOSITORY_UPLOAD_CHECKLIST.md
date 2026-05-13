# GitHub / Zenodo upload checklist

Before manuscript submission:

1. Create a GitHub repository, for example `teffector-rcc-public-randomized-trials`.
2. Upload the contents of this repository package.
3. Confirm that no raw third-party patient-level data, raw expression matrices, raw supplementary workbooks, or controlled-access data have been uploaded.
4. Run `bash checks/verify_repository_integrity.sh` after upload/clone.
5. Create a GitHub release, for example `v1.0.0`.
6. Enable Zenodo archiving for the repository or upload the release archive to Zenodo.
7. Obtain the version-specific Zenodo DOI.
8. Insert the DOI and GitHub URL into the manuscript Data availability and Code availability statements.
9. Re-run final manuscript data/code availability audit.

Do not upload any files listed in `manifests/DO_NOT_UPLOAD_LIST.md`.
