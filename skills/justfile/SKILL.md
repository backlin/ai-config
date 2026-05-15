---
name: justfile
description: Justfile build system.
---

Sort recipes according to group.
Ungrouped recipes first.
Put private recipes last in group.


| Deprecated function | Replacement |
|-|-|
| env_var | env |


# Variadic arguments

Preserve quoting using "$@":

```just
[grup("Development")]
[positional-arguments]
run *args:
    #!/usr/bin/env bash
    uv run main.py "$@"
```
