#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")" && pwd)"
SRC="$ROOT/skills/"

usage() {
  cat <<'EOF'
Usage:
  bash install.sh --claude
  bash install.sh --codex
  bash install.sh --target /path/to/skills
EOF
}

if [[ $# -lt 1 ]]; then
  usage
  exit 1
fi

TARGET=""
case "${1:-}" in
  --claude)
    TARGET="$HOME/.claude/skills"
    ;;
  --codex)
    TARGET="$HOME/.codex/skills"
    ;;
  --target)
    TARGET="${2:-}"
    if [[ -z "$TARGET" ]]; then
      usage
      exit 1
    fi
    ;;
  *)
    usage
    exit 1
    ;;
esac

mkdir -p "$TARGET"
rsync -a "$SRC" "$TARGET/"
echo "Installed skills into: $TARGET"
