# PART07_EXECUTION_CONTROLLER

Reference Edition

Original Canonical: MASTER_SPEC_CANONICAL_2026-07-08_EXECUTION_SENDORDER_CHEJAN_LIFECYCLE_PIPELINE.txt

생성일: 2026-07-08

주의: 본 문서는 AI 참조용 분할본이며 공식 원본은 CURRENT의 Canonical이다.

Part Summary: Includes 29.7 Rule Apply Preview Execution Preview Controller.

Original Body Marker: START
29.7 Rule Apply Preview Execution Preview Controller

29.7.1 Architecture Overview

Rule Apply Preview Execution Preview Controller는 Rule Apply Preview 결과를 Execution Preview 계층으로 연결하는 preview-only controller 구조이다.

이 구조는 Rule Apply Preview 결과를 실제 실행으로 넘기지 않고, Execution Preview / Queue Pending Preview / Queue Write Preview까지의 미리보기 흐름만 구성한다.

이 섹션은 29.6 Execution Preview Pipeline Complete의 일반 Preview Pipeline 설명을 반복하지 않는다. 29.6의 Preview-only, Runtime Protection, Queue Protection, Broker Isolation 정책을 전제로 하며, 본 섹션은 Rule Apply Preview에서 Execution Preview로 진입하는 controller hook, adapter, REAL_READY order contract, 상태 반환 기준만 추가한다.

Controller Flow:

Rule Apply Preview
↓
Execution Order Adapter
↓
REAL_READY Order Contract
↓
Execution Preview
↓
Queue Pending Preview
↓
Queue Write Preview
↓
Controller Result

Controller Result:

- READY
- BLOCKED
- INVALID

적용 파일:

- rule_apply_preview_execution_order_adapter.py
- rule_apply_preview_execution_preview_controller.py

적용 범위:

- Rule Apply Preview 결과를 Execution Preview 입력으로 변환한다.
- Preview-only controller hook을 제공한다.
- Execution Preview / Queue Pending Preview / Queue Write Preview를 연결한다.
- 실제 queue commit, runtime write, SendOrder, Kiwoom, GUI 연결은 수행하지 않는다.

29.7.2 Controller Entry

Controller 진입점:

- preview_execution_from_rule_apply_preview(...)

`preview_execution_from_rule_apply_preview(...)`는 Rule Apply Preview 결과를 입력으로 받아 Execution Preview 계층의 preview-only 흐름을 실행하는 controller entry이다.

책임:

- Rule Apply Preview 결과 수신
- Execution Order Adapter 호출
- REAL_READY Order Contract 검증
- Execution Preview 호출
- Queue Pending Preview 호출
- Queue Write Preview 호출
- Controller Result 반환

반환 상태:

- READY
- BLOCKED
- INVALID

금지사항:

- runtime write 금지
- queue write 금지
- Queue Commit 금지
- SendOrder 호출 금지
- Kiwoom 호출 금지
- GUI 연결 금지
- rules.json write 금지

29.7.3 Rule Apply Preview Execution Order Adapter

대상 파일:

- rule_apply_preview_execution_order_adapter.py

Rule Apply Preview Execution Order Adapter는 Rule Apply Preview 결과를 Execution Preview에서 사용할 수 있는 REAL_READY order 입력 형태로 변환한다.

책임:

- Rule Apply Preview 결과 구조 해석
- Execution Preview 입력 필드 구성
- REAL_READY order contract 검증에 필요한 identity와 필드 전달
- Queue Pending Preview 입력 구성
- Queue Write Preview 입력 구성
- READY / BLOCKED / INVALID 상태 판정에 필요한 입력 정규화

Adapter는 변환 계층이며 실행 계층이 아니다.

Adapter 금지사항:

- runtime 파일 write 금지
- queue 파일 write 금지
- Queue Commit 금지
- SendOrder 호출 금지
- Kiwoom 호출 금지
- GUI 연결 금지
- rules.json 변경 금지

29.7.4 REAL_READY Order Contract

REAL_READY Order Contract는 Rule Apply Preview 결과가 Execution Preview로 전달되기 위해 만족해야 하는 order 입력 계약이다.

계약 목적:

- Rule Apply Preview 결과가 실제 실행 후보가 아니라 preview 후보임을 명확히 한다.
- Execution Preview에서 필요한 최소 identity와 order field를 보존한다.
- Queue Pending Preview와 Queue Write Preview가 동일한 candidate identity를 기준으로 검토하도록 한다.

계약 기준:

- order candidate를 구성할 수 있어야 한다.
- 필수 identity가 누락되지 않아야 한다.
- preview 입력 계약과 상태값이 일치해야 한다.
- Rule Apply Preview 결과가 INVALID이면 Execution Preview로 진행하지 않는다.
- BLOCKED 사유가 있으면 Queue Write Preview까지 무리하게 진행하지 않는다.

REAL_READY는 실제 runtime write 또는 queue write 완료를 의미하지 않는다.

REAL_READY는 SendOrder 준비 완료를 의미하지 않는다.

