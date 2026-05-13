# Public repository reproducibility manifest

This manifest describes the current public GitHub/Zenodo support repository. It is intentionally narrower than the private analysis workspace used during manuscript development.

## Repository status

This release is a public code-support and derived-output repository. It includes supplementary tables, derived non-identifying outputs, selected audit reports, source-data access notes, selected scripts, and an integrity manifest.

This release is **not** a full one-command reproduction pipeline and does **not** redistribute raw third-party patient-level clinical-trial datasets or raw RNA-seq matrices.

## Included materials

- Supplementary Tables S1-S18 in `supplementary_tables/`;
- derived non-identifying matched negative-control outputs in `derived_outputs/matched_negative_control/`;
- selected audit reports in `derived_outputs/audit_reports/`;
- source-data access and redistribution notes in `data_source_notes/`;
- public analysis helper scripts in `analysis/scripts/`;
- repository-integrity scripts in `checks/`;
- public file manifest in `manifests/PUBLIC_REPOSITORY_FILE_MANIFEST.csv`.

## Not included

The public release does not include private/raw directories or private development artifacts such as `data/`, `output/`, `output_v6_gate15/`, `output_v7/`, `output_v9/`, `scripts_v6_gate15/`, `scripts_v7/`, raw third-party trial workbooks, raw cBioPortal/iAtlas files, controlled-access data, or manuscript submission administration files.

These exclusions are deliberate and are described in `DATA_AVAILABILITY.md`, `data_source_notes/DATA_SOURCE_REGISTER.csv`, and `data_source_notes/THIRD_PARTY_DATA_REDISTRIBUTION_POLICY.md`.

## Integrity check

After cloning or downloading this repository, run:

```bash
bash checks/verify_repository_integrity.sh
```

This verifies SHA-256 fingerprints and file sizes for all repository files listed in `manifests/PUBLIC_REPOSITORY_FILE_MANIFEST.csv`. The public file manifest intentionally does not list itself, because self-size/self-hash values are unstable. The check does not download or redistribute third-party source data.

## Reproducibility boundary

Primary manuscript analyses were conducted in a private analysis workspace using public/third-party source data. This repository provides derived outputs, audit materials, code-support scripts, and source-data provenance to support transparency. Full independent rerun requires obtaining the original source datasets from the portals or publications documented in the data-source register.

No biomarker search, cutoff optimization, model retraining, or one-command full reproduction is claimed for this public archive.
