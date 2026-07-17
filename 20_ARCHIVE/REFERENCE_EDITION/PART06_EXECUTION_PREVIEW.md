# PART06_EXECUTION_PREVIEW

Reference Edition

Original Canonical: MASTER_SPEC_CANONICAL_2026-07-09_RUNTIME_APPLY_PREVIEW_EXECUTION_PREVIEW_ORCHESTRATOR.txt

생성일: 2026-07-09

주의: 본 문서는 AI 참조용 분할본이며 공식 원본은 CURRENT의 Canonical이다.

Part Summary: 29.x Execution: Execution Preview Phase1/Phase2/Orchestrator

Original Body Marker: START
==================================================
29.x Execution (요약 및 교차참조)
==================================================

29.x.1 Runtime Layer Phase 1 요약

목적
- Lifecycle 처리가 생성한 상태 후보를 runtime에 즉시 쓰지 않고 Preview 계층으로 분리하여
  저장/복구/조정 가능성 및 안전성을 사전 검토하는 보호 계층을 제공한다.

핵심 방향
- runtime state를 즉시 write하지 않고 projection/persistence/recovery/reconciliation preview 결과로 분리한다.
- position, balance, runtime 파일 변경은 Runtime Commit Executor 등 별도 commit 계층에서만 수행한다.
- GUI update, SendOrder, Chejan 호출 등 외부 연계 호출은 Phase 1에서 수행하지 않는다.

권장 실행 흐름
Lifecycle / Evidence Review Result
↓
Runtime Projection
↓
Runtime Persistence Preview
↓
Runtime Recovery Preview
↓
Runtime Reconciliation Preview
↓
Runtime Commit 후보 또는 Review 후보

교차참조
- 02_Runtime_Data_Model: Projection 상세 규격, Persistence/Recovery/Reconciliation Preview 상세
- 04_Implementation_Test_Verification: 테스트 시나리오 및 검증 기준

29.x.2 구현 파일(추천)
- lifecycle_runtime_projection.py  -- lifecycle/fill/evidence 기반 runtime projection 후보 계산
- lifecycle_runtime_persistence.py -- projection 결과의 저장 가능성 및 persistence plan preview
- lifecycle_runtime_recovery.py    -- runtime 재구성/복구 후보 preview
- lifecycle_runtime_reconciliation.py -- 불일치/조정 후보 preview

29.x.3 테스트 파일(추천)
- tests/test_lifecycle_runtime_projection.py
- tests/test_lifecycle_runtime_persistence.py
- tests/test_lifecycle_runtime_recovery.py
- tests/test_lifecycle_runtime_reconciliation.py

29.x.4 MASTER_SPEC 반영 위치(권고)
- 세부 규격: 02_Runtime_Data_Model (Runtime Projection, Persistence/Recovery/Reconciliation Preview, 데이터 계약, preview safety flags)
- 운영/운용 요약: 29.x Execution (Phase 1 요약, Execution ↔ Runtime Layer 교차참조)

29.x.5 Preview 안전성 및 실행 금지선(요약)
- Preview 실행은 항상 preview safety flags를 포함해야 하며, 모든 preview 단계에서 runtime_write=False 등의 금지선이 준수되어야 한다.

29.x.6 Execution Preview Phase1

목적
- 실제 주문 실행 전, 실행 트랜잭션과 브로커 연계 후보를 검토하는 Preview 전용 계층.

반영 항목
- Execution Transaction Contract
- Execution Engine Preview
- Broker Adapter Contract Preview
- Order Router Contract Preview
- SendOrder Contract Preview
- SendOrder Call Preview
- SendOrder Result Review Preview

핵심 정책
- 실제 Broker 연결 금지
- 실제 Order Router 연결 금지
- 실제 SendOrder 호출 금지
- 실제 Chejan 연결 금지
- 실행 결과 기록/recorder 호출 금지
- READY/BLOCKED/INVALID 상태 계약 고정

