# MASTER_SPEC AI Reference Edition Index (SELL Runtime Commit Pipeline + Workflow v2 Edition)

Reference Edition

Reference Base Canonical: MASTER_SPEC_CANONICAL_2026-07-09_RUNTIME_APPLY_PREVIEW_EXECUTION_PREVIEW_ORCHESTRATOR.txt
Latest Official Canonical: MASTER_SPEC_CANONICAL_2026-07-14_SELL_RUNTIME_COMMIT_PIPELINE.txt
Latest Work Resume: WORK_RESUME_LATEST_2026-07-14.txt
Latest Changelog: MASTER_SPEC_CHANGELOG_2026-07-14_SELL_RUNTIME_COMMIT_PIPELINE.txt
Latest Readable Changelog: MASTER_SPEC_READABLE_CHANGELOG_2026-07-14_SELL_RUNTIME_COMMIT_PIPELINE.txt
Latest kiwoom_auto master: 16a1c6b06fe139ac6ef0aa4ef071cf93464227dc

생성일: 2026-07-13

주의: 본 문서는 AI 참조용 분할본이며 공식 원본은 CURRENT의 Canonical이다.

## Reference 구조

이 디렉터리는 Runtime Commit Core + M7 Lifecycle Runtime Commit + RSI Buy Filter Reference Edition을 유지하면서, 최신 SELL Runtime Commit Pipeline + Workflow v2 + Engine Ownership Canonical 위치를 함께 안내한다.
공식 Source of Truth는 00_CANONICAL/CURRENT의 최신 Canonical이다.
PART01~PART09는 2026-07-09 Canonical 기반의 Legacy Reference Edition이며, 최신 2026-07-13 Canonical 전체와 일치하는 분할본으로 간주하지 않는다.
Workflow v2 및 SELL Runtime Commit Pipeline 최신 상태는 최신 Canonical과 AGENT_WORKFLOW_REFERENCE를 직접 참조한다.
2026-07-14 기준 SELL Runtime Commit Execution Plan까지 master에 반영되었으며, 다음 작업은 SELL Runtime Commit Real Executor Preview / Commit Boundary Review이다. 실제 Runtime Write는 사용자 명시 승인 전까지 금지한다.
PART02_06_RUNTIME_FILTER_ENGINE.md는 후속 Runtime/Filter 보조 Reference이며 PART01~PART09 재조립 대상이 아니다.

원본 순서 보존 방식:

- PART01부터 PART09까지 Original Body Marker 사이의 본문을 순서대로 이어 붙이면 원본 Canonical 본문과 일치한다.
- PART02_RUNTIME.md는 Runtime 상세 규격 우선 참조 위치이다.
- PART06_EXECUTION_PREVIEW.md는 29.x Execution(Execution Preview Phase1/Phase2/Orchestrator) 상세 위치이다.
- PART08_OPERATION_POLICY.md는 Legacy Reference이며, 현재 공식 역할 기준은 AGENT_WORKFLOW_REFERENCE.txt를 따른다.
- PART01부터 PART05의 하위 SUBPART는 기존 SUBPART 체계를 유지하기 위한 AI 우선 참조 파일이다.
- 원본 Canonical에 본문이 없는 예약 PART/SUBPART는 Original Body Marker 사이가 비어 있다.
- 각 PART와 SUBPART의 header/footer는 Reference Edition 안내와 탐색 링크이며 원본 Canonical 본문이 아니다.

## PART 목록

| PART | 포함 섹션 | 파일 크기 |
|---|---|---:|
| PART01_SYSTEM_FOUNDATION.md | Canonical preface and Runtime Apply Preview / Execution Preview Orchestrator integration summary | 2688 bytes |
| PART02_RUNTIME.md | 02_Runtime_Data_Model: Runtime Projection, Persistence/Recovery/Reconciliation Preview, Preview Safety, Runtime Apply Preview/Gate Pipeline, Runtime Commit Boundary | 7236 bytes |
| PART03_GUI.md | Reserved; no original body assigned | 618 bytes |
| PART04_ROUTINE.md | Reserved; no original body assigned | 624 bytes |
| PART05_RULE_APPROVAL.md | Reserved; no original body assigned | 638 bytes |
| PART06_EXECUTION_PREVIEW.md | 29.x Execution: Execution Preview Phase1/Phase2/Orchestrator | 6792 bytes |
| PART07_EXECUTION_CONTROLLER.md | Reserved; no original body assigned | 654 bytes |
| PART08_OPERATION_POLICY.md | Legacy operation policy reference; current role policy is AGENT_WORKFLOW_REFERENCE.txt | 1895 bytes |
| PART09_APPENDIX.md | Appendix: implementation commits, tests, protected files, prohibition lines | 3208 bytes |
| PART02_06_RUNTIME_FILTER_ENGINE.md | Runtime Commit Architecture, Filter Engine, RSI Buy Filter | NEW |

