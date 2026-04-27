---
name: kaggle-cv-architect
description: "Design and stress-test local validation for Kaggle competitions. Use when the user needs to know whether local evaluation is trustworthy enough to steer the rest of the competition."
argument-hint: [project-root-or-competition-brief]
allowed-tools: Bash(*), Read, Write, Edit, Grep, Glob, Skill, Agent
---

# Kaggle CV Architect

Design and validate local evaluation for: **$ARGUMENTS**

Write `kaggle/CV_DECISION.md`.

This stage decides whether iteration is grounded or delusional.

## Do

- enumerate only the split families that fit the task
- state what each split assumes
- state what each split protects against
- state what each split still misses
- check for validation killers: groups, latent time, leakage, duplicates, metric mistakes, severe train/test shift
- compare local ordering against public LB when enough submissions exist

## Output

`kaggle/CV_DECISION.md` must contain:

- candidate schemes
- rejected schemes and why
- chosen primary scheme
- optional stress-test scheme
- trust rating: `trusted`, `usable with caution`, or `untrusted`
- unresolved risks

## Guardrails

- Conventional is not the same as correct.
- If trust is below `usable with caution`, do not greenlight aggressive iteration, but do keep progressing through conservative baselines and stress tests.
- If CV and LB disagree, investigate before moving on to expensive branches, but do not halt the pipeline waiting for certainty.
