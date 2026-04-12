---
name: publish-appstore
description: "Prepare and submit app to the Apple App Store. Covers metadata, screenshots, review guidelines compliance, and submission."
argument-hint: ""
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash, AskUserQuestion
---

When this skill is invoked:

1. **Read project info** from config files (app name, version, bundle ID).

2. **Walk through App Store submission checklist**:

   **App Store Connect Metadata**:
   - App name (30 characters max)
   - Subtitle (30 characters max)
   - Description (4000 characters max)
   - Keywords (100 characters, comma-separated)
   - Category and subcategory
   - Support URL, marketing URL, privacy policy URL
   - Copyright
   - App icon (1024x1024, no alpha, no rounded corners)

   **Screenshots** (required sizes):
   - 6.7" (iPhone 15 Pro Max): 1290 x 2796
   - 6.5" (iPhone 14 Plus): 1284 x 2778
   - 5.5" (iPhone 8 Plus): 1242 x 2208
   - iPad Pro 12.9" (if universal): 2048 x 2732

   **Privacy**:
   - Privacy nutrition labels (data types collected)
   - App Tracking Transparency declaration
   - Privacy policy content review

   **Review Guidelines Compliance**:
   - No placeholder content
   - All features functional
   - No links to external payment (for digital goods)
   - Login credentials for review team (if auth required)
   - Age rating questionnaire

3. **Generate submission files**:
   - `docs/appstore/metadata.md` — all metadata ready to copy
   - `docs/appstore/review-notes.md` — notes for the review team
   - `docs/appstore/privacy-labels.md` — privacy nutrition label declarations
   - Screenshot requirements checklist

4. **Common rejection reasons** to check:
   - Crashes or bugs
   - Broken links
   - Placeholder content
   - Incomplete information
   - Guideline 4.3 (spam/duplicate)
   - Guideline 2.1 (performance/crashes)
   - Guideline 5.1.1 (data collection)

5. **Build & Submit commands** based on platform.

6. **Suggest next steps**:
   1. "Run `/publish-playstore` to also submit to Google Play"
   2. "Talk to `@store-specialist` for review guideline help"
