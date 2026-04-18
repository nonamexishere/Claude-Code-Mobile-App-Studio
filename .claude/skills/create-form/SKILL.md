---
name: create-form
description: "Generate a mobile form with validation, keyboard handling, and platform-native input patterns."
argument-hint: "<form-name> [--fields name,email,phone]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash, AskUserQuestion
---

When this skill is invoked:

1. **Detect the project platform** from config files.

2. **Ask about the form** using `AskUserQuestion`:

   - Tab "Type" — "Form type?"
     Options: Login / Registration / Profile Edit / Settings / Payment / Address / Search-Filter / Custom
   - Tab "Validation" — "Validation approach?"
     Options: Inline (per field) / On submit / Both (inline + submit)

3. **Generate the form** with:

   - **Form fields** with appropriate keyboard types:
     - Email: email keyboard, email validation
     - Phone: phone pad, formatting
     - Password: secure entry, show/hide toggle, strength indicator
     - Number: numeric pad, min/max
     - Date: date picker (native)
     - Dropdown: picker / bottom sheet select
     - Multi-line: text area with character count
   - **Validation**:
     - Per-field validation rules
     - Real-time inline error messages
     - Form-level validation on submit
     - Debounced validation for expensive checks
   - **Keyboard handling**:
     - KeyboardAvoidingView / keyboard insets
     - Next/Done button on keyboard (returnKeyType)
     - Auto-focus first field
     - Scroll to error field
     - Dismiss keyboard on tap outside
   - **Submission**:
     - Loading state on submit button
     - Disable form during submission
     - Error handling with user-friendly messages
     - Success feedback (haptic + visual)
   - **Platform patterns**:
     - iOS: Form style with grouped insets
     - Android: Material text fields with outlines
     - Flutter: TextFormField with InputDecoration

4. **Generate supporting files**:
   - Validation schema / rules file
   - Form state management (React Hook Form / Formik / flutter_form_builder)
   - Test file covering validation scenarios

5. **Final step — handoff.** Follow `.claude/docs/handoff-template.md`.

   - Append breadcrumb to `.claude/session/active.md`:
     ```
     ## /create-form — [YYYY-MM-DD HH:MM]
     - Action: scaffolded [form-name] with validation + keyboard handling
     - Recommended next: /write-tests
     ```
   - Render the handoff block with:
     - `/write-tests` — cover validation and submission paths *(recommended)*
     - `/create-component` — extract reusable field components
     - `/setup-auth` — if this is a login/signup form
     - `/audit-accessibility` — check labels, errors, and touch targets
     - `@ux-lead` — review form UX (labels, flow, error recovery)
