# kaggle-skills

Open skill pack for Claude Code, focused on Kaggle workflows and adjacent research / experiment tasks.

## What This Repo Is

This repo is a cleaned export of a personal skill library. The center of gravity is Kaggle:

- reading rules and discussions
- planning a competition strategy
- running experiment loops
- managing submissions
- keeping state files and logs usable across long sessions

It also includes research, experiment, and writing skills that are useful around the same workflow.

If you want a short mental model:

- `kaggle-*` = competition workflow
- `research-*` = idea / review / planning workflow
- `run-experiment` / `monitor-experiment` = execution workflow
- `shared-references/*` = house rules for evidence, state, and artifact hygiene

## Install

Clone the repo:

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

The installer copies `skills/` into the target directory. It does not delete existing skills.

## Best Starting Points

If you only want the Kaggle part, start here:

- `skills/kaggle-pipeline/SKILL.md`
- `skills/kaggle-community-intel/SKILL.md`
- `skills/kaggle-feature-loop/SKILL.md`
- `skills/kaggle-finalizer/SKILL.md`
- `skills/kaggle-shared-references/artifact-contracts.md`

If you want the general workflow style first, read:

- `skills/shared-references/operational-hygiene.md`

If you want experiment execution:

- `skills/run-experiment/SKILL.md`
- `skills/monitor-experiment/SKILL.md`

## Skill Groups

### Kaggle

- end-to-end competition harness
- community intelligence
- problem reading
- EDA
- CV design
- feature / experiment loop
- pseudo-labeling
- ensembling
- final submission planning

### Research

- idea discovery
- novelty checking
- experiment planning
- result-to-claim review
- autonomous review loops

### Writing

- paper planning
- drafting
- figure generation
- slides / poster generation
- compile and improvement loops

### Execution

- local / remote experiment launch
- monitoring
- profiling
- GPU workflow helpers

See [catalog.md](./catalog.md) for the full index.

## What Is Opinionated Here

These skills are not neutral.

They assume that agents should:

- keep resumable artifacts
- separate official / first-hand / community / inferred evidence
- avoid calling something `ready` or `submitted` without checking
- use submissions and experiments as explicit feedback loops
- update project state instead of forcing later sessions to reconstruct context from chat history

If you do not want that style, you will probably want to edit the skills before using them heavily.

## Optional Dependencies

Some skills mention optional integrations:

- Kaggle CLI
- W&B
- Feishu / Lark
- Vast.ai
- Modal
- external LLM APIs

They are not required for the whole repo to be useful.

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

Short version for the GitHub repo description:

`Open skill pack for Claude Code, focused on Kaggle workflows, experiment loops, and practical research execution.`

## License

MIT. See [LICENSE](./LICENSE).
