# MASTER_SPEC Reference Index

Reference Edition - consolidated 2026-09-04

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
| Close and Liquidation | `00_CANONICAL/CURRENT/MASTER_SPEC_CANONICAL_2026-08-15_CLOSE_ACTION_AND_BUFFER_RESPONSE_FREEZE.txt` | `00_CANONICAL/CURRENT/MASTER_SPEC_CANONICAL_2026-08-01_CLOSE_PROCESS_OPERATION_CONTRACT.txt`, `00_CANONICAL/CURRENT/MASTER_SPEC_CANONICAL_2026-08-16_INDIVIDUAL_LIQUIDATION_TIME_AND_LONG_HOLD_CONTRACT.txt`, Sep-08 CURRENT_PRICE residual-holding clarification |
| Main monitoring, Stock registration, Context Menu, Footer | `00_CANONICAL/CURRENT/MASTER_SPEC_CANONICAL_2026-08-24_CURRENT_WINDOW_RESET_STOCK_UI_FINALIZATION.txt` | `00_CANONICAL/REFERENCE/MAIN_OPERATOR_UI_REFERENCE.md`, `00_CANONICAL/CURRENT/MASTER_SPEC_CANONICAL_2026-08-18_MAIN_MONITORING_SELECTION_AND_HEIGHT_FREEZE.txt` |
| Production monitoring/operating permission retirement | `00_CANONICAL/CURRENT/MASTER_SPEC_CANONICAL_2026-09-04_MONITORING_OPERATING_MODE_RETIREMENT_FREEZE.txt` | Final R0-R8 authority; supersedes the R7 pre-Freeze owner and only the retired switch wording in older Routine/Window/UI contracts |
| Indicator-follow Routine lifecycle and Main ownership boundary | `00_CANONICAL/CURRENT/MASTER_SPEC_CANONICAL_2026-09-06_MAIN_INDICATOR_FOLLOW_FULL_BOUNDARY_FREEZE.txt` | Latest Production lifecycle, sealed Facts/Decision/Writer ownership, and package capability authority; the 2026-09-05 20-Control Freeze remains immutable supporting evidence |
| Main-Routine normalized facts boundary, retired Validation V1, optional V2, and Main Routine Instance deletion verification | `00_CANONICAL/CURRENT/MASTER_SPEC_CANONICAL_2026-09-15_MAIN_ROUTINE_BOUNDARY_AND_VALIDATION_RETIREMENT_SUPPLEMENT.txt` | Post-Sep-14 supplemental owner for commits 8d35be3, 499b006, and d44de79; preserves the Sep-06 lifecycle and Sep-14 V2 owners outside this later scope |
| Indicator-follow ordinary settings registration/change | `00_CANONICAL/CURRENT/MASTER_SPEC_CANONICAL_2026-09-08_INDICATOR_FOLLOW_SETTINGS_VALIDATION_ON_COMMIT.txt` | Latest validation-on-click, immediate Applied, atomic read-back, and Mock Operation versioned-rules snapshot authority; supersedes only the older ordinary-settings Pending/Approval prerequisite |
| Sep-13 Production/Mock close normalization and Indicator-follow read-only Historical Validation Chart | `00_CANONICAL/CURRENT/MASTER_SPEC_CANONICAL_2026-09-13_OPERATION_MOCK_AND_INDICATOR_VALIDATION_FREEZE.txt` | Supplemental owner for later close/auth/shared-boundary normalization and the dedicated current-edit Historical replay chart; validation-on-commit, Mock Validation, and earlier independent owners remain separate |
| Indicator-follow Signal Validation V2, completed cycles, aggregate return, and Replay performance | `00_CANONICAL/CURRENT/MASTER_SPEC_CANONICAL_2026-09-14_INDICATOR_FOLLOW_SIGNAL_VALIDATION_V2_FREEZE.txt` | Latest supplemental owner for the independent operator V2, empty SELL-expression meaning, evidence/axis/cycle UI, completed-cycle aggregate return, and Replay optimization Phases 2-4 |
| Signal Validation V2 validation, silent status, result summary, and tooltip normalization | `00_CANONICAL/CURRENT/MASTER_SPEC_CANONICAL_2026-09-16_SIGNAL_VALIDATION_V2_UI_NORMALIZATION_SUPPLEMENT.txt` | Supersedes only conflicting Sep-14/Sep-15 wording for expression-aware SELL admission, silent apply/completion, Korean summary/0.00% display, timestamp label, and tooltip dismissal dispatch |
| Signal Validation operation independence while Production operation is active | `00_CANONICAL/CURRENT/MASTER_SPEC_CANONICAL_2026-09-18_SIGNAL_VALIDATION_OPERATION_INDEPENDENCE_SUPPLEMENT.txt` | Validation remains an independent operator workflow and does not acquire Production operation mutation authority |
| Signal Validation V2 virtual execution, configured-filter visualization, Evidence interaction, and Candle-snapped Crosshair | `00_CANONICAL/CURRENT/MASTER_SPEC_CANONICAL_2026-09-19_SIGNAL_VALIDATION_V2_FILTER_VISUALIZATION_AND_VIRTUAL_EXECUTION_SUPPLEMENT.txt` | Current supplemental owner for completed-Candle admission, OHLC/4 virtual fills, simplified weighted-average execution, 8-family visualization/cache, fixed lower-pane H, Evidence styling, Marker Pin/release, Crosshair, and cached value lookup; Git checkpoint remains separate |
| Signal Validation V2 chart/history/persistent-cache freeze | `00_CANONICAL/CURRENT/MASTER_SPEC_CANONICAL_2026-09-20_SIGNAL_VALIDATION_V2_CHART_HISTORY_AND_CACHE_FREEZE.txt` | Latest owner for actual committed chart/history/cache behavior, latest-100 viewport, local chart navigation, replay scan optimization, V2 averaging defaults, marker clipping/legend normalization, and Validation-owned restart-persistent history cache; committed 5,000 vs earlier user-directed 10,000 preload remains unresolved and is not treated as policy approval |
| Mock Validation bounded runtime growth | `00_CANONICAL/CURRENT/MASTER_SPEC_CANONICAL_2026-09-18_MOCK_VALIDATION_RUNTIME_GROWTH_NORMALIZATION.txt` | Current owner for bounded process-local Mock runtime/evidence growth without Production persistence authority |
| Indicator-follow SELL execution and MULTI_HOGA contract | `00_CANONICAL/CURRENT/MASTER_SPEC_CANONICAL_2026-09-02_INDICATOR_FOLLOW_SELL_PHASE1_AND_MULTI_HOGA_CONTRACT_FREEZE.txt` | `00_CANONICAL/CURRENT/MASTER_SPEC_CANONICAL_2026-09-02_ROUTINE_BOUNDARY_ISOLATION_AND_PACKAGE_CONTRACT_FREEZE.txt` |
| Routine package boundary and capability contract | `00_CANONICAL/CURRENT/MASTER_SPEC_CANONICAL_2026-09-02_ROUTINE_BOUNDARY_ISOLATION_AND_PACKAGE_CONTRACT_FREEZE.txt` | `00_CANONICAL/CURRENT/MASTER_SPEC_CANONICAL_2026-07-19_ROUTINE_INSTANCE_OPERATION_CONTRACT.txt` |
| Logical Group and Group Pack identity/lifecycle | `00_CANONICAL/CURRENT/MASTER_SPEC_CANONICAL_2026-08-22_LOGICAL_GROUP_PACK_ARCHITECTURE_FREEZE.txt` | `00_CANONICAL/CURRENT/MASTER_SPEC_CANONICAL_2026-09-02_ROUTINE_BOUNDARY_ISOLATION_AND_PACKAGE_CONTRACT_FREEZE.txt`, `00_CANONICAL/CURRENT/MASTER_SPEC_CANONICAL_2026-08-22_GROUP_LIFECYCLE_RECOVERY_FREEZE.txt`, `00_CANONICAL/CURRENT/MASTER_SPEC_CANONICAL_2026-07-22_AUTO_TRADE_SETTING_STRATEGY_WORKSPACE_UI_CLOSURE.txt` |
| Global Diagnostic Observer | `00_CANONICAL/CURRENT/MASTER_SPEC_CANONICAL_2026-08-16_GLOBAL_DIAGNOSTIC_OBSERVER_FINAL_FREEZE.txt` | Event and Log evidence |
| Budget buffer and Event Journal | `00_CANONICAL/CURRENT/MASTER_SPEC_CANONICAL_2026-08-16_BUDGET_BUFFER_EVENT_JOURNAL_FREEZE.txt` | Global observer and close contracts above |
| Mock Validation implementation | `00_CANONICAL/CURRENT/MASTER_SPEC_CANONICAL_2026-09-08_MOCK_VALIDATION_UI_ATS_CLOSURE_FREEZE.txt` | Sep-03 foundation remains supporting authority; Sep-08 owns current UI/Event closure and overlay/zero-base clarification |
| ATS generic order-method retirement | `00_CANONICAL/CURRENT/MASTER_SPEC_CANONICAL_2026-09-08_MOCK_VALIDATION_UI_ATS_CLOSURE_FREEZE.txt` | ATS sessions and legitimate liquidation remain preserved; only generic Routine BUY/SELL execution_method mapping is superseded |
| Operation-mode admission, close/liquidation display, Quick Chart live projection, and TR capacity gauge | `00_CANONICAL/CURRENT/MASTER_SPEC_CANONICAL_2026-09-11_REGULAR_WINDOW_CLOSING_FREEZE.txt` | Detailed display matrix: `00_CANONICAL/CURRENT/MASTER_SPEC_CANONICAL_2026-09-11_OPERATION_MODE_CLOSE_LIQUIDATION_DISPLAY_RECONCILIATION.txt`; older independent execution owners remain unchanged |
| Operation waiting/re-entry and effective-session semantics | `00_CANONICAL/CURRENT/MASTER_SPEC_CANONICAL_2026-09-19_WAITING_REENTRY_AND_EFFECTIVE_SESSION_NORMALIZATION.txt` | Current owner for re-enterable waiting, final-session terminal distinction, Program/actual-session intersection, and canonical start admission |
| Per-stock verified NXT eligibility for ATS admission | `00_CANONICAL/CURRENT/MASTER_SPEC_CANONICAL_2026-09-19_VERIFIED_NXT_ELIGIBILITY_ATS_GATE_SUPPLEMENT.txt` | Closes the NXT-eligibility gap: only verified Master Stock Library `nxt_available=true` authorizes an ATS session; false/unknown fail closed |
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
- Indicator Follow reserved BUY UI recovery evidence and deferred scope:
  `00_CANONICAL/REFERENCE/INDICATOR_FOLLOW_BUY_RESERVED_UI_RECOVERY_REFERENCE_2026-09-03.txt`
