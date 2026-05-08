---
name: implementation
description: implementation of non-trivial new features (closing architectural gap)
---

# Step 1: Located baseline archtecture file
Expected location: `architecture/BASELINE.md`
If missing, ask user if it is located elsewhere or should be written from scratch.

# Step 2: Write target file
Create target file `architecture/TARGET_yymmdd_short_description.md`, e.g. `architecture/TARGET_260508_persistent_tokens.md`,
containing a summary of the requested features.
Unaffected baseline components can be omitted, e.g. if working on backend then omit frontend.

# Step 3: Write plan into target file
Compare baseline and target states and write a step by step plan for implementing the requested features.
