# Security Policy

## Supported Versions

This project is security-hardened but does not guarantee long-term support for all historical versions.
Security fixes, when issued, are applied to the latest release and `main`.

## Reporting a Vulnerability

Report security issues privately.

- Email: contact@speedkit.eu
- Include:
  - affected version / commit SHA
  - reproduction steps / PoC (minimal)
  - expected vs observed behavior
  - impact assessment

Do **not** open public issues for active vulnerabilities.

## Supply-Chain Guarantees

- `main` is protected (PR-only, linear history, signed commits required).
- Release tags are protected from update and deletion.
- CI execution is restricted to an allowlist of actions.

## Verification

### Verify commit signature on GitHub
Look for the **Verified** badge on commits and merges.

### Verify locally (commit)
```bash
git verify-commit <SHA>
