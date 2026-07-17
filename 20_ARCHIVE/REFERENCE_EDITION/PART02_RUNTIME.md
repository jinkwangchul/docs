# PART02_RUNTIME

Reference Edition

Original Canonical: MASTER_SPEC_CANONICAL_2026-07-09_RUNTIME_APPLY_PREVIEW_EXECUTION_PREVIEW_ORCHESTRATOR.txt

생성일: 2026-07-09

주의: 본 문서는 AI 참조용 분할본이며 공식 원본은 CURRENT의 Canonical이다.

Part Summary: 02_Runtime_Data_Model: Runtime Projection, Persistence/Recovery/Reconciliation Preview, Preview Safety, Runtime Apply Preview/Gate Pipeline

Original Body Marker: START
==================================================
02_Runtime_Data_Model
==================================================

02.10 Runtime Projection (상세 규격)

목적
- runtime 데이터(positions, fills, balances 등)로부터 Projection을 통해 후보 Position/Balance 상태를 계산하여
  Recovery/Audit/Review 절차에서 근거로 사용할 수 있도록 일관된 규칙을 제공한다.

적용 범위
- runtime/positions.json, runtime/fills.json, runtime/order_executions.json, runtime/review_items.json
- Recovery 시점 Projection 재계산, 주기적 Projection(운영 sanity check), Projection 결과 검증

데이터 모델(요약)
- positions: position_id, code, holding_qty, available_qty, avg_price, realized_pnl, source_fill_ids
- fills: fill_id, order_id, execution_id, quantity, price, kiwoom_order_no, created_at
- balances: account_id, cash, reserved_cash, updated_at

Projection 스키마(출력 후보)
- projected_position_candidate: { position_id, code, holding_qty, available_qty, avg_price, realized_pnl, source_fill_ids }
- projected_balance_candidate: { account_id, cash, reserved_cash, updated_at }
- projected_runtime_state_candidate: (필요 시 전체 runtime snapshot 후보)
- projection_status: { ok | mismatch | invalid }
- projection_evidence: 관련 fill/evidence 목록
- preview_safety_flags: 안전선 플래그 집합(아래 참조)

Projection 계산 원칙
- Projection은 Fill 이벤트를 근거로 Position을 재구성한다.
- 기본 알고리즘: fills 그룹화 → fill 합산 → 종목별 holding_qty/realized_pnl 재계산 → positions 상태 후보 생성
- fills의 정렬/처리 순서는 created_at, execution_id, fill_id 등의 deterministic 키를 사용하여 결정적(Deterministic) 결과를 보장한다.

Idempotency
- 각 fill은 고유한 fill_id를 가진다. 동일 fill_id가 재처리되더라도 Projection 출력은 동일해야 한다.
- Projection 실행 시 이미 적용된 source_fill_ids를 추적하여 중복 적용을 방지한다.

트리거와 타이밍
- 즉시 Projection: 재시작 복구, evidence 기반 finalize 작업 시 즉시 실행.
- 주기적 Projection: 운영 중 1분 등 주기(운영 정책에 따름)으로 sanity check를 실행하여 runtime 불일치 탐지.

검증 및 불일치 처리
- 검증 항목:
  (a) positions와 fills 합계 정합성 (총 매수·매도 수량 합계 일치)
  (b) Kiwoom(브로커) 잔고와 balances 일치 여부
  (c) duplicate evidence / duplicate fill 탐지
- 불일치 시 처리:
  (a) Audit Log에 상세 기록
  (b) 복구 플래그 설정 및 Review Management(검토관리)로 이관

복구(Recovery) 절차(Projection 관점)
- 재시작 복구 시: 최신 journal/history 및 transitions 를 이용해 마지막 정상 시점 이후의 fill을 식별
  → 발견된 fills를 deterministic 순서로 재적용하여 Projection 수행
- 자동/수동 복구 정책: 자동 복구는 위험도가 낮은 범위에서만 허용하며 Review 기준을 만족해야 자동 적용 가능

테스트 케이스(권장)
- 재시작 후 Projection 재계산(부분체결 포함) 검증
- duplicate fill / duplicate evidence 처리 검증
- executor 실패로 인한 aborted 상태에서 Projection 재시도 검증

02.11 Runtime Persistence Preview

정의 및 목적
- Projection 결과를 실제 runtime 파일에 쓰기 전, 저장 후보와 저장 계획을 검토하기 위한 preview 계층이다.

입력/출력
- 입력: runtime projection result, projected position candidate, projected balance candidate, runtime snapshot candidate
- 출력: persistence preview result, persistence plan candidate, target runtime file candidate, changed field candidate, blocked/invalid reason, preview safety flags

정책
- Persistence Preview는 실제 파일 저장을 수행하지 않는다. runtime file write는 Runtime Commit Executor 계층에서만 수행해야 한다.
- Persistence Preview 결과는 Review 또는 Commit 후보로만 전달한다.

