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

**CICULLIS** is a deterministic GitHub Action that enforces irreversible policy contracts at CI time.

It is a binary merge gate.
It emits no warnings.
It provides no advisory mode.
It either permits merge or blocks execution.

If CICULLIS passes, the decision is closed.
If CICULLIS fails, the workflow terminates.

---

# Executive Definition

CICULLIS transforms repository governance from documentation into enforcement.

It guarantees that:

* Policy requirements are executable, not aspirational.
* Cryptographic integrity is mandatory, not advisory.
* Provenance and custody are validated before merge.
* Finality occurs at CI boundary, not post‑incident.

CICULLIS is not:

* A linter
* A vulnerability scanner
* A static analyzer
* A policy suggestion engine

It is a deterministic enforcement boundary.

---

# System Identity

* System ID: SYS-001
* Registry: [https://speedkit.eu](https://speedkit.eu)
* Snapshot: [https://speedkit.eu/REGISTRY_SNAPSHOT.json](https://speedkit.eu/REGISTRY_SNAPSHOT.json)
* Status: FINAL
* Versioning: Semantic Versioning
* Execution Model: Deterministic, forward-only

Registry identity anchors system provenance. Runtime enforcement does not depend on registry availability.

---

# Threat Model

CICULLIS addresses the following adversarial classes:

1. Malicious pull request attempting to bypass declared policy.
2. Contributor attempting partial compliance.
3. Reviewer attempting to merge without satisfying enforcement invariants.
4. Accidental regression of governance guarantees.

Out of scope:

* Compromised GitHub infrastructure.
* Compromised runner operating system.
* Maintainer with administrative override capability.
* Cryptographic key compromise outside repository control.

CICULLIS assumes branch protection is enforced and administrative bypass is disabled.

---

# Trust Boundary

Trusted:

* Repository state at merge time.
* GitHub Actions execution environment.
* Enforced branch protection rules.

Untrusted:

* Pull request content.
* Contributor intent.
* Forked repository inputs.

CICULLIS operates strictly within repository state and workflow context.

---

# Core Principles

## Determinism

Given identical repository state and workflow configuration, CICULLIS produces identical output.

No randomness.
No adaptive logic.
No environment‑dependent branching.

## Binary Enforcement

Outcomes:

* PASS (exit 0)
* FAIL (non‑zero exit)

No degraded states exist.

## Forward‑Only Governance

CICULLIS enforces invariants prior to merge. It does not remediate after merge.

## Non‑Configurability

There are:

* No runtime flags
* No per‑rule toggles
* No “warn‑only” mode
* No conditional bypass paths

Behavioral changes require version increment.

---

# Enforcement Domains

CICULLIS evaluates the following irreversible domains:

1. Time boundary validation
2. Custody declaration integrity
3. Provenance sealing
4. Boundary transition discipline
5. Deterministic verification
6. Attestation emission
7. Final judgment

Failure in any domain blocks merge.

---

# Architecture

CICULLIS consists of:

* A GitHub Action interface
* A deterministic shell execution engine
* A fixed evaluation pipeline
* A stable failure code surface

There are no external network dependencies in decision logic.

---

# Action Interface

## Inputs

None.

CICULLIS derives all required state from repository context.

## Outputs

* Exit code (0 = PASS, non‑zero = FAIL)
* Structured failure message

## Exit Codes

Exit codes map deterministically to failure domains.

---

# Quick Start

```yaml
- uses: midiakiasat/cicullis@v1
```

---

# Minimal Workflow

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

# High‑Assurance Configuration

For regulated or compliance‑bound environments:

* Pin CICULLIS to immutable commit SHA.
* Require status checks before merge.
* Enforce signed commits.
* Require code owner review.
* Disable admin bypass.
* Require linear history.

Example:

```yaml
- uses: midiakiasat/cicullis@<immutable-commit-sha>
```

---

# Failure Model

Example failure output:

```
CI-GATE FAILED
Rule: PROVENANCE.SEAL.MISSING
Decision: BLOCKED
```

Failure codes are stable contracts. They change only with version increment.

---

# Failure Codes (Stable Surface)

| Rule Code                   | Meaning                                    |
| --------------------------- | ------------------------------------------ |
| PROVENANCE.SEAL.MISSING     | Required provenance record absent          |
| CUSTODY.DECLARATION.MISSING | Custodian not declared                     |
| TIME.CLASP.INVALID          | Temporal declaration invalid               |
| BOUNDARY.TRANSITION.DENIED  | Preconditions not satisfied                |
| VERIFICATION.UNVERIFIABLE   | Claim cannot be cryptographically verified |

---

# Determinism Guarantees

CICULLIS guarantees:

* No network‑dependent decision logic.
* No external mutable state.
* No runtime configuration drift.
* Identical results under identical repository state.

---

# Operational Assumptions

CICULLIS assumes:

* Branch protection is enforced.
* Required status checks are enabled.
* Admin bypass is disabled.
* Commits are cryptographically signed.

Absent these controls, enforcement guarantees degrade.

---

# Limitations

CICULLIS does not:

* Replace branch protection.
* Replace human code review.
* Detect runtime vulnerabilities.
* Protect against infrastructure compromise.
* Prevent administrator override outside enforced policy.

It enforces merge‑time invariants only.

---

# SAST Stance

CICULLIS primarily evaluates shell and YAML policy logic.

There is no substantial analyzable application code target for CodeQL.

OpenSSF Scorecard SAST may report 0.
This is intentional.

Security signal derives from deterministic enforcement and governance strictness.

---

# Supply‑Chain Integrity Recommendations

* Pin all GitHub Actions by SHA.
* Minimize workflow permissions.
* Maintain strict review discipline.
* Snapshot branch protection configuration.

CICULLIS enforces within CI. It does not replace governance discipline.

---

# Evaluation Protocol

To evaluate CICULLIS:

Open an issue titled:

* `EVALUATION RESULT: PASS`
* `EVALUATION RESULT: FAIL`

Include:

* Repository URL
* Workflow run URL
* CICULLIS version or SHA
* Runner OS
* Observed failure code
* Minimal reproduction steps

---

# Versioning

Semantic Versioning.

* Major: invariant change
* Minor: additive stable capability
* Patch: non‑behavioral correction

Pin versions to guarantee determinism.

---

# License

Apache License 2.0

Operational responsibility remains with the operator.

---

# Final Statement

CICULLIS enforces irreversible merge boundaries.

PASS permits merge.
FAIL blocks execution.

No advisory mode exists.
