# Installation

## Clone

```bash
git clone git@github.com:manikantamedindi/my-ai-toolkit.git
cd my-ai-toolkit
```

## Make Skills/Agents Available to OpenCode

### Option 1: Global symlink (recommended)

```bash
# Link skills
ln -sf "$PWD/skills"/* ~/.config/opencode/skills/

# Link agents
ln -sf "$PWD/agents"/* ~/.config/opencode/agents/
```

### Option 2: Copy files

```bash
# Copy skills
cp -r skills/* ~/.config/opencode/skills/

# Copy agents
cp agents/* ~/.config/opencode/agents/
```

### Option 3: Git-based plugin (if supported by your OpenCode version)

Configure `opencode.json` to use this repo as a remote skill source.

## Verify Installation

Run OpenCode and ask it what skills are available. You should see entries for `frontend`, `react`, `testing`, `accessibility`, `seo`, etc.

## Uninstall

```bash
rm -rf ~/.config/opencode/skills/{frontend,react,vue,nextjs,nuxt,javascript,typescript,nodejs,ui-ux,accessibility,performance,seo,testing,git}
rm -rf ~/.config/opencode/agents/{frontend-engineer,code-reviewer,bug-fixer,architect,ui-reviewer,performance-engineer,seo-specialist,documentation-writer}
```
