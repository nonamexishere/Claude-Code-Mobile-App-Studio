---
name: define-features
description: "Define and prioritize app features. Creates a structured feature list with MoSCoW prioritization and mobile-specific considerations."
argument-hint: "[feature-area]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, AskUserQuestion
---

When this skill is invoked:

1. **Read existing context** — check for `docs/product-brief.md` or `docs/architecture.md` if they exist.

2. **Ask about scope** using `AskUserQuestion`:

   - Tab "Phase" — "What phase are you planning?"
     Options: MVP / V1.0 / V2.0 / Specific feature area
   - Tab "Priority" — "What matters most?"
     Options: Speed to market / User experience / Feature completeness / Technical excellence

3. **Generate a feature list** organized by:

   - **Must Have (M)**: Core features without which the app has no value
   - **Should Have (S)**: Important features expected by users
   - **Could Have (C)**: Nice-to-have features for differentiation
   - **Won't Have (W)**: Explicitly out of scope for this phase

4. **For each feature**, document:
   - Feature name and one-line description
   - User story: "As a [user], I want [action] so that [benefit]"
   - Mobile-specific notes (offline behavior, permissions needed, platform differences)
   - Complexity estimate: S / M / L / XL
   - Dependencies on other features

5. **Identify mobile-specific features** to consider:
   - Onboarding flow (permissions, tutorials, sign-up)
   - Offline mode behavior
   - Push notification triggers
   - Deep link entry points
   - Widget / Live Activity candidates
   - Background tasks needed
   - Platform-specific features (iOS vs Android differences)

6. **Write output** to `docs/features.md`.

7. **Final step — handoff.** Follow `.claude/docs/handoff-template.md`.

   - Append breadcrumb to `.claude/session/active.md`:
     ```
     ## /define-features — [YYYY-MM-DD HH:MM]
     - Action: wrote docs/features.md with MoSCoW priorities
     - Recommended next: /wireframe
     ```
   - Render the handoff block with:
     - `/wireframe` — sketch screens for Must-Have features *(recommended)*
     - `/create-architecture` — design the technical foundation
     - `/sprint-plan` — break features into sprint tasks
     - `/design-api` — define API contracts for the features
     - `@product-owner` — review prioritization choices
