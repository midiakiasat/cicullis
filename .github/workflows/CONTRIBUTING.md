# Contributing

## Read This First

CICULLIS is not a collaborative playground.
It is an **enforcement surface**.

Contribution is **conditional**, not assumed.
Forking is always permitted.
Merging is not.

If your contribution weakens determinism, finality, or accountability, it will be rejected.

---

## Contribution Prerequisites

You may contribute only if you accept the following constraints:

- Deterministic behavior is non-negotiable
- Outcomes are binary (PASS / FAIL only)
- Execution is forward-only
- Enforcement semantics are not negotiable
- Silence or rejection is a valid maintainer response

If any of the above is unacceptable, do not contribute.

---

## What Can Be Contributed

Contributions are limited to changes that:

- preserve existing invariants
- strengthen enforcement guarantees
- improve clarity without adding flexibility
- add tests that prove deterministic behavior
- document existing behavior without reinterpretation

Examples of acceptable contributions:

- fixing a deterministic bug
- adding a missing failure code explanation
- improving test coverage for enforcement paths
- clarifying documentation without altering meaning

---

## What Will Be Rejected

The following are rejected by design:

- requests for flexibility or exceptions
- warn-only or advisory modes
- per-rule enable/disable mechanisms
- interactive prompts or confirmations
- configuration flags that alter enforcement semantics
- non-deterministic outputs or timing-dependent behavior
- changes that rely on trust, intent, or convention

If flexibility is required, fork the repository.

---

## Issue-First Rule

All non-trivial changes **must begin with an issue**.

The issue must:
- follow the Issue Contract
- include a reproducible scenario
- reference observable behavior
- avoid speculative language

Pull requests without a corresponding issue may be closed without review.

---

## Pull Request Requirements

A pull request must include:

- a clear statement of the invariant preserved
- a concise description of the behavioral change
- tests that fail before and pass after the change
- stable failure codes for all failure paths
- zero ambiguity in output or exit conditions

If any requirement is missing, the PR is incomplete.

---

## Commit Discipline

Commits must:

- describe contract-level changes, not file edits
- avoid narrative or promotional language
- remain auditable when read in isolation

Force-pushes that rewrite intent may result in closure.

---

## Review Expectations

Review is not guaranteed.

Maintainers may:
- merge without comment
- request changes without justification
- close without response

Absence of feedback does not imply acceptance or rejection of your reasoning.

---

## Determinism Proof Obligation

If you claim CICULLIS is deterministic under a change, you must prove it.

Minimum proof includes:
- a passing fixture repository
- a failing fixture repository with stable rule codes

Assertions without proof are invalid.

---

## Responsibility Boundary

By contributing, you acknowledge:

- enforcement outcomes are final
- maintainers owe no negotiation
- responsibility for interpretation lies with the contributor

This repository optimizes for correctness under pressure, not consensus.

---

## Final Note

If your goal is collaboration, discussion, or consensus-building,
this is the wrong repository.

If your goal is **enforcement that survives reality**, proceed carefully.
