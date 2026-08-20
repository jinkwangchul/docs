# MASTER_SPEC Reference Index

Reference Edition

- Reference Base Canonical: MASTER_SPEC_CANONICAL_2026-07-09_RUNTIME_APPLY_PREVIEW_EXECUTION_PREVIEW_ORCHESTRATOR.txt
- Latest Official Canonical: MASTER_SPEC_CANONICAL_2026-08-21_ROUTINE_STOCK_LIMIT_FINAL_FREEZE.txt
- Latest Operational Work Resume: WORK_RESUME_LATEST_2026-08-21_ROUTINE_ENGINE_HANDOFF.txt
- Cleanup Completion Baseline Work Resume: WORK_RESUME_LATEST_2026-08-05_CLEANUP_COMPLETION_BASELINE.txt
- Latest Changelog: MASTER_SPEC_CHANGELOG_2026-08-21_ROUTINE_STOCK_LIMIT_FINAL_FREEZE.txt
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

For BrokerSession, connection_epoch, TR provenance/Governor, screen allocation,
market-data authority, Execution Universe, stock registration/roster, and
restart/reconnect architecture, use
`00_CANONICAL/CURRENT/MASTER_SPEC_CANONICAL_2026-08-20_BROKER_MARKET_DATA_ARCHITECTURE_FINAL_FREEZE.txt`.
This supplemental Canonical does not supersede the independent Current
Canonical contracts for Global Diagnostic Observer, Budget/Buffer,
Close/Liquidation, Review/Emergency, Main monitoring UI, or charts.

This Reference Index is an index. It is not an AI operating policy document.

## Current Policy References

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
