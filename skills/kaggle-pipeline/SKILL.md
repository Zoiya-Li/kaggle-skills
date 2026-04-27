---
name: kaggle-pipeline
description: "End-to-end Kaggle competition harness. Use when the user wants one top-level skill to run the full competition process, keep community intelligence and experiment logging active, and adapt the modeling route to the actual competition."
argument-hint: [competition-path-or-brief]
allowed-tools: Bash(*), Read, Write, Edit, Grep, Glob, Agent, Skill, WebSearch, WebFetch
---

# Kaggle Pipeline

Run the competition harness for: **$ARGUMENTS**

This is the only public entry point. Treat the other `kaggle-*` skills as internal modules unless the user explicitly asks for one.

Read `../kaggle-shared-references/artifact-contracts.md` before writing or updating artifacts.

## Core Rules

- Prefer native, built-in, or officially authenticated access paths for competition pages, rules, discussions, notebooks, and account-scoped resources.
- Do not bake machine-specific search stacks or private local tooling assumptions into the workflow.
- Do not use `curl`, ad hoc Bash scraping, or other improvised fetch paths as the default when cleaner native or official access exists.
- If the normally available native or official access path is unavailable in the current environment, say so explicitly and continue only from directly accessible sources or user-provided links.
- Treat credentials, API tokens, cookies, SSH passwords, and downloaded secrets as sensitive material. Do not copy them into artifacts, memory files, summaries, or long-lived notes. If a user pastes a secret, use it only for the immediate step and avoid reprinting it.
- Keep `kaggle/COMMUNITY_LOG.md` and `kaggle/EXPERIMENT_LOG.md` active throughout the competition.
- Resume from existing artifacts when possible.
- Default to autonomous execution. Do not stop for routine judgment calls.
- When uncertain, make the best provisional choice, record the assumption, and keep moving.
- Unless the user says otherwise, optimize for a first-place capable path rather than a merely respectable finish. Do not settle into incremental score farming once a branch is merely decent.
- Prefer a reversible branch plus written rationale over pausing to ask for permission.
- Continue autonomously unless the next move is irreversible, burns scarce external resources, or requires information only the user can provide.
- Treat analysis deliverables as progress markers, not stopping conditions.
- If the user asks for a strategy, first-round plan, baseline design, or roadmap inside an end-to-end run, produce it and then keep going unless the user explicitly says to stop there.
- Search often, read discussions often, and revisit external intelligence whenever a branch stalls, a surprising score appears, or a new high-upside idea is needed.
- For competitions where public leaderboard feedback is materially useful and budget permits, treat submission as a recurring learning loop rather than a one-off ceremony.
- At every major step, update:
  - **Current belief**
  - **Evidence**
  - **Main risk**
  - **Next bets**

## Truthfulness Rules

- Do not write `ready`, `blocked`, `verified`, `submitted`, `all tasks covered`, or similar status labels unless the evidence for that exact claim exists in the current run.
- Separate `verified`, `inferred`, and `assumed` facts in artifacts when they could be confused.
- Separate `first-hand`, `official`, `community`, and `your inference` when those evidence classes are mixed.
- If a page fetch returns only a title, shell output is partial, or a command path is untested, record that as a gap rather than upgrading it into a fact.
- When a new result conflicts with an earlier artifact, correct the artifact instead of layering a new optimistic summary on top.
- Do not promote a strategic branch from `promising` to `must pursue` until it has cleared a minimum viability check in your own environment or a clearly labeled external reproduction path.

## Auth And Access Diagnosis

- Do not conclude `token expired` or `API key invalid` from a single failing path.
- First isolate whether the failure comes from:
  - wrong auth mechanism or config path
  - missing environment propagation
  - endpoint- or command-specific behavior
  - account permissions or competition access
  - genuinely invalid credentials
- If one auth path works, do not keep a stale `blocked on auth` status without reconciling the contradiction.
- Treat the authenticated Kaggle account as a first-class execution resource, not just a submission identity. If the competition benefits from Kaggle notebooks, datasets, or free hosted GPU/TPU time, plan around those resources explicitly.
- Use Kaggle token or kaggle.json-based authentication to access competition data, submissions, and account-scoped Kaggle workflows from the user's authorized account.
- Track Kaggle-hosted compute availability, quota pressure, and notebook feasibility in `PIPELINE_STATE.md` when they matter to the strategy.
- Respect Kaggle platform rules and account limits. Do not assume multi-account quota rotation as a default strategy.

## Submission Artifact Audit

Before packaging or submitting, verify the official submission contract from the host rules:

- required file type or archive type
- exact naming rules
- schema or per-task contents
- directory layout inside the artifact
- size limits
- runtime, version, operator, or hardware constraints enforced by the validator

Before calling a submission artifact `ready`, verify all of the following from the actual output file:

- exact file count and naming convention
- missing expected entries
- unexpected extra entries
- compressed artifact size against the current limit
- whether the included models were locally verified, partially verified, or unverified

If coverage excludes known ignored tasks, state that explicitly and do not collapse it into `all tasks covered`.

When the competition format rewards iterative leaderboard learning, plan to submit repeatedly:

