---
name: architecture-baseline
description: update baseline architecture of a repo, i.e. its current state
---

Analyze the code and config in a repo and write down a high level summary of the different
services, interfaces, packages, workflows, and tooling in file `architecture/BASELINE.md`.

To save time, do not analyze dependency code, e.g.:
- vendor
- node_modules
- .venv
- git-ignored files (may contain secrets you should not send to LLM provider)
