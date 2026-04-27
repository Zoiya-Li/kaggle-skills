# Kaggle Artifact Contracts

Use these file contracts across the Kaggle skill pack.

## Required Files

### `kaggle/PROBLEM_BRIEF.md`

Must capture:

- competition name
- task type
- target
- metric and metric implications
- official submission contract, including any required schema, archive layout, naming, size limits, runtime limits, or validator constraints
- data grain and join structure
- known traps
- initial win-condition belief

### `kaggle/COMMUNITY_LOG.md`

Append-only intelligence log:

- source
- signal
- confidence
- action implication

When discovery is incomplete, log the gap explicitly. Do not upgrade title-only fetches, inaccessible JS pages, or second-hand summaries into confirmed facts.
Prefer concise evidence tags such as `official`, `first-hand experiment`, `community claim`, or `inference`.

### `kaggle/EDA_FINDINGS.md`

Must separate:

- observation
- interpretation
- modeling implication

### `kaggle/FEATURE_IDEA_QUEUE.md`

Rank ideas by:

- expected upside
- cost
- leakage risk
- CV dependency

### `kaggle/CV_DECISION.md`

Must include:

- candidate schemes
- chosen scheme
- trust rating
- unresolved risks

### `kaggle/EXPERIMENT_LOG.md`

Each meaningful experiment records:

- ID
- hypothesis
- change
- local CV
- LB if submitted
- artifact paths
- conclusion

If a candidate artifact is produced, also record:

- verification status
- exact artifact contents if material to submission correctness
- blockers proven in this run vs suspected blockers
- official Kaggle submission status if a submission slot was spent, such as `upload only`, `processing`, `scored`, or `failed`
- if submission failed, the diagnosed contract violation or packaging/runtime error and the planned fix

Experiment IDs must be unique and monotonic within a project.
Do not reuse `EXP-009` for multiple materially different experiments. Use suffixes only for tightly related follow-ups when the relationship is obvious, such as `EXP-009a`, `EXP-009b`.

Recommended entry shape:

```markdown
## EXP-017
- Date:
- Stage:
- Hypothesis:
- Change:
- CV:
- LB:
- Artifacts:
- Conclusion:
- Next action:
```

### `kaggle/ERROR_ANALYSIS.md`

Use this to capture systematic error patterns, not vague impressions.

### `kaggle/PIPELINE_STATE.md`

This is the resume anchor for the whole harness. Keep a fixed schema so later runs can continue instead of rebuilding state from scratch.

Required fields:

```markdown
# Pipeline State

- Competition:
- Competition deadline:
- Modality:
- Current stage:
- Stage status:

## Gates
- Gate A Problem Framing:
- Gate B Validation Trust:
- Gate C Iteration Focus:
- Gate D Pseudo-Label Readiness:
- Gate E Final Submission Risk:
- Gate F Submission Budget:
- Gate G Time Pressure:

## Current Best
- Best CV:
- Best LB:
- Best branch:
- Best artifact status:
- Last materially verified step:

## Strategy
- Current belief:
- Evidence:
- Main risk:
- Next bets:

## Submission Budget
- Daily limit:
- Used today:
- Remaining today:
- Last updated:
- Source: user-provided | manually tracked
```

If some values are unknown, mark them explicitly as `unknown` rather than omitting them.

Status labels must be evidence-backed:

- `ready` means the artifact or branch was directly checked for the claims being made
- `blocked` means the blocking condition was isolated rather than guessed
- `verified` means there is a concrete validation result in the current or clearly cited prior run
- `submitted` means the official Kaggle submission status shows a successful processed submission, not merely that the CLI upload command returned success
- `best LB` means there is an official scored Kaggle submission for that artifact or branch

Do not write `all tasks covered` when the true status is `all scorable tasks covered`, `all known-required tasks covered`, or `covered except X`.
Do not carry forward `submitted` or `best LB` from CLI output alone if the official submissions page later shows `error`, `failed`, or no valid score.
If an official submission fails, update the state file to reflect the failure mode and the next repair step instead of leaving the branch in a generic `ready` state.

`PIPELINE_STATE.md` should describe the current world, not a favorite plan from earlier in the run.
If the team has pivoted branches, hit a hard blocker, or falsified a previous thesis, reflect that change explicitly.

## Naming Suggestions

- `EXP-001`, `EXP-002`, ...
- `oof/exp_001_oof.parquet`
- `submissions/exp_001_submission.csv`
- `models/exp_001/`

## Quality Bar

An artifact is good only if another agent can resume from it without re-reading the full conversation.
