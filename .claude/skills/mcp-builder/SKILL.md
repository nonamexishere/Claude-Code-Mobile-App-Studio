---
name: mcp-builder
description: |
  Build a custom MCP (Model Context Protocol) server for the user's mobile
  backend or internal service, so Claude Code can query it as a first-class
  tool. Mirrors Anthropic's official mcp-builder skill.
when_to_use: |
  USE WHEN the user wants to expose their mobile backend / API to Claude
  Code as a tool, asks "how do I build an MCP / how do I make a custom
  Claude tool", has an internal sync server, or wants to wrap a service
  that doesn't have an official MCP yet.
argument-hint: "[service-name]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash, AskUserQuestion, WebFetch
---

When this skill is invoked:

1. **Detect what we're wrapping**. Use `AskUserQuestion`:
   - Tab "Source" — Existing API (REST/GraphQL) / Mobile sync server / SaaS without official MCP
   - Tab "Auth" — None / API key (env var) / OAuth 2.1 / Custom header
   - Tab "Transport" — Local stdio (subprocess) / Remote HTTP (hosted) / Both
   - Tab "Language" — TypeScript (recommended) / Python

2. **Read the existing MCP catalog** at `.claude/docs/mcp-servers.md` to understand what good vendor MCPs expose (tools, resources, prompts).

3. **Scaffold the project**:

   **TypeScript stdio**: `npm init -y && npm install @modelcontextprotocol/sdk zod`
   - Entry: `src/index.ts` with `StdioServerTransport`
   - `package.json` `bin` field pointing at the built file
   - `tsconfig.json` with `module: NodeNext`

   **TypeScript HTTP**: same SDK + `express` or `hono`, use `StreamableHTTPServerTransport` with optional OAuth via `@modelcontextprotocol/sdk/server/auth`

   **Python**: `pip install mcp[cli]` and use `FastMCP`

4. **Define the tools**. For each operation the user wants to expose:
   - Tool name (snake_case, descriptive)
   - Zod/Pydantic input schema
   - Async handler that calls the underlying API
   - Returns `{ content: [{ type: "text", text: ... }] }`

5. **Add `resources` and `prompts`** if relevant — resources for browsable docs/data, prompts for canned operations.

6. **Test locally**:
   - stdio: `npx @modelcontextprotocol/inspector node dist/index.js`
   - HTTP: `npx @modelcontextprotocol/inspector http://localhost:3000`

7. **Wire into Claude Code**:
   ```bash
   claude mcp add <name> -- node /abs/path/to/dist/index.js
   # or for HTTP:
   claude mcp add --transport http <name> http://localhost:3000
   ```

8. **Document the install** — append a row to `.claude/docs/mcp-servers.md` so the team knows about the new server.

9. **Final step — handoff.** Follow `.claude/docs/handoff-template.md`.

   - Append breadcrumb to `.claude/session/active.md`:
     ```
     ## /mcp-builder — [YYYY-MM-DD HH:MM]
     - Action: built [service] MCP — [transport], [tool count] tools
     - Recommended next: test in MCP Inspector, then publish or wire locally
     ```
   - Render the handoff block with:
     - `/setup-mcp` — install your new MCP into Claude Code *(recommended)*
     - `/write-tests` — cover the tool handlers with unit tests
     - `/code-review` — review the MCP scaffold quality
     - `/setup-cicd` — automate publish to npm/PyPI
     - `@tech-lead` — review API surface and error handling
