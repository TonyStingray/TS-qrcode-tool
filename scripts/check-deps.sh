#!/usr/bin/env bash
# ═══════════════════════════════════════════
#  Dependency Version Check Script
#  Checks if local qr-code-styling is outdated
#  Run: bash scripts/check-deps.sh
# ═══════════════════════════════════════════
set -euo pipefail

echo "╔══════════════════════════════════════╗"
echo "║  Dependency Version Check            ║"
echo "╚══════════════════════════════════════╝"
echo ""

# Current pinned version
CURRENT_QR_VERSION="1.6.0-rc.1"

# Check latest version from npm registry
echo "[1/3] Checking qr-code-styling..."
LATEST_QR=$(curl -s "https://registry.npmjs.org/qr-code-styling/latest" | grep -o '"version":"[^"]*"' | head -1 | cut -d'"' -f4)

if [ -z "$LATEST_QR" ]; then
  echo "  ⚠  Could not fetch latest version (network issue?)"
else
  if [ "$CURRENT_QR_VERSION" = "$LATEST_QR" ]; then
    echo "  ✓  qr-code-styling is up to date ($CURRENT_QR_VERSION)"
  else
    echo "  ✗  qr-code-styling outdated: $CURRENT_QR_VERSION → $LATEST_QR"
    echo "     Update: curl -sL https://unpkg.com/qr-code-styling@$LATEST_QR/lib/qr-code-styling.js -o assets/js/qr-code-styling.js"
  fi
fi

# Check Tailwind CSS (build dependency)
echo ""
echo "[2/3] Checking tailwindcss..."
LATEST_TW=$(curl -s "https://registry.npmjs.org/tailwindcss/latest" | grep -o '"version":"[^"]*"' | head -1 | cut -d'"' -f4)
echo "  Latest tailwindcss: ${LATEST_TW:-unknown}"

# Check for known security advisories
echo ""
echo "[3/3] Quick security check..."
echo "  Run 'npm audit' in a project context for full vulnerability scan."
echo ""
echo "Done. Review output above for any needed updates."
echo "After updating, remember to:"
echo "  1. Test all QR code types"
echo "  2. Run Lighthouse audit"
echo "  3. Update CACHE_NAME in sw.js"
echo "  4. Update version in index.html + CHANGELOG.html"
