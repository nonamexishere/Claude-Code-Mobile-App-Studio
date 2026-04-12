---
name: start
description: "Project onboarding and setup wizard. Walks through platform selection, folder structure creation, and initial configuration."
argument-hint: "[project-name]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash, AskUserQuestion
---

When this skill is invoked:

1. **Welcome the user** and explain the mobile studio concept briefly.

2. **Gather project information** using `AskUserQuestion`:

   - Tab "App Type" — "What are you building?"
     Options: Social App / E-commerce / Fitness-Health / Productivity / Messaging / Fintech / Media-Streaming / Other
   - Tab "Platform" — "Target platform?"
     Options: React Native (Expo) / React Native (bare) / Flutter / Swift (iOS only) / Kotlin (Android only) / Both Native (Swift + Kotlin)
   - Tab "Backend" — "Backend service?"
     Options: Firebase / Supabase / Custom REST API / Custom GraphQL API / None yet
   - Tab "Auth" — "Authentication method?"
     Options: Email-Password / Social Login (Google, Apple, Facebook) / Phone OTP / Biometric / Multiple

3. **Gather additional context**:
   - Tab "State" — "State management?"
     Vary by platform:
     - RN: Zustand / Redux Toolkit / Jotai / TanStack Query
     - Flutter: Riverpod / BLoC / Provider / GetX
     - iOS: TCA / SwiftUI Observable / Combine
     - Android: ViewModel + Flow / Hilt + Room
   - Tab "Navigation" — "Navigation approach?"
     Vary by platform:
     - RN: Expo Router / React Navigation / React Native Navigation
     - Flutter: GoRouter / auto_route / Navigator 2.0
     - iOS: NavigationStack / Coordinator pattern
     - Android: Jetpack Navigation / Voyager
   - Tab "Styling" — "UI approach?"
     Vary by platform:
     - RN: NativeWind (Tailwind) / Tamagui / StyleSheet / Gluestack
     - Flutter: Material 3 / Cupertino / Custom theme
     - iOS: SwiftUI native / Custom design system
     - Android: Material 3 / Custom Compose theme

4. **Create the project structure** based on selections:
   - Initialize the project with the chosen framework CLI
   - Set up folder structure following project conventions from CLAUDE.md
   - Create initial configuration files
   - Set up navigation shell with placeholder screens
   - Initialize git repository

5. **Generate initial documents**:
   - `docs/architecture.md` — initial architecture overview
   - `docs/tech-stack.md` — chosen technologies with rationale
   - `docs/platform-notes.md` — platform-specific considerations

6. **Suggest next steps**:
   1. "Run `/brainstorm` to flesh out your app idea"
   2. "Run `/wireframe` to sketch your key screens"
   3. "Run `/setup-navigation` to configure your navigation structure"
   4. "Run `/setup-theme` to establish your design system"
   5. "Talk to `@mobile-architect` for architecture guidance"
