---
name: skill-creator
description: |
  Bootstrap a new skill for this mobile studio — generates the SKILL.md
  scaffolding, walks through the workflow design, and validates the result
  follows the studio's handoff-template convention. Mirrors Anthropic's
  official skill-creator meta-skill.
when_to_use: |
  USE WHEN the user wants to add a new slash command to the studio, asks
  "how do I create a custom skill / make my own command", says they want
  to extend the studio, or describes a repeated mobile workflow that
  should become a skill.
argument-hint: "[skill-name]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, AskUserQuestion
---

When this skill is invoked:

1. **Get the skill name** — from the argument, or ask via `AskUserQuestion`. Validate: lowercase, hyphens, max 64 chars, not already used (`Glob .claude/skills/*/SKILL.md`).

2. **Ask the structuring questions** with `AskUserQuestion`:
   - Tab "Category" — Setup & Planning / Architecture / Screen & UI / Backend & Data / Platform Features / Testing / DevOps & Release / Documentation / Integrations
   - Tab "Type" — Generates code / Configures something / Audits / Orchestrates other skills / Pure interactive
   - Tab "Tools needed" — multi: Read, Edit, Write, Bash, Glob, Grep, WebFetch, WebSearch, AskUserQuestion, Task
   - Tab "User-invocable?" — Yes (slash command) / No (auto-invoked only)
   - Tab "Side effects?" — Read-only / Writes files / Runs commands (consider `disable-model-invocation: true` for build/publish)

3. **Read the canonical template** at `.claude/docs/handoff-template.md` and a representative existing skill (`Read .claude/skills/setup-firebase/SKILL.md` is a good reference for full-featured ones, `.claude/skills/help/SKILL.md` for read-only).

4. **Generate the skill file** at `.claude/skills/<name>/SKILL.md`. Required structure:
   - YAML frontmatter with: `name`, `description: |` (multiline), `when_to_use: |` (pushy trigger phrases), `argument-hint`, `user-invocable: true`, `allowed-tools`, plus optional `disable-model-invocation`, `paths`, `model`, `effort`
   - Numbered steps describing the workflow
   - **Final step — handoff** following `.claude/docs/handoff-template.md` (breadcrumb to `.claude/session/active.md`, numbered "what's next?" menu with one `(recommended)`)

5. **Suggest 3-5 follow-up skills** for the handoff menu — based on the new skill's category, propose what the user logically does next.

6. **Show the user the finished file** and ask via `AskUserQuestion` if they want to:
   - Test it now (run the skill)
   - Add it to README.md skills table
   - Add it to CLAUDE.md command list
   - All of the above

7. **Final step — handoff.** Follow `.claude/docs/handoff-template.md`.

   - Append breadcrumb to `.claude/session/active.md`:
     ```
     ## /skill-creator — [YYYY-MM-DD HH:MM]
     - Action: created /[skill-name] in [category]
     - Recommended next: test the new skill or document it
     ```
   - Render the handoff block with:
     - `/[new-skill-name]` — try the skill you just made *(recommended)*
     - `/skill-creator` — make another one
     - `/create-readme` — document the new skill in README
     - `/help skills` — review your skill catalog
     - `@tech-lead` — review the workflow design
