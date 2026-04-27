# MCP Server Reference (Mobile Studio)

**Last verified:** 2026-04-27

[Model Context Protocol](https://modelcontextprotocol.io) servers extend Claude Code with vendor-published tools — querying live data, triggering builds, fetching crash logs, etc. This studio doesn't pre-wire any MCPs; install only the ones for services you actually use, via `/setup-mcp` or by editing `~/.claude.json` / `.mcp.json` directly.

## How to Install

Three patterns:

1. **Hosted (OAuth)** — easiest, zero secrets. Just point Claude Code at a URL.
   ```bash
   claude mcp add --transport http <name> <url>
   ```
2. **Local stdio (token)** — runs a subprocess, needs an env var or arg.
   ```bash
   claude mcp add <name> -- <command> [args...]
   ```
3. **Manual edit** — add to `.mcp.json` (project-shared) or `~/.claude.json` (user).

After install, restart Claude Code or run `/mcp` to verify the server is connected.

---

## Recommended MCPs by Category

### Mobile Build & Distribution

| Tech | Type | Install / URL | Notes |
|------|------|---------------|-------|
| **Expo / EAS** | Hosted | docs.expo.dev/eas/ai/mcp | Trigger/monitor EAS builds, run workflows, TestFlight crash data, simulator control. **Paid EAS plan required** |
| **RevenueCat** | Hosted (OAuth) | `https://mcp.revenuecat.ai/mcp` | Projects, apps, products, entitlements, offerings, paywalls, analytics |

### Backend Services

| Tech | Type | Install / URL | Notes |
|------|------|---------------|-------|
| **Firebase** | Built into CLI | `firebase experimental:mcp` | Firestore, Auth, Storage, FCM, Crashlytics, Remote Config |
| **Supabase** | Hosted (OAuth) | `https://mcp.supabase.com` | DB queries, Edge Functions, schema, branches. Append `?read_only=true` for safety |
| **MongoDB** | Local stdio | `npx -y mongodb-mcp-server` | Query, aggregate, Atlas cluster mgmt |

### Auth

| Tech | Type | Install / URL | Notes |
|------|------|---------------|-------|
| **Clerk** | Hosted (OAuth) | `https://mcp.clerk.com/mcp` | SDK snippets, user/session mgmt |
| **Auth0** | Local stdio | `npx -y @auth0/auth0-mcp-server init` | Apps, APIs, Actions, users, logs |

### Payments & IAP

| Tech | Type | Install / URL | Notes |
|------|------|---------------|-------|
| **Stripe** | Hosted (OAuth) | `https://mcp.stripe.com` | Used for non-IAP web purchases, billing dashboards |
| **RevenueCat** | Hosted (OAuth) | `https://mcp.revenuecat.ai/mcp` | Cross-platform IAP / subscriptions (recommended for mobile) |

### Push, SMS, Comms

| Tech | Type | Install / URL | Notes |
|------|------|---------------|-------|
| **Twilio** | Local stdio | `npm i @twilio-alpha/mcp` | SMS/Voice/Verify — 1,400+ endpoints (Alpha) |
| **Resend** | Local stdio | `npx -y @resend/mcp-send-email` | Transactional email |

### Analytics & Monitoring

| Tech | Type | Install / URL | Notes |
|------|------|---------------|-------|
| **Sentry** | Hosted (OAuth) | `https://mcp.sentry.dev/mcp` | Crashes, releases, AI debugging |
| **PostHog** | Hosted | `https://mcp.posthog.com/sse` | Mobile analytics, feature flags, experiments |
| **Firebase Crashlytics** | Built into CLI | `firebase experimental:mcp` | Crash reports + Performance |

### Design

| Tech | Type | Install / URL | Notes |
|------|------|---------------|-------|
| **Figma** | Local (Desktop) | Enable in Figma Desktop preferences | Selected-frame to code, variables, components. **Paid Dev/Full seat required** |

### Dev / Collaboration

| Tech | Type | Install / URL | Notes |
|------|------|---------------|-------|
| **GitHub** | Hosted (OAuth) | `https://api.githubcopilot.com/mcp/` | Repos, issues, PRs, Actions, Dependabot |
| **Linear** | Hosted (OAuth) | `https://mcp.linear.app/mcp` | Issues, projects, teams, comments |
| **Notion** | Hosted (OAuth) | `https://mcp.notion.com/mcp` | Specs, design docs, project pages |
| **Slack** | Hosted (OAuth) | docs.slack.dev/ai/slack-mcp-server | Search, send/read messages |

---

## Recommended Bundles

**Solo Expo builder:**
GitHub · Expo · Sentry · RevenueCat · Supabase · PostHog

**Native iOS team:**
GitHub · Sentry · RevenueCat · Firebase · Linear · Figma

**Cross-platform startup (RN + Firebase):**
GitHub · Expo · Firebase · Sentry · RevenueCat · Stripe · Linear

---

## Skip (No Official MCP)

App Store Connect, Google Play Console — only community options exist. Stick to manual workflow via `xcrun altool` / Fastlane / `gcloud` for now, or wait for vendor-published servers.

## When to Reference This Doc

Agents should suggest the relevant MCP **only if it's likely already installed** — e.g., `@expo-developer` can hint "if you have the Expo MCP wired (`/setup-mcp expo`), I can trigger an EAS build directly." Don't pretend tools exist that aren't connected; check via `/mcp` first.
