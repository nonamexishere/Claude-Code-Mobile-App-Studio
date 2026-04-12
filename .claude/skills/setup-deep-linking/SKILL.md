---
name: setup-deep-linking
description: "Configure deep linking and universal links: URL scheme, domain verification, route mapping, and deferred deep links."
argument-hint: ""
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash, AskUserQuestion
---

When this skill is invoked:

1. **Detect the project platform** from config files.

2. **Ask about deep linking needs** using `AskUserQuestion`:

   - Tab "Type" — "Deep link types?"
     Options (multi): URL scheme (myapp://) / Universal Links (iOS) / App Links (Android) / Deferred deep links
   - Tab "Routes" — "Which screens need deep links?"
     Options (multi): Product detail / User profile / Content / Settings / Invite-Referral / Payment / Custom

3. **Generate deep linking setup**:

   - **URL scheme configuration**:
     - iOS: Info.plist URL types
     - Android: AndroidManifest intent-filter
     - RN: Linking configuration
     - Flutter: uni_links or go_router deep links
   - **Universal Links (iOS)**:
     - apple-app-site-association (AASA) file
     - Associated Domains entitlement
     - Server-side AASA hosting instructions
   - **App Links (Android)**:
     - assetlinks.json file
     - AndroidManifest autoVerify intent-filter
     - Digital Asset Links verification
   - **Route mapping**:
     - URL pattern → screen mapping table
     - Parameter extraction from URLs
     - Auth-gated deep links (redirect to login, then continue)
     - Fallback for unmatched routes
   - **Deferred deep links**:
     - First install attribution
     - Post-install routing to intended content
   - **Testing**:
     - CLI commands to test deep links
     - `adb shell am start` for Android
     - `xcrun simctl openurl` for iOS

4. **Write configuration files** and route mapping.

5. **Suggest next steps**:
   1. "Run `/setup-push-notifications` to deep link from notifications"
   2. "Talk to `@rn-navigation-specialist` for complex routing"
