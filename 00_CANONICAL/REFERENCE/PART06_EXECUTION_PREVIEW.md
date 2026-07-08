# PART06_EXECUTION_PREVIEW

Reference Edition

Original Canonical: MASTER_SPEC_CANONICAL_2026-07-08_EXECUTION_SENDORDER_CHEJAN_LIFECYCLE_PIPELINE.txt

생성일: 2026-07-08

주의: 본 문서는 AI 참조용 분할본이며 공식 원본은 CURRENT의 Canonical이다.

Part Summary: Includes 29.6 Execution Preview Pipeline Complete.

Original Body Marker: START
29.6 Execution Preview Pipeline Complete
============================================================

기준일: 2026-07-07
상태: Execution Preview Pipeline Phase 완료 반영
반영 범위:
- 이번 대화에서 명시된 Execution Preview Pipeline Phase 구현 완료 내용.
- Queue Review부터 EXECUTION_COMPLETE까지의 Preview Pipeline 계층.
- 각 계층의 역할, 계약, Identity 전달 정책, Contract Test 정책, Preview-only E2E Contract.
- 실제 Runtime Commit, Queue Commit, GUI 반영, SendOrder 호출은 포함하지 않는다.

반영 원칙:
- 기존 MASTER_SPEC 구조와 번호 체계를 유지한다.
- 기존 내용을 삭제하거나 축약하지 않는다.
- 기존 문장을 변경하지 않는다.
- 필요한 섹션만 추가한다.
- 구현되지 않은 내용, TODO, 예정, 추정, 예시는 넣지 않는다.

29.6.1 Execution Preview Pipeline 전체 구조
------------------------------------------------------------
Execution Preview Pipeline Phase의 공식 구조는 다음 순서를 따른다.

Queue Review
↓
SendOrder Preview Adapter
↓
Final Send Gate
- Readiness Policy
- Input Adapter
- Orchestrator
- Open Policy
- Call Orchestrator
↓
SendOrder EntryPoint
- Open Policy
- Orchestrator
↓
Broker Dispatch
- Open Policy
- Orchestrator
↓
Broker Result Review
↓
Broker Result Record
- Readiness Policy
- Orchestrator
↓
Runtime Status Update
- Readiness Policy
- Orchestrator
↓
Queue Status Update
- Readiness Policy
- Orchestrator
↓
Lock Release
- Readiness Policy
- Orchestrator
↓
Post Execution Review
↓
EXECUTION_COMPLETE

정책:
- 위 흐름은 Execution Preview Pipeline의 완료 상태를 나타낸다.
- EXECUTION_COMPLETE는 Preview Pipeline 마지막 상태이다.
- EXECUTION_COMPLETE는 실제 Runtime Commit, Queue Commit, GUI 반영, SendOrder 완료를 의미하지 않는다.

29.6.2 계층 역할 정의
------------------------------------------------------------
Review:
- 이전 단계 산출물이 다음 단계로 넘어갈 수 있는지 검토한다.
- 구조, 상태, Identity, 차단 사유를 확인한다.
- write를 수행하지 않는다.

Readiness Policy:
- 해당 단계가 실행 준비 상태인지 정책 기준으로 판정한다.
- 필수 입력, Identity, 상태, 차단 조건을 검토한다.
- Commit 또는 실제 실행을 수행하지 않는다.

Input Adapter:
- 이전 단계의 산출물을 현재 단계 입력 계약으로 변환한다.
- 입력 형태를 정규화하되 원본 의미를 변경하지 않는다.
- Identity를 삭제하거나 새로 추정하지 않는다.

Open Policy:
- 단계 진입을 열어도 되는지 정책적으로 판단한다.
- 호출 가능 여부와 금지 조건을 분리한다.
- 실제 호출 또는 Commit을 수행하지 않는다.

Orchestrator:
- 하위 정책, Adapter, Review 결과를 순서대로 연결한다.
- 첫 차단 지점과 stage result를 정리한다.
- 직접 runtime write 또는 SendOrder 호출을 수행하지 않는다.

Call Orchestrator:
- 호출 단계의 입력, 정책, Review 결과를 연결한다.
- 호출 가능성 판단을 수행하되 실제 Broker/Kiwoom 호출은 수행하지 않는다.
- 호출 책임과 결과 기록 책임을 분리한다.

Post Review:
- Pipeline 마지막 상태에서 전체 결과가 일관되는지 검토한다.
- Identity, result, record, status update, lock release preview의 연결성을 확인한다.
- 실제 Runtime Commit, Queue Commit, GUI 반영을 수행하지 않는다.

29.6.3 Execution Pipeline 설계 철학
------------------------------------------------------------
Execution Preview Pipeline은 다음 철학을 따른다.

- Preview First.
- Approval First.
- Policy First.
- Review First.
- Preview-only Layer.
- Runtime Commit 분리.
- Queue Commit 분리.
- GUI 분리.
- ExecutionController(real) 분리.
- Single Responsibility.
- Identity 유지 정책.
- Adapter 기반 설계.
- Broker 추상화.

