---
name: sprint-plan
description: "Create a sprint plan with tasks broken down by mobile development phases. Accounts for platform-specific work."
argument-hint: "[sprint-number]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, AskUserQuestion
---

When this skill is invoked:

1. **Read existing context** — check `docs/features.md`, `docs/architecture.md`, and any prior sprint plans.

2. **Ask about sprint scope** using `AskUserQuestion`:

   - Tab "Duration" — "Sprint length?"
     Options: 1 week / 2 weeks / 3 weeks / 4 weeks
   - Tab "Focus" — "Sprint focus?"
     Options: Foundation-Setup / Core Features / UI Polish / Backend Integration / Testing / Release Prep
   - Tab "Team" — "Working alone or with a team?"
     Options: Solo developer / Small team (2-4) / Larger team (5+)

3. **Generate sprint plan** with:
   - Sprint goal (one sentence)
   - Task list grouped by:
     - **Setup**: Project init, dependencies, config
     - **Backend**: API, database, auth
     - **Screens**: UI implementation
     - **Integration**: Connect frontend to backend
     - **Testing**: Unit, widget, E2E tests
     - **Polish**: Animations, error states, edge cases
   - Each task includes:
     - Description
     - Estimated effort (hours)
     - Dependencies
     - Which agent/skill to use
     - Platform-specific notes

4. **Identify risks and blockers**:
   - Platform approval risks (App Store / Play Store)
   - Third-party service dependencies
   - Device testing requirements
   - Performance benchmarks to hit

5. **Write output** to `docs/sprints/sprint-<N>.md`.

6. **Suggest next steps** based on the first tasks in the sprint.
