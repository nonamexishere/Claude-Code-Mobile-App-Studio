---
name: publish-playstore
description: "Prepare and submit app to Google Play Store. Covers store listing, data safety section, content rating, and release tracks."
argument-hint: ""
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash, AskUserQuestion
---

When this skill is invoked:

1. **Read project info** from config files (app name, version, package name).

2. **Walk through Play Store submission checklist**:

   **Store Listing**:
   - App name (50 characters max)
   - Short description (80 characters max)
   - Full description (4000 characters max)
   - App icon (512x512, 32-bit PNG)
   - Feature graphic (1024x500)
   - Screenshots: minimum 2, recommended 8 per device type
     - Phone: 16:9 or 9:16 (min 320px, max 3840px)
     - 7" tablet, 10" tablet (if applicable)

   **Data Safety Section**:
   - Data types collected (name, email, location, etc.)
   - Data sharing practices
   - Security practices (encryption, deletion)
   - This MUST match actual app behavior

   **Content Rating**:
   - IARC questionnaire completion
   - Age rating for each region

   **Release Management**:
   - Internal testing track → Closed testing → Open testing → Production
   - Staged rollout (start at 10-20%)
   - Release notes per version

   **Policy Compliance**:
   - Target API level (latest required within ~1 year)
   - Families policy (if targeting children)
   - Ads declaration
   - Permission declarations
   - App access instructions for review

3. **Generate submission files**:
   - `docs/playstore/metadata.md` — all store listing content
   - `docs/playstore/data-safety.md` — data safety section declarations
   - `docs/playstore/release-notes.md` — version release notes template

4. **Build commands** for AAB (Android App Bundle):
   - Signing configuration check
   - AAB generation command
   - Upload instructions (manual or via Fastlane/gradle)

5. **Suggest next steps**:
   1. "Run `/publish-appstore` to also submit to the App Store"
   2. "Talk to `@store-specialist` for Play Store policy questions"
