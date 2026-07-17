# PART02 04 RUNTIME

Reference Edition Subpart

Original Canonical: MASTER_SPEC_CANONICAL_2026-07-09_RUNTIME_APPLY_PREVIEW_EXECUTION_PREVIEW_ORCHESTRATOR.txt

Source Full Part: PART02_RUNTIME.md

생성일: 2026-07-09

주의: 본 문서는 AI 참조용 하위 분할본이며 공식 원본은 CURRENT의 Canonical이다.

Original Body Marker: START
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

- Next: PART03_01_GUI.md
- Full PART: PART02_RUNTIME.md
- INDEX: 00_REFERENCE_INDEX.md
- Original Canonical: ../CURRENT/MASTER_SPEC_CANONICAL_2026-07-09_RUNTIME_APPLY_PREVIEW_EXECUTION_PREVIEW_ORCHESTRATOR.txt
