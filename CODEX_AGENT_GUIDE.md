# Codex Agent Guide

## Agent Instructions

### Project Overview
- **Purpose**: Maintain a private, GitHub-first pentest notebook with Markdown notes and a static, searchable site.
- **Architecture**: Markdown content -> static site generator -> GitHub Actions build -> GitHub Pages or artifact hosting.
- **Target Platforms**: GitHub (private/public), corporate and personal machines (Windows/macOS/Linux).
- **Distribution**: GitHub repo + GitHub Pages (or published static artifacts).

## Development Guidelines

### Challenges
- Keep notes practical and scannable.
- Preserve accuracy in security content; avoid myths and unverifiable claims.
- Keep the site build deterministic and fast for frequent commits.

### Code Style
- Write all code, identifiers, and comments in English.
- Prefer ASCII-only content unless a specific term requires Unicode.
- Keep diffs small and reversible; avoid massive rewrites.
- Add comments only when logic is non-obvious.

### Coding Principles
- Work spec-first: define intent, constraints, and acceptance checks before editing.
- Iterate in short loops: draft -> verify -> refine -> document.
- Prefer tooling-assisted changes (scripts, generators, linters) over manual repetition.
- Use tests or quick validation steps when changes can impact builds.
- Keep context hygiene: load only the files needed for the current task.

### Source Integrity and Truthfulness
- Use authoritative sources for security claims (vendor docs, OWASP, MITRE, NIST).
- If a claim is uncertain, label it as an assumption or ask for confirmation.
- Include links or references when adding non-trivial factual content.

### Repository Standards (Industry-Standard Options)
- `README.md` with scope, quickstart, and usage.
- `LICENSE` appropriate for private/public distribution.
- `SECURITY.md` with disclosure policy.
- `CODE_OF_CONDUCT.md` and `CONTRIBUTING.md`.
- `CHANGELOG.md` with semantic versioning notes.
- `CODEOWNERS`, `.editorconfig`, and GitHub issue/PR templates.

### Content Layout
- Markdown root: `notes/`
- Static site output: `site/`
- Optional shared assets: `notes/_assets/`

### Static Site Workflows
- Build on each commit that touches Markdown files.
- Cache dependencies in GitHub Actions for speed.
- Primary workflow file: `.github/workflows/pages.yml` builds `notes/` into `site/` and deploys.
- Deploy to GitHub Pages or store build artifacts for internal use.

### Security and Ethics
- Only document techniques for authorized testing.
- Never store secrets, client names, IPs, or tokens in the repo.
- Use placeholders for sensitive examples.
