---
name: help
description: "Shows available agents, skills, and recommended workflows. Guides users on what to do next."
argument-hint: "[topic: agents|skills|workflow|all]"
user-invocable: true
allowed-tools: Read, Glob, Grep
---

When this skill is invoked:

1. **Check the argument** to determine what help to show.

2. **If no argument or "all"**, show a brief overview:

   ```
   Welcome to Claude Mobile Studio!

   An AI-powered virtual mobile development studio running inside Claude Code.

   Quick Commands:
     /start              — Set up a new mobile app project
     /brainstorm <idea>  — Brainstorm an app idea
     /help agents        — See all available agents
     /help skills        — See all available skills
     /help workflow      — See recommended development workflow
   ```

3. **If "agents"**, read all files in `.claude/agents/` and display them grouped by tier:

   - **Tier 1 — Directors** (Strategic decisions, architecture)
   - **Tier 2 — Department Leads** (Domain expertise, code review)
   - **Tier 3 — Specialists** (Implementation, specific technologies)

   Show each agent's name, one-line description, and example usage.

4. **If "skills"**, read all SKILL.md files in `.claude/skills/` and display them grouped:

   - **Setup & Planning**: /start, /brainstorm, /define-features, /sprint-plan
   - **Architecture**: /create-architecture, /design-api, /design-database, /setup-navigation
   - **Screen & UI**: /create-screen, /create-component, /create-form, /create-list, /wireframe, /setup-theme, /add-animation
   - **Backend & Data**: /setup-firebase, /setup-supabase, /create-endpoint, /create-model, /setup-auth, /setup-offline
   - **Platform Features**: /setup-push-notifications, /setup-deep-linking, /setup-permissions, /setup-in-app-purchase, /setup-analytics, /setup-crash-reporting
   - **Testing & Quality**: /write-tests, /code-review, /audit-performance, /audit-security, /audit-accessibility, /test-devices
   - **DevOps & Release**: /setup-cicd, /setup-codepush, /build, /publish-appstore, /publish-playstore
   - **Team & Docs**: /create-changelog, /team-feature, /generate-docs, /create-readme

5. **If "workflow"**, show the recommended development workflow:

   ```
   Recommended Workflow:

   1. PLAN       /brainstorm → /define-features → /create-architecture
   2. DESIGN     /wireframe → /setup-theme → /setup-navigation
   3. BUILD      /create-screen → /create-component → /create-form
   4. INTEGRATE  /setup-auth → /setup-push-notifications → /setup-offline
   5. TEST       /write-tests → /audit-performance → /audit-accessibility
   6. RELEASE    /setup-cicd → /build → /publish-appstore / /publish-playstore
   ```

6. **Detect project state** by checking existing files:
   - If no `docs/` folder: suggest starting with `/start` or `/brainstorm`
   - If architecture exists but no screens: suggest `/create-screen`
   - If screens exist but no tests: suggest `/write-tests`
   - If tests exist but no CI: suggest `/setup-cicd`
   - Provide a "You can continue with..." recommendation based on current state.
