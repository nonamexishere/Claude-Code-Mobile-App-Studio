---
name: generate-docs
description: "Generate project documentation: API docs, architecture overview, setup guide, and component catalog."
argument-hint: "[type: api|architecture|setup|components|all]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Bash, AskUserQuestion
---

When this skill is invoked:

1. **Determine documentation type**:

   - Tab "Type" — "What documentation?"
     Options: API reference / Architecture overview / Setup guide / Component catalog / Full documentation

2. **Scan the project** to understand structure, dependencies, and code.

3. **Generate documentation** based on type:

   **API Reference** (`docs/api-reference.md`):
   - All service methods with signatures
   - Request/response types
   - Error codes and handling
   - Authentication requirements
   - Example usage

   **Architecture Overview** (`docs/architecture.md`):
   - System diagram (ASCII)
   - Layer descriptions
   - Data flow
   - Key decisions and rationale
   - Dependencies overview

   **Setup Guide** (`docs/setup-guide.md`):
   - Prerequisites (Node, Xcode, Android Studio, etc.)
   - Clone and install steps
   - Environment variable setup
   - Running on simulator/emulator
   - Running on physical device
   - Common issues and fixes

   **Component Catalog** (`docs/components.md`):
   - List of all reusable components
   - Props/parameters for each
   - Usage examples
   - Visual variants

4. **Write files** to `docs/`.

5. **Final step — handoff.** Follow `.claude/docs/handoff-template.md`.

   - Append breadcrumb to `.claude/session/active.md`:
     ```
     ## /generate-docs — [YYYY-MM-DD HH:MM]
     - Action: generated [type] documentation under docs/
     - Recommended next: /create-readme
     ```
   - Render the handoff block with:
     - `/create-readme` — write the top-level project README *(recommended)*
     - `/create-changelog` — start a changelog alongside docs
     - `/code-review` — verify docs match current code
     - `/sprint-plan` — fold doc gaps into upcoming work
     - `@tech-writer` — polish tone and structure
