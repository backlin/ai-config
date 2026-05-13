---
name: implementation
description: implementation of non-trivial new features (closing architectural gap)
---

# Step 1: Locate baseline archtecture file

Expected location: `architecture/BASELINE.md`
If missing, ask user if it is located elsewhere or should be written from scratch.


# Step 2: Write target and plan files

Create target file `architecture/TARGET_yymmdd_short_description.md`, e.g. `architecture/TARGET_260508_persistent_tokens.md`,
containing a summary of the requested features.

Unaffected baseline components can be omitted, e.g. if working on backend then omit frontend.

Compare baseline and target states and write a step by step plan for implementing the requested features.
Add a checkbox to each step to indicate if it has been implemented or not.
If plan contains many steps then group into phases.

Ask user to review and confirm target and plan are accurate.


# Setp 3: Implement according to plan

Implement and commit phasewise.
Do not stop between phases but continue all the way to the end.


# Step 4: Update baseline incrementally
