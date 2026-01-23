# CICULLIS

[![GitHub Marketplace](https://img.shields.io/badge/GitHub%20Marketplace-CICULLIS-blue?logo=github)](https://github.com/marketplace/actions/cicullis)
![CI](https://img.shields.io/badge/CI-deterministic-critical)
![Security](https://img.shields.io/badge/security-enforcement-critical)
![Governance](https://img.shields.io/badge/governance-forward--only-important)
![Supply Chain](https://img.shields.io/badge/supply--chain-locked-critical)
[![OpenSSF Scorecard](https://api.securityscorecards.dev/projects/github.com/midiakiasat/cicullis/badge)](https://securityscorecards.dev/viewer/?uri=github.com/midiakiasat/cicullis)

![License](https://img.shields.io/badge/license-MIT-green)

**CICULLIS** is a GitHub Action that enforces **irreversible contracts at CI time**.

It is a **binary gate**.
It does not warn.
It does not suggest.
It **blocks**.

If CICULLIS passes, the decision is closed.
If it fails, nothing moves forward.

---

## If You Run CICULLIS

CICULLIS is not “tried.” It is **evaluated**.

If you run CICULLIS in any repository (even once), you are expected to publish the outcome as a record:

* **PASS** is a claim.
* **FAIL** is evidence.
* Silence is non-action.

Open an issue titled **`EVALUATION RESULT: PASS`** or **`EVALUATION RESULT: FAIL`** with the required fields in the **Issue Contract** section.

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
* A **forward-only decision gate**
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

## Threat Model

CICULLIS is designed to stop failures that typical CI pipelines tolerate:

* **Post-merge regret** — decisions that passed CI but should never have shipped
* **Supply-chain drift** — mutable tags and dependencies altering behavior over time
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

## Secure Use

Workflow files are privileged code. Treat them as such.

Minimum guidance for security-sensitive environments:

* **Pin actions to immutable references** (commit SHAs) where feasible.
* Use **least-privilege permissions**.
* Review all third-party actions as if they are production dependencies.
* Restrict who can modify workflow files.

### Pin CICULLIS to a Commit SHA

Pin CICULLIS to a specific **commit SHA** instead of a moving tag:

```yaml
- uses: midiakiasat/cicullis@<commit-sha>
```

This eliminates supply-chain drift and guarantees identical behavior across time.

---

## Profiles

CICULLIS enforcement behavior is defined by a **profile**.

Default profile:

```text
profiles/default.profile
```

Profiles are **strict**, **explicit**, and **forward-only**.

* No per-rule toggles
* If a rule exists, it is enforced

**Design constraint:** profiles define the contract, but CICULLIS does not expose runtime “configuration modes.”

---

## Failure Model

When CICULLIS fails, CI output contains:

* the violated rule code
* the affected artifact
* the closed decision

Example:

```text
CI-GATE FAILED
Rule: PROVENANCE.SEAL.MISSING
Decision: BLOCKED
```

No retries.
No overrides.

---

## Failure Codes

Failure codes are the interface. They must remain stable.

| Rule code                     | Meaning                                             | Common fix                                                        |
| ----------------------------- | --------------------------------------------------- | ----------------------------------------------------------------- |
| `PROVENANCE.SEAL.MISSING`     | Required provenance record is absent                | Run/emit the required provenance sealing step or artifact         |
| `CUSTODY.DECLARATION.MISSING` | No custodian declared                               | Declare custody in the required format (see profile expectations) |
| `TIME.CLASP.INVALID`          | Temporal declaration malformed/future/invalid       | Provide valid ISO-8601 UTC timestamp; do not claim future time    |
| `BOUNDARY.TRANSITION.DENIED`  | Transition attempted without meeting preconditions  | Satisfy boundary prerequisites; remove ambiguity at the threshold |
| `VERIFICATION.UNVERIFIABLE`   | Claim cannot be verified against observable anchors | Provide falsifiable anchors; remove hedging/speculation           |

(Extend this table only when a code is truly stable and externally observable.)

---

## Evaluation Protocol

CICULLIS evaluation is a disciplined procedure.

**Required steps**

1. Run CICULLIS on a PR (recommended) or on `push`.
2. Capture the job log for the CICULLIS step.
3. Publish the result using the Issue Contract.

If you cannot publish a record, do not claim the result.

---

## Issue Contract

CICULLIS accepts issues only when they are **actionable and reproducible**.

### Allowed Issue Types (only)

Open issues using one of these exact titles:

1. `EVALUATION RESULT: PASS`
2. `EVALUATION RESULT: FAIL`
3. `BUG: <short description>`
4. `DOC: <short description>`

Issues outside this scope may be closed without discussion.

### Required Fields

Include all fields:

* **Repository URL**
* **Workflow run URL** (or pasted logs if private)
* **CICULLIS version** (tag or commit SHA)
* **Runner OS**
* **Observed rule code(s)** (e.g., `PROVENANCE.SEAL.MISSING`)
* **Expected outcome** (one sentence)
* **Minimal reproduction** (steps or link to minimal repo)

If any field is missing, the issue is incomplete.

---

## PR Contract

Pull requests are accepted only when they preserve CICULLIS’s invariants:

* deterministic
* binary (no warn mode)
* forward-only
* no interactive prompts
* no per-rule enable/disable
* no configuration flags
* no hidden bypasses

### PR Requirements

A PR must include:

* A statement of the invariant preserved
* A minimal test proving the behavior (fixture-based)
* Stable failure code(s) for failures
* No ambiguity introduced into outputs

### PRs that will be rejected

* “More flexible” behavior
* Per-rule toggles
* Warn-only mode
* Interactive prompting
* Non-deterministic outputs
* Silent bypass mechanisms

If you want flexibility, fork.

---

## Determinism Proof (Recommended)

If you intend to claim CICULLIS is deterministic, prove it.

Minimum proof pattern:

* A **clean fixture** repository that **must pass**
* A **violation fixture** repository that **must fail** with a stable rule code

This converts marketing into verifiable behavior.

---

## Versioning

See [CHANGELOG.md](CHANGELOG.md) for a complete, immutable history of behavior.

CICULLIS follows semantic versioning.

* Behavior is stable within a major version
* Breaking changes require a major bump
* Old versions remain valid

Pin versions to guarantee behavior.

---

## Security Policy

Security policy: **SECURITY.md**

---

## FAQ

**Q: Can I disable a rule?**
No.

**Q: Can I run in warn-only mode?**
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
