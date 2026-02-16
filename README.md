```
SYS-001
CICULLIS
Irreversible CI Enforcement System

STATUS: REGISTERED
REGISTRY: https://speedkit.eu
SNAPSHOT: https://speedkit.eu/REGISTRY_SNAPSHOT.json
```

Registered system. Identity governed by SPEEDKIT registry.

STATUS: FINAL

---

[![GitHub Marketplace](https://img.shields.io/badge/GitHub%20Marketplace-CICULLIS-blue?logo=github)](https://github.com/marketplace/actions/cicullis)
![CI](https://img.shields.io/badge/CI-deterministic-critical)
![Security](https://img.shields.io/badge/security-enforcement-critical)
![Governance](https://img.shields.io/badge/governance-forward--only-important)
![Supply Chain](https://img.shields.io/badge/supply--chain-locked-critical)
[![OpenSSF Scorecard](https://api.securityscorecards.dev/projects/github.com/midiakiasat/cicullis/badge)](https://securityscorecards.dev/viewer/?uri=github.com/midiakiasat/cicullis)
![License](https://img.shields.io/badge/license-Apache--2.0-green)

---

# CICULLIS

**CICULLIS** is a GitHub Action that enforces irreversible contracts at CI time.

It is a binary gate.
It does not warn.
It does not suggest.
It blocks.

If CICULLIS passes, the decision is closed.
If it fails, execution stops.

---

## Purpose

CICULLIS exists for environments where reversibility is unacceptable:

* Releases cannot be unshipped
* Policy cannot be partially enforced
* Custody cannot be reconstructed after compromise
* Audit trails must remain cryptographically defensible

CICULLIS encodes finality directly into CI.

---

## Properties

* Deterministic execution
* Binary pass/fail output
* Forward-only decision model
* No interactive prompts
* No warn mode
* No silent bypass

---

## Quick Start

Add CICULLIS to your workflow:

```yaml
- uses: midiakiasat/cicullis@v1
```

---

## Minimal Workflow

`.github/workflows/cicullis.yml`

```yaml
name: CICULLIS

on:
  pull_request:

permissions:
  contents: read

jobs:
  cicullis:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: midiakiasat/cicullis@v1
```

---

## Supply-Chain Hardening

For maximum integrity, pin actions to immutable SHAs:

```yaml
- uses: midiakiasat/cicullis@<commit-sha>
```

Avoid floating tags in high-assurance environments.

---

## Enforcement Model

Each run evaluates a fixed pipeline:

1. Time boundary validation
2. Custody requirement
3. Provenance sealing
4. Boundary enforcement
5. Deterministic verification
6. Attestation emission
7. Final judgment

Any violation produces immediate CI failure.

---

## Failure Output

Example:

```text
CI-GATE FAILED
Rule: PROVENANCE.SEAL.MISSING
Decision: BLOCKED
```

Failure codes are stable interface contracts.

---

## Failure Codes

| Rule Code                   | Meaning                                    |
| --------------------------- | ------------------------------------------ |
| PROVENANCE.SEAL.MISSING     | Required provenance record absent          |
| CUSTODY.DECLARATION.MISSING | Custodian not declared                     |
| TIME.CLASP.INVALID          | Temporal declaration invalid               |
| BOUNDARY.TRANSITION.DENIED  | Preconditions not satisfied                |
| VERIFICATION.UNVERIFIABLE   | Claim cannot be cryptographically verified |

Codes are extended only under versioned releases.

---

## Evaluation Protocol

CICULLIS results must be published.

Open an issue titled:

* `EVALUATION RESULT: PASS`
* `EVALUATION RESULT: FAIL`

Include:

* Repository URL
* Workflow run URL
* CICULLIS version (tag or SHA)
* Runner OS
* Observed rule code(s)
* Expected outcome
* Minimal reproduction

Incomplete reports are non-actionable.

---

## Pull Request Contract

Accepted PRs must preserve invariants:

* Determinism
* Binary enforcement
* No configurability flags
* No per-rule toggles
* No warn-only behavior
* No interactive logic
* No hidden bypass

Breaking invariants requires a major version.

---

## Governance

Governance policy: `GOVERNANCE.md`

---

## Security

Security policy: `SECURITY.md`

---

## Versioning

Semantic Versioning.

* Major: breaking behavioral change
* Minor: additive stable capability
* Patch: non-behavioral correction

Pin versions to guarantee determinism.

---

## Intended Audience

CICULLIS is suitable for systems that:

* Require finality
* Operate under audit or compliance pressure
* Cannot tolerate silent regression
* Demand cryptographic accountability

If flexibility is required, do not deploy.

---

## License

Apache License 2.0

Use, modify, and distribute under license terms.

Responsibility for operational outcomes remains with the operator.
