---
name: fm
description: Batch editing of Markdown frontmatter in YAML using natural language
---

# fm — frontmatter refactoring

Use the `fm` CLI to query and mutate YAML frontmatter in Markdown files based on the
user's natural language request. `fm` implements a subset of SQL where files are
rows and frontmatter fields are columns.

## Workflow

1. **Clarify** target files if the glob is ambiguous — ask before assuming.
2. **Preview** with a `select` query before any destructive mutation, unless
   the user's request is already precise. `--dry-run` works for `update` and
   `alter` and is the safest preview for mutations.
3. **Execute** the mutation command(s).
4. Show a brief summary of what changed (e.g. `git diff --stat` or a follow-up
   `select` projecting the affected fields).

---

## Invocation

```sh
fm '<query>' [flags]
```

**Always pass the query as a single quoted argument.** Single quotes prevent
the shell from expanding globs, comparison operators, `;`, parentheses, and
`>`/`<` redirections. `fm` performs its own glob expansion, so quoting does
not lose any functionality.

```sh
fm 'select url from pages/*.md where tags >= "wiki"'        # correct
fm select url from pages/*.md where tags '>="wiki"'          # fragile: shell-interpreted
```

Query may also be read from stdin if omitted:

```sh
fm < script.sql
cat script.sql | fm
```

Flags (place **after** the quoted query string — leading flags get consumed
into the query positional and produce an "empty query" error):

| Flag           | Meaning                                  |
|:---------------|:-----------------------------------------|
| `-h`, `--help` | Show help                                |
| `--dry-run`    | Simulate mutations without editing files |

---

## Query types

```
select [<expr>[, <expr>]...]
  from <glob>...
  [where <bool expr>]
  [sort by <expr> [asc|desc][, ...]]
  [limit <n>]

update <glob>...
  set <assignment>[, <assignment>]...
  [where <bool expr>]

alter <glob>...
  drop <field>[, <field>]...
  [where <bool expr>]

alter <glob>...
  rename <field> to <field>[, ...]
  [where <bool expr>]
```

Multiple statements may be separated by `;`. `--` starts a line comment. Each
file is read once, all applicable statements run against it in order, and the
file is written back once at the end. A statement error halts further work on
that file and cancels its write; the loop continues to the next file.

```sh
fm 'update recipes/*.md set category = "Dinner" where tags >= "dinner";
    select category from recipes/*.md where category = "Dinner"'
```

### Assignments (`update ... set`)

| Form            | Effect                                                       |
|:----------------|:-------------------------------------------------------------|
| `field:type`    | Cast existing field to type, or create it as null if absent  |
| `field = value` | Set field; `field = null` clears it                          |
| `field += value`| Number: add; list: append; scalar: cast to single-element list then append |
| `field -= value`| Number: subtract; list: remove matching elements             |

A typed assignment like `field:int = expr` casts the RHS to `int` before
writing. Statically invalid assignments (e.g. `foo:int = "hello"`) are
rejected at parse time and halt the program before touching any file.

### Where expressions

```ebnf
expression = or_expr
or_expr    = and_expr { "or" and_expr }
and_expr   = not_expr { "and" not_expr }
not_expr   = [ "not" ] comparison
comparison = arith { comp_op arith }
```

Use `not <field>` (keyword) to negate; there is no `-field` shorthand.
`and` binds tighter than `or`. Parentheses override precedence.

| Comparison              | Truthy when…                                          |
|:------------------------|:------------------------------------------------------|
| `field`                 | Field exists and value is truthy                      |
| `not field`             | Field is missing, null, false, 0, or `""`             |
| `field = value`         | Scalar equality                                       |
| `field = null`          | Field is null (or missing, after cast failure)        |
| `field != value`        | Scalar inequality                                     |
| `field > / >= / < / <=` | Numeric/date ordering                                 |
| `list:list >= scalar`   | List contains scalar                                  |
| `scalar <= list:list`   | Same as above, sides flipped                          |
| `list_a = list_b`       | Set equality (order independent)                      |

### Types

`any` · `string` · `bool` · `int` · `number` · `date` · `datetime` · `link` · `mdlink` · `list`

Lists are list-of-string after cast (`list:<elem>` is **not** supported — any
attempt errors at parse). Dates use ISO 8601 (`YYYY-MM-DD`); datetimes use
ISO 8601 local time (`YYYY-MM-DDTHH:MM:SS`, no UTC offset). All types are
nullable.

Field references may carry a type annotation: `field:type` casts before use.
Cast follows strict→loose chains:

- `bool < int < number < string`
- `link = mdlink < string`
- `datetime < date < string`

---

## Examples

```sh
# Query: project two fields, filter, sort, limit
fm 'select title, tags from notes/*.md where published = true sort by date desc limit 10'

# Batch type cast (creates as null if absent)
fm 'update notes/*.md set date:date, rating:int'

# Conditional set
fm 'update notes/*.md set status = "published" where status = "draft"'

# Append to a list field
fm 'update notes/*.md set tags += "cooking" where category = "recipe"'

# Remove a field when a condition is met
fm 'alter notes/*.md drop draft where published = true'

# Rename a field
fm 'alter notes/*.md rename source to ref'

# Multi-statement: mutate then verify in one pass
fm 'update notes/*.md set status = "archived" where date < "2024-01-01";
    select title, date from notes/*.md where status = "archived"'

# Preview a mutation safely
fm 'update notes/*.md set tags += "todo" where draft = true' --dry-run
```

---

## Notes

- Always single-quote the entire query argument to neutralize the shell.
- Frontmatter field order is sorted alphabetically on every write.
- `null` is a keyword; to assign the literal string `"null"` use `sed`.
- A statement failure on a given file cancels that file's write but does not
  abort the program — other files continue.
- Selects with `limit` and no `sort by` short-circuit and stop reading files
  once the limit is reached; selects with `sort by` always process every match
  before truncating.
- Updates and alters always process every matching file regardless of `limit`.
