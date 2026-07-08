# PART02 02 RUNTIME

Reference Edition Subpart

Original Canonical: MASTER_SPEC_CANONICAL_2026-07-08_RUNTIME_LAYER_PHASE1_RUNTIME_PROJECTION_MERGED.txt

Source Full Part: PART02_RUNTIME.md

생성일: 2026-07-09

주의: 본 문서는 AI 참조용 하위 분할본이며 공식 원본은 CURRENT의 Canonical이다.

Original Body Marker: START
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

Original Body Marker: END

---

Reference Navigation

- Previous: PART02_01_RUNTIME.md
- Next: PART02_03_RUNTIME.md
- Full PART: PART02_RUNTIME.md
- INDEX: 00_REFERENCE_INDEX.md
- Original Canonical: ../CURRENT/MASTER_SPEC_CANONICAL_2026-07-08_RUNTIME_LAYER_PHASE1_RUNTIME_PROJECTION_MERGED.txt
