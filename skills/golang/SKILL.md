---
name: golang
description: Programming in Go
---

Make sure `go fmt`, `go vet` and honnef's `staticcheck` is run in pre-commit.


# Error handling

Functions may return error or log error, never both.

Never panic unless explicitly told so.
