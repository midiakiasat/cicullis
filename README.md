# CICULLIS

[![GitHub Marketplace](https://img.shields.io/badge/GitHub%20Marketplace-CICULLIS-blue?logo=github)](https://github.com/marketplace/actions/cicullis)
![CI](https://img.shields.io/badge/CI-deterministic-critical)
![Security](https://img.shields.io/badge/security-enforcement-critical)
![Governance](https://img.shields.io/badge/governance-forward--only-important)
![Supply Chain](https://img.shields.io/badge/supply--chain-locked-critical)
![License](https://img.shields.io/badge/license-MIT-green)

**CICULLIS** is a GitHub Action that enforces **irreversible contracts at CI time**.

It is a **binary gate**.
It does not warn.
It does not suggest.
It **blocks**.

If CICULLIS passes, the decision is closed.
If it fails, nothing moves forward.

---

## Why CICULLIS Exists

Most CI systems are designed to **advise**: lint, test, report, recommend.
That model collapses in environments where **reversibility is an illusion**:

* a release cannot be unshipped
* a policy cannot be partially enforced
* a custody chain cannot be repaired after the fact
* an audit trail cannot be reconstructed honestly

CICULLIS exists for environments where the only acceptable behavior is:

> **either the contract holds, or execution stops**

---

## What CICULLIS Is

* A **CI choke point**
* A **deterministic enforcement engine**
* A **forward‑only decision gate**
* A mechanism to encode **finality, custody, provenance, and judgment**

CICULLIS runs automatically in CI and exits **pass / fail** only.

---

## What CICULLIS Is Not

* Not a linter
* Not a policy suggestion tool
* Not a report generator
* Not interactive
* Not configurable per rule

There is no **warn** mode.
There is no silent bypass.

---

## Threat Model — What CICULLIS Prevents

CICULLIS is designed to stop failures that typical CI pipelines allow:

* **Post‑merge regret** — decisions that passed CI but should never have shipped
* **Supply‑chain drift** — mutable tags and dependencies altering behavior over time
* **Custody breaks** — artifacts without accountable ownership or provenance
* **Audit ambiguity** — inability to prove *when* and *why* a decision was made
* **Human override leakage** — informal exceptions that erode enforcement guarantees

If a threat depends on *flexibility*, CICULLIS treats it as hostile.

---

## How It Works

On every CI run, CICULLIS executes a fixed enforcement pipeline:

1. **Time boundary** is evaluated
2. **Custody** is required
3. **Provenance** is sealed
4. **Boundaries** are closed
5. **Verification** is deterministic
6. **Attestation** is recorded
7. **Judgment** is final

Any violation causes an immediate CI failure.

---

## Quick Start

Add CICULLIS to your workflow:

```yaml
- uses: midiakiasat/cicullis@v1
```

No configuration is required.

---

## Minimal Workflow Example

Create a workflow file in your repository:

**`.github/workflows/cicullis.yml`**

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

## Security Recommendation: Pin to a Commit SHA

For security‑sensitive environments, pin CICULLIS to a specific **commit SHA** instead of a moving tag.

```yaml
- uses: midiakiasat/cicullis@<commit-sha>
```

This eliminates supply‑chain drift and guarantees identical behavior across time.

---

## Profiles

CICULLIS behavior is defined by a **profile**.

Default profile:

```text
profiles/default.profile
```

Profiles are **strict**, **explicit**, and **forward‑only**.

* No per‑rule toggles
* If a rule exists, it is enforced

---

## Failure Model

When CICULLIS fails, CI output contains:

* the violated rule
* the affected artifact
* the closed decision

```text
CI-GATE FAILED
Rule: PROVENANCE.SEAL.MISSING
Decision: BLOCKED
```

No retries.
No overrides.

---

## Versioning

CICULLIS follows semantic versioning.

* Behavior is stable within a major version
* Breaking changes require a major bump
* Old versions remain valid

Pin versions to guarantee behavior.

---

## FAQ

**Q: Can I disable a rule?**
No.

**Q: Can I run in warn‑only mode?**
No.

**Q: Can maintainers override a failure?**
Not without changing history.

**Q: Is this suitable for every project?**
Absolutely not.

**Q: What happens when CICULLIS blocks something critical?**
A human must take responsibility.

---

## Intended Use

CICULLIS is for teams that:

* require **final decisions**
* cannot tolerate silent regression
* operate under audit, compliance, or risk pressure
* want enforcement, not advice

If you need flexibility, CICULLIS is the wrong tool.

---

## Support

CICULLIS is free to use.

Support, assurance, incident response, and custom profiles are **out of band**.

When CICULLIS blocks something important, someone must decide.

That is the point.

---

## License

MIT License.

Use freely.
Fork freely.

Responsibility for outcomes remains with the operator.
