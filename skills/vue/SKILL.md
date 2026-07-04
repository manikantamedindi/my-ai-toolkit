---
name: vue
description: Builds Vue 3 applications with Composition API, Pinia state management, component composition patterns, and performance optimization. Use when building or modifying Vue components or composables.
license: MIT
compatibility: opencode
metadata:
  domain: vue
---

# Vue Development

## Overview

Build Vue 3 applications using the Composition API, script setup, Pinia for state management, and proper component composition patterns.

## When to Use

- Building new Vue components or pages
- Writing composables for reusable logic
- Managing application state with Pinia
- Optimizing Vue render performance
- Setting up Vue project structure

## Component Patterns

### Composition API with `<script setup>`

```vue
<script setup lang="ts">
import { ref, computed, onMounted } from 'vue'

const props = defineProps<{ taskId: string }>()
const emit = defineEmits<{ completed: [id: string] }>()

const task = ref<Task | null>(null)
const isLoading = ref(true)

const title = computed(() => task.value?.title ?? '')

onMounted(async () => {
  task.value = await fetchTask(props.taskId)
  isLoading.value = false
})

function complete() {
  emit('completed', props.taskId)
}
</script>

<template>
  <div v-if="isLoading">Loading...</div>
  <div v-else @click="complete">{{ title }}</div>
</template>
```

### Composables for Reusable Logic

```ts
export function useTaskFilters(tasks: Ref<Task[]>, filter: Ref<Filter>) {
  const filtered = computed(() =>
    tasks.value.filter(t => {
      if (filter.value.status === 'active' && t.done) return false
      if (filter.value.status === 'done' && !t.done) return false
      return true
    })
  )
  return { filtered }
}
```

## State Management with Pinia

```ts
export const useTaskStore = defineStore('tasks', () => {
  const tasks = ref<Task[]>([])
  const fetchTasks = async () => { tasks.value = await api.getTasks() }
  const addTask = async (title: string) => {
    const task = await api.createTask({ title })
    tasks.value.push(task)
  }
  return { tasks, fetchTasks, addTask }
})
```

## Patterns to Follow

- **Composables** over mixins for reusable stateful logic
- **Provide/Inject** for deep prop passing (not for cross-cutting concerns)
- **Slots** for flexible component composition
- **Async components** with `defineAsyncComponent` for code splitting
- **Scoped styles** over global CSS

## Red Flags

- Over-using watchers when computed properties would work
- Mixing Options API and Composition API in the same component
- Missing `:key` in `v-for` (always provide a unique key)
- Mutating props directly in child components
- Large components over 200 lines

## Verification

- [ ] No template warnings in console
- [ ] Composables are pure functions, not side-effect factories
- [ ] Pinia stores are used in setup, not Options API
- [ ] Components under 200 lines
- [ ] Proper `key` usage in `v-for`
