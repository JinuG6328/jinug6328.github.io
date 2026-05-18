#!/usr/bin/env bash
# Sync jinug6328-dev2 (staging) → jinug6328.github.io (production).
#
# Staging:  https://jinug6328.github.io/jinug6328-dev2/
# Production: https://jinug6328.github.io/
#
# One-time setup:
#   git clone git@github.com:JinuG6328/jinug6328.github.io.git ../jinug6328.github.io
#
# Usage (from repo root or anywhere):
#   ./bin/sync-to-github-io.sh
#   PROD_DIR=/path/to/jinug6328.github.io ./bin/sync-to-github-io.sh

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SRC_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"
PROD_DIR="${PROD_DIR:-$(cd "${SRC_DIR}/.." && pwd)/jinug6328.github.io}"

if [[ ! -d "${PROD_DIR}/.git" ]]; then
  echo "Error: production repo not found at: ${PROD_DIR}"
  echo "Clone it first:"
  echo "  git clone git@github.com:JinuG6328/jinug6328.github.io.git ${PROD_DIR}"
  exit 1
fi

echo "Source (staging):      ${SRC_DIR}"
echo "Destination (production): ${PROD_DIR}"
echo

rsync -av --delete \
  --exclude '.git' \
  --exclude '_site' \
  --exclude '.jekyll-cache' \
  --exclude 'node_modules' \
  --exclude 'vendor' \
  --exclude 'lighthouse_results' \
  --exclude '.DS_Store' \
  "${SRC_DIR}/" "${PROD_DIR}/"

# Production site is served at the domain root, not /jinug6328-dev2/.
if [[ "$(uname)" == "Darwin" ]]; then
  sed -i '' 's|^baseurl: /jinug6328-dev2|baseurl:|' "${PROD_DIR}/_config.yml"
  sed -i '' 's|^baseurl: "/jinug6328-dev2"|baseurl:|' "${PROD_DIR}/_config.yml"
else
  sed -i 's|^baseurl: /jinug6328-dev2|baseurl:|' "${PROD_DIR}/_config.yml"
  sed -i 's|^baseurl: "/jinug6328-dev2"|baseurl:|' "${PROD_DIR}/_config.yml"
fi

chmod +x "${PROD_DIR}/bin/sync-to-github-io.sh" 2>/dev/null || true

echo
echo "Sync complete. Production _config.yml baseurl cleared."
echo
echo "Next steps:"
echo "  cd ${PROD_DIR}"
echo "  git status"
echo "  git add -A"
echo "  git commit -m \"Publish site from jinug6328-dev2\""
echo "  git push origin main"
echo
echo "After GitHub Actions finishes, check: https://jinug6328.github.io/"
