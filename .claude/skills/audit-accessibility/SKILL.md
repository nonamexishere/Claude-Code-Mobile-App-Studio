---
name: audit-accessibility
description: "Audit mobile app accessibility: screen reader support, touch targets, contrast ratios, dynamic type, and reduced motion."
argument-hint: "[file-or-screen]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Bash, Write, AskUserQuestion
---

When this skill is invoked:

1. **Detect the project platform** from config files.

2. **Determine audit scope**:

   - Tab "Scope" — "What to audit?"
     Options: Specific screen / Component library / Full app / Navigation flow

3. **Run accessibility audit** checking for:

   **Screen Reader (VoiceOver / TalkBack)**:
   - [ ] All interactive elements have accessibility labels
   - [ ] Labels are descriptive (not "button 1")
   - [ ] Images have alt text or are marked decorative
   - [ ] Reading order is logical
   - [ ] Custom components expose correct roles
   - [ ] Dynamic content changes announced (live regions)
   - [ ] Modal/sheet focus management

   **Touch Targets**:
   - [ ] Minimum 44x44pt (iOS) / 48x48dp (Android)
   - [ ] Adequate spacing between targets
   - [ ] Hit slop configured for small elements
   - [ ] No gesture-only actions without alternatives

   **Visual**:
   - [ ] Color contrast >= 4.5:1 (normal text) / 3:1 (large text)
   - [ ] Information not conveyed by color alone
   - [ ] Focus indicators visible
   - [ ] Dark mode contrast maintained

   **Typography**:
   - [ ] Dynamic Type / font scaling supported
   - [ ] Text doesn't truncate at larger sizes
   - [ ] Layout adapts to larger text
   - [ ] Minimum font size >= 11pt

   **Motion**:
   - [ ] Respects "Reduce Motion" / "prefers-reduced-motion"
   - [ ] No auto-playing animations without pause control
   - [ ] No flashing content (seizure risk)

   **Navigation**:
   - [ ] Keyboard navigation works (external keyboard)
   - [ ] Switch Control / Switch Access compatible
   - [ ] Back navigation accessible
   - [ ] Tab order logical

4. **Generate accessibility report** with:
   - WCAG 2.1 level (A, AA, AAA) assessment
   - Issues with file/line references
   - Fix code examples
   - Testing instructions (VoiceOver/TalkBack manual testing steps)

5. **Final step — handoff.** Follow `.claude/docs/handoff-template.md`.

   - Append breadcrumb to `.claude/session/active.md`:
     ```
     ## /audit-accessibility — [YYYY-MM-DD HH:MM]
     - Action: audited [scope] — found [N] issues at WCAG [level]
     - Recommended next: fix findings then /code-review
     ```
   - Render the handoff block with:
     - `/code-review` — review the fixes applied for findings *(recommended)*
     - `/setup-theme` — refine contrast and dynamic type tokens
     - `/test-devices` — verify with assistive tech on real devices
     - `/write-tests` — add accessibility regression tests
     - `@accessibility-specialist` — deep remediation and WCAG AA sign-off
