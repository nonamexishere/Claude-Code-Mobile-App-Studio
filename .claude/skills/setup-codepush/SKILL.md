---
name: setup-codepush
description: "Set up over-the-air (OTA) updates: EAS Update, CodePush, or Shorebird for instant updates without store review."
argument-hint: "[provider: eas-update|codepush|shorebird]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash, AskUserQuestion
---

When this skill is invoked:

1. **Detect the project platform** from config files.

2. **Ask about OTA needs** using `AskUserQuestion`:

   - Tab "Provider" — "OTA update provider?"
     Options: EAS Update (Expo) / CodePush (App Center) / Shorebird (Flutter) / Custom
   - Tab "Strategy" — "Update strategy?"
     Options: Force update immediately / Prompt user / Silent background update / On next launch

3. **Generate OTA update setup**:

   **EAS Update (Expo)**:
   - Configure expo-updates in app.json
   - Update channels (production, staging, preview)
   - Runtime version policy
   - Update check on app launch
   - Rollback capability

   **CodePush (React Native bare)**:
   - SDK installation and native config
   - Deployment keys (staging, production)
   - Update dialog configuration
   - Mandatory vs optional updates
   - Rollback on crash

   **Shorebird (Flutter)**:
   - Shorebird initialization
   - Patch creation workflow
   - Channel management
   - Rollback commands

4. **Update flow implementation**:
   - Check for updates on app foreground
   - Download in background
   - Apply strategy (immediate, deferred, or prompted)
   - Version compatibility checking
   - Rollback on failure
   - Analytics for update adoption rate

5. **Final step — handoff.** Follow `.claude/docs/handoff-template.md`.

   - Append breadcrumb to `.claude/session/active.md`:
     ```
     ## /setup-codepush — [YYYY-MM-DD HH:MM]
     - Action: wired [provider] OTA updates with [strategy]
     - Recommended next: /setup-cicd
     ```
   - Render the handoff block with:
     - `/setup-cicd` — automate OTA publishing from CI *(recommended)*
     - `/setup-analytics` — track update adoption and rollback rates
     - `/setup-crash-reporting` — auto-rollback on crash spikes
     - `/build` — validate release bundle produces a valid patch
     - `@devops-lead` — release channels and rollout strategy
