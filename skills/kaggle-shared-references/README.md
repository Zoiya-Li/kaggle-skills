# Kaggle Project `CLAUDE.md` Template

Use this README as a copyable template when setting up a Kaggle project.

Goal:

- make environment discovery fast,
- make remote execution reproducible,
- keep secrets out of long-lived project files,
- and give Claude Code a single place to check paths, servers, and workflow conventions.

## Copying Rule

Copy the template below into the project root as `CLAUDE.md`, then fill in project-specific values.

Important:

- write **how to access** secrets, not the secret values themselves
- keep real passwords, API tokens, cookies, and private keys out of `CLAUDE.md`
- prefer SSH aliases and environment-variable names over plaintext credentials

---

```md
# CLAUDE.md

## Project

- project_name: YOUR_PROJECT_NAME
- goal: Briefly describe the competition goal
- repo_root: /ABS/PATH/TO/PROJECT
- primary_language: python

## Working Rules

- Read this file before running experiments or deployments.
- Check existing logs and artifacts before starting new work.
- Validate the smallest runnable slice first, then launch long jobs.
- Keep these files synchronized when work materially changes:
  - `kaggle/PIPELINE_STATE.md`
  - `kaggle/EXPERIMENT_LOG.md`
  - `kaggle/ERROR_ANALYSIS.md`

## Paths

- data_dir: /ABS/PATH/TO/data
- output_dir: /ABS/PATH/TO/outputs
- logs_dir: /ABS/PATH/TO/logs
- checkpoints_dir: /ABS/PATH/TO/checkpoints
- submissions_dir: /ABS/PATH/TO/submissions
- tmp_dir: /tmp/YOUR_PROJECT

## Local Environment

- os: macOS | Linux
- shell: zsh | bash
- python: python3
- package_manager: pip | uv | conda
- venv_activation: source .venv/bin/activate
- default_run_dir: /ABS/PATH/TO/PROJECT

### Local Checks

```bash
python3 -V
pwd
pip3 list | head
```

## Remote GPU

- gpu: remote
- ssh_alias: your-gpu-server
- remote_host_note: RTX 4090D 24GB / A100 / etc
- remote_workdir: /root/project
- remote_logs_dir: /root/project/logs
- remote_results_dir: /root/project/results
- conda_init: source /root/miniconda3/etc/profile.d/conda.sh
- conda_env: your_env_name
- remote_python: /root/miniconda3/envs/your_env_name/bin/python
- code_sync: rsync | git
- launcher: screen | tmux

### Remote Checks

```bash
ssh your-gpu-server "nvidia-smi"
ssh your-gpu-server "source /root/miniconda3/etc/profile.d/conda.sh && conda activate your_env_name && python -V"
ssh your-gpu-server "screen -ls"
ssh your-gpu-server "df -h"
```

### Remote Run Pattern

```bash
ssh your-gpu-server "cd /root/project && \
source /root/miniconda3/etc/profile.d/conda.sh && \
conda activate your_env_name && \
CUDA_VISIBLE_DEVICES=0 screen -dmS exp001 bash -lc 'python train.py 2>&1 | tee logs/exp001.log'"
```

## Code Sync

- sync_method: rsync | git
- local_src: /ABS/PATH/TO/PROJECT/
- remote_dst: your-gpu-server:/root/project/

### Example rsync

```bash
rsync -avz \
  --exclude '.git' \
  --exclude '__pycache__' \
  --exclude '.DS_Store' \
  --exclude 'outputs/' \
  --exclude 'logs/' \
  --exclude 'checkpoints/' \
  /ABS/PATH/TO/PROJECT/ your-gpu-server:/root/project/
