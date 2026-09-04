#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
FRONTEND="$ROOT/frontend"

echo "Validating Kisan Market static frontend..."

required_files=(
  "$FRONTEND/index.html"
  "$FRONTEND/style.css"
  "$FRONTEND/front.css"
  "$FRONTEND/script.js"
)

for file in "${required_files[@]}"; do
  if [[ ! -f "$file" ]]; then
    echo "ERROR: Missing required file: ${file#$ROOT/}"
    exit 1
  fi
  echo "OK: ${file#$ROOT/}"
done

if ! grep -qi '<!DOCTYPE html>' "$FRONTEND/index.html"; then
  echo "ERROR: index.html does not contain a DOCTYPE declaration."
  exit 1
fi

if ! grep -q 'script.js' "$FRONTEND/index.html"; then
  echo "ERROR: index.html does not reference script.js."
  exit 1
fi

if ! grep -q 'style.css' "$FRONTEND/index.html"; then
  echo "ERROR: index.html does not reference style.css."
  exit 1
fi

echo "Validation passed."
