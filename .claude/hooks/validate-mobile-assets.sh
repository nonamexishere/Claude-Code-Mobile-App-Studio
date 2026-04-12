#!/bin/bash
# Validate mobile project files for common issues
# Checks for hardcoded secrets, debug flags, and common mobile pitfalls

EXIT_CODE=0

# Check for hardcoded API keys and secrets
echo "Checking for hardcoded secrets..."
SECRETS_PATTERN="(api[_-]?key|api[_-]?secret|password|secret[_-]?key|private[_-]?key|access[_-]?token)\s*[:=]\s*['\"][^'\"]{8,}['\"]"
MATCHES=$(grep -rniE "$SECRETS_PATTERN" --include="*.ts" --include="*.tsx" --include="*.js" --include="*.jsx" --include="*.dart" --include="*.swift" --include="*.kt" --include="*.java" src/ lib/ app/ 2>/dev/null | grep -v "node_modules" | grep -v ".example" | grep -v "test" | grep -v "mock")
if [ -n "$MATCHES" ]; then
  echo "WARNING: Possible hardcoded secrets found:"
  echo "$MATCHES"
  EXIT_CODE=1
fi

# Check for console.log / print statements in source
echo "Checking for debug logging..."
DEBUG_MATCHES=$(grep -rnE "(console\.(log|warn|error|debug)|print\(|debugPrint\(|NSLog\(|Log\.(d|e|w|i|v)\()" --include="*.ts" --include="*.tsx" --include="*.js" --include="*.jsx" --include="*.dart" --include="*.swift" --include="*.kt" src/ lib/ app/ 2>/dev/null | grep -v "node_modules" | grep -v "test" | grep -v "Logger" | grep -v "logger")
if [ -n "$DEBUG_MATCHES" ]; then
  echo "WARNING: Debug logging found (remove before release):"
  echo "$DEBUG_MATCHES" | head -10
  if [ $(echo "$DEBUG_MATCHES" | wc -l) -gt 10 ]; then
    echo "  ... and more"
  fi
fi

# Check for disabled security settings
echo "Checking for security issues..."
if grep -rq "NSAllowsArbitraryLoads.*true" ios/ 2>/dev/null; then
  echo "WARNING: App Transport Security is disabled (NSAllowsArbitraryLoads = true)"
  EXIT_CODE=1
fi

if grep -rq "android:usesCleartextTraffic=\"true\"" android/ 2>/dev/null; then
  echo "WARNING: Cleartext traffic is enabled in AndroidManifest"
  EXIT_CODE=1
fi

# Check for large assets
echo "Checking asset sizes..."
LARGE_FILES=$(find assets/ src/ lib/ app/ -type f \( -name "*.png" -o -name "*.jpg" -o -name "*.jpeg" -o -name "*.gif" -o -name "*.mp4" \) -size +500k 2>/dev/null)
if [ -n "$LARGE_FILES" ]; then
  echo "WARNING: Large assets found (consider optimizing):"
  echo "$LARGE_FILES"
fi

if [ $EXIT_CODE -eq 0 ]; then
  echo "All mobile asset checks passed."
fi

exit $EXIT_CODE
