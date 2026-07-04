---
name: git
description: Manages Git workflow with conventional commits, atomic commits, branching strategy, and release management. Use when committing changes, creating branches, reviewing history, or preparing releases.
license: MIT
compatibility: opencode
metadata:
  domain: git
---

# Git Workflow

## Overview

Manage source control with atomic commits, Conventional Commits messages, trunk-based or feature-branch workflow, and clean project history.

## When to Use

- Before committing changes
- Creating branches or PRs
- Reviewing commit history
- Preparing release tags
- Rebasing or squashing commits

## Conventional Commits

```
<type>(<scope>): <description>

[optional body]

[optional footer]
```

### Types

| Type | Usage |
|------|-------|
| `feat` | New feature |
| `fix` | Bug fix |
| `chore` | Maintenance, tooling, deps |
| `refactor` | Code restructuring |
| `docs` | Documentation only |
| `style` | Formatting, whitespace |
| `test` | Adding or fixing tests |
| `perf` | Performance improvement |
| `ci` | CI/CD changes |

### Examples

```
feat(tasks): add task completion notification

Send email notification when a task is marked as completed.
Uses the existing notification service.

Closes #123
```

```
fix(api): handle empty task list gracefully

Return 200 with empty array instead of 404 when no tasks exist.
```

## Atomic Commits

Each commit is one logical change:

- One feature, one commit
- One bug fix, one commit
- Refactoring separate from feature work
- Working state at every commit (compiles, tests pass)

## Branching

| Branch | Purpose |
|--------|---------|
| `main` | Production-ready, always deployable |
| `feat/*` | Feature branches, merged via PR |
| `fix/*` | Bug fix branches |
| `chore/*` | Maintenance branches |

Prefer short-lived branches (< 1 day). Squash WIP commits on merge.

## Release

```bash
git tag -a v1.2.3 -m "v1.2.3: Add task completion notification"
git push origin v1.2.3
```

## Verification

- [ ] Commit message follows Conventional Commits format
- [ ] Commit contains one logical change only
- [ ] Tests pass before commit
- [ ] No WIP or debug code committed
- [ ] No secrets or credentials in history
