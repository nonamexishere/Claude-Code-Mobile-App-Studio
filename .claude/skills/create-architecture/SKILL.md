---
name: create-architecture
description: "Design the overall mobile app architecture. Covers folder structure, state management, navigation, API layer, and offline strategy."
argument-hint: ""
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, AskUserQuestion, Task
---

When this skill is invoked:

1. **Read existing context** — check `docs/product-brief.md`, `docs/features.md`, `docs/tech-stack.md`.

2. **Determine architecture needs** using `AskUserQuestion`:

   - Tab "Pattern" — "Architecture pattern?"
     Options: Feature-first / Layer-first / Clean Architecture / MVVM / MVI / TCA (iOS) / BLoC (Flutter)
   - Tab "Scale" — "Expected app complexity?"
     Options: Simple (5-10 screens) / Medium (10-25 screens) / Large (25+ screens) / Enterprise
   - Tab "Offline" — "Offline support needed?"
     Options: No offline / Cache only / Offline-first with sync / Full offline mode

3. **Generate architecture document** covering:

   - **Folder structure**: Complete directory tree adapted to chosen platform
   - **Architecture layers**:
     - Presentation (screens, components, view models)
     - Domain (use cases, entities, repositories interfaces)
     - Data (API clients, local DB, repository implementations)
   - **State management**: Setup and patterns for chosen solution
   - **Navigation**: Route definitions, deep link handling, auth guards
   - **API layer**: HTTP client setup, interceptors, error handling, retry logic
   - **Local storage**: Database schema, caching strategy, secure storage
   - **Dependency injection**: Setup for chosen DI solution
   - **Error handling**: Global error boundary, crash reporting integration
   - **Environment config**: Dev/staging/prod configurations

4. **Generate architecture diagram** (ASCII):
   ```
   ┌──────────────────────────────────────┐
   │           Presentation               │
   │  Screens → Components → ViewModels   │
   ├──────────────────────────────────────┤
   │             Domain                   │
   │  UseCases → Entities → Repositories  │
   ├──────────────────────────────────────┤
   │              Data                    │
   │  API Client ← Repository → Local DB │
   └──────────────────────────────────────┘
   ```

5. **Write output** to `docs/architecture.md`.

6. **Optionally scaffold** the folder structure if user confirms.

7. **Final step — handoff.** Follow `.claude/docs/handoff-template.md`.

   - Append breadcrumb to `.claude/session/active.md`:
     ```
     ## /create-architecture — [YYYY-MM-DD HH:MM]
     - Action: wrote docs/architecture.md with [pattern] pattern
     - Recommended next: /setup-navigation
     ```
   - Render the handoff block with:
     - `/setup-navigation` — wire the navigation shell implied by this architecture *(recommended)*
     - `/setup-theme` — establish the design system before building screens
     - `/design-api` — define API contracts
     - `/design-database` — model local data for offline/cache needs
     - `@mobile-architect` — challenge architecture choices
