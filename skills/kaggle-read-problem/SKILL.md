---
name: kaggle-read-problem
description: "Read and model a Kaggle competition before touching implementation. Use when the user wants to understand the metric, task interface, data structure, traps, and likely win condition."
argument-hint: [competition-url-or-path]
allowed-tools: Bash(*), Read, Write, Edit, Grep, Glob, Skill, WebSearch, WebFetch
---

# Kaggle Read Problem

Understand the competition at: **$ARGUMENTS**

Write `kaggle/PROBLEM_BRIEF.md`.

Prefer native, built-in, or officially authenticated access paths for routine competition reading. Do not substitute `curl`, Bash scraping, or machine-specific search tooling when cleaner native or official access exists.
If community context has not been reviewed yet, invoke `/kaggle-community-intel`.

## Answer These

- What is the official metric, and what behavior does it reward?
- What is the actual task interface: rows, documents, images, grids, rankings, decisions, simulations, or something else?
- What is the official submission contract: file type, file names, archive structure, schema, required metadata, size limits, runtime or operator constraints, and validator-specific rules?
- What structure matters: joins, groups, time, duplication, candidate sets, or hidden evaluation quirks?
- What are the likely traps: leakage, duplicates, suspicious IDs, proxy labels, or host-specific quirks?
- What is the cheapest credible baseline?
- Is this mainly a feature game, validation game, model game, ensemble game, or hybrid?

## Output

`kaggle/PROBLEM_BRIEF.md` should include:

- task type
- target or prediction object
- metric and implications
- official submission contract and non-negotiable format rules
- data or task structure
- known traps
- initial win-condition belief
- early improvement hypotheses
- first 3 investigations

When citing external approaches or prior-year winners, separate:

- what they achieved
- what evidence you actually read
- what is merely suggestive for the current competition

## Guardrails

- Do not confuse docs with actual data behavior.
- Do not build a submission path until you have read the official submission requirements and identified the exact acceptance contract.
- Do not overfit to one discussion thread.
- If the competition style is still unclear, say `unclear` and name the missing evidence.
- Do not force every competition into a row-wise supervised-learning template.
- If some competition detail is ambiguous but not blocking, write the ambiguity down and continue with the strongest working model instead of pausing.
- Mark which problem facts are directly verified from official or first-hand sources and which are inferred from community evidence.
- Do not collapse cross-year or cross-benchmark analogies into a hard commitment on the current year's winning strategy.
- If submission requirements include validators, archive structure, naming rules, runtime limits, or operator/version restrictions, treat them as first-class problem constraints rather than late-stage packaging details.
