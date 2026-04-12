---
name: setup-auth
description: "Set up complete authentication flow: login, signup, social auth, biometrics, token management, and protected routes."
argument-hint: "[type: email|social|phone|biometric]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash, AskUserQuestion
---

When this skill is invoked:

1. **Detect the project platform and backend** from config files.

2. **Ask about auth requirements** using `AskUserQuestion`:

   - Tab "Methods" — "Auth methods?"
     Options (multi): Email-Password / Google Sign-In / Apple Sign-In / Facebook / Phone OTP / Biometric / Magic Link
   - Tab "Features" — "Auth features?"
     Options (multi): Remember me / Auto-login / Forgot password / Email verification / Profile setup / Account deletion
   - Tab "Security" — "Security level?"
     Options: Standard (token in secure storage) / Enhanced (biometric lock) / Maximum (certificate pinning + device binding)

3. **Generate auth implementation**:

   - **Auth service**: Login, signup, logout, token refresh, social auth methods
   - **Token management**: 
     - Secure storage (Keychain iOS / Keystore Android / SecureStore Expo)
     - Automatic token refresh with interceptor
     - Token expiry handling
   - **Login screen**: Email/password form with validation
   - **Signup screen**: Registration form with password requirements
   - **Social auth buttons**: Platform-native Google/Apple/Facebook sign-in
   - **Biometric auth**: Face ID / Touch ID / Fingerprint unlock
   - **Forgot password flow**: Email input → verification → reset
   - **Auth state management**: Global auth state, loading states, error handling
   - **Protected navigation**: Auth guard / redirect for unauthenticated users

4. **Platform-specific setup**:
   - iOS: Configure entitlements for Sign in with Apple, URL schemes
   - Android: Configure Google Sign-In in google-services.json, intent filters
   - Deep link handling for OAuth callbacks

5. **Generate files** in `src/auth/` or equivalent.

6. **Suggest next steps**:
   1. "Run `/setup-permissions` to handle permission requests post-login"
   2. "Run `/setup-push-notifications` to register for notifications after auth"
   3. "Talk to `@security-specialist` for security review"
