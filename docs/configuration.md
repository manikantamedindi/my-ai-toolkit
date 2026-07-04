# Configuration

## Skill File Format

Every skill in this toolkit follows the OpenCode standard. Each `SKILL.md` starts with YAML frontmatter:

```yaml
---
name: skill-name          # lowercase, hyphens, matches directory name
description: >-           # 1-1024 chars, includes trigger keywords
  What the skill does and when to use it.
license: MIT
compatibility: opencode
metadata:
  domain: category-name
---
```

Required fields: `name`, `description`. Optional: `license`, `compatibility`, `metadata`.

## Skill Discovery

OpenCode discovers skills from these locations (searched in order):

| Path | Scope |
|------|-------|
| `.opencode/skills/<name>/SKILL.md` | Per-project |
| `.claude/skills/<name>/SKILL.md` | Per-project (Claude compat) |
| `.agents/skills/<name>/SKILL.md` | Per-project (agent compat) |
| `~/.config/opencode/skills/<name>/SKILL.md` | Global |
| `~/.claude/skills/<name>/SKILL.md` | Global (Claude compat) |
| `~/.agents/skills/<name>/SKILL.md` | Global (agent compat) |

Skills with the same name in closer directories override those in parent directories.

## Agent Format

Agents use YAML frontmatter with description, mode, and tool permissions:

```yaml
---
name: agent-name
description: What the agent does
mode: subagent            # subagent for focused roles, primary for full agents
tools:
  read: true
  write: true             # set false for read-only reviewers
  edit: true
  glob: true
  grep: true
  bash: true              # false if agent doesn't need shell access
---
```

## Skill Permissions

Control skill access in `opencode.json`:

```json
{
  "permission": {
    "skill": {
      "*": "allow",
      "seo": "allow",
      "internal-*": "deny",
      "experimental-*": "ask"
    }
  }
}
```

| Value | Behavior |
|-------|----------|
| `allow` | Available to all agents |
| `deny` | Hidden from agents |
| `ask` | User prompted before loading |

## Per-Agent Permissions

Override skill permissions for specific agents:

```json
{
  "agent": {
    "plan": {
      "permission": {
        "skill": {
          "internal-*": "allow"
        }
      }
    }
  }
}
```

## Referencing AGENTS.md

OpenCode auto-discovers `AGENTS.md` from the repo root. For custom paths, configure in `opencode.json`:

```json
{
  "instructions": [
    "/path/to/AGENTS.md"
  ]
}
```

## Git-Based Plugin Config

If your OpenCode version supports remote skill sources:

```json
{
  "skills": {
    "urls": [
      "https://raw.githubusercontent.com/manikantamedindi/my-ai-toolkit/main/skills/index.json"
    ]
  }
}
```
