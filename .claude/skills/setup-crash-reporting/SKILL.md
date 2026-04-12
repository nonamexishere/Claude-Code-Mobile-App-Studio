---
name: setup-crash-reporting
description: "Set up crash reporting and error monitoring: Crashlytics, Sentry, or Bugsnag with source maps and breadcrumbs."
argument-hint: "[provider: crashlytics|sentry|bugsnag]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash, AskUserQuestion
---

When this skill is invoked:

1. **Detect the project platform** from config files.

2. **Ask about crash reporting needs** using `AskUserQuestion`:

   - Tab "Provider" — "Crash reporting service?"
     Options: Firebase Crashlytics / Sentry / Bugsnag / Datadog / Custom
   - Tab "Features" — "Features needed?"
     Options (multi): Crash reports / ANR detection / Non-fatal errors / Breadcrumbs / User feedback / Performance monitoring

3. **Generate crash reporting setup**:

   - **SDK initialization** with proper configuration
   - **Global error handler**:
     - Uncaught exceptions
     - Unhandled promise rejections (RN/JS)
     - Flutter zone errors
     - ANR detection (Android)
   - **Breadcrumbs**: Automatic and custom breadcrumb logging
   - **Custom keys**: User ID, app version, build number, device info
   - **Source maps / dSYM upload**:
     - Build script for uploading debug symbols
     - CI/CD integration for automatic upload
   - **Non-fatal error logging**: Manual error reporting for handled exceptions
   - **User context**: Attach user info for easier debugging
   - **Release tracking**: Version and build number tagging

4. **Write files** and update build configuration.

5. **Suggest next steps**:
   1. "Run `/setup-analytics` to combine with event analytics"
   2. "Run `/setup-cicd` to automate symbol uploads"
