#!/usr/bin/env bash
# CICULLIS GATE
# Deterministic CI boundary gate

set -eu

PROFILE="${1:-profiles/default.profile}"

[ -f "$PROFILE" ] || {
  echo "PROFILE NOT FOUND"
  exit 1
}

# --- Extract TIME_BOUNDARY.ENFORCE -----------------------------------------

TIME_ENFORCE="$(
  grep -E '^TIME_BOUNDARY\.ENFORCE' "$PROFILE" | awk '{print $3}'
)"

LOCK_AT="$(
  grep -E '^LOCK_AT' "$PROFILE" | awk '{print $3}'
)"

# --- Skip TIME gate entirely if disabled ----------------------------------

if [ "$TIME_ENFORCE" = "NO" ]; then
  echo "TIME BOUNDARY DISABLED"
  exit 0
fi

# --- Enforce TIME ----------------------------------------------------------

NOW_EPOCH="$(date -u +%s)"
LOCK_EPOCH="$(
  date -u -d "$LOCK_AT" +%s 2>/dev/null ||
  date -u -j -f '%Y-%m-%dT%H:%M:%SZ' "$LOCK_AT" +%s
)"

if [ "$NOW_EPOCH" -lt "$LOCK_EPOCH" ]; then
  echo "DENIED"
  echo "CI-GATE FAILED"
  echo "STAGE: TIME"
  echo "RULE: TIME.BOUNDARY.VIOLATION"
  echo "DECISION: BLOCKED"
  exit 1
fi

echo "ALLOWED"
exit 0
