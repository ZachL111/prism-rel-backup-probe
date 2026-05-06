# prism-rel-backup-probe

`prism-rel-backup-probe` is a Solidity project in reliability. Its focus is to develop a Solidity command-oriented project for backup scenarios with negative fixtures, human-readable error snapshots, and fixture-scale datasets.

## Reason For The Project

I want this repository to be useful as a quick reading exercise: fixtures first, implementation second, verifier last.

## Prism Rel Backup Probe Review Notes

Start with `failure width` and `budget pressure`. Those cases create the widest score spread in this repo, so they are the best quick check when the model changes.

## What It Does

- `fixtures/domain_review.csv` adds cases for budget pressure and failure width.
- `metadata/domain-review.json` records the same cases in structured form.
- `config/review-profile.json` captures the read order and the two review questions.
- `examples/prism-rel-backup-walkthrough.md` walks through the case spread.
- The Solidity code includes a review path for `failure width` and `budget pressure`.
- `docs/field-notes.md` explains the strongest and weakest cases.

## How It Is Put Together

The implementation keeps the scoring rule plain: reward signal and confidence, preserve slack, penalize drag, then classify the result into a review lane.

The Solidity checks add a pure review lens and Foundry coverage.

## Run It

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File scripts/verify.ps1
```

## Check It

That command is also the regression path. It verifies the domain cases and catches mismatches between the CSV, metadata, and code.

## Boundaries

The fixture set is small enough to audit by hand. The next useful expansion is malformed input coverage, not extra surface area.
