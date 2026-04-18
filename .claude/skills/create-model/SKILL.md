---
name: create-model
description: "Generate data model classes with serialization, validation, and local database mapping for the target platform."
argument-hint: "<ModelName> [--fields id:string,name:string,email:string]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash, AskUserQuestion
---

When this skill is invoked:

1. **Detect the project platform** from config files.

2. **Parse arguments** for model name and optional --fields flag.

3. **Ask about the model** using `AskUserQuestion` if fields not provided:

   - Tab "Fields" — "Describe the model fields (name:type pairs)"
     Free text input
   - Tab "Features" — "Model features?"
     Options (multi): JSON serialization / Local DB mapping / Validation / Copy-with / Equality / Sync metadata

4. **Generate model** based on platform:

   **TypeScript (React Native)**:
   - Interface/type definition
   - Zod schema for validation
   - JSON serialization helpers
   - WatermelonDB model class (if using WatermelonDB)

   **Dart (Flutter)**:
   - Freezed data class (immutable, copyWith, equality)
   - json_serializable annotations
   - Drift table definition (if using Drift)
   - Isar collection (if using Isar)

   **Swift (iOS)**:
   - Struct conforming to Codable, Identifiable, Hashable
   - SwiftData @Model class (if using SwiftData)
   - CodingKeys for API field mapping

   **Kotlin (Android)**:
   - Data class with @Serializable
   - Room @Entity (if using Room)
   - Type converters for complex fields

5. **Include in all models**:
   - ID field (UUID or server-generated)
   - Created/updated timestamps
   - Sync status field (if offline-capable)
   - Null safety with proper defaults
   - Example/mock factory for testing

6. **Generate supporting files**:
   - Repository interface for this model
   - Test file with serialization round-trip tests

7. **Final step — handoff.** Follow `.claude/docs/handoff-template.md`.

   - Append breadcrumb to `.claude/session/active.md`:
     ```
     ## /create-model — [YYYY-MM-DD HH:MM]
     - Action: generated [ModelName] with serialization + repository
     - Recommended next: /create-screen
     ```
   - Render the handoff block with:
     - `/create-screen` — build a screen that displays this model *(recommended)*
     - `/design-api` — define the API contract for this model
     - `/setup-offline` — wire local DB + sync for this model
     - `/write-tests` — cover serialization and validation
     - `@database-lead` — review local schema and migrations
