# Operational Hygiene

Use this reference when a skill:

- writes long-lived artifacts or memory files,
- manages resumable project state,
- handles user-provided credentials or remote access,
- runs multi-step experiments or deployments,
- or makes strategy claims from mixed evidence.

This reference is intentionally general. It is about staying honest, resumable, and safe under real workflow pressure.

## 1. Core Principle

**Do not let workflow momentum upgrade weak evidence into strong claims.**

The most common failure mode is not one catastrophic bug. It is a sequence of small optimistic upgrades:

- inaccessible page → "probably contains X"
- community claim → "confirmed pattern"
- one failing command → "credentials invalid"
- partial artifact → "ready"
- old plan → "current state"

This document exists to interrupt that drift.

## 2. Evidence Classes

When facts come from mixed sources, label them.

Use these classes consistently:

- `official` — direct from the authoritative source
- `first-hand` — directly observed in the current run
- `community` — third-party report, public notebook, discussion, forum post, prior team write-up
- `inference` — your own synthesis, extrapolation, or best guess

### Rules

- Do not silently mix `community` and `official` evidence into one undifferentiated claim.
- Do not upgrade `community` to `official` just because several people repeat it.
- Do not upgrade `inference` to fact unless a later step verifies it.
- If access failed, say access failed. Do not summarize the page as if you read it.

## 3. Status Words Have Burdens

Certain words require direct support.

| Word | Minimum burden |
|------|----------------|
| `verified` | concrete validation result exists |
| `blocked` | blocker was isolated rather than guessed |
| `ready` | artifact or path was directly checked for the claimed use |
| `submitted` | official system shows the submission actually succeeded for its intended purpose |
| `complete` | required outputs exist and match the contract |
| `all covered` | known-required items are present, with exceptions stated explicitly |

### Rules

- If the exact burden is not met, downgrade the wording.
- Prefer `partially verified`, `candidate`, `provisional`, `unverified`, or `ready pending X`.
- Do not reuse a stronger status from an earlier artifact on a newer one that has not earned it.
- For hosted platforms, distinguish `upload accepted` from `submission processed successfully`. The latter is the burden for `submitted`, `best score`, or similar outcome claims.

## 4. Resume Anchor Discipline

Every long-running workflow should have a small number of files that future runs trust.

These files must describe the **current world**, not the best previous story.

### Update the resume anchor when:

- the main branch or strategy changed,
- a key hypothesis was falsified,
- a blocker was resolved or replaced,
- the best-known artifact changed,
- or a new dependency became critical.

### Avoid

- leaving the state file in a pre-pivot state,
- storing a favorite plan instead of the latest experimentally grounded reality,
- forcing later runs to reconstruct the truth from chat history.

## 5. Secrets And Access Hygiene

Credentials are not normal text.

Treat as sensitive:

- API tokens
- cookies
- passwords
- SSH commands containing secrets
- downloaded key files
- environment variables containing secrets

### Rules

- Use secrets only for the immediate task that requires them.
- Do not write secrets into long-lived artifacts, memory, summaries, trackers, or recovery notes.
- Do not paste full secrets back to the user unless they explicitly ask and the workflow truly requires it.
- If a command must include a secret, avoid duplicating that command in multiple files or logs.
- If the user supplied plaintext secrets, proceed carefully but do not normalize that into reusable documentation.

## 6. Authentication Diagnosis

A failing auth path is not automatically a bad credential.

Before concluding `expired`, `invalid`, or `must regenerate`, isolate which of these is failing:

- wrong auth mechanism
- wrong config file or environment variable path
- environment propagation
- endpoint-specific permissions
- account access restrictions
- truly invalid credentials

### Rule

If one path succeeds, reconcile that before preserving any `auth blocked` status anywhere else.

## 7. Strategy Claims

Prior work, prior years, and external reproductions are useful, but they are not the same as present-run validation.

### Rules

- Separate `suggestive` from `validated`.
- Do not turn a literature pattern into `must pursue` until your own path clears a minimum viability check.
- When a strategic branch repeatedly fails basic viability, downgrade it explicitly rather than preserving stale optimism.

## 8. Experiment Logging

Experiment logs are only useful if later agents can tell what really happened.

### Rules

- Experiment IDs must be unique within a project.
- Do not reuse one experiment ID for materially different runs.
- Record what changed, what was actually measured, and what remained unverified.
- Distinguish between:
  - result files that exist,
  - processes that are still running,
  - and plans that were never executed.

## 9. Artifact Claims

If an artifact is intended for downstream use, inspect the artifact itself.

Examples:

- submission package → file count, names, missing entries, extra entries, compressed size
- dataset export → row count, schema, date range
- model bundle → weights present, config present, load path tested
- report → required sections present, references resolved

### Rule

Do not describe an artifact from the script that was supposed to create it. Describe it from the artifact that actually exists.

## 10. Preferred Language

When certainty is limited, prefer language like:

- `first-hand result`
- `officially stated`
- `community-reported`
- `inferred from`
- `provisional`
- `unverified`
- `ready pending`
- `blocked on suspected X; not yet isolated`

This is not hedging for its own sake. It is operational accuracy.
