---
name: design-api
description: "Design mobile-optimized API endpoints. Considers pagination, delta sync, offline support, and mobile bandwidth constraints."
argument-hint: "[resource-name]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, AskUserQuestion
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

5. **Suggest next steps**:
   1. "Run `/create-endpoint <name>` to implement an endpoint"
   2. "Run `/create-model <name>` to generate data models"
   3. "Run `/setup-offline` to implement offline sync"
   4. "Talk to `@api-developer` for API implementation help"
