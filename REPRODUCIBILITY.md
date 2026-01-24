# Reproducibility

## Execution environment

| Component | Requirement |
|-----------|-------------|
| Shell | POSIX-compatible (bash, zsh, sh) |
| OS | Linux, macOS |
| Dependencies | None beyond shell |

## Determinism guarantee

Given identical:
- Input (stdin)
- Profile
- Environment variables (none required)

Output will be:
- Identical stdout
- Identical exit code

## Verification steps

```bash
# Run twice
./gate.sh < input.txt > output1.txt 2>&1
echo $? > exit1.txt

./gate.sh < input.txt > output2.txt 2>&1
echo $? > exit2.txt

# Compare
diff output1.txt output2.txt
diff exit1.txt exit2.txt
```

Both diffs must be empty.

## Profile verification

```bash
# Hash profile
sha256sum profiles/default.profile
```

## Non-reproducible elements

None. CICULLIS is fully deterministic.

## Offline operation

CICULLIS requires no network access. All execution is local.
