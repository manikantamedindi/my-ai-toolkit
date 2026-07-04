# Pull Request

Generate a pull request description from branch changes.

## Template

```markdown
## Title
[type(scope): Short description]

## Summary
[1-3 sentences describing what this PR does and why]

## Changes
- [Bullet list of specific changes with files or areas]

## Testing
- [ ] Unit tests pass
- [ ] Integration tests pass
- [ ] Manual testing performed (describe)
- [ ] No regressions

## Screenshots (if UI change)
| Before | After |
|--------|-------|
| [screenshot] | [screenshot] |

## Related Issues
Closes #[issue]
```

## Example

**Branch:** `feat/task-notifications`

```markdown
feat(tasks): add email notification on task completion

Send email notifications when a task is marked as completed.
Uses the existing notification service and respects user preferences.

## Changes
- Add notification trigger in TaskService.completeTask()
- Create email notification template
- Add notification preference toggle to user settings page

## Testing
- [x] New unit tests for notification service
- [x] Existing tests pass
- [x] Manual: created a task and marked complete — email received
```

## Rules

- Title follows Conventional Commits format
- Summary explains *why* this change exists
- Changes are specific and scannable
- Testing section shows what was verified
- Screenshots for any UI change
