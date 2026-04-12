---
name: audit-security
description: "Audit mobile app security: data storage, network security, authentication, code protection, and compliance."
argument-hint: "[area: storage|network|auth|code|all]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Bash, Write, AskUserQuestion
---

When this skill is invoked:

1. **Detect the project platform** from config files.

2. **Determine audit scope**:

   - Tab "Area" — "What to audit?"
     Options: Data storage / Network security / Authentication / Code protection / Compliance / All areas

3. **Run security audit** checking for:

   **Data Storage**:
   - [ ] Sensitive data NOT in AsyncStorage/SharedPreferences/UserDefaults
   - [ ] Tokens in Keychain (iOS) / Keystore (Android) / SecureStore (Expo)
   - [ ] No sensitive data in logs
   - [ ] No sensitive data in screenshots / app previewer
   - [ ] Clipboard data cleared for sensitive fields
   - [ ] Database encryption for sensitive local data

   **Network Security**:
   - [ ] All API calls use HTTPS
   - [ ] SSL/TLS pinning configured
   - [ ] No hardcoded API keys in source
   - [ ] API keys in environment variables / secure config
   - [ ] Network security config (Android) properly set
   - [ ] App Transport Security (iOS) not globally disabled

   **Authentication**:
   - [ ] Token refresh mechanism implemented
   - [ ] Tokens expire appropriately
   - [ ] Biometric auth uses platform APIs correctly
   - [ ] Session invalidation on logout
   - [ ] Brute force protection

   **Code Protection**:
   - [ ] ProGuard/R8 enabled (Android release)
   - [ ] No debug flags in release builds
   - [ ] Jailbreak/root detection (if required)
   - [ ] No sensitive strings in plain text
   - [ ] Webview security (if used)

   **Compliance**:
   - [ ] Privacy policy URL configured
   - [ ] Data collection disclosed accurately
   - [ ] ATT implementation (iOS, if tracking)
   - [ ] GDPR data deletion capability
   - [ ] COPPA compliance (if targeting children)

4. **Generate security report** with severity levels:
   - CRITICAL: Immediate fix required
   - HIGH: Fix before release
   - MEDIUM: Should fix
   - LOW: Best practice recommendation

5. **Suggest next steps**:
   1. "Talk to `@security-specialist` for remediation help"
   2. "Run `/setup-auth` to fix authentication issues"
