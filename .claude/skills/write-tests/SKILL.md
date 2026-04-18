---
name: write-tests
description: "Write tests for mobile apps: unit tests, widget/component tests, integration tests, and E2E tests with platform-appropriate tools."
argument-hint: "[target-file-or-feature]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash, AskUserQuestion
---

When this skill is invoked:

1. **Detect the project platform** from config files.

2. **Determine test target** — if argument provided, read that file. Otherwise ask:

   - Tab "Scope" — "What to test?"
     Options: Specific file / Feature / Screen / Service / Full test suite
   - Tab "Level" — "Test level?"
     Options: Unit / Component-Widget / Integration / E2E / All levels

3. **Generate tests** based on platform:

   **React Native**:
   - Unit: Jest for business logic, hooks, utilities
   - Component: React Native Testing Library for UI
   - E2E: Detox or Maestro flows
   - API mocking: MSW (Mock Service Worker)

   **Flutter**:
   - Unit: flutter_test for business logic
   - Widget: flutter_test with pumpWidget for UI
   - Integration: integration_test package
   - E2E: Patrol or Maestro
   - Golden: snapshot tests for visual regression

   **iOS (Swift)**:
   - Unit: XCTest for logic and view models
   - UI: XCUITest for user flows
   - Snapshot: swift-snapshot-testing

   **Android (Kotlin)**:
   - Unit: JUnit + MockK for logic
   - Compose UI: compose-testing for components
   - UI: Espresso for user flows
   - Flow: Turbine for testing Kotlin Flow

4. **Test patterns to include**:
   - Happy path and error cases
   - Loading, empty, and error states
   - Offline behavior
   - Permission denied scenarios
   - Deep link handling
   - Navigation flow
   - Form validation
   - API response mapping

5. **Write test files** mirroring source structure.

6. **Run tests** and report results.

7. **Final step — handoff.** Follow `.claude/docs/handoff-template.md`.

   - Append breadcrumb to `.claude/session/active.md`:
     ```
     ## /write-tests — [YYYY-MM-DD HH:MM]
     - Action: added [level] tests for [target]
     - Recommended next: /code-review
     ```
   - Render the handoff block with:
     - `/code-review [target]` — review the code you just covered *(recommended)*
     - `/test-devices` — plan device testing matrix
     - `/audit-performance` — check perf regressions surfaced by tests
     - `/sprint-plan` — pick the next task now that this is green
     - `@qa-lead` — discuss test strategy and coverage gaps
