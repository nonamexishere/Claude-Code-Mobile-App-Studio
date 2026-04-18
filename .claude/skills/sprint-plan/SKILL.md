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

6. **Final step — handoff.** Follow `.claude/docs/handoff-template.md`.

   - Append breadcrumb to `.claude/session/active.md`:
     ```
     ## /sprint-plan — [YYYY-MM-DD HH:MM]
     - Action: planned sprint-[N] with [X] tasks ([Y] P0/P1)
     - Progress: 0/[X] tasks done
     - Recommended next: [first task]
     ```
   - Render the handoff block. The recommended option is the highest-priority task with no dependencies — phrase it as the concrete skill (`/create-screen`, `/setup-navigation`, etc.) pointing at that task.
   - Include alternatives: next 2–3 highest-priority tasks, plus `@mobile-architect` to review the plan.
