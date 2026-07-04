# Release Notes

Generate release notes from git history between tags or commits.

## Template

```markdown
# v[version] - [date]

## Highlights
[1-2 sentence summary of the most important changes]

## Added
- [Feature]: [description]

## Fixed
- [Bug]: [description and impact]

## Changed
- [Change]: [description of behavioral or dependency change]

## Deprecated
- [Feature]: [alternative or timeline for removal]

## Removed
- [Feature]: [removed with migration path if applicable]

## Security
- [Fix]: [CVE or vulnerability description]

## Performance
- [Optimization]: [before/after metrics if available]
```

## Example

```markdown
# v1.2.0 - 2026-07-05

## Highlights
Task notifications and improved search performance.

## Added
- Email notifications when tasks are completed
- Full-text search on task titles and descriptions
- Dark mode support

## Fixed
- Empty task list returning 404 instead of 200
- Notification preferences not saving on mobile

## Changed
- Upgraded Express from 4.18 to 4.21
- Notification service configuration format updated (see migration guide)

## Performance
- Search queries 60% faster with new GIN index
```

## Rules

- Group by category: Added, Fixed, Changed, Deprecated, Removed, Security, Performance
- Each entry describes user impact, not implementation detail
- Include migration instructions for breaking changes
- Reference issue numbers where applicable
- Keep highlights to 1-2 sentences maximum
