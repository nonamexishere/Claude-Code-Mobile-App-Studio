# Agent Roster — Claude Mobile Studio

## Tier 1 — Directors (Opus)

Strategic decision-makers who guide the overall project.

| Agent | Role | When to Use |
|-------|------|-------------|
| `@mobile-architect` | Platform selection, architecture design, offline strategy, security | "Should I use React Native or Flutter?" |
| `@product-owner` | Product thinking, feature prioritization, mobile UX strategy | "What features should be in the MVP?" |
| `@tech-lead` | Code quality, review standards, technical decisions | "Review my pull request" |

## Tier 2 — Department Leads (Sonnet)

Domain experts who lead their area of the project.

| Agent | Role | When to Use |
|-------|------|-------------|
| `@react-native-lead` | RN/Expo architecture, React Navigation, Hermes, native modules | "How should I structure my RN app?" |
| `@flutter-lead` | Flutter/Dart, Riverpod/BLoC, GoRouter, Clean Architecture | "What state management for Flutter?" |
| `@native-ios-lead` | Swift/SwiftUI/UIKit, TCA, Apple ecosystem | "How to use SwiftData with SwiftUI?" |
| `@native-android-lead` | Kotlin/Compose, Hilt, Jetpack libraries | "Set up Hilt dependency injection" |
| `@backend-lead` | Mobile-optimized APIs, BaaS, push notifications, real-time | "Design API for my mobile app" |
| `@ux-lead` | HIG/Material Design, wireframes, mobile UX patterns | "Design the onboarding flow" |
| `@qa-lead` | Device matrix, test strategy, mobile test checklist | "What should I test before release?" |
| `@devops-lead` | CI/CD, code signing, OTA updates, beta distribution | "Set up Fastlane for iOS" |

## Tier 3 — Specialists (Sonnet/Haiku)

Implementation experts for specific technologies and concerns.

### Cross-Platform Development
| Agent | Specialty |
|-------|-----------|
| `@expo-developer` | Expo SDK, EAS Build/Submit/Update, config plugins |
| `@rn-navigation-specialist` | React Navigation, Expo Router, deep linking |
| `@rn-state-specialist` | Zustand, RTK Query, TanStack Query, MMKV, offline |
| `@flutter-widget-specialist` | Riverpod, BLoC, GoRouter, Slivers, Freezed |

### Native Development
| Agent | Specialty |
|-------|-----------|
| `@swiftui-developer` | SwiftUI 5, Swift concurrency, SwiftData, WidgetKit |
| `@uikit-developer` | UIKit, compositional layouts, SwiftUI interop |
| `@kotlin-developer` | Compose, Hilt, Room, coroutines, Flow |

### Backend & Data
| Agent | Specialty |
|-------|-----------|
| `@firebase-specialist` | Auth, Firestore, Functions, FCM, Crashlytics |
| `@supabase-specialist` | Postgres, Auth, Realtime, Edge Functions |
| `@api-developer` | Mobile-optimized REST/GraphQL, delta sync, batch |
| `@database-specialist` | WatermelonDB, Drift, Room, SwiftData, sync, CRDTs |

### Design & UI
| Agent | Specialty |
|-------|-----------|
| `@ui-developer` | Tamagui, NativeWind, Material 3, design tokens |
| `@animation-specialist` | Reanimated, Gesture Handler, Lottie, Rive |
| `@figma-to-mobile` | Design token extraction, Figma to code |

### Platform Features
| Agent | Specialty |
|-------|-----------|
| `@permissions-specialist` | iOS/Android permissions, ATT, privacy compliance |
| `@push-notification-specialist` | FCM, APNs, rich notifications, silent sync |
| `@offline-specialist` | Offline-first, sync strategies, CRDTs, mutation queue |

### Quality & Release
| Agent | Specialty |
|-------|-----------|
| `@performance-engineer` | Startup, FPS, memory, bundle size, battery |
| `@test-engineer` | Jest, Detox, Maestro, flutter_test, XCTest, Espresso |
| `@accessibility-specialist` | VoiceOver, TalkBack, Dynamic Type, touch targets |
| `@store-specialist` | App Store/Play Store guidelines, ASO, submission |
| `@security-specialist` | Keychain/Keystore, SSL pinning, obfuscation, biometric |
