---
name: design-database
description: "Design the local and remote database schema. Covers SQLite, Realm, Firestore, and sync-friendly data modeling."
argument-hint: "[entity-name]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, AskUserQuestion, Task
---

When this skill is invoked:

1. **Read existing context** — check `docs/architecture.md`, `docs/api/`.

2. **Determine database needs** using `AskUserQuestion`:

   - Tab "Local DB" — "Local database?"
     Options: SQLite (raw) / WatermelonDB / Drift (Flutter) / Isar / Room (Android) / SwiftData (iOS) / Realm / MMKV (key-value only) / None
   - Tab "Remote DB" — "Remote database?"
     Options: Firestore / Supabase (Postgres) / Custom PostgreSQL / Custom MongoDB / Custom MySQL / None
   - Tab "Sync" — "Sync approach?"
     Options: No sync / Pull-only (server wins) / Push-pull (client + server) / CRDT-based / Custom conflict resolution

3. **Generate database design** with:

   - **Entity-relationship diagram** (ASCII):
     ```
     User ──1:N──→ Post ──1:N──→ Comment
       │                           │
       └──────1:N──→ Like ←──N:1──┘
     ```
   - **Table/Collection schemas** for each entity:
     - Field name, type, constraints
     - Indexes for common queries
     - Relationships (foreign keys / references)
   - **Local database schema**:
     - Tables/collections for offline storage
     - Sync metadata fields (updatedAt, syncStatus, serverId)
     - Migration strategy
   - **Remote database schema**:
     - Collections / tables with security rules
     - Indexes for query optimization
     - Denormalization decisions for mobile performance
   - **Sync conflict resolution** rules per entity

4. **Write output** to `docs/database-design.md`.

5. **Final step — handoff.** Follow `.claude/docs/handoff-template.md`.

   - Append breadcrumb to `.claude/session/active.md`:
     ```
     ## /design-database — [YYYY-MM-DD HH:MM]
     - Action: designed local + remote schema with [sync approach]
     - Recommended next: /create-model
     ```
   - Render the handoff block with:
     - `/create-model` — generate model classes from the schema *(recommended)*
     - `/setup-offline` — implement sync with the designed metadata
     - `/design-api` — align API contracts with the schema
     - `/create-endpoint` — implement CRUD for the first entity
     - `@database-specialist` — indexing and query optimization
