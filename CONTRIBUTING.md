# Contributing

Thanks for contributing.

This repository is a skill pack, not a conventional software library, so good contributions usually improve one of three things:

- the quality of a skill workflow
- the clarity of documentation or installability
- the discipline and resumability of long-running agent behavior

## What Makes a Good Contribution

- Better structure for a real workflow
- Clearer failure handling
- Stronger evidence discipline
- More reusable templates or shared references
- Better installation or onboarding experience
- Cleaner separation between optional integrations and core behavior

## What To Avoid

- Hardcoding real credentials
- Baking in machine-specific paths unless clearly marked as examples
- Adding workflow complexity that does not clearly improve outcomes
- Turning a focused skill into a vague general-purpose essay
- Copying local caches or dependency folders into the repo

## Repository Conventions

- Core skill files live under `skills/<skill-name>/SKILL.md`
- Shared cross-skill guidance lives under `skills/shared-references/`
- Kaggle-specific references live under `skills/kaggle-shared-references/`
- Keep text files plain and readable
- Prefer ASCII unless the file already uses another character set intentionally

## Editing Guidance

- Preserve the tone and level of specificity already used in the skill pack
- Keep workflows practical
- If a skill depends on an optional tool or service, say so explicitly
- If a change introduces a new artifact, explain why that artifact helps later runs resume cleanly
- If a status word like `ready`, `verified`, or `submitted` appears, be precise about its burden

## Testing Changes

This repository does not currently have an automated test suite.

Before opening a PR, at minimum:

1. Read the changed file end to end for coherence
2. Search for obvious private-path or secret leaks
3. Check cross-references and relative paths
4. Make sure example commands are still sensible

## Suggested PR Scope

Prefer smaller PRs such as:

- one skill improvement
- one shared reference improvement
- one installation / documentation improvement
- one new skill with supporting references

## Security And Privacy

If you notice something that looks like a secret, private integration detail, or local-only artifact that should not be public, please open an issue or PR to remove or generalize it before wider release.