REAL_READY는 preview-only 흐름에서 Execution Preview 입력으로 사용할 수 있는 상태를 의미한다.

29.7.5 Controller Status

Controller Result는 READY, BLOCKED, INVALID 중 하나를 반환한다.

READY:

- Rule Apply Preview 결과가 Execution Order Adapter를 통해 변환 가능하다.
- REAL_READY Order Contract를 만족한다.
- Execution Preview / Queue Pending Preview / Queue Write Preview의 preview-only 검토를 통과한다.
- READY는 실제 Queue Commit, runtime write, queue write, SendOrder, Kiwoom 호출, GUI 반영을 의미하지 않는다.

BLOCKED:

- 입력은 해석 가능하지만 preview 단계에서 정책상 진행할 수 없는 사유가 확인된 상태이다.
- BLOCKED는 실패가 아니라 preview-only 검토 결과이다.
- BLOCKED에는 차단 사유가 포함되어야 한다.
- BLOCKED 상태에서는 Queue Commit, SendOrder, Kiwoom, runtime write, queue write를 수행하지 않는다.

INVALID:

- Rule Apply Preview 결과를 Execution Preview 입력으로 사용할 수 없는 상태이다.
- 필수 입력 누락, order candidate 구성 불가, preview 입력 계약 불일치, identity 누락, 상태 판정 필드 누락이 INVALID 사유가 될 수 있다.
- INVALID 상태에서는 Execution Preview 이후 단계로 진행하지 않는다.
- INVALID 상태에서도 runtime write, queue write, Queue Commit, SendOrder, Kiwoom 호출은 수행하지 않는다.

29.7.6 Execution Preview Flow

Execution Preview Flow는 Rule Apply Preview 결과가 Execution Preview 계층에서 실행 가능성 미리보기로 검토되는 단계이다.

흐름:

Rule Apply Preview
↓
Execution Order Adapter
↓
REAL_READY Order Contract
↓
Execution Preview

Execution Preview 단계의 책임:

- REAL_READY order contract 기반 preview 수행
- execution 후보의 preview 가능 여부 판단
- READY / BLOCKED / INVALID 상태 산출에 필요한 결과 제공
- runtime과 queue에 쓰지 않는 preview 결과 생성

Execution Preview 단계의 금지사항:

- runtime write 금지
- queue write 금지
- Queue Commit 금지
- SendOrder 호출 금지
- Kiwoom 호출 금지
- GUI 연결 금지
- rules.json write 금지

29.7.7 Queue Pending Preview

Queue Pending Preview는 Execution Preview 결과를 기준으로 queue pending 후보를 미리보기로 검토하는 단계이다.

책임:

- queue pending 후보 구성 가능 여부 확인
- pending 상태로 표현 가능한 필드 확인
- queue write 전 검토 결과 생성
- Queue Write Preview로 넘길 수 있는 preview-only 입력 구성

Queue Pending Preview는 queue enqueue 또는 queue file write를 수행하지 않는다.

Queue Pending Preview 금지사항:

- queue write 금지
- Queue Commit 금지
- runtime write 금지
- SendOrder 호출 금지
- Kiwoom 호출 금지
- GUI 연결 금지

29.7.8 Queue Write Preview

Queue Write Preview는 queue에 기록될 수 있는 형태를 미리보기로 검토하는 단계이다.

책임:

- queue write 후보의 형태 검토
- queue write 전 contract 검토
- queue write가 가능해 보이는지 preview-only 결과 산출
- Controller Result 산출에 필요한 상태와 사유 제공

Queue Write Preview는 실제 queue write가 아니다.

Queue Write Preview는 Queue Commit이 아니다.

Queue Write Preview 금지사항:

- queue 파일 write 금지
- Queue Commit 금지
- runtime write 금지
- SendOrder 호출 금지
- Kiwoom 호출 금지
- GUI 연결 금지
- rules.json write 금지

29.7.9 Preview-only Safety Policy

Rule Apply Preview Execution Preview Controller는 preview-only safety policy를 따른다.

필수 policy flag:

- preview_only=True
- runtime_write=False
- queue_write=False
- send_order_called=False
- queue_commit_called=False

현재 연결 금지:

- Queue Commit
- SendOrder
- Kiwoom
- GUI
- runtime write
- rules.json write

정책 의미:

- preview_only=True는 controller가 실제 실행 계층이 아니라 preview 계층임을 의미한다.
- runtime_write=False는 runtime 파일을 쓰지 않았음을 의미한다.
- queue_write=False는 queue 파일을 쓰지 않았음을 의미한다.
- send_order_called=False는 SendOrder 또는 Kiwoom 주문 호출이 없었음을 의미한다.
- queue_commit_called=False는 Queue Commit이 없었음을 의미한다.

29.7.10 Runtime Protection

Runtime Protection은 Rule Apply Preview Execution Preview Controller의 핵심 금지선이다.

보호 대상:

