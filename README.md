# Claude Code Mobile Studio

An AI-powered virtual mobile app development studio that runs entirely inside **[Claude Code](https://claude.ai/claude-code)**. Build iOS, Android, and cross-platform mobile apps with a team of specialized AI agents and workflow skills.

Inspired by [Claude Code Game Studios](https://github.com/Donchitos/Claude-Code-Game-Studios).

## What Is This?

Claude Code Mobile Studio is a **configuration layer** for Claude Code — a collection of agent definitions, skill workflows, hooks, and settings that transform Claude Code into a full mobile development studio. It's not a library or framework; it's a team of AI specialists that live in your terminal.

## Supported Platforms

| Platform | Technologies |
|----------|-------------|
| **Cross-platform** | React Native, Expo, Flutter |
| **iOS Native** | Swift, SwiftUI, UIKit |
| **Android Native** | Kotlin, Jetpack Compose |
| **Backend** | Firebase, Supabase, Custom REST/GraphQL |

## Getting Started

### Prerequisites
- [Claude Code](https://claude.ai/claude-code) installed and configured
- Claude Pro or API access

### Installation

1. Clone this repository into your project (or start a new project):
   ```bash
   git clone https://github.com/YOUR_USERNAME/Claude-Code-Mobile-Studio.git my-app
   cd my-app
   ```

2. Start Claude Code:
   ```bash
   claude
   ```

3. Run the setup wizard:
   ```
   /start
   ```

### Quick Start
```
/start                        # Set up a new project
/brainstorm fitness tracker   # Brainstorm an app idea
/help                         # See all available commands
```

## Agent Roster

### Tier 1 — Directors (Strategic Decisions)

| Agent | Role |
|-------|------|
| `@mobile-architect` | Platform selection, architecture, offline strategy |
| `@product-owner` | Product thinking, features, mobile UX strategy |
| `@tech-lead` | Code quality, review standards, technical decisions |

### Tier 2 — Department Leads (Domain Expertise)

| Agent | Role |
|-------|------|
| `@react-native-lead` | React Native / Expo architecture |
| `@flutter-lead` | Flutter / Dart architecture |
| `@native-ios-lead` | Swift / SwiftUI / UIKit |
| `@native-android-lead` | Kotlin / Jetpack Compose |
| `@backend-lead` | Mobile-optimized APIs, BaaS |
| `@ux-lead` | Mobile UX, HIG, Material Design |
| `@qa-lead` | Test strategy, device matrix |
| `@devops-lead` | CI/CD, code signing, OTA updates |

### Tier 3 — Specialists (Implementation)

| Agent | Specialty |
|-------|-----------|
| `@expo-developer` | Expo SDK, EAS services |
| `@rn-navigation-specialist` | React Navigation, deep linking |
| `@rn-state-specialist` | Zustand, RTK Query, offline patterns |
| `@flutter-widget-specialist` | Riverpod, BLoC, Slivers |
| `@swiftui-developer` | SwiftUI, Swift concurrency, SwiftData |
| `@uikit-developer` | UIKit, compositional layouts |
| `@kotlin-developer` | Compose, Hilt, Room, coroutines |
| `@firebase-specialist` | Auth, Firestore, FCM, Crashlytics |
| `@supabase-specialist` | Postgres, Realtime, Edge Functions |
| `@api-developer` | REST/GraphQL, delta sync, batch endpoints |
| `@database-specialist` | WatermelonDB, Drift, Room, sync patterns |
| `@ui-developer` | Tamagui, NativeWind, Material 3, design tokens |
| `@animation-specialist` | Reanimated, Lottie, Rive, gestures |
| `@figma-to-mobile` | Design token extraction, Figma to code |
| `@permissions-specialist` | Runtime permissions, ATT, privacy |
| `@push-notification-specialist` | FCM, APNs, rich notifications |
| `@offline-specialist` | Offline-first, sync, CRDTs |
| `@performance-engineer` | Startup, FPS, memory, bundle size |
| `@test-engineer` | Jest, Detox, Maestro, XCTest, Espresso |
| `@accessibility-specialist` | VoiceOver, TalkBack, Dynamic Type |
| `@store-specialist` | App Store / Play Store submission |
| `@security-specialist` | Keychain, SSL pinning, biometric auth |

## Skills (Slash Commands)

### Setup & Planning
| Skill | Description |
|-------|-------------|
| `/start` | Project setup wizard |
| `/brainstorm` | Brainstorm an app idea |
| `/help` | Show agents, skills, and workflows |
| `/define-features` | Define and prioritize features |
| `/wireframe` | Generate ASCII wireframes |
| `/sprint-plan` | Create a sprint plan |

### Architecture
| Skill | Description |
|-------|-------------|
| `/create-architecture` | Design app architecture |
| `/design-api` | Design mobile-optimized API |
| `/design-database` | Design local and remote database |
| `/setup-navigation` | Configure navigation structure |

### Screen & UI
| Skill | Description |
|-------|-------------|
| `/create-screen` | Generate a complete screen |
| `/create-component` | Create reusable component |
| `/create-form` | Build form with validation |
| `/create-list` | Create performant scrollable list |
| `/setup-theme` | Set up design system and dark mode |
| `/add-animation` | Add animations and micro-interactions |

### Backend & Data
| Skill | Description |
|-------|-------------|
| `/setup-firebase` | Set up Firebase services |
| `/setup-supabase` | Set up Supabase services |
| `/create-endpoint` | Create API endpoint or service |
| `/create-model` | Generate data model classes |
| `/setup-auth` | Implement authentication flow |
| `/setup-offline` | Implement offline-first architecture |

### Platform Features
| Skill | Description |
|-------|-------------|
| `/setup-push-notifications` | Configure push notifications |
| `/setup-deep-linking` | Set up deep links and universal links |
| `/setup-permissions` | Handle runtime permissions |
| `/setup-in-app-purchase` | Set up in-app purchases |
| `/setup-analytics` | Add analytics tracking |
| `/setup-crash-reporting` | Add crash reporting |

### Testing & Quality
| Skill | Description |
|-------|-------------|
| `/write-tests` | Write unit, widget, and E2E tests |
| `/code-review` | Review code for mobile best practices |
| `/audit-performance` | Audit app performance |
| `/audit-security` | Security audit |
| `/audit-accessibility` | Accessibility audit |
| `/test-devices` | Generate device testing matrix |

### DevOps & Release
| Skill | Description |
|-------|-------------|
| `/setup-cicd` | Set up CI/CD pipeline |
| `/setup-codepush` | Configure OTA updates |
| `/build` | Build the app |
| `/publish-appstore` | Prepare for App Store submission |
| `/publish-playstore` | Prepare for Play Store submission |

### Team & Documentation
| Skill | Description |
|-------|-------------|
| `/create-changelog` | Generate changelog from git history |
| `/team-feature` | Orchestrate a full feature build |
| `/generate-docs` | Generate project documentation |
| `/create-readme` | Generate project README |

## Typical Workflow

```
1. PLAN       /brainstorm → /define-features → /create-architecture
2. DESIGN     /wireframe → /setup-theme → /setup-navigation
3. BUILD      /create-screen → /create-component → /create-form
4. INTEGRATE  /setup-auth → /setup-push-notifications → /setup-offline
5. TEST       /write-tests → /audit-performance → /audit-accessibility
6. RELEASE    /setup-cicd → /build → /publish-appstore / /publish-playstore
```

## Examples

### Start a new React Native app
```
/start my-fitness-app
> Select: React Native (Expo)
> Select: Firebase
> Select: Zustand
```

### Ask for architecture advice
```
@mobile-architect I'm building a social media app with offline support.
Should I use React Native or Flutter? We need real-time messaging and
image uploads.
```

### Build a complete feature
```
/team-feature user-profile
```
This orchestrates multiple agents to design, build, test, and review the feature.

## Project Structure

```
.claude/
├── agents/               # 33 AI agent definitions
│   ├── mobile-architect.md
│   ├── product-owner.md
│   ├── tech-lead.md
│   ├── react-native-lead.md
│   ├── flutter-lead.md
│   ├── ...and 28 more
├── skills/               # 43 workflow skills
│   ├── start/SKILL.md
│   ├── brainstorm/SKILL.md
│   ├── create-screen/SKILL.md
│   ├── setup-auth/SKILL.md
│   ├── ...and 39 more
├── hooks/                # Validation hooks
│   ├── validate-commit.sh
│   └── validate-mobile-assets.sh
├── docs/                 # Studio documentation
│   ├── agent-roster.md
│   └── quick-start.md
└── settings.json         # Permissions and hook config
CLAUDE.md                 # Studio configuration
README.md                 # This file
```

## Contributing

Contributions are welcome! Here are some ways to help:

- Add new agents for emerging technologies
- Improve existing skill workflows
- Add platform-specific templates
- Report issues or suggest features

## License

MIT

## Acknowledgments

- [Claude Code Game Studios](https://github.com/Donchitos/Claude-Code-Game-Studios) — the original inspiration
- [Anthropic](https://www.anthropic.com/) — for Claude Code
