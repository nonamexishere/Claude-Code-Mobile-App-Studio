---
name: setup-push-notifications
description: "Set up push notifications: FCM/APNs integration, notification handling, deep linking from notifications, and rich notifications."
argument-hint: ""
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash, AskUserQuestion
---

When this skill is invoked:

1. **Detect the project platform and backend** from config files.

2. **Ask about notification needs** using `AskUserQuestion`:

   - Tab "Provider" — "Push notification service?"
     Options: Firebase Cloud Messaging (FCM) / OneSignal / Expo Notifications / AWS SNS / Custom APNs
   - Tab "Types" — "Notification types?"
     Options (multi): Basic text / Rich (image, buttons) / Silent (background data) / Scheduled-Local / In-app messages
   - Tab "Actions" — "Notification actions?"
     Options (multi): Open screen (deep link) / Reply inline / Mark as read / Custom actions

3. **Generate push notification setup**:

   - **Service registration**:
     - FCM token retrieval and server registration
     - APNs configuration (iOS)
     - Permission request flow with graceful decline handling
   - **Notification handling**:
     - Foreground: In-app banner or custom UI
     - Background: System notification display
     - Killed state: Deep link routing on cold start
     - Tap handling: Navigate to relevant screen
   - **Rich notifications**:
     - Image attachments
     - Action buttons
     - Notification categories (iOS) / channels (Android)
   - **Silent notifications**:
     - Background data sync trigger
     - Content refresh without user-visible notification
   - **Local notifications**:
     - Scheduled reminders
     - Geofence triggers
     - Timer-based notifications
   - **Android channels**: Create notification channels with proper importance levels
   - **iOS categories**: Define actionable notification categories

4. **Generate notification service** with methods:
   - requestPermission()
   - getToken() / onTokenRefresh()
   - onNotificationReceived()
   - onNotificationTapped()
   - scheduleLocal()
   - subscribeTopic() / unsubscribeTopic()

5. **Final step — handoff.** Follow `.claude/docs/handoff-template.md`.

   - Append breadcrumb to `.claude/session/active.md`:
     ```
     ## /setup-push-notifications — [YYYY-MM-DD HH:MM]
     - Action: wired push notifications with [provider]
     - Recommended next: /setup-deep-linking
     ```
   - Render the handoff block with:
     - `/setup-deep-linking` — route taps from notifications to the right screen *(recommended)*
     - `/setup-permissions` — refine the permission prompt UX
     - `/setup-analytics` — track notification open rates
     - `/write-tests` — cover notification handlers
     - `@push-notification-specialist` — advanced targeting and scheduling
