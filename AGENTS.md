# AGENTS.md — my-ai-toolkit

## What this is

A collection of reusable OpenCode skills, agents, prompt templates, and project templates.

```
skills/        - Reusable AI Skills (14 domains)
agents/        - Specialized coding agents (8 definitions)
prompts/       - Prompt templates (5 templates)
templates/     - Project templates (nextjs, vue, react, node)
examples/      - Usage examples
docs/          - Documentation
```

## Current state

- 14 skill files (`skills/*/SKILL.md`) with YAML frontmatter + structured content
- 8 agent definitions (`agents/*.md`) with tool restrictions and workflow steps
- 5 prompt templates (`prompts/*.md`) with examples and templates
- 3 documentation files (`docs/*.md`) with practical setup guides
- No build, test, lint, or typecheck scripts
- No `package.json`, `opencode.json`, or config files

## Skill Invocation Rules

**You MUST use a skill if there is even a 1% chance it applies.** This is not optional.

### Intent → Skill Mapping

| Intent | Skill(s) |
|--------|----------|
| Build/modify a UI component | `frontend`, `react` / `vue` / `nextjs` / `nuxt` |
| Write/review JavaScript/TypeScript | `javascript`, `typescript` |
| Build a backend API | `nodejs` |
| Design layout or visual style | `ui-ux` |
| Check accessibility | `accessibility` |
| Optimize performance | `performance` |
| Optimize search visibility | `seo` |
| Write tests, TDD, bug reproduction | `testing` |
| Commit, branch, release | `git` |
| Review code | `code-reviewer` (agent) |
| Fix a bug | `bug-fixer` (agent) |
| Design architecture | `architect` (agent) |
| Review UI quality | `ui-reviewer` (agent) |
| Profile and optimize | `performance-engineer` (agent) |
| SEO audit and optimization | `seo-specialist` (agent) |
| Write documentation | `documentation-writer` (agent) |

### How to invoke

1. Determine which skill(s) match the task
2. Load the skill with `skill({ name: "<skill-name>" })`
3. Follow the skill instructions strictly
4. Only proceed to implementation after required steps are complete

### Anti-rationalization

| Don't | Do |
|-------|----|
| "This is too simple for a skill" | Check for matching skills anyway |
| "I can just implement quickly" | Use the skill — it encodes patterns |
| "Let me gather context first" | Skills tell you how to gather context |
| "I already know this pattern" | Skills evolve — read the current version |

## Remote

- `origin` → `git@github.com:manikantamedindi/my-ai-toolkit.git`

## Adding content

Create skill files under `skills/<domain>/` as `SKILL.md` with YAML frontmatter (`name`, `description` required). Add agent definitions as `.md` files in `agents/` with frontmatter. Add prompt templates in `prompts/`. Project templates go under `templates/`.
