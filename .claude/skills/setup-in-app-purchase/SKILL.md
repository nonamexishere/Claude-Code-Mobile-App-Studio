
---
name: setup-in-app-purchase
description: "Set up in-app purchases and subscriptions: StoreKit 2, Google Play Billing, receipt validation, and subscription management."
argument-hint: "[type: consumable|non-consumable|subscription]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash, AskUserQuestion
---

When this skill is invoked:

1. **Detect the project platform** from config files.

2. **Ask about IAP needs** using `AskUserQuestion`:

   - Tab "Type" — "Purchase types?"
     Options (multi): Consumable (coins, credits) / Non-consumable (unlock feature) / Auto-renewable subscription / Non-renewing subscription
   - Tab "Products" — "Number of products?"
     Options: 1-3 simple products / Subscription tiers (monthly, annual) / Complex catalog
   - Tab "Validation" — "Receipt validation?"
     Options: Server-side (recommended) / On-device only / RevenueCat (third-party)

3. **Generate IAP implementation**:

   - **Product definitions**: Product IDs, descriptions, pricing
   - **Store service** with methods:
     - fetchProducts() — load product details from store
     - purchase(productId) — initiate purchase
     - restorePurchases() — restore previous purchases
     - checkSubscriptionStatus() — verify active subscription
   - **Purchase flow**:
     - Loading products from App Store Connect / Google Play Console
     - Purchase UI with price display
     - Transaction handling and verification
     - Error handling (cancelled, failed, deferred)
     - Success confirmation
   - **Receipt validation**:
     - Server-side validation endpoint
     - StoreKit 2 JWS verification (iOS)
     - Google Play Developer API verification (Android)
   - **Subscription management**:
     - Subscription status tracking
     - Grace period handling
     - Upgrade/downgrade flows
     - Cancellation handling
     - Paywall UI component
   - **RevenueCat integration** (if selected):
     - SDK setup, offering configuration, entitlement checks

4. **Platform setup instructions**:
   - App Store Connect: Create products, pricing, sandbox testing
   - Google Play Console: Create products, testing tracks

5. **Final step — handoff.** Follow `.claude/docs/handoff-template.md`.

   - Append breadcrumb to `.claude/session/active.md`:
     ```
     ## /setup-in-app-purchase — [YYYY-MM-DD HH:MM]
     - Action: wired IAP for [types] with [validation] receipt validation
     - Recommended next: /publish-appstore
     ```
   - Render the handoff block with:
     - `/publish-appstore` — configure products in App Store Connect *(recommended)*
     - `/publish-playstore` — configure products in Play Console
     - `/setup-analytics` — track purchase funnel and revenue events
     - `/write-tests` — cover purchase, restore, and subscription edge cases
     - `@store-specialist` — paywall UX and store review compliance
