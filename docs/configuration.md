# Configuration

## OpenCode Config (opencode.json)

Reference skills and agents from this toolkit in your `opencode.json`:

```json
{
  "instructions": [
    "/path/to/AGENTS.md"
  ]
}
```

## Loading Skills

OpenCode discovers skills from these locations (searched in order):

| Path | Scope |
|------|-------|
| `.opencode/skills/<name>/SKILL.md` | Per-project |
| `.claude/skills/<name>/SKILL.md` | Per-project (Claude compat) |
| `.agents/skills/<name>/SKILL.md` | Per-project (agent compat) |
| `~/.config/opencode/skills/<name>/SKILL.md` | Global |
| `~/.claude/skills/<name>/SKILL.md` | Global (Claude compat) |
| `~/.agents/skills/<name>/SKILL.md` | Global (agent compat) |

## Skill Permissions

Control skill access with pattern-based rules:

```json
{
  "permission": {
    "skill": {
      "*": "allow",
      "seo": "allow",
      "internal-*": "deny"
    }
  }
}
```

| Value | Behavior |
|-------|----------|
| `allow` | Skill loads immediately |
| `deny` | Skill hidden from agent |
| `ask` | User prompted before loading |

## Referencing AGENTS.md

To load the repo's agent instructions automatically, open OpenCode from the repo root — it will auto-discover `AGENTS.md`.
