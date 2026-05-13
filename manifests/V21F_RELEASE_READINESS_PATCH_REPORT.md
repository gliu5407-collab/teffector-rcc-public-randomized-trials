# V21F release-readiness patch report

This patch responds to the final pre-release audit of the V21E metadata-fixed public archive.

## Changes applied

1. Removed the self-referential row for `manifests/PUBLIC_REPOSITORY_FILE_MANIFEST.csv` from `manifests/PUBLIC_REPOSITORY_FILE_MANIFEST.csv`. The manifest now lists repository files other than itself, avoiding unstable self-size/self-hash values.
2. Updated `docs/13_REPRODUCIBILITY_MANIFEST.csv` so the public archive inventory includes all currently present files, including `manifests/V21E_METADATA_REPRODUCIBILITY_PATCH_REPORT.md` and this V21F patch report.
3. Added a public-archive scope disclaimer to historical/reviewer-facing documents that mention private workspace paths or one-command reproduction artifacts from manuscript development.
4. Updated `checks/verify_repository_integrity.py` so it checks both SHA-256 and `size_bytes` for all rows listed in the public file manifest.
5. Regenerated `manifests/PUBLIC_REPOSITORY_FILE_MANIFEST.csv` after all edits.

## Scope clarification

The public GitHub/Zenodo archive remains a code-support and derived-output repository. It does not claim to contain raw third-party patient-level datasets, raw RNA-seq matrices, private workspace directories, or a full one-command reproduction pipeline.

## Integrity result

After the V21F patch, `bash checks/verify_repository_integrity.sh` returns:

```text
Repository integrity check PASS
```
