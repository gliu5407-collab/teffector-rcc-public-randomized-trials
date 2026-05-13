# V21D Repository Final Audit Report

Decision: REPOSITORY_UPLOAD_READY_WITH_DOI_PENDING

The public repository candidate was reconstructed to remove submission-only administrative files, remove manuscript files containing repository placeholders, avoid redistribution of raw third-party data, and provide a clean code/data-support repository for GitHub and Zenodo.

## Key changes from V21C

- Removed cover-letter files and submission-administration drafts from the public repository package.
- Removed active manuscript files from the repository package to avoid DOI placeholders and manuscript-version confusion. Manuscript files should be submitted to the journal separately.
- Added top-level `DATA_AVAILABILITY.md` and `CODE_AVAILABILITY.md` without placeholder DOI text.
- Added a clear third-party source-data redistribution policy and do-not-upload list.
- Replaced local-path scripts with parameterized script templates and script notes.
- Regenerated a SHA-256 file manifest.
- Verified repository integrity with `checks/verify_repository_integrity.sh`.

## Remaining action before manuscript submission

Create a GitHub release and Zenodo archive, obtain the DOI, and then insert the GitHub URL / Zenodo DOI into the manuscript Data availability and Code availability statements.
