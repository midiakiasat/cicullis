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
  printf '%s\n' "$1"
  exit 1
}

PROFILE_INPUT="$(cat "$PROFILE")"

# --- Time boundary ----------------------------------------------------------

printf '%s' "$PROFILE_INPUT" | \
  "$ENGINE/kairoclasp.sh" "$LEDGER" || fail "TIME_BOUNDARY_VIOLATION"

# --- Custody ---------------------------------------------------------------

printf '%s' "$PROFILE_INPUT" | \
  "$ENGINE/archicustos.sh" "$LEDGER" || fail "CUSTODY_VIOLATION"

# --- Provenance ------------------------------------------------------------

printf '%s' "$PROFILE_INPUT" | \
  "$ENGINE/originseal.sh" "$LEDGER" || fail "PROVENANCE_VIOLATION"

# --- Boundary enforcement --------------------------------------------------

printf '%s' "$PROFILE_INPUT" | \
  "$ENGINE/limenward.sh" "$LEDGER" || fail "BOUNDARY_VIOLATION"

# --- Deterministic verification -------------------------------------------

printf '%s' "$PROFILE_INPUT" | \
  "$ENGINE/validexor.sh" || fail "VERIFICATION_VIOLATION"

# --- Attestation -----------------------------------------------------------

printf '%s' "$PROFILE_INPUT" | \
  "$ENGINE/attestorium.sh" "$LEDGER" || fail "ATTESTATION_FAILURE"

# --- Judgment --------------------------------------------------------------

printf '%s' "$PROFILE_INPUT" | \
  "$ENGINE/irrevocull.sh" || fail "JUDGMENT_FAILED"

# --- Optional execution (explicit, restricted) -----------------------------

if [ "${CI_CICULLIS_EXECUTE:-0}" = "1" ]; then
  "$ENGINE/guillotine.sh" || fail "EXECUTION_REFUSED"
fi

exit 0
