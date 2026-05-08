## Markdown CLI output
Tables in CLI output (but not file output) should be fenced in tables in code blocks
to bypass rendering into boxdrawing.
This is to simplify pasting into other apps, e.g. Obsidian.
Column alignment is controlled using colon (:).
This applies to all tables in every response.
Example:

```
| Priority |             Location              |         Scope         |
|---------:|-----------------------------------|-----------------------|
|        1 | Enterprise managed                | All users in org      |
|        2 | ~/.claude/skills/                 | All your projects     |
|        3 | .claude/skills/ in project        | This project          |
|        4 | Nested .claude/skills/ in subdirs | Subdirectory-specific |
```

## Disk operations
Move files with `git mv` when applicable.

## Don't lint and test
This is done via pre-commit hook, so you don't need to do it after every edit.
