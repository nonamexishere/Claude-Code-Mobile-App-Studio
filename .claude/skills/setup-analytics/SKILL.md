---
name: setup-analytics
description: "Set up analytics and event tracking: Firebase Analytics, Mixpanel, Amplitude, or custom analytics with privacy compliance."
argument-hint: "[provider: firebase|mixpanel|amplitude|posthog]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash, AskUserQuestion
---

When this skill is invoked:

1. **Detect the project platform** from config files.

2. **Ask about analytics needs** using `AskUserQuestion`:

   - Tab "Provider" — "Analytics provider?"
     Options: Firebase Analytics / Mixpanel / Amplitude / PostHog / Segment (multi-provider) / Custom
   - Tab "Events" — "What to track?"
     Options (multi): Screen views / Button taps / Feature usage / Errors / Performance / User properties / Revenue

3. **Generate analytics implementation**:

   - **Analytics service** (abstraction layer) with methods:
     - initialize() — set up SDK
     - trackEvent(name, properties) — log event
     - trackScreen(screenName) — auto screen tracking
     - setUserProperties(props) — user attributes
     - setUserId(id) — identify user
     - resetUser() — on logout
   - **Standard events** to track:
     - app_open, app_background, app_foreground
     - screen_view (automatic via navigation listener)
     - sign_up, login, logout
     - purchase, subscription_start, subscription_cancel
     - feature_used, error_occurred
     - onboarding_step, onboarding_complete
   - **Screen tracking**: Auto-track via navigation observer/listener
   - **Error tracking**: Automatic error event logging
   - **Privacy compliance**:
     - Consent management (opt-in/opt-out)
     - ATT (App Tracking Transparency) integration on iOS
     - GDPR data deletion support
     - No PII in event properties

4. **Write files** to `src/analytics/` or equivalent.

5. **Suggest next steps**:
   1. "Run `/setup-crash-reporting` to add crash analytics"
   2. "Run `/audit-security` to verify privacy compliance"
