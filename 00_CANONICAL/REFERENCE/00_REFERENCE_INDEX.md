# MASTER_SPEC Reference Index

Reference Edition

- Reference Base Canonical: MASTER_SPEC_CANONICAL_2026-07-09_RUNTIME_APPLY_PREVIEW_EXECUTION_PREVIEW_ORCHESTRATOR.txt
- Latest Official Canonical: MASTER_SPEC_CANONICAL_2026-08-26_BUDGET_LIMIT_OPERATION_START_CONTRACT_FREEZE.txt
- Latest Operational Work Resume: WORK_RESUME_LATEST_2026-08-26_BUDGET_LIMIT_OPERATION_START_CONTRACT_FREEZE.txt
- Cleanup Completion Baseline Work Resume: WORK_RESUME_LATEST_2026-08-05_CLEANUP_COMPLETION_BASELINE.txt
- Latest Changelog: MASTER_SPEC_CHANGELOG_2026-08-26_BUDGET_LIMIT_OPERATION_START_CONTRACT_FREEZE.txt
- Latest Readable Changelog: MASTER_SPEC_READABLE_CHANGELOG_2026-08-05_CLEANUP_COMPLETION_BASELINE.txt


## Source of Truth

1. Latest user instruction
2. `00_CANONICAL/REFERENCE/AGENT_WORKFLOW_REFERENCE.txt` for AI operating rules
3. Latest file in `00_CANONICAL/CURRENT` for project technical contracts
4. Actual local code, Runtime files, logs, and execution evidence for implementation state
5. Legacy PART files only when the latest Canonical does not supersede them

For Global Diagnostic Observer and Event diagnostic security contracts, use
`00_CANONICAL/CURRENT/MASTER_SPEC_CANONICAL_2026-08-16_GLOBAL_DIAGNOSTIC_OBSERVER_FINAL_FREEZE.txt`
as the first technical Source of Truth. For Budget/Buffer persistence,
조기마감, 자동마감, 청산정책, 마감정책, 즉시청산, and Event Journal phase 1,
continue to use
`00_CANONICAL/CURRENT/MASTER_SPEC_CANONICAL_2026-08-16_BUDGET_BUFFER_EVENT_JOURNAL_FREEZE.txt`.
Archive and Legacy files are historical evidence only for these areas. If they
conflict with Current Canonical, Current Canonical wins. If UI terminology and
document terminology conflict, the confirmed UI term wins.

For individual-liquidation time boundaries, conditional Liquidation Policy
transitions, final operator-intent precedence, and per-stock long-term holding
Review classification, use
`00_CANONICAL/CURRENT/MASTER_SPEC_CANONICAL_2026-08-16_INDIVIDUAL_LIQUIDATION_TIME_AND_LONG_HOLD_CONTRACT.txt`
before the 2026-07-27 transition contract.

For BrokerSession, connection_epoch, TR provenance/Governor, screen allocation,
market-data authority, Execution Universe, stock registration/roster, and
restart/reconnect architecture, use
`00_CANONICAL/CURRENT/MASTER_SPEC_CANONICAL_2026-08-20_BROKER_MARKET_DATA_ARCHITECTURE_FINAL_FREEZE.txt`.
This supplemental Canonical does not supersede the independent Current
Canonical contracts for Global Diagnostic Observer, Budget/Buffer,
Close/Liquidation, Review/Emergency, Main monitoring UI, or charts.

For the process-local High-Resolution Tick state, Price Signal observation
gate, Realtime/TR monitoring UI, and live mini-chart endpoint, use
`00_CANONICAL/CURRENT/MASTER_SPEC_CANONICAL_2026-08-24_HIGH_RESOLUTION_PRICE_SIGNAL_FOUNDATION_FREEZE.txt`.
It supplements and does not replace the Broker / Market Data Architecture,
canonical candle, Routine, or order-safety contracts.

For AMOUNT starting-budget defaults and recovery, Stock limit recommendation,
digit alignment, invalid limit recovery, Operation Start admission versus order
permission, operation-time projection, ATS sessions and execution method,
NON_TRADING_GAP, participant membership and retirement, long-term holding,
immediate Review, bottom operation-button state, registration while operating,
and Main/AutoTradeSetting shared projection, use
`00_CANONICAL/CURRENT/MASTER_SPEC_CANONICAL_2026-08-26_BUDGET_LIMIT_OPERATION_START_CONTRACT_FREEZE.txt`.
It supplements and does not replace the independent Budget semantic,
Routine/Stock Limit, Main/Settings shared operation, Broker, Recovery, or
order-safety contracts.

