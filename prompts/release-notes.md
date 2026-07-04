# Release Notes

Generate release notes from git history between tags or commits.

## Template

```markdown
# v[version] - [date]

## Highlights
[1-2 sentence summary of the most important changes]

## What's New
- [Feature]: [description]
- [Feature]: [description]

## Bug Fixes
- [Bug]: [description and impact]
- [Bug]: [description and impact]

## Breaking Changes
- [Change]: [migration instructions]

## Deprecations
- [Feature]: [alternative or timeline for removal]

## Performance
- [Optimization]: [before/after metrics if available]

## Dependencies
- [Dependency]: [old version → new version]
```

## Example

```markdown
# v1.2.0 - 2026-07-05

## Highlights
Task notifications and improved search performance.

## What's New
- Email notifications when tasks are completed
- Full-text search on task titles and descriptions
- Dark mode support

## Bug Fixes
- Fixed empty task list returning 404 instead of 200
- Fixed notification preferences not saving on mobile

## Breaking Changes
- Notification service configuration format changed (see migration guide)

## Performance
- Search queries 60% faster with new GIN index
```

## Rules

- Group by category (Added, Fixed, Changed, Deprecated, Removed, Security)
- Each entry describes user impact, not implementation detail
- Include migration instructions for breaking changes
- Reference issue numbers where applicable
