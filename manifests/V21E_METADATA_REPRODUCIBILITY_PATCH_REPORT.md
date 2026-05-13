# V21E metadata and reproducibility wording patch report

Decision: READY_FOR_GITHUB_ZENODO_AFTER_METADATA_PATCH

This patch addresses final public-release packaging issues identified during ZIP review.

## Changes made

1. Added `.zenodo.json` to control Zenodo metadata for title, creator, description, keywords, upload type, and license-scope note.
2. Added top-level `LICENSE` explaining mixed repository scope: code under MIT, derived documentation/tables under content notice, and no raw third-party data ownership claim.
3. Added `.gitignore` to reduce future accidental upload risk for raw data, private outputs, logs, and local files.
4. Rewrote `docs/13_REPRODUCIBILITY_MANIFEST.md` so it no longer claims a full one-command reproduction pipeline or references absent private paths as if they were included.
5. Rebuilt `docs/13_REPRODUCIBILITY_MANIFEST.csv` to describe the actual current public repository contents.
6. Regenerated `manifests/PUBLIC_REPOSITORY_FILE_MANIFEST.csv` and verified repository integrity.

## Boundary retained

This public repository remains a public code-support and derived-output repository. It does not redistribute raw third-party patient-level source data. Full rerun requires obtaining source datasets from original portals/publications documented in the data-source register.