계약 방향
- Execution Engine Preview는 실행 트랜잭션 후보를 구성하되 실제 실행을 수행하지 않는다.
- Broker Adapter Contract Preview는 브로커 어댑터 후보 인터페이스를 정의하되 실제 연결을 수행하지 않는다.
- Order Router Contract Preview는 라우팅 후보를 계산하되 실제 라우터에 전달하지 않는다.
- SendOrder Contract Preview는 주문 후보 페이로드를 구성하되 실제 SendOrder를 호출하지 않는다.
- SendOrder Call Preview는 호출 후보 단계를 기록하되 send_order_called=False 를 유지한다.
- SendOrder Result Review Preview는 결과 후보를 검토하되 recorder/Chejan 연결을 수행하지 않는다.
- 모든 단계는 READY/BLOCKED/INVALID 상태 계약을 고정하여 반환한다.

29.x.7 Execution Preview Phase2

목적
- Phase1 결과를 바탕으로 최종 승인/디스패치/커밋/런타임 적용 후보를 검토하는 Preview 전용 계층.

반영 항목
- Execution Final Approval Preview
- Execution Dispatcher Preview
- Execution Commit Preview
- Execution Runtime Apply Preview

핵심 정책
- 실제 승인 처리 금지
- 실제 dispatch 금지
- 실제 execution commit 금지
- 실제 runtime apply 금지
- execution_allowed=False
- dispatch_allowed=False
- execution_commit_allowed=False
- runtime_apply_allowed=False

계약 방향
- Execution Final Approval Preview는 최종 승인 후보를 계산하되 실제 승인 처리를 수행하지 않는다.
- Execution Dispatcher Preview는 디스패치 후보를 구성하되 실제 dispatch를 수행하지 않는다.
- Execution Commit Preview는 실행 커밋 후보를 계산하되 실제 execution commit을 수행하지 않는다.
- Execution Runtime Apply Preview는 런타임 적용 후보를 계산하되 실제 runtime apply를 수행하지 않는다.

29.x.8 Execution Preview Orchestrator

목적
- 기존 Execution Phase1 + Phase2 11단계 체인을 단일 진입점에서 순차 호출하는 오케스트레이션 계층.

반영 항목
- Execution Preview Orchestrator
- 기존 Execution Phase1 + Phase2 11단계 체인을 단일 진입점에서 순차 호출
- 중간 BLOCKED/INVALID 발생 시 이후 단계 중단
- orchestrator_steps
- orchestrator_summary
- final_orchestrator_decision

핵심 정책
- 신규 세부 Preview 계층 추가 없이 기존 체인 통합
- 기존 모듈 status/safety flag 집계
- ORCHESTRATOR_READY는 모든 단계 READY일 때만 생성
- execution_allowed=False
- runtime_write=False
- send_order_called=False

계약 방향
- Orchestrator는 단일 진입점에서 Phase1(7단계) + Phase2(4단계) = 11단계를 순차 호출한다.
- 각 단계는 status(READY/BLOCKED/INVALID)와 safety flag를 반환한다.
- 중간 단계에서 BLOCKED 또는 INVALID가 발생하면 이후 단계 호출을 중단한다.
- orchestrator_steps는 각 단계의 이름/status/flag 집계를 기록한다.
- orchestrator_summary는 전체 진행 요약을 기록한다.
- final_orchestrator_decision은 모든 단계 READY일 때만 ORCHESTRATOR_READY를 생성한다.
- Orchestrator는 실제 실행/디스패치/커밋/런타임 적용을 수행하지 않는다.


Original Body Marker: END

---

Reference Navigation

- Previous PART: PART05_RULE_APPROVAL.md
- Next PART: PART07_EXECUTION_CONTROLLER.md
- INDEX: 00_REFERENCE_INDEX.md
- Original Canonical: ../CURRENT/MASTER_SPEC_CANONICAL_2026-07-09_RUNTIME_APPLY_PREVIEW_EXECUTION_PREVIEW_ORCHESTRATOR.txt
