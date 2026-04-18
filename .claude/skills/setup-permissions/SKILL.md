---
name: setup-permissions
description: "Handle runtime permissions: camera, location, notifications, photos, contacts, microphone with proper UX flow."
argument-hint: "[permission: camera|location|notifications|photos|contacts]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash, AskUserQuestion
---

When this skill is invoked:

1. **Detect the project platform** from config files.

2. **Ask about permissions** using `AskUserQuestion`:

   - Tab "Permissions" — "Which permissions does your app need?"
     Options (multi): Camera / Photo Library / Location (when in use) / Location (always) / Notifications / Microphone / Contacts / Calendar / Bluetooth / Motion-Fitness / App Tracking (ATT)
   - Tab "UX" — "Permission request strategy?"
     Options: Ask on first need / Pre-permission screen (explain why) / Onboarding sequence / Settings redirect

3. **Generate permission handling**:

   - **Permission service** with methods:
     - checkPermission(type) → granted / denied / notDetermined / restricted
     - requestPermission(type) → result
     - openSettings() — redirect to app settings
   - **Pre-permission dialog**:
     - Explain why the permission is needed before the system prompt
     - Custom UI with illustration and clear value proposition
     - "Not now" option that doesn't trigger the system prompt
   - **Denied state handling**:
     - Graceful degradation (work without permission)
     - Settings redirect with instructions
     - "Permission required" placeholder UI
   - **Platform configuration**:
     - iOS: Info.plist usage descriptions (NSCameraUsageDescription, etc.)
     - Android: AndroidManifest permissions, runtime request for API 23+
     - iOS App Tracking Transparency (ATT) flow
   - **Permission state persistence**: Remember user's choice to avoid re-asking

4. **Generate files** in `src/permissions/` or equivalent.

5. **Final step — handoff.** Follow `.claude/docs/handoff-template.md`.

   - Append breadcrumb to `.claude/session/active.md`:
     ```
     ## /setup-permissions — [YYYY-MM-DD HH:MM]
     - Action: added runtime permissions for [types] with [UX strategy]
     - Recommended next: /audit-security
     ```
   - Render the handoff block with:
     - `/audit-security` — verify privacy compliance and data handling *(recommended)*
     - `/setup-push-notifications` — if notifications permission was requested
     - `/audit-accessibility` — ensure pre-permission screens are accessible
     - `/write-tests` — cover granted/denied/restricted flows
     - `@permissions-specialist` — complex permission flows and edge cases
