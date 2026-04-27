---
name: kaggle-eda
description: "Action-oriented EDA for Kaggle competitions. Use when the user wants analysis that changes modeling, validation, or representation priorities instead of decorative plots."
argument-hint: [data-path-or-project-root]
allowed-tools: Bash(*), Read, Write, Edit, Grep, Glob, Agent
---

# Kaggle EDA

Run decision-oriented EDA for: **$ARGUMENTS**

Write:

- `kaggle/EDA_FINDINGS.md`
- `kaggle/FEATURE_IDEA_QUEUE.md`

## Check

- target behavior: skew, imbalance, tails, transforms
- train/test shift: adversarial validation when feasible
- missingness: whether it is predictive, structured, or dangerous
- leakage and time structure
- identifiers, redundancy, or artifacts that can poison preprocessing or validation

## Output Contract

`kaggle/EDA_FINDINGS.md` should separate:

- observation
- interpretation
- action implication

`kaggle/FEATURE_IDEA_QUEUE.md` should rank ideas by:

- expected upside
- cost
- leakage risk
- dependence on trusted validation

## Guardrails

- If the analysis does not change a modeling decision, it is too weak.
- If adversarial validation is high, escalate it to `/kaggle-cv-architect` immediately.
- Do not recommend target-derived transforms without leakage-safe execution.
