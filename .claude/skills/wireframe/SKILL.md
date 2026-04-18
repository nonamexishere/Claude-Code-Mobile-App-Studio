---
name: wireframe
description: "Generate ASCII wireframes for mobile screens. Produces text-based screen layouts with navigation flow."
argument-hint: "<screen-name>"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, AskUserQuestion
---

When this skill is invoked:

1. **Read existing context** — check `docs/features.md`, `docs/product-brief.md`, or `docs/architecture.md`.

2. **Determine what to wireframe** using `AskUserQuestion` if no argument given:

   - Tab "Screen" — "Which screen to wireframe?"
     Options: Login / Home / Profile / Settings / Detail / List / Form / Onboarding / All key screens
   - Tab "Platform" — "Target platform feel?"
     Options: iOS (HIG style) / Android (Material) / Cross-platform (neutral)

3. **Generate ASCII wireframes** using mobile-appropriate format:

   ```
   ┌─────────────────────────┐
   │ ◀  Screen Title    ⋯   │  ← Navigation bar
   ├─────────────────────────┤
   │                         │
   │  ┌───────────────────┐  │
   │  │   Hero Image      │  │
   │  └───────────────────┘  │
   │                         │
   │  Title Text             │
   │  Subtitle / description │
   │                         │
   │  ┌───────────────────┐  │
   │  │  Primary Button   │  │
   │  └───────────────────┘  │
   │  ┌───────────────────┐  │
   │  │  Secondary Button │  │
   │  └───────────────────┘  │
   │                         │
   ├─────────────────────────┤
   │ 🏠   🔍   ➕   💬   👤 │  ← Tab bar
   └─────────────────────────┘
   ```

4. **Document for each screen**:
   - Screen name and purpose
   - Entry points (how users get here)
   - Exit points (where users go from here)
   - Key interactions (tap, swipe, long press, pull to refresh)
   - Data displayed (what API data is needed)
   - States: loading, empty, error, populated
   - Platform differences (if any)

5. **Generate navigation flow diagram**:
   ```
   Splash → Onboarding → Login ──→ Home Tab ──→ Detail
                              └──→ Search Tab
                              └──→ Profile Tab → Settings
   ```

6. **Write output** to `design/wireframes/<screen-name>.md` or `design/wireframes/all-screens.md`.

7. **Final step — handoff.** Follow `.claude/docs/handoff-template.md`.

   - Append breadcrumb to `.claude/session/active.md`:
     ```
     ## /wireframe — [YYYY-MM-DD HH:MM]
     - Action: wireframed [N] screens + nav flow
     - Recommended next: /setup-navigation
     ```
   - Render the handoff block with:
     - `/setup-navigation` — implement the navigation flow you just sketched *(recommended)*
     - `/create-screen [name]` — build one of the wireframed screens
     - `/setup-theme` — lock colors/typography before building screens
     - `@ux-lead` — UX review of the wireframes
     - `@mobile-architect` — sanity-check the flow against architecture