## SUBPART 목록

| SUBPART | Source Full Part | 순서 | 파일 크기 | 참조 기준 |
|---|---|---:|---:|---|
| PART01_01_SYSTEM_FOUNDATION.md | PART01_SYSTEM_FOUNDATION.md | 1/4 | 857 bytes | AI 우선 참조 |
| PART01_02_SYSTEM_FOUNDATION.md | PART01_SYSTEM_FOUNDATION.md | 2/4 | 991 bytes | AI 우선 참조 |
| PART01_03_SYSTEM_FOUNDATION.md | PART01_SYSTEM_FOUNDATION.md | 3/4 | 1552 bytes | AI 우선 참조 |
| PART01_04_SYSTEM_FOUNDATION.md | PART01_SYSTEM_FOUNDATION.md | 4/4 | 1233 bytes | AI 우선 참조 |
| PART02_01_RUNTIME.md | PART02_RUNTIME.md | 1/5 | 3196 bytes | AI 우선 참조 |
| PART02_02_RUNTIME.md | PART02_RUNTIME.md | 2/5 | 3222 bytes | AI 우선 참조 |
| PART02_03_RUNTIME.md | PART02_RUNTIME.md | 3/5 | 2145 bytes | AI 우선 참조 |
| PART02_04_RUNTIME.md | PART02_RUNTIME.md | 4/5 | 2129 bytes | AI 우선 참조 |
| PART02_05_RUNTIME.md | PART02_RUNTIME.md | 5/5 | 2412 bytes | AI 우선 참조 (Runtime Commit Boundary) |
| PART02_06_RUNTIME_FILTER_ENGINE.md | PART02_RUNTIME.md | 신규 | - | Runtime Commit Architecture / RSI Filter |
| PART03_01_GUI.md | PART03_GUI.md | 1/5 | 604 bytes | AI 우선 참조 |
| PART03_02_GUI.md | PART03_GUI.md | 2/5 | 604 bytes | AI 우선 참조 |
| PART03_03_GUI.md | PART03_GUI.md | 3/5 | 604 bytes | AI 우선 참조 |
| PART03_04_GUI.md | PART03_GUI.md | 4/5 | 604 bytes | AI 우선 참조 |
| PART03_05_GUI.md | PART03_GUI.md | 5/5 | 608 bytes | AI 우선 참조 |
| PART04_01_ROUTINE.md | PART04_ROUTINE.md | 1/4 | 620 bytes | AI 우선 참조 |
| PART04_02_ROUTINE.md | PART04_ROUTINE.md | 2/4 | 620 bytes | AI 우선 참조 |
| PART04_03_ROUTINE.md | PART04_ROUTINE.md | 3/4 | 620 bytes | AI 우선 참조 |
| PART04_04_ROUTINE.md | PART04_ROUTINE.md | 4/4 | 626 bytes | AI 우선 참조 |
| PART05_01_RULE_APPROVAL.md | PART05_RULE_APPROVAL.md | 1/4 | 644 bytes | AI 우선 참조 |
| PART05_02_RULE_APPROVAL.md | PART05_RULE_APPROVAL.md | 2/4 | 644 bytes | AI 우선 참조 |
| PART05_03_RULE_APPROVAL.md | PART05_RULE_APPROVAL.md | 3/4 | 644 bytes | AI 우선 참조 |
| PART05_04_RULE_APPROVAL.md | PART05_RULE_APPROVAL.md | 4/4 | 624 bytes | AI 우선 참조 |

## 주요 위치

