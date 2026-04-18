---
name: setup-offline
description: "Implement offline-first architecture with local database, sync engine, conflict resolution, and network status handling."
argument-hint: "[strategy: cache-first|offline-first|sync]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash, AskUserQuestion
---

When this skill is invoked:

1. **Detect the project platform and backend** from config files.

2. **Ask about offline requirements** using `AskUserQuestion`:

   - Tab "Strategy" — "Offline strategy?"
     Options: Cache-first (read offline, write online) / Offline-first (full read-write offline) / Selective (only certain data offline)
   - Tab "Sync" — "Sync approach?"
     Options: Pull-only (server wins) / Push-pull (bidirectional) / CRDT (automatic merge) / Custom conflict resolution
   - Tab "Scope" — "What data goes offline?"
     Options: All data / User's own data / Recent data only / Specific collections

3. **Generate offline implementation**:

   - **Network monitor**: Connectivity status detection and listeners
   - **Local database setup**:
     - RN: WatermelonDB or MMKV
     - Flutter: Drift, Isar, or Hive
     - iOS: SwiftData or Core Data
     - Android: Room
   - **Sync engine**:
     - Mutation queue for offline writes
     - Conflict detection (timestamp or version-based)
     - Conflict resolution strategy
     - Retry logic with exponential backoff
     - Delta sync (only fetch changes since last sync)
   - **Data flow**:
     ```
     UI → Repository → Local DB (immediate) → Sync Queue → API
                    ↑                                      │
                    └──────── Background Sync ←────────────┘
     ```
   - **Cache management**:
     - Cache invalidation strategy
     - Storage limits and eviction
     - Stale data indicators in UI
   - **UI indicators**:
     - Offline banner / connectivity indicator
     - Pending sync badge
     - Last synced timestamp
     - Conflict resolution UI

4. **Write files** to `src/sync/` or `src/offline/`.

5. **Final step — handoff.** Follow `.claude/docs/handoff-template.md`.

   - Append breadcrumb to `.claude/session/active.md`:
     ```
     ## /setup-offline — [YYYY-MM-DD HH:MM]
     - Action: wired [strategy] offline architecture with [sync approach]
     - Recommended next: /design-database
     ```
   - Render the handoff block with:
     - `/design-database` — design sync-friendly schemas with conflict metadata *(recommended)*
     - `/create-model` — generate models with sync status fields
     - `/write-tests` — cover sync, conflict, and offline flows
     - `/audit-performance` — check sync overhead on battery and memory
     - `@offline-specialist` — advanced sync patterns and CRDT design
