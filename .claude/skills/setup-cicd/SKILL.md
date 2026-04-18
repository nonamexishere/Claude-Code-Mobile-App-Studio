---
name: setup-cicd
description: "Set up CI/CD pipeline for mobile: EAS Build, Fastlane, Codemagic, or GitHub Actions with code signing and automated testing."
argument-hint: "[provider: eas|fastlane|codemagic|github-actions]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash, AskUserQuestion
---

When this skill is invoked:

1. **Detect the project platform** from config files.

2. **Ask about CI/CD needs** using `AskUserQuestion`:

   - Tab "Provider" — "CI/CD provider?"
     Options: EAS Build (Expo) / Fastlane / Codemagic / GitHub Actions / Bitrise / App Center / Custom
   - Tab "Pipeline" — "Pipeline stages?"
     Options (multi): Lint / Test / Build / Deploy to beta / Deploy to production
   - Tab "Signing" — "Code signing setup?"
     Options: Manual / Match (Fastlane) / EAS managed / Cloud signing

3. **Generate CI/CD configuration**:

   **EAS Build (Expo)**:
   - eas.json with build profiles (development, preview, production)
   - EAS Submit configuration
   - EAS Update for OTA updates
   - GitHub Actions workflow for automated builds

   **Fastlane**:
   - Fastfile with lanes: test, beta, release
   - Matchfile for code signing (iOS)
   - Supply configuration (Android)
   - Appfile with app identifiers

   **GitHub Actions**:
   - Workflow file with build matrix
   - iOS build job (macOS runner)
   - Android build job
   - Test job
   - Deploy job

   **Codemagic**:
   - codemagic.yaml configuration
   - Build triggers and branch patterns
   - Code signing setup
   - Distribution configuration

4. **Code signing setup**:
   - iOS: Provisioning profiles, certificates, Keychain setup
   - Android: Keystore creation, signing config in build.gradle
   - Secrets management (environment variables, CI secrets)

5. **Pipeline stages**:
   ```
   Push → Lint → Test → Build → Beta (TestFlight/Internal Track) → Production
   ```

6. **Final step — handoff.** Follow `.claude/docs/handoff-template.md`.

   - Append breadcrumb to `.claude/session/active.md`:
     ```
     ## /setup-cicd — [YYYY-MM-DD HH:MM]
     - Action: wired [provider] pipeline with [stages]
     - Recommended next: /build
     ```
   - Render the handoff block with:
     - `/build` — validate the pipeline with a local build *(recommended)*
     - `/publish-appstore` — configure TestFlight submission from CI
     - `/publish-playstore` — configure internal track submission from CI
     - `/setup-codepush` — add OTA publishing to the pipeline
     - `@devops-lead` — branch strategy, release channels, secrets management
