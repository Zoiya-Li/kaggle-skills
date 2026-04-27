---
name: kaggle-finalizer
description: "Final submission preparation for Kaggle competitions. Use when the user wants a compact endgame process for post-processing, sanity checks, and choosing a primary submission plus a hedge."
argument-hint: [project-root-or-final-candidates]
allowed-tools: Bash(*), Read, Write, Edit, Grep, Glob, Skill
---

# Kaggle Finalizer

Finalize the competition for: **$ARGUMENTS**

Write `kaggle/FINAL_SUBMISSION_PLAN.md`.

## Do

- gather only credible finalists
- reject branches with unresolved leakage or validation concerns
- check `competition_deadline` and daily submission budget from `kaggle/PIPELINE_STATE.md`
- when budget allows, treat finalist selection as an iterative compare-and-submit process rather than assuming one final shot
- verify the official submission contract from the host rules before packaging or uploading
- apply only metric-aligned post-processing
- sanity-check prediction distributions and full-data retrains
- audit the exact submission artifact before calling it final

## Output

Produce:

- **Primary submission**: highest-confidence candidate
- **Hedge submission**: best non-redundant alternative

Explain both in terms of shake-up risk and whether they deserve an actual submission slot.

For every candidate artifact, state:

- verification status: `verified`, `partially verified`, or `unverified`
- exact file count
- missing expected entries
- unexpected extra entries
- compressed size vs limit
- any known blockers unrelated to model quality, such as auth or submission access
- official submission status, if a Kaggle slot was already used: `upload only`, `processing`, `scored`, or `failed`

## Guardrails

- Public LB leaders are not automatically safe finalists.
- When shake-up risk is high, prefer robustness over tiny local gains.
- Final choices must be reproducible from logged artifacts.
- Do not package or upload against a guessed schema. Reconcile the artifact against the official submission format, validator expectations, and platform-specific constraints first.
- Do not label a package `submission-ready` if its structure has not been audited directly.
- Do not let `CV: N/A` packages quietly inherit confidence from older verified packages.
- Do not treat `Successfully submitted` from the CLI as proof of a valid Kaggle result. A package only earns `submitted` or `best LB` status after the official submissions page or equivalent official status endpoint shows a successful processed submission with a valid score.
- If the latest official Kaggle submission status is `error`, `failed`, or otherwise unscored, record that explicitly and do not preserve older optimistic wording in the final plan.
- If the official submission fails, the default next action is to diagnose the failure against the official contract, fix the artifact or packaging bug, and prepare the next corrected candidate unless submission budget or access constraints make that impossible.
- When submission budget remains and leaderboard feedback is still informative, keep iterating through primary and hedge candidates instead of freezing prematurely on the first acceptable score.
- Only ask the user to confirm if an actual Kaggle submission slot is about to be consumed under meaningful uncertainty.
