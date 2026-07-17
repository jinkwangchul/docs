# PART08_OPERATION_POLICY

Reference Edition

Original Canonical: MASTER_SPEC_CANONICAL_2026-07-09_RUNTIME_APPLY_PREVIEW_EXECUTION_PREVIEW_ORCHESTRATOR.txt

생성일: 2026-07-09

주의: 본 문서는 AI 참조용 분할본이며 공식 원본은 CURRENT의 Canonical이다.

Part Summary: 운영/AI 협업 정책: 3모델 역할 재정의

Original Body Marker: START
==================================================
운영/AI 협업 정책
==================================================

정책 목적
- MASTER_SPEC 반영 범위 결정 및 구현/검증 작업을 수행하는 AI 모델 간 역할을 재정의하여
  책임 소재를 명확히 하고 금지선/보호 파일 준수를 안정적으로 유지한다.

3모델 협업 역할 재정의

- ChatGPT:
  - 로직 설계
  - 계층 설계
  - 작업 범위 결정
  - MASTER_SPEC 반영 범위 지정
- Kilo / 일반 코드 모델:
  - 1차 구현
  - 반복 Preview 모듈 생성
  - 테스트 작성
  - Git commit/push 가능
- Codex:
  - 검증
  - 실패 원인 분석
  - 오류 수정
  - 테스트 안정화
  - 구조 검토
- Codex는 기본 구현 담당으로 고정하지 않는다.
- Git commit/push는 Codex 전담이 아니다.

운영 원칙
- 모든 모델은 runtime/*.json write 금지, routines/*/rules.json write 금지, SQLite write 금지를 준수한다.
- 모든 모델은 실제 Broker/Order Router/SendOrder/Chejan/GUI 연결 및 실제 Execution/Dispatch/Commit/Runtime Apply 실행을 금지한다.
- 작업 범위와 반영 위치는 ChatGPT가 지정한 MASTER_SPEC 반영 범위를 기준으로 한다.


Original Body Marker: END

---

Reference Navigation

- Previous PART: PART07_EXECUTION_CONTROLLER.md
- Next PART: PART09_APPENDIX.md
- INDEX: 00_REFERENCE_INDEX.md
- Original Canonical: ../CURRENT/MASTER_SPEC_CANONICAL_2026-07-09_RUNTIME_APPLY_PREVIEW_EXECUTION_PREVIEW_ORCHESTRATOR.txt
