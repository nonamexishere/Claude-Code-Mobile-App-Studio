---
name: add-animation
description: "Add animations and micro-interactions. Covers transitions, gestures, shared elements, and Lottie/Rive integration."
argument-hint: "<animation-type> [--target component-name]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash, AskUserQuestion
---

When this skill is invoked:

1. **Detect the project platform** from config files.

2. **Ask about animation needs** using `AskUserQuestion`:

   - Tab "Type" — "Animation type?"
     Options: Screen transition / Micro-interaction / Loading animation / Gesture-driven / Shared element / Lottie-Rive / Layout animation / Skeleton shimmer
   - Tab "Trigger" — "What triggers this animation?"
     Options: Screen enter / User tap / Scroll / Gesture (swipe, pinch) / Data change / Timer

3. **Generate animation** based on platform:

   **React Native**:
   - Reanimated 3 worklets (useSharedValue, useAnimatedStyle)
   - Gesture Handler integration (Pan, Pinch, Rotation)
   - Layout animations (entering, exiting, layout)
   - Shared element transitions (react-native-shared-element)
   - Lottie integration (lottie-react-native)

   **Flutter**:
   - Implicit animations (AnimatedContainer, AnimatedOpacity)
   - Explicit animations (AnimationController, Tween)
   - Hero transitions
   - Custom painters with animation
   - Rive/Lottie integration

   **SwiftUI**:
   - withAnimation / .animation modifier
   - matchedGeometryEffect for shared elements
   - Custom transitions
   - Spring animations with sensible defaults
   - TimelineView for continuous animation

   **Compose**:
   - animate*AsState (animateDpAsState, animateColorAsState)
   - AnimatedVisibility with enter/exit transitions
   - Shared element transitions
   - Spring/tween animations
   - InfiniteTransition

4. **Performance considerations**:
   - Run on UI thread (worklets in RN, composition in Compose)
   - Avoid layout thrashing during animation
   - Use native driver where possible
   - Respect prefers-reduced-motion / Reduce Motion setting
   - 60fps target verification

5. **Suggest next steps**:
   1. "Run `/audit-performance` to verify animation smoothness"
   2. "Talk to `@animation-specialist` for complex animations"
