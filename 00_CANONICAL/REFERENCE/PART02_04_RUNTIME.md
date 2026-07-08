# PART02 04 RUNTIME

Reference Edition Subpart

Original Canonical: MASTER_SPEC_CANONICAL_2026-07-08_RUNTIME_LAYER_PHASE1_RUNTIME_PROJECTION_MERGED.txt

Source Full Part: PART02_RUNTIME.md

생성일: 2026-07-09

주의: 본 문서는 AI 참조용 하위 분할본이며 공식 원본은 CURRENT의 Canonical이다.

Original Body Marker: START
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


Original Body Marker: END

---

Reference Navigation

- Previous: PART02_03_RUNTIME.md
- Next: PART02_RUNTIME.md
- Full PART: PART02_RUNTIME.md
- INDEX: 00_REFERENCE_INDEX.md
- Original Canonical: ../CURRENT/MASTER_SPEC_CANONICAL_2026-07-08_RUNTIME_LAYER_PHASE1_RUNTIME_PROJECTION_MERGED.txt
