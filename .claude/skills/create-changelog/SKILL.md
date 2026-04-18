---
name: create-changelog
description: "Generate a changelog from git history. Groups changes by type and formats for release notes."
argument-hint: "[version]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Bash, Write, AskUserQuestion
---

When this skill is invoked:

1. **Determine version range**:
   - If version argument provided, generate changelog for that version
   - Otherwise, generate from last tag to HEAD

2. **Read git history** using conventional commit format:
   - Parse commit messages for type (feat, fix, refactor, etc.)
   - Group by: Features, Bug Fixes, Performance, Breaking Changes, Other

3. **Generate changelog** in Keep a Changelog format:

   ```markdown
   ## [1.2.0] - 2024-01-15

   ### Added
   - New push notification preferences screen
   - Offline mode with background sync

   ### Fixed
   - Crash on login with expired token
   - List not refreshing on pull-to-refresh

   ### Changed
   - Migrated from Redux to Zustand
   - Updated minimum iOS version to 16.0

   ### Performance
   - Reduced cold start time by 40%
   - Optimized image loading with progressive decode
   ```

4. **Also generate store-friendly release notes** (shorter, user-facing):
   ```
   What's New:
   • Offline mode - use the app without internet
   • Push notification preferences
   • Faster app startup
   • Bug fixes and performance improvements
   ```

5. **Write to** `CHANGELOG.md` (append to top) and `docs/release-notes/v<version>.md`.

6. **Final step — handoff.** Follow `.claude/docs/handoff-template.md`.

   - Append breadcrumb to `.claude/session/active.md`:
     ```
     ## /create-changelog — [YYYY-MM-DD HH:MM]
     - Action: generated changelog + store release notes for [version]
     - Recommended next: /build
     ```
   - Render the handoff block with:
     - `/build` — cut the release artifact for this version *(recommended)*
     - `/publish-appstore` — use "What's New" copy in App Store Connect
     - `/publish-playstore` — use release notes in Play Console
     - `/setup-cicd` — auto-generate changelog from CI
     - `@tech-writer` — refine user-facing copy
