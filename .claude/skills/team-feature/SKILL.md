---
name: team-feature
description: "Orchestrate a complete feature build using multiple agents. Coordinates design, implementation, testing, and review."
argument-hint: "<feature-description>"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash, AskUserQuestion
---

When this skill is invoked:

1. **Understand the feature** from the argument and existing docs.

2. **Create a feature plan** with phases:

   **Phase 1 — Design**:
   - Ask `@ux-lead` for screen wireframes
   - Ask `@mobile-architect` for technical approach
   - Define API contract with `@api-developer`
   - Output: Feature spec in `docs/features/<feature-name>.md`

   **Phase 2 — Data Layer**:
   - Create data models with `/create-model`
   - Set up API endpoints with `/create-endpoint`
   - Configure local database (if offline needed)
   - Output: Models, API service, repository

   **Phase 3 — UI Implementation**:
   - Create screens with `/create-screen`
   - Build reusable components with `/create-component`
   - Add navigation routes
   - Connect to data layer
   - Output: Working screens with data

   **Phase 4 — Platform Integration**:
   - Permissions (if needed): `/setup-permissions`
   - Push notifications (if needed): `/setup-push-notifications`
   - Deep links (if needed): `/setup-deep-linking`
   - Output: Fully integrated feature

   **Phase 5 — Quality**:
   - Write tests with `/write-tests`
   - Run code review with `/code-review`
   - Audit accessibility with `/audit-accessibility`
   - Audit performance with `/audit-performance`
   - Output: Tested and reviewed feature

3. **Execute each phase**, asking for user confirmation between phases.

4. **Generate feature summary** at the end with what was built and any follow-ups.

5. **Final step — handoff.** Follow `.claude/docs/handoff-template.md`.

   - Append breadcrumb to `.claude/session/active.md`:
     ```
     ## /team-feature — [YYYY-MM-DD HH:MM]
     - Action: shipped [feature] across design → data → UI → integration → QA
     - Recommended next: /sprint-plan
     ```
   - Render the handoff block with:
     - `/sprint-plan` — fold remaining follow-ups into the next sprint *(recommended)*
     - `/code-review` — final review pass on the full feature
     - `/write-tests` — close any coverage gaps from the QA phase
     - `/build` — cut a build that includes the feature
     - `@product-owner` — sign-off on scope and acceptance criteria
