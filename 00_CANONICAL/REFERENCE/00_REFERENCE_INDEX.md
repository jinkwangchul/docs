# MASTER_SPEC Reference Index

Reference Edition

- Reference Base Canonical: MASTER_SPEC_CANONICAL_2026-07-09_RUNTIME_APPLY_PREVIEW_EXECUTION_PREVIEW_ORCHESTRATOR.txt
- Latest Official Canonical: MASTER_SPEC_CANONICAL_2026-07-16_STARTUP_RECOVERY_SESSION_RESUME.txt
- Latest Work Resume: WORK_RESUME_LATEST_2026-07-16_STARTUP_RECOVERY_SESSION_RESUME.txt
- Latest Changelog: MASTER_SPEC_CHANGELOG_2026-07-16_STARTUP_RECOVERY_SESSION_RESUME.txt
- Latest Readable Changelog: MASTER_SPEC_READABLE_CHANGELOG_2026-07-16_STARTUP_RECOVERY_SESSION_RESUME.txt


## Source of Truth

1. Latest user instruction
2. Latest file in `00_CANONICAL/CURRENT`
3. `00_CANONICAL/REFERENCE/AGENT_WORKFLOW_REFERENCE.txt`
4. This Reference Index
5. Legacy PART files only when the latest Canonical does not supersede them

## Current Policy References

- Agent workflow and operation rules: `00_CANONICAL/REFERENCE/AGENT_WORKFLOW_REFERENCE.txt`
- AI Architecture Contamination Policy: `00_CANONICAL/CURRENT/MASTER_SPEC_CANONICAL_2026-07-15_AI_ARCHITECTURE_CONTAMINATION_POLICY.txt`
- AI Architecture Contamination Changelog: `00_CANONICAL/CHANGELOG/MASTER_SPEC_CHANGELOG_2026-07-15_AI_ARCHITECTURE_CONTAMINATION_POLICY.txt`
- AI Architecture Contamination Readable Changelog: `00_CANONICAL/CHANGELOG/MASTER_SPEC_READABLE_CHANGELOG_2026-07-15_AI_ARCHITECTURE_CONTAMINATION_POLICY.txt`
- Runtime / Startup Recovery Canonical: `00_CANONICAL/CURRENT/MASTER_SPEC_CANONICAL_2026-07-16_STARTUP_RECOVERY_SESSION_RESUME.txt`
- SELL Preview, Runtime / Queue / SendOrder / Chejan / Fill / Position, Projection / Recovery / Reconciliation / Startup Recovery Living Contracts: sections 11, 12, and 14 of `00_CANONICAL/CURRENT/MASTER_SPEC_CANONICAL_2026-07-16_STARTUP_RECOVERY_SESSION_RESUME.txt`
- Latest Work Resume: `00_CANONICAL/CURRENT/WORK_RESUME_LATEST_2026-07-16_STARTUP_RECOVERY_SESSION_RESUME.txt`
- Architecture glossary: `00_CANONICAL/REFERENCE/ARCHITECTURE_GLOSSARY.md`

## Reference Edition Files

PART01부터 PART09까지는 2026-07-09 Reference Base Canonical 기반 Legacy Reference Edition이다.

- `PART01_SYSTEM_FOUNDATION.md`
- `PART02_RUNTIME.md`
- `PART02_06_RUNTIME_FILTER_ENGINE.md`
- `PART03_GUI.md`
- `PART04_ROUTINE.md`
- `PART05_RULE_APPROVAL.md`
- `PART06_EXECUTION_PREVIEW.md`
- `PART07_RUNTIME_COMMIT.md`
- `PART08_OPERATION_POLICY.md`
- `PART09_APPENDIX.md`

Legacy PART 파일은 최신 Canonical과 충돌하면 최신 Canonical을 우선한다.

## Operational Rules

Implementation First와 구조 감사는 충돌하지 않는다.

- 일반 구현: Implementation First 우선
- 구조 오염 위험: AI Architecture Contamination Policy 우선

구조 오염 위험은 신규 계층, 상태, writer, Source of Truth, production call graph, lifecycle owner 변경 또는 기존 책임 반복이 있을 때 발생한다.

## Validation Rule

Reference Index는 색인이다. 구현 상태, 과거 테스트 수, 과거 진행률, 오래된 다음 작업 설명을 기록하지 않는다.
