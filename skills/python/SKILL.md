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

Add type information to all classes defined in my code.

Composition over inheritance.
Prefer `typing.Protocol` instead of abstract base classes (ABC).

Construct paths using pathlib.Path or os.path.join.
