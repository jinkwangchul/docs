# PART02 01 RUNTIME

Reference Edition Subpart

Original Canonical: MASTER_SPEC_CANONICAL_2026-07-09_RUNTIME_APPLY_PREVIEW_EXECUTION_PREVIEW_ORCHESTRATOR.txt

Source Full Part: PART02_RUNTIME.md

생성일: 2026-07-09

주의: 본 문서는 AI 참조용 하위 분할본이며 공식 원본은 CURRENT의 Canonical이다.

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
Original Body Marker: END

---

Reference Navigation

- Next: PART02_02_RUNTIME.md
- Full PART: PART02_RUNTIME.md
- INDEX: 00_REFERENCE_INDEX.md
- Original Canonical: ../CURRENT/MASTER_SPEC_CANONICAL_2026-07-09_RUNTIME_APPLY_PREVIEW_EXECUTION_PREVIEW_ORCHESTRATOR.txt