안전성 검토 항목
- 어떤 필드가 변경되는지, 변경 범위(종목별/전체), 변경으로 인한 외부 영향(예: GUI/SendOrder 연계) 여부

02.12 Runtime Recovery Preview

정의 및 목적
- runtime 상태가 없거나 불완전하거나 재시작 후 재구성이 필요한 상황에서 복구 후보를 계산하는 계층.

입력/출력
- 입력: runtime projection result, persistence preview result, runtime snapshot candidate, lifecycle/evidence history candidate
- 출력: recovery preview result, recovery candidate, recoverable 여부, blocked/invalid reason, recovery evidence, preview safety flags

정책
- Recovery Preview는 자동 복구 commit이 아니다. 실제 runtime 파일 생성/수정은 수행하지 않는다.

02.13 Runtime Reconciliation Preview

정의 및 목적
- projection, persistence, recovery 결과와 기존 runtime 기준(또는 외부 브로커 잔고) 사이의 불일치를 검토하고 조정 후보를 제시하는 계층.

입력/출력
- 입력: runtime projection result, persistence preview result, recovery preview result, runtime snapshot candidate, external balance/broker 기준 후보
- 출력: reconciliation preview result, mismatch list, reconciliation candidate, review_required 여부, blocked/invalid reason, preview safety flags

정책
- Reconciliation Preview는 자동 보정 계층이 아니다. 불일치가 있어도 runtime 파일을 직접 수정하지 않는다.

02.14 Preview 안전선 (Preview Safety)

필수 safety flags
- runtime_write=False
- position_write=False
- balance_write=False
- gui_update_called=False
- send_order_called=False
- chejan_called=False

금지선
- runtime write 금지
- position write 금지
- balance write 금지
- GUI update 호출 금지
- SendOrder 호출 금지
- Chejan 호출 금지
- rules.json write 금지
- runtime/*.json write 금지
- 자동 복구 commit 금지
- 자동 reconciliation commit 금지

설계 원칙 요약(02 장)
- Projection은 계산/후보 생성 계층이며, Persistence/Recovery/Reconciliation Preview는 write를 수행하지 않는 안전한 검토 계층이다.

02.15 Runtime Apply Preview/Gate Pipeline

정의 및 목적
- Runtime Layer Phase1(Persistence/Recovery/Reconciliation Preview) 이후, 실제 runtime 반영 직전에 적용 후보를 검토하고
  실행 준비 상태를 게이팅하는 Preview 전용 보호 계층이다.

반영 항목
- Runtime Apply Engine Contract
- Runtime Apply Engine
- Runtime Transaction Preview
- Runtime File Writer Preview
- Runtime State Commit Preview
- Runtime Synchronizer Preview
- Runtime Execution Readiness Gate Preview

핵심 정책
- 전 단계 preview_only=True
- runtime_write=False
- position_write=False
- balance_write=False
- audit_write=False
- file_write_called=False
- backup_created=False
- rollback_executed=False
- gui_update_called=False
- send_order_called=False
- chejan_called=False
- 실제 runtime/rules write 없음

계약 방향
- Runtime Apply Engine은 실제 write를 수행하지 않는다. 모든 단계는 preview_only=True 로 실행된다.
- Runtime Transaction Preview는 적용 트랜잭션 후보를 구성하되 커밋하지 않는다.
- Runtime File Writer Preview는 대상 파일 후보와 변경 필드 후보만 생성한다.
- Runtime State Commit Preview는 커밋 후보 상태를 계산하되 실제 상태를 갱신하지 않는다.
- Runtime Synchronizer Preview는 동기화 후보를 계산하되 외부/GUI 동기화를 호출하지 않는다.
- Runtime Execution Readiness Gate Preview는 모든 safety flag가 False일 때만 READY 후보를 생성한다.

권장 실행 흐름
Runtime Projection
↓
Runtime Persistence Preview
↓
Runtime Recovery Preview
↓
Runtime Reconciliation Preview
↓
Runtime Apply Engine (preview_only)
↓
Runtime Transaction Preview
↓
Runtime File Writer Preview
↓
Runtime State Commit Preview
↓
Runtime Synchronizer Preview
↓
Runtime Execution Readiness Gate Preview (READY 후보)

교차참조
- 29.x Execution: Execution Preview Phase1/Phase2/Orchestrator (런타임 적용 후보는 Execution Runtime Apply Preview와 연계)
- 부록: 구현 커밋/테스트/보호 파일 검증


Original Body Marker: END

---

Reference Navigation

- Previous PART: PART01_SYSTEM_FOUNDATION.md
- Next PART: PART03_GUI.md
- INDEX: 00_REFERENCE_INDEX.md
- Original Canonical: ../CURRENT/MASTER_SPEC_CANONICAL_2026-07-09_RUNTIME_APPLY_PREVIEW_EXECUTION_PREVIEW_ORCHESTRATOR.txt
