---
name: build
description: "Build the mobile app for development, testing, or release. Handles platform-specific build configuration."
argument-hint: "[target: dev|staging|release] [--platform ios|android|both]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash, AskUserQuestion, Task
---

When this skill is invoked:

1. **Detect the project platform** from config files.

2. **Ask about build target** using `AskUserQuestion`:

   - Tab "Target" — "Build target?"
     Options: Development (debug) / Staging / Release (production)
   - Tab "Platform" — "Build for?"
     Options: iOS / Android / Both

3. **Run the appropriate build** based on platform:

   **Expo**:
   - Development: `npx expo start` / `eas build --profile development`
   - Staging: `eas build --profile preview`
   - Release: `eas build --profile production`

   **React Native (bare)**:
   - iOS: `npx react-native run-ios` / `xcodebuild`
   - Android: `npx react-native run-android` / `./gradlew assembleRelease`

   **Flutter**:
   - iOS: `flutter build ios` / `flutter build ipa`
   - Android: `flutter build apk` / `flutter build appbundle`

   **Swift (Xcode)**:
   - `xcodebuild -scheme <scheme> -configuration <Debug|Release>`

   **Kotlin (Gradle)**:
   - `./gradlew assembleDebug` / `./gradlew assembleRelease`

4. **Pre-build checks**:
   - Verify dependencies installed
   - Check environment variables
   - Validate code signing (release builds)
   - Run linter
   - Run tests (optional)

5. **Post-build info**:
   - Build artifact location
   - Bundle/APK size report
   - Installation instructions (simulator/device)

6. **Final step — handoff.** Follow `.claude/docs/handoff-template.md`.

   - Append breadcrumb to `.claude/session/active.md`:
     ```
     ## /build — [YYYY-MM-DD HH:MM]
     - Action: built [platform] for [target] — artifact at [path]
     - Recommended next: /test-devices
     ```
   - Render the handoff block with:
     - `/test-devices` — install and validate on the device matrix *(recommended)*
     - `/publish-appstore` — submit the build to App Store Connect
     - `/publish-playstore` — submit the build to Play Console
     - `/audit-performance` — profile the release artifact
     - `@devops-lead` — release packaging and signing issues
