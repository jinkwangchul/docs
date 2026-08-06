# MASTER_SPEC Reference Index

Reference Edition

- Reference Base Canonical: MASTER_SPEC_CANONICAL_2026-07-09_RUNTIME_APPLY_PREVIEW_EXECUTION_PREVIEW_ORCHESTRATOR.txt
- Latest Official Canonical: MASTER_SPEC_CANONICAL_2026-08-06_LEGACY_CLEANUP_AND_WORKFLOW_FREEZE.txt
- Latest Operational Work Resume: WORK_RESUME_LATEST_2026-08-06_LEGACY_CLEANUP_AND_WORKFLOW_FREEZE.txt
- Cleanup Completion Baseline Work Resume: WORK_RESUME_LATEST_2026-08-05_CLEANUP_COMPLETION_BASELINE.txt
- Latest Changelog: MASTER_SPEC_CHANGELOG_2026-08-06_LEGACY_CLEANUP_AND_WORKFLOW_FREEZE.txt
- Latest Readable Changelog: MASTER_SPEC_READABLE_CHANGELOG_2026-08-05_CLEANUP_COMPLETION_BASELINE.txt


## Source of Truth

1. Latest user instruction
2. `00_CANONICAL/REFERENCE/AGENT_WORKFLOW_REFERENCE.txt` for AI operating rules
3. Latest file in `00_CANONICAL/CURRENT` for project technical contracts
4. Actual local code, Runtime files, logs, and execution evidence for implementation state
5. Legacy PART files only when the latest Canonical does not supersede them

For 조기마감, 자동마감, 청산정책, 마감정책, and 즉시청산, use
`00_CANONICAL/CURRENT/MASTER_SPEC_CANONICAL_2026-08-01_CLOSE_PROCESS_OPERATION_CONTRACT.txt`
as the first technical Source of Truth. Archive and Legacy files are historical
evidence only for this area. If they conflict with Current Canonical, Current
Canonical wins. If UI terminology and document terminology conflict, the
confirmed UI term wins.

This Reference Index is an index. It is not an AI operating policy document.

## Current Policy References

- Agent workflow and operation rules: `00_CANONICAL/REFERENCE/AGENT_WORKFLOW_REFERENCE.txt`
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
- Latest Operational Work Resume: `00_CANONICAL/CURRENT/WORK_RESUME_LATEST_2026-08-06_LEGACY_CLEANUP_AND_WORKFLOW_FREEZE.txt`
- Stock Management Review Protection Update: `10_UPDATE/MERGED/UPDATE_20260803_STOCK_MANAGEMENT_REVIEW_PROTECTION_ROUTINE_ASSIGN_REMOVAL.txt`
- AI Architecture Contamination Policy: `20_ARCHIVE/MASTER_SPEC/MASTER_SPEC_CANONICAL_2026-07-15_AI_ARCHITECTURE_CONTAMINATION_POLICY.txt`
- AI Architecture Contamination Changelog: `20_ARCHIVE/CHANGELOG/MASTER_SPEC_CHANGELOG_2026-07-15_AI_ARCHITECTURE_CONTAMINATION_POLICY.txt`
- AI Architecture Contamination Readable Changelog: `20_ARCHIVE/CHANGELOG/MASTER_SPEC_READABLE_CHANGELOG_2026-07-15_AI_ARCHITECTURE_CONTAMINATION_POLICY.txt`
- Runtime / Startup Recovery Canonical: `20_ARCHIVE/MASTER_SPEC/MASTER_SPEC_CANONICAL_2026-07-16_STARTUP_RECOVERY_SESSION_RESUME.txt`
- Current State Resync Canonical: `00_CANONICAL/CURRENT/MASTER_SPEC_CANONICAL_2026-07-17_CURRENT_STATE_RESYNC.txt`
- Latest Official Canonical: `00_CANONICAL/CURRENT/MASTER_SPEC_CANONICAL_2026-08-06_LEGACY_CLEANUP_AND_WORKFLOW_FREEZE.txt`
- SELL Preview, Runtime / Queue / SendOrder / Chejan / Fill / Position, Projection / Recovery / Reconciliation / Startup Recovery Living Contracts: sections 11, 12, and 14 of `20_ARCHIVE/MASTER_SPEC/MASTER_SPEC_CANONICAL_2026-07-16_STARTUP_RECOVERY_SESSION_RESUME.txt`
- Latest Work Resume: `00_CANONICAL/CURRENT/WORK_RESUME_LATEST_2026-08-06_LEGACY_CLEANUP_AND_WORKFLOW_FREEZE.txt`
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
