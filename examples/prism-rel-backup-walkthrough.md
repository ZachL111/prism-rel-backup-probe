# Prism Rel Backup Probe Walkthrough

This note is the quickest way to read the extra review model in `prism-rel-backup-probe`.

| Case | Focus | Score | Lane |
| --- | --- | ---: | --- |
| baseline | budget pressure | 181 | ship |
| stress | failure width | 246 | ship |
| edge | recovery gap | 174 | ship |
| recovery | runbook drift | 195 | ship |
| stale | budget pressure | 152 | ship |

Start with `stress` and `stale`. They create the widest contrast in this repository's fixture set, which makes them better review anchors than the middle cases.

The useful comparison is `failure width` against `budget pressure`, not the raw score alone.
