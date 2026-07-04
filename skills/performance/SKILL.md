---
name: performance
description: Optimizes web application performance including Core Web Vitals, bundle size, rendering efficiency, network optimization, and image loading. Use when diagnosing slow pages, optimizing load times, or reviewing performance.
license: MIT
compatibility: opencode
metadata:
  domain: performance
---

# Performance Optimization

## Overview

Optimize web application performance using a measure-first approach. Every optimization must have a before/after metric. Focus on Core Web Vitals (LCP, INP, CLS), bundle size, rendering, and network efficiency.

## When to Use

- Page loads are slow or Core Web Vitals fail
- Bundle size is growing unchecked
- Interactions feel sluggish or janky
- Images or assets are loading inefficiently
- Before production launches

## Core Web Vitals

| Metric | Good | Poor | Target |
|--------|------|------|--------|
| LCP (Largest Contentful Paint) | <= 2.5s | > 4.0s | Largest element visible |
| INP (Interaction to Next Paint) | <= 200ms | > 500ms | Responsiveness to input |
| CLS (Cumulative Layout Shift) | <= 0.1 | > 0.25 | Visual stability |

## Optimization Areas

### Bundle Size

- Analyze with `webpack-bundle-analyzer` or `vite-bundle-visualizer`
- Code-split at route boundaries with dynamic imports
- Tree-shake unused exports (check for side-effect flags)
- Remove duplicate dependencies (check with `npm dedupe`)
- Audit third-party library size before adding

### JavaScript

- Lazy load non-critical JS with dynamic imports
- Defer non-critical scripts, preload critical ones
- Avoid long tasks (>50ms) — yield to main thread
- Use `requestAnimationFrame` for visual updates

### Images

```tsx
// Next.js Image component auto-optimizes
import Image from 'next/image'
<Image src="/hero.jpg" width={1200} height={600} alt="" priority />

// Cloudinary/imgix for dynamic resizing
<img src="https://res.cloudinary.com/.../f_auto,q_80/w_800/v1/hero.jpg" alt="" />
```

- Use WebP/AVIF formats
- Set explicit width/height to prevent CLS
- Lazy load below-fold images (`loading="lazy"`)
- Serve responsive sizes with `srcset`

### Caching

- Static assets: immutable caching with content hash in filename
- API responses: Cache-Control headers (public vs private, max-age)
- Service worker for offline/PWA

### Rendering

- Avoid unnecessary re-renders (React.memo, useMemo, useCallback)
- Virtualize long lists (react-window, @tanstack/virtual)
- Debounce search inputs and resize handlers
- Use `content-visibility: auto` for long pages

## Red Flags

- Images without dimensions (causes CLS)
- Unoptimized third-party scripts loading in the critical path
- N+1 API calls in component trees
- No bundle analysis in CI
- Font loading causes invisible text or layout shift

## Verification

- [ ] LCP < 2.5s on mobile 3G
- [ ] INP < 200ms
- [ ] CLS < 0.1
- [ ] Bundle size is tracked and regression checked
- [ ] Images are optimized (format, size, lazy loading)
- [ ] No render-blocking resources in critical path