세부 기준:
- Preview는 실제 변경 없이 실행 가능성과 차단 지점을 계산한다.
- Approval과 Policy는 실제 실행보다 먼저 확인된다.
- Review는 각 계층의 구조적 정합성을 확인한다.
- Runtime Commit과 Queue Commit은 Preview Pipeline과 분리한다.
- GUI는 표시와 사용자 입력을 담당하며 Pipeline 내부 Commit을 수행하지 않는다.
- ExecutionController(real)는 Preview Pipeline에서 분리한다.
- Broker/Kiwoom 직접 호출은 Preview Pipeline에서 분리한다.
- 각 계층은 하나의 책임만 가진다.
- Identity는 단계 사이에서 보존하며 임의 생성 또는 추정하지 않는다.
- Broker는 추상화된 Adapter 경계 뒤에 둔다.

29.6.4 Preview 계층 계약
------------------------------------------------------------
Preview 단계에서는 다음을 절대 수행하지 않는다.

- runtime/order_queue.json 수정.
- runtime/order_executions.json 수정.
- runtime/order_locks.json 수정.
- rules.json 수정.
- GUI 수정 또는 GUI 반영.
- ExecutionController(real) 호출.
- Broker 직접 호출.
- Kiwoom 직접 호출.
- Runtime Commit.
- Queue Commit.
- Lock Release 실제 수행.
- SendOrder 호출.
- 체결 상태 실제 반영.
- runtime status 실제 변경.
- queue status 실제 변경.

정책:
- Preview 계층은 산출물과 검토 결과를 생성한다.
- Preview 계층은 실제 외부 효과를 만들지 않는다.
- Preview 계층의 완료 상태는 실제 실행 완료가 아니다.

29.6.5 Identity 전달 정책
------------------------------------------------------------
Execution Preview Pipeline은 Identity 유지 정책을 따른다.

전달 대상 Identity:
- order_id.
- execution_id.
- request_hash.
- lock_id.
- source_signal_id.
- broker_order_no.

정책:
- order_id는 Queue Review부터 Post Execution Review까지 동일 주문 식별자로 유지한다.
- execution_id는 Execution 단계 후보와 결과 기록 후보를 연결한다.
- request_hash는 SendOrder Preview Adapter, Final Send Gate, Broker Dispatch 후보의 동일 요청성을 검증한다.
- lock_id는 Lock Release preview 단계까지 유지한다.
- source_signal_id는 Decision/Signal 계층에서 유래한 신호 추적성을 유지한다.
- broker_order_no는 Broker Result Review 이후 존재하는 경우에만 전달한다.
- broker_order_no를 Preview 단계에서 임의 생성하거나 추정하지 않는다.
- Identity 불일치 시 다음 단계로 진행하지 않는다.
- Identity는 Adapter 변환 중 삭제하지 않는다.
- Identity는 Review와 Contract Test의 필수 검증 대상이다.

29.6.6 계층별 계약
------------------------------------------------------------
Queue Review:
- 입력 Queue 후보가 SendOrder Preview Adapter로 넘어갈 수 있는지 검토한다.
- Queue Commit을 수행하지 않는다.

SendOrder Preview Adapter:
- Queue Review 결과를 SendOrder 요청 preview 입력으로 변환한다.
- Broker/Kiwoom 직접 호출을 수행하지 않는다.

Final Send Gate:
- Readiness Policy, Input Adapter, Orchestrator, Open Policy, Call Orchestrator로 구성한다.
- 실제 SendOrder 호출 전 검토 구조를 완성한다.
- SendOrder 호출을 수행하지 않는다.

SendOrder EntryPoint:
- Open Policy와 Orchestrator로 구성한다.
- EntryPoint 구조를 preview 계약으로 검토한다.
- Broker 호출을 직접 수행하지 않는다.

Broker Dispatch:
- Open Policy와 Orchestrator로 구성한다.
- Broker Dispatch 가능성을 preview로 검토한다.
- Broker/Kiwoom 직접 호출을 수행하지 않는다.

Broker Result Review:
- Broker result 후보 구조와 Identity 연결성을 검토한다.
- 실제 결과를 runtime에 기록하지 않는다.

Broker Result Record:
- Readiness Policy와 Orchestrator로 구성한다.
- result record 후보를 구성한다.
- runtime/order_executions.json 또는 queue 파일에 기록하지 않는다.

Runtime Status Update:
- Readiness Policy와 Orchestrator로 구성한다.
- runtime status update 후보를 구성한다.
- runtime 파일을 수정하지 않는다.

Queue Status Update:
- Readiness Policy와 Orchestrator로 구성한다.
- queue status update 후보를 구성한다.
- runtime/order_queue.json을 수정하지 않는다.

Lock Release:
- Readiness Policy와 Orchestrator로 구성한다.
- lock release 후보를 구성한다.
- runtime/order_locks.json을 수정하지 않는다.

Post Execution Review:
- 전체 preview 결과의 일관성을 검토한다.
- EXECUTION_COMPLETE로 종료 가능한지 확인한다.
- 실제 Commit 또는 GUI 반영을 수행하지 않는다.

