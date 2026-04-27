---
name: kaggle-feature-loop
description: "Hypothesis-driven baseline, improvement, and error-analysis loop for Kaggle competitions. Use when the user wants disciplined iteration built around validation evidence instead of random tuning."
argument-hint: [project-root]
allowed-tools: Bash(*), Read, Write, Edit, Grep, Glob, Skill, Agent
---

# Kaggle Feature Loop

Iterate on the competition at: **$ARGUMENTS**

Write continuously to:

- `kaggle/EXPERIMENT_LOG.md`
- `kaggle/ERROR_ANALYSIS.md`

## Loop

Every cycle must contain:

1. hypothesis
2. implementation
3. local validation
4. error analysis
5. decision

When public leaderboard feedback is relevant and submission budget is healthy, allow the loop to include a submission-backed cycle:

1. hypothesis
2. implementation
3. local validation
4. official submission
5. leaderboard or validator feedback
6. error analysis
7. decision

At least one question in the cycle must explicitly target upside:

- why could this branch beat the current project best?
- why could this branch beat the apparent leaderboard frontier?
- what structural edge does it pursue that ordinary score-chasing tweaks do not?

## Baseline Rule

Start with the cheapest credible baseline for the actual task, not with the fanciest idea.

The route depends on the problem brief:

- table-heavy tasks may favor joins, aggregations, encodings, or temporal features
- text tasks may favor preprocessing, retrieval, truncation, pooling, or fine-tuning
- image tasks may favor augmentation, sampling, backbone choice, or resolution
- reasoning or search tasks may favor candidate generation, retrieval, verifier quality, or pass@k strategy

Use the task, not habit, to choose the branch.

## Error Analysis Rule

After meaningful runs, inspect the worst errors and ask whether they cluster by:

- group
- time
- hard slice
- target magnitude
- missingness or artifact pattern

Turn the answer into the next experiment.

At minimum, record:

- top-N worst examples
- grouped error summaries over important cohorts
- the next concrete change implied by the analysis

## Time Rule

As `competition_deadline` approaches, shift from exploration to consolidation. New branches need stronger justification.

## Guardrails

- Do not tune broadly on top of weak validation.
- Do not add leakage-prone transforms or pseudo-labels casually.
- Prefer informative experiments over tiny score-chasing tweaks.
- Prefer experiments with asymmetric upside over comfort-zone iterations once a competent baseline already exists.
- If submission feedback is one of the fastest ways to falsify a branch, use it repeatedly and deliberately instead of waiting too long for perfect local certainty.
- When two branches are similarly strong but fail differently, mark them as ensemble candidates.
- Keep the loop autonomous: pick the next highest-value reversible experiment, record why, and run it instead of asking the user to choose routine directions.
- Do not let an unverified blended artifact inherit the confidence of a previously verified smaller artifact.
- If an experiment produces a submission package, audit the package contents before using its file count or coverage in later decisions.
- If a strategic branch keeps failing basic viability checks, downgrade the branch explicitly in the logs instead of preserving the earlier optimism.
- When a pivot happens, update both `EXPERIMENT_LOG.md` and `PIPELINE_STATE.md` so later runs do not resume from a stale thesis.
- If the loop becomes locally competent but strategically stagnant, pull in fresh community intelligence and re-open higher-upside branches instead of polishing the same idea indefinitely.
- Do not spam identical retries. Re-submit only when the new submission tests a changed artifact, a changed hypothesis, a repaired failure mode, or a deliberate timing/cadence decision.
