---
name: code-review
description: "Review mobile code for quality, performance, security, and platform best practices. Checks for common mobile pitfalls."
argument-hint: "[file-or-directory]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, AskUserQuestion
---

When this skill is invoked:

1. **Determine review scope** — if argument provided, review that path. Otherwise review recent changes or ask:

   - Tab "Scope" — "What to review?"
     Options: Specific file / Directory / Recent git changes / Full project

2. **Read the target files** and analyze against mobile-specific criteria:

   **Performance**:
   - [ ] No unnecessary re-renders (React.memo, useMemo, useCallback)
   - [ ] Lists use virtualization (FlashList, LazyColumn, ListView.builder)
   - [ ] Images are cached and properly sized
   - [ ] No heavy computation on main/UI thread
   - [ ] Animations run on native driver / UI thread
   - [ ] No memory leaks (cleanup in useEffect / dispose)

   **Security**:
   - [ ] No hardcoded API keys or secrets
   - [ ] Sensitive data in secure storage (not AsyncStorage/SharedPreferences)
   - [ ] No console.log / print with sensitive data
   - [ ] API calls use HTTPS
   - [ ] Input validation on user data

   **Offline & State**:
   - [ ] Error states handled (network failure, timeout)
   - [ ] Loading states for async operations
   - [ ] Empty states for lists and data views
   - [ ] Optimistic updates where appropriate
   - [ ] Proper cleanup on unmount / dispose

   **Platform**:
   - [ ] Safe area handling (notch, dynamic island, navigation bar)
   - [ ] Keyboard avoidance on forms
   - [ ] Back button / gesture handling (Android)
   - [ ] Permissions checked before use
   - [ ] Deep links handled

   **Accessibility**:
   - [ ] Accessibility labels on interactive elements
   - [ ] Touch targets >= 44pt (iOS) / 48dp (Android)
   - [ ] Color contrast ratios met
   - [ ] Dynamic type / font scaling supported

   **Code Quality**:
   - [ ] Consistent naming conventions
   - [ ] No dead code or unused imports
   - [ ] Proper error handling (not just catch-all)
   - [ ] Types are properly defined (no `any`)

3. **Generate review report** with:
   - Summary (pass/fail with confidence)
   - Issues grouped by severity (critical, warning, suggestion)
   - Specific line references
   - Fix suggestions with code examples

4. **Write report** to stdout (not a file).

5. **Final step — handoff.** Follow `.claude/docs/handoff-template.md`.

   - Append breadcrumb to `.claude/session/active.md`:
     ```
     ## /code-review — [YYYY-MM-DD HH:MM]
     - Action: reviewed [path], found [X critical / Y warnings]
     - Recommended next: [depends on findings]
     ```
   - Render the handoff block. Pick the recommended option based on findings:
     - If critical issues: recommend fixing them now, offer `@tech-lead` for tricky ones
     - If warnings only: recommend `/write-tests` for coverage gaps
     - If clean: recommend next task from `/sprint-plan`
   - Always include: `/write-tests`, `/audit-performance`, `/audit-security`, `/sprint-plan`
