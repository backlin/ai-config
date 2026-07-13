---
name: golang
description: Programming in Go
---

Make sure `go fmt`, `go vet` and honnef's `staticcheck` is run in pre-commit.


# Error handling

All errors must be handled, either resolved, retried, returned or logged.
Don't log before return to avoid cluttering logs.

Errors propagated from function calls must be wrapped in a descriptive message.
Example:
```golang
v, err := invert(x)
if err != nil {
    return fmt.Errorf("could not invert: %w", err)
}
```

Loggers and other auxiliary tooling may be wrapped in a middleware that handles errors,
e.g. sent to a channel, to avoid disruting or clutter the main program flow.

Never panic unless explicitly told so, for example if logging is required but writing fails.
Functions that may panic must have names prefixed by "must", e.g. `MustInvert(float) float`.
