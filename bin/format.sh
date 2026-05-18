#!/usr/bin/env bash
# Format files that Prettier checks on push (run before git commit).
set -euo pipefail
cd "$(dirname "$0")/.."
npm install --save-dev prettier @shopify/prettier-plugin-liquid >/dev/null 2>&1 || true
npx prettier _pages _projects _posts _news _books _teachings --write
echo "Done. Run: git diff && git commit && git push"