- Runtime Apply Preview/Gate Pipeline 요약: PART01_SYSTEM_FOUNDATION.md
- 02.10~02.15 Runtime Projection / Persistence / Recovery / Reconciliation / Preview Safety / Runtime Apply Preview/Gate: PART02_01~04_RUNTIME.md
- 02.20~02.28 Runtime Commit Boundary: PART02_05_RUNTIME.md
- 02.29~02.30 Runtime Commit Architecture / Filter Engine: PART02_06_RUNTIME_FILTER_ENGINE.md
- 29.x.1~29.x.8 Execution Preview Phase1/Phase2/Orchestrator: PART06_EXECUTION_PREVIEW.md
- 운영/AI 협업 정책: current role policy is AGENT_WORKFLOW_REFERENCE.txt; PART08_OPERATION_POLICY.md is Legacy Reference
- Workflow v2 (Pull Request & Agent Operation Policy, Workflow Priority): AGENT_WORKFLOW_REFERENCE.txt section 17.1
- SELL Runtime Commit Pipeline latest Canonical: 00_CANONICAL/CURRENT/MASTER_SPEC_CANONICAL_2026-07-14_SELL_RUNTIME_COMMIT_PIPELINE.txt
- BUY Budget Increase Policy Revision: 00_CANONICAL/CURRENT/MASTER_SPEC_CANONICAL_2026-07-14_SELL_RUNTIME_COMMIT_PIPELINE.txt section 14
- SELL Preview 작업 재개 기준: 00_CANONICAL/CURRENT/WORK_RESUME_LATEST_2026-07-14.txt
- SELL Runtime Commit Pipeline Changelog: 00_CANONICAL/CHANGELOG/MASTER_SPEC_CHANGELOG_2026-07-14_SELL_RUNTIME_COMMIT_PIPELINE.txt
- SELL Runtime Commit Pipeline Readable Changelog: 00_CANONICAL/CHANGELOG/MASTER_SPEC_READABLE_CHANGELOG_2026-07-14_SELL_RUNTIME_COMMIT_PIPELINE.txt
- 구현 커밋/테스트/보호 파일/금지선 부록: PART09_APPENDIX.md
- 아키텍처 용어 해석 기준: ARCHITECTURE_GLOSSARY.md

## AI 세션 참조 순서

1. README.md
2. AI_PROJECT_OPERATION_MANUAL_RELEASE_v1.2.md
3. AI_SESSION_START_PROTOCOL.md
4. AGENT_WORKFLOW_REFERENCE
5. ARCHITECTURE_GLOSSARY
6. 00_CANONICAL/REFERENCE/00_REFERENCE_INDEX.md
7. Workflow v2 (Pull Request & Agent Operation Policy, Workflow Priority) 확인 시 AGENT_WORKFLOW_REFERENCE section 17.1
8. Runtime 상세 규격 확인 시 PART02_RUNTIME.md 또는 PART02 SUBPART
9. Execution Preview 교차참조 확인 시 PART06_EXECUTION_PREVIEW.md
10. 운영/AI 협업 정책 확인 시 PART08_OPERATION_POLICY.md
11. SELL Runtime Commit Pipeline / Workflow v2 / Engine Ownership latest state -> 00_CANONICAL/CURRENT/MASTER_SPEC_CANONICAL_2026-07-14_SELL_RUNTIME_COMMIT_PIPELINE.txt
12. 필요한 경우 00_CANONICAL/CURRENT/MASTER_SPEC_CANONICAL_2026-07-10_M7_LIFECYCLE_RUNTIME_COMMIT_RSI_BUY_FILTER.txt
13. 10_UPDATE/MERGED
14. 00_CANONICAL/CHANGELOG
15. 20_ARCHIVE

## Runtime Commit Core 위치 안내

M6 Runtime Commit Core Completion(Contract / Persistence / Guard / Approval Token Store / Recovery Journal 및 과거 공통 Real Executor 기반 모듈)은
kiwoom_auto 프로젝트 master e5ef4bc 기준으로 구현되었다.

- 완료 범위: 과거 M6-11~M6-17 공통 Runtime Commit Core 기반
- 범위 제한: 현재 SELL 전용 Runtime Commit Real Executor 및 실제 Runtime Write 연결은 미완료
- 구현 커밋: kiwoom_auto master e5ef4bc
- 전체 unittest: 3492 tests OK
- 보호 파일 변경 없음

## M7 Lifecycle Runtime Commit 위치 안내

