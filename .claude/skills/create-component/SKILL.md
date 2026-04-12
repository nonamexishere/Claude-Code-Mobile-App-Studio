---
name: create-component
description: "Create a reusable UI component with variants, theming support, and accessibility built in."
argument-hint: "<ComponentName> [--variants small,medium,large]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash, AskUserQuestion
---

When this skill is invoked:

1. **Detect the project platform** from config files.

2. **Parse arguments** for component name and optional --variants flag.

3. **Ask about the component** using `AskUserQuestion` if needed:

   - Tab "Type" — "Component type?"
     Options: Button / Card / Input / Avatar / Badge / Chip / Modal / BottomSheet / ListItem / Header / Custom
   - Tab "Variants" — "Variants needed?"
     Options: Size (small, medium, large) / Style (primary, secondary, outline) / State (default, disabled, loading) / All

4. **Generate the component** with:

   - **Component file** following platform conventions:
     - RN: Functional component with StyleSheet
     - Flutter: StatelessWidget with theme extension
     - SwiftUI: View with custom ViewModifier
     - Compose: @Composable with MaterialTheme
   - **Props/parameters** with TypeScript types / Dart types / Swift generics
   - **Variants** via props (size, color, style)
   - **Theme integration** — respects dark/light mode
   - **Accessibility**:
     - Proper roles and labels
     - Minimum touch target (44pt iOS / 48dp Android)
     - Dynamic type / font scaling support
   - **Haptic feedback** where appropriate (buttons, toggles)
   - **Loading state** with skeleton/shimmer if applicable

5. **Generate supporting files**:
   - Storybook / widget catalog entry (if applicable)
   - Test file with variant coverage

6. **Suggest next steps**:
   1. "Use this component in a screen with `/create-screen`"
   2. "Run `/setup-theme` to ensure consistent theming"
   3. "Talk to `@ui-developer` for design system questions"
