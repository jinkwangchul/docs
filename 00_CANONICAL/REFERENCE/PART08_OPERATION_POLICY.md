# PART08_OPERATION_POLICY

Reference Edition

Original Canonical: MASTER_SPEC_CANONICAL_2026-07-08_RUNTIME_LAYER_PHASE1_RUNTIME_PROJECTION_MERGED.txt

생성일: 2026-07-09

주의: 본 문서는 AI 참조용 분할본이며 공식 원본은 CURRENT의 Canonical이다.

Part Summary: 29.x Execution cross-reference for Runtime Layer Phase1 flow and preview safety summary.

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


Original Body Marker: END

---

Reference Navigation

- Previous PART: PART07_EXECUTION_CONTROLLER.md
- Next PART: PART09_APPENDIX.md
- INDEX: 00_REFERENCE_INDEX.md
- Original Canonical: ../CURRENT/MASTER_SPEC_CANONICAL_2026-07-08_RUNTIME_LAYER_PHASE1_RUNTIME_PROJECTION_MERGED.txt
