# Bug Report

File a structured bug report with reproduction steps.

## Template

````markdown
## Summary
[One-line description of the bug]

## Environment
- **OS:** [e.g., macOS 15.0]
- **Browser/Version:** [e.g., Chrome 126]
- **App Version:** [e.g., v1.2.0]
- **Device:** [e.g., iPhone 15, MacBook Pro M3]

## Steps to Reproduce
1. Go to '...'
2. Click on '...'
3. Scroll down to '...'
4. See error

## Expected Behavior
[What should happen]

## Actual Behavior
[What actually happens]

## Screenshots/Video
[If applicable, add media]

## Console/Network Errors
```
[paste any error messages]
```

## Additional Context
[Any other relevant information]
````

## Example

````markdown
## Summary
Task creation fails when title contains special characters

## Environment
- **OS:** macOS 15.0
- **Browser/Version:** Chrome 126
- **App Version:** v1.2.0

## Steps to Reproduce
1. Open task creation form
2. Enter title: "Project <urgent> needs review"
3. Click "Create"
4. See 500 error toast

## Expected Behavior
Task is created with the title saved as-is

## Actual Behavior
Server returns 500 error, no task created

## Console/Network Errors
```
POST /api/tasks 500
Error: SQL syntax error near ">"
```
````

## Rules

- Provide exact steps to reproduce (someone else must be able to follow them)
- Include environment details that might matter
- Separate expected from actual behavior
- Attach errors, logs, or screenshots
- Avoid vague language ("it crashed", "it broke")
