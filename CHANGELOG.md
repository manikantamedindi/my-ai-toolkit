# Changelog

All notable changes to this project are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- Nothing yet.

## [0.2.0] - 2026-07-05

### Added
- 14 skill files in `skills/` with YAML frontmatter and structured content (frontend, react, vue, nextjs, nuxt, javascript, typescript, nodejs, ui-ux, accessibility, performance, seo, testing, git)
- Red Flags sections in all 14 skills (domain-specific anti-pattern checklists)
- 8 agent definitions with YAML frontmatter, tool restrictions, and workflow steps
- Output templates for bug-fixer and ui-reviewer agents
- 5 prompt templates with examples, placeholders, and rules
- 3 documentation files with practical setup, config, and usage guides
- AGENTS.md updated with skill-intent mapping table, invocation rules, and anti-rationalization section

### Changed
- All placeholder stub files replaced with production-quality content
- documentation-writer agent: restructured with proper Workflow section replacing Standards
- frontend-engineer agent: added bash tool permission
- release-notes prompt: aligned template headings with conventional categories (Added, Fixed, Changed)
- documentation prompt: added Rules and Example sections, fixed backtick nesting
- bug-report prompt: fixed nested backtick parsing issue

## [0.1.0] - 2026-07-05

### Added
- Initial project structure with skills/, agents/, prompts/, templates/, examples/, and docs/ directories
- Agent definitions for frontend engineer, code reviewer, bug fixer, architect, UI reviewer, performance engineer, SEO specialist, and documentation writer
- Prompt templates for commits, pull requests, release notes, bug reports, and documentation
- MIT License

[0.2.0]: https://github.com/manikantamedindi/my-ai-toolkit/compare/v0.1.0...v0.2.0
[0.1.0]: https://github.com/manikantamedindi/my-ai-toolkit/releases/tag/v0.1.0
