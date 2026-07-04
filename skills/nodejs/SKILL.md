---
name: nodejs
description: Builds Node.js backend applications with Express/Fastify, proper error handling, async patterns, and production best practices. Use when building or modifying server-side Node.js code, APIs, or backend services.
license: MIT
compatibility: opencode
metadata:
  domain: nodejs
---

# Node.js Development

## Overview

Build production-ready Node.js backend applications with proper request handling, error middleware, async patterns, security practices, and file management.

## When to Use

- Building REST APIs or GraphQL servers
- Implementing middleware and error handling
- Working with files, streams, or child processes
- Configuring production settings
- Writing database access code

## API Patterns

### Request Handler Structure

```ts
// handlers/tasks.ts
export async function getTasks(req: Request, res: Response) {
  const { userId } = req.auth
  const { status, page = 1 } = req.query
  const tasks = await taskService.list(userId, { status, page })
  res.json({ data: tasks, page })
}

export async function createTask(req: Request, res: Response) {
  const { userId } = req.auth
  const task = await taskService.create(userId, req.body)
  res.status(201).json(task)
}
```

### Error Middleware

```ts
// middleware/error.ts
export function errorHandler(err: Error, req: Request, res: Response, next: NextFunction) {
  if (err instanceof ValidationError) {
    return res.status(400).json({ error: err.message, field: err.field })
  }
  if (err instanceof NotFoundError) {
    return res.status(404).json({ error: err.message })
  }
  console.error('Unhandled error:', err)
  res.status(500).json({ error: 'Internal server error' })
}
```

## Async Patterns

- Always handle promise rejections — no unhandled rejections
- Use `Promise.all` for parallel independent requests
- Use `p-limit` or similar for concurrency control
- Implement timeouts for external calls

```ts
const results = await Promise.all(
  userIds.map(id => fetchUser(id))
)
```

## Security

- Validate and sanitize all input (use zod, joi, or express-validator)
- Parameterize SQL queries (never concatenate)
- Set security headers (helmet middleware)
- Rate limit endpoints
- Validate Content-Type and Content-Length

## Verification

- [ ] Error middleware is the last middleware registered
- [ ] All async handlers have error wrapping (try/catch or async-error wrapper)
- [ ] Input validation exists on all mutation endpoints
- [ ] No secrets in code, logs, or environment defaults
- [ ] Database queries are parameterized
