---
name: frontend
description: Builds production-quality frontend interfaces with proper component architecture, state management, responsive design, and accessibility. Use when building or modifying user-facing interfaces, implementing layouts, or creating UI components.
license: MIT
compatibility: opencode
metadata:
  domain: frontend
---

# Frontend Development

## Overview

Build production-quality frontend interfaces following component architecture principles, proper state management, responsive design, and accessibility standards.

## When to Use

- Building new UI components or pages
- Modifying existing user-facing interfaces
- Implementing responsive layouts
- Adding interactivity or state management
- Fixing visual or UX issues

## Component Architecture

### File Structure

Colocate everything related to a component:

```
src/components/
  TaskList/
    TaskList.tsx          # Component implementation
    TaskList.test.tsx     # Tests
    TaskList.stories.tsx  # Storybook stories (if using)
    use-task-list.ts      # Custom hook (if complex state)
    types.ts              # Component-specific types (if needed)
```

### Composition Over Configuration

```tsx
// Good: Composable
<Card>
  <CardHeader><CardTitle>Tasks</CardTitle></CardHeader>
  <CardBody><TaskList tasks={tasks} /></CardBody>
</Card>

// Avoid: Over-configured
<Card title="Tasks" headerVariant="large" bodyPadding="md" content={<TaskList tasks={tasks} />} />
```

### Separation of Concerns

Separate data fetching from presentation:

```tsx
// Container: handles data
export function TaskListContainer() {
  const { tasks, isLoading, error } = useTasks();
  if (isLoading) return <TaskListSkeleton />;
  if (error) return <ErrorState message="Failed to load tasks" retry={refetch} />;
  if (tasks.length === 0) return <EmptyState message="No tasks yet" />;
  return <TaskList tasks={tasks} />;
}

// Presentation: handles rendering
export function TaskList({ tasks }: { tasks: Task[] }) {
  return <ul role="list" className="divide-y">{tasks.map(task => <TaskItem key={task.id} task={task} />)}</ul>;
}
```

## State Management

Choose the simplest approach that works:

| Approach | Use Case |
|----------|----------|
| `useState` | Component-specific UI state |
| Lifted state | Shared between 2-3 sibling components |
| Context | Theme, auth, locale (read-heavy, write-rare) |
| URL state | Filters, pagination, shareable UI state |
| Server state (React Query, SWR) | Remote data with caching |
| Global store (Zustand, Redux) | Complex client state shared app-wide |

Avoid prop drilling deeper than 3 levels.

## Responsive Design

Design mobile-first:

```tsx
<div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4">
```

Test at 320px, 768px, 1024px, 1440px.

## Accessibility Requirements

- All interactive elements keyboard accessible
- Semantic HTML (use `button`, `nav`, `main`, `aside` over `div` spam)
- ARIA labels on icon-only controls
- Proper heading hierarchy (one `h1` per page, no skipped levels)
- Color contrast >= 4.5:1 for normal text
- Loading, error, and empty states for all data-driven components

## Red Flags

- Components over 200 lines — split them
- No loading, error, or empty states on data-driven components
- Prop drilling past 3 levels without introducing context
- Inline styles or arbitrary pixel values instead of design tokens
- "AI aesthetic" (purple gradients, oversized cards, excessive shadows)

## Verification

- [ ] Component renders without console errors
- [ ] All interactive elements are keyboard accessible
- [ ] Works at 320px, 768px, 1024px, 1440px
- [ ] Loading, error, and empty states handled
- [ ] Follows project's design system (spacing, colors, typography)
- [ ] No accessibility issues in axe-core or Lighthouse
