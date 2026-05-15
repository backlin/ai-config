---
name: python
description: Programming in Python
---
Include everything in skill `programming`.

Preferred toolchain:

- uv
- ruff
- both ty and basedpyright
- pydantic

Add dependencies using `uv add` (never write using LLM).


# Typing and data structures

Add type information to all classes defined in my code.

Dicts of primitives should never be used in function signatures.
If dicts are needed then defined type aliases, e.g.

```py
Table = str
RowCount = int

def row_counts() -> dict[Table, RowCount]:
    pass
```

Use pydantic to handle complex data structures, serialization and deserialization,
e.g. to model and read configuration or REST responses.

Composition over inheritance.
Prefer `typing.Protocol` instead of abstract base classes (ABC).


# Library preferences

Construct paths using pathlib.Path or os.path.join.
