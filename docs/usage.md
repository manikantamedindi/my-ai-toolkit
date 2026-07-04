# Usage

## Skill-Driven Workflow

OpenCode invokes skills automatically when task descriptions match their metadata. You don't need to manually load skills — just describe what you want.

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

### Real-World Workflow Examples

**Adding a feature:**
```
"Add dark mode support to the settings page"
```
→ Agent loads `frontend` + `react` (or `vue`) skills → plans component structure → implements with proper state management → verifies accessibility and responsiveness

**Fixing a bug:**
```
"The task list shows a blank page when there are no tasks"
```
→ Agent loads `bug-fixer` agent → writes reproduction test → fixes root cause → verifies regression guard

**Preparing a release:**
```
"Prepare v1.2.0 for release"
```
→ Agent loads `git` skill → generates changelog → creates release tag → generates release notes

## Using Prompts

Prompts provide structured templates for repetitive tasks. Reference them when generating output:

- **commit-message.md** — Generate Conventional Commit messages from staged changes
- **pull-request.md** — Generate PR descriptions from branch changes
- **release-notes.md** — Generate release notes from git history
- **bug-report.md** — File structured bug reports
- **documentation.md** — Generate project docs from source code

To use a prompt, tell your agent: "Use the [prompt name] template to generate [output]".

## Manual Skill Invocation

If you want to explicitly load a skill:

```
"Load the accessibility skill and audit this page"
```

Or reference the agent directly:

```
"Ask the code-reviewer agent to review this PR"
```

## Project Templates

Template directories under `templates/` are ready for scaffolding:

```
"Scaffold a new Next.js project from the template"
"Create a Vue app using the vue template"
"Set up a Node.js API from the node template"
```

## See Also

- `AGENTS.md` — Complete skill invocation rules and intent mapping
- `docs/installation.md` — Setup instructions
- `docs/configuration.md` — OpenCode config reference
