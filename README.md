# prism-rel-backup-probe

`prism-rel-backup-probe` treats reliability as a local verification problem. The Solidity implementation is intentionally narrow, but the fixtures and notes make the behavior explicit.

## Prism Rel Backup Probe Checkpoints

Treat the compact fixture as the contract and the extended examples as a scratchpad. The code should stay boring enough that a change in behavior is obvious from the test output.

## What This Is For

The repository exists to keep a technical idea small enough to reason about. The implementation avoids external dependencies where possible, then uses fixtures to make changes easy to review.

## Case Study

The examples are meant to be readable before they are exhaustive. They cover enough variation to show how latency and risk can pull a decision below the threshold.

## Architecture Notes

The core is a scoring model over demand, capacity, latency, risk, and weight. That keeps failure windows, retry budgets, and runbook checks in one explicit decision path. The threshold is 160, with risk penalty 7, latency penalty 2, and weight bonus 3. The Solidity project uses Foundry tests and pure contract functions so invariants are cheap to exercise.

## Useful Pieces

- Models failure windows with deterministic scoring and explicit review decisions.
- Uses fixture data to keep retry budgets changes visible in code review.
- Includes extended examples for runbook checks, including `surge` and `degraded`.
- Documents recovery paths tradeoffs in `docs/operations.md`.
- Runs locally with a single verification command and no external credentials.

## Local Workflow

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File scripts/verify.ps1
```

This runs the language-level build or test path against the compact fixture set.

## Quality Gate

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File scripts/audit.ps1
```

The audit command checks repository structure and README constraints before it delegates to the verifier.

## Project Layout

- `src`: primary implementation
- `test`: language test directory
- `fixtures`: compact golden scenarios
- `examples`: expanded scenario set
- `metadata`: project constants and verification metadata
- `docs`: operations and extension notes
- `scripts`: local verification and audit commands
- `foundry.toml`: Foundry project configuration

## Expansion Ideas

- Add a comparison mode that shows how decisions change when one signal is adjusted.
- Add a loader for `examples/extended_cases.csv` and promote selected cases into the language test suite.
- Add a short report command that prints the score breakdown for a single scenario.
- Add one more reliability fixture that focuses on a malformed or borderline input.

## Scope

The scoring model is simple by design. More domain-specific behavior should be added through explicit adapters or extra fixture classes rather than hidden constants.

## Tooling

Use a normal shell with Solidity available on `PATH`. The verifier is written as a PowerShell script because the portfolio was assembled on Windows.
