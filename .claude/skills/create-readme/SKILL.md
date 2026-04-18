---
name: create-readme
description: "Generate a comprehensive README.md for the mobile app project with badges, screenshots section, setup instructions, and architecture overview."
argument-hint: ""
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Bash, AskUserQuestion
---

When this skill is invoked:

1. **Scan the project** to understand:
   - Platform (RN, Flutter, Swift, Kotlin)
   - Dependencies and versions
   - Project structure
   - Available scripts/commands

2. **Generate README.md** with sections:

   ```markdown
   # App Name

   Brief description and value proposition.

   ## Screenshots
   <!-- Add screenshots here -->
   | Home | Detail | Profile |
   |------|--------|---------|
   | img  | img    | img     |

   ## Features
   - Feature 1
   - Feature 2
   - ...

   ## Tech Stack
   - Platform: ...
   - State Management: ...
   - Backend: ...
   - Database: ...

   ## Getting Started

   ### Prerequisites
   - Node.js / Flutter / Xcode / Android Studio
   - ...

   ### Installation
   1. Clone the repo
   2. Install dependencies
   3. Configure environment
   4. Run the app

   ### Running
   - iOS: `command`
   - Android: `command`

   ## Project Structure
   ```
   src/
   ├── screens/
   ├── components/
   ├── navigation/
   ├── services/
   ├── stores/
   └── types/
   ```

   ## Architecture
   Brief architecture overview with diagram.

   ## Testing
   How to run tests.

   ## Deployment
   Build and deployment instructions.

   ## Contributing
   Contribution guidelines.

   ## License
   ```

3. **Write** `README.md` to project root.

4. **Final step — handoff.** Follow `.claude/docs/handoff-template.md`.

   - Append breadcrumb to `.claude/session/active.md`:
     ```
     ## /create-readme — [YYYY-MM-DD HH:MM]
     - Action: wrote README.md at project root
     - Recommended next: /generate-docs
     ```
   - Render the handoff block with:
     - `/generate-docs` — expand into full API/architecture docs *(recommended)*
     - `/create-changelog` — add CHANGELOG alongside the README
     - `/publish-appstore` — reuse README copy for store listing
     - `/publish-playstore` — reuse README copy for Play listing
     - `@tech-writer` — polish tone and add screenshots
