#!/usr/bin/env bash
# Renames the app display name.
# Usage: ./scripts/rename-app.sh "Best App Ever"
set -euo pipefail

OLD_APP_NAME="WebView Wrapper"
OLD_APP_NOTIFICATIONS_NAME="WebView App"
NEW_APP_NAME="${1:-}"

if [[ -z "$NEW_APP_NAME" ]]; then
  echo "Usage: $0 \"New App Name>\""
  echo "Example: $0 \"Greatest WebApp Ever\""
  exit 1
fi


ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

echo "Renaming app: $OLD_APP_NAME -> $NEW_APP_NAME"

# Update name in both the strings and app config files.
sed -i "s/${OLD_APP_NAME}/${NEW_APP_NAME}/" app/src/main/res/values/strings.xml
sed -i "s/${OLD_APP_NOTIFICATIONS_NAME}/${NEW_APP_NAME}/" /home/greg/temp/temp/android-webview-wrapper/app/src/main/java/com/wundermentpwa/lineageos_reddit/config/AppConfig.java

echo ""
echo "Done. Review the changes with 'git diff', then run:"
echo "  ./gradlew assembleDebug"
echo "to verify the project still builds."
