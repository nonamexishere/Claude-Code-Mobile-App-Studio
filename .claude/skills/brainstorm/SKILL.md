---
name: brainstorm
description: "Brainstorm a mobile app idea. Explores target audience, core features, monetization, and mobile-specific opportunities."
argument-hint: "<app-idea>"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, AskUserQuestion
---

When this skill is invoked:

1. **Acknowledge the idea** and ask clarifying questions using `AskUserQuestion`:

   - Tab "Target" — "Who is this app for?"
     Options: Consumers (B2C) / Businesses (B2B) / Internal tool / Both (B2B2C)
   - Tab "Monetization" — "Revenue model?"
     Options: Free (ad-supported) / Freemium / Subscription / One-time purchase / In-app purchases / Marketplace / None yet

2. **Generate a product brief** covering:
   - **App summary**: One-paragraph description
   - **Target audience**: Demographics, pain points, existing solutions
   - **Core features** (MVP): 5-8 essential features for launch
   - **Mobile advantages**: What makes this better as a mobile app?
     (camera, GPS, push notifications, offline, biometrics, sensors, widgets)
   - **Platform recommendation**: Which platform(s) to target first and why
   - **Differentiator**: What sets this apart from existing apps

3. **Explore mobile-specific opportunities**:
   - Offline capabilities needed?
   - Push notification strategy
   - Widget / Live Activity potential
   - Apple Watch / Wear OS companion?
   - Deep linking scenarios
   - Social sharing features
   - Camera/AR integration
   - Location-based features

4. **Create the output file** at `docs/product-brief.md` with all findings.

5. **Suggest next steps**:
   1. "Run `/define-features` to detail your feature list"
   2. "Run `/wireframe` to sketch your key screens"
   3. "Talk to `@product-owner` for product strategy advice"