For current-running base-budget adjustment, Immediate first-BUY application,
Next-Cycle SELL-then-BUY application, holding independence, and Main/Routine
independence, use
`00_CANONICAL/REFERENCE/RUNNING_BASE_BUDGET_ADJUSTMENT_REFERENCE.md` together
with sections 20-24 of
`00_CANONICAL/CURRENT/MASTER_SPEC_CANONICAL_2026-08-26_BUDGET_LIMIT_OPERATION_START_CONTRACT_FREEZE.txt`.

For Stock registration search, local Stock Library metadata, the 14-column
registration table, status/classification evidence, one-shot market snapshot,
TOP100 ranking, alphanumeric Stock codes, and the local `일반종목` filter, use
`00_CANONICAL/CURRENT/MASTER_SPEC_CANONICAL_2026-08-24_CURRENT_WINDOW_RESET_STOCK_UI_FINALIZATION.txt`.
That document records current-tree implementation status separately from live
Broker evidence; the ETN `GetCodeListByMarket("60")` membership path remains
pending when it is not present in the current code.

That Current owner also defines AutoTradeSetting right-population scope,
display-mode-aware `종목(N)`, right aggregate/filter parity, badge colors,
shared Stock context menus, Routine Instance clone reuse, and the exact
monitoring-only execution-suppression meaning.

For future PAPER Trading architecture, use
`00_CANONICAL/REFERENCE/PAPER_TRADING_ISOLATED_EXECUTION_DOMAIN_REFERENCE.md`.
It is `PENDING IMPLEMENTATION / ARCHITECTURE DIRECTION APPROVED`; it must not be
read as a completed Production contract or as an alias of monitoring-only.

For these current Operation / ATS / Long-Hold topics, historical post-market
ATS liquidation, restart-first residual Review, and
`BETWEEN -> 매수/매도 inactive` interpretations are SUPERSEDED and DO NOT USE
FOR CURRENT IMPLEMENTATION.

For operation termination interpretation, distinguish state projection from
command authority. Use these contracts in order:

1. `00_CANONICAL/REFERENCE/AGENT_WORKFLOW_REFERENCE.txt`
2. `00_CANONICAL/CURRENT/MASTER_SPEC_CANONICAL_2026-08-12_GUI_CHART_OPERATION_STATE_FREEZE.txt`
3. `00_CANONICAL/CURRENT/MASTER_SPEC_CANONICAL_2026-08-01_CLOSE_PROCESS_OPERATION_CONTRACT.txt`
4. `00_CANONICAL/CURRENT/MASTER_SPEC_CANONICAL_2026-08-02_REVIEW_MANAGEMENT_EMERGENCY_LIFECYCLE.txt`
5. `10_UPDATE/MERGED/UPDATE_20260812_GUI_CHART_OPERATION_STATE_AND_STOP_CONTRACT.txt`

`STOPPED`, `RUNNING`, `운영정지`, and `운영중지` do not by themselves define a
general operation-stop command. Archive and Legacy wording remains historical
evidence only. The current contracts preserve Emergency Stop for forced
interruption and close/liquidation policies for normal completion.

This Reference Index is an index. It is not an AI operating policy document.

## Current Policy References

