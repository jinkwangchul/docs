# PART02 01 RUNTIME

Reference Edition Subpart

Original Canonical: MASTER_SPEC_CANONICAL_2026-07-08_RUNTIME_LAYER_PHASE1_RUNTIME_PROJECTION_MERGED.txt

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

Original Body Marker: END

---

Reference Navigation

- Next: PART02_02_RUNTIME.md
- Full PART: PART02_RUNTIME.md
- INDEX: 00_REFERENCE_INDEX.md
- Original Canonical: ../CURRENT/MASTER_SPEC_CANONICAL_2026-07-08_RUNTIME_LAYER_PHASE1_RUNTIME_PROJECTION_MERGED.txt