M7 Lifecycle Runtime Commit(Lifecycle Commit Service → Builder → Adapter → Real Executor 연결, Adapter/Builder 신규 추가, Real Executor 계약 무결성 강화, E2E 계약 검증)은
kiwoom_auto 프로젝트 master e5ef4bc에 구현 완료되었다.

- 완료 범위: M7 Lifecycle Runtime Commit 연결 전체(Service 라우팅, Adapter, Builder, Real Executor 무결성, E2E 테스트)
- 신규 파일: lifecycle_runtime_commit_adapter.py, lifecycle_runtime_commit_builder.py
- Service 라우팅: lifecycle_commit_service.commit_lifecycle() → Builder(build_lifecycle_runtime_commit_adapter_request) → Adapter(adapt_and_execute_lifecycle_runtime_commit) → Real Executor
- 계약 무결성 강화: runtime_commit_real_executor.py(매니페스트 identity 검증, 저널 append 실패 차단, lock_released 추적)
- E2E 검증: test_lifecycle_runtime_commit_end_to_end.py
- 구현 커밋: kiwoom_auto master e5ef4bc
- 전체 unittest: 3492 tests OK
- 보호 파일 변경 없음

## Filter 구현률 위치 안내

RSI Buy Filter는 routines/지표추종매매/routine_macd_engine.py의 _evaluate_buy_rsi_filter()에 구현되어 있다(공식 설정 경로: buy.filters.rsi, pending UI 후보값은 실행 결과에 영향 없음).
Filter 구현률은 MASTER_SPEC_CANONICAL_2026-07-10_M7_LIFECYCLE_RUNTIME_COMMIT_RSI_BUY_FILTER.txt의 "현재 필터 구현률" 섹션을 참조한다.

## SELL Runtime Commit Pipeline 위치 안내

SELL Runtime Commit Pipeline은 kiwoom_auto master 16a1c6b06fe139ac6ef0aa4ef071cf93464227dc 기준 다음 단계까지 완료되었다.

- SELL Method Preview
- SELL Exit Policy Preview
- SELL Completion Policy Preview
- SELL Pending Policy Preview
- SELL Order Candidate Preview
- SELL Order Candidate Inspector
- SELL REAL_READY Authorization Preview
- SELL Execution Contract Preview
- SELL REAL_READY Adapter Preview
- SELL Common Execution Preview Adapter
- SELL Execution Readiness Preview
- SELL Signal Gate Preview
- SELL Execution Queue Preview
- SELL Execution Full Preview Orchestrator
- SELL Runtime Commit Preview
- SELL Runtime Commit Validator
- SELL Runtime Commit Dry-run Executor
- SELL Runtime Commit Approval Gate
- SELL Runtime Commit Execution Plan

현재 SELL Runtime Commit Pipeline은 Execution Plan까지 완료되었으며, 다음 작업은 SELL Runtime Commit Real Executor Preview / Commit Boundary Review부터 시작한다.

다음 기준:

1. Runtime Commit Boundary Review
2. Real Executor Preview 설계
3. Runtime file writer contract 검토
4. Queue commit boundary 검토
5. 실제 Runtime Write는 사용자 명시 승인 전까지 금지

## 검증 기준

- 원본 Canonical 수정 금지
- 원본 Canonical 삭제 금지
- Reference Edition 본문 요약 금지
- Reference Edition 본문 생략 금지
- Reference Edition 본문 순서 변경 금지
- Reference Edition 본문 문장 수정 금지
- PART01~PART09는 각 파일 헤더에 지정된 2026-07-09 Reference Base Canonical을 기준으로 검증한다.
- 줄바꿈 형식(CRLF/LF)을 정규화한 후 본문 일치 여부를 검증한다.
- PART02_06_RUNTIME_FILTER_ENGINE.md는 재조립 대상에서 제외한다.
- 최신 2026-07-13 Canonical과의 문자 수 일치는 보장하지 않는다.

## 재생성 검증 결과

- 검증 상태: 일치
- 2026-07-09 Reference Base Canonical 정규화 문자 수: 14593
- PART01~PART09 Original Body 재조립본 정규화 문자 수: 14593
- 문자 수 차이: 0
- 최초 불일치 위치: 없음
- 완전 일치 여부: True
- PART02_06_RUNTIME_FILTER_ENGINE.md 재조립 대상 포함 여부: False
- 최신 2026-07-13 Canonical과의 문자 수 일치 보장 여부: False
