---
name: ui-ux
description: Designs user interfaces following design system principles, visual hierarchy, spacing scales, typography, and interaction patterns. Use when designing layouts, choosing visual styles, or reviewing UI quality.
license: MIT
compatibility: opencode
metadata:
  domain: ui-ux
---

# UI/UX Design

## Overview

Design user interfaces with consistent visual hierarchy, proper spacing scales, thoughtful typography, intentional color usage, and polished micro-interactions that feel production-quality.

## When to Use

- Designing new layouts or page structures
- Choosing visual styles and design tokens
- Creating consistent spacing and typography
- Reviewing UI for visual quality
- Planning component design systems

## Design Principles

### Spacing Scale

Use a consistent scale, not arbitrary values:

```css
/* Good: scale-based */
{ padding: 0.25rem; }   /* 4px  */
{ padding: 0.5rem; }    /* 8px  */
{ padding: 1rem; }      /* 16px */
{ padding: 1.5rem; }    /* 24px */
{ padding: 2rem; }      /* 32px */

/* Bad: arbitrary */
{ padding: 13px; }
{ padding: 2.3rem; }
```

### Typography Hierarchy

```
h1 → Page title (one per page)
h2 → Section title
h3 → Subsection title
body → Default text
small → Secondary/helper text
```

Never skip heading levels. Never use heading styles for non-heading content.

### Color

- Use semantic tokens: `--color-primary`, `--color-surface`, `--color-border`
- Minimum 4.5:1 contrast for normal text, 3:1 for large text
- Never rely solely on color to convey information

## AI Aesthetic Anti-Patterns

| Avoid | Instead |
|-------|---------|
| Purple/indigo everything | Project's actual color palette |
| Excessive rounded corners | Consistent border-radius scale |
| Generic hero sections | Content-first layouts |
| Lorem ipsum | Realistic placeholder content |
| Oversized padding | Consistent spacing scale |
| Shadow-heavy design | Subtle or no shadows |

## Layout Patterns

- **Single column** for mobile content-first layouts
- **Sidebar + content** for dashboard and management UIs
- **Card grid** for browse/explore pages
- **Full-width** for landing/hero sections

## Red Flags

- Arbitrary spacing values not on the project's spacing scale
- Inconsistent typography — skipping heading levels, using heading styles on non-headings
- Color as the sole indicator of state (missing text labels or icons)
- Lorem ipsum or placeholder text that hides real layout problems
- Oversized padding that wastes screen space on all viewports

## Verification

- [ ] Consistent spacing scale used throughout
- [ ] Typography hierarchy is intentional and consistent
- [ ] Color contrast meets WCAG AA minimums
- [ ] No "AI aesthetic" patterns (purple gradients, excessive shadows)
- [ ] Layout is responsive at all breakpoints
