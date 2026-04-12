---
name: create-endpoint
description: "Create a mobile-optimized API endpoint or service method with proper error handling, caching, and offline support."
argument-hint: "<METHOD> <path> (e.g., GET /api/users)"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash, AskUserQuestion
---

When this skill is invoked:

1. **Detect the project setup** — check for Firebase, Supabase, or custom API configuration.

2. **Parse the endpoint** from arguments (e.g., "POST /api/posts").

3. **Ask about endpoint details** using `AskUserQuestion` if needed:

   - Tab "Type" — "Endpoint type?"
     Options: CRUD / List with pagination / File upload / Real-time subscription / Batch operation / Custom
   - Tab "Cache" — "Caching strategy?"
     Options: No cache / Cache-first / Network-first / Stale-while-revalidate / Cache-only (offline)

4. **Generate based on backend type**:

   **Custom REST API**:
   - API service method with typed request/response
   - HTTP client call with proper headers
   - Request/response interceptors
   - Error mapping to user-friendly messages
   - Retry logic with exponential backoff

   **Firebase**:
   - Firestore query or Cloud Function
   - Real-time listener setup
   - Offline persistence handling
   - Pagination with query cursors

   **Supabase**:
   - Database query with PostgREST
   - RPC function call
   - Realtime subscription
   - RLS-aware query patterns

   **GraphQL**:
   - Query/mutation definition
   - Generated types (codegen)
   - Cache policy (Apollo/urql)
   - Optimistic updates

5. **Generate supporting files**:
   - Request/response types (TypeScript interfaces, Dart classes, Swift Codable, Kotlin data classes)
   - Repository method
   - Offline queue support (if applicable)
   - Test file with mock responses

6. **Suggest next steps**:
   1. "Run `/create-model` to generate data models for this endpoint"
   2. "Run `/setup-offline` to add offline support for this endpoint"
