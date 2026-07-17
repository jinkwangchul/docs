# PART02 03 RUNTIME

Reference Edition Subpart

Original Canonical: MASTER_SPEC_CANONICAL_2026-07-09_RUNTIME_APPLY_PREVIEW_EXECUTION_PREVIEW_ORCHESTRATOR.txt

Source Full Part: PART02_RUNTIME.md

생성일: 2026-07-09

주의: 본 문서는 AI 참조용 하위 분할본이며 공식 원본은 CURRENT의 Canonical이다.

Original Body Marker: START
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
Original Body Marker: END

---

Reference Navigation

- Next: PART02_04_RUNTIME.md
- Full PART: PART02_RUNTIME.md
- INDEX: 00_REFERENCE_INDEX.md
- Original Canonical: ../CURRENT/MASTER_SPEC_CANONICAL_2026-07-09_RUNTIME_APPLY_PREVIEW_EXECUTION_PREVIEW_ORCHESTRATOR.txt
