# Authority

## What is authoritative

- `gate.sh` — Entry point and execution logic
- `engine/*.sh` — Primitive executors
- `profiles/*.profile` — Policy definitions
- `action.yml` — GitHub Action interface
- `FAILURE_CODES.json` — Exit code contract
- `INVARIANTS.md` — Guaranteed properties

## What is NOT authoritative

- `README.md` — Summary only
- Examples — Illustrative only
- Comments — Not binding
- External documentation — Not controlled

## Authority chain

1. Profile defines policy
2. Gate loads profile
3. Engine executes primitives
4. Exit code reflects verdict

## Changes to authority

Changes to authoritative artifacts require:
- Version bump in action.yml
- CHANGELOG entry
- No silent modification
- No backward-incompatible changes without major version
