---
name: test-devices
description: "Generate a device testing matrix with recommended physical and simulator devices for thorough testing coverage."
argument-hint: "[platform: ios|android|both]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, AskUserQuestion
---

When this skill is invoked:

1. **Detect the project platform** from config files.

2. **Ask about testing needs** using `AskUserQuestion`:

   - Tab "Platform" — "Target platforms?"
     Options: iOS only / Android only / Both
   - Tab "Coverage" — "Testing depth?"
     Options: Minimum viable / Standard / Comprehensive / Enterprise

3. **Generate device testing matrix**:

   **iOS Devices** (by coverage level):
   - Minimum: iPhone 15 (latest), iPhone SE 3 (small screen)
   - Standard: + iPhone 13 (older), iPad (if tablet supported)
   - Comprehensive: + iPhone 15 Pro Max (large), iPhone 12 mini, iPad Pro, iPad mini
   - Screen sizes covered: 4.7", 5.4", 6.1", 6.7", iPad

   **Android Devices** (by coverage level):
   - Minimum: Pixel 8 (stock Android), Samsung Galaxy S24 (Samsung UI)
   - Standard: + Pixel 6a (mid-range), Samsung Galaxy A54 (popular mid-range)
   - Comprehensive: + OnePlus, Xiaomi, foldable (Galaxy Fold), tablet
   - API levels: minimum supported through latest

   **Test Scenarios per Device**:
   - Screen rendering at different sizes and densities
   - Dark mode appearance
   - Font scaling (accessibility sizes)
   - Landscape orientation (if supported)
   - Notch / Dynamic Island / punch-hole camera handling
   - Performance on low-end devices
   - Memory pressure behavior

4. **Generate simulator/emulator commands**:
   - iOS Simulator device creation
   - Android emulator AVD definitions
   - Useful testing CLI commands

5. **Generate testing checklist** per device category.

6. **Write output** to `docs/testing/device-matrix.md`.

7. **Final step — handoff.** Follow `.claude/docs/handoff-template.md`.

   - Append breadcrumb to `.claude/session/active.md`:
     ```
     ## /test-devices — [YYYY-MM-DD HH:MM]
     - Action: generated device matrix for [platform] at [coverage] level
     - Recommended next: /write-tests
     ```
   - Render the handoff block with:
     - `/write-tests` — cover the flows flagged by the matrix *(recommended)*
     - `/setup-cicd` — run the device matrix on CI
     - `/audit-performance` — profile low-end devices from the matrix
     - `/audit-accessibility` — verify dynamic type and contrast per device
     - `@qa-lead` — comprehensive test plan and sign-off criteria
