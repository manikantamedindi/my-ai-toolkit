---
name: testing
description: Drives development with tests across unit, integration, and E2E levels. Use when implementing any logic, fixing bugs, writing test suites, or reviewing test coverage.
license: MIT
compatibility: opencode
metadata:
  domain: testing
---

# Testing

## Overview

Write tests at the appropriate level of the test pyramid — unit, integration, and E2E — using the TDD cycle (RED → GREEN → REFACTOR). Tests are proof; "seems right" is not done.

## When to Use

- Implementing any new logic or behavior
- Fixing any bug (the Prove-It Pattern)
- Modifying existing functionality
- Adding edge case handling
- Reviewing test coverage

## Test Pyramid

```
          /\
         /  \         E2E Tests (~5%)
        /    \        Critical user flows
       /------\
      /        \      Integration (~15%)
     /          \     Component interactions, API boundaries
    /------------\
   /              \   Unit Tests (~80%)
  /                \  Pure logic, isolated, milliseconds
 /------------------\
```

## The TDD Cycle

### RED — Write a Failing Test

```typescript
describe('TaskService', () => {
  it('creates a task with title and default status', async () => {
    const task = await taskService.createTask({ title: 'Buy groceries' })
    expect(task.id).toBeDefined()
    expect(task.title).toBe('Buy groceries')
    expect(task.status).toBe('pending')
  })
})
```

### GREEN — Make It Pass

```typescript
export async function createTask(input: { title: string }): Promise<Task> {
  return db.insert(tasks).values({ title: input.title, status: 'pending' }).returning()
}
```

### REFACTOR — Clean Up

With tests green, improve structure without changing behavior. Run tests after each refactor step.

## The Prove-It Pattern (Bug Fixes)

```
Bug report → Write reproduction test → Test FAILS → Fix → Test PASSES
```

```typescript
// Step 1: Reproduction test (must FAIL)
it('sets completedAt when task is completed', async () => {
  const task = await taskService.createTask({ title: 'Test' })
  const completed = await taskService.completeTask(task.id)
  expect(completed.completedAt).toBeInstanceOf(Date) // Fails → bug confirmed
})
```

## Test Quality

- **DAMP over DRY** in tests — each test should tell a complete story
- **Arrange-Act-Assert** pattern
- **One assertion per concept**
- **Descriptive test names** — read like a specification
- **Prefer real implementations** over mocks (real → fake → stub → mock)

## Red Flags

- Tests that verify implementation details instead of behavior (break on refactor)
- Over-mocking — mocking internal functions instead of testing real integration
- Skipped or disabled tests in the suite
- Snapshot tests that nobody reviews (large, brittle, accepted without scrutiny)
- Test names that don't describe expected behavior ("test 1", "should work")

## Verification

- [ ] Every new behavior has a corresponding test
- [ ] All tests pass
- [ ] Bug fixes include a reproduction test that failed before the fix
- [ ] Test names describe the behavior being verified
- [ ] No tests were skipped or disabled
