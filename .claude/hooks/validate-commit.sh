#!/bin/bash
# Validate commit messages follow conventional commit format
# Used as a pre-commit hook via Claude Code settings

COMMIT_MSG="$1"

# Conventional commit pattern
PATTERN="^(feat|fix|refactor|docs|test|chore|style|perf|ci|build|revert)(\(.+\))?: .{1,72}"

if [[ ! "$COMMIT_MSG" =~ $PATTERN ]]; then
  echo "ERROR: Commit message does not follow conventional commit format."
  echo ""
  echo "Expected format: type(scope): description"
  echo ""
  echo "Types: feat, fix, refactor, docs, test, chore, style, perf, ci, build, revert"
  echo ""
  echo "Examples:"
  echo "  feat(auth): add biometric login support"
  echo "  fix(navigation): resolve deep link crash on cold start"
  echo "  refactor(api): extract HTTP client to separate service"
  echo "  perf(list): switch from FlatList to FlashList"
  exit 1
fi

echo "Commit message format OK"
