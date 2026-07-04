---
name: react
description: Builds React applications with idiomatic patterns including hooks, composition, server components, and performance optimization. Use when building or modifying React components, hooks, or context providers.
license: MIT
compatibility: opencode
metadata:
  domain: react
---

# React Development

## Overview

Build React applications using idiomatic patterns — hooks for state and effects, composition over inheritance, proper component splitting, and performance-aware rendering.

## When to Use

- Building new React components or pages
- Writing custom hooks
- Managing component state
- Optimizing render performance
- Setting up React project structure

## Component Patterns

### Functional Components with Hooks

```tsx
export function TaskItem({ task, onToggle, onDelete }: TaskItemProps) {
  return (
    <li className="flex items-center gap-3 p-3">
      <Checkbox checked={task.done} onChange={() => onToggle(task.id)} />
      <span className={task.done ? 'line-through text-muted' : ''}>{task.title}</span>
      <Button variant="ghost" size="sm" onClick={() => onDelete(task.id)}>
        <TrashIcon />
      </Button>
    </li>
  );
}
```

### Custom Hooks

```tsx
export function useTaskFilters(tasks: Task[], filter: Filter) {
  return useMemo(() => {
    return tasks.filter(t => {
      if (filter.status === 'active' && t.done) return false;
      if (filter.status === 'done' && !t.done) return false;
      if (filter.search && !t.title.toLowerCase().includes(filter.search.toLowerCase())) return false;
      return true;
    });
  }, [tasks, filter]);
}
```

## Performance Rules

- `useMemo` for expensive computations, not trivial ones
- `useCallback` only when passing callbacks to memoized children
- React.memo only when component re-renders often with same props
- Keep context values stable — memoize the value object
- Lazy load route components with `React.lazy` and `Suspense`

## State Management

```tsx
// Lift state only when needed
function TaskApp() {
  const [tasks, setTasks] = useState<Task[]>([]);
  // Pass down state + dispatch, not mutators
  return (
    <TaskContext.Provider value={{ tasks, setTasks }}>
      <TaskList />
      <CreateTask />
    </TaskContext.Provider>
  );
}
```

## Patterns to Follow

- **Composition** over inheritance and configuration objects
- **Container/Presentation** separation for data-fetching components
- **Custom hooks** to encapsulate reusable logic
- **Co-located** tests, styles, and types with components

## Red Flags

- `useEffect` used for derived state (compute it instead)
- Prop drilling deeper than 3 levels
- Context used for frequently-updating state (causes full subtree re-renders)
- Over-engineering: premature abstractions, generic components before 3rd use case
- `any` type or `as` casts without justification

## Verification

- [ ] No unnecessary re-renders (verify with React DevTools)
- [ ] Hooks follow rules (no conditional hooks, hooks called in same order)
- [ ] Effects cleaned up properly (return cleanup function)
- [ ] Keys are stable and unique in lists
- [ ] Components are under 200 lines