```

## Kaggle

- competition_slug: your-competition-slug
- kaggle_data_dir: /ABS/PATH/TO/kaggle-data
- submission_file: /ABS/PATH/TO/submissions/submission.csv
- kaggle_config_source: environment | ~/.kaggle/kaggle.json
- kaggle_username_env: KAGGLE_USERNAME
- kaggle_token_env: KAGGLE_API_TOKEN
- kaggle_json_path: ~/.kaggle/kaggle.json
- daily_submission_limit: unknown
- leaderboard_metric: FILL_ME
- official_submission_contract: summarize the official required format, schema, archive layout, limits, and validator/runtime constraints
- kaggle_compute_plan: local only | kaggle notebook cpu | kaggle notebook gpu | kaggle notebook tpu | mixed
- kaggle_compute_quota_note: summarize the current authenticated account's usable hosted compute budget or uncertainty
- kaggle_notebook_strategy: what should run inside Kaggle notebooks versus locally

### Kaggle Commands

```bash
kaggle competitions list
kaggle competitions files -c your-competition-slug
kaggle competitions submit -c your-competition-slug -f /ABS/PATH/TO/submissions/submission.csv -m "exp001"
kaggle competitions leaderboard -c your-competition-slug --show
```

### Kaggle Compute Notes

- Treat the authenticated Kaggle account as both a submission identity and a possible hosted-compute resource.
- Use `KAGGLE_API_TOKEN` or `~/.kaggle/kaggle.json` to authenticate CLI access for data, submissions, and notebook-adjacent workflows.
- If the project benefits from Kaggle's hosted CPU/GPU/TPU environment, record that explicitly here and plan around it.
- Respect platform quotas and account rules. Do not document or rely on multi-account quota rotation as the default plan.

## Credentials And APIs

Only record variable names, config paths, and source-of-truth locations here.
Do not write real values.

### Kaggle

- source: environment or ~/.kaggle/kaggle.json
- env_vars:
  - KAGGLE_USERNAME
  - KAGGLE_API_TOKEN

### Hugging Face

- source: environment
- env_vars:
  - HF_TOKEN
  - HF_HOME

### OpenAI-Compatible API

- source: environment
- env_vars:
  - OPENAI_API_KEY
  - OPENAI_BASE_URL
  - OPENAI_MODEL

### Weights & Biases

- enabled: true | false
- source: environment
- env_vars:
  - WANDB_API_KEY
  - WANDB_PROJECT
  - WANDB_ENTITY

### Feishu / Lark

- source: local config
- config_path: ~/.claude/feishu.json

## Secrets Policy

- Never store plaintext passwords, tokens, cookies, or private keys in `CLAUDE.md`.
- Use placeholders like:
  - `ssh_alias: your-gpu-server`
  - `KAGGLE_API_TOKEN: <set in environment>`
- Put real credentials in:
  - `~/.ssh/config`
  - environment variables
  - local untracked config files
  - password managers

## Experiment Tracking

- primary_state_file: kaggle/PIPELINE_STATE.md
- primary_experiment_log: kaggle/EXPERIMENT_LOG.md
- error_log: kaggle/ERROR_ANALYSIS.md
- experiment_id_rule: unique, monotonic, never reused

## Monitoring

### Local

```bash
tail -f logs/exp001.log
ps aux | grep train.py
```

### Remote

```bash
ssh your-gpu-server "screen -ls"
ssh your-gpu-server "tail -50 /root/project/logs/exp001.log"
ssh your-gpu-server "nvidia-smi"
```

## Artifact Rules

- Do not call an artifact `ready` unless it was directly checked.
- Do not package or submit until the official submission contract has been summarized in this file or in `kaggle/PROBLEM_BRIEF.md`.
- Before submission, verify:
  - the file exists
  - the filename is correct
  - row count / entry count / size
  - no unexpected extra files
  - no missing required files
- After submission, verify the official Kaggle status:
  - `upload accepted` is not enough
  - only `processed successfully` / valid official score counts as a successful submission
  - if official status is `error` or `failed`, record the cause and repair plan before calling the branch ready again

## Preferred Workflow

1. Read `CLAUDE.md`
2. Read `kaggle/PIPELINE_STATE.md`
3. Read `kaggle/EXPERIMENT_LOG.md`
4. Check local and remote environment
5. Run a minimal validation
6. Launch longer jobs
7. Update state files after meaningful changes

## Current Status Template

- current_branch: main
- current_focus: FILL_ME
- current_best_result: FILL_ME
- current_blocker: FILL_ME
- next_step: FILL_ME

## Notes

- If remote disk is tight, check `df -h` before downloading models.
- If GPU OOM occurs, reduce batch size / sequence length / adapter rank first.
- When a command fails, classify it before escalating:
  - environment
  - permissions
  - path
  - authentication
  - logic bug
```

---

## Recommended Usage

For Kaggle projects, this template works best together with:

- `artifact-contracts.md`
- `decision-roles.md`
- `../shared-references/operational-hygiene.md`

If you later evolve this template, prefer improving the shared skill template here rather than rewriting project-specific versions from scratch.
