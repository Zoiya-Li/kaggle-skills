---
name: kaggle-ensemble-lab
description: "Late-stage ensembling for Kaggle competitions. Use when the user has multiple credible candidates and wants to compare OOF complementarity, prediction correlation, weighted blends, rank averages, or simple stacking while prioritizing diversity over single-branch ego."
argument-hint: [project-root-or-oof-paths]
allowed-tools: Bash(*), Read, Write, Edit, Grep, Glob, Skill
---

# Kaggle Ensemble Lab

Build and evaluate ensembles for: **$ARGUMENTS**

Write:

- `kaggle/ENSEMBLE_REPORT.md`
- optional blended outputs in `kaggle/submissions/`

This is a late-game skill. Its question is simple: which combination makes different mistakes in useful ways?

## Do

- build the pool from credible, non-redundant candidates
- check complementarity with OOF correlation, qualitative error overlap, and stability
- start with weighted average, then rank average, then simple stacking only if justified
- search blend weights on OOF when multiple strong candidates exist
- record components, rationale, local result, and whether the blend deserves finalist status

## Guardrails

- Diversity beats tiny single-model score deltas
- Do not ensemble weak or untrusted branches just to feel comprehensive
- Do not let a slightly stronger but highly redundant model crowd out a useful hedge candidate
- As the deadline gets close, prefer ensembles that are easy to justify and reproduce over clever but under-validated blends
