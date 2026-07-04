---
name: nuxt
description: Builds Nuxt 3 applications using auto-imports, composables, server routes, modules, and deployment patterns. Use when building or modifying Nuxt pages, composables, server API, or configuration.
license: MIT
compatibility: opencode
metadata:
  domain: nuxt
---

# Nuxt Development

## Overview

Build Nuxt 3 applications leveraging auto-imports, the composables system, server routes, Nitro for API endpoints, and the module ecosystem.

## When to Use

- Building new pages or layouts
- Creating composables for shared logic
- Implementing server API routes with Nitro
- Configuring modules and plugins
- Deploying Nuxt applications

## Project Structure

```
app/
  pages/         # File-based routing
  components/    # Auto-imported components
  composables/   # Auto-imported composables
  layouts/       # Layout components
  middleware/    # Route middleware
server/
  api/           # API endpoints (Nitro)
  middleware/    # Server middleware
  routes/        # Server routes
```

## Key Patterns

### Auto-imports

Nuxt auto-imports from `components/`, `composables/`, and `utils/` — no manual imports needed:

```ts
// composables/useCounter.ts
export const useCounter = () => {
  const count = ref(0)
  const increment = () => count.value++
  return { count, increment }
}
```

### Server Routes

```ts
// server/api/tasks.get.ts
export default defineEventHandler(async (event) => {
  const tasks = await db.query.tasks.findMany()
  return tasks
})

// server/api/tasks.post.ts
export default defineEventHandler(async (event) => {
  const body = await readBody(event)
  const task = await db.insert(tasks).values(body).returning()
  return task
})
```

### Data Fetching

```vue
<script setup lang="ts">
// useFetch with automatic dedup and caching
const { data: tasks, pending, error } = await useFetch('/api/tasks')
const { data: task } = await useFetch(`/api/tasks/${id}`, {
  key: `task-${id}`,
})
</script>
```

## Modules

Use modules from the ecosystem rather than building from scratch:

```ts
// nuxt.config.ts
export default defineNuxtConfig({
  modules: [
    '@nuxt/ui',
    '@nuxtjs/tailwindcss',
    '@pinia/nuxt',
    '@vueuse/nuxt',
  ],
})
```

## Verification

- [ ] Auto-imports work without explicit imports
- [ ] Server routes are in `server/api/` not mixed with pages
- [ ] Data fetching uses `useFetch`/`useAsyncData` over raw `$fetch`
- [ ] Components are PascalCase in templates
- [ ] TypeScript strict mode enabled
