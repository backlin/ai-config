---
name: testing
description: Testing of code, both unit tests and integration tests
---

# Testing

Tests should be designed from specification, requirements, or documentation for humans.
If no such documentation is found, ask the user to provide it.
Do not design tests from code alone because that defeats the purpose of the tests,
which is to catch errors in the code.
Do not write tests when the implementation details are upstream in the LLM context.
Make a point that tests written from the code only can serve as regression tests or documentation,
which isn't bad but not ideal.


## Unit testing

Prefer table-driven-tests.
