# Docs Repository

This repository stores documentation for the Kiwoom Auto Trading Project.

AI operating rules are defined only in:

```text
00_CANONICAL/REFERENCE/AGENT_WORKFLOW_REFERENCE.txt
```

README is a repository guide. It does not define AI operating procedure.

## Repository Purpose

- Keep the latest project technical contracts in `00_CANONICAL/CURRENT`.
- Keep Canonical change history in `00_CANONICAL/CHANGELOG`.
- Keep document navigation in `00_CANONICAL/REFERENCE/00_REFERENCE_INDEX.md`.
- Keep old evidence and historical documents in `20_ARCHIVE`.
- Keep management reports in `30_REPORTS`.

This repository is not the code repository. Do not edit Python code, runtime files, rules files, or live trading data here.

## Core Structure

```text
docs/
  00_CANONICAL/
    CURRENT/
    CHANGELOG/
    REFERENCE/
    TRACE/
    OPEN_ISSUES/
  10_UPDATE/
    INBOX/
    MERGED/
    TEMPLATE/
  20_ARCHIVE/
    REFERENCE_EDITION/
  30_REPORTS/
  90_TEMP/
```

## Document Roles

- `AGENT_WORKFLOW_REFERENCE.txt`: single AI operating rule source.
- `00_REFERENCE_INDEX.md`: index to latest documents.
- Latest Canonical: project technical contract.
- Latest Work Resume: recovery and next-session context.
- Latest Changelog: Canonical change history.
- `ARCHITECTURE_GLOSSARY.md`: terminology reference.
- `20_ARCHIVE`: historical evidence only.

## Canonical Rules

- Do not overwrite existing Canonical files.
- Create a new Canonical only for confirmed implementation or confirmed policy.
- Keep old Canonical files as historical evidence.
- Keep only the latest Canonical in `00_CANONICAL/CURRENT`.
- Latest Canonical is the technical contract unless superseded by newer user instruction or actual runtime evidence.

## Changelog Rules

- Do not overwrite existing Changelog files.
- Create a new Changelog only when a new Canonical is created or a confirmed Canonical contract changes.
- Record what changed, where it was reflected, and what evidence verifies it.

## Work Resume Rules

- Work Resume records recovery state, current baseline, next start point, and unresolved blockers.
- Startup uses the latest Work Resume to resume implementation quickly.
- Keep only the latest Work Resume in `00_CANONICAL/CURRENT`.
- Old Work Resume files are historical evidence only.

## Archive Rules

- Prefer archive preservation over deletion.
- Do not delete old evidence unless the user explicitly approves deletion and preserved evidence is confirmed.
- Historical and archived files do not redefine current contracts.

## Reference Rules

- Use `00_REFERENCE_INDEX.md` only to locate required documents.
- Legacy PART files are archived in `20_ARCHIVE/REFERENCE_EDITION` as historical reference evidence.
- If a Reference file conflicts with the latest Canonical or `AGENT_WORKFLOW_REFERENCE.txt`, the latest Canonical or AGENT file wins according to its role.

## Git And Remote Backup

Local Git is used for local version history and recovery.

GitHub is used as remote backup and restoration baseline after user-approved push.

Follow `AGENT_WORKFLOW_REFERENCE.txt` for all Git and baseline rules.