29.6.7 Contract Test 정책
------------------------------------------------------------
각 Layer는 다음 테스트를 반드시 가진다.

- 본체 테스트.
- Contract Test.

Contract Test 검증 대상:
- 입력 계약.
- 출력 계약.
- Identity 보존.
- 금지된 write 미수행.
- 금지된 직접 호출 미수행.
- 다음 stage 전달 조건.
- 차단 사유 반환.

Preview-only E2E Contract:
- Execution Preview Pipeline 전체를 검증한다.
- Queue Review부터 EXECUTION_COMPLETE까지의 preview-only 흐름을 검증한다.
- runtime/order_queue.json을 수정하지 않는다.
- runtime/order_executions.json을 수정하지 않는다.
- runtime/order_locks.json을 수정하지 않는다.
- rules.json을 수정하지 않는다.
- GUI를 수정하지 않는다.
- ExecutionController(real)를 호출하지 않는다.
- Broker/Kiwoom을 직접 호출하지 않는다.
- Runtime Commit, Queue Commit, Lock Release 실제 수행을 하지 않는다.

29.6.8 Execution Complete 정의
------------------------------------------------------------
EXECUTION_COMPLETE는 Execution Preview Pipeline 마지막 상태이다.

정의:
- Queue Review부터 Post Execution Review까지의 preview-only pipeline이 완료된 상태이다.
- 모든 계층 산출물이 계약을 만족한 상태이다.
- Identity 전달이 유지된 상태이다.
- Contract Test와 E2E Contract에서 검증 가능한 상태이다.

아닌 것:
- 실제 Runtime Commit 완료가 아니다.
- 실제 Queue Commit 완료가 아니다.
- GUI 반영 완료가 아니다.
- Broker/Kiwoom 호출 완료가 아니다.
- SendOrder 완료가 아니다.
- 체결 완료가 아니다.
- Lock Release 실제 수행 완료가 아니다.

29.6.9 테스트 현황 기록
------------------------------------------------------------
Execution Preview Pipeline 테스트 정책:
- Execution Preview Pipeline 전체 테스트를 가진다.
- Preview Contract를 가진다.
- Layer Contract를 가진다.
- E2E Contract를 가진다.
- 각 계층은 본체 테스트와 Contract Test를 가진다.

테스트 현황:
- 이번 대화에서는 누적 unittest 증가 수치가 별도로 제공되지 않았다.
- 따라서 특정 누적 테스트 숫자는 신규 기재하지 않는다.
- 제공되지 않은 수치를 추정하지 않는다.
- 테스트 정책과 Contract 구조만 정식 반영한다.

29.6.10 실제 프로젝트 영향
------------------------------------------------------------
이번 갱신은 MASTER_SPEC 문서 갱신이다.

실제 프로젝트 영향:
- 코드 수정 없음.
- runtime 수정 없음.
- rules.json 수정 없음.
- GUI 수정 없음.
- ExecutionController(real) 연결 없음.
- Broker/Kiwoom 직접 호출 없음.
- SendOrder 연결 없음.
- Runtime Commit 없음.
- Queue Commit 없음.
- Lock Release 실제 수행 없음.

29.6.11 Execution Preview Pipeline Complete 완료 기록
------------------------------------------------------------
Execution Preview Pipeline Complete 기록:

- Preview Pipeline Complete.
- Layer Complete.
- Contract Complete.
- E2E Contract Complete.
- Runtime Protection 유지.
- Queue Protection 유지.
- Broker Isolation 유지.

완료 의미:
- Preview Pipeline의 구조와 계약이 완성되었다.
- 각 Layer의 책임과 계약이 분리되었다.
- Identity 전달 정책이 정리되었다.
- Contract Test 정책과 Preview-only E2E Contract가 정식 반영되었다.
- Runtime, Queue, Broker, GUI, SendOrder 보호선은 유지된다.

29.6.12 중복 병합 처리
------------------------------------------------------------
- 기존 29.1, 29.2, 29.5의 Preview 관련 금지선은 유지했다.
- 이번 섹션에서는 Execution Preview Pipeline Complete에 필요한 계층 계약과 완료 정의만 추가했다.
- Runtime write 금지, Queue Commit 분리, GUI 분리, SendOrder 분리 문구는 의미가 바뀌지 않도록 Execution Preview Pipeline 기준으로 재정리했다.
- 제거한 중복 항목 수: 19개.
- Identity 전달 정책, Contract Test 정책, EXECUTION_COMPLETE 정의는 신규 내용으로 유지했다.


Original Body Marker: END

---

Reference Navigation

- Previous PART: PART05_RULE_APPROVAL.md
- Next PART: PART07_EXECUTION_CONTROLLER.md
- INDEX: 00_REFERENCE_INDEX.md
- Original Canonical: ../CURRENT/MASTER_SPEC_CANONICAL_2026-07-08_EXECUTION_SENDORDER_CHEJAN_LIFECYCLE_PIPELINE.txt
