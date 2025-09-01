#!/bin/bash

# ===========================================
# TradeLogic Daily Build Log Script
# ===========================================
# Usage:
#   ./log-today.sh             → create/update today’s log
#   ./log-today.sh YYYY-MM-DD  → backfill log for a given date
#
# Behavior:
# - Creates a markdown file in build-logs/
# - Appends session markers with timestamps
# - Auto-commits & pushes changes to Git
# ===========================================

# Ensure log folder exists
mkdir -p build-logs

# Today's date
TODAY=$(date +%Y-%m-%d)

# Current timestamp
NOW=$(date +"%Y-%m-%d %H:%M %Z")

# Check for argument (backfill mode)
if [ $# -eq 0 ]; then
  TARGET=$TODAY
  MODE="TODAY"
else
  TARGET=$1
  MODE="BACKFILL"
fi

# Target file path
FILE="build-logs/tradelogic-build-log-$TARGET.md"

# Feedback header
echo "==========================================="
if [ "$MODE" = "TODAY" ]; then
  echo "📝 Running in [TODAY] mode for $TODAY"
else
  echo "📝 Running in [BACKFILL] mode for $TARGET"
fi
echo "Log file: $FILE"
echo "==========================================="

# Create file if it doesn’t exist
if [ ! -f "$FILE" ]; then
  cat > "$FILE" <<EOT
# TradeLogic Build Log — $TARGET

## Highlights
-

## Decisions / Risks
-

## Next
-
EOT
fi

# Append session marker with timestamp
if [ "$MODE" = "BACKFILL" ]; then
  echo -e "\n---\n_Session logged at: $NOW (backfilled)_\n\n### Highlights\n-\n\n### Decisions / Risks\n-\n\n### Next\n-" >> "$FILE"
else
  echo -e "\n---\n_Session logged at: $NOW_\n\n### Highlights\n-\n\n### Decisions / Risks\n-\n\n### Next\n-" >> "$FILE"
fi

# Git workflow
git add "$FILE"
git commit -m "docs: update build log for $TARGET (session at $NOW $MODE)"
git push

# Confirmation
echo "✅ TradeLogic build log for $TARGET committed & pushed successfully!"


