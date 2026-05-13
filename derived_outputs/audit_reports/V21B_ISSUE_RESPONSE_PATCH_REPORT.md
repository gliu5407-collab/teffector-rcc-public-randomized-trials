# V21B Issue-Response Patch Report

## Decision

V21B_DECISION = ISSUE_RESPONSE_PATCH_PASS_WITH_REPOSITORY_PLACEHOLDER

## What was patched

1. Added explicit IMmotion150 discovery/audit caveat: the score was fixed after IMmotion150 discovery/audit, so IMmotion150 estimates are nominal discovery/audit results rather than confirmatory validation.
2. Expanded Figure 3 and Figure 5 legends with RMST low-subgroup and high-minus-low boundary text.
3. Replaced Data/Code “before submission or upon acceptance” language with “before submission” repository placeholders.
4. Removed manuscript-facing ethics “should confirm before submission” placeholder and replaced it with a submission-appropriate de-identified public secondary-analysis ethics statement.
5. Added a separate Funding section and removed the conditional author-contribution sentence about possible future authors.
6. Updated the cover letter to say JAVELIN provides external support without statistical confirmation.

## Audit checks

| Check | Status | Note |
|---|---|---|
| Ethics placeholder removed | PASS | No “should confirm before submission” in active manuscript |
| Author conditional removed | PASS | Single-author contribution now definitive |
| Repository not upon acceptance | PASS | Data/code use before submission only |
| Discussion post hoc boundary added | PASS | IMmotion150 post-discovery fixed score caveat present |
| Figure 3 RMST low detail | PASS | Figure 3 legend includes low subgroup and high-minus-low |
| Figure 5 RMST low detail | PASS | Figure 5 legend includes low subgroup and high-minus-low caveat |
| JAVELIN validation avoided | PASS | No JAVELIN validation wording in main |
| Funding section present | PASS | Separate funding section present |
| Data placeholder flagged | PASS | Repository remains required before final submission |
| Supplement Table S18 synchronized | PASS | S18 naming matches |

## Remaining blocker before submission

The repository link/DOI is still a required pre-submission item. The manuscript now states that derived tables, audit tables, source-data notes, code, and reproducibility manifests will be deposited before submission. This placeholder must be replaced with a real GitHub/Zenodo/OSF link before submitting to Scientific Reports.

## Primary analysis impact

PRIMARY_ANALYSIS_CHANGED = NO
NUMERICAL_RESULTS_CHANGED = NO
BIOMARKER_CHANGED = NO
ENDPOINT_CHANGED = NO
CUTOFF_CHANGED = NO
FORMAL_FIGURES_CREATED = NO
