# PART02_05_RUNTIME

Reference Edition Subpart

Original Canonical: MASTER_SPEC_CANONICAL_2026-07-09_RUNTIME_COMMIT_BOUNDARY.txt

Source Full Part: PART02_RUNTIME.md

생성일: 2026-07-09

주의: 본 문서는 AI 참조용 하위 분할본이며 공식 원본은 CURRENT의 Canonical이다.

Original Body Marker: START
--------------------------------------------------
==================================================
02.20~02.28 Runtime Commit Boundary (상세 규격)
==================================================

02.20 Runtime Commit Boundary

목적
- Execution Preview Orchestrator 이후, Real Runtime Commit 이전에 위치하는
  런타임 커밋 적격성 검증, 계약 준비, 안전 게이트, 리뷰를 담당하는 경계 계층이다.
- 실제 runtime write 직전 마지막 Preview/검증/승인 Boundary로 기능한다.

위치 규칙
- Execution Preview Orchestrator 이후
- Real Runtime Commit 이전
- Execution Commit Preview와 Execution Runtime Apply Preview 사이에 삽입하지 않는다.
- Runtime Apply Preview는 중복 생성하지 않는다.

입력/출력
- 입력: execution_preview_orchestrator_result, runtime_snapshot_candidate, commit_plan_candidate
- 출력: commit_boundary_decision, commit_eligibility, contract_plan, safety_gate_result, review_result

02.21 Runtime Commit Eligibility

정의
- Runtime Commit Boundary에 진입할 수 있는 자격 요건이다.

요건
- execution_orchestrator_decision == ORCHESTRATOR_READY
- preview_safety_flags 전체 False
- runtime_write == False (현재까지 write 없음)
- previous_commit_success == True 또는 첫 커밋
- no_pending_rollback == True
- no_conflicting_commit_in_progress == True

Eligibility 평가 결과
- ELIGIBLE: 모든 요건 충족
- NOT_ELIGIBLE: 하나 이상 요건 위반, 사유 포함

02.22 Runtime Commit Contract

정의
- Runtime Commit Boundary에서 실행될 커밋 계획의 계약 문서이다.
- Atomic Apply Plan, Verification Plan, Rollback Plan으로 구성된다.

구성 요소
- Atomic Apply Plan: 단일 트랜잭션 단위의 적용 계획
- Verification Plan: 적용 후 검증 계획
- Rollback Plan: 롤백 계획

정책
- Atomic Apply Plan은 독립 Preview Layer가 아니라 Runtime Commit Contract 내부 구성이다.
- Contract는 read-only 검증 후에만 실행 가능 상태로 전환된다.

02.23 Atomic Apply Plan

정의
- 단일 트랜잭션으로 적용될 런타임 변경 계획이다.

포함 항목
- target_runtime_files: 적용 대상 파일 목록
- changed_fields_candidate: 변경 필드 후보
- apply_order: 적용 순서
- atomic: True (전체 적용 또는 전체 롤백)

제약
- partial_apply 허용하지 않음
- write는 Contract 승인 후 단일 계층에서만 수행

02.24 Verification Plan

정의
- Atomic Apply 실행 후 결과 검증 계획이다.

포함 항목
- verification_targets: 검증 대상
- verification_method: 검증 방법
- pass_criteria: 통과 기준
- failure_action: 실패 시 조치

정책
- 검증 실패 시 자동 Rollback으로 전환

02.25 Rollback Plan

정의
- Atomic Apply 실행 전/후 문제 발생 시 롤백 계획이다.

포함 항목
- rollback_trigger: 롤백 트리거 조건
- rollback_target: 롤백 대상
- rollback_method: 롤백 방법
- rollback_verification: 롤백 후 검증

정책
- Rollback은 Runtime Commit Boundary 계층에서만 계획한다.
- 실제 Rollback 실행은 별도 승인 계층에서 수행한다.

02.26 Runtime Commit Safety Gate

정의
- Runtime Commit Contract 실행 직전 안전성을 최종 검증하는 게이트이다.

검증 항목
- contract_integrity: Contract 무결성
- atomic_apply_plan_validity: Atomic Apply Plan 유효성
- verification_plan_completeness: Verification Plan 완전성
- rollback_plan_readiness: Rollback Plan 준비 상태
- preview_safety_flags: 모든 safety flags False
- runtime_write_still_false: write 아직 없음

게이트 결과
- PASS: 모든 검증 통과, 다음 계층으로 진행 가능
- FAIL: 검증 실패, 사유 포함, 실행 중단

정책
- Runtime Commit Dry-run은 독립 Layer가 아니라 Safety Gate / Review 내부 검증 성격으로 둔다.

02.27 Runtime Commit Review

정의
- Runtime Commit Boundary 실행 결과를 검토하는 계층이다.

포함 항목
- review_target: 검토 대상 결과
- review_criteria: 검토 기준
- review_evidence: 검토 증빙
- review_decision: 승인/반려/재검토

