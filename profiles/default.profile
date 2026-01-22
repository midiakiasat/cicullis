# CICULLIS DEFAULT PROFILE
# Forward-only. Irreversible. Non-negotiable.
# This profile defines what MUST hold for CI to pass.

PROFILE_VERSION = 1
PROFILE_MODE    = STRICT
PROFILE_LOCK    = FINAL

# --- TIME -------------------------------------------------
# Commits after the declared boundary are invalid.

LOCK_AT                    = 2026-01-22T10:00:00Z
TIME_BOUNDARY.ENFORCE      = YES
TIME_BOUNDARY.MUTABLE      = NO

# --- CUSTODY ----------------------------------------------
# Every irreversible change must have a single accountable owner.

CUSTODY.REQUIRED           = YES
CUSTODY.MULTIPLE_ALLOWED   = NO
CUSTODY.ANONYMOUS          = FORBIDDEN

# --- PROVENANCE -------------------------------------------
# Artifacts must be sealed at first observation.

PROVENANCE.SEAL            = REQUIRED
PROVENANCE.RESEAL          = FORBIDDEN
PROVENANCE.SOURCE_CHANGE   = FORBIDDEN

# --- BOUNDARY ---------------------------------------------
# Crossing a boundary closes all prior states.

BOUNDARY.MODE              = CLOSED
BOUNDARY.REOPEN            = FORBIDDEN
BOUNDARY.SILENT_BYPASS     = FORBIDDEN

# --- VERIFICATION -----------------------------------------
# Claims must match observable state deterministically.

VERIFICATION.MODE          = STRICT
VERIFICATION.NONDET        = FORBIDDEN
VERIFICATION.PARTIAL       = FORBIDDEN

# --- ATTESTATION ------------------------------------------
# What happened must be recorded immutably.

ATTESTATION.REQUIRED       = YES
ATTESTATION.OVERWRITE      = FORBIDDEN
ATTESTATION.DELETE         = FORBIDDEN

# --- JUDGMENT ----------------------------------------------
# Final decision, no appeal in CI context.

JUDGMENT.MODE              = FINAL
JUDGMENT.RETRY             = FORBIDDEN
JUDGMENT.OVERRIDE          = FORBIDDEN

# --- EXECUTION ---------------------------------------------
# Hard execution disabled by default.

EXECUTION.ENABLED          = NO
EXECUTION.CONDITIONAL      = MANUAL_ONLY
