---
name: javascript
description: Writes clean, modern JavaScript using ES2024+ features, async patterns, and module best practices. Use when writing or reviewing JavaScript code, choosing patterns for async flow, or structuring modules.
license: MIT
compatibility: opencode
metadata:
  domain: javascript
---

# JavaScript Development

## Overview

Write clean, modern JavaScript using current ECMAScript features, proper async handling, module patterns, and error management.

## When to Use

- Writing any JavaScript code
- Choosing async patterns (callbacks vs promises vs async/await)
- Structuring modules and imports
- Handling errors effectively
- Reviewing JavaScript for quality

## Modern JS Patterns

### Async/Await Over Promises

```js
// Good: async/await for readable async flow
async function fetchUserData(userId) {
  const user = await api.getUser(userId)
  const posts = await api.getPosts(user.id)
  return { user, posts }
}

// Avoid: nested .then chains
api.getUser(id).then(user => api.getPosts(user.id)).then(posts => ...)
```

### Destructuring and Spread

```js
const { name, email, role } = user
const config = { ...defaults, ...userConfig }
const [first, ...rest] = items
```

### Nullish Coalescing and Optional Chaining

```js
const timeout = config.timeout ?? 5000
const city = user?.address?.city ?? 'Unknown'
```

### Array Methods Over Loops

```js
const activeUsers = users.filter(u => u.isActive).map(u => u.name)
const total = items.reduce((sum, item) => sum + item.price, 0)
```

## Module Structure

```js
// Named exports for clarity
export function formatDate(date) { ... }
export function parseInput(input) { ... }

// Default export for the main export of a module
export default class TaskService { ... }
```

## Error Handling

```js
// Specific error types over generic throws
class ValidationError extends Error {
  constructor(message, field) {
    super(message)
    this.name = 'ValidationError'
    this.field = field
  }
}
```

## Red Flags

- `var` declarations anywhere in code
- Mutable shared state across modules
- Callback patterns where async/await would be cleaner
- Unused imports or variables
- `==` instead of `===` (loose equality)

## Verification

- [ ] No `var` — use `const` / `let`
- [ ] No mutable shared state across modules
- [ ] Async functions have proper error handling (try/catch or .catch)
- [ ] No callback patterns where async/await applies
- [ ] Imports are clean (no unused imports, no wildcard imports for few exports)
