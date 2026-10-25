#!/usr/bin/env bash
# Renames the app display name.
# Usage: ./scripts/rename-app.sh "Best App Ever"
set -euo pipefail

SITE_URL="${1:-}"
if [[ -z "$SITE_URL" ]]; then
  echo "Usage: $0 site_url"
  echo "Example: $0 www.mysite.com"

  echo "Note: wget, python, and the urlimage library are required."
  exit 1
fi

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

echo "Getting icon from ${SITE_URL}..."

# Update name in both the strings and app config files.
ICON_URL=`python scripts/urlimage_loader.py ${SITE_URL}`
ICON_NAME=`basename $ICON_URL`

cd scripts
wget ${ICON_URL}
mv $ICON_NAME "${SITE_URL}-${ICON_NAME}"

echo "Icon saved as \"${SITE_URL}-${ICON_NAME}\""
