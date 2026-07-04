# Documentation

Generate project documentation from source code.

## Template

### README

```markdown
# Project Name

[One-sentence description]

## Prerequisites
- [Requirement and version]

## Quick Start
```bash
[install command]
[run command]
```

## Commands
| Command | Description |
|---------|-------------|
| `npm run dev` | Start dev server |
| `npm run build` | Build for production |
| `npm test` | Run tests |

## Project Structure
```
src/
  components/   # UI components
  pages/        # Route pages
  lib/          # Utilities and helpers
```

## License
[License name]
```

### API Documentation

```markdown
## `POST /api/tasks`

Create a new task.

### Request
```json
{
  "title": "string (required)",
  "description": "string (optional)",
  "dueDate": "ISO 8601 date (optional)"
}
```

### Response
`201 Created`
```json
{
  "id": "string",
  "title": "string",
  "status": "pending"
}
```

### Errors
| Status | Condition |
|--------|-----------|
| 400 | Missing required field |
| 401 | Not authenticated |
```
