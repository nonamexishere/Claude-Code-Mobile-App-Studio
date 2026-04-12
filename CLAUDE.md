# Claude Mobile Studio

An AI-powered virtual mobile app development studio that runs entirely inside Claude Code.
Inspired by [Claude Code Game Studios](https://github.com/Donchitos/Claude-Code-Game-Studios),
built for native and cross-platform mobile application development.

## Studio Structure

This project provides a **three-tier agent hierarchy** modeled after a professional
mobile development agency:

- **Tier 1 — Directors** (Opus): Mobile Architect, Product Owner, Tech Lead
- **Tier 2 — Department Leads** (Sonnet): React Native, Flutter, iOS, Android, Backend, UX, QA, DevOps
- **Tier 3 — Specialists** (Sonnet/Haiku): Expo, SwiftUI, Kotlin, Firebase, Animations, Store Publishing, etc.

## Supported Platforms

- **Cross-platform**: React Native, Expo, Flutter
- **Native iOS**: Swift, SwiftUI, UIKit
- **Native Android**: Kotlin, Jetpack Compose
- **Backend**: Firebase, Supabase, custom REST/GraphQL APIs

## How to Use

### Start a New App
```
/start
```

### Brainstorm an Idea
```
/brainstorm fitness tracker
```

### Design Your App
```
/create-architecture
/setup-navigation
/setup-theme
/wireframe
```

### Build Screens & Features
```
/create-screen HomeScreen
/create-component Avatar --variants small,medium,large
/create-list products --pagination cursor
/setup-auth social
/setup-push-notifications
```

### Quality & Release
```
/write-tests
/code-review
/audit-performance
/setup-cicd
/publish-appstore
/publish-playstore
```

### Get Help
```
/help
/help agents
/help skills
/help workflow
```

## Agent Usage

Talk to any agent directly:
```
@mobile-architect Should I use React Native or Flutter for this project?
@react-native-lead How should I structure navigation for a social app?
@flutter-lead What state management should I use?
@native-ios-lead Implement a custom camera view in SwiftUI
@firebase-specialist Set up Firestore with offline persistence
```

## Project Conventions

- All source code goes in `src/` or framework-specific locations
- Screens in `src/screens/` or `src/features/`
- Reusable components in `src/components/`
- Navigation config in `src/navigation/`
- State/stores in `src/stores/` or `src/state/`
- API/services in `src/services/`
- Shared types in `src/types/`
- Assets in `assets/`
- Tests mirror source structure in `__tests__/` or `tests/`
- Documentation in `docs/`
- Design documents in `design/`

## Commit Convention

Use conventional commits:
- `feat:` new feature
- `fix:` bug fix
- `refactor:` code restructuring
- `docs:` documentation
- `test:` tests
- `chore:` tooling, deps, config
- `style:` formatting, styling
- `perf:` performance improvement
