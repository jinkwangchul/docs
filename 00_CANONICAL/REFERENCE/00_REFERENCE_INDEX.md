# MASTER_SPEC Reference Index

Reference Edition - consolidated 2026-09-02

This file is an index, not an operating-policy document. User instructions,
actual code/evidence, and the named current owners remain authoritative in that
order. `20_ARCHIVE` contains historical evidence only and never competes with
CURRENT.

## Current Primary Owners

| Function | Primary owner | Supporting detail |
|---|---|---|
| Structure completion and Stock Library diagnostics lifecycle | `00_CANONICAL/CURRENT/MASTER_SPEC_CANONICAL_2026-09-01_STRUCTURE_AND_STOCK_LIBRARY_DIAGNOSTICS_FINAL_FREEZE.txt` | Main Structure completion and I5/I6/I7 diagnostics contracts |
| Budget, Starting Budget, Stock Limit, Operation Start | `00_CANONICAL/CURRENT/MASTER_SPEC_CANONICAL_2026-08-26_BUDGET_LIMIT_OPERATION_START_CONTRACT_FREEZE.txt` | `00_CANONICAL/REFERENCE/RUNNING_BASE_BUDGET_ADJUSTMENT_REFERENCE.md`, `00_CANONICAL/CURRENT/MASTER_SPEC_CANONICAL_2026-08-21_ROUTINE_STOCK_LIMIT_FINAL_FREEZE.txt` |
| BrokerSession, MarketData, TR provenance, Execution Universe | `00_CANONICAL/CURRENT/MASTER_SPEC_CANONICAL_2026-08-20_BROKER_MARKET_DATA_ARCHITECTURE_FINAL_FREEZE.txt` | `00_CANONICAL/CURRENT/MASTER_SPEC_CANONICAL_2026-08-24_HIGH_RESOLUTION_PRICE_SIGNAL_FOUNDATION_FREEZE.txt` |
| Review Management and Emergency lifecycle | `00_CANONICAL/CURRENT/MASTER_SPEC_CANONICAL_2026-08-02_REVIEW_MANAGEMENT_EMERGENCY_LIFECYCLE.txt` | `00_CANONICAL/REFERENCE/MAIN_OPERATOR_UI_REFERENCE.md` |
| Close and Liquidation | `00_CANONICAL/CURRENT/MASTER_SPEC_CANONICAL_2026-08-15_CLOSE_ACTION_AND_BUFFER_RESPONSE_FREEZE.txt` | `00_CANONICAL/CURRENT/MASTER_SPEC_CANONICAL_2026-08-01_CLOSE_PROCESS_OPERATION_CONTRACT.txt`, `00_CANONICAL/CURRENT/MASTER_SPEC_CANONICAL_2026-08-16_INDIVIDUAL_LIQUIDATION_TIME_AND_LONG_HOLD_CONTRACT.txt` |
| Main monitoring, Stock registration, Context Menu, Footer | `00_CANONICAL/CURRENT/MASTER_SPEC_CANONICAL_2026-08-24_CURRENT_WINDOW_RESET_STOCK_UI_FINALIZATION.txt` | `00_CANONICAL/REFERENCE/MAIN_OPERATOR_UI_REFERENCE.md`, `00_CANONICAL/CURRENT/MASTER_SPEC_CANONICAL_2026-08-18_MAIN_MONITORING_SELECTION_AND_HEIGHT_FREEZE.txt` |
| Indicator-follow SELL execution and MULTI_HOGA contract | `00_CANONICAL/CURRENT/MASTER_SPEC_CANONICAL_2026-09-02_INDICATOR_FOLLOW_SELL_PHASE1_AND_MULTI_HOGA_CONTRACT_FREEZE.txt` | `00_CANONICAL/CURRENT/MASTER_SPEC_CANONICAL_2026-09-02_ROUTINE_BOUNDARY_ISOLATION_AND_PACKAGE_CONTRACT_FREEZE.txt` |
| Routine package boundary and capability contract | `00_CANONICAL/CURRENT/MASTER_SPEC_CANONICAL_2026-09-02_ROUTINE_BOUNDARY_ISOLATION_AND_PACKAGE_CONTRACT_FREEZE.txt` | `00_CANONICAL/CURRENT/MASTER_SPEC_CANONICAL_2026-07-19_ROUTINE_INSTANCE_OPERATION_CONTRACT.txt` |
| Logical Group and Group Pack identity/lifecycle | `00_CANONICAL/CURRENT/MASTER_SPEC_CANONICAL_2026-08-22_LOGICAL_GROUP_PACK_ARCHITECTURE_FREEZE.txt` | `00_CANONICAL/CURRENT/MASTER_SPEC_CANONICAL_2026-09-02_ROUTINE_BOUNDARY_ISOLATION_AND_PACKAGE_CONTRACT_FREEZE.txt`, `00_CANONICAL/CURRENT/MASTER_SPEC_CANONICAL_2026-08-22_GROUP_LIFECYCLE_RECOVERY_FREEZE.txt`, `00_CANONICAL/CURRENT/MASTER_SPEC_CANONICAL_2026-07-22_AUTO_TRADE_SETTING_STRATEGY_WORKSPACE_UI_CLOSURE.txt` |
| Global Diagnostic Observer | `00_CANONICAL/CURRENT/MASTER_SPEC_CANONICAL_2026-08-16_GLOBAL_DIAGNOSTIC_OBSERVER_FINAL_FREEZE.txt` | Event and Log evidence |
| Budget buffer and Event Journal | `00_CANONICAL/CURRENT/MASTER_SPEC_CANONICAL_2026-08-16_BUDGET_BUFFER_EVENT_JOURNAL_FREEZE.txt` | Global observer and close contracts above |
| PAPER Trading architecture | `00_CANONICAL/REFERENCE/PAPER_TRADING_ISOLATED_EXECUTION_DOMAIN_REFERENCE.md` | Deferred architecture only; implementation has not started |