- Budget / Limit / Current Operation / ATS / Long-Hold Contract Freeze Canonical: `00_CANONICAL/CURRENT/MASTER_SPEC_CANONICAL_2026-08-26_BUDGET_LIMIT_OPERATION_START_CONTRACT_FREEZE.txt`
- Running Base Budget Adjustment Reference: `00_CANONICAL/REFERENCE/RUNNING_BASE_BUDGET_ADJUSTMENT_REFERENCE.md`
- PAPER Trading Isolated Execution Domain Reference: `00_CANONICAL/REFERENCE/PAPER_TRADING_ISOLATED_EXECUTION_DOMAIN_REFERENCE.md`
- Current Conversation Finalization Changelog: `00_CANONICAL/CHANGELOG/MASTER_SPEC_CHANGELOG_2026-08-29_CURRENT_CONVERSATION_FINALIZATION.txt`
- Current Conversation Finalization Work Resume: `00_CANONICAL/CURRENT/WORK_RESUME_LATEST_2026-08-29_CURRENT_CONVERSATION_FINALIZATION.txt`
- Operation Stop Interpretation Clarification Changelog: `00_CANONICAL/CHANGELOG/MASTER_SPEC_CHANGELOG_2026-08-26_OPERATION_STOP_INTERPRETATION_CLARIFICATION.txt`
- Budget / Limit / Operation Start Contract Freeze Work Resume: `00_CANONICAL/CURRENT/WORK_RESUME_LATEST_2026-08-26_BUDGET_LIMIT_OPERATION_START_CONTRACT_FREEZE.txt`
- Budget / Limit / Operation Start Contract Freeze Changelog: `00_CANONICAL/CHANGELOG/MASTER_SPEC_CHANGELOG_2026-08-26_BUDGET_LIMIT_OPERATION_START_CONTRACT_FREEZE.txt`
- High Resolution Price Signal Foundation Freeze Canonical: `00_CANONICAL/CURRENT/MASTER_SPEC_CANONICAL_2026-08-24_HIGH_RESOLUTION_PRICE_SIGNAL_FOUNDATION_FREEZE.txt`
- High Resolution Price Signal Foundation Freeze Work Resume: `00_CANONICAL/CURRENT/WORK_RESUME_LATEST_2026-08-24_HIGH_RESOLUTION_PRICE_SIGNAL_FOUNDATION_FREEZE.txt`
- High Resolution Price Signal Foundation Freeze Changelog: `00_CANONICAL/CHANGELOG/MASTER_SPEC_CHANGELOG_2026-08-24_HIGH_RESOLUTION_PRICE_SIGNAL_FOUNDATION_FREEZE.txt`
- Current Window Reset, Stock Registration, Instrument Metadata, Market Snapshot, And Monitoring UI Finalization: `00_CANONICAL/CURRENT/MASTER_SPEC_CANONICAL_2026-08-24_CURRENT_WINDOW_RESET_STOCK_UI_FINALIZATION.txt`
- Group Lifecycle / Recovery Final Freeze Canonical: `00_CANONICAL/CURRENT/MASTER_SPEC_CANONICAL_2026-08-22_GROUP_LIFECYCLE_RECOVERY_FREEZE.txt`
- Group Lifecycle / Recovery Final Freeze Changelog: `00_CANONICAL/CHANGELOG/MASTER_SPEC_CHANGELOG_2026-08-22_GROUP_LIFECYCLE_RECOVERY_FREEZE.txt`
- Agent workflow and operation rules: `00_CANONICAL/REFERENCE/AGENT_WORKFLOW_REFERENCE.txt`
- Routine / Stock Limit Final Freeze Canonical: `00_CANONICAL/CURRENT/MASTER_SPEC_CANONICAL_2026-08-21_ROUTINE_STOCK_LIMIT_FINAL_FREEZE.txt`
- Routine / Stock Limit Final Freeze Work Resume: `00_CANONICAL/CURRENT/WORK_RESUME_LATEST_2026-08-21_ROUTINE_STOCK_LIMIT_FINAL_FREEZE.txt`
- Routine Engine Handoff Work Resume: `00_CANONICAL/CURRENT/WORK_RESUME_LATEST_2026-08-21_ROUTINE_ENGINE_HANDOFF.txt`
- Routine / Stock Limit Final Freeze Changelog: `00_CANONICAL/CHANGELOG/MASTER_SPEC_CHANGELOG_2026-08-21_ROUTINE_STOCK_LIMIT_FINAL_FREEZE.txt`
- Broker / Market Data Architecture Final Freeze Canonical: `00_CANONICAL/CURRENT/MASTER_SPEC_CANONICAL_2026-08-20_BROKER_MARKET_DATA_ARCHITECTURE_FINAL_FREEZE.txt`
- Broker / Market Data Architecture Final Freeze Work Resume: `00_CANONICAL/CURRENT/WORK_RESUME_LATEST_2026-08-20_BROKER_MARKET_DATA_ARCHITECTURE_FINAL_FREEZE.txt`
- Broker / Market Data Architecture Final Freeze Changelog: `00_CANONICAL/CHANGELOG/MASTER_SPEC_CHANGELOG_2026-08-20_BROKER_MARKET_DATA_ARCHITECTURE_FINAL_FREEZE.txt`
- Kiwoom Broker Integration Phase 0 Official Contract Audit: `30_REPORTS/KIWOOM_BROKER_INTEGRATION_PHASE0_OFFICIAL_CONTRACT_AUDIT_2026-08-19.txt`
- Kiwoom Broker Integration Phase 12 Load/Reconnect Simulation Validation: `30_REPORTS/KIWOOM_BROKER_INTEGRATION_PHASE12_LOAD_RECONNECT_SIMULATION_VALIDATION_2026-08-20.txt`
- Individual Liquidation Time and Long-term Holding Canonical: `00_CANONICAL/CURRENT/MASTER_SPEC_CANONICAL_2026-08-16_INDIVIDUAL_LIQUIDATION_TIME_AND_LONG_HOLD_CONTRACT.txt`
- Global Diagnostic Observer Final Freeze Canonical: `00_CANONICAL/CURRENT/MASTER_SPEC_CANONICAL_2026-08-16_GLOBAL_DIAGNOSTIC_OBSERVER_FINAL_FREEZE.txt`
- Global Diagnostic Observer Final Freeze Work Resume: `00_CANONICAL/CURRENT/WORK_RESUME_LATEST_2026-08-16_GLOBAL_DIAGNOSTIC_OBSERVER_FINAL_FREEZE.txt`
- Global Diagnostic Observer Phase 2 Contract Freeze Canonical: `00_CANONICAL/CURRENT/MASTER_SPEC_CANONICAL_2026-08-16_GLOBAL_DIAGNOSTIC_OBSERVER_PHASE2_CONTRACT_FREEZE.txt`
- Budget Buffer And Event Journal Freeze Canonical: `00_CANONICAL/CURRENT/MASTER_SPEC_CANONICAL_2026-08-16_BUDGET_BUFFER_EVENT_JOURNAL_FREEZE.txt`
- Budget Buffer And Event Journal Freeze Work Resume: `00_CANONICAL/CURRENT/WORK_RESUME_LATEST_2026-08-16_BUDGET_BUFFER_EVENT_JOURNAL_FREEZE.txt`
- Close Action And Buffer Response Freeze Canonical: `00_CANONICAL/CURRENT/MASTER_SPEC_CANONICAL_2026-08-15_CLOSE_ACTION_AND_BUFFER_RESPONSE_FREEZE.txt`
- Close Action And Buffer Response Freeze Work Resume: `00_CANONICAL/CURRENT/WORK_RESUME_LATEST_2026-08-15_CLOSE_ACTION_AND_BUFFER_RESPONSE_FREEZE.txt`
- Budget Semantic Contract Clarification (예산 관련 질문/작업 전 우선 확인): `00_CANONICAL/CURRENT/MASTER_SPEC_CANONICAL_2026-08-14_BUDGET_SEMANTIC_CONTRACT_CLARIFICATION.txt`
- GUI State and Stock Register Context Canonical: `00_CANONICAL/CURRENT/MASTER_SPEC_CANONICAL_2026-08-01_GUI_STATE_AND_STOCK_REGISTER_CONTEXT_CONTRACT.txt`
- GUI State and Stock Register Context Readable Canonical: `00_CANONICAL/CURRENT/MASTER_SPEC_CANONICAL_READABLE_2026-08-01_GUI_STATE_AND_STOCK_REGISTER_CONTEXT_CONTRACT.txt`
- GUI State and Stock Register Context Changelog: `00_CANONICAL/CHANGELOG/MASTER_SPEC_CHANGELOG_2026-08-01_GUI_STATE_AND_STOCK_REGISTER_CONTEXT_CONTRACT.txt`
- PR History Exclusion Policy Changelog: `00_CANONICAL/CHANGELOG/MASTER_SPEC_CHANGELOG_2026-07-28_PR_HISTORY_EXCLUSION_POLICY.txt`
- Close Process Operation Canonical: `00_CANONICAL/CURRENT/MASTER_SPEC_CANONICAL_2026-08-01_CLOSE_PROCESS_OPERATION_CONTRACT.txt`
- Close Process Operation Readable Canonical: `00_CANONICAL/CURRENT/MASTER_SPEC_CANONICAL_READABLE_2026-08-01_CLOSE_PROCESS_OPERATION_CONTRACT.txt`
- Close Process Operation Changelog: `00_CANONICAL/CHANGELOG/MASTER_SPEC_CHANGELOG_2026-08-01_CLOSE_PROCESS_OPERATION_CONTRACT.txt`
- Review Management Emergency Lifecycle Canonical: `00_CANONICAL/CURRENT/MASTER_SPEC_CANONICAL_2026-08-02_REVIEW_MANAGEMENT_EMERGENCY_LIFECYCLE.txt`
- Review Management Emergency Lifecycle Changelog: `00_CANONICAL/CHANGELOG/MASTER_SPEC_CHANGELOG_2026-08-02_REVIEW_MANAGEMENT_EMERGENCY_LIFECYCLE.txt`
- Cleanup Completion Baseline Canonical: `00_CANONICAL/CURRENT/MASTER_SPEC_CANONICAL_2026-08-05_CLEANUP_COMPLETION_BASELINE.txt`
- Cleanup Completion Baseline Work Resume: `00_CANONICAL/CURRENT/WORK_RESUME_LATEST_2026-08-05_CLEANUP_COMPLETION_BASELINE.txt`
- Cleanup Completion Baseline Changelog: `00_CANONICAL/CHANGELOG/MASTER_SPEC_CHANGELOG_2026-08-05_CLEANUP_COMPLETION_BASELINE.txt`
- Cleanup Completion Baseline Readable Changelog: `00_CANONICAL/CHANGELOG/MASTER_SPEC_READABLE_CHANGELOG_2026-08-05_CLEANUP_COMPLETION_BASELINE.txt`
- Legacy Cleanup And Workflow Freeze Canonical: `00_CANONICAL/CURRENT/MASTER_SPEC_CANONICAL_2026-08-06_LEGACY_CLEANUP_AND_WORKFLOW_FREEZE.txt`
- Legacy Cleanup And Workflow Freeze Work Resume: `00_CANONICAL/CURRENT/WORK_RESUME_LATEST_2026-08-06_LEGACY_CLEANUP_AND_WORKFLOW_FREEZE.txt`
- Legacy Cleanup And Workflow Freeze Changelog: `00_CANONICAL/CHANGELOG/MASTER_SPEC_CHANGELOG_2026-08-06_LEGACY_CLEANUP_AND_WORKFLOW_FREEZE.txt`
- Monitoring Evidence And Account Funds Freeze Canonical: `00_CANONICAL/CURRENT/MASTER_SPEC_CANONICAL_2026-08-08_MONITORING_EVIDENCE_AND_ACCOUNT_FUNDS_FREEZE.txt`
- Monitoring Evidence And Account Funds Freeze Work Resume: `00_CANONICAL/CURRENT/WORK_RESUME_LATEST_2026-08-08_MONITORING_EVIDENCE_AND_ACCOUNT_FUNDS_FREEZE.txt`
- Monitoring Evidence And Account Funds Freeze Changelog: `00_CANONICAL/CHANGELOG/MASTER_SPEC_CHANGELOG_2026-08-08_MONITORING_EVIDENCE_AND_ACCOUNT_FUNDS_FREEZE.txt`
- Close, Chart, and Confirmable PnL Work Resume: `00_CANONICAL/CURRENT/WORK_RESUME_LATEST_2026-08-11_CLOSE_CHART_CONFIRMABLE_PNL_FREEZE.txt`
- Close, Chart, and Confirmable PnL Changelog: `00_CANONICAL/CHANGELOG/MASTER_SPEC_CHANGELOG_2026-08-11_CLOSE_CHART_CONFIRMABLE_PNL_FREEZE.txt`
- Main/Settings Shared Operation Freeze Canonical: `00_CANONICAL/CURRENT/MASTER_SPEC_CANONICAL_2026-08-11_MAIN_SETTINGS_SHARED_OPERATION_FREEZE.txt`
- Main/Settings Shared Operation Freeze Work Resume: `00_CANONICAL/CURRENT/WORK_RESUME_LATEST_2026-08-11_MAIN_SETTINGS_SHARED_OPERATION_FREEZE.txt`
- Main/Settings Shared Operation Freeze Changelog: `00_CANONICAL/CHANGELOG/MASTER_SPEC_CHANGELOG_2026-08-11_MAIN_SETTINGS_SHARED_OPERATION_FREEZE.txt`
- GUI Chart And Operation-State Freeze Canonical: `00_CANONICAL/CURRENT/MASTER_SPEC_CANONICAL_2026-08-12_GUI_CHART_OPERATION_STATE_FREEZE.txt`
- GUI Chart And Operation-State Freeze Work Resume: `00_CANONICAL/CURRENT/WORK_RESUME_LATEST_2026-08-12_GUI_CHART_OPERATION_STATE_FREEZE.txt`
- GUI Chart And Operation-State Freeze Changelog: `00_CANONICAL/CHANGELOG/MASTER_SPEC_CHANGELOG_2026-08-12_GUI_CHART_OPERATION_STATE_FREEZE.txt`
- GUI Chart And Operation-State Update: `10_UPDATE/MERGED/UPDATE_20260812_GUI_CHART_OPERATION_STATE_AND_STOP_CONTRACT.txt`
- Operation termination interpretation rule: `00_CANONICAL/REFERENCE/AGENT_WORKFLOW_REFERENCE.txt`
- Monitoring Review Recovery Freeze Work Resume: `00_CANONICAL/CURRENT/WORK_RESUME_LATEST_2026-08-18_MONITORING_REVIEW_RECOVERY_FREEZE.txt`
- Stock Management Review Protection Update: `10_UPDATE/MERGED/UPDATE_20260803_STOCK_MANAGEMENT_REVIEW_PROTECTION_ROUTINE_ASSIGN_REMOVAL.txt`
- AI Architecture Contamination Policy: `20_ARCHIVE/MASTER_SPEC/MASTER_SPEC_CANONICAL_2026-07-15_AI_ARCHITECTURE_CONTAMINATION_POLICY.txt`
- AI Architecture Contamination Changelog: `20_ARCHIVE/CHANGELOG/MASTER_SPEC_CHANGELOG_2026-07-15_AI_ARCHITECTURE_CONTAMINATION_POLICY.txt`
- AI Architecture Contamination Readable Changelog: `20_ARCHIVE/CHANGELOG/MASTER_SPEC_READABLE_CHANGELOG_2026-07-15_AI_ARCHITECTURE_CONTAMINATION_POLICY.txt`
- Runtime / Startup Recovery Canonical: `20_ARCHIVE/MASTER_SPEC/MASTER_SPEC_CANONICAL_2026-07-16_STARTUP_RECOVERY_SESSION_RESUME.txt`
- Current State Resync Canonical: `00_CANONICAL/CURRENT/MASTER_SPEC_CANONICAL_2026-07-17_CURRENT_STATE_RESYNC.txt`
- SELL Preview, Runtime / Queue / SendOrder / Chejan / Fill / Position, Projection / Recovery / Reconciliation / Startup Recovery Living Contracts: sections 11, 12, and 14 of `20_ARCHIVE/MASTER_SPEC/MASTER_SPEC_CANONICAL_2026-07-16_STARTUP_RECOVERY_SESSION_RESUME.txt`
- Historical Cleanup Completion Work Resume: `00_CANONICAL/CURRENT/WORK_RESUME_LATEST_2026-08-05_CLEANUP_COMPLETION_BASELINE.txt`
- Architecture glossary: `00_CANONICAL/REFERENCE/ARCHITECTURE_GLOSSARY.md`

## Legacy Reference Edition

PART01부터 PART09까지의 2026-07-09 Reference Base Canonical 기반 Legacy Reference Edition은 `20_ARCHIVE/REFERENCE_EDITION`에 보관한다.

Legacy PART 파일은 현재 Reference 기준 문서가 아니다. 최신 Canonical과 충돌하면 최신 Canonical을 우선한다.

## Operational Rules

AI operating rules are defined only in `00_CANONICAL/REFERENCE/AGENT_WORKFLOW_REFERENCE.txt`.

This index may point to policy evidence such as Canonical files, but it does not create or override operating rules.

## Validation Rule

Reference Index는 색인이다. 구현 상태, 과거 테스트 수, 과거 진행률, 오래된 다음 작업 설명을 기록하지 않는다.