- Indicator Follow Routine lifecycle and Main ownership authority:
  `00_CANONICAL/CURRENT/MASTER_SPEC_CANONICAL_2026-09-06_MAIN_INDICATOR_FOLLOW_FULL_BOUNDARY_FREEZE.txt`
- Indicator Follow latest Local Working-State Checkpoint (not a Freeze):
  `00_CANONICAL/REFERENCE/WORKING_STATE_BACKUP_2026-09-05_REPEAT_ACTIVE_BUY_SIGNAL_PIPELINE_INTERIM_CHECKPOINT.txt`
- Signal Validation V2 pre-implementation Filter/Indicator Visualization design history (IMPLEMENTED; current owner is the 2026-09-19 Canonical supplement):
  `00_CANONICAL/REFERENCE/SIGNAL_VALIDATION_V2_FILTER_VISUALIZATION_IMPLEMENTATION_REFERENCE_2026-09-16.txt`
- Production monitoring/operating permission retirement:
  `00_CANONICAL/CURRENT/MASTER_SPEC_CANONICAL_2026-09-04_MONITORING_OPERATING_MODE_RETIREMENT_FREEZE.txt`
- Post-Freeze current project handoff and recovery entry point:
  `00_CANONICAL/CURRENT/PROJECT_CURRENT_STATE_2026-09-04_POST_RETIREMENT_FREEZE.txt`

