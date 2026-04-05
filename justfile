install:
    mkdir -p ~/.claude/ ~/.codex/ ~/.copilot/ ~/.gemini/

    ln -sfn "$(pwd)/AGENTS.md" ~/.claude/CLAUDE.md
    ln -sfn "$(pwd)/skills" ~/.claude/skills

    ln -sfn "$(pwd)/AGENTS.md" ~/.codex/AGENTS.md
    ln -sfn "$(pwd)/skills" ~/.codex/skills

    ln -sfn "$(pwd)/AGENTS.md" ~/.copilot/copilot-instructions.md
    ln -sfn "$(pwd)/skills" ~/.copilot/skills

    ln -sfn "$(pwd)/AGENTS.md" ~/.gemini/GEMINI.md
    ln -sfn "$(pwd)/skills" ~/.gemini/skills

