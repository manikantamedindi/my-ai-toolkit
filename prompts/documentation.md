# Documentation

Generate project documentation from source code.

## Template

### README

````markdown
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
````

### API Documentation

````markdown
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
````

## Example

**Input:** Source code for a task management API endpoint

**Output:**

````markdown
## `GET /api/tasks`

List all tasks for the authenticated user.

### Query Parameters
| Param | Type | Default | Description |
|-------|------|---------|-------------|
| `status` | string | `all` | Filter: `active`, `done`, `all` |
| `page` | number | `1` | Page number |
| `limit` | number | `20` | Items per page |

### Response
`200 OK`
```json
{
  "data": [{ "id": "1", "title": "Buy groceries", "status": "pending" }],
  "page": 1,
  "total": 42
}
```
````

## Rules

- Each API endpoint documents request, response, and error cases
- README fits on one page — link to detailed docs for depth
- Document the *why* in ADRs, the *what* in READMEs, the *how* in code comments
- Include code examples for every API operation
- No generic filler ("easy to use", "powerful", "robust")
