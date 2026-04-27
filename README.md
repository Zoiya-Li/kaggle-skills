# Claude Skills Open

An open skill pack for Claude Code / Codex-style local agents.

> Competition pipelines, research workflows, experiment loops, and writing systems for agents that need to do real work.

This repository is a cleaned export of a working skill library focused on real project execution rather than one-off demos. It is designed for people who want reusable local-agent workflows for competitions, research, experiments, writing, and operational discipline.

Core themes:

- Kaggle pipelines
- research ideation and review
- experiment execution and monitoring
- paper writing and figure generation
- shared operational hygiene for long-running agent workflows

The goal is not just to provide isolated prompts, but to provide reusable, composable execution skills with:

- resumable artifacts
- evidence discipline
- submission and experiment loops
- optional hosted compute workflows
- practical research and competition scaffolding
- explicit failure and recovery patterns

## Why This Repository Exists

Most prompt collections are good at giving a model a nicer starting instruction.

This repository is trying to solve a harder problem: how to make local coding agents more reliable across long, messy, multi-step projects where they need to:

- keep state across runs
- write and update artifacts
- search, compare, and revise hypotheses
- use submissions and experiments as feedback loops
- recover from failures without losing the thread

The result is a skill pack that is closer to a workflow operating system than a bag of prompts.

## Philosophy

These skills are opinionated.

They favor:

- doing real work over stopping at analysis
- keeping long-running projects resumable
- labeling evidence carefully instead of drifting into optimistic claims
- using artifacts, logs, and state files as first-class coordination tools
- balancing ambitious exploration with concrete execution loops

In other words, this pack tries to make local agents more useful on messy, multi-step projects where a single good answer is less important than sustained progress.

## What Is Included

- `skills/`: the skill pack itself
- `skills/shared-references/`: reusable cross-skill guidance
- `skills/kaggle-shared-references/`: Kaggle-specific references and templates

Current export size:

- `58` primary `SKILL.md` skills
- plus shared references, templates, and support files

See [catalog.md](./catalog.md) for a categorized index.

## Who This Is For

This repository is most useful if you:

- run Claude Code or a similar local coding agent regularly
- want repeatable workflows for Kaggle or ML experimentation
- do research or paper writing with iterative review loops
- care about keeping experiments, state, and decisions organized

It is less useful if you only want a few tiny standalone prompts with no file or workflow conventions.

## Highlights

### Kaggle

- end-to-end competition harness
- community intelligence and discussion mining
- CV design, feature loops, pseudo-labeling, ensembling, finalization
- artifact auditing, submission loops, and leaderboard-aware iteration

### Research

- idea discovery
- novelty checking
- experiment planning
- implementation bridge
- result-to-claim review
- autonomous review loops

### Writing

- paper planning
- section drafting
- figure generation
- poster and slide generation
- compile and polish loops

### Execution

- local / remote experiment launch
- monitoring
- GPU workflow helpers
- system profiling

## Featured Workflows

### Kaggle Competition Harness

Start from rules and community signals, move through problem framing and validation design, iterate with disciplined experiment loops, and finish with audited submissions.

Relevant entry points:

- `skills/kaggle-pipeline/SKILL.md`
- `skills/kaggle-community-intel/SKILL.md`
- `skills/kaggle-feature-loop/SKILL.md`
- `skills/kaggle-finalizer/SKILL.md`

### End-to-End Research Pipeline

Move from idea discovery to novelty checking, experiment planning, implementation, result review, and paper writing.

Relevant entry points:

- `skills/research-pipeline/SKILL.md`
- `skills/idea-discovery/SKILL.md`
- `skills/experiment-plan/SKILL.md`
- `skills/result-to-claim/SKILL.md`

### Experiment Execution And Monitoring

Run local or remote experiments, watch them, collect outputs, and keep the project resumable.

Relevant entry points:

- `skills/run-experiment/SKILL.md`
- `skills/monitor-experiment/SKILL.md`
- `skills/training-check/SKILL.md`
- `skills/shared-references/operational-hygiene.md`

## Quick Start

Clone the repository and install it into your preferred local agent skills directory.

### Claude Code

```bash
git clone <your-repo-url>
cd claude-skills-open
bash install.sh --claude
```

### Codex-style Skills

```bash
git clone <your-repo-url>
cd claude-skills-open
bash install.sh --codex
```

After installation, restart the client if needed so the new skills are re-indexed.

## Installation

### Option 1: Install into Claude Code

```bash
bash install.sh --claude
```

This copies the repository's `skills/` contents into:

```bash
~/.claude/skills
```

### Option 2: Install into Codex-style skills

```bash
bash install.sh --codex
```

This copies the repository's `skills/` contents into:

```bash
~/.codex/skills
```

### Option 3: Custom destination

```bash
bash install.sh --target /path/to/skills
```

The installer copies the contents of `skills/` into the chosen destination. It does not delete existing skills.

## Suggested Starting Points

If you want to explore the pack quickly, these are good entry points:

- `skills/kaggle-pipeline/SKILL.md`
- `skills/research-pipeline/SKILL.md`
- `skills/run-experiment/SKILL.md`
- `skills/paper-writing/SKILL.md`
- `skills/shared-references/operational-hygiene.md`

If you want the shortest route to understanding the style of the repo, start with:

1. `skills/shared-references/operational-hygiene.md`
2. `skills/kaggle-pipeline/SKILL.md`
3. `skills/research-pipeline/SKILL.md`

## Design Notes

- Skills are written to be useful in real projects, not just demos.
- Many skills intentionally write or depend on long-lived artifacts such as experiment logs, pipeline state, and review notes.
- Some skills reference optional local integrations such as Feishu notifications, Kaggle CLI auth, W&B, Vast.ai, or Modal. These are optional and should degrade gracefully when unavailable.
- No real secrets are included in this export. Example environment variable names and config paths remain in place because they are part of the workflow documentation.

## What Makes These Skills Different

- They are workflow-oriented, not single-shot.
- They assume artifacts matter.
- They distinguish official, first-hand, community, and inferred evidence.
- They try to stop the common failure mode where the agent's narrative becomes more confident than reality.
- They are designed to be edited, remixed, and specialized further.

## Safety And Cleanup

This export intentionally omits local dependency caches such as `web-access/node_modules`.

Before publishing publicly, it is still a good idea to do one more repo-level review for:

- private paths you no longer want to expose
- organization-specific service names
- references to local scripts or accounts that should be generalized further

## Optional Integrations

Some skills mention optional integrations. These are not required for the repository to be useful.

- Kaggle CLI
- W&B
- Feishu / Lark notifications
- Vast.ai
- Modal
- external LLM APIs

If these are unavailable in your environment, the preferred behavior is graceful degradation rather than hard failure.

## Naming Note

The repository is currently exported under a generic local folder name, but it can be published under any public name you prefer, including a more domain-specific one such as `kaggle-skills`.

## Publishing Checklist

Before pushing to a public GitHub repository, I recommend checking:

1. No private credentials or tokens are present anywhere in tracked files.
2. Any organization-specific references are either acceptable or generalized.
3. `README.md` reflects the scope you actually want to support publicly.
4. Optional integrations are documented clearly enough that users know what is required.
5. Large generated files, local caches, and dependency directories are excluded.

## Repository Layout

```text
.
├── .gitignore
├── CONTRIBUTING.md
├── README.md
├── LICENSE
├── catalog.md
├── install.sh
└── skills/
```

## Contributing

See [CONTRIBUTING.md](./CONTRIBUTING.md).

## License

MIT. See [LICENSE](./LICENSE).
