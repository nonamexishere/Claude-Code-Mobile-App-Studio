# Handoff Template

Every user-invocable skill MUST end its run with a handoff block in this exact format. This gives the user a consistent, predictable "what's next?" moment at every pivot — they feel guided but in control, because they type the next command themselves.

## The rules

1. **Never auto-invoke the next skill.** Always hand off with a command the user types.
2. **Always show the block.** Even if the skill was a no-op, end with the handoff.
3. **Mark exactly one option `(recommended)`.** This is your suggestion, not the user's obligation.
4. **Offer 3–6 actionable options**, plus the two fixed escape hatches (Stop, Chat).
5. **One-line "why" per option.** Tell the user what it does and why it fits. No fluff.
6. **Reference concrete commands or agents.** `/skill-name`, `@agent-name`. Never vague verbs like "review things".

## The block format

```
### Status
- Current MVP: {{mvp}}
- Progress: {{progress}}

### What's next?

1. **/{{recommended-skill}}** — {{one-line why}} *(recommended)*
2. **/{{alternative-1}}** — {{one-line why}}
3. **/{{alternative-2}}** — {{one-line why}}
4. **@{{agent-name}}** — {{one-line why}}
5. **Stop here** — end session
6. **Chat about this** — ask a question or discuss tradeoffs
```

## How to fill the slots

### `{{mvp}}` — Current MVP

Read `.claude/session/mvp.md` if it exists. Show the first non-empty line as a one-line summary.
- If the file does not exist or is empty, write: `not set — run /start to define one`
- If the file is stale (user has not opened it in weeks), still show it. Don't silently drop it.

### `{{progress}}` — Progress snapshot

Read `.claude/session/active.md` if it exists. Scan for a line starting with `Progress:` in the most recent entry.
- If no progress line exists, write: `no milestones tracked yet`
- If the skill that just ran produced measurable progress (e.g. "3/8 screens built", "2/5 navigators configured"), append a new progress line to `active.md` before rendering this block.

### The numbered options

Pick the 3–6 options by asking: *if the user wanted to keep building, what would be the single most useful next thing?* That is option 1. Then list reasonable alternatives in decreasing relevance.

**Good examples:**
- `/create-screen ProfileScreen` — scaffold the screen your new tab bar is routing to *(recommended)*
- `/code-review` — review what we just wrote before moving on
- `/write-tests src/screens/Home.tsx` — cover the home screen you just added
- `@mobile-architect` — ask about navigation tradeoffs for this flow

**Bad examples** (do not do these):
- `/help` — too vague, tells the user nothing about what to do
- `Continue` — not a command; the user doesn't know what to type
- Long explanations in the "why" — keep it to one line

### Fixed options (always last two)

- **Stop here** — end session
- **Chat about this** — ask a question or discuss tradeoffs

Never omit these. They are the user's escape hatches.

## Step 0 — Review gate (before breadcrumb + handoff)

Before writing the breadcrumb or rendering the handoff block, apply the review-gate decision from `.claude/docs/review-gates.md`:

1. Read `.claude/session/review-mode.txt` (default to `solo` if missing).
2. Look up this skill in the trigger matrix in `review-gates.md`.
3. If the mode and skill combination fires a gate, spawn the designated director via the `Task` tool using the prompt template in that doc.
4. Insert the director's report under a `### Review — @<director> (<mode>)` heading *above* the handoff block.
5. Append a `- Gate: @<director> reviewed — <verdict>` line to the breadcrumb you're about to write.

If mode is `solo`, or the skill is read-only (`/help`, `/start`), or the spawn fails — skip the gate silently and proceed. Never block the user on a broken gate.

## When to write to `active.md`

Before rendering the handoff block, append a breadcrumb to `.claude/session/active.md` (create the directory and file if missing):

```
## /{{skill-name}} — {{YYYY-MM-DD HH:MM}}
- Action: {{one-line what you did}}
- Progress: {{optional — e.g. "3/8 screens built"}}
- Recommended next: /{{skill-name}}

```

Append-only. Never truncate or rewrite prior entries.

## Minimal example (skill with no MVP/progress data yet)

```
### Status
- Current MVP: not set — run /start to define one
- Progress: no milestones tracked yet

### What's next?

1. **/brainstorm** — shape the app idea before picking platform *(recommended)*
2. **/wireframe** — sketch key screens if you already know the product
3. **@mobile-architect** — ask for platform and architecture guidance
4. **Stop here** — end session
5. **Chat about this** — ask a question or discuss tradeoffs
```

## Rationale

This template exists because users told us the studio felt too autonomous — it would start coding before asking what to build. The handoff block is the control point: every skill stops here, surfaces the state, and lets the user steer. No auto-invocation, no surprises.
