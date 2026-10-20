
#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

echo "Running frontend tests..."

test -f "$ROOT/index.html"
test -f "$ROOT/style.css"
test -f "$ROOT/script.js"

grep -qi '<!DOCTYPE html>' "$ROOT/index.html"
grep -q 'style.css' "$ROOT/index.html"
grep -q 'script.js' "$ROOT/index.html"

echo "All frontend tests passed."
