---
name: architecture-baseline
description: update baseline architecture of a repo, i.e. its current state
---

Expected location: `architecture/BASELINE.md`
First line contains commit SHA when baseline was updated.


# Create if missing

Analyze the code and config in the repo and write down a high level summary of the different
services, interfaces, packages, workflows, and tooling in file `architecture/BASELINE.md`.


# Incremental update

If HEAD matches baseline's SHA then analyze the files to be committed,
else also include previous commits between HEAD and baseline SHA.


# Scope boundary

To save time, do not analyze dependency code, e.g.:
- vendor
- node_modules
- .venv
- git-ignored files (may contain secrets you should not send to LLM provider)
