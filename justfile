link:
    mkdir -p ~/.claude/ ~/.codex/ ~/.copilot/ ~/.gemini/

    ln -sfn "$(pwd)/AGENTS.md" ~/.claude/CLAUDE.md
    ln -sfn "$(pwd)/skills" ~/.claude/skills

    ln -sfn "$(pwd)/AGENTS.md" ~/.codex/AGENTS.md
    ln -sfn "$(pwd)/skills" ~/.codex/skills

    ln -sfn "$(pwd)/AGENTS.md" ~/.copilot/copilot-instructions.md
    ln -sfn "$(pwd)/skills" ~/.copilot/skills

    ln -sfn "$(pwd)/AGENTS.md" ~/.gemini/GEMINI.md
    ln -sfn "$(pwd)/skills" ~/.gemini/skills

unlink:
    rm -f ~/.claude/CLAUDE.md
    rm -f ~/.claude/skills
    rm -f ~/.codex/AGENTS.md
    rm -f ~/.codex/skills
    rm -f ~/.copilot/copilot-instructions.md
    rm -f ~/.copilot/skills
    rm -f ~/.gemini/GEMINI.md
    rm -f ~/.gemini/skills

diff:
    #!/usr/bin/env bash
    rc=0
    difft --exit-code ~/.claude/CLAUDE.md AGENTS.md                || rc=1
    difft --exit-code ~/.codex/AGENTS.md AGENTS.md                 || rc=1
    difft --exit-code ~/.copilot/copilot-instructions.md AGENTS.md || rc=1
    difft --exit-code ~/.gemini/GEMINI.md AGENTS.md                || rc=1
    exit $rc