- runtime/order_queue.json
- runtime/order_executions.json
- runtime/order_locks.json
- 기타 runtime 상태 파일
- rules.json

금지사항:

- runtime write 금지
- runtime status update 금지
- order execution 기록 금지
- order lock 변경 금지
- queue commit 금지
- rules.json write 금지

이 controller는 runtime protection을 깨지 않고 preview 결과만 반환한다.

29.7.11 Failure Handling

Failure Handling은 READY가 아닌 결과를 preview-only 방식으로 안전하게 반환하는 정책이다.

BLOCKED 처리:

- 정책상 진행 불가 사유를 반환한다.
- 가능한 경우 차단 위치를 함께 반환한다.
- write, commit, SendOrder, Kiwoom 호출 없이 종료한다.

INVALID 처리:

- 입력 계약 불일치 또는 필수 필드 누락 사유를 반환한다.
- Execution Preview 이후 단계로 진행하지 않는다.
- write, commit, SendOrder, Kiwoom 호출 없이 종료한다.

예외 처리 정책:

- 예외 상황에서도 runtime write를 수행하지 않는다.
- 예외 상황에서도 queue write를 수행하지 않는다.
- 예외 상황에서도 Queue Commit을 수행하지 않는다.
- 예외 상황에서도 SendOrder 또는 Kiwoom 호출을 수행하지 않는다.
- 예외 상황에서도 GUI 연결을 수행하지 않는다.

29.7.12 Controller Contract

Controller Contract는 `preview_execution_from_rule_apply_preview(...)`가 따라야 하는 입출력 계약이다.

입력 계약:

- Rule Apply Preview 결과를 입력으로 받는다.
- Execution Order Adapter가 해석 가능한 구조여야 한다.
- REAL_READY Order Contract 검증에 필요한 필드를 포함해야 한다.

출력 계약:

- Controller Result를 반환한다.
- Controller Result는 READY, BLOCKED, INVALID 중 하나이다.
- preview-only safety policy 상태를 포함한다.
- 차단 또는 invalid 사유가 있으면 결과에 포함한다.

금지 계약:

- controller는 runtime 파일을 수정하지 않는다.
- controller는 queue 파일을 수정하지 않는다.
- controller는 Queue Commit을 수행하지 않는다.
- controller는 SendOrder를 호출하지 않는다.
- controller는 Kiwoom을 호출하지 않는다.
- controller는 GUI와 연결하지 않는다.
- controller는 rules.json을 수정하지 않는다.

29.7.13 Test Coverage

현재 테스트 현황:

- 2249 tests OK

테스트 반영 기준:

- Rule Apply Preview Execution Preview Controller 구조는 전체 테스트 기준 2249 OK 상태로 기록한다.
- 테스트는 preview-only 금지선을 유지하는 기준으로 기록한다.
- runtime write 없음, queue write 없음, Queue Commit 없음, SendOrder 없음, Kiwoom 없음, GUI 연결 없음, rules.json write 없음이 정책상 검증 대상이다.

테스트 기록 범위:

- Controller entry 계약
- Execution Order Adapter 계약
- READY / BLOCKED / INVALID 상태 기준
- Execution Preview 연결
- Queue Pending Preview 연결
- Queue Write Preview 연결
- Preview-only safety policy
- Runtime Protection
- Failure Handling

29.7.14 Current Non-connected Components

현재 연결되지 않은 구성:

- Queue Commit
- SendOrder
- Kiwoom
- GUI
- runtime write
- rules.json write

현재 상태:

- Rule Apply Preview에서 Execution Preview로 이어지는 preview-only controller hook은 문서 기준으로 반영한다.
- Queue Pending Preview와 Queue Write Preview는 preview-only 연결로만 반영한다.
- Queue Commit은 연결하지 않는다.
- SendOrder는 연결하지 않는다.
- Kiwoom은 연결하지 않는다.
- GUI는 연결하지 않는다.
- runtime write는 수행하지 않는다.
- rules.json write는 수행하지 않는다.

중복 병합 처리:

- 29.6의 Preview Pipeline Complete, Runtime Protection, Queue Protection, Broker Isolation 설명은 기존 내용으로 유지한다.
- 29.7에서는 29.6의 일반 Preview 설명을 반복하지 않고 참조 관계로 정리한다.
- 중복 제거 대상은 일반 Preview-only 원칙, Runtime Protection 일반 설명, Queue Protection 일반 설명, SendOrder/Kiwoom 금지선 일반 설명이다.
- 제거한 중복 문단 수는 4개 범주로 기록한다.
- 기존 Canonical 내용은 삭제하지 않았다.


Original Body Marker: END

---

Reference Navigation

- Previous PART: PART06_EXECUTION_PREVIEW.md
- Next PART: PART08_OPERATION_POLICY.md
- INDEX: 00_REFERENCE_INDEX.md
- Original Canonical: ../CURRENT/MASTER_SPEC_CANONICAL_2026-07-08_EXECUTION_SENDORDER_CHEJAN_LIFECYCLE_PIPELINE.txt
