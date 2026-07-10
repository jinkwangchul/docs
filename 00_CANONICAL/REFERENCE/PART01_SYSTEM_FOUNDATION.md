# PART01_SYSTEM_FOUNDATION

Reference Edition

Original Canonical: MASTER_SPEC_CANONICAL_2026-07-09_RUNTIME_APPLY_PREVIEW_EXECUTION_PREVIEW_ORCHESTRATOR.txt

생성일: 2026-07-09

주의: 본 문서는 AI 참조용 분할본이며 공식 원본은 CURRENT의 Canonical이다.

Part Summary: Canonical preface and Runtime Apply Preview / Execution Preview Orchestrator integration summary

Original Body Marker: START
MASTER_SPEC_CANONICAL_2026-07-09_RUNTIME_APPLY_PREVIEW_EXECUTION_PREVIEW_ORCHESTRATOR

작성일: 2026-07-09

원본 업데이트:
- 10_UPDATE/INBOX/UPDATE_20260708_LIFECYCLE_RUNTIME_PROJECTION.txt
- 10_UPDATE/INBOX/UPDATE_20260708_RUNTIME_LAYER_PHASE1_PROJECTION_PERSISTENCE_RECOVERY_RECONCILIATION.txt
- 10_UPDATE/MERGED/UPDATE_20260709_RUNTIME_APPLY_PREVIEW_EXECUTION_PREVIEW_ORCHESTRATOR.txt

참고 기준 Canonical:
- 00_CANONICAL/CURRENT/MASTER_SPEC_CANONICAL_2026-07-08_RUNTIME_LAYER_PHASE1_RUNTIME_PROJECTION_MERGED.txt

요약
본 문서는 Runtime Layer Phase 1 관련 두 건의 UPDATE 문서(Projection 규격 초안, Phase1 구현/프리뷰 규격)와
Runtime Apply Preview/Gate Pipeline 및 Execution Preview Phase1/Phase2/Orchestrator 관련 UPDATE 문서를 하나의 Canonical 규격으로 통합한 결과물이다.
통합 원칙에 따라 Projection 규격(데이터 모델, Projection 스키마, fills → positions → balances 계산 규칙, idempotency, 트리거/검증/테스트 시나리오)은 그대로 유지되며,
Phase1 UPDATE의 Projection / Persistence Preview / Recovery Preview / Reconciliation Preview / Preview Safety / Runtime Layer 구조 / 구현 파일 목록 및 테스트 항목을 함께 포함한다.
추가로 Runtime Apply Preview/Gate Pipeline(적용 후보 검토 및 실행 준비 게이팅), Execution Preview Phase1(실행 트랜잭션/브로커 연계 후보 검토),
Execution Preview Phase2(최종 승인/디스패치/커밋/런타임 적용 후보 검토), Execution Preview Orchestrator(11단계 단일 진입점 오케스트레이션)를 포함한다.
또한 운영/AI 협업 정책(3모델 역할 재정의)과 구현 검증 부록(커밋 hash, 테스트 수, 보호 파일 검증, 금지선)을 포함한다.
이 파일은 새로운 Canonical 산출물로서 02_Runtime_Data_Model, 29.x Execution, 운영/AI 협업 정책, 부록 장에 반영될 상세/요약 규격을 포함한다. 기존 Canonical 파일은 직접 수정하지 않았다.


Original Body Marker: END

---

Reference Navigation

- Previous PART: (none)
- Next PART: PART02_RUNTIME.md
- INDEX: 00_REFERENCE_INDEX.md
- Original Canonical: ../CURRENT/MASTER_SPEC_CANONICAL_2026-07-09_RUNTIME_APPLY_PREVIEW_EXECUTION_PREVIEW_ORCHESTRATOR.txt
