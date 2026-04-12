---
name: audit-performance
description: "Audit mobile app performance: startup time, FPS, memory usage, bundle size, battery impact, and rendering efficiency."
argument-hint: "[area: startup|rendering|memory|bundle|battery|all]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Bash, Write, AskUserQuestion
---

When this skill is invoked:

1. **Detect the project platform** from config files.

2. **Determine audit scope** using `AskUserQuestion` if no argument:

   - Tab "Area" — "What to audit?"
     Options: Startup time / Rendering-FPS / Memory / Bundle size / Battery / Network / All areas

3. **Run performance audit** checking for:

   **Startup Time**:
   - Heavy initialization on app start
   - Lazy loading opportunities
   - Splash screen duration
   - Import/require optimization

   **Rendering (60fps)**:
   - Unnecessary re-renders / widget rebuilds
   - Heavy layouts (nested ScrollView, deep widget trees)
   - List virtualization usage
   - Overdraw issues
   - Animation performance (native driver usage)

   **Memory**:
   - Image memory management (caching, resizing)
   - Listener/subscription cleanup
   - Large state objects
   - Memory leak patterns (circular refs, uncleaned timers)

   **Bundle Size**:
   - Large dependencies analysis
   - Tree shaking effectiveness
   - Asset optimization (image compression, unused assets)
   - Code splitting opportunities
   - ProGuard/R8 configuration (Android)

   **Battery**:
   - Background task frequency
   - Location update intervals
   - Network request batching
   - Wake lock usage
   - Animation efficiency

   **Network**:
   - Request deduplication
   - Response caching headers
   - Image CDN usage
   - Payload size analysis
   - Compression usage

4. **Generate audit report** with:
   - Performance score per area (good/warning/critical)
   - Specific issues with file/line references
   - Fix recommendations with priority
   - Platform-specific profiling tool commands

5. **Output report** to stdout.

6. **Suggest next steps**:
   1. "Talk to `@performance-engineer` for optimization help"
   2. "Run `/build` to check actual bundle sizes"
