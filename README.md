# kaggle-skills

Skills for Claude Code that help you get to strong Kaggle results faster.

This repo is built around one idea: less glue work, fewer confused submission loops, and a more direct path from competition brief to real leaderboard progress.

## What You Get

- a full Kaggle workflow, from rule-reading to final submission
- discussion and community mining
- experiment and submission loops
- state files and artifact discipline for long sessions

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

## Project Setup

Before you start a competition, set up two things:

1. a project-level `CLAUDE.md`
2. a good `/kaggle-pipeline` prompt

### `CLAUDE.md`

Use this template as the starting point for project context:

- `skills/kaggle-shared-references/README.md`

That template is meant to hold:

- local and remote paths
- Kaggle auth locations such as `KAGGLE_API_TOKEN` or `~/.kaggle/kaggle.json`
- server aliases and run conventions
- submission contract notes
- experiment log locations

Write how to access secrets, not the secret values themselves.

### Pipeline Prompt

Do not start with a one-line prompt like "do this competition".

A good `/kaggle-pipeline` prompt should usually include:

- the competition URL
- the real goal, including whether you want a safe baseline or a first-place path
- compute constraints such as local-only, Kaggle GPU, or external GPU
- hard rules around searching, discussion reading, submission verification, and artifact updates
- the first files you expect the agent to create under `kaggle/`

Minimal example:

```text
/kaggle-pipeline "
competition_url: https://www.kaggle.com/competitions/your-competition

goal:
- build a strong baseline first
- then iterate toward a leaderboard-winning path

hard_constraints:
- verify official rules, metric, data layout, and submission format first
- read discussion and public notebooks aggressively, but mark gaps honestly
- treat submissions as experiments, not ceremony

local_compute:
- local machine: Apple Silicon M2
- use Kaggle hosted GPU when local compute is not enough

first_deliverables:
- kaggle/PROBLEM_BRIEF.md
- kaggle/COMMUNITY_LOG.md
- kaggle/PIPELINE_STATE.md
- kaggle/EXPERIMENT_LOG.md
- kaggle/ERROR_ANALYSIS.md
"
```

## Start Here

If you only care about Kaggle, read these first:

- `skills/kaggle-pipeline/SKILL.md`
- `skills/kaggle-community-intel/SKILL.md`
- `skills/kaggle-feature-loop/SKILL.md`
- `skills/kaggle-finalizer/SKILL.md`

If you want to understand the workflow style behind the repo:

- `skills/shared-references/operational-hygiene.md`

## Included Skills

- `kaggle-pipeline`
- `kaggle-community-intel`
- `kaggle-read-problem`
- `kaggle-eda`
- `kaggle-cv-architect`
- `kaggle-feature-loop`
- `kaggle-pseudo-label`
- `kaggle-ensemble-lab`
- `kaggle-finalizer`
- `shared-references/operational-hygiene.md`

Full index: [catalog.md](./catalog.md)

## GitHub Description

`Open Kaggle skill pack for Claude Code, focused on leaderboard iteration, submission discipline, and practical workflow structure.`

## License

MIT. See [LICENSE](./LICENSE).
