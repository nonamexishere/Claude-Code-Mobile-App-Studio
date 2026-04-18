---
name: setup-navigation
description: "Configure app navigation structure. Sets up tab bars, stacks, drawers, deep linking, and auth flows for the target platform."
argument-hint: "[pattern: tabs|drawer|stack]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash, AskUserQuestion
---

When this skill is invoked:

1. **Detect the project platform** by reading project config files (package.json, pubspec.yaml, etc.).

2. **Ask about navigation structure** using `AskUserQuestion`:

   - Tab "Pattern" — "Main navigation pattern?"
     Options: Bottom Tabs / Drawer / Bottom Tabs + Drawer / Stack only / Custom
   - Tab "Auth" — "Auth-gated navigation?"
     Options: Yes (login before main app) / No (open access) / Partial (some screens gated)
   - Tab "Tabs" — "How many main tabs?"
     Options: 3 / 4 / 5 / Custom

3. **Generate navigation setup** based on platform:

   **React Native (Expo Router)**:
   - `app/` directory-based routing
   - Layout files for tabs and stacks
   - Auth group with redirect logic
   - Deep link configuration in app.json

   **React Native (React Navigation)**:
   - NavigationContainer with linking config
   - Tab navigator with nested stack navigators
   - Auth flow with conditional rendering
   - Type-safe navigation params

   **Flutter (GoRouter)**:
   - GoRouter configuration with ShellRoute for tabs
   - Route definitions with path parameters
   - Redirect logic for authentication
   - Deep link handling

   **iOS (SwiftUI)**:
   - TabView with NavigationStack per tab
   - NavigationPath for programmatic navigation
   - Deep link handling via onOpenURL
   - Scene phase handling

   **Android (Jetpack Compose)**:
   - Navigation component with NavHost
   - Bottom navigation with NavGraph
   - Deep link handling with NavDeepLink
   - Auth state-based start destination

4. **Set up deep linking**:
   - URL scheme configuration
   - Universal links / App Links setup
   - Route mapping from URLs to screens
   - Parameter extraction

5. **Write files** to appropriate navigation directories.

6. **Final step — handoff.** Follow `.claude/docs/handoff-template.md`.

   - Append breadcrumb to `.claude/session/active.md`:
     ```
     ## /setup-navigation — [YYYY-MM-DD HH:MM]
     - Action: configured [pattern] navigation with [N] tabs
     - Recommended next: /create-screen
     ```
   - Render the handoff block with:
     - `/create-screen [name]` — build the first screen in the nav tree *(recommended)*
     - `/setup-theme` — lock design system before building screens
     - `/setup-deep-linking` — deep configuration of links (URL schemes, universal links)
     - `/setup-auth` — implement the auth flow this nav gates
     - `@ux-lead` — review navigation UX
