# Vendor AI Rules & `llms.txt` Catalog (Mobile Studio)

**Last verified:** 2026-04-27

Many mobile platforms and BaaS providers now publish AI-targeted resources — `llms.txt` files, official "AI rules" pages, or installable rule packs. When agents in this studio specialize in one of these, they should **fetch and reference the vendor's guidance** rather than working from training-data assumptions.

---

## Tier 1 — Highest Impact (vendor-authored prescriptive rules)

### Expo / React Native ⭐⭐
- **`llms-full.txt`:** https://docs.expo.dev/llms-full.txt
- **EAS-specific:** https://docs.expo.dev/llms-eas.txt
- **AI hub:** https://docs.expo.dev/llms/
- **Expo Skills (vendor-authored skill bundles):** https://docs.expo.dev/skills/ — install via `bunx skills add expo/skills` or `/plugin install expo@claude-plugins-official`
- **Use:** `@expo-developer` and `@react-native-lead` should install Expo Skills when working on a real project; reference llms-full.txt for SDK questions.

### Flutter ⭐⭐
- **AI rules page:** https://docs.flutter.dev/ai/ai-rules
- **Compact ruleset (1k tokens):** `rules_1k.md` (linked from AI rules page)
- **AI hub:** https://docs.flutter.dev/ai
- **Topic files:** `bloc.md`, `effective_dart.md`, etc. at https://github.com/flutter/website/tree/main/src/content/ai
- **Use:** `@flutter-lead` and `@flutter-widget-specialist` should fetch `rules_1k.md` for context-budget tasks, full `rules.md` for deep work. BLoC-specific tasks → fetch `bloc.md`.

### Supabase ⭐⭐
- **AI Prompts hub:** https://supabase.com/docs/guides/getting-started/ai-prompts (RLS, SQL style, edge functions — all vendor-curated)
- **Cursor/Windsurf installer:** https://supabase.com/ui/docs/ai-editors-rules/prompts
- **Use:** `@supabase-specialist` should fetch the RLS prompt before writing policies on mobile-side schemas.

---

## Tier 2 — Solid Vendor-Published Material

### Firebase
- **MCP Server:** https://firebase.google.com/docs/ai-assistance/mcp-server (vendor approach — install MCP rather than scrape docs)
- **Use:** `@firebase-specialist` should suggest `firebase experimental:mcp` rather than reaching for web docs.

### RevenueCat
- **`llms.txt`:** https://www.revenuecat.com/docs/llms.txt
- **`.md` convention:** any docs URL works with `.md` appended
- **Use:** IAP / subscription work — fetch the relevant docs page as `.md` for accurate platform-specific guidance.

### Stripe (for non-IAP web purchases)
- **`llms.txt`:** https://docs.stripe.com/llms.txt
- **Building with LLMs:** https://docs.stripe.com/building-with-llms
- **`.md` convention:** append `.md` to any Stripe docs URL.

### Auth & Cross-Platform Services
- **Clerk:** https://clerk.com/docs/llms-full.txt
- **Auth0:** https://auth0.com/ai/docs/llms-full.txt + https://auth0.com/ai/docs/build-with-ai/using-ai-tools

### State Management (via Flutter)
- **BLoC:** Flutter's `bloc.md` rule file at https://github.com/flutter/website/blob/main/src/content/ai/bloc.md (vendor-published as part of Flutter AI rules)
- **Riverpod:** Flutter publishes related guidance in the same AI rules repo

---

## Skip — No Vendor Material Available

SwiftUI / UIKit / Apple platforms (no `llms.txt`, no rules — community workaround: llm.codes), Jetpack Compose / Android (no vendor rules from Google), Reanimated, Lottie, NativeWind, Tamagui, Zustand, Redux Toolkit. Use agent training-data and the official docs directly via WebFetch.

---

## How to Use This in Agent Prompts

When an agent specializes in a tech with a Tier 1/2 entry above, its prompt should include something like:

> Before generating code, fetch the relevant vendor AI rules:
> - For Expo SDK questions: `WebFetch https://docs.expo.dev/llms-full.txt`
> - For Flutter widgets: `WebFetch https://docs.flutter.dev/ai/ai-rules` (or rules_1k.md for compact context)
> - For Supabase RLS: `WebFetch https://supabase.com/docs/guides/getting-started/ai-prompts`

Don't hardcode the rules into prompts (they evolve). Link them.
