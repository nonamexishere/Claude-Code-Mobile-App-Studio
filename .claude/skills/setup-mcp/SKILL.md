---
name: setup-mcp
description: "Install an officially-published MCP (Model Context Protocol) server for a service in your mobile stack — Expo, RevenueCat, Sentry, Firebase, Supabase, etc."
argument-hint: "[service name, e.g. expo|revenuecat|sentry|firebase|supabase]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Bash, AskUserQuestion
---

When this skill is invoked:

1. **Read the catalog** at `.claude/docs/mcp-servers.md` — that doc is the source of truth for which MCPs we recommend, their install command, and what each provides.

2. **Determine which MCP** the user wants:
   - If the argument matches a tech in the catalog (e.g. `expo`, `revenuecat`), proceed.
   - Otherwise, use `AskUserQuestion` with categories. Detect the stack first with `Glob` (`package.json`, `pubspec.yaml`, `Podfile`, `build.gradle`):
     - **Build/Distribution**: Expo/EAS, RevenueCat
     - **Backend**: Firebase, Supabase, MongoDB
     - **Auth**: Clerk, Auth0
     - **Payments/IAP**: RevenueCat, Stripe
     - **Push/SMS/Email**: Twilio, Resend
     - **Analytics/Monitoring**: Sentry, PostHog, Firebase Crashlytics
     - **Design**: Figma
     - **Dev/Collaboration**: GitHub, Linear, Notion, Slack

3. **Show the install plan** before executing. Surface from the catalog:
   - Type (Hosted OAuth / Local stdio / Built into CLI)
   - Exact command
   - What auth/setup the user needs (API key, paid plan, OAuth, etc.)
   - What the MCP provides

4. **Confirm before installing**. Use `AskUserQuestion`:
   - "Run install now?" — Yes / No
   - If the MCP needs an API key or paid plan the user doesn't have yet (e.g. EAS, Figma Dev seat), abort and tell them what they need first.

5. **Run the install command** via `Bash`. Common patterns:
   - Hosted OAuth: `claude mcp add --transport http <name> <url>`
   - Local stdio: `claude mcp add <name> -- <command> [args...]`
   - Built-in (Firebase): just document — `firebase experimental:mcp` is invoked by the Firebase CLI itself

6. **Verify** by running `claude mcp list` (if available) or instruct user to run `/mcp` in Claude Code to check the connection.

7. **For OAuth-based servers**, tell the user:
   > "Open Claude Code and run `/mcp` to start the OAuth flow for `<name>`. You'll be redirected to the vendor's site to authorize."

8. **Final step — handoff.** Follow `.claude/docs/handoff-template.md`.

   - Append breadcrumb to `.claude/session/active.md`:
     ```
     ## /setup-mcp — [YYYY-MM-DD HH:MM]
     - Action: installed [service] MCP — [hosted|local|built-in]
     - Recommended next: complete OAuth flow / set env var, then verify with /mcp
     ```
   - Render the handoff block. Pick the recommended based on what was installed:
     - For Expo/EAS: `/build` or `/setup-codepush`
     - For RevenueCat: `/setup-in-app-purchase`
     - For Firebase/Supabase: `/setup-auth` or `/design-database`
     - For Sentry: `/setup-crash-reporting`
     - For PostHog: `/setup-analytics`
     - For GitHub/Linear: `/sprint-plan` or `/code-review`
     - For Figma: `/wireframe` or `/create-screen`
   - Always include: `/setup-mcp` (install another), `/help` (what's next), `@tech-lead` (review setup)
