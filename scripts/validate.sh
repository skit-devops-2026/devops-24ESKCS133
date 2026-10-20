
#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

echo "Validating Kisan Market frontend..."

required_files=(
  "$ROOT/index.html"
  "$ROOT/style.css"
  "$ROOT/script.js"
)

for file in "${required_files[@]}"; do
  if [[ ! -f "$file" ]]; then
    echo "ERROR: Missing required file: ${file#$ROOT/}"
    exit 1
  fi
  echo "OK: ${file#$ROOT/}"
done

if ! grep -qi '<!DOCTYPE html>' "$ROOT/index.html"; then
  echo "ERROR: index.html is missing DOCTYPE."
  exit 1
fi

if ! grep -q 'style.css' "$ROOT/index.html"; then
  echo "ERROR: index.html does not reference style.css."
  exit 1
fi

if ! grep -q 'script.js' "$ROOT/index.html"; then
  echo "ERROR: index.html does not reference script.js."
  exit 1
fi

echo "Validation passed."
