---
name: accessibility
description: Ensures web applications meet WCAG 2.2 AA accessibility standards with proper semantic HTML, ARIA, keyboard navigation, focus management, and screen reader support. Use when building or auditing UI for accessibility compliance.
license: MIT
compatibility: opencode
metadata:
  domain: accessibility
---

# Accessibility

## Overview

Build interfaces that meet WCAG 2.2 AA standards: perceivable, operable, understandable, and robust for all users including those using screen readers, keyboard navigation, or assistive technologies.

## When to Use

- Building any user-facing components
- Adding interactive elements (modals, dropdowns, tabs)
- Creating forms with validation
- Reviewing UI accessibility
- Before production release

## WCAG 2.2 AA Requirements

### Perceivable

- All non-text content has text alternatives (`alt` on images, labels on icons)
- Captions provided for audio/video
- Content adapts without loss of meaning
- Color contrast >= 4.5:1 normal text, 3:1 large text

### Operable

- All functionality available via keyboard
- No keyboard traps
- Skip navigation links provided
- Focus order preserves logical reading order
- Motion/animation respects `prefers-reduced-motion`

### Understandable

- Page language set (`<html lang="en">`)
- Focus indicators visible (minimum 2px outline)
- Input labels and error messages are clear
- Consistent navigation and labeling

### Robust

- Semantic HTML elements used correctly
- ARIA attributes valid and only when needed
- Proper role, state, and value updates for dynamic content

## Implementation Patterns

### Semantic HTML First

```html
<!-- Good: semantic -->
<nav aria-label="Main navigation">
  <button>Menu</button>
</nav>

<!-- Avoid: div soup -->
<div class="nav">
  <div class="menu-btn">Menu</div>
</div>
```

### Keyboard Navigation

```tsx
// All interactive elements must be keyboard accessible
<button onClick={handleClick}>Submit</button>                    // ✓ Native
<div role="button" tabIndex={0} onKeyDown={handleKey}>Submit</div> // ✓ Custom
```

### ARIA Labels

```tsx
<button aria-label="Close dialog"><XIcon /></button>
<input aria-label="Search tasks" type="search" />
<div role="alert" aria-live="polite">Task created successfully</div>
```

### Focus Management

```tsx
function Dialog({ isOpen }: { isOpen: boolean }) {
  const closeRef = useRef<HTMLButtonElement>(null)
  useEffect(() => { if (isOpen) closeRef.current?.focus() }, [isOpen])
  return isOpen ? <dialog><button ref={closeRef}>Close</button></dialog> : null
}
```

## Testing

- Tab through every interactive element
- Test with screen reader (VoiceOver, NVDA, or JAWS)
- Run axe-core or Lighthouse accessibility audit
- Verify no color-only information
- Test zoom to 200%

## Verification

- [ ] Semantic HTML is used over generic `<div>`s
- [ ] All interactive elements are keyboard accessible
- [ ] Color contrast meets WCAG AA (4.5:1 text, 3:1 large)
- [ ] Form inputs have associated labels
- [ ] Error messages are announced (aria-live or role="alert")
- [ ] No accessibility violations in audit tool
