---
name: seo
description: Optimizes web applications for search engines with proper metadata, structured data (JSON-LD), sitemaps, Core Web Vitals, and content strategy. Use when optimizing pages for search visibility or auditing SEO.
license: MIT
compatibility: opencode
metadata:
  domain: seo
---

# SEO Optimization

## Overview

Optimize web applications for search engine visibility through proper meta tags, structured data markup, content strategy, technical SEO, and Core Web Vitals performance.

## When to Use

- Building new pages that need search visibility
- Auditing existing pages for SEO issues
- Implementing structured data for rich results
- Improving Core Web Vitals for search ranking
- Planning content strategy
- Debugging ranking drops

## Technical SEO

### Metadata

```tsx
// Next.js App Router
export const metadata: Metadata = {
  title: 'Page Title | Site Name',
  description: 'Compelling meta description (150-160 chars)',
  openGraph: {
    title: 'OG Title',
    description: 'OG Description',
    images: [{ url: '/og-image.png', width: 1200, height: 630 }],
  },
  robots: { index: true, follow: true },
  alternates: { canonical: 'https://example.com/page' },
}
```

### Structured Data (JSON-LD)

```tsx
<script type="application/ld+json" dangerouslySetInnerHTML={{
  __html: JSON.stringify({
    "@context": "https://schema.org",
    "@type": "Article",
    headline: "Article Title",
    author: { "@type": "Person", name: "Author Name" },
    datePublished: "2026-01-01",
    image: "https://example.com/image.jpg",
  })
}} />
```

### Sitemap

```ts
// app/sitemap.ts (Next.js App Router)
export default async function sitemap(): Promise<MetadataRoute.Sitemap> {
  const posts = await db.query.posts.findMany()
  return [
    { url: 'https://example.com', lastModified: new Date(), priority: 1 },
    ...posts.map(p => ({
      url: `https://example.com/posts/${p.slug}`,
      lastModified: p.updatedAt,
      priority: 0.8,
    })),
  ]
}
```

### Robots.txt

```txt
User-agent: *
Allow: /
Disallow: /admin/
Disallow: /api/
Sitemap: https://example.com/sitemap.xml
```

## Content Strategy

- Title tags: 50-60 characters, include primary keyword
- Meta descriptions: 150-160 characters, include call to action
- Heading structure: one H1, logical H2/H3 hierarchy
- Internal linking: linked to related content with descriptive anchor text

## Red Flags

- Duplicate or missing title tags across pages
- No meta description or auto-generated descriptions
- Missing canonical URL on pages accessible via multiple paths
- Invalid JSON-LD that fails Google Rich Results validation
- Broken internal links or orphan pages with no internal links

## Verification

- [ ] Each page has unique, descriptive title and meta description
- [ ] Canonical URL set (avoid duplicate content)
- [ ] Open Graph tags present for social sharing
- [ ] JSON-LD structured data is valid (test with Google Rich Results)
- [ ] XML sitemap submitted to Google Search Console
- [ ] robots.txt allows indexing of public pages
- [ ] Core Web Vitals pass on mobile and desktop
- [ ] No broken internal links
