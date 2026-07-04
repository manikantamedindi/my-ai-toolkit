# Commit Message

Generate a Conventional Commit message from staged changes.

## Format

```
<type>(<scope>): <description>

[optional body]

[optional footer]
```

## Types

| Type | When |
|------|------|
| `feat` | New feature |
| `fix` | Bug fix |
| `chore` | Maintenance, tooling, deps |
| `refactor` | Code restructuring |
| `docs` | Documentation |
| `style` | Formatting, whitespace |
| `test` | Adding/fixing tests |
| `perf` | Performance |
| `ci` | CI/CD changes |

## Example Input/Output

**Input:** `git diff --cached` for adding user authentication

**Output:**
```
feat(auth): add JWT-based user authentication

Implement login, logout, and token refresh endpoints.
Passwords hashed with bcrypt, tokens stored in httpOnly cookies.

Closes #42
```

## Rules

- First line: max 72 chars, imperative mood, no period
- Body: explain what and why, not how
- Footer: references to issues (`Closes #123`, `Refs #456`)
- Scope: the module/component affected
