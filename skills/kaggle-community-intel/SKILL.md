---
name: kaggle-community-intel
description: "Continuous Kaggle community intelligence for competitions. Use when the user wants discussion tracking, rule clarifications, leakage warnings, and leaderboard-risk signals throughout a competition."
argument-hint: [competition-url-or-name]
allowed-tools: Bash(*), Read, Write, Edit, Grep, Glob, WebSearch, WebFetch
---

# Kaggle Community Intelligence

Track competition intelligence for: **$ARGUMENTS**

Write `kaggle/COMMUNITY_LOG.md`.

This is a background line, not a one-shot search.
Run it aggressively enough that the project does not drift away from the competition frontier.

## Focus

- canonical pages: overview, evaluation, data, rules, discussions
- host comments and highly upvoted threads
- novel solution hints, architecture ideas, and compression tricks surfaced in discussions or notebooks
- leakage warnings
- validation warnings
- rule clarifications
- shake-up or leaderboard-risk signals

For Kaggle discussions and notebooks, prefer an authenticated official Kaggle access path when one is available through the current environment, because public fetches often see only shell pages.
Treat `KAGGLE_API_TOKEN` or `~/.kaggle/kaggle.json` as a first-class clue that Kaggle-authenticated access may be part of the workflow, not just submissions.
Do not assume the Kaggle CLI or API can always return full discussion bodies. Verify what the authenticated path can actually read in the current environment before relying on it.
Use the normal native discovery and page-reading path as the fallback layer. Do not substitute `curl`, Bash scraping, or machine-specific search tooling for routine discovery.
If native access, authenticated Kaggle access, or the normal page-reading path is unavailable, stop pretending discovery is complete, record the gap, and ask the user for direct links or pasted content.
If a Kaggle or notebook page is JS-rendered and fetch returns only a title or shell page, record it as inaccessible through the current tool path rather than treating it as reviewed.

## For Each Finding

Record:

- type: `rules`, `leakage`, `validation`, `feature_hint`, `model_hint`, `leaderboard_risk`, or `noise`
- confidence: `high`, `medium`, or `low`
- evidence class: `official`, `first-hand`, `community`, or `inference`
- source
- signal
- why it matters
- action

## Guardrails

- Do not mistake speculation for ground truth.
- Do not let one anecdotal public-LB post overrule validation evidence.
- Keep the log compact and refresh it at the start, before major CV changes, before risky branches, after surprising leaderboard movement, and near the deadline.
- Treat discussion mining as a standing source of hypotheses. Look for reusable primitives, constraints, failure reports, and unexpected design ideas, not just rule clarifications.
- When a discussion or notebook hint looks genuinely high-upside, turn it into a concrete next experiment or explicit watch item rather than leaving it as passive reading.
- Distinguish host statements, direct page contents, competitor claims, and your own inference.
