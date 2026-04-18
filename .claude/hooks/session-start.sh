#!/usr/bin/env bash
# SessionStart hook — surfaces current session state to Claude at session load.
# Output is injected as context so Claude knows MVP, review mode, and recent progress
# without the user having to re-explain. Stays silent if nothing has been captured yet.

set -u

SESSION_DIR=".claude/session"
MVP_FILE="$SESSION_DIR/mvp.md"
MODE_FILE="$SESSION_DIR/review-mode.txt"
ACTIVE_FILE="$SESSION_DIR/active.md"

# If the session dir does not exist, nudge the user toward /start and exit.
if [ ! -d "$SESSION_DIR" ]; then
  echo "No session state yet. Run /start to set MVP, review mode, and pick a path."
  exit 0
fi

echo "=== Claude Mobile Studio — session state ==="

if [ -s "$MVP_FILE" ]; then
  mvp_line=$(head -n 1 "$MVP_FILE")
  echo "MVP: $mvp_line"
else
  echo "MVP: not set — run /start or /brainstorm"
fi

if [ -s "$MODE_FILE" ]; then
  echo "Review mode: $(head -n 1 "$MODE_FILE")"
else
  echo "Review mode: not set — /start will ask"
fi

echo ""

if [ -s "$ACTIVE_FILE" ]; then
  echo "--- Last breadcrumbs (tail of active.md) ---"
  tail -n 40 "$ACTIVE_FILE"
else
  echo "No breadcrumbs yet — active.md is empty or missing."
fi

echo "=== end session state ==="