정책
- Runtime Commit Result Review는 별도 Preview Layer가 아니라 Runtime Commit Review로 단순화한다.
- Review 결과는 다음 커밋 또는 아키텍처 단계의 입력으로 사용한다.

02.28 Preview 안전선 (Runtime Commit Boundary)

필수 safety flags
- runtime_write=False
- position_write=False
- balance_write=False
- gui_update_called=False
- send_order_called=False
- chejan_called=False
- execution_commit_allowed=False
- runtime_apply_allowed=False

금지선
- 실제 runtime write 금지
- 실제 position/balance write 금지
- 실제 Runtime Commit 수행 금지
- 실제 Runtime Apply 수행 금지
- GUI update 호출 금지
- SendOrder 호출 금지
- Chejan 호출 금지
- rules.json write 금지
- SQLite write 금지

==================================================
02.29 M6 Runtime Commit Core (Runtime Commit Core Completion)
==================================================

M6 Runtime Commit Core는 Runtime Commit Boundary 계약을 기반으로 실제 Runtime Commit 수행에 필요한 핵심 구성요소를 구현한다.

02.29.1 Runtime Commit Transaction Contract (M6-11, runtime_commit_transaction_contract.py)
- 원자적 적용 계획(Atomic Apply Plan) 포함
- 검증 계획(Verification Plan) 포함
- 롤백 계획(Rollback Plan) 포함
- 계약 위반 시 커밋 진입 차단

02.29.2 Runtime Commit Transaction Persistence (M6-13, runtime_commit_transaction_persistence.py)
- 커밋 상태 영속화 담당
- Runtime Commit Boundary preview_only 상태와 분리하여 실제 상태 기록

02.29.3 Runtime Commit Guard (M6-14, runtime_commit_guard.py)
- 실행 전 안전 게이트
- Real Executor 진입 여부 결정
- 금지선/보호 파일 위반 시 차단

02.29.4 Runtime Commit Approval Token Store (M6-15, runtime_commit_approval_token_store.py)
- 승인 토큰 발급/검증 담당
- 커밋 승인 무결성 보장

02.29.5 Runtime Commit Real Executor (M6-16, runtime_commit_real_executor.py)
- 실제 Runtime Commit 수행 핵심 구성요소
- Guard 연동: 실행 전 안전 게이트 통과 확인
- Approval Token Store 연동: 승인 토큰 검증
- Persistence 연동: 커밋 상태 영속화
- Recovery Journal 연동: 커밋 복구 이력 기록

02.29.6 Runtime Commit Recovery Journal (M6-17, runtime_commit_recovery_journal.py)
- 커밋 복구 이력 기록 담당
- 장애 발생 시 복구 기준 제공

실행 흐름
1. Gate 결과 검증 (gate_result.gate_status == APPROVED)
2. Transaction Manifest 식별 (commit_id, transaction_id)
3. Guard 평가 및 Lock 획득 (acquire_runtime_commit_lock)
4. Approval Token 검증 (read_runtime_commit_approval_token + validate)
5. 대상 파일 Backup (복사본 저장)
6. Atomic Write (write_json_atomic)
7. Post-write Verify (verify_runtime_commit)
8. 성공 시 Token Consume (consume_runtime_commit_approval_token)
9. Lock Release (release_runtime_commit_lock)

실패 처리
- Write 전 실패 → ABORTED
- Write 후 Verify 실패 → ROLLED_BACK (백업 복원)
- Rollback 실패 → MANUAL_RESTORE_REQUIRED
- Lock 중복/토큰 소비됨 → BLOCKED

구현 위치
- kiwoom_auto 프로젝트 runtime_commit_*.py

검증
- 구현 커밋: kiwoom_auto master 649127c
- py_compile: runtime_commit_*.py 12개 + tests/test_runtime_commit_*.py 14개 통과
- 전체 unittest: 3409 tests OK
- 보호 파일 변경 없음 (runtime/*.json, routines/*/rules.json)

금지선 (유지)
- runtime/*.json write 금지
- routines/*/rules.json write 금지
- SQLite write 금지
- 실제 Broker/Order Router/SendOrder/Chejan/GUI 연결 금지
- 실제 Runtime Commit/Apply 수행 금지
- preview_only=True 유지

다음 단계
- M6 이후 Runtime Commit 실제 적용 계층 연결 검토
- Runtime Commit Core 단위 통합 테스트/부하 검증
- 운영 매뉴얼 §20 Development Execution Policy 실제 적용 점검

--------------------------------------------------
Original Body Marker: END

---

Reference Navigation

- Previous: PART02_04_RUNTIME.md
- Next: PART03_01_GUI.md
- INDEX: 00_REFERENCE_INDEX.md
- Original Canonical: ../CURRENT/MASTER_SPEC_CANONICAL_2026-07-09_RUNTIME_COMMIT_BOUNDARY.txt