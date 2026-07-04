# Installation

## Prerequisites

- OpenCode installed (any recent version)
- `~/.config/opencode/skills/` and `~/.config/opencode/agents/` directories exist

```bash
mkdir -p ~/.config/opencode/skills ~/.config/opencode/agents
```

## Clone

```bash
# SSH (recommended)
git clone git@github.com:manikantamedindi/my-ai-toolkit.git

# HTTPS (alternative)
git clone https://github.com/manikantamedindi/my-ai-toolkit.git
```

## Make Skills/Agents Available to OpenCode

### Option 1: Global symlink (recommended for development)

```bash
# Link all skills
for dir in skills/*/; do
  ln -sf "$PWD/$dir" ~/.config/opencode/skills/
done

# Link all agents
for file in agents/*.md; do
  ln -sf "$PWD/$file" ~/.config/opencode/agents/
done
```

### Option 2: Copy files (stable, no git dependency)

```bash
# Copy skills
cp -r skills/* ~/.config/opencode/skills/

# Copy agents
cp agents/* ~/.config/opencode/agents/
```

### Option 3: Git-based plugin (if supported by your OpenCode version)

Configure the repo as a remote skill source in `opencode.json` (see configuration.md).

## Verify Installation

Run OpenCode and check available skills:

```
Available skills should include: frontend, react, vue, nextjs, nuxt, javascript, typescript, nodejs, ui-ux, accessibility, performance, seo, testing, git
```

Test a skill invocation:

```
"Use the testing skill to help me write tests for this function"
```

## Uninstall

```bash
# Remove all toolkit skills
for skill in frontend react vue nextjs nuxt javascript typescript nodejs ui-ux accessibility performance seo testing git; do
  rm -rf ~/.config/opencode/skills/"$skill"
done

# Remove all toolkit agents
for agent in frontend-engineer code-reviewer bug-fixer architect ui-reviewer performance-engineer seo-specialist documentation-writer; do
  rm -f ~/.config/opencode/agents/"$agent".md
done
```

## Update

```bash
git pull origin main
# Re-run the symlink or copy command above to refresh
```
