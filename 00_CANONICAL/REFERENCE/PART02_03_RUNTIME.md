# PART02 03 RUNTIME

Reference Edition Subpart

Original Canonical: MASTER_SPEC_CANONICAL_2026-07-08_RUNTIME_LAYER_PHASE1_RUNTIME_PROJECTION_MERGED.txt

Source Full Part: PART02_RUNTIME.md

생성일: 2026-07-09

주의: 본 문서는 AI 참조용 하위 분할본이며 공식 원본은 CURRENT의 Canonical이다.

Original Body Marker: START
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

Original Body Marker: END

---

Reference Navigation

- Previous: PART02_02_RUNTIME.md
- Next: PART02_04_RUNTIME.md
- Full PART: PART02_RUNTIME.md
- INDEX: 00_REFERENCE_INDEX.md
- Original Canonical: ../CURRENT/MASTER_SPEC_CANONICAL_2026-07-08_RUNTIME_LAYER_PHASE1_RUNTIME_PROJECTION_MERGED.txt
