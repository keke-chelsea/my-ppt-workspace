#!/usr/bin/env bash
set -euo pipefail
repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
skill_dir="$repo_root/.agents/skills/codex-ppt"
python3 "$skill_dir/scripts/codex_ppt_runtime.py" bootstrap
runtime_python="${CODEX_PPT_HOME:-$HOME/.codex-ppt-skill}/.venv/bin/python"
"$runtime_python" -c 'import pptx, PIL, openai, filelock; print("codex-ppt dependencies OK")'
"$runtime_python" "$skill_dir/scripts/assemble_ppt.py" --help
