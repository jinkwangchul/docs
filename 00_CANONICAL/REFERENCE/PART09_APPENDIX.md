# PART09_APPENDIX

Reference Edition

Original Canonical: MASTER_SPEC_CANONICAL_2026-07-09_RUNTIME_APPLY_PREVIEW_EXECUTION_PREVIEW_ORCHESTRATOR.txt

생성일: 2026-07-09

주의: 본 문서는 AI 참조용 분할본이며 공식 원본은 CURRENT의 Canonical이다.

Part Summary: Appendix: implementation commits, tests, protected files, prohibition lines

Original Body Marker: START
==================================================
부록: 구현 기준/참조
==================================================

기준 구현 커밋(참고)
- Runtime Projection: 50f84ec34f9fd586a7f7d26006777521d6cffece
- Runtime Persistence Preview: c816c1092ba30e5a72fea51f275671ec414ea517
- Runtime Recovery Preview: c6ebafe702cf7bae90b8522fa7f9c1504b822e7a
- Runtime Reconciliation Preview: 27806cd55a377e17e706efea49778e0d1727ce8f
- Runtime Apply Preview/Gate Pipeline: 8ec129e
- Execution Preview Phase1: 9b7ed52
- Execution Preview Phase2: cd4b2d9
- Execution Preview Orchestrator: (작업 완료 보고 기준 커밋 hash 반영 — 미확정)

검토 및 테스트 기록(권장)
- Projection 계층 테스트: runtime projection 후보 계산과 preview safety flag 검증
- Persistence/Recovery/Reconciliation Preview 테스트: 실제 파일 write 없이 preview-only 결과 생성 검증
- Runtime Apply Preview/Gate Pipeline 테스트: preview_only=True, runtime_write=False 등 safety flag 유지 검증
- Execution Preview Phase1 테스트: 실제 Broker/Order Router/SendOrder/Chejan 연결 없이 후보 생성 및 READY/BLOCKED/INVALID 상태 고정 검증
- Execution Preview Phase2 테스트: execution_allowed=False, dispatch_allowed=False, execution_commit_allowed=False, runtime_apply_allowed=False 유지 검증
- Execution Preview Orchestrator 테스트: 11단계 순차 호출, 중간 BLOCKED/INVALID 중단, ORCHESTRATOR_READY는 모든 단계 READY일 때만 생성 검증
- 통합 테스트: 전체 흐름(Preview → Apply Preview/Gate → Execution Preview Orchestrator)에서 safety flags 유지 여부 검증

테스트 결과
- 최신 전체 unittest: 2844 tests OK

보호 파일 변경 없음
- runtime/order_queue.json
- runtime/order_executions.json
- runtime/order_locks.json
- routines/*/rules.json

금지선 명시
- runtime/*.json write 금지
- routines/*/rules.json write 금지
- SQLite write 금지
- 실제 Broker 연결 금지
- 실제 Order Router 연결 금지
- 실제 SendOrder 호출 금지
- 실제 Chejan 연결 금지
- GUI 연결 금지
- 실제 Execution/Dispatch/Commit/Runtime Apply 실행 금지

주의 사항
- 본 Canonical 파일은 Runtime Layer Phase1 UPDATE와 Runtime Apply Preview/Execution Preview Orchestrator UPDATE를 Canonical 형식으로 통합한 결과물이다. 기존 Canonical/Reference 파일은 직접 수정하지 않았으며,
  실제 MASTER_SPEC 반영(정식 승인 및 반영 절차)은 별도의 승인/검토 프로세스를 거쳐야 한다.

끝.

Original Body Marker: END

---

Reference Navigation

- Previous PART: PART08_OPERATION_POLICY.md
- Next PART: (none)
- INDEX: 00_REFERENCE_INDEX.md
- Original Canonical: ../CURRENT/MASTER_SPEC_CANONICAL_2026-07-09_RUNTIME_APPLY_PREVIEW_EXECUTION_PREVIEW_ORCHESTRATOR.txt
