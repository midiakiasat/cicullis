#!/bin/sh
set -eu

ROOT="$(cd "$(dirname "$0")" && pwd)"

ENGINE="$ROOT/engine"
PROFILE="$ROOT/profiles/default.profile"
STATE="$ROOT/internal/state"
LEDGER="$ROOT/internal/ledger"

mkdir -p "$STATE" "$LEDGER"

fail() {
  printf '%s\n' "CI-GATE FAILED"
  printf 'STAGE: %s\n' "$1"
  printf 'RULE:  %s\n' "$2"
  printf 'DECISION: BLOCKED\n'
  exit 1
}

PROFILE_INPUT="$(cat "$PROFILE")"

# --- Time boundary ----------------------------------------------------------

printf '%s' "$PROFILE_INPUT" | \
  "$ENGINE/kairoclasp.sh" "$LEDGER" \
  || fail "TIME" "TIME.BOUNDARY.VIOLATION"

# --- Custody ---------------------------------------------------------------

printf '%s' "$PROFILE_INPUT" | \
  "$ENGINE/archicustos.sh" "$LEDGER" \
  || fail "CUSTODY" "CUSTODY.VIOLATION"

# --- Provenance ------------------------------------------------------------

printf '%s' "$PROFILE_INPUT" | \
  "$ENGINE/originseal.sh" "$LEDGER" \
  || fail "PROVENANCE" "PROVENANCE.VIOLATION"

# --- Boundary enforcement --------------------------------------------------

printf '%s' "$PROFILE_INPUT" | \
  "$ENGINE/limenward.sh" "$LEDGER" \
  || fail "BOUNDARY" "BOUNDARY.VIOLATION"

# --- Deterministic verification -------------------------------------------

printf '%s' "$PROFILE_INPUT" | \
  "$ENGINE/validexor.sh" \
  || fail "VERIFICATION" "VERIFICATION.VIOLATION"

# --- Attestation -----------------------------------------------------------

printf '%s' "$PROFILE_INPUT" | \
  "$ENGINE/attestorium.sh" "$LEDGER" \
  || fail "ATTESTATION" "ATTESTATION.FAILURE"

# --- Judgment --------------------------------------------------------------

printf '%s' "$PROFILE_INPUT" | \
  "$ENGINE/irrevocull.sh" \
  || fail "JUDGMENT" "JUDGMENT.FAILED"

# --- Optional execution (explicit, restricted) -----------------------------

if [ "${CI_CICULLIS_EXECUTE:-0}" = "1" ]; then
  "$ENGINE/guillotine.sh" \
    || fail "EXECUTION" "EXECUTION.REFUSED"
fi

printf '%s\n' "CI-GATE PASSED"
exit 0
