# Codex Cloud configuration

The complete upstream skill is vendored in `.agents/skills/codex-ppt` from:
https://github.com/ningzimu/codex-ppt-skill/tree/941dcafe2f23ea4ae61de99e9b22fb0ef3d9e06c/skills/codex-ppt

Upstream installation instructions: https://github.com/ningzimu/codex-ppt-skill#安装
The upstream skill directory is copied without modification. Its license is retained in `docs/codex-ppt-LICENSE`.

## Repeatable setup

1. Merge the installation branch into `main`.
2. In Codex web, create/select an environment associated with `keke-chelsea/my-ppt-workspace`.
3. Set its setup script to `bash scripts/setup-codex-ppt.sh` (working directory: repository root). The same command can be used in its maintenance script so dependency changes are applied to cached environments.
4. Start a new task on `main`. Ask it to verify discovery of `codex-ppt`, dependency imports, built-in image generation and subagent availability before generating a deck.

The setup script uses Python 3, venv and pip to install the upstream requirements into `${CODEX_PPT_HOME:-$HOME/.codex-ppt-skill}/.venv`. It does not configure credentials or call an image API. Requirements specify minimum versions, not a full reproducibility lock.

## Network and capability limits

- Dependency installation needs PyPI access (`pypi.org`, `files.pythonhosted.org`) or an approved mirror. Skill files are already in the repository; no upstream download is required at task startup.
- Legacy Codex Cloud setup scripts have network access; agent-phase internet is off by default and configured separately. Current Cloud interfaces may have different capability controls. Verify the actual environment settings.
- Installing Python's `openai` package does not enable image generation and does not make a billable API request.
- The cloud task must actually expose a callable built-in image tool. Local desktop tool availability and subscription status do not prove cloud availability. If absent, stop; do not enable paid API fallback without user approval.
- The upstream workflow also requires available slide subagents after sample approval. Report missing required capabilities rather than claiming full support.
- Output slides are full-page images, not independently editable text boxes/charts.
- This installation was prepared in a local checkout; cloud setup and image generation still require validation in a real cloud task. Do not copy local `.env` files or secrets into the repository.

Official references:
- https://learn.chatgpt.com/docs/build-skills
- https://learn.chatgpt.com/docs/environments/cloud-environment
- https://learn.chatgpt.com/docs/cloud/internet-access

Suggested acceptance prompt:

> Inspect codex-ppt discovery, run dependency import and assembly --help checks, and report callable built-in image and subagent tools. Do not generate images, configure credentials, or call paid APIs.