## Other Independent Current Contracts

- `00_CANONICAL/CURRENT/MASTER_SPEC_CANONICAL_2026-07-21_MAIN_MONITORING_METRIC_LAYOUT_CLOSURE.txt`
- `00_CANONICAL/CURRENT/MASTER_SPEC_CANONICAL_2026-08-08_MONITORING_EVIDENCE_AND_ACCOUNT_FUNDS_FREEZE.txt`
- `00_CANONICAL/CURRENT/MASTER_SPEC_CANONICAL_2026-08-11_MAIN_SETTINGS_SHARED_OPERATION_FREEZE.txt`
- `00_CANONICAL/CURRENT/MASTER_SPEC_CANONICAL_2026-08-12_GUI_CHART_OPERATION_STATE_FREEZE.txt`

These documents own independent layout, monitoring evidence, shared-operation,
and chart/operation-state boundaries. A newer date in another functional area
does not supersede them.

## Current References

- AI workflow and operating rules:
  `00_CANONICAL/REFERENCE/AGENT_WORKFLOW_REFERENCE.txt`
- Architecture terminology:
  `00_CANONICAL/REFERENCE/ARCHITECTURE_GLOSSARY.md`
- Unified base-budget dialog and persistence:
  `00_CANONICAL/REFERENCE/RUNNING_BASE_BUDGET_ADJUSTMENT_REFERENCE.md`
- Main operator UI, Review entry, Context Menu, and Footer projection:
  `00_CANONICAL/REFERENCE/MAIN_OPERATOR_UI_REFERENCE.md`
- PAPER isolated-domain direction:
  `00_CANONICAL/REFERENCE/PAPER_TRADING_ISOLATED_EXECUTION_DOMAIN_REFERENCE.md`

## Current Resume And Changelog

- Latest Work Resume:
  `00_CANONICAL/CURRENT/WORK_RESUME_LATEST_2026-09-02_SELL_PHASE1_AND_MULTI_HOGA_CONTRACT_FREEZE.txt`
- Latest Changelog:
  `00_CANONICAL/CHANGELOG/MASTER_SPEC_CHANGELOG_2026-09-02_SELL_PHASE1_AND_MULTI_HOGA_CONTRACT_FREEZE.txt`

Older Work Resumes, Readable variants, Freeze snapshots, and Changelogs are
historical records. They may explain a past decision but must not be used as a
current owner when a primary owner above covers the same function.

## Supporting Evidence

- Broker integration audits under `30_REPORTS/KIWOOM_BROKER_*` remain audit
  evidence, not contract owners.
- Provenance and decision traces under `00_CANONICAL/TRACE` remain historical
  evidence.
- Merged inputs under `10_UPDATE/MERGED` remain supporting update records.
- Legacy PART/reference editions under `20_ARCHIVE/REFERENCE_EDITION` are
  historical only.

## Interpretation Rules

- Current owner beats Archive/Legacy wording on conflict.
- Similar names do not merge budget, Runtime, persistence, or lifecycle owners.
- Monitoring-only means REAL execution suppression; it is not PAPER simulation.
- PAPER is `PENDING IMPLEMENTATION / ARCHITECTURE DIRECTION APPROVED`, not a
  completed Production contract and not an automatic next work item.
- Internal execution stages such as REAL_READY, Queue, Dispatch, and SendOrder
  belong in Event/Log evidence, not the Main operator Footer.
- Historical post-market ATS liquidation, restart-first residual Review, and
  `BETWEEN -> buy/sell inactive` interpretations do not override current
  Operation/ATS/Long-Hold contracts.

## Validation Rule

This index lists current owners first and keeps historical material out of the
primary path. Implementation status, old test counts, and expired next-work
instructions do not belong here.
