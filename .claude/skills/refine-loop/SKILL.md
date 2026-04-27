---
name: refine-loop
description: |
  Iterative critic-loop for any code artifact. Picks a "producer" approach,
  runs it, then spawns a critic agent to evaluate. If the critic flags
  issues, re-runs the producer with feedback. Continues until the critic
  approves or max iterations is hit. Implements Anthropic's
  evaluator-optimizer pattern from the Building Effective Agents cookbook.
when_to_use: |
  USE WHEN the user wants to iterate on an output until quality is right,
  asks "polish this / make it better / iterate / refine until good", or
  when initial output looks ok but isn't great. Especially valuable for
  screen layouts, copy, animations, complex logic, prompts.
argument-hint: "[target file or 'last-output']"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash, AskUserQuestion, Task
---

When this skill is invoked:

1. **Identify the target** — file path or "the last thing you generated". If ambiguous, ask via `AskUserQuestion`.

2. **Pick the critic agent**. Use `AskUserQuestion`:
   - For code quality: `@tech-lead`
   - For UX: `@ux-lead`
   - For accessibility: `@accessibility-specialist`
   - For security: `@security-specialist`
   - For perf: `@performance-engineer`
   - Custom: free-text agent name

3. **Set the budget** with `AskUserQuestion`:
   - Tab "Max iterations" — 1 / 2 / 3 / 5 (default 2)
   - Tab "Pass criteria" — Critic approves / Critic verdict is "good enough" / Specific bar (free text)

4. **Loop**:
   - **Iteration 1**: read the artifact. If the user asked us to start fresh, generate v1.
   - **Spawn the critic** via `Task` with this prompt:
     > Review the file at `<path>`. List specific, actionable issues — be concrete (file:line + suggested fix). End your response with one of: `VERDICT: APPROVE`, `VERDICT: REVISE`, `VERDICT: BLOCK`.
   - **If APPROVE**: stop, report success.
   - **If REVISE**: apply the critic's suggestions to the artifact (Edit), then loop.
   - **If BLOCK**: stop, surface the critic's concerns to the user — don't keep iterating on a fundamentally broken approach.
   - Stop also when iterations hit the budget.

5. **Final report** to the user:
   - Iterations used / budget
   - Final verdict
   - Diff summary (or `git diff` of the file)
   - Critic's last response

6. **Final step — handoff.** Follow `.claude/docs/handoff-template.md`.

   - Append breadcrumb to `.claude/session/active.md`:
     ```
     ## /refine-loop — [YYYY-MM-DD HH:MM]
     - Action: refined [target] via [critic] — [N] iterations, verdict [APPROVE|REVISE|BLOCK]
     - Recommended next: depends on verdict
     ```
   - Render the handoff block. Pick the recommended based on the final verdict:
     - APPROVE: `/code-review` for a final independent check, or `/write-tests` to lock in the result
     - REVISE (budget exhausted): `/code-review` to triangulate why critic isn't satisfied
     - BLOCK: `@<critic>` directly to discuss the deeper issue
   - Always include: `/code-review`, the critic agent reference, `@tech-lead`
