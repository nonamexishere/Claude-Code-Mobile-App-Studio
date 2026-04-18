---
name: design-api
description: "Design mobile-optimized API endpoints. Considers pagination, delta sync, offline support, and mobile bandwidth constraints."
argument-hint: "[resource-name]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, AskUserQuestion, Task
---

When this skill is invoked:

1. **Read existing context** — check `docs/architecture.md`, `docs/features.md`.

2. **Determine API approach** using `AskUserQuestion`:

   - Tab "Style" — "API style?"
     Options: REST / GraphQL / gRPC / Firebase Firestore / Supabase
   - Tab "Auth" — "API authentication?"
     Options: JWT Bearer / OAuth 2.0 / Firebase Auth / API Key / Session
   - Tab "Sync" — "Data sync strategy?"
     Options: Standard request-response / Polling / WebSocket real-time / Delta sync / Server-Sent Events

3. **Generate API documentation** with:

   - **Endpoint definitions** for each resource:
     - Method, path, description
     - Request body / query params
     - Response schema with example
     - Error responses
     - Auth requirements
   - **Mobile optimizations**:
     - Cursor-based pagination (not offset)
     - Sparse fieldsets (request only needed fields)
     - Batch endpoints for reducing round trips
     - Delta sync endpoints (send changes since last sync)
     - Compressed responses (gzip)
     - ETag / If-Modified-Since for caching
   - **Real-time endpoints** (if applicable):
     - WebSocket events
     - Firestore listeners
     - Supabase realtime subscriptions
   - **Rate limiting** and retry strategy
   - **Offline queue** format for pending mutations

4. **Write output** to `docs/api/<resource>.md` or `docs/api/api-design.md`.

5. **Final step — handoff.** Follow `.claude/docs/handoff-template.md`.

   - Append breadcrumb to `.claude/session/active.md`:
     ```
     ## /design-api — [YYYY-MM-DD HH:MM]
     - Action: designed [style] API contract with [sync strategy]
     - Recommended next: /create-endpoint
     ```
   - Render the handoff block with:
     - `/create-endpoint` — implement the first endpoint from the contract *(recommended)*
     - `/create-model` — generate typed models matching API schemas
     - `/design-database` — align schema with API resource shapes
     - `/setup-offline` — wire mutation queue from the contract
     - `@api-developer` — contract review and versioning strategy
