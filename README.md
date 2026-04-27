# kaggle-skills

Skills for Claude Code that help you get to strong Kaggle results faster.

This repo is built around one idea: less glue work, fewer confused submission loops, and a more direct path from competition brief to real leaderboard progress.

## What You Get

- a full Kaggle workflow, from rule-reading to final submission
- discussion and community mining
- experiment and submission loops
- state files and artifact discipline for long sessions
- optional research / experiment / writing skills around the same stack

## Install

```bash
git clone https://github.com/Zoiya-Li/kaggle-skills.git
cd kaggle-skills
```

Install into Claude Code:

```bash
bash install.sh --claude
```

Install into Codex-style skills:

```bash
bash install.sh --codex
```

Install into a custom path:

```bash
bash install.sh --target /path/to/skills
```

## Start Here

If you only care about Kaggle, read these first:

- `skills/kaggle-pipeline/SKILL.md`
- `skills/kaggle-community-intel/SKILL.md`
- `skills/kaggle-feature-loop/SKILL.md`
- `skills/kaggle-finalizer/SKILL.md`

If you want to understand the workflow style behind the repo:

- `skills/shared-references/operational-hygiene.md`

## Main Skill Groups

### Kaggle

- `kaggle-pipeline`
- `kaggle-community-intel`
- `kaggle-read-problem`
- `kaggle-eda`
- `kaggle-cv-architect`
- `kaggle-feature-loop`
- `kaggle-pseudo-label`
- `kaggle-ensemble-lab`
- `kaggle-finalizer`

### Execution

- `run-experiment`
- `monitor-experiment`
- `training-check`
- `system-profile`
- `vast-gpu`
- `serverless-modal`

### Research

- `idea-discovery`
- `research-pipeline`
- `research-refine`
- `experiment-plan`
- `result-to-claim`
- `research-review`

### Writing

- `paper-writing`
- `paper-plan`
- `paper-write`
- `paper-figure`
- `paper-slides`
- `paper-poster`

Full index: [catalog.md](./catalog.md)

## What Is Opinionated Here

These skills assume that agents should:

- keep resumable state
- separate official / first-hand / community / inferred evidence
- treat submissions as feedback loops, not ceremony
- avoid calling things `ready` or `submitted` without checking
- update artifacts so future sessions do not have to reconstruct context from chat history

If you do not want that style, you will probably want to edit the skills before using them heavily.

## Optional Dependencies

Some skills mention optional integrations:

- Kaggle CLI
- W&B
- Feishu / Lark
- Vast.ai
- Modal
- external LLM APIs

They are optional. The repo is still useful without all of them.

## Repo Layout

```text
.
├── README.md
├── catalog.md
├── CONTRIBUTING.md
├── LICENSE
├── install.sh
└── skills/
```

## GitHub Description

`Open skill pack for Claude Code, focused on Kaggle workflows, experiment loops, and practical research execution.`

## License

MIT. See [LICENSE](./LICENSE).
