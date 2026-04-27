---
name: kaggle-pseudo-label
description: "Conditional pseudo-labeling for Kaggle competitions. Use when the branch is stable, evaluation-like unlabeled data is informative, and pseudo labels may add signal without overwhelming trusted validation."
argument-hint: [project-root-or-prediction-files]
allowed-tools: Bash(*), Read, Write, Edit, Grep, Glob, Skill
---

# Kaggle Pseudo-Label

Run pseudo-label gating for: **$ARGUMENTS**

Write `kaggle/PSEUDO_LABEL_PLAN.md` only if the branch earns it.

## Gate

Proceed only if:

- local validation is trusted
- the current branch is stable
- agreement or confidence is strong enough
- enough time remains before the deadline to validate the branch honestly

## Rule

- start with the highest-confidence slice, not the whole test set
- compare directly against the best non-pseudo branch
- require at least two independent prediction sources for agreement-style gating

## Guardrails

- Never use pseudo labels to rescue an untrusted pipeline.
- If gains vanish under stress tests, demote the branch.
- Near the deadline, default against opening a brand-new pseudo-label branch.
