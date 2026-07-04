---
name: typescript
description: Writes type-safe TypeScript with strict mode, proper generics, discriminated unions, and advanced type patterns. Use when writing or reviewing TypeScript code, defining types, or improving type safety.
license: MIT
compatibility: opencode
metadata:
  domain: typescript
---

# TypeScript Development

## Overview

Write type-safe TypeScript using strict mode, proper generics, discriminated unions, and advanced type patterns without over-engineering.

## When to Use

- Writing any TypeScript code
- Defining interfaces, types, or generics
- Reviewing TypeScript for type safety
- Configuring tsconfig
- Migrating JS to TS

## Configuration

```json
{
  "compilerOptions": {
    "strict": true,
    "noUncheckedIndexedAccess": true,
    "exactOptionalPropertyTypes": true,
    "noPropertyAccessFromIndexSignature": true
  }
}
```

## Type Patterns

### Discriminated Unions

```ts
type Result<T, E = Error> =
  | { status: 'success'; data: T }
  | { status: 'error'; error: E }

function handle(result: Result<User>) {
  if (result.status === 'success') {
    // result.data is typed as User
    console.log(result.data.name)
  } else {
    // result.error is typed as Error
    console.error(result.error.message)
  }
}
```

### Branded Types

```ts
type UserId = string & { readonly __brand: 'UserId' }
function createUserId(id: string): UserId {
  return id as UserId
}
```

### Generics

```ts
function createApi<T>(basePath: string) {
  return {
    getAll: () => fetch(`${basePath}`).then(r => r.json() as Promise<T[]>),
    getById: (id: string) => fetch(`${basePath}/${id}`).then(r => r.json() as Promise<T>),
  }
}

const taskApi = createApi<Task>('/api/tasks')
```

### The `satisfies` Operator

```ts
const palette = {
  red: [255, 0, 0],
  green: '#00ff00',
} satisfies Record<string, string | number[]>

// palette.green is typed as string, not string | number[]
palette.green.toUpperCase() // OK
```

## Rules

- Prefer `type` over `interface` for unions and intersections
- Use `interface` for public API shapes (better declaration merging)
- Avoid `any` — use `unknown` and narrow with type guards
- Export types used across modules
- Inline types used only in one location

## Red Flags

- `any` used where `unknown` with type narrowing would work
- Unnecessary type assertions (`as`) that silence real type errors
- Over-engineering types with complex conditional types for simple use cases
- `// @ts-ignore` or `// @ts-expect-error` without justification
- Designing overly generic types before the third use case demands it

## Verification

- [ ] `strict: true` in tsconfig
- [ ] No `any` usage without justified exception
- [ ] No `as` casts without justification
- [ ] Function signatures are explicit (no inferred `any` parameters)
- [ ] `noUncheckedIndexedAccess` is respected