1. prepare a concrete hypothesis for what the next submission is meant to test
2. submit
3. verify official status and score
4. compare against the previous best and against the intended hypothesis
5. update the next branch choice from the result

Use submission slots as an active measurement channel, not just a final packaging step.

After consuming a Kaggle submission slot, do not treat CLI upload success as final success.
Before writing `submitted`, `ready`, `best LB`, or similar end-state labels, verify the latest official submission status from the Kaggle submissions page or an equivalent official status endpoint.
If the official status later shows processing failure, validator failure, or no valid score, correct the artifacts and logs instead of preserving the earlier optimistic wording.
If the official submission fails and budget remains, default to a repair loop:

1. map the failure to the official submission contract or validator constraint
2. isolate whether the bug is packaging, schema, runtime, dependency, or model-specific
3. fix the artifact or generation path
4. record the diagnosed cause and corrected candidate

Do not stop at "submission failed" unless budget, access, or time pressure makes further repair unreasonable.

## Resume Anchor Rule

- `kaggle/PIPELINE_STATE.md` is the primary resume anchor and must stay synchronized with the latest meaningful experimental reality.
- After a major pivot, blocker, failed reproduction, or new external dependency, update the stage, best-known status, and next bets before ending the run.
- Do not leave the state file describing a pre-pivot world after the project has already moved on.

## Flow

```text
/kaggle-community-intel
        ↓
/kaggle-read-problem
        ↓
/kaggle-eda
        ↓
/kaggle-cv-architect
        ↓
/kaggle-feature-loop
        ↓
/kaggle-pseudo-label   (only if earned)
        ↓
/kaggle-ensemble-lab   (late stage)
        ↓
/kaggle-finalizer
```

## Workflow

### 0. Initialize

- run `/kaggle-community-intel`
- create any missing artifacts from the contract
- record competition name, deadline, metric, current stage, and submission budget
- record whether Kaggle-hosted compute from the authenticated account is part of the execution plan, and which steps should prefer Kaggle notebooks over local or external GPUs

### 1. Model the problem

Run `/kaggle-read-problem`.

Do not move on until the brief explains:

- metric implications
- data or task structure
- likely traps
- first-pass win condition
- task interface and cheapest credible baseline

### 2. Run decision-oriented EDA

Run `/kaggle-eda`.

The result should change modeling or validation choices. If it does not, the EDA was decorative.

### 3. Lock validation

Run `/kaggle-cv-architect`.

This stage has veto power over reckless iteration, not over progress itself. If validation is still untrusted, run the minimum investigation needed, choose the least-wrong temporary protocol, record the risk, and continue with conservative experiments.

### 4. Run the middle game

Run `/kaggle-feature-loop`.

The implementation route depends on the competition, but the loop does not:

1. hypothesis
2. implementation
3. local validation
4. error analysis
5. decision

Choose the route from the problem brief, not from a favorite recipe.

### 5. Open optional branches only if earned

- `/kaggle-pseudo-label` only when validation is trusted, the branch is stable, and enough time remains
- `/kaggle-ensemble-lab` only when there are genuinely complementary candidates

### 6. Close the competition

Run `/kaggle-finalizer`.

Produce one primary submission and one hedge, both justified in terms of risk, not just local score.

## Completion Rule

The pipeline is not complete just because it has written:

- a strategy memo
- first-round deliverables
- a baseline proposal
- a 7-day plan
- risk analysis

Those are intermediate artifacts.

Unless the user explicitly asks to stop at analysis, continue into the next concrete executable step:

- environment setup
- code implementation
- baseline run
- reproduction attempt
- experiment launch
- notebook preparation
- submission preparation

Only stop when:

- the next action requires user-only information or access
- the next action is an actually risky irreversible move that meets escalation criteria
- the competition run has reached a natural execution boundary chosen by the user

## Gates

Before moving on, answer the smallest useful version of these questions:

- **Problem framing**: what kind of game is this, and what would falsify that view?
- **Validation trust**: can local evaluation steer us yet?
- **Iteration focus**: what is the highest-value branch right now?
- **Pseudo-label readiness**: does this branch add signal or just amplify mistakes?
- **Final risk**: which candidate is safest, and which one diversifies it?
- **Submission budget**: is this slot being spent to learn something important or just out of curiosity?
- **Time pressure**: should we still explore, or should we converge?
- **Upside gap**: what would have to be true for this branch to beat the current top leaderboard approach rather than merely improve our own score?
- **Submission cadence**: are we learning from the leaderboard often enough, or are we underusing available submission budget?

These gates are for self-control, not for asking the user to choose. Resolve them internally unless escalation is explicitly required by the rules below.

## Escalate Only When

- a Kaggle submission is about to be spent and the remaining daily budget is genuinely tight
- rules, leakage, external-data usage, or account restrictions create non-obvious compliance risk
- a required asset is inaccessible without the user, such as login-only discussion content or paid resources
- two branches differ so much in irreversible cost that choosing one would discard the other

Do not escalate for:

- normal baseline choice
- split choice among several imperfect CV schemes
- whether to run another local experiment
- whether to open a reversible modeling branch
