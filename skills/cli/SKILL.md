---
name: cli
description: Creating command line interfaces
---
Pick framework that supports tab completion by default, e.g. click for Python
Justfile recipes that install the CLI should be accompanied with a shell-completion recipe, e.g.

```
shell-completion:
    @echo 'Zsh  — add to ~/.zshrc:'
    @echo '  eval "$(_DP_COMPLETE=zsh_source dp)"'
    @echo ''
    @echo 'PowerShell — add to $PROFILE:'
    @echo '  _DP_COMPLETE=powershell_source dp | Invoke-Expression'
```
