---
name: implementation
description: implementation of non-trivial new features (closing architectural gap)
---

# Step 1: Locate baseline archtecture file

Expected location: `architecture/BASELINE.md`
If missing, ask user if it is located elsewhere or should be written from scratch.


# Step 2: Write target file

Create target file `architecture/TARGET_yymmdd_short_description.md`,
e.g. `architecture/TARGET_260508_persistent_tokens.md`,
containing a summary of the requested features.

First line must be `baseline = <SHA>`,
i.e the commit SHA of baseline that target builds on top of.

Unaffected baseline components can be omitted, e.g. if working on backend then omit frontend.

At the end of the plan, write tests to be performed to validate the new features.

Ask user to review and confirm that target and tests are accurate.


# Step 3: Write plan file

Compare baseline and target states and write a step by step plan for implementing the requested features.
First line must be `baseline = <SHA>`, just as in the target file.
Add a checkbox to each step to indicate if it has been implemented or not.
If plan contains many steps then group into phases.

Ask user to review and confirm that plan is accurate.


# Step 4: Commit target and plan

# Step 5: Implement plan

Implement and commit phasewise.
Do not stop between phases but continue all the way to the end.

As each step is completed, edit the plan file to check its checkbox (`- [ ]` -> `- [x]`)
**before** committing that step's work, so the checked plan file is part of the commit.
The plan file is the source of truth for progress: never report a step as done without
also checking its box.


# Step 5: Update baseline incrementally
