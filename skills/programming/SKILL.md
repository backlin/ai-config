---
name: programming
description: Software development by writing program code.
---
# Programming

## Portability
Design for Linux and Mac.

Use protobuf for API design and buf for generating stubs from it.

Always put a justfile in the root of a repo, in which script
will be put to glue together all parts of the project.
For example, building, testing, linting, rotating secrets.


## Error handling
Fail early and hard instead of patching bad input or state,
since the latter often result in silent failure or cryptic 
downstream errors.
For example, parse data into typed destination structures instead of
flexible structures such as untyped dicts.

Avoid runtime errors by design whenever possible.
For example:

- Use strict typing whenever possible.
- Put magic values into constants or enums instead of duplicating
  them in code to avoid typos.

## State management
Functional programming is used whenever possible.

Side-effect are allowed when unavoidable, for example in functions
that write to disk, log messages, listen to events, or similar.
Ask for permission before adding shared global state.

## Concurrency
Sequential processing is the norm.
For example, a DAG of tasks does not need concurrent execution unless
very large or slow.

Parallel solutions are encouraged for embarassingly parallel problems,
for example computing column sums of a matrix.

Concurrent solutions are encouraged when coroutines can be processed
in isolation, for example processing incoming requests in a
micro service or waiting for network requests.
Use mutexes where applicable.

## Documentation
Only write docstrings if relevant details are not visible in function signature.
Only write comments if relevant details are not visible in code.

For example:

- References to websites or literature.
- Design choices and implementation details that depend on an external resource.
- Optimization tricks.
