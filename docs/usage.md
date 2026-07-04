# Usage

## Skill-Driven Development

OpenCode discovers skills in this toolkit and invokes them automatically when tasks match. The agent reads skill descriptions to determine relevance.

### Intent → Skill Mapping

| When you say... | Skill(s) activated |
|-----------------|-------------------|
| "Build a frontend component" | `frontend`, `react` or `vue` |
| "Review this code" | `code-reviewer` (agent) |
| "Fix this bug" | `bug-fixer` (agent), `testing` |
| "Make it faster" | `performance`, `performance-engineer` (agent) |
| "Check SEO" | `seo`, `seo-specialist` (agent) |
| "Improve accessibility" | `accessibility` |
| "Write tests" | `testing` |
| "Commit this" | `git`, `commit-message` (prompt) |
| "Document this" | `documentation-writer` (agent) |
| "Design the architecture" | `architect` (agent) |

### Using Prompts

Prompts provide structured templates for common tasks. Open them and fill in the details:

- `commit-message.md` — Generate Conventional Commit messages from staged changes
- `pull-request.md` — Generate PR descriptions from branch changes
- `release-notes.md` — Generate release notes from git history
- `bug-report.md` — File structured bug reports with reproduction steps
- `documentation.md` — Generate project docs from source code

### Using Templates

Template directories (`templates/nextjs`, `templates/vue`, `templates/react`, `templates/node`) are ready for project scaffolding. Use an agent to scaffold a new project:

```
"Scaffold a new Next.js project from the template in templates/nextjs"
```
