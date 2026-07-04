---
name: nextjs
description: Builds Next.js applications using App Router, React Server Components, data fetching patterns, and deployment optimization. Use when building or modifying Next.js pages, API routes, middleware, or configuration.
license: MIT
compatibility: opencode
metadata:
  domain: nextjs
---

# Next.js Development

## Overview

Build Next.js applications with App Router, React Server Components (RSC), appropriate data fetching strategies, middleware, and route handlers.

## When to Use

- Building new pages or layouts in App Router
- Implementing data fetching (SSR, SSG, ISR, streaming)
- Creating API routes or route handlers
- Configuring middleware, rewrites, or redirects
- Optimizing for deployment (Vercel, self-hosted)

## App Router Patterns

### Server Components by Default

```tsx
// page.tsx — Server Component by default
export default async function TasksPage() {
  const tasks = await db.query.tasks.findMany()
  return <TaskList tasks={tasks} />
}
```

Use `'use client'` only when you need interactivity, browser APIs, or lifecycle hooks.

### Data Fetching Strategies

| Strategy | Method | Use Case |
|----------|--------|----------|
| Server fetch | `async component` | Default — fetch in Server Component |
| Static | `generateStaticParams` | SSG for known paths |
| ISR | `next.revalidate` | Time-based revalidation |
| Streaming | `<Suspense>` boundary | Progressive rendering |
| Client fetch | `useEffect` / React Query | Real-time or user-specific data |

```tsx
// ISR with on-demand revalidation
export default async function PostPage({ params }: { params: { id: string } }) {
  const post = await fetch(`https://api.example.com/posts/${params.id}`, {
    next: { revalidate: 3600 } // Revalidate every hour
  }).then(r => r.json())
  return <Post post={post} />
}
```

### Route Handlers

```tsx
// app/api/tasks/route.ts
export async function GET() {
  const tasks = await db.query.tasks.findMany()
  return Response.json(tasks)
}

export async function POST(req: Request) {
  const body = await req.json()
  const task = await db.insert(tasks).values(body).returning()
  return Response.json(task, { status: 201 })
}
```

### Middleware

```ts
// middleware.ts
export function middleware(request: NextRequest) {
  if (!request.cookies.has('session')) {
    return NextResponse.redirect(new URL('/login', request.url))
  }
}

export const config = { matcher: ['/dashboard/:path*'] }
```

## Metadata

```ts
export const metadata: Metadata = {
  title: 'Tasks',
  description: 'Manage your tasks efficiently',
}
```

## Verification

- [ ] Server Components used where possible (no unnecessary 'use client')
- [ ] Data fetching strategy matches the use case (SSR vs SSG vs ISR)
- [ ] Route handlers have proper error handling
- [ ] Middleware matchers are specific, not broad
- [ ] Metadata is set for all pages
