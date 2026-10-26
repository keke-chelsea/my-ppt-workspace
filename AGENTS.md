# PPT workspace

Use `.agents/skills/codex-ppt/SKILL.md` for image-based presentation requests.

- Check the current task's callable built-in image generation tool before planning image production. Installation does not provide this tool.
- Do not configure or call paid APIs or third-party image services without explicit user approval. Do not automatically run `image_gen.py` or configure API credentials.
- If built-in image generation or required subagents are unavailable, report the blocker and stop the affected phase. Do not substitute locally drawn slide images.
- Follow upstream outline, style, backend and sample approval gates.
- Run Python scripts with `${CODEX_PPT_HOME:-$HOME/.codex-ppt-skill}/.venv/bin/python` after setup.
- Keep credentials, virtual environments, caches and generated presentations out of Git unless the user requests a deliverable to be committed.
