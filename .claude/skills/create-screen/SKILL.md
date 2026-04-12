---
name: create-screen
description: "Generate a complete mobile screen with proper structure, state management, loading/error/empty states, and platform conventions."
argument-hint: "<ScreenName>"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash, AskUserQuestion
---

When this skill is invoked:

1. **Detect the project platform** from config files.

2. **Ask about the screen** using `AskUserQuestion`:

   - Tab "Type" — "Screen type?"
     Options: List / Detail / Form / Dashboard / Profile / Settings / Auth (Login-Signup) / Onboarding / Empty (blank)
   - Tab "Data" — "Data source?"
     Options: API fetch / Local database / Static / Real-time (WebSocket-Firestore) / None
   - Tab "Features" — "Include which features?"
     Options (multi): Pull to refresh / Infinite scroll / Search / Filter / Sort / FAB / Swipe actions

3. **Generate the screen** with:

   - **Screen file** with proper structure for the platform:
     - RN: Functional component with hooks
     - Flutter: StatelessWidget with ConsumerWidget/BlocBuilder
     - SwiftUI: View with @State/@ObservedObject
     - Compose: @Composable with ViewModel
   - **State management** integration (ViewModel / Store / BLoC / Provider)
   - **All screen states**:
     - Loading (skeleton / shimmer)
     - Error (retry button, error message)
     - Empty (illustration, call to action)
     - Populated (actual content)
   - **Accessibility**: Labels, roles, hints
   - **Safe area** handling
   - **Keyboard avoidance** (for form screens)

4. **Generate supporting files**:
   - View model / controller / cubit (depending on architecture)
   - Type definitions / data classes
   - Test file (basic unit test for the view model)

5. **Register the screen** in navigation if navigation is already set up.

6. **Suggest next steps**:
   1. "Run `/create-component <name>` for reusable parts of this screen"
   2. "Run `/write-tests` to add comprehensive tests"
   3. "Run `/add-animation` to add transitions or micro-interactions"