## Current Resume And Changelog

- Latest Frozen Authority:
  `00_CANONICAL/CURRENT/MASTER_SPEC_CANONICAL_2026-09-20_SIGNAL_VALIDATION_V2_CHART_HISTORY_AND_CACHE_FREEZE.txt`
- Latest Local WIP Work Resume:
  `00_CANONICAL/CURRENT/WORK_RESUME_LATEST_2026-09-05_REPEAT_ACTIVE_BUY_SIGNAL_PIPELINE_INTERIM_CHECKPOINT.txt`
- Latest Local WIP Changelog:
  `00_CANONICAL/CHANGELOG/MASTER_SPEC_CHANGELOG_2026-09-05_REPEAT_ACTIVE_BUY_SIGNAL_PIPELINE_INTERIM_CHECKPOINT.txt`
- Latest Frozen Work Resume:
  `00_CANONICAL/CURRENT/WORK_RESUME_LATEST_2026-09-20_SIGNAL_VALIDATION_V2_CHART_HISTORY_AND_CACHE_FREEZE.txt`
- Latest Frozen Changelog:
  `00_CANONICAL/CHANGELOG/MASTER_SPEC_CHANGELOG_2026-09-20_SIGNAL_VALIDATION_V2_CHART_HISTORY_AND_CACHE_FREEZE.txt`

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
- Monitoring-only REAL execution suppression is retired from Production. PAPER
  and Mock remain separate isolated-domain concepts and are not replacements for
  the retired permission switch.
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
