---
name: setup-theme
description: "Set up a design system with colors, typography, spacing, and dark mode support for the target platform."
argument-hint: "[preset: minimal|material|ios|custom]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash, AskUserQuestion
---

When this skill is invoked:

1. **Detect the project platform** from config files.

2. **Ask about theme preferences** using `AskUserQuestion`:

   - Tab "Style" — "Design style?"
     Options: Material Design 3 / iOS Human Interface / Minimal-Clean / Bold-Vibrant / Custom brand
   - Tab "Colors" — "Primary color?"
     Options: Blue / Purple / Green / Orange / Red / Custom hex
   - Tab "Dark Mode" — "Dark mode support?"
     Options: Yes (system automatic) / Yes (user toggle) / Light only / Dark only

3. **Generate theme system** based on platform:

   **React Native (NativeWind/Tamagui)**:
   - Design tokens (colors, spacing, typography, radii, shadows)
   - Dark/light theme definitions
   - Theme provider setup
   - Tailwind config (NativeWind) or theme config (Tamagui)
   - useTheme hook

   **Flutter**:
   - ThemeData with ColorScheme.fromSeed
   - TextTheme with Google Fonts
   - Custom ThemeExtension for app-specific tokens
   - Dark/light ThemeData
   - Theme switching logic

   **SwiftUI**:
   - Color assets in Asset Catalog format
   - Custom Color extension with semantic colors
   - Typography scale with Dynamic Type
   - ViewModifier for consistent styling
   - @Environment(\.colorScheme) integration

   **Compose**:
   - MaterialTheme customization
   - Color scheme with dynamic colors (Material You)
   - Typography scale
   - Shape definitions
   - isSystemInDarkTheme() integration

4. **Include in theme**:
   - **Colors**: Primary, secondary, surface, background, error, on-colors
   - **Typography**: Display, headline, title, body, label (with scaling)
   - **Spacing**: 4-point grid system (4, 8, 12, 16, 24, 32, 48, 64)
   - **Border radius**: None, small, medium, large, full
   - **Shadows**: None, small, medium, large
   - **Animations**: Duration and easing curves
   - **Touch targets**: Minimum sizes per platform

5. **Write files** to `src/theme/` or platform equivalent.

6. **Final step — handoff.** Follow `.claude/docs/handoff-template.md`.

   - Append breadcrumb to `.claude/session/active.md`:
     ```
     ## /setup-theme — [YYYY-MM-DD HH:MM]
     - Action: configured design system ([style], dark=[mode])
     - Recommended next: /create-component
     ```
   - Render the handoff block with:
     - `/create-component` — build the first themed component *(recommended)*
     - `/create-screen` — build a screen that uses the theme
     - `/audit-accessibility` — verify contrast and dynamic type
     - `/add-animation` — define motion tokens (duration, easing)
     - `@ui-developer` — expand design system
