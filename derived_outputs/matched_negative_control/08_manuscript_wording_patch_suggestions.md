# V18H — Suggested manuscript wording patch (suggestions only; manuscript not modified)

These three sentences may be inserted into the existing manuscript where the random-gene
negative-control benchmark is described. They strengthen the original empirical claim by
adding expression/variance-matched random sets without altering any frozen biomarker,
endpoint, contrast, model, or locked numerical result.

## Methods (one sentence)

> As an additional sensitivity analysis, we generated R = 10,000 random five-gene sets per
> dataset matched to each T-effector member by joint deciles of mean expression and standard
> deviation (computed on the locked analysis cohort), excluded the five T-effector genes
> from the pool, and refit the identical pre-specified pairwise interaction Cox model
> (PFS ~ treatment + score_z + treatment:score_z, Sunitinib as reference) for each set; no
> primary biomarker, endpoint, contrast, or locked numerical result was altered.

## Results / Supplement (one sentence)

> In an expression- and variance-matched random-gene benchmark, the observed T-effector
> interaction HR lay in the lower 0.5 % of 10,000 matched random sets in IMmotion150
> (frac HR_int ≤ observed = 0.0049; frac p ≤ observed = 0.0044) and in the lower 0.33 % by
> interaction HR direction in JAVELIN Renal 101 (frac HR_int ≤ observed = 0.0033),
> consistent with the original unmatched random-gene falsification check (Supplementary
> Table V18H_06).

## Limitations (one sentence)

> The matched random-gene benchmark is a supportive negative-control sensitivity analysis
> only — it is not a formal multiplicity correction, does not establish biomarker
> uniqueness or clinical validity, and does not replace the JAVELIN external-support
> evidence; the JAVELIN matched benchmark is highly extreme by interaction-HR direction
> but only mid-rank by p-value (frac p ≤ observed = 0.418), reflecting the fact that the
> external dataset's primary support comes from directional consistency rather than from
> a smaller p than randomly drawn five-gene sets.
