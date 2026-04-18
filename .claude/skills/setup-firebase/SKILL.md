---
name: setup-firebase
description: "Set up Firebase services: Auth, Firestore, Cloud Functions, FCM, Storage, Crashlytics, and Analytics."
argument-hint: "[services: auth,firestore,fcm,storage,functions]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash, AskUserQuestion
---

When this skill is invoked:

1. **Detect the project platform** from config files.

2. **Ask which services to set up** using `AskUserQuestion`:

   - Tab "Services" — "Which Firebase services?"
     Options (multi): Authentication / Firestore / Cloud Functions / FCM (Push) / Storage / Crashlytics / Analytics / Remote Config / App Check
   - Tab "Auth Methods" — "Auth providers?" (if Auth selected)
     Options (multi): Email-Password / Google / Apple / Facebook / Phone OTP / Anonymous

3. **Set up Firebase** based on platform:

   **React Native / Expo**:
   - Install @react-native-firebase packages (or expo-firebase for Expo)
   - Configure google-services.json (Android) and GoogleService-Info.plist (iOS)
   - Set up Firebase app initialization
   - Configure each selected service

   **Flutter**:
   - Install firebase_core and service packages
   - Run flutterfire configure
   - Set up Firebase initialization in main.dart
   - Configure each selected service

   **iOS (Swift)**:
   - Add Firebase via SPM
   - Configure FirebaseApp in AppDelegate/App
   - Set up each selected service

   **Android (Kotlin)**:
   - Add Firebase BOM to build.gradle
   - Configure google-services plugin
   - Set up each selected service

4. **For each service, generate**:
   - **Auth**: AuthService wrapper, social login flows, token management
   - **Firestore**: Collection structure, security rules template, offline persistence config
   - **Functions**: Example function, deployment config
   - **FCM**: Notification handler, token registration, topic subscription
   - **Storage**: Upload/download helpers, image compression
   - **Crashlytics**: Error boundary integration, custom keys
   - **Analytics**: Event logging wrapper, screen tracking
   - **Remote Config**: Default values, fetch strategy

5. **Generate security rules** template for Firestore/Storage.

6. **Final step — handoff.** Follow `.claude/docs/handoff-template.md`.

   - Append breadcrumb to `.claude/session/active.md`:
     ```
     ## /setup-firebase — [YYYY-MM-DD HH:MM]
     - Action: wired Firebase [services]
     - Recommended next: /setup-auth
     ```
   - Render the handoff block with:
     - `/setup-auth` — build complete auth flows on top of Firebase Auth *(recommended)*
     - `/setup-push-notifications` — wire FCM handlers and topic subscriptions
     - `/design-database` — design Firestore collections and security rules
     - `/setup-crash-reporting` — finish Crashlytics integration
     - `@firebase-specialist` — advanced Firebase patterns and cost tuning
