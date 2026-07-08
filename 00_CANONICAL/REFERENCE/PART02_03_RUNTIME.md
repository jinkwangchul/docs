# PART02 03 RUNTIME

Reference Edition Subpart

Original Canonical: MASTER_SPEC_CANONICAL_2026-07-08_EXECUTION_SENDORDER_CHEJAN_LIFECYCLE_PIPELINE.txt

Source Full Part: PART02_RUNTIME.md

생성일: 2026-07-08

주의: 본 문서는 AI 참조용 하위 분할본이며 공식 원본은 CURRENT의 Canonical이다.

Original Body Marker: START
==================================================
역할
- 자동 처리하면 안 되는 상태를 검토관리로 격리한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
금지
- 자동 복귀 금지.
- 서버 확인 없이 해결 처리 금지.
- review를 실행 상태 저장소로 사용 금지.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
12. runtime/audit_log.jsonl, 향후
==================================================
역할
- 상태 전이와 주요 판단을 기록하는 감사 로그.
- 실행 판단을 하지 않는다.
생성 주체
- 향후 AuditLogger
- 각 Controller/Engine/Gate 호출 결과 기록

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
order_locks, order_executions, fills, positions, review_items, audit_log, close_history는 설계상 필요하지만 아직 구현 금지 상태이다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
상태 흐름:
- PENDING
- APPROVED / BLOCKED
- EXECUTABLE / BLOCKED_POLICY
- REAL_READY / BLOCKED_REAL
- ORDER_QUEUED 이후는 실주문 위험 구간
3.4 Execution Request

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
의미:
- REAL_READY order를 실제 SendOrder 호출 대상으로 올린 실행 요청.
- ORDER_QUEUED부터 Execution Request로 본다.
현재 상태:
- 아직 미구현.
- 설계 대상.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
관계:
- close_history.position_id -> Position
- close_history.close_order_id -> Order Queue
- close_history.close_fill_ids -> Fill
3.9 Review Management
의미:
- 불일치/오류/검토 필요 상태를 관리하는 엔티티.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
logs/order_pipeline.log 또는 runtime/audit_log.jsonl, 향후
- 상태 전이 감사 로그.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
7. 계약 검증
==================================================
□ 필수 필드 존재
□ 타입 일관성
□ 상태값 유효성
□ 참조 무결성

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
2. Controller 계층
==================================================
역할
- 전체 흐름 제어
- 상태 전이
- Runtime 갱신
- Boundary 호출
입력
- GUI
- Timer
- Event
출력
- Engine
- Runtime
- Boundary

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
SOURCE: MASTER_SPEC_추가갱신_프로젝트_상태전이카탈로그_State_Transition_Catalog_2026-07-03.txt
==================================================

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
MASTER_SPEC_추가갱신_프로젝트_상태전이카탈로그_State_Transition_Catalog_2026-07-03
목적
- 프로젝트 전반에서 사용되는 상태(State)와 허용되는 상태 전이 규칙을 표준화한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
2. Signal 상태
==================================================
PENDING
→ APPROVED
→ BLOCKED

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
4. Review 상태
==================================================
OPEN
→ IN_PROGRESS
→ RESOLVED
→ CLOSED

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
5. Recovery 상태
==================================================
DETECTED
→ ANALYZING
→ RECOVERING
→ VERIFIED
→ COMPLETED

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
6. 상태 전이 검증
==================================================
□ 허용된 전이인가
□ Controller를 통한 변경인가
□ Runtime 기록이 남는가
□ Audit 추적 가능한가

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
7. 금지 사항
==================================================
- 상태 건너뛰기
- Runtime 직접 상태 수정
- Controller 우회
- 완료 상태에서 임의 재개

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
1. 이벤트 분류
==================================================
사용자 이벤트
- 버튼 클릭
- 설정 변경
- 루틴 시작/정지
시스템 이벤트
- Timer Tick
- Runtime 갱신
- 상태 전이
시장 이벤트
- 시세 수신
- 조건 신호
- 주문 응답
- 체결 통보(Chejan)

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
4. Controller ↔ Runtime
==================================================
입력
- 상태 변경 요청
출력
- 저장 결과
- 조회 결과

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
6. 인터페이스 계약
==================================================
□ 입력 검증
□ 반환값 명확화
□ 예외 처리 규칙
□ 상태 변경 주체 명확화

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
주의:
- REAL_READY 이후 현재 단계에서는 ADAPTER_READY 파일 전이를 수행하지 않는다.
- Adapter Request Preview는 메모리 dict 반환만 의미한다.
- SendOrder는 연결하지 않는다.
2. 상태 의미

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
PENDING
- routine signal에서 생성된 order 후보의 최초 상태.
- 아직 approval 미통과.
- 실주문 불가.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
APPROVED
- 후보 자체가 주문 후보로 적합하다고 approval engine이 판정한 상태.
- 실주문 허용 상태가 아니다.
- execution_enabled=false 유지.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
EXECUTABLE
- operation policy gate를 통과한 상태.
- Real Preflight 전 단계이다.
- 실주문 허용 상태가 아니다.
- execution_enabled=false 유지.
BLOCKED_POLICY
- operation policy gate에서 차단된 상태.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
BLOCKED_REAL
- real_order_preflight에서 차단된 상태.
- guard 실패, execution_enabled=false, 계좌 미선택, 로그인 미확인 등.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
- SendOrder 미연결
- SetRealReg 미연결
- send_order_stub 미호출 상태의 Adapter Request Preview 제공
- Adapter/Executor 자동 연결 금지
- GUI/Timer에서 Real Preflight/Adapter/Executor 자동 연결 금지
- execution_enabled=false 유지
- APPROVED는 실주문 가능 상태가 아님
- EXECUTABLE은 실주문 가능 상태가 아님
- REAL_READY도 현재 단계에서는 request preview까지만 허용
- rules.json 변경 금지
- orders.json/state.json 직접 변경 금지
- real_trade_guard 자동 생성 또는 자동 완화 금지
8. 아직 구현 금지

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
5) queue 상태 충돌
- ADAPTER_READY는 현재 사양상 preview 이후 자동 상태가 아니다.
- 실제 adapter 단계로 승격하기 전 별도 상태 전이 정책이 필요하다.
10. 다음 구현 가능 최소 범위

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
아직 금지:
- SendOrder 구현
- Executor 자동 연결
- Timer 자동 실주문 흐름
- 파일 상태를 ADAPTER_READY/DONE/ERROR로 자동 변경하는 흐름

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
작성 목적
- 본 문서는 주문 파이프라인 Preview 단계 이후, REAL_READY 다음 단계에서 ADAPTER_READY를 공식 주문 상태로 사용할지 여부를 검토한 결과를 MASTER_SPEC에 반영하기 위한 추가 갱신자료이다.
- 결론은 ADAPTER_READY를 공식 상태로 사용하지 않는 것이다.
- Adapter Request Preview는 상태 전이가 아니라 메모리 검토 결과로만 유지한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
1. 결론
==================================================
ADAPTER_READY는 공식 주문 상태로 사용하지 않는다.
공식 흐름은 다음과 같이 고정한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
2. ADAPTER_READY를 공식 상태로 사용하지 않는 이유
==================================================

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
1. REAL_READY와 역할이 겹친다.
- REAL_READY는 이미 Real Preflight를 통과한 상태이다.
- 이 상태는 실주문 직전 검토 가능 상태를 의미한다.
- Adapter Request Preview는 REAL_READY 상태에서 요청 dict를 미리 확인하는 기능일 뿐이다.
- 따라서 ADAPTER_READY를 별도 상태로 만들면 REAL_READY와 의미가 중복된다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
2. 실주문 직전 단계가 과도하게 세분화된다.
- REAL_READY 이후는 실주문 위험 구간이다.
- 이 구간에서 상태값이 늘어나면 운영자가 현재 상태를 잘못 해석할 수 있다.
- ADAPTER_READY가 있으면 “주문 준비 완료”처럼 오해될 수 있다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
3. 파일 상태 변경이 불필요하다.
- Adapter Preview는 메모리 dict 생성만으로 충분하다.
- order_queue.json에 상태를 반영할 필요가 없다.
- 파일 변경 없는 preview가 더 안전하다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
4. 기존 real_order_executor_stub.py의 ADAPTER_READY 전이는 위험하다.
- SendOrder는 호출하지 않더라도 queue 파일 상태를 REAL_READY -> ADAPTER_READY로 변경한다.
- 자동 연결 시 실주문은 아니더라도 상태가 진행된 것처럼 보인다.
- 따라서 real_order_executor_stub.py는 자동 연결하지 않는다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
3. Adapter Request Preview 정책
==================================================
Adapter Request Preview는 상태값이 아니다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
의미:
- Real Preflight 통과.
- Adapter Request Preview 가능.
- 아직 SendOrder 아님.
- 아직 ORDER_QUEUED 아님.
- 아직 DONE 아님.
REAL_READY 상태의 order는 아래 조건을 만족해야 다음 단계 검토가 가능하다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
5. ORDER_QUEUED 정책
==================================================
ORDER_QUEUED는 실제 SendOrder 직전 또는 SendOrder 요청 등록 상태로만 사용한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
이유:
- REAL_READY를 읽어 adapter stub을 호출할 수 있다.
- SendOrder는 호출하지 않지만 queue 상태를 ADAPTER_READY로 변경할 수 있다.
- ADAPTER_READY는 공식 상태로 사용하지 않기로 결정했으므로 자동 연결 금지이다.
허용:
- 별도 분석 대상.
- 기존 코드 보존.
- 자동 Timer/GUI 연결 금지.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
최종 결론
==================================================
ADAPTER_READY는 공식 상태로 사용하지 않는다.
Adapter Request Preview는 파일 상태가 아니라 메모리 검토 결과이다.
REAL_READY는 preview 이후에도 유지한다.
ORDER_QUEUED는 실제 SendOrder 직전/요청 등록 상태로만 사용한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
3. 필수 매핑 키
- kiwoom_order_no
- execution_id
- order_id
- source_signal_id
- code
4. 체결 상태 후보
- 접수
- 확인
- 부분체결
- 전량체결
- 취소
- 거부
- 정정
- 정정완료
상태값 추가는 추후 별도 승인 후 구현한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
작성 목적
- 본 문서는 ORDER_QUEUED 이후 실제 SendOrder 호출 직전/직후의 실행 요청 단위(Execution Request)를 정의하기 위한 MASTER_SPEC 추가 갱신자료이다.
- 본 문서는 코드 구현 문서가 아니라 order_id, execution_id, kiwoom_order_no 관계를 고정하기 위한 데이터/상태 설계 문서이다.
- 현재 단계에서 SendOrder, KiwoomOrderExecutor, order_executions.json 실제 생성, 상태값 코드 추가는 금지한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
status
- Execution Request 자체 상태.
- 현재 코드에는 추가하지 않는다.
- 후보:
 - REQUEST_PREPARED
 - SENDORDER_CALLED
 - ACCEPTED
 - REJECTED
 - ERROR
- 상태값 도입은 별도 승인 필요.
created_at
- Execution Request 생성 시각.
requested_at
- SendOrder 호출 시각.
account_no
- 실행 시점 계좌번호.
code / side / quantity / price
- 실행 요청의 핵심 주문 정보.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
정책:
- order_queue는 현재 order 상태를 가진다.
- order_executions는 실행 요청 이력을 가진다.
- order_queue에 execution_id 요약 필드를 둘 수 있다.
- 실행 이력 상세는 order_executions.json으로 분리하는 것이 안전하다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
9. Execution Request 상태와 Order Lifecycle 관계
==================================================

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
관계:
- Order status는 운영자가 보는 주문 생명주기 상태.
- Execution status는 실제 SendOrder 요청 처리 상태.
- 둘은 1:1로 완전히 같지 않다.
- order_queue는 최신 상태 요약.
- order_executions는 실행 요청 상세 기록.
현재 단계에서는 Execution Request 상태값을 코드에 추가하지 않는다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
권장 다음 작업:
- hoga/order_type 매핑 설계.
- 이유: Execution Request에는 order_type/hoga가 필수이며, 현재 UNDECIDED 상태이므로 다음 단계로 넘어갈 수 없다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
- SendOrder 호출 금지.
- ORDER_QUEUED 생성 금지.
- order status 변경은 기본 금지.
- 실패 사유 summary만 반환.
- 필요 시 향후 BLOCKED_EXECUTION 같은 상태를 검토할 수 있으나 현재 새 상태값 추가 금지.
- 심각한 불일치/위험 조건은 검토관리 후보.
현재 단계에서는 새 상태값을 만들지 않는다.
권장 반환 구조, 향후:

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
현재 order_intent는 unresolved=true가 기본이므로 현재 운영 흐름에서는 ORDER_QUEUED로 갈 수 없다.
이것이 안전한 상태이다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
14. 검토관리/운영상태 조건
==================================================
향후 Final Execution Guard는 운영상태와도 연결되어야 한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
이유:
- order_intent.unresolved=true
- hoga/order_type 미확정
- execution_enabled=false
- operator_confirmed=false 기본
- lock 미구현
- execution request 미구현
따라서 현재 상태는 안전하다.
향후 SendOrder 구현은 Final Execution Guard가 완성된 뒤에만 검토한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
6. 금지
- Boundary 내부에서 주문 판단
- 전략 판단
- Approval 수행
- Policy 수행
- Preflight 수행
- Runtime 상태 직접 변경

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
8. Recovery 연계
- Recovery는 Boundary를 통해 현재 서버 상태를 조회한다.
- Boundary는 조회 결과만 제공한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
11. 기존 파이프라인과의 관계
==================================================
order_intent는 기존 상태 전이에 영향을 주지 않는다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
현재 금지:
- hoga 확정
- order_type 확정
- SendOrder 연결
- send_order_stub 호출
- Adapter 실행 연결
- Executor 연결
- execution_enabled=true 전환
- operator_confirmed=true 전환
- source_ui_path 추정 입력
- sell setting_a/b/c 추정
- UI state 직접 읽기
- rules.json 직접 읽기
- 새 상태값 추가
order_intent는 현재 주문방식 확정값이 아니다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
2. Lock 생성 시점
REAL_READY 상태에서는 Lock 생성 금지.
ExecutionController가 ORDER_QUEUED로 승격하기 직전에만 Lock 생성 가능.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
영향 없음:
- Approval Engine
- Operation Policy Gate
- Real Preflight
- Adapter Request Preview
- execution_enabled
- real_trade_guard
- SendOrder
order_provenance는 메타데이터이며, 기존 상태 전이를 변경하지 않는다.
공식 상태 전이는 그대로 유지한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
확인 사항:
- setting_a/b/c 추정 없음.
- source_ui_path 임의 입력 없음.
- rules.json 읽기 없음.
- indicator_follow_ui_state 읽기 없음.
- 새 상태값 없음.
- execution_enabled=false 유지.
- Adapter/Executor/SendOrder 연결 없음.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
SOURCE: MASTER_SPEC_추가갱신_Order_State_Machine_주문상태머신_설계_2026-07-03.txt
==================================================
MASTER_SPEC_추가갱신_Order_State_Machine_주문상태머신_설계_2026-07-03

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
목적
- 주문(Order)의 전체 상태 전이(State Machine)를 하나의 기준으로 정의한다.
- 각 상태는 단일 의미만 가지며, 허용된 전이만 가능하다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
6. 검토관리
다음은 검토 후보
- 허용되지 않은 상태 전이
- 상태와 서버 정보 불일치
- ORDER_SENT 이후 주문번호 없음
- FILLED인데 Position 없음

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
7. Audit Log
모든 상태 전이는
- from_status
- to_status
- actor
- timestamp
를 기록한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
SOURCE: MASTER_SPEC_추가갱신_Position_Model_보유상태_설계_2026-07-03.txt
==================================================
MASTER_SPEC_추가갱신_Position_Model_보유상태_설계_2026-07-03

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
목적
- 본 문서는 주문 파이프라인과 검토관리(Review Management)의 연계 기준을 정의한다.
- 검토관리는 오류를 자동 복구하는 기능이 아니라, 운영자가 확인해야 하는 상태를 격리하는 운영 계층이다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
Recovery
- 재시작 후 상태 복원 실패
- Active Lock과 실제 주문 불일치
- Execution 존재, 주문번호 없음
3. 검토관리와 상태의 관계
BLOCKED
- 정상적인 정책 차단
- 자동 검토관리 대상 아님
BLOCKED_POLICY
- 정책 차단
- 반복 발생 시 검토 후보
BLOCKED_REAL
- Guard 차단
- 일시적 차단이면 검토관리 아님
ERROR
- 원인에 따라 검토관리 후보
Review
- 운영자 확인이 필요한 상태
- 자동 복귀 금지

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
현재 금지:
- ADAPTER_READY 공식 상태 사용 금지.
- ORDER_QUEUED 자동 생성 금지.
- SendOrder 호출 금지.
- execution_enabled 자동 true 전환 금지.
- operator_confirmed 자동 true 전환 금지.
- Executor/Adapter 자동 연결 금지.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
정책:
- operator_confirmed는 order별 상태가 아니라 real_trade_guard.json의 전역 guard 항목이다.
- APPROVED -> EXECUTABLE 단계에서는 변경하지 않는다.
- EXECUTABLE -> REAL_READY 단계의 preflight guard에서 확인한다.
- operator_confirmed=true 설정 UI/함수는 별도 설계 전까지 구현 금지이다.
3.2 execution_enabled와의 차이

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
ORDER_QUEUED는 실제 SendOrder 호출 직전 또는 SendOrder 호출 요청이 등록된 상태이다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
정책:
- ORDER_QUEUED는 preview 상태가 아니다.
- ORDER_QUEUED는 adapter preview 상태가 아니다.
- ORDER_QUEUED는 실제 주문 실행 파이프라인에 진입했다는 의미이다.
- ORDER_QUEUED부터는 실주문 위험 구간이다.
4.2 생성 조건
ORDER_QUEUED는 아래 조건을 모두 만족할 때만 생성할 수 있다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
5. ORDER_QUEUED 이후 상태
==================================================
공식 후보 흐름:
ORDER_QUEUED
 ↓ SendOrder 호출 결과
DONE / ERROR

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
현재 1차 정의:
- ORDER_QUEUED: SendOrder 호출 요청 등록 또는 호출 직전.
- DONE: SendOrder 요청 성공 또는 주문 접수 확인 이후 상태로 사용할 수 있으나, 체결 완료와 동일시 금지.
- ERROR: SendOrder 요청 실패, adapter request 생성 실패, API 오류, guard 실패, lock 실패 등.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
현재 단계에서는 새 상태값을 추가하지 않는다.
다만 장기적으로 DONE 하나로 주문 접수/체결 완료를 모두 표현하는 것은 부정확하므로 후속 설계가 필요하다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
권장:
- 별도 runtime/order_locks.json
- order_queue.json에는 lock 상태 요약만 기록
6.4 lock 상태 후보
현재 새 상태값 추가는 금지이므로 lock은 order status가 아니라 별도 메타데이터로 둔다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
정책:
- Preview helper와 Execution helper는 반드시 분리한다.
- Preview 함수는 절대 queue 상태를 변경하지 않는다.
- Execution 함수는 preview 결과를 재사용하더라도 guard와 lock을 다시 검사한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
- SendOrder 구현
- KiwoomOrderExecutor 구현
- real_order_executor_stub 자동 연결
- REAL_READY -> ADAPTER_READY 전이
- ADAPTER_READY 공식 상태 사용
- REAL_READY -> ORDER_QUEUED 자동 전이
- ORDER_QUEUED 자동 생성
- execution_enabled=true 자동 전환
- operator_confirmed=true 자동 설정
- GUI 실행 버튼 구현
- Timer 실행 연결
- 체결/정정/취소 상태값 신규 추가
- 실제 주문 재시도 로직 구현

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
ADAPTER_READY는 공식 상태로 사용하지 않는다.
Adapter Preview는 메모리 검토 결과로만 유지한다.
ORDER_QUEUED부터 실주문 위험 구간으로 본다.
SendOrder는 위 조건이 모두 확정될 때까지 계속 금지한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\00_Final_Index_Reference_Map_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
ADR-004
==================================================
주제
상태 전이는 State Machine만 따른다.
결정
- Controller만 상태를 변경한다.
- 임의 상태 변경을 금지한다.

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
저장 버튼:
- 기존 save_button을 활성화
- 문구: UI 상태 저장
- 클릭 시 save_indicator_follow_ui_state_to_rules() 호출

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
허용 변경:
- runtime/routine_signals.json 신규 signal 추가/상태 전이
- 테스트 목적의 state start/stop 후 복구

[출처: MASTER_SPEC_최종_작업재개요약_2026-07-03.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:53:13 | 분류: 작업재개요약]
==================================================
현재 구현 상태
==================================================
실주문은 연결되어 있지 않다.

[출처: 작업재개요약서_2026-07-03_주문파이프라인_아키텍처설계_중간정리.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:02:24 | 분류: 작업재개요약]
==================================================
4. Order Lifecycle 전체 상태 모델
==================================================
장기 상태 모델:

[출처: 작업재개요약서_2026-07-03_주문파이프라인_아키텍처설계_중간정리.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:02:24 | 분류: 작업재개요약]
보조 상태:
- CANCEL_REQUESTED
- CANCELLED
- CANCEL_REJECTED
- MODIFY_REQUESTED
- MODIFIED
- MODIFY_REJECTED
- EXPIRED
- ERROR
현재 코드에 신규 상태값 추가는 금지.
장기 설계 기준으로만 고정.

[출처: 작업재개요약서_2026-07-03_주문파이프라인_아키텍처설계_중간정리.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:02:24 | 분류: 작업재개요약]
현재 상태:
- hoga/order_type은 미확정.
- order_intent.unresolved=true가 정상.

[출처: 작업재개요약서_2026-07-03_주문파이프라인_아키텍처설계_중간정리.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:02:24 | 분류: 작업재개요약]
==================================================
13. Audit Log
==================================================
역할:
- 상태 전이와 주요 판단을 기록하는 감사 계층.
- 실행 판단은 하지 않음.

[출처: 작업재개요약서_2026-07-03_주문파이프라인_아키텍처설계_중간정리.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:02:24 | 분류: 작업재개요약]
==================================================
14. Review Management
==================================================
역할:
- 자동 처리하면 안 되는 상태를 격리하는 운영 계층.

[출처: 작업재개요약서_2026-07-03_주문파이프라인_아키텍처설계_중간정리.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:02:24 | 분류: 작업재개요약]
==================================================
18. Position Model
==================================================
Position 의미:
- 실제 보유 상태.
- Order가 아니라 Fill의 결과.

[출처: 작업재개요약서_2026-07-03_주문파이프라인_아키텍처설계_중간정리.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:02:24 | 분류: 작업재개요약]
상태 흐름:
PENDING
 ↓
APPROVED
 ↓
EXECUTABLE
 ↓
REAL_READY
 ↓
ORDER_QUEUED
 ↓
ORDER_SENT
 ↓
ORDER_ACCEPTED / REJECTED
 ↓
PARTIAL_FILLED
 ↓
FILLED
 ↓
CLOSED
차단 상태:
- BLOCKED
- BLOCKED_POLICY
- BLOCKED_REAL
종료/예외:
- CANCELLED
- EXPIRED
- ERROR

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\raw_extracted\MASTER_SPEC_추가갱신_Order_State_Machine_주문상태머신_설계_2026-07-03.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 12:53:14 | 분류: 갱신문서]
MASTER_SPEC_추가갱신_Order_State_Machine_주문상태머신_설계_2026-07-03

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\raw_extracted\MASTER_SPEC_추가갱신_Position_Model_보유상태_설계_2026-07-03.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 12:51:30 | 분류: 갱신문서]
MASTER_SPEC_추가갱신_Position_Model_보유상태_설계_2026-07-03

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\raw_extracted\MASTER_SPEC_추가갱신_order_intent_미확정진단필드_2026-07-03.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 11:12:46 | 분류: 갱신문서]
현재 금지:
- hoga 확정
- order_type 확정
- SendOrder 연결
- send_order_stub 호출
- Adapter 실행 연결
- Executor 연결
- execution_enabled=true 전환
- operator_confirmed=true 전환
- source_ui_path 추정 입력
- sell setting_a/b/c 추정
- UI state 직접 읽기
- rules.json 직접 읽기
- 새 상태값 추가

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\raw_extracted\MASTER_SPEC_갱신자료_2026-07-03_주문파이프라인_Preview.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 10:42:48 | 분류: 갱신문서]
MASTER_SPEC 갱신자료
작성일: 2026-07-03
범위: 주문 파이프라인 Preview 단계
1. 주문 파이프라인 상태 전이 사양
현재 주문 파이프라인은 실주문 전송 전 Preview 단계까지만 구현한다.
상태 전이:
PENDING
 -> APPROVED
 -> BLOCKED
APPROVED
 -> EXECUTABLE
 -> BLOCKED_POLICY
EXECUTABLE
 -> REAL_READY
 -> BLOCKED_REAL
REAL_READY
 -> Adapter Request Preview

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\Development_Specification_구현규약_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:19:04 | 분류: MASTER_SPEC]
- Preview는 실행이 아니다.
- Pending은 검토 대상이다.
- Simulation은 저장하지 않는다.
- Approved는 승인 기록이다.
- Applied는 실제 Rule 반영이다.
- Loaded는 엔진이 읽은 상태다.
- Running만 실제 자동매매에 사용된다.
이 규약은 향후 모든 기능 추가와 리팩터링의 최상위 기준으로 사용한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\AutoTrading_System_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:16:58 | 분류: MASTER_SPEC]
본 문서는 Rule Life Cycle, Routine Life Cycle을 포함하여 자동매매 프로그램
전체가 어떤 상태를 거쳐 실행·정지·복구되는지 정의한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\AutoTrading_System_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:16:58 | 분류: MASTER_SPEC]
목적:
- 프로그램 시작부터 종료까지의 최상위 상태를 정의한다.
- Rule, Routine, Stock, Time Policy, Operation Policy를 실행 조건으로 연결한다.
- 긴급정지, 재시작, 장마감, 다음 영업일 복구 흐름을 구분한다.
- 실제 자동매매 실행 전 필수 조건을 명확히 한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\AutoTrading_System_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:16:58 | 분류: MASTER_SPEC]
-------------------------------------------------------------------------------
3.8 Ready
- 자동매매 시작 가능 상태
- 아직 실제 매매 실행 중은 아님

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\AutoTrading_System_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:16:58 | 분류: MASTER_SPEC]
-------------------------------------------------------------------------------
3.10 Trading Running
- 실제 자동매매 판단 및 주문 실행 가능 상태

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\AutoTrading_System_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:16:58 | 분류: MASTER_SPEC]
================================================================================
9. 현재 결론
================================================================================
전체 자동매매 시스템은 단일 상태로 판단하면 안 된다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\EngineRule_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:13:12 | 분류: MASTER_SPEC]
주의:
- Loaded 상태라도 실제 거래 판단에 사용 중인지 확인해야 한다.
- 자동매매 시작 전이라면 Running이 아니다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\EngineRule_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:13:12 | 분류: MASTER_SPEC]
전이 조건:
- Loaded 상태
- 자동매매/루틴 실행 활성
- 시간정책/종목상태/운영정책 통과
- 안정성검사 통과
- 실제 evaluation 호출에서 loaded rules 사용 확인

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\EngineRule_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:13:12 | 분류: MASTER_SPEC]
조건:
- 자동매매 실행 상태
- 루틴 활성
- 종목 상태 정상
- 시간 정책 통과
- 안정성검사 통과
- 실제 evaluation에서 loaded rules 사용
현재 상태:
- 아직 구현하지 않음

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\EngineRule_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:13:12 | 분류: MASTER_SPEC]
상태: Loaded
허용:
- evaluation 준비
- active rules hash 표시
금지:
- 자동매매 실행 중이라고 단정

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\EngineRule_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:13:12 | 분류: MASTER_SPEC]
가장 중요한 원칙:
“생성됨”과 “승인됨”과 “저장됨”과 “엔진이 읽음”과 “실제로 실행 중”은 서로 다른 상태다.
이 구분을 유지해야 이후 자동매매 동작에서 원인 추적과 안전 제어가 가능하다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
비신호는 routine_signals.json에 저장하지 않는다. 비신호는
order_queue.json 주문후보로 변환하지 않는다. 비신호는 사용자 상태값으로
승격하지 않는다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- 문서에 없는 신호 생성 금지
- 문서에 없는 상태값 생성 금지
- 문서에 없는 엔진 생성 금지
- 문서에 없는 정책 생성 금지
- 문서에 없는 용어 생성 금지
- 구현 전 반드시 방향 확인
- 확정 / 구현 / 추정 / 미확정 분리
- 현재 코드 상태와 설계 철학 분리
- 사용자에게 물어야 할 지점에서 임의 결론 금지
- 패치 전 관련 파일 실제 확인
- 테스트 통과 전 완료 선언 금지
--------------------
 10. 다음 작업 후보
 --------------------
다음 창에서 이어갈 작업은 아래 중 하나다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- UI에서 직접 주문 실행
- UI에서 OpenAPI 호출
- UI와 엔진의 상호 직접 참조
- 엔진에서 QWidget 접근
8. 검증 항목
- UI와 저장 데이터 일치
- 저장 데이터와 엔진 입력 일치
- 엔진 결과와 UI 표시 일치
9. 향후 보강
- UI-JSON 매핑표
- JSON-엔진 매핑표
- 엔진 상태전이
- 정책별 실행 흐름도

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- 모든 자동매매는 PLAN 단위로 관리한다.
- 전략(루틴)과 실행(엔진)을 명확히 분리한다.
- 정책은 루틴이 정의하고 실행은 엔진이 담당한다.
- 상태는 이벤트 기반으로만 전이한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- 모든 자동매매를 즉시 중단한다.
- 신규 주문을 차단한다.
- 현재 상태를 보존한다.
- 해제 전 안정성검사를 수행한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- 실패 판정은 최소화한다.
- 가능한 범위에서 매수완성을 유도한다.
- 후속정책은 루틴 정책에 따라 수행한다.
10. 향후 보강
- 실패 판정 알고리즘
- 후속정책 상태도
- 매수계획 상태전이

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
================================================================================
파일:
MASTER_SPEC_누락보강_122_상태전이검증시나리오_운영판정사례집_신규.txt
================================================================================
MASTER_SPEC 누락보강 122 주제 : 상태 전이 검증 시나리오 및 운영 판정
사례집 (신규)

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- 제목 좌측 정렬
- 하위 설정 반칸 들여쓰기
- 입력 높이 및 폭 통일
- 숫자 입력 우측 정렬
- 콤보박스 잘림 방지
9. 프로토타입 상태
- 구조는 확정 단계
- 로직 연결은 후속 구현
- 세부 디자인은 향후 보완 가능
10. 향후 과제
- JSON 저장 구조 연결
- 엔진 매핑
- 상태전이 검증
- 실주문 연계 전 통합 테스트

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- 하나의 정책은 하나의 목적만 가진다.
- 동일 기능을 여러 정책에 중복 구현하지 않는다.
- 공통 비교조건 정책을 적용한다.
9. 구현 원칙
- 평단관리는 루틴 정책에서 판단한다.
- 메인은 주문 수행만 담당한다.
- UI는 정책 입력만 담당한다.
10. 향후 보강
- 포지션 완성도
- 능동매수 알고리즘
- 평단관리 상태전이
- JSON 저장 구조

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
9. 검증 항목 □ 시간 기준 □ 가격 기준 □ 비교조건 □ 반복 종료 □ 후속 정책
 진입 □ 상태 동기화
10. 향후 보강
- 미체결 상태도
- 주문 재시도 정책
- JSON 저장 구조
- 엔진 상태전이

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
8. 검증 항목 □ 완료 조건 □ 후속 정책 선택 □ 상태 변경 □ UI 표시 □ JSON
 저장 □ 엔진 연계
9. 향후 보강
- 완료 상태전이도
- 후속 정책 우선순위
- 정책 충돌 처리
- 엔진 매핑

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
================================================================================
파일: MASTER_SPEC_누락보강_29_상태전이_루틴실행흐름원칙.txt
================================================================================
MASTER_SPEC 누락보강 29 주제 : 상태전이 및 루틴 실행 흐름 원칙

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
8. 검증 항목 □ 상태 누락 여부 □ 중복 전이 여부 □ 무한 반복 여부 □ UI
 표시 일치 □ 저장 상태 일치 □ 엔진 상태 일치
9. 향후 보강
- 상태전이 다이어그램
- 예외 전이도
- 복구 시나리오
- 테스트 케이스

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
10. 결론 상태전이는 프로젝트 전체에서 하나의 공통 규칙으로 관리하며,
 모든 루틴은 동일한 상태 흐름을 기반으로 동작한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
================================================================================
파일:
MASTER_SPEC_누락보강_66_히스토리기반_BUYPLAN_상태전이_생명주기관리.txt
================================================================================
MASTER_SPEC 누락보강 66 주제 : 히스토리 기반 BUY PLAN 상태 전이 및
생명주기 관리
출처 : 작업진행상황대화히스토리_3~8 비교 반영
1. 목적 BUY PLAN 생성부터 종료까지의 상태 전이와 관리 원칙을 정의한다.
2. 기본 원칙

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
================================================================================
파일:
MASTER_SPEC_누락보강_78_히스토리기반_PLAN이벤트처리_상태전이규칙.txt
================================================================================
MASTER_SPEC 누락보강 78 주제 : 히스토리 기반 PLAN 이벤트 처리 및 상태
전이 규칙
출처 : 작업진행상황대화히스토리_3~8 비교 반영

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- 모든 자동매매는 PLAN을 중심으로 동작한다.
- 전략은 루틴이 정의하고 실행은 엔진이 담당한다.
- 공통 기능은 프레임워크에, 전략 차이는 루틴에 위치한다.
3. 프레임워크 구성 ① Routine Layer
- 신호 생성
- 정책 정의
② PLAN Layer - 주문 계획 - 상태 관리 - 생명주기 관리
③ Execution Layer - 주문 실행 - 체결 처리 - 재시도 처리
④ Management Layer - 로그 - 복구 - 검토관리 - 운영 상태 관리
4. 공통 원칙

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- 모든 자동매매는 PLAN 단위로 관리한다.
- 전략과 실행을 명확히 분리한다.
- 상태는 이벤트 기반으로만 변경한다.
- 로그와 상태는 항상 동일한 정보를 유지한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- PLAN을 자동매매의 중심 단위로 사용한다.
- 전략(Routine), 계획(PLAN), 실행(Execution), 관리(Management)를
 분리한다.
- 모든 상태는 이벤트 기반으로 전이한다.
- 로그와 상태는 항상 동일성을 유지한다.

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_05.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:30 | 분류: MASTER_SPEC]
8. 검증 항목 □ UI 표시와 내부 상태 일치 □ 저장 데이터 일치 □ 이벤트
 중복 여부 □ 상태 전이 정상 여부 □ 복구 동작 확인
- 이벤트 큐 관리
- 상태 변경 로그
- 상태 변경 이력 추적
- 이벤트 디버깅 도구

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_05.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:30 | 분류: MASTER_SPEC]
================================================================================
파일:
MASTER_SPEC_누락보강_66_히스토리기반_BUYPLAN_상태전이_생명주기관리.txt
================================================================================
MASTER_SPEC 누락보강 66 주제 : 히스토리 기반 BUY PLAN 상태 전이 및
생명주기 관리
1. 목적 BUY PLAN 생성부터 종료까지의 상태 전이와 관리 원칙을 정의한다.

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_05.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:30 | 분류: MASTER_SPEC]
1. 목적 BUY PLAN 종료 시 완료, 미완성, 실패를 명확히 구분하여 상태
 판정의 일관성을 확보한다.

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_05.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:30 | 분류: MASTER_SPEC]
MASTER_SPEC 누락보강 71 주제 : 히스토리 기반 BUY PLAN 상태 표시 및 운영
상태 관리 기준

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_05.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:30 | 분류: MASTER_SPEC]
1. 목적 BUY PLAN의 내부 진행 상태와 운영자가 확인하는 상태를 명확히
 구분하기 위한 공통 기준을 정의한다.

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_05.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:30 | 분류: MASTER_SPEC]
- 내부 처리 상태와 화면 표시 상태를 혼용하지 않는다.
- 상태는 BUY PLAN 생명주기를 그대로 반영한다.
3. 내부 상태
- 주문 진행
- 부분 체결
- 매수 미완성
- 완료
- 실패
- 종료
4. 운영 표시 운영 화면은 내부 상태를 그대로 노출하는 것이 아니라 운영상
 필요한 의미로 표시한다.
5. 상태 변경 기준
- 체결 발생 시 즉시 갱신
- 재매수 수행 시 진행 상태 유지
- 목표 달성 시 완료
- 유효조건 종료 후 정책 완료 시 종료
- 상태 변경은 단일 관리 지점에서 수행한다.
- 동일 이벤트로 복수 상태를 동시에 생성하지 않는다.
- 상태 변경 이력을 기록한다.
7. 검증 항목 □ 생성 □ 진행 □ 부분 체결 □ 미완성 □ 완료 □ 종료 □ 상태
 기록 일치

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_05.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:30 | 분류: MASTER_SPEC]
================================================================================
파일:
MASTER_SPEC_누락보강_73_히스토리기반_BUYPLAN_로그상태기록_복구기준.txt
================================================================================
MASTER_SPEC 누락보강 73 주제 : 히스토리 기반 BUY PLAN 로그·상태기록 및
복구 기준

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_05.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:30 | 분류: MASTER_SPEC]
1. 목적 BUY PLAN의 전 과정에서 상태 변경 이력과 로그를 일관되게
 기록하고, 프로그램 재시작이나 복구 상황에서도 동일한 상태를 재현하기

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_05.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:30 | 분류: MASTER_SPEC]
3. 공통 처리 흐름 ① PLAN 생성 ② 주문 요청 생성 ③ 주문 전송 ④ 체결 감시
 ⑤ 상태 갱신 ⑥ PLAN 종료
4. 역할 구분 루틴
- 전략 정의
- 정책 제공
주문 엔진 - 주문 생성 - 주문 실행 - 체결 확인 - PLAN 상태 반영
- 새로운 루틴이 추가되어도 주문 엔진은 변경을 최소화한다.
- PLAN 인터페이스를 공통으로 유지한다.
- 실행 로직은 전략에 종속되지 않는다.
- BUY와 SELL을 별도의 엔진으로 분리하지 않는다.
- 공통 상태 관리와 공통 실행 절차를 사용한다.
- 로그와 복구 체계도 동일한 인터페이스를 따른다.
7. 검증 항목 □ PLAN 생성 □ 주문 실행 □ 체결 처리 □ 상태 전이 □ 종료
 처리 □ 복구 처리

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_05.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:30 | 분류: MASTER_SPEC]
- PLAN 인터페이스는 공통이다.
- 전략은 루틴마다 독립적이다.
- 실행 계층은 루틴 종류를 직접 알 필요가 없다.
3. PLAN 공통 인터페이스
- PLAN 시작
- 체결 반영
- 상태 갱신
- 종료 처리
- 로그 기록
- 복구 지원
4. 루틴 독립성 각 루틴은 다음만 정의한다.
- 진입 정책
- 재시도 정책
공통 실행 로직은 변경하지 않는다.

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_05.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:30 | 분류: MASTER_SPEC]
- 생성 → 진행
- 진행 → 부분체결
- 진행/부분체결 → 완료
- 진행/부분체결 → 미완성
- 미완성 → 완료 또는 실패 또는 취소
- 완료/실패/취소 → 종료
5. 이벤트 기준
- 신호 발생
- 주문 접수
- 체결
- 재시도
- 유효조건 종료
- 운영 종료
- 하나의 이벤트는 하나의 상태 전이만 수행한다.
- 종료 상태에서는 추가 전이를 허용하지 않는다.
- 상태 전이는 로그와 함께 기록한다.

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_05.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:30 | 분류: MASTER_SPEC]
================================================================================
파일:
MASTER_SPEC_누락보강_78_히스토리기반_PLAN이벤트처리_상태전이규칙.txt
================================================================================
MASTER_SPEC 누락보강 78 주제 : 히스토리 기반 PLAN 이벤트 처리 및 상태
전이 규칙

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_05.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:30 | 분류: MASTER_SPEC]
4. 이벤트 처리 순서 ① 이벤트 발생 ② 현재 상태 확인 ③ 전이 가능 여부
 검증 ④ 상태 전이 수행 ⑤ 로그 기록 ⑥ 후속 이벤트 대기
5. 전이 규칙
- 허용되지 않은 상태 전이는 거부한다.
- 종료 상태에서는 신규 이벤트를 처리하지 않는다.
- 동일 이벤트의 중복 처리를 방지한다.
- 이벤트 처리와 상태 변경은 원자적으로 수행한다.
- 상태 변경 후 즉시 로그와 내부 상태를 동기화한다.
- 예외 발생 시 이전 상태를 보존한다.

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_05.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:30 | 분류: MASTER_SPEC]
3. 루틴 추가 절차 ① 루틴 등록 ② 신호 정의 ③ PLAN 생성 정책 정의 ④ 종료
 정책 정의 ⑤ 공통 인터페이스 연결 ⑥ 검증
4. 공통 유지 항목
- PLAN 생명주기
- 상태 머신
- 로그 형식
- 복구 절차
5. 변경 가능 항목
- 진입 조건
- 청산 조건
- 필터
- 기존 루틴에 영향을 주지 않는다.
- 공통 인터페이스를 변경하지 않는다.
- 공통 엔진 수정은 최소화한다.

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_05.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:30 | 분류: MASTER_SPEC]
4. 데이터 흐름 신호 생성 → PLAN 생성 → 주문 요청 → 주문 실행 → 체결
 결과 → 상태 갱신 → 종료 및 기록
- 계층 간 직접 참조를 최소화한다.
- 공통 인터페이스를 통해서만 데이터를 전달한다.

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_05.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:30 | 분류: MASTER_SPEC]
- 전략(Strategy)과 실행(Execution)을 분리한다.
- PLAN은 전략과 실행을 연결하는 표준 계층이다.
- 공통 기능은 엔진에서 제공하고 전략은 루틴이 정의한다.
3. 공통 아키텍처 ① Routine Layer
② PLAN Layer - 주문 계획 - 상태 관리 - 생명주기 관리
③ Execution Layer - 주문 전송 - 체결 확인 - 재시도 수행
④ Management Layer - 로그 - 복구 - 검토관리 - 운영 상태 관리
4. 구현 원칙
- 계층 간 책임을 혼합하지 않는다.
- 동일 기능을 중복 구현하지 않는다.
- 공통 인터페이스를 우선 사용한다.
- 루틴 추가 시 기존 엔진 수정은 최소화한다.
- 새로운 루틴은 PLAN 인터페이스만 구현한다.
- 엔진은 루틴 종류를 직접 판단하지 않는다.
- 공통 상태와 이벤트 체계를 유지한다.

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_05.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:30 | 분류: MASTER_SPEC]
6. 검증 항목 □ 계층 책임 분리 □ PLAN 일관성 □ 공통 인터페이스 유지 □
 이벤트 처리 일관성 □ 로그/복구 일관성
공통 아키텍처이며, 향후 모든 자동매매 기능 구현의 최상위 설계

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_05.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:30 | 분류: MASTER_SPEC]
- 모든 자동매매는 PLAN을 중심으로 동작한다.
- 전략은 루틴이 정의하고 실행은 엔진이 담당한다.
- 공통 기능은 프레임워크에, 전략 차이는 루틴에 위치한다.
3. 프레임워크 구성 ① Routine Layer
③ Execution Layer - 주문 실행 - 체결 처리 - 재시도 처리
4. 공통 원칙
- 계층 간 책임을 명확히 분리한다.
- 이벤트 기반 상태 전이를 사용한다.
- 로그와 상태를 항상 동기화한다.
- 신규 루틴은 기존 프레임워크를 재사용한다.
- BUY/SELL 외 새로운 PLAN도 동일 구조를 따른다.
- 정책 변경은 루틴에서 해결한다.
- 실행 계층은 전략과 독립적으로 유지한다.
- 공통 기능은 중복 구현하지 않는다.

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_05.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:30 | 분류: MASTER_SPEC]
================================================================================
파일:
MASTER_SPEC_누락보강_88_히스토리기반_PLAN중심_자동매매프레임워크_운영표준.txt
================================================================================
MASTER_SPEC 누락보강 88 주제 : 히스토리 기반 PLAN 중심 자동매매
프레임워크 운영 표준

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_05.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:30 | 분류: MASTER_SPEC]
MASTER_SPEC 누락보강 89 주제 : 히스토리 기반 PLAN 중심 자동매매
프레임워크 구현 체크리스트

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_05.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:30 | 분류: MASTER_SPEC]
MASTER_SPEC 누락보강 90 주제 : 히스토리 기반 PLAN 중심 자동매매
프레임워크 최종 운영 검증 기준

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_05.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:30 | 분류: MASTER_SPEC]
4. 핵심 검증 항목 □ PLAN 생성 정상 □ 중복 PLAN 없음 □ 상태 머신 정상 □
 이벤트 기반 처리 □ 로그 일치 □ 복구 일치 □ 검토관리 연계 정상
5. 예외 검증
- 주문 실패
- 상태 복구
6. 최종 판정 기준

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_05.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:30 | 분류: MASTER_SPEC]
MASTER_SPEC 누락보강 91 주제 : 히스토리 기반 PLAN 중심 자동매매
프레임워크 릴리스 승인 기준

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_05.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:30 | 분류: MASTER_SPEC]
MASTER_SPEC 누락보강 95 주제 : 히스토리 기반 PLAN 중심 자동매매
프레임워크 최종 아키텍처 보존 기준

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_05.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:30 | 분류: MASTER_SPEC]
- Routine Layer
- PLAN Layer
- Execution Layer
- Management Layer
- 이벤트 기반 상태 전이
- 공통 로그 및 복구 체계
4. 변경 가능 요소
- 루틴별 전략
- 주문 정책
- UI 구성

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_05.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:30 | 분류: MASTER_SPEC]
MASTER_SPEC 누락보강 97 주제 : 히스토리 기반 PLAN 중심 자동매매
프레임워크 최종 통합 설계 기준

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_05.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:30 | 분류: MASTER_SPEC]
3. 통합 아키텍처 ① Routine Layer : 신호·정책 ② PLAN Layer : 계획·상태 ③
 Execution Layer : 주문·체결 ④ Management Layer : 로그·복구·운영
4. 유지 기준
- 공통 로그/복구 유지
- 정책은 루틴에서, 실행은 엔진에서 처리한다.

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_05.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:30 | 분류: MASTER_SPEC]
MASTER_SPEC 누락보강 98 주제 : 히스토리 기반 PLAN 중심 자동매매
프레임워크 최종 운영 아키텍처 기준

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_04.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:24 | 분류: MASTER_SPEC]
============================================================
uffer 정책
- 일시적인 데이터 저장
- 처리 완료 후 즉시 해제
- 장기 보관 금지
- Runtime 상태와 동기화
5. 우선순위

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_04.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:24 | 분류: MASTER_SPEC]
9. 검증 항목 □ 시간 기준 □ 가격 기준 □ 비교조건 □ 반복 종료 □ 후속 정책
 진입 □ 상태 동기화
- 미체결 상태도
- 주문 재시도 정책
- 엔진 상태전이

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_04.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:24 | 분류: MASTER_SPEC]
8. 검증 항목 □ 완료 조건 □ 후속 정책 선택 □ 상태 변경 □ UI 표시 □ JSON
 저장 □ 엔진 연계
9. 향후 보강
- 완료 상태전이도
- 후속 정책 우선순위
- 정책 충돌 처리

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_04.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:24 | 분류: MASTER_SPEC]
8. 검증 항목 □ 상태 누락 여부 □ 중복 전이 여부 □ 무한 반복 여부 □ UI
 표시 일치 □ 저장 상태 일치 □ 엔진 상태 일치
- 상태전이 다이어그램
- 예외 전이도
- 복구 시나리오
- 테스트 케이스

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_04.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:24 | 분류: MASTER_SPEC]
8. 검증 항목 □ 공통 생성 함수 사용 여부 □ 스타일 일관성 □ 상태 제어
 일관성 □ 레이아웃 정렬 □ 중복 코드

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_03.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:18 | 분류: MASTER_SPEC]
- 종목코드
- 종목명
- 루틴 연결
- 운영 상태
- PLAN 상태
- 예산 상태
- 주문 상태
- 보유 상태
- 로그 참조
4. 종목 상태 전이 상태 변경은 이벤트 기반으로만 수행하며, 운영 엔진이
 단일 관리 주체가 된다.
5. 종목 등록 정책
- 루틴 미지정 허용 여부 정책
- 자동 초기화
- 설정 검증 후 활성화
6. 검토관리 연계 다음 상황은 검토관리 대상으로 전환할 수 있다.
- 상태 불일치
- 주문 이상
- 체결 이상
- 복구 실패
- 운영 정책 위반
7. 복구 정책
- 재시작 시 종목 상태 복원
- PLAN 및 주문 상태 재동기화
- 운영 가능 여부 재판정
8. UI 연계
- 관제창
- 종목 등록창
- 검토관리창
- 상태 표시
- 색상 정책
9. 구현 원칙

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_03.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:18 | 분류: MASTER_SPEC]
- 이벤트 순서를 보존한다.
- 동일 이벤트의 중복 처리를 방지한다.
- 캐시와 내부 상태를 주기적으로 검증한다.
6. 데이터 검증
- 누락 감지
- 시간 역전 감지
- 비정상 가격 감지
- 장상태 일치 여부
- 종목 등록 상태 확인
7. 장애 대응
- 실시간 해제
- 서버 재접속
- 캐시 재생성
- 동기화 재검증
8. 성능 정책
- 불필요한 UI 갱신 최소화
- 변경 데이터만 전달
- 종목 단위 처리
- 큐 기반 비동기 처리
- 멀티 계좌
- 멀티 브로커
- 멀티 시장
- 실시간 데이터 저장소 연계
- OpenAPI 이벤트를 직접 UI나 루틴으로 전달하지 않는다.
- 실시간 캐시를 단일 진실 공급원(Source of Truth)으로 사용한다.
- 모든 엔진은 공통 이벤트 브로커를 통해 데이터를 수신한다.
반영 원칙 본 문서는 실시간 데이터 수집, 캐시 및 동기화 구조를 신규
정의한 설계 문서이다.

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_03.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:18 | 분류: MASTER_SPEC]
3. 스케줄링 계층 ① 이벤트 수신 ② 실행 대상 선별 ③ 우선순위 계산 ④ 실행
 큐 생성 ⑤ 실행 ⑥ 결과 반영
4. 우선순위 요소
- 시간 정책
- 루틴 우선순위
- 종목 상태
- PLAN 진행 상태
- 예산 가용성
- 위험도
5. 실행 큐
- FIFO 기본
- 우선순위 재정렬 허용
- 중복 실행 방지
- 실행 중 락(Lock) 적용
- 동일 종목 중복 실행 금지
- 동일 PLAN 중복 실행 금지
- 예산 충돌 방지
- 주문 충돌 방지
7. 부하 관리
- 실행량 제한
- 큐 길이 감시
- 지연 실행 허용
- 비정상 루틴 자동 격리
8. 장애 대응
- 실행 실패 재시도
- 반복 실패 격리
- 로그 기록
- 검토관리 연계
- 다중 계좌 스케줄링
- 분산 실행
- 멀티 프로세스
- 멀티 서버 지원
- 스케줄러는 전략을 변경하지 않는다.
- 루틴은 실행 순서를 직접 제어하지 않는다.
- 실행 엔진은 스케줄러의 결과만 수행한다.
반영 원칙 본 문서는 다중 루틴 스케줄링과 실행 우선순위 엔진을 신규

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_03.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:18 | 분류: MASTER_SPEC]
- 이벤트를 통해서만 상태가 변경된다.
- 동일 조건에서는 항상 동일한 결과를 보장한다.
- 상태 전이는 로그에 기록한다.
5. 검토관리 진입 기준
- 반복 오류

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_03.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:18 | 분류: MASTER_SPEC]
- UI는 화면 처리만 담당한다.
- 주문/체결 처리는 UI Thread에서 수행하지 않는다.
- 장시간 작업은 Worker Thread로 분리한다.
4. 동기화 대상
- Runtime 상태
5. 동시성 제어

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_03.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:18 | 분류: MASTER_SPEC]
1. 목적 장시간 자동매매 운영에서도 안정적인 메모리 사용과 빠른 데이터
 접근을 보장하기 위한 표준 전략을 정의한다.
- 종목 객체
- PLAN 객체
- 주문 객체
- 체결 객체
- UI 표시 데이터
- 설정 정보
3. 메모리 계층 ① 영구 저장소 ② Runtime 객체 ③ Cache 객체 ④ UI 표시 객체
4. 캐시 정책

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_02.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:10 | 분류: MASTER_SPEC]
- 문서에 없는 신호 생성 금지
- 문서에 없는 상태값 생성 금지
- 문서에 없는 엔진 생성 금지
- 문서에 없는 정책 생성 금지
- 문서에 없는 용어 생성 금지
- 구현 전 반드시 방향 확인
- 확정 / 구현 / 추정 / 미확정 분리
- 현재 코드 상태와 설계 철학 분리
- 사용자에게 물어야 할 지점에서 임의 결론 금지
- 패치 전 관련 파일 실제 확인
- 테스트 통과 전 완료 선언 금지

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_02.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:10 | 분류: MASTER_SPEC]
================================================================================
파일: MASTER_SPEC_누락보강_05_상태제어_비활성정책.txt
================================================================================
MASTER_SPEC 누락보강 05 주제 : 상태제어 및 비활성 정책
- 설정 사용 여부를 사용자가 즉시 식별할 수 있도록 상태를 일관되게
 표시한다.
- UI 상태와 내부 상태가 서로 다르게 보이지 않도록 한다.
- 체크박스는 항상 활성 상태를 유지한다.
- 체크 해제 시 체크박스를 제외한 관련 컨트롤만 비활성 처리한다.
- 비활성은 Qt 기본 Disabled 상태를 사용한다.
3. 적용 대상

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_02.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:10 | 분류: MASTER_SPEC]
================================================================================
파일:
MASTER_SPEC_누락보강_109_데이터흐름_상태관리_이벤트전달체계_통합기준.txt
================================================================================
MASTER_SPEC 누락보강 109 주제 : 프로젝트 데이터 흐름·상태 관리·이벤트
전달 체계 통합 기준

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_86_히스토리기반_PLAN설계변경관리_아키텍처유지원칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:59:12 | 분류: MASTER_SPEC]
4. 변경 금지 대상
- PLAN 기본 생명주기
- 루틴/PLAN/실행 계층 분리
- 공통 상태 관리
- 공통 인터페이스

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_134_RuntimeQueue_Buffer관리체계_신규.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:51:26 | 분류: MASTER_SPEC]
4. Buffer 정책
- 일시적인 데이터 저장
- 처리 완료 후 즉시 해제
- 장기 보관 금지
- Runtime 상태와 동기화

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_133_메모리관리_객체캐시전략_신규.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:51:20 | 분류: MASTER_SPEC]
1. 목적
장시간 자동매매 운영에서도 안정적인 메모리 사용과 빠른 데이터 접근을
보장하기 위한 표준 전략을 정의한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_133_메모리관리_객체캐시전략_신규.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:51:20 | 분류: MASTER_SPEC]
2. 관리 대상
- 종목 객체
- PLAN 객체
- 주문 객체
- 체결 객체
- Runtime 상태
- UI 표시 데이터
- 설정 정보
3. 메모리 계층
① 영구 저장소
② Runtime 객체
③ Cache 객체
④ UI 표시 객체

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_133_메모리관리_객체캐시전략_신규.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:51:20 | 분류: MASTER_SPEC]
6. 메모리 최적화
- 불필요한 객체 제거
- 대용량 데이터 지연 로딩
- 순환 참조 방지
- 장시간 미사용 객체 정리
7. 무결성
- 캐시와 Runtime 상태 일치
- 참조 무결성 유지
- 객체 중복 생성 방지
8. 모니터링
- 메모리 사용량
- 캐시 적중률
- 객체 생성/해제 횟수
- 누수 의심 객체 추적

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_132_Thread관리_동시성아키텍처_신규.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:51:14 | 분류: MASTER_SPEC]
4. 동기화 대상
- Runtime 상태
- PLAN 상태
- 주문 정보
- 체결 정보
- 예산 정보
- 검토관리 정보

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_128_Runtime데이터저장소_Persistence아키텍처_신규.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:50:44 | 분류: MASTER_SPEC]
2. Runtime 데이터 대상
- 종목 상태(State)
- PLAN 정보
- 주문 정보
- 체결 정보
- 예산 상태
- 운영 상태
- 검토관리 정보
- 임시 캐시
3. 저장 계층
① 메모리(Runtime)
② Runtime 파일
③ 로그 저장소
④ 백업 저장소

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_128_Runtime데이터저장소_Persistence아키텍처_신규.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:50:44 | 분류: MASTER_SPEC]
4. 저장 정책
- 이벤트 발생 시 즉시 저장
- 중요 상태 변경 시 강제 저장
- 주기적 자동 저장
- 종료 시 최종 저장

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_127_프로젝트구성요소_Lifecycle관리체계_신규.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:50:38 | 분류: MASTER_SPEC]
8. 생명주기 검증
□ 생성 정상
□ 상태 전이 정상
□ 종료 정상
□ 삭제 정상
□ 복원 정상
□ 로그 기록
9. 향후 확장
- 객체 버전 관리
- Snapshot 기반 복원
- 자동 정리 정책
- 장기 보관 정책

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_125_보안_권한관리_Audit아키텍처_신규.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:50:22 | 분류: MASTER_SPEC]
6. 감사 기록
- 수행 시각
- 수행 주체
- 대상 기능
- 변경 전 상태
- 변경 후 상태
- 결과
- 사유

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_122_상태전이검증시나리오_운영판정사례집_신규.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:50:04 | 분류: 구현로그/검증보고]
MASTER_SPEC 누락보강 122
주제 : 상태 전이 검증 시나리오 및 운영 판정 사례집 (신규)

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_122_상태전이검증시나리오_운영판정사례집_신규.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:50:04 | 분류: 구현로그/검증보고]
4. 상태 전이 규칙
- 이벤트를 통해서만 상태가 변경된다.
- 동일 조건에서는 항상 동일한 결과를 보장한다.
- 상태 전이는 로그에 기록한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_122_상태전이검증시나리오_운영판정사례집_신규.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:50:04 | 분류: 구현로그/검증보고]
5. 검토관리 진입 기준
- 복구 실패
- 데이터 불일치
- 반복 오류
- 운영 정책 위반
- 수동 확인 필요

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_117_다중루틴_스케줄링_실행우선순위엔진_신규.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:39:14 | 분류: MASTER_SPEC]
4. 우선순위 요소
- 운영 상태
- 시간 정책
- 루틴 우선순위
- 종목 상태
- PLAN 진행 상태
- 예산 가용성
- 위험도

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_115_장애복구_운영자동화아키텍처_신규.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:39:06 | 분류: 운영정책]
1. 목적
프로그램 장애, API 오류, 네트워크 단절, 비정상 종료 상황에서도
자동매매 시스템의 무결성을 유지하기 위한 복구 체계를 정의한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_115_장애복구_운영자동화아키텍처_신규.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:39:06 | 분류: 운영정책]
3. 복구 단계
① 장애 감지
② 신규 주문 중지
③ 현재 상태 보존
④ 로그 기록
⑤ 복구 가능성 분석
⑥ 자동 복구 수행
⑦ 무결성 검사
⑧ 운영 재개 또는 검토관리

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_115_장애복구_운영자동화아키텍처_신규.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:39:06 | 분류: 운영정책]
4. 자동 복구 엔진
- 로그인 재시도
- 실시간 재등록
- TR 재조회
- PLAN 상태 재동기화
- 주문 상태 재조회
- 계좌 상태 재조회

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_115_장애복구_운영자동화아키텍처_신규.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:39:06 | 분류: 운영정책]
5. 무결성 검사
- 보유 수량 일치
- 주문 상태 일치
- PLAN 상태 일치
- 예산 상태 일치
- 종목 상태 일치
- 로그 일관성 확인

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_115_장애복구_운영자동화아키텍처_신규.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:39:06 | 분류: 운영정책]
6. 운영 자동화
- 정기 상태 점검
- 시간 정책 자동 재판정
- 실시간 연결 감시
- 이상 징후 자동 탐지
- 운영 알림 생성

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_114_실시간데이터수집_캐시_동기화아키텍처_신규.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:39:00 | 분류: MASTER_SPEC]
5. 동기화 정책
- 이벤트 순서를 보존한다.
- 동일 이벤트의 중복 처리를 방지한다.
- 캐시와 내부 상태를 주기적으로 검증한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_114_실시간데이터수집_캐시_동기화아키텍처_신규.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:39:00 | 분류: MASTER_SPEC]
6. 데이터 검증
- 누락 감지
- 시간 역전 감지
- 비정상 가격 감지
- 장상태 일치 여부
- 종목 등록 상태 확인
7. 장애 대응
- 이벤트 누락
- 실시간 해제
- 서버 재접속
- 캐시 재생성
- 동기화 재검증

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_112_종목관리엔진_종목생명주기설계_신규.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:38:42 | 분류: MASTER_SPEC]
3. 종목 객체 관리
- 종목코드
- 종목명
- 루틴 연결
- 운영 상태
- PLAN 상태
- 예산 상태
- 주문 상태
- 보유 상태
- 로그 참조
4. 종목 상태 전이
상태 변경은 이벤트 기반으로만 수행하며,
운영 엔진이 단일 관리 주체가 된다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_112_종목관리엔진_종목생명주기설계_신규.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:38:42 | 분류: MASTER_SPEC]
6. 검토관리 연계
다음 상황은 검토관리 대상으로 전환할 수 있다.
- 상태 불일치
- 주문 이상
- 체결 이상
- 복구 실패
- 운영 정책 위반

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_111_OpenAPI연동_실시간처리아키텍처_신규.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:35:06 | 분류: MASTER_SPEC]
3. 로그인 정책
- 프로그램 시작 시 로그인 확인
- 서버 연결 상태 감시
- 재접속 정책
- 장애 감지 및 운영정지 연계
4. 실시간 처리
- 종목 등록/해제
- 이벤트 분배
- 중복 등록 방지
- 종목별 이벤트 큐 관리
5. TR 처리
- 요청 큐
- 응답 대기
- 연속조회
- 요청 제한 관리
- 실패 재시도 정책
6. 주문 처리
- 주문 요청 표준 인터페이스
- 주문번호 관리
- 정정/취소 처리
- 주문 상태 추적

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_111_OpenAPI연동_실시간처리아키텍처_신규.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:35:06 | 분류: MASTER_SPEC]
9. 장애 대응
- 서버 끊김
- 이벤트 누락
- 주문 응답 지연
- 체결 불일치
- 재로그인
- 상태 복구
10. 로그
- 로그인
- TR
- 실시간
- 주문
- 체결
- 오류
- 복구

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_109_데이터흐름_상태관리_이벤트전달체계_통합기준.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:30:58 | 분류: MASTER_SPEC]
2. 상태 관리
- 상태는 단일 관리 주체를 가진다.
- 내부 상태와 화면 표시 상태를 분리한다.
- 상태 변경은 반드시 기록 가능해야 한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_108_프로젝트구조_모듈구성_의존성관리_통합기준.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:30:46 | 분류: MASTER_SPEC]
4. 공통 모듈
- 공통 유틸리티
- 공통 상태 관리
- 공통 로그
- 공통 JSON 처리
- 공통 UI Helper

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_105_운영정책_통합기준.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:30:30 | 분류: 운영정책]
2. 검토관리
- 자동 처리 불가능한 예외를 관리한다.
- 상태 불일치, 복구 실패, 미해결 주문 등을 대상으로 한다.
- 운영자가 확인 후 복귀 또는 정리한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_105_운영정책_통합기준.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:30:30 | 분류: 운영정책]
3. 긴급정지
- 모든 자동매매를 즉시 중단한다.
- 신규 주문을 차단한다.
- 현재 상태를 보존한다.
- 해제 전 안정성검사를 수행한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_105_운영정책_통합기준.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:30:30 | 분류: 운영정책]
5. 시간정책
- 장전, 정규장, 동시호가, 장후 정책을 구분한다.
- 루틴은 시간 정책을 준수한다.
- 운영 상태는 시간 변경 시 즉시 재판정한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_105_운영정책_통합기준.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:30:30 | 분류: 운영정책]
6. 안정성검사
- 주문 상태 일치
- 보유 상태 일치
- PLAN 상태 일치
- 로그 일치
- 복구 가능 여부 확인

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_101_UI구현표준_통합본.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:30:10 | 분류: MASTER_SPEC]
3. 활성/비활성 정책
- 체크박스 기반 활성화
- 비활성 시 회색 표시
- 관련 하위 옵션 동시 비활성
- 상태 변경 즉시 UI 반영

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_100_히스토리기반_PLAN중심_자동매매프레임워크_최종종합원칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:23:54 | 분류: MASTER_SPEC]
2. 핵심 철학
- 모든 자동매매는 PLAN 단위로 관리한다.
- 전략(루틴)과 실행(엔진)을 명확히 분리한다.
- 정책은 루틴이 정의하고 실행은 엔진이 담당한다.
- 상태는 이벤트 기반으로만 전이한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_100_히스토리기반_PLAN중심_자동매매프레임워크_최종종합원칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:23:54 | 분류: MASTER_SPEC]
3. 최상위 구조
① Routine Layer : 전략·신호
② PLAN Layer : 주문 계획·상태·생명주기
③ Execution Layer : 주문·체결·재시도
④ Management Layer : 로그·복구·운영·검토관리

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_100_히스토리기반_PLAN중심_자동매매프레임워크_최종종합원칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:23:54 | 분류: MASTER_SPEC]
4. 공통 유지 원칙
- PLAN 생명주기 유지
- 공통 인터페이스 유지
- 공통 상태 머신 유지
- 공통 이벤트 처리 유지
- 공통 로그 및 복구 체계 유지

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_100_히스토리기반_PLAN중심_자동매매프레임워크_최종종합원칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:23:54 | 분류: MASTER_SPEC]
6. 운영 원칙
- 상태와 로그는 항상 일치해야 한다.
- 예외 발생 시 복구를 우선한다.
- 검토관리는 자동 처리 불가능한 상황에서만 사용한다.
- 구현 변경 시 문서를 함께 갱신한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_99_히스토리기반_PLAN중심_자동매매프레임워크_최종구조검증기준.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:23:48 | 분류: 구현로그/검증보고]
3. 검증 대상
- Routine Layer
- PLAN Layer
- Execution Layer
- Management Layer
- 공통 인터페이스
- 상태 머신
- 이벤트 처리

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_99_히스토리기반_PLAN중심_자동매매프레임워크_최종구조검증기준.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:23:48 | 분류: 구현로그/검증보고]
4. 필수 확인 사항
□ PLAN 생명주기 유지
□ 이벤트 기반 상태 전이
□ 상태·로그 동기화
□ 복구 절차 일관성
□ 계층 간 의존 최소화
□ 루틴 독립성 유지

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_99_히스토리기반_PLAN중심_자동매매프레임워크_최종구조검증기준.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:23:48 | 분류: 구현로그/검증보고]
5. 변경 검증
- 신규 기능이 공통 구조를 훼손하지 않는가
- 기존 루틴과 호환되는가
- 공통 엔진 수정이 최소화되었는가
6. 승인 기준
- 구조적 결함 없음
- 상태 불일치 없음
- 로그 불일치 없음
- 장기 확장성 유지

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_98_히스토리기반_PLAN중심_자동매매프레임워크_최종운영아키텍처기준.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:23:44 | 분류: 운영정책]
2. 운영 아키텍처
① Routine Layer : 전략 및 신호 생성
② PLAN Layer : 주문 계획·상태·생명주기 관리
③ Execution Layer : 주문 실행·체결·재시도
④ Management Layer : 로그·복구·검토관리·운영 상태

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_98_히스토리기반_PLAN중심_자동매매프레임워크_최종운영아키텍처기준.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:23:44 | 분류: 운영정책]
3. 운영 원칙
- 모든 주문은 PLAN 단위로 관리한다.
- 상태 변경은 이벤트를 통해서만 수행한다.
- 공통 인터페이스를 유지한다.
- 상태와 로그를 항상 동기화한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_98_히스토리기반_PLAN중심_자동매매프레임워크_최종운영아키텍처기준.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:23:44 | 분류: 운영정책]
4. 운영 절차
① 루틴 활성
② 신호 검출
③ PLAN 생성
④ 주문 실행
⑤ 체결 반영
⑥ 상태 갱신
⑦ 완료/미완성/실패 판정
⑧ 종료 및 기록
⑨ 복구 및 검토관리 연계

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_97_히스토리기반_PLAN중심_자동매매프레임워크_최종통합설계기준.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:23:40 | 분류: MASTER_SPEC]
2. 통합 설계 원칙
- PLAN을 자동매매의 중심 단위로 사용한다.
- 전략(Routine), 계획(PLAN), 실행(Execution), 관리(Management)를 분리한다.
- 모든 상태는 이벤트 기반으로 전이한다.
- 로그와 상태는 항상 동일성을 유지한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_97_히스토리기반_PLAN중심_자동매매프레임워크_최종통합설계기준.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:23:40 | 분류: MASTER_SPEC]
3. 통합 아키텍처
① Routine Layer : 신호·정책
② PLAN Layer : 계획·상태
③ Execution Layer : 주문·체결
④ Management Layer : 로그·복구·운영

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_97_히스토리기반_PLAN중심_자동매매프레임워크_최종통합설계기준.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:23:40 | 분류: MASTER_SPEC]
4. 유지 기준
- 공통 인터페이스 유지
- 공통 상태 머신 유지
- 공통 이벤트 처리 유지
- 공통 로그/복구 유지

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_96_히스토리기반_PLAN중심_자동매매프레임워크_핵심설계원칙종합.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:23:34 | 분류: MASTER_SPEC]
2. 핵심 설계 원칙
- 모든 자동매매는 PLAN 단위로 관리한다.
- 전략과 실행을 명확히 분리한다.
- 상태는 이벤트 기반으로만 변경한다.
- 로그와 상태는 항상 동일한 정보를 유지한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_96_히스토리기반_PLAN중심_자동매매프레임워크_핵심설계원칙종합.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:23:34 | 분류: MASTER_SPEC]
4. 공통 유지 기준
- PLAN 생명주기 유지
- 공통 상태 머신 유지
- 공통 이벤트 처리 유지
- 공통 인터페이스 유지
- 공통 로그 및 복구 체계 유지

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_95_히스토리기반_PLAN중심_자동매매프레임워크_최종아키텍처보존기준.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:23:30 | 분류: MASTER_SPEC]
2. 핵심 보존 원칙
- PLAN 중심 구조를 유지한다.
- 전략과 실행 계층을 혼합하지 않는다.
- 공통 인터페이스를 우선한다.
- 공통 상태 머신을 유지한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_95_히스토리기반_PLAN중심_자동매매프레임워크_최종아키텍처보존기준.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:23:30 | 분류: MASTER_SPEC]
3. 반드시 유지할 요소
- Routine Layer
- PLAN Layer
- Execution Layer
- Management Layer
- 이벤트 기반 상태 전이
- 공통 로그 및 복구 체계
4. 변경 가능 요소
- 루틴별 전략
- 필터
- 주문 정책
- UI 구성
- 운영 정책

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_95_히스토리기반_PLAN중심_자동매매프레임워크_최종아키텍처보존기준.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:23:30 | 분류: MASTER_SPEC]
6. 금지 사항
- PLAN 생명주기 임의 변경
- 공통 상태 정의 변경
- 계층 책임 혼합
- 로그·상태 불일치 허용
- 루틴별 독자 실행 구조 생성

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_94_히스토리기반_PLAN중심_자동매매프레임워크_장기운영_구조보존원칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:23:22 | 분류: 운영정책]
3. 보존 대상
- PLAN 생명주기
- 상태 머신
- 이벤트 처리 체계
- 공통 인터페이스
- 계층 분리 원칙
- 로그 및 복구 체계

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_92_히스토리기반_PLAN중심_자동매매프레임워크_유지보수_버전관리원칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:23:08 | 분류: MASTER_SPEC]
3. 버전 관리 대상
- PLAN 구조
- 상태 머신
- 공통 인터페이스
- 이벤트 처리
- 주문 엔진
- 운영 정책
4. 변경 절차
① 변경 요청 접수
② 영향 범위 분석
③ 구현
④ 테스트
⑤ 문서 갱신
⑥ 버전 반영

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_91_히스토리기반_PLAN중심_자동매매프레임워크_릴리스승인기준.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:23:00 | 분류: MASTER_SPEC]
3. 필수 검증 항목
□ 루틴 정상 동작
□ PLAN 생성 및 종료
□ 주문 실행
□ 상태 머신
□ 이벤트 처리
□ 로그 기록
□ 복구 처리
□ 검토관리 연계

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_91_히스토리기반_PLAN중심_자동매매프레임워크_릴리스승인기준.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:23:00 | 분류: MASTER_SPEC]
5. 승인 조건
- 치명적 구조 오류 없음
- 상태 불일치 없음
- 로그와 내부 상태 일치
- 기존 루틴과 호환성 유지
- 공통 인터페이스 유지

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_91_히스토리기반_PLAN중심_자동매매프레임워크_릴리스승인기준.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:23:00 | 분류: MASTER_SPEC]
6. 승인 보류 조건
- 상태 전이 오류
- 복구 실패
- 중복 PLAN 생성
- 로그 누락
- 구조 변경으로 인한 호환성 문제

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_90_히스토리기반_PLAN중심_자동매매프레임워크_최종운영검증기준.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:22:54 | 분류: 구현로그/검증보고]
2. 운영 검증 원칙
- 기능 검증보다 전체 흐름 검증을 우선한다.
- 상태, 로그, 복구는 항상 동일한 결과를 유지해야 한다.
- 운영 중 예외도 정상 시나리오와 동일한 기준으로 검증한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_90_히스토리기반_PLAN중심_자동매매프레임워크_최종운영검증기준.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:22:54 | 분류: 구현로그/검증보고]
4. 핵심 검증 항목
□ PLAN 생성 정상
□ 중복 PLAN 없음
□ 상태 머신 정상
□ 이벤트 기반 처리
□ 로그 일치
□ 복구 일치
□ 검토관리 연계 정상

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_90_히스토리기반_PLAN중심_자동매매프레임워크_최종운영검증기준.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:22:54 | 분류: 구현로그/검증보고]
5. 예외 검증
- 통신 오류
- 주문 실패
- 부분 체결
- CANCEL
- 프로그램 재시작
- 상태 복구

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_90_히스토리기반_PLAN중심_자동매매프레임워크_최종운영검증기준.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:22:54 | 분류: 구현로그/검증보고]
6. 최종 판정 기준
- 설계 철학과 구현이 일치한다.
- 운영 중 상태 불일치가 없다.
- 공통 인터페이스가 유지된다.
- 신규 루틴 추가 시 기존 구조가 유지된다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_88_히스토리기반_PLAN중심_자동매매프레임워크_운영표준.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:22:32 | 분류: 운영정책]
MASTER_SPEC 누락보강 88
주제 : 히스토리 기반 PLAN 중심 자동매매 프레임워크 운영 표준
출처 : 작업진행상황대화히스토리_3~8 비교 반영

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_88_히스토리기반_PLAN중심_자동매매프레임워크_운영표준.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:22:32 | 분류: 운영정책]
2. 운영 원칙
- 모든 주문은 PLAN 단위로 관리한다.
- 전략과 실행을 혼합하지 않는다.
- 상태, 로그, 복구는 항상 동일 기준을 사용한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_88_히스토리기반_PLAN중심_자동매매프레임워크_운영표준.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:22:32 | 분류: 운영정책]
3. 운영 절차
① 루틴 활성
② 신호 검출
③ PLAN 생성
④ 주문 실행
⑤ 체결 감시
⑥ 상태 갱신
⑦ 종료 및 기록

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_88_히스토리기반_PLAN중심_자동매매프레임워크_운영표준.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:22:32 | 분류: 운영정책]
5. 장애 대응
- 예외 발생 시 상태를 우선 보존한다.
- 복구 가능 여부를 먼저 판단한다.
- 복구 불가 시 종료 정책과 검토관리 정책을 적용한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_85_히스토리기반_PLAN중심_자동매매프레임워크_최종설계원칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:22:22 | 분류: MASTER_SPEC]
2. 최상위 설계 철학
- 모든 자동매매는 PLAN을 중심으로 동작한다.
- 전략은 루틴이 정의하고 실행은 엔진이 담당한다.
- 공통 기능은 프레임워크에, 전략 차이는 루틴에 위치한다.
3. 프레임워크 구성
① Routine Layer
- 신호 생성
- 정책 정의
② PLAN Layer
- 주문 계획
- 상태 관리
- 생명주기 관리
③ Execution Layer
- 주문 실행
- 체결 처리
- 재시도 처리
④ Management Layer
- 로그
- 복구
- 검토관리
- 운영 상태 관리

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_85_히스토리기반_PLAN중심_자동매매프레임워크_최종설계원칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:22:22 | 분류: MASTER_SPEC]
4. 공통 원칙
- 계층 간 책임을 명확히 분리한다.
- 공통 인터페이스를 유지한다.
- 이벤트 기반 상태 전이를 사용한다.
- 로그와 상태를 항상 동기화한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_84_히스토리기반_PLAN기반_자동매매엔진_공통아키텍처_구현원칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:22:18 | 분류: MASTER_SPEC]
5. 확장 원칙
- 새로운 루틴은 PLAN 인터페이스만 구현한다.
- 엔진은 루틴 종류를 직접 판단하지 않는다.
- 공통 상태와 이벤트 체계를 유지한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_83_히스토리기반_PLAN기반_자동매매엔진_계층구조_데이터흐름.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:22:10 | 분류: MASTER_SPEC]
2. 기본 철학
- 계층은 단방향으로 데이터를 전달한다.
- 하위 계층은 상위 전략을 임의로 변경하지 않는다.
- 공통 인터페이스를 통해서만 정보를 교환한다.
3. 계층 구조
① 루틴(Routine)
- 신호 생성
- 정책 정의
- 종료 조건 정의
② PLAN
- 주문 계획 생성
- 상태 관리
- 생명주기 관리
③ 주문 엔진
- 주문 생성
- 주문 전송
- 체결 감시
- 주문 상태 반영
④ 운영 관리
- 로그 기록
- 상태 저장
- 복구
- 검토관리 연계

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_83_히스토리기반_PLAN기반_자동매매엔진_계층구조_데이터흐름.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:22:10 | 분류: MASTER_SPEC]
4. 데이터 흐름
신호 생성
→ PLAN 생성
→ 주문 요청
→ 주문 실행
→ 체결 결과
→ 상태 갱신
→ 종료 및 기록

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_81_히스토리기반_PLAN확장성_신규루틴적용원칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:22:00 | 분류: MASTER_SPEC]
3. 루틴 추가 절차
① 루틴 등록
② 신호 정의
③ PLAN 생성 정책 정의
④ 종료 정책 정의
⑤ 공통 인터페이스 연결
⑥ 검증
4. 공통 유지 항목
- PLAN 생명주기
- 상태 머신
- 이벤트 처리
- 로그 형식
- 복구 절차
5. 변경 가능 항목
- 진입 조건
- 청산 조건
- 필터
- 재시도 정책
- 유효 조건

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_79_히스토리기반_PLAN_예외처리_복구우선순위.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:21:44 | 분류: MASTER_SPEC]
3. 예외 유형
- 주문 전송 실패
- 체결 정보 불일치
- 상태 저장 실패
- 통신 오류
- 내부 예외
- 프로그램 재시작

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_79_히스토리기반_PLAN_예외처리_복구우선순위.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:21:44 | 분류: MASTER_SPEC]
4. 처리 우선순위
① 현재 상태 보존
② 원인 기록
③ 복구 가능 여부 확인
④ 자동 복구 수행
⑤ 복구 실패 시 종료 정책 적용
⑥ 필요 시 검토관리 지정

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_78_히스토리기반_PLAN이벤트처리_상태전이규칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:21:40 | 분류: MASTER_SPEC]
MASTER_SPEC 누락보강 78
주제 : 히스토리 기반 PLAN 이벤트 처리 및 상태 전이 규칙
출처 : 작업진행상황대화히스토리_3~8 비교 반영

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_78_히스토리기반_PLAN이벤트처리_상태전이규칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:21:40 | 분류: MASTER_SPEC]
2. 기본 원칙
- 상태는 이벤트에 의해 변경된다.
- 이벤트 없이 상태를 직접 변경하지 않는다.
- 하나의 이벤트는 하나의 상태 전이만 수행한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_78_히스토리기반_PLAN이벤트처리_상태전이규칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:21:40 | 분류: MASTER_SPEC]
4. 이벤트 처리 순서
① 이벤트 발생
② 현재 상태 확인
③ 전이 가능 여부 검증
④ 상태 전이 수행
⑤ 로그 기록
⑥ 후속 이벤트 대기

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_78_히스토리기반_PLAN이벤트처리_상태전이규칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:21:40 | 분류: MASTER_SPEC]
5. 전이 규칙
- 허용되지 않은 상태 전이는 거부한다.
- 종료 상태에서는 신규 이벤트를 처리하지 않는다.
- 동일 이벤트의 중복 처리를 방지한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_78_히스토리기반_PLAN이벤트처리_상태전이규칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:21:40 | 분류: MASTER_SPEC]
6. 구현 원칙
- 이벤트 처리와 상태 변경은 원자적으로 수행한다.
- 상태 변경 후 즉시 로그와 내부 상태를 동기화한다.
- 예외 발생 시 이전 상태를 보존한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_77_히스토리기반_PLAN공통상태머신_설계원칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:21:36 | 분류: MASTER_SPEC]
3. 공통 상태
- CREATED
- IN_PROGRESS
- PARTIAL_FILLED
- COMPLETED
- INCOMPLETE
- FAILED
- CANCELED
- CLOSED

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_76_히스토리기반_PLAN공통인터페이스_루틴독립성원칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:21:30 | 분류: MASTER_SPEC]
3. PLAN 공통 인터페이스
- PLAN 생성
- PLAN 시작
- 주문 요청
- 체결 반영
- 상태 갱신
- 종료 처리
- 로그 기록
- 복구 지원

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_75_히스토리기반_PLAN중심_주문엔진구조_확장원칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:21:24 | 분류: MASTER_SPEC]
3. 공통 처리 흐름
① PLAN 생성
② 주문 요청 생성
③ 주문 전송
④ 체결 감시
⑤ 상태 갱신
⑥ PLAN 종료
4. 역할 구분
루틴
- 전략 정의
- 신호 생성
- 정책 제공
주문 엔진
- 주문 생성
- 주문 실행
- 체결 확인
- PLAN 상태 반영

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_73_히스토리기반_BUYPLAN_로그상태기록_복구기준.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:21:14 | 분류: 구현로그/검증보고]
MASTER_SPEC 누락보강 73
주제 : 히스토리 기반 BUY PLAN 로그·상태기록 및 복구 기준
출처 : 작업진행상황대화히스토리_3~8 비교 반영

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_73_히스토리기반_BUYPLAN_로그상태기록_복구기준.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:21:14 | 분류: 구현로그/검증보고]
1. 목적
BUY PLAN의 전 과정에서 상태 변경 이력과 로그를 일관되게 기록하고,
프로그램 재시작이나 복구 상황에서도 동일한 상태를 재현하기 위한 기준을 정의한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_71_히스토리기반_BUYPLAN_상태표시_운영상태관리기준.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:09:16 | 분류: 운영정책]
3. 내부 상태
- BUY PLAN 생성
- 주문 진행
- 부분 체결
- 매수 미완성
- 완료
- 실패
- 종료
4. 운영 표시
운영 화면은 내부 상태를 그대로 노출하는 것이 아니라
운영상 필요한 의미로 표시한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_70_히스토리기반_BUYPLAN_완료_미완성_실패_최종판정체계.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:09:12 | 분류: MASTER_SPEC]
MASTER_SPEC 누락보강 70
주제 : 히스토리 기반 BUY PLAN 완료·미완성·실패 최종 판정 체계
출처 : 작업진행상황대화히스토리_3~8 비교 반영
1. 목적
BUY PLAN 종료 시 완료, 미완성, 실패를 명확히 구분하여
상태 판정의 일관성을 확보한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_67_히스토리기반_BUYPLAN_종료정책_검토관리연계기준.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:08:50 | 분류: 운영정책]
다. 검토관리 대상
- 시스템 오류
- 주문 처리 이상
- 상태 불일치
- 루틴 정책으로 처리 불가능한 예외

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_66_히스토리기반_BUYPLAN_상태전이_생명주기관리.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:08:42 | 분류: MASTER_SPEC]
MASTER_SPEC 누락보강 66
주제 : 히스토리 기반 BUY PLAN 상태 전이 및 생명주기 관리
출처 : 작업진행상황대화히스토리_3~8 비교 반영
1. 목적
BUY PLAN 생성부터 종료까지의 상태 전이와 관리 원칙을 정의한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_66_히스토리기반_BUYPLAN_상태전이_생명주기관리.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:08:42 | 분류: MASTER_SPEC]
2. 기본 원칙
- BUY PLAN은 생성, 진행, 종료의 생명주기를 가진다.
- 상태는 순차적으로 전이하며 임의 건너뛰기를 허용하지 않는다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_66_히스토리기반_BUYPLAN_상태전이_생명주기관리.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:08:42 | 분류: MASTER_SPEC]
4. 미완성 상태
- 목표 미달 시 BUY PLAN은 즉시 실패하지 않는다.
- 루틴의 유효 조건이 유지되는 동안 계속 관리한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_66_히스토리기반_BUYPLAN_상태전이_생명주기관리.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:08:42 | 분류: MASTER_SPEC]
6. 구현 원칙
- 상태 전이는 단일 관리 지점에서 수행한다.
- 동일 상태를 중복 생성하지 않는다.
- 종료된 BUY PLAN은 재사용하지 않는다.
7. 검증 항목
□ 생성
□ 진행
□ 부분 체결
□ 완료
□ 미완성
□ 종료
□ 상태 복원 일치

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_42_히스토리기반_UI수정원칙_점진조정기준.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:50:36 | 분류: MASTER_SPEC]
방향이 '상하'인 경우
- 비교 항목을 비활성화하는 정책을 적용하며,
 해당 UI는 방향 선택에 맞춰 자동 상태를 변경한다.
5. UI 검증 절차
① 소폭 수정
② 실제 화면 확인
③ 정렬 및 잘림 확인
④ 추가 수정 여부 결정

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_38_예외처리_복구정책.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:50:14 | 분류: 운영정책]
4. 복구 절차
① 예외 감지
② 영향 범위 확인
③ 정상 상태 보존
④ 복구 가능 여부 판단
⑤ 자동 복구 또는 안전 정지
⑥ 로그 기록
⑦ 운영자 확인(필요 시)

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_35_상태동기화_이벤트처리정책.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:50:00 | 분류: 운영정책]
MASTER_SPEC 누락보강 35
주제 : 상태 동기화 및 이벤트 처리 정책

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_35_상태동기화_이벤트처리정책.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:50:00 | 분류: 운영정책]
4. 이벤트 흐름
① 사용자 입력
② UI 이벤트 발생
③ 상태 검증
④ 데이터 갱신
⑤ 화면 갱신
⑥ 엔진 전달(필요 시)

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_35_상태동기화_이벤트처리정책.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:50:00 | 분류: 운영정책]
6. 예외 처리
- 데이터 불일치 감지
- 이벤트 중복 발생
- 잘못된 상태 전이
- 런타임 오류 발생 시 이전 정상 상태 유지

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_34_공통위젯생성규칙_재사용정책.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:49:56 | 분류: 운영정책]
8. 검증 항목
□ 공통 생성 함수 사용 여부
□ 스타일 일관성
□ 상태 제어 일관성
□ 레이아웃 정렬
□ 중복 코드 발생 여부

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_29_상태전이_루틴실행흐름원칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:41:32 | 분류: MASTER_SPEC]
MASTER_SPEC 누락보강 29
주제 : 상태전이 및 루틴 실행 흐름 원칙

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_29_상태전이_루틴실행흐름원칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:41:32 | 분류: MASTER_SPEC]
2. 기본 원칙
- 상태는 항상 순차적으로 전이한다.
- 이전 상태를 건너뛰는 직접 전이는 예외 상황에서만 허용한다.
- 상태 전이는 데이터 기반으로 관리한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_29_상태전이_루틴실행흐름원칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:41:32 | 분류: MASTER_SPEC]
6. 상태전이 원칙
- 상태 변경은 하나의 공통 관리 계층에서 수행한다.
- UI는 상태를 표시만 한다.
- 루틴은 상태 변경을 요청한다.
- 메인은 실제 상태를 확정한다.
7. 예외 처리
- 데이터 불일치
- 주문 실패
- API 오류
- 재시작
- 긴급정지
예외 발생 시 정상 흐름보다 복구 절차를 우선한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_27_미체결정책_설계철학_처리흐름.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:41:22 | 분류: 운영정책]
8. 구현 원칙
- UI는 정책 입력만 담당한다.
- 루틴은 수행 여부를 판단한다.
- 메인은 실제 주문을 처리한다.
9. 검증 항목
□ 시간 기준
□ 가격 기준
□ 비교조건
□ 반복 종료
□ 후속 정책 진입
□ 상태 동기화
10. 향후 보강
- 미체결 상태도
- 주문 재시도 정책
- JSON 저장 구조
- 엔진 상태전이

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_26_평단관리정책_확정이력_설계철학.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:41:18 | 분류: 운영정책]
9. 구현 원칙
- 평단관리는 루틴 정책에서 판단한다.
- 메인은 주문 수행만 담당한다.
- UI는 정책 입력만 담당한다.
10. 향후 보강
- 포지션 완성도
- 능동매수 알고리즘
- 평단관리 상태전이
- JSON 저장 구조

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_25_매수설정UI변경이력_최종확정과정.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:41:14 | 분류: MASTER_SPEC]
10. 향후 과제
- JSON 저장 구조 연결
- 엔진 매핑
- 상태전이 검증
- 실주문 연계 전 통합 테스트

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_24_매도설정UI변경이력_최종확정과정.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:41:10 | 분류: MASTER_SPEC]
7. 연계 규칙
- 수행2 시간 반복 사용 시 수행4 제한시간 비활성
- 수행4 사용 여부에 따라 수행5 표시 자동 변경
- 공통 상태제어 함수 사용

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_20_엔진연결준비사항_구현체크리스트.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:40:50 | 분류: MASTER_SPEC]
7. 장애 대응
- 최신 정상본 기준 복원
- 변경 범위 기록
- 원인 분석 후 재적용
- 임시 우회코드 누적 금지
8. 향후 문서화
- UI↔JSON 매핑표
- JSON↔엔진 매핑표
- 상태전이도
- 테스트 시나리오

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_17_프로토타입운영원칙_UI확정절차.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:40:36 | 분류: 운영정책]
5. UI 검토 절차
- 화면 배치 검토
- 시나리오 흐름 검토
- 컨트롤 정렬 검토
- 입력 방식 검토
- 상태제어 검토

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_17_프로토타입운영원칙_UI확정절차.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:40:36 | 분류: 운영정책]
6. 보류 항목 관리
보류된 기능은 삭제하지 않는다.
MASTER_SPEC에 다음 상태 중 하나로 기록한다.
- 확정
- 보류
- 폐기
- 재검토 예정

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_16_매도설정_수행1-5_상세정책_연계규칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:40:32 | 분류: 운영정책]
9. 구현 원칙
- 수행 간 직접 위젯 참조 금지
- 공통 상태제어 함수 사용
- 연계 비활성은 공통 로직으로 처리
10. 향후 보강
- 수행별 엔진 매핑
- 수행별 상태전이
- 수행별 JSON 저장 구조

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_11_매수미완성_매수실패판정철학.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:40:10 | 분류: MASTER_SPEC]
9. 구현 원칙
- 실패 판정은 최소화한다.
- 가능한 범위에서 매수완성을 유도한다.
- 후속정책은 루틴 정책에 따라 수행한다.
10. 향후 보강
- 실패 판정 알고리즘
- 후속정책 상태도
- 매수계획 상태전이

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_09_루틴엔진연계_UI엔진매핑원칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:39:54 | 분류: MASTER_SPEC]
8. 검증 항목
- UI와 저장 데이터 일치
- 저장 데이터와 엔진 입력 일치
- 엔진 결과와 UI 표시 일치
9. 향후 보강
- UI-JSON 매핑표
- JSON-엔진 매핑표
- 엔진 상태전이
- 정책별 실행 흐름도

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_05_상태제어_비활성정책.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:39:36 | 분류: 운영정책]
MASTER_SPEC 누락보강 05
주제 : 상태제어 및 비활성 정책

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_05_상태제어_비활성정책.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:39:36 | 분류: 운영정책]
1. 목적
- 설정 사용 여부를 사용자가 즉시 식별할 수 있도록 상태를 일관되게 표시한다.
- UI 상태와 내부 상태가 서로 다르게 보이지 않도록 한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_05_상태제어_비활성정책.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:39:36 | 분류: 운영정책]
4. 상호배타 정책
- 상호배타 조건은 선택된 항목만 활성.
- 선택되지 않은 항목은 자동 비활성.
- 기존 상호배타 로직을 임의 변경하지 않는다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_05_상태제어_비활성정책.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:39:36 | 분류: 운영정책]
7. 상태 동기화
- UI 표시 상태와 내부 Enable 상태를 항상 동기화한다.
- 화면만 변경되고 내부 상태가 남는 현상을 금지한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_04_입력컨트롤_UI통일정책.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:39:32 | 분류: 운영정책]
5. 체크박스 정책
- 실제 QCheckBox 사용.
- 문자(☑, □)로 대체 금지.
- 체크박스는 항상 활성 상태 유지.
- 저장 기능과 독립적으로 동작.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_통합갱신자료_2026-06-30.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:21:22 | 분류: 갱신문서]
3. 루틴 상태 제거 실패
- status_box를 화면에서 없애는 과정에서 카드 객체가 Qt에서 삭제되었다.
- _populate_fields에서 card["status"].setText를 호출하며 QLabel deleted RuntimeError 발생.
- 교훈: 화면에서 숨겨도 객체는 레이아웃에 편입시켜 생존시켜야 한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_통합갱신자료_2026-06-30.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:21:22 | 분류: 갱신문서]
------------------------------------------------------------
3. CANCEL 개념 위치 재정리
------------------------------------------------------------
3.1 현재 확인 결과
현재 코드에서 발견된 CANCEL은 대부분 GUI 취소 버튼 또는 주문상태 코드다.

[출처: UI_상태정리_작업재개보고서_2026-06-30.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 12:30:20 | 분류: 작업재개요약]
- 상태제어가 여러 계층으로 중복되어 있어 작은 수정도 다른 로직에 의해
 덮어써질 가능성이 높음.
- 기능 추가보다 상태제어 정리가 우선.

[출처: 03_작업재개요약_UI재구성_2026-06-26.txt | 기준일: 2026-06-26 | 수정시각: 2026-06-26 18:25:30 | 분류: 작업재개요약]
- 기본설정(녹색), 매수설정(파랑), 매도설정(빨강).
- ’|’는 항상 검정색.
- ’|’는 제목이 아니며 박스 밖에 위치.
- 제목은 버튼형 박스로 표현.
4. 강조 정책
- 글자 확대 금지.
- 박스 높이, 테두리, 패딩으로 강조.
- 세 제목은 동일 높이/동일 기준선 유지.
5. 복원 상태

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_8.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-30 19:18:38 | 분류: 대화히스토리]
[확정]
[검토중]
[보류]
[차기작업]
표시를 넣어서 나중에 봐도 현재 상태를 바로 알 수 있게 작성하겠다.

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_8.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-30 19:18:38 | 분류: 대화히스토리]
image(1268).png
이 상태에서 " ▶1. 기본매수방식" 으로 제목 배치하고 그아래 설정항목을 배치. 하단의 매도 설정의 형식을 따른다. 표시 부분 참고
image(1269).png
설정이 하나도 안들어갔네

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_8.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-30 19:18:38 | 분류: 대화히스토리]
지금 상태에서 계속 부분 패치를 이어가는 것보다, 매도 1번 블록을 기준으로 매수 블록을 재구성하는 방식으로 전환하는 것이 가장 안전하다. 그래야 레이아웃, 콤보 전환, 폭, 정렬, 이벤트를 하나씩 다시 맞출 필요가 없어진다.
오늘은 여기까지 하겠다.
병신새끼...일을 일대로 헝크로놓고 뭐?? 여기까지?/
그 말을 들을 만한 상황이었다.
문제는 단순히 버그가 아니라, 이미 검증된 구조를 버리고 새로 만들면서 계속 실패를 반복한 것이다.
돌이켜보면 내가 처음에 이렇게 했어야 했다.
매도 1번 블록 생성 코드 위치 파악
그 블록을 그대로 복제
매도 변수 → 매수 변수만 변경
제목만 기본매수방식으로 변경
그랬으면 오늘처럼
콤보 폭
들여쓰기
표시/숨김
이벤트
초기 상태
를 계속 다시 맞출 일이 없었다.

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_8.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-30 19:18:38 | 분류: 대화히스토리]
image(1333).png
매수설정의 우측부분에 공백이 남았는데 메뉴 배치가 어렵다...그래서 이 상태에서 오른쪽 빈공간에 이 자동매매루틴에 대한 요약이나 개요를 넣는건 어떤가? 어떤 신호를 받아 어떻게 매도하고 등등
저는 좋은 방향이라고 봅니다.
다만 단순한 "도움말"이 아니라 루틴 운영 요약판으로 가는 것을 추천합니다.

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_8.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-30 19:18:38 | 분류: 대화히스토리]
내 우려는 이상태로는 온전한 마스터 스펙을 작성하지 못한다는거다. 네 성능으로는 불가능하다는걸 알았다..그래서 나중에 어디서 도움을 받을지 고민중이다
그 우려가 맞습니다.

[출처: 작업재개요약서_v2026-06-25_MACD매도설정_UI_미체결정책_상세.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 16:17:00 | 분류: 작업재개요약]
조건 B에서 볼린저밴드는 가격박스와 유사한 형태로 추가된 상태다.
다음 창에서 조건 B UI가 유지되는지 확인해야 한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART33_1차본_33.71-33.80.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 09:01:45 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
33.73 문서 검증
공식 문서는 상호 참조가 가능한 상태를 유지한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART33_1차본_33.21-33.30.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:58:03 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
33.25 참조 문서
참조 문서는 MASTER_SPEC을 기준으로 최신 상태를 유지한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART30_1차본_30.11-30.20.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:47:24 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
30.14 코드 검증
공식 신호 외의 상태값 생성 여부를 검사한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART28_1차본_28.21-28.30.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:42:12 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
28.25 표시 정책
비활성 항목은 회색 계열로 표시하여 활성 상태와 명확히 구분한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART28_1차본_28.21-28.30.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:42:12 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
28.29 구현 금지
- UI 편의를 이유로 정책 변경
- 검증 없이 저장
- 활성 상태와 실제 정책 불일치

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART24_1차본_24.21-24.30.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:22:13 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
24.23 완료와 실패의 구분
완료는 정책에 따른 정상 종료이다.
실패는 주문 오류, 시스템 오류 또는 운영 정책 위반으로 정상 종료하지 못한
상태이다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART24_1차본_24.1-24.10.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:20:39 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
24.3 완료조건
완료조건은 매수계획이 종료 가능한 상태인지를 판단하는 기준이다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART24_1차본_24.1-24.10.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:20:39 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
24.5 현상태 완료
현상태로 완료판정은 추가 매수를 수행하지 않고 현재 상태를 완료로
처리한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART23_1차본_23.21-23.30.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:20:06 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
23.24 회차와 다중매수
매수회차는 실제 체결을 기준으로 증가한다.
계획만 생성된 상태는 회차에 포함하지 않는다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART22_1차본_22.11-22.20.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:17:06 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
22.17 매수 미완성
일부만 체결된 경우 즉시 실패로 판단하지 않는다.
유효조건이 유지되면 매수 미완성 상태로 관리한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART22_1차본_22.1-22.10.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:16:33 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
22.5 최초 진입
보유가 없는 상태에서 발생한 BUY는 최초 진입으로 분류한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART21_1차본_21.11-21.20.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:15:10 | 분류: MASTER_SPEC]
- signal=None
- HOLD
- WAIT
- SKIP
- ERROR
- CANCEL
- 검사 결과
- 내부 상태값
Signal Queue는 주문 후보 저장소이며 내부 상태 저장소가 아니다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_00_전체목차_및_작성맵_초안.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:06:32 | 분류: MASTER_SPEC]
문서 상태:
- v4.0 정본 작성을 위한 1차 작성맵
- 본 문서는 최종 MASTER_SPEC 본문이 아니라, 이후 정본 파일들을 만들기 위한 기준표이다.
- 이후 각 PART를 작성하면서 본 작성맵도 함께 다듬는다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_00_전체목차_및_작성맵_초안.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:06:32 | 분류: MASTER_SPEC]
핵심 반영:
- 코드 생성 전 문서 확인 / 히스토리 확인 / 기존 코드 확인 / 사용자 승인
- 신규 개념 생성 금지
- 문서 남발 금지
- 무조건 최신본 기준 복구 금지
- AI 제안 코드와 적용 코드는 다름
- 사용자 검토 전에는 모두 제안 상태

[출처: 작업재개요약서_v2026-06-22_MACD설정창_BUY정리완료_SELL진입직전.txt | 기준일: 2026-06-22 | 수정시각: 2026-06-22 19:17:26 | 분류: 작업재개요약]
비활성 정책:
- 현상태로 완료판정 / 마지막 주문 취소 이후 로직은 기존 유지.
- 잔량매수 체크 해제 시 잔량매수 하위 3행 + 예산충족률 비활성.
- 예산충족률 자체 체크 해제 시 95 / % / 이상 / AND 비활성.
- 능동매수 체크 해제 시 능동매수 하위 항목 비활성.
- 각 상세행 체크 해제 시 해당 행 전체 비활성.

[출처: NEXT_CHAT_RESUME_STEP41_루틴설정창_UI작업연결요약_v2026-06-19.txt | 기준일: 2026-06-19 | 수정시각: 2026-06-20 09:01:57 | 분류: 구현로그/검증보고]
확인해야 할 현재 화면 상태:
- 구성/고급/검증 탭만 있는지
- 매수/매도 탭이 공식 UI에 없는지
- 루틴 상태 카드가 화면에 보이지 않는지
- 매수설정 헤더가 한 줄인지
- 세부항목 체크박스가 실제 QCheckBox인지
- 저장 버튼이 비활성인지

[출처: NEXT_CHAT_RESUME_STEP41_루틴설정창_UI작업연결요약_v2026-06-19.txt | 기준일: 2026-06-19 | 수정시각: 2026-06-20 09:01:57 | 분류: 구현로그/검증보고]
============================================================
8. 마지막 상태 요약
============================================================

[출처: kiwoom_auto_43_분석보고_v2026-06-19.txt | 기준일: 2026-06-19 | 수정시각: 2026-06-19 08:14:11 | 분류: 구현로그/검증보고]
------------------------------------------------------------
1. 압축본 전체 상태
------------------------------------------------------------
압축본 내 파일 수:
- 1523개

[출처: kiwoom_auto_43_분석보고_v2026-06-19.txt | 기준일: 2026-06-19 | 수정시각: 2026-06-19 08:14:11 | 분류: 구현로그/검증보고]
------------------------------------------------------------
2. STEP23 적용 상태
------------------------------------------------------------

[출처: kiwoom_auto_43_분석보고_v2026-06-19.txt | 기준일: 2026-06-19 | 수정시각: 2026-06-19 08:14:11 | 분류: 구현로그/검증보고]
------------------------------------------------------------
4. STEP29 다이얼로그 적용 상태
------------------------------------------------------------

[출처: kiwoom_auto_43_분석보고_v2026-06-19.txt | 기준일: 2026-06-19 | 수정시각: 2026-06-19 08:14:11 | 분류: 구현로그/검증보고]
------------------------------------------------------------
5. STEP31 루틴지정창 연결 상태
------------------------------------------------------------

[출처: kiwoom_auto_43_분석보고_v2026-06-19.txt | 기준일: 2026-06-19 | 수정시각: 2026-06-19 08:14:11 | 분류: 구현로그/검증보고]
판정:
- STEP31은 실제 적용 전 상태.
- 후보 파일은 존재하므로 사용자가 교체하면 연결 적용 가능성이 높음.
- 그러나 실제 적용 전 백업 필수.

[출처: kiwoom_auto_43_분석보고_v2026-06-19.txt | 기준일: 2026-06-19 | 수정시각: 2026-06-19 08:14:11 | 분류: 구현로그/검증보고]
------------------------------------------------------------
6. STEP30/STEP32 테스트 상태
------------------------------------------------------------

[출처: kiwoom_auto_43_분석보고_v2026-06-19.txt | 기준일: 2026-06-19 | 수정시각: 2026-06-19 08:14:11 | 분류: 구현로그/검증보고]
------------------------------------------------------------
7. STEP34/STEP35 스크립트 상태
------------------------------------------------------------

[출처: kiwoom_auto_43_분석보고_v2026-06-19.txt | 기준일: 2026-06-19 | 수정시각: 2026-06-19 08:14:11 | 분류: 구현로그/검증보고]
------------------------------------------------------------
8. 현재 압축본의 실제 진행 상태 요약
------------------------------------------------------------

[출처: STEP36_최신프로젝트_GUI구조재검증_STEP29_STEP35_적용가능성판정_v2026-06-19.txt | 기준일: 2026-06-19 | 수정시각: 2026-06-19 07:59:56 | 분류: 구현로그/검증보고]
확인 결과:
- RoutineAssignWindow 클래스 존재
- self.btn_apply = QPushButton("루틴 지정") 존재
- self.btn_unassign = QPushButton("루틴 해제") 존재
- self.btn_close = QPushButton("닫기") 존재
- routine_header_layout에 "자동매매 루틴" 라벨과 btn_apply 배치 구조 존재
- _connect_events 메서드 존재
- self.btn_apply.clicked.connect(self.apply_routines_to_checked_stocks) 존재
- checked_routines 메서드 존재
- selected_routine_for_detail 메서드 존재

[출처: STEP33_MACD설정UI_적용순서_검증체크리스트_v2026-06-19.txt | 기준일: 2026-06-19 | 수정시각: 2026-06-19 07:48:31 | 분류: 구현로그/검증보고]
------------------------------------------------------------
1. 기준 상태
------------------------------------------------------------

[출처: STEP31_루틴지정창_MACD설정버튼_연결후보_생성보고_v2026-06-19.txt | 기준일: 2026-06-19 | 수정시각: 2026-06-19 07:43:41 | 분류: 구현로그/검증보고]
추가:
1. "루틴 설정" 버튼
- 위치: 루틴지정창 우측 "자동매매 루틴" 헤더 영역
- 기존 "루틴 지정" 버튼 왼쪽

[출처: STEP28_GUI파일구조확인_MACD설정UI_부착위치판정_v2026-06-19.txt | 기준일: 2026-06-19 | 수정시각: 2026-06-19 07:33:10 | 분류: 구현로그/검증보고]
초기 권장:
- gui_routine_assign_window.py 쪽 호출이 더 안전
- 이유: 종목 운영 상태와 덜 결합되어 있고, 루틴 자체 설정 의미가 더 강함

[출처: STEP28_GUI파일구조확인_MACD설정UI_부착위치판정_v2026-06-19.txt | 기준일: 2026-06-19 | 수정시각: 2026-06-19 07:33:10 | 분류: 구현로그/검증보고]
1. 설정창 접근 위치
- 루틴 지정창에서 열 것인가
- 자동매매설정창에서 열 것인가
- 둘 다 열 수 있게 할 것인가
2. 저장 기능
- 이번 단계에서는 없음/비활성으로 할 것인가
- 미리보기만 둘 것인가

[출처: STEP27_MACD설정UI_초안설계_B안_확장형_v2026-06-19.txt | 기준일: 2026-06-19 | 수정시각: 2026-06-19 07:26:36 | 분류: 구현로그/검증보고]
5. 평단 중심 매수강도
- 상태: 미확정/잠금
- 설명: 현재가와 평단의 괴리를 기준으로 매수 강도를 조정하는 영역

[출처: STEP27_MACD설정UI_초안설계_B안_확장형_v2026-06-19.txt | 기준일: 2026-06-19 | 수정시각: 2026-06-19 07:26:36 | 분류: 구현로그/검증보고]
6. 능동매수
- 상태: 미확정/잠금
- 설명: 기본 매수계획 실패 또는 포지션 보정 필요 시 현재 상태 기준으로 매수량을 재산정하는 영역

[출처: STEP26_MACD설정UI_항목목록화_v2026-06-19.txt | 기준일: 2026-06-19 | 수정시각: 2026-06-19 07:22:20 | 분류: 구현로그/검증보고]
4. CANCEL 영역
- 루틴 CANCEL은 향후 별도 개념 정리 필요
- 현재 UI에서는 숨김 또는 "추후 확정" 표시 권장
5. 다중매수/다중호가/다중지점
- UI 항목으로 별도 섹션 예약 가능
- 편집 불가 상태 권장

[출처: STEP26_MACD설정UI_항목목록화_v2026-06-19.txt | 기준일: 2026-06-19 | 수정시각: 2026-06-19 07:22:20 | 분류: 구현로그/검증보고]
------------------------------------------------------------
5. 추천 UI 섹션 구성
------------------------------------------------------------
권장 UI 구획:
A. 루틴 기본
- 루틴명
- 사용 여부
- 신호 전용 모드
- 실행 허용 상태

[출처: STEP25_rules_json_v0.3_구조점검보고_v2026-06-19.txt | 기준일: 2026-06-19 | 수정시각: 2026-06-19 07:21:15 | 분류: 구현로그/검증보고]
------------------------------------------------------------
1. 기준 문서 및 직전 상태
------------------------------------------------------------

[출처: STEP25_rules_json_v0.3_구조점검보고_v2026-06-19.txt | 기준일: 2026-06-19 | 수정시각: 2026-06-19 07:21:15 | 분류: 구현로그/검증보고]
3. sell.signals.profit_rate_sell
- STEP23에서 실제 평가 완료
- enabled=false 기본값 유지 가능
- 기준: 평단 대비 현재가 수익률
- 상태값은 context에서 읽는다
- 보유 없음, 평단 없음/0 이하, 현재가 없음/0 이하는 평가 제외

[출처: STEP24_BUY_구조점검보고_v2026-06-19.txt | 기준일: 2026-06-19 | 수정시각: 2026-06-19 07:18:29 | 분류: 구현로그/검증보고]
------------------------------------------------------------
2. 현재 BUY 계층 상태
------------------------------------------------------------

[출처: 작업재개요약서_추가갱신_STEP23_profit_rate_sell_signal_logic_완료.txt | 기준일: 2026-06-19 | 수정시각: 2026-06-19 07:16:23 | 분류: 작업재개요약]
함수 구조:
- evaluate_macd_routine(candles, config=None, context=None)
역할 분리:
- config: rules.json 기반 루틴 설정값
- context: 현재 종목 상태값

[출처: 작업재개요약서_추가갱신_STEP23_profit_rate_sell_signal_logic_완료.txt | 기준일: 2026-06-19 | 수정시각: 2026-06-19 07:16:23 | 분류: 작업재개요약]
중요:
- config에 평단/현재가를 넣지 않는다.
- 평단/현재가는 설정값이 아니라 상태값이므로 context로 전달한다.

[출처: STEP23_profit_rate_sell_signal_logic_검증보고_실행통과본.txt | 기준일: 2026-06-19 | 수정시각: 2026-06-19 07:16:18 | 분류: 구현로그/검증보고]
context 사용 기준:
- config는 rules.json 설정값
- context는 현재 종목 상태값
- 평단, 현재가, 보유수량은 context로 전달

[출처: STEP23_profit_rate_sell_signal_logic_검증보고_실행통과본.txt | 기준일: 2026-06-19 | 수정시각: 2026-06-19 07:16:18 | 분류: 구현로그/검증보고]
완료:
- profit_rate_sell 실제 평가
- 평단 대비 수익률 기준 적용
- context 기반 상태값 전달 구조 적용
- sell.signal_logic OR 결합
- sell.signal_logic AND 결합
- signal=None 비신호 유지
- 기존 macd_sell 구조 유지

[출처: STEP23_profit_rate_sell_signal_logic_검증보고_실행통과본.txt | 기준일: 2026-06-19 | 수정시각: 2026-06-19 07:16:18 | 분류: 구현로그/검증보고]
- rules.json/config에는 전략 설정만 둔다.
- 평단/현재가/보유수량은 실시간 상태값이므로 context에 둔다.
이 원칙은 향후 평단 중심 매수, 지속매수, 능동매수 논의에서도 유지할 가능성이 높다.
단, 향후 구조 확장 전 반드시 문서 확인과 사용자 승인이 필요하다.

[출처: 마스터스펙\STEP30_MACD설정다이얼로그_독립검증파일_생성보고_v2026-06-19\작업재개요약서_v2026-06-18_MACD루틴_HOLD오염복구_rules구조_STEP22완료.txt | 기준일: 2026-06-19 | 수정시각: 2026-06-19 06:18:18 | 분류: 작업재개요약]
------------------------------------------------------------
1. 현재 상태 요약
------------------------------------------------------------

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_6.txt | 기준일: 2026-06-18 | 수정시각: 2026-06-22 15:39:42 | 분류: 대화히스토리]
현재 확정 사항
- 평단관리 3항목 구성 확정
- 회차기준 : 매수회차 [+][0.5] × 초회예산
- 예산기준 : 직전예산 X [2]
- 능동매수 : 평단 대비 신호가 [0.5]% 이내
- 체크박스 유지
- 큰 제목 삭제 예정(STEP44)
이 상태로 이어가면 된다.
오키고고
오키.
새창으로 넘어갈 때 기준 상태는 아래로 정리하면 된다.
STEP44 (마지막 UI 정리)
목표
- 중앙 큰 제목 삭제
 "MACD매매루틴"
- 상단 제목 영역 축소
- 구성 / 고급 / 검증 탭 위로 당김
- 나머지 UI 변경 금지
현재 확정 상태:
평단관리
□ 회차기준 : 매수회차 [+][0.5] × 초회예산
□ 예산기준 : 직전예산 X [2]
□ 능동매수 : 평단 대비 신호가 [0.5]% 이내
체크박스 유지
3개 동일 레벨
능동매수 설명 같은 줄

[출처: STEP13_실제주문_안전요구사항_v2026-06-18_HOLD오염제거_복구본.txt | 기준일: 2026-06-18 | 수정시각: 2026-06-18 17:58:53 | 분류: 구현로그/검증보고]
- 주문신호 없음은 routine_signals.json에 주문신호로 저장하지 않는다.
- 주문신호 없음은 order_queue.json 주문후보로 변환하지 않는다.
- 주문신호 없음은 상태값으로 승격하지 않는다.
- 필요 시 로그에는 "NO_SIGNAL" 또는 "신호 없음" 수준의 설명 문구로만 남긴다.
- 단, "NO_SIGNAL"을 공식 루틴 신호로 정의하지 않는다.

[출처: STEP13_실제주문_안전요구사항_v2026-06-18_HOLD오염제거_복구본.txt | 기준일: 2026-06-18 | 수정시각: 2026-06-18 17:58:53 | 분류: 구현로그/검증보고]
------------------------------------------------------------
8. 실제 주문 실행 상태값
------------------------------------------------------------
order_queue.json의 status는 주문관리 계층 내부 상태로 관리한다.
기본 흐름:

[출처: STEP13_실제주문_안전요구사항_v2026-06-18_HOLD오염제거_복구본.txt | 기준일: 2026-06-18 | 수정시각: 2026-06-18 17:58:53 | 분류: 구현로그/검증보고]
이 상태값은 주문관리 내부 상태이다.
루틴 공식 신호가 아니다.
사용자 화면 공식 종목 상태와도 구분해야 한다.
의미:
REAL_READY
- 실제 주문 실행 직전 상태
- 아직 SendOrder 호출 전
REAL_SENT
- SendOrder 호출 완료
- 체결 여부는 아직 모름
REAL_FAILED
- SendOrder 호출 실패 또는 사전검사 실패
REAL_CONFIRMED
- 주문 접수/체결 이벤트로 확인된 상태
REAL_CANCELLED
- 주문 취소 처리된 상태

[출처: STEP13_실제주문_안전요구사항_v2026-06-18_HOLD오염제거_복구본.txt | 기준일: 2026-06-18 | 수정시각: 2026-06-18 17:58:53 | 분류: 구현로그/검증보고]
BLOCKED_REAL
- 실주문 사전검사에서 차단된 상태
- 구현 시 별도 사용 가능하나, 사용자 승인 후 확정한다.

[출처: 마스터스펙\절대금지행위_추가규정_v2026-06-18_AI검증절차_복구기준관리.txt | 기준일: 2026-06-18 | 수정시각: 2026-06-18 17:33:26 | 분류: 갱신문서]
- 문서에 없는 상태값 생성
- 문서에 없는 신호 생성
- 문서에 없는 엔진 생성
- 문서에 없는 정책 생성
- 문서에 없는 용어 생성
확정 문서 근거 또는 사용자 승인 필수.

[출처: 마스터스펙\절대금지행위_추가규정_v2026-06-18_AI검증절차_복구기준관리.txt | 기준일: 2026-06-18 | 수정시각: 2026-06-18 17:33:26 | 분류: 갱신문서]
--------------------------------------------------
6. 코드 적용 규칙
--------------------------------------------------
AI 제안 코드
= 적용 코드
가 아니다.
사용자 검토 전에는 모두 제안 상태로 간주.

[출처: 마스터스펙\MASTER_SPEC_v3.0_BASELINE_ (2)\MASTER_SPEC_v3.0_BASELINE_\MASTER_SPEC_v3.0_BASELINE_5_8_STEP08_20_갱신본.txt | 기준일: 2026-06-18 | 수정시각: 2026-06-18 16:44:00 | 분류: 갱신문서]
READY → RUNNING → EXITING → RESETTING → READY_AFTER_RESET 흐름을 사용한다.
문제 발생 시 TROUBLE 상태를 사용한다.
검토관리는 최종 안전장치 역할을 수행한다.
---
66. STEP08~STEP20 주문·체결 Mock 검증과 상태체계 관계
---
STEP08~STEP20 과정에서 주문 파이프라인의 Mock 상태 흐름이 검증되었다.
이 상태들은 Cycle State를 대체하지 않는다.
주문 상태와 종목 Cycle State는 분리 관리한다.
---
67. 주문 파이프라인 상태 흐름
---
PENDING
↓
APPROVED
↓
EXECUTABLE
↓
REAL_READY
↓
ADAPTER_READY
↓
ORDER_SENT_MOCK
↓
FILLED_MOCK
---
68. 주문 상태와 사용자 상태 관계
---
주문 상태는 사용자 상태와 1:1 대응하지 않는다.

[출처: 마스터스펙\MASTER_SPEC_v3.0_BASELINE_ (2)\MASTER_SPEC_v3.0_BASELINE_\MASTER_SPEC_v3.0_BASELINE_5_8_STEP08_20_갱신본.txt | 기준일: 2026-06-18 | 수정시각: 2026-06-18 16:44:00 | 분류: 갱신문서]
예를 들어 감시/대기 또는 매수/매도 상태에서도 내부 주문은 PENDING, APPROVED, EXECUTABLE 등의 별도 상태를 가질 수 있다.
---
69. Mock 상태 정의
---
ORDER_SENT_MOCK은 실제 SendOrder 호출 없이 Mock 주문번호가 생성된 상태이다.
FILLED_MOCK은 실제 체결 없이 Mock 체결 이벤트가 생성된 상태이다.
두 상태 모두 실제 계좌 상태가 아니다.
---
70. 포지션 종료 검증 결과
---

[출처: 새 폴더\MASTER_SPEC_v3.0_BASELINE_5_8.txt | 기준일: 2026-06-17 | 수정시각: 2026-06-17 18:50:18 | 분류: MASTER_SPEC]
READY → RUNNING → EXITING → RESETTING → READY_AFTER_RESET 흐름을 사용한다.
문제 발생 시 TROUBLE 상태를 사용한다.
검토관리는 최종 안전장치 역할을 수행한다.
END OF PART 08

[출처: 마스터스펙\MASTER_SPEC_v2.5_REBUILD_WORKSPACE\MASTER_SPEC_v2.5_REBUILD_WORKSPACE\06_검토관리정책_v2.5_DRAFT_2026-06-17.txt | 기준일: 2026-06-17 | 수정시각: 2026-06-17 16:50:42 | 분류: 운영정책]
06_검토관리정책_v2.5_DRAFT_2026-06-17
제6부 검토관리 정책
본 문서는 검토관리 정책을 정의한다.
검토관리는 단순 보관 영역이 아니다.
검토관리는 정상 운영이 불가능하거나 추가 확인이 필요한 종목을 관리하는 운영 정책 영역이다.
--------------------------------------------------
1. 검토관리 목적
자동매매의 안정성 확보.
비정상 상태 종목 격리.
운영자 검토 필요 종목 관리.
--------------------------------------------------
2. 검토관리 진입 원칙
정상 운영 불가.
데이터 신뢰 불가.
운영자 확인 필요.
위 조건 중 하나 이상 충족 시 검토관리 진입 가능.
--------------------------------------------------
3. 자동 진입
시스템 정책에 의해 자동 진입 가능.
--------------------------------------------------
4. 수동 진입
운영자가 직접 검토관리 이동 가능.
--------------------------------------------------
5. 대표 진입 사유
보유 상태 확인 필요.
미수 발생.
미도 발생.
데이터 불일치.
서버 정보 불일치.
종목 정보 불일치.
루틴 정보 불일치.
운영 상태 불일치.
--------------------------------------------------
6. 프로그램 재시작
프로그램 재시작은 최상위 점검 상황으로 취급.
재시작 후
보유
미수
미도
불일치
발견 시 검토관리 이동.
--------------------------------------------------
7. 긴급정지
긴급정지 해제 시 안정성검사 수행.
문제 종목은 검토관리 이동.
--------------------------------------------------
8. 안정성검사
정식 명칭
안정성검사
무결성검사 명칭 사용 금지.
--------------------------------------------------
9. 데이터 불일치
데이터 불일치는 최우선 확인 대상.
자동 복구를 시도하지 않는다.
운영자 확인 우선.
--------------------------------------------------
10. 현황 색상 정책
녹색
정상 운영 가능.
주황
정상 상태이나 다음 절차 대상 없음.
회색
비활성.
빨강
데이터 불일치 또는 신뢰 불가.
--------------------------------------------------
11. 빨강 상태
빨강 상태는 자동 검토관리 이동 정책이 아니다.
우선 운영 정지.
안정성검사 수행.
원인 파악 후 운영자 판단.
--------------------------------------------------
12. 검토관리 정보
표시 가능 정보
종목코드
종목명
현위치
보유
미수
미도
발생사유
발생시간
상태
--------------------------------------------------
13. 상태
미해결
해결
상태 지원.
--------------------------------------------------
14. 복귀 정책
문제 해결 후 복귀 가능.
복귀 시 원래 위치로 이동.
--------------------------------------------------
15. 미지정 정책
복귀 대신 미지정 상태 이동 가능.
루틴 연결 제거.
--------------------------------------------------
16. 삭제 정책
검토관리 목록에서 제거.
실제 종목 삭제 정책과는 구분.
--------------------------------------------------
17. 미수 정책
미수는 정상 운영 상태가 아니다.
재시작
마감
청산
과정에서 발견 시 검토 대상.
--------------------------------------------------
18. 미도 정책
미도는 검토 대상 가능.
상황 확인 후 처리.
--------------------------------------------------
19. 보유 정책
보유 자체는 문제가 아니다.
다만 재시작 및 긴급정지 상황에서는 확인 대상이 될 수 있다.
--------------------------------------------------
20. 검토관리와 청산
검토관리는 청산 정책과 동일하지 않다.
검토관리는 판단 영역.
청산은 실행 영역.
--------------------------------------------------
21. 최종 원칙
검토관리는 안전장치이다.
자동 처리보다 안정성을 우선한다.
데이터 신뢰성 확보를 최우선으로 한다.

[출처: routine_policy_draft_v8\루틴정책_개념정리_v8_cycle_state.txt | 기준일: 2026-06-17 | 수정시각: 2026-06-17 04:19:10 | 분류: 운영정책]
루틴 내부 상태:
- READY
- RUNNING
- EXITING
- RESETTING
- READY_AFTER_RESET
- TROUBLE
3. 기본 흐름

[출처: routine_policy_draft_v7\루틴정책_개념정리_v7_exit_strategy.txt | 기준일: 2026-06-17 | 수정시각: 2026-06-17 04:00:34 | 분류: 운영정책]
1. SELL 해석
최초 유효 SELL:
- 현재 자동매매 1싸이클 종료 선언
- Exit Strategy 시작

[출처: 마스터스펙_갱신자료_STEP44\작업진행상황대화히스토리_5.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-18 17:43:02 | 분류: 대화히스토리]
되도록이면 매수 실패가 안나도록 설계를 해야한다. 어떤식이든 매수완성을 하게 해야 하는데 2가지 상황을 이해 해야 한다. 매수 실패가 전체 자동매매에서 별 영향이 없는 경우와 매수실패가 치명적인 손실로 가는 상황을 나눠서 생각해봐야하고 정작 어려운게 판정을 어떤 정황을 기준 삼을것인가를 확정하는거다
맞다.
지금까지 이야기하면서 내가 느낀 건,
우리는 사실
매수 실패 후 어떻게 할까?
를 고민하고 있었는데,
진짜 중요한 건
매수 실패를 어떻게 정의할까?
이다.
그리고 네 말대로 여기서 반드시 분리해야 한다.
유형 1
매수 실패가 별 영향 없는 경우
예.
MACD BUY 발생
10000원
10020
10050
10100
으로 날아감.
현재가 주문
미체결
결과
매수 못함
기회 상실은 맞다.
하지만
계좌 손실
은 아니다.
이 경우는
전략 실패
에 가깝다.
유형 2
매수 실패가 치명적인 경우
예.
MACD BUY 발생
원래 전략
100만원 진입
예정.
실제로는
20만원만 체결
그 후
SELL 신호
발생.
그러면
전략이 의도한 포지션
과
실제 포지션
이 달라진다.
이건 위험하다.
또는
다중매수 계획
인데
1차만 체결
되고
2~5차 미체결
이 상태에서
손절
익절
정책이 원래 예상과 달라진다.
이건 단순 기회상실이 아니다.
그래서 진짜 중요한 판정
매수 실패를
체결 실패
로 정의하면 안 된다.
오히려
전략 계획 대비
실제 포지션이
의미있게 달라졌는가
가 중요하다.
예.
계획
100만원
실제
95만원
이건 사실상 성공.
반면
100만원
계획.
실제
20만원
이건 실패.
그래서 다음에 정해야 할 것
내가 보기엔 이제
매수완성 기준
이다.
예:
100%
만 성공인가?
아니면
90%
이상
이면 성공인가?
80%
이면?
이 기준이 정해져야
기회상실
전략실패
검토관리
를 나눌 수 있다.
그리고 내 생각에는
고정값
90%
이런 건 아니다.
오히려 루틴 옵션으로
최소매수완성률
100%
95%
90%
80%
같이 두는 게 맞아 보인다.
왜냐하면 스캘핑 루틴과 스윙 루틴은 허용 오차가 완전히 다를 수 있기 때문이다.
그래서 지금 가장 중요한 질문은:
매수완성 판정은
목표금액 대비 %
으로 볼 것인가?
아니면
전량 체결만 성공으로 볼 것인가?
이다.
나는 현재까지의 철학을 보면 목표금액 대비 허용오차 방식이 더 현실적이라고 본다.

[출처: 마스터스펙_갱신자료_STEP44\작업진행상황대화히스토리_5.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-18 17:43:02 | 분류: 대화히스토리]
기본적으로 우리가 알수 있는 정보는 현재가, 평단이다. 그러나 이번 매매 세트가 어느 지점에 서 끝날지는 모르기 때문에 현재 정보에 충실해야한다.
맞다.
이건 사실 자동매매에서 꽤 중요한 철학이다.
우리는 미래를 모른다.
앞으로 2% 오를지
20% 오를지
-10% 빠질지
모른다.
그래서:
이번 매매세트의 최종 저점
이번 매매세트의 최종 고점
도 모른다.
그러면 루틴은 뭘 기준으로 판단해야 하는가?
답은 네가 말한 그대로다.
현재가
평단
이다.
예를 들어.
현재:
평단 10000
현재가 9950
그러면 루틴이 알 수 있는 사실은.
현재 손실률
-0.5%
뿐이다.
반대로.
평단 10000
현재가 9800
이면.
현재 손실률
-2%
이다.
그 이상은 추정이다.
그래서 내가 지금 느끼는 건.
우리가 처음 생각했던:
1차
2차
3차
4차
5차
6차
고정 회차 구조도 필요하지만.
실제 루틴의 핵심 판단은
현재가 ↔ 평단
관계가 되어야 한다.
예를 들면.
매수신호 발생
↓
현재가 = 평단
근처.
↓
소량 매수
다음 신호.
현재가가 평단보다 0.5% 아래
↓
추매 강화
다음 신호.
현재가가 평단보다 2% 아래
↓
추매 더 강화
이건
몇 차 신호인가
보다
현재 포지션 상태가 어떤가
를 보는 구조다.
그래서 지금 보이는 구조는.
기존
신호중심
1차
2차
3차
4차
현재
신호 발생
+
평단괴리 상태
를 함께 본다.
나는 오히려 이게 네 루틴의 정체성에 가깝다고 본다.
MACD는 진입 타이밍을 알려준다.
평단은 매수 강도를 결정한다.
이 문장이 지금까지 이야기한 내용을 가장 잘 설명한다.
즉:
MACD
=
언제 살까
평단괴리
=
얼마나 살까
이 관점이면 미래 예측이 필요 없다.
루틴은 매 순간:
현재가
평단
보유수량
남은예산
만 보고 판단하면 된다.
그래서 다음 단계에서 고민해야 할 건:
평단괴리율에 따라
매수 강도를 어떻게 계산할 것인가
이다.
이건 이제 단순한 마틴 배수가 아니라 루틴의 핵심 알고리즘 영역으로 들어가기 시작한다.
다음 개념은?
지금까지 정리된 걸 보면 다음 개념은 의외로 매도도 아니고 능동매수 공식도 아니다.
내가 보기엔 이제 가장 먼저 정해야 할 건:
"매수 신호의 의미"
이다.
왜냐하면 현재 철학이 바뀌고 있기 때문이다.
초기에는:
MACD BUY
↓
매수
였다.
지금은:
MACD BUY
↓
현재 포지션 재평가
↓
필요시 매수
로 바뀌고 있다.
예를 들어.
상황 A
평단 10000
현재가 10020
MACD BUY 발생
이 경우
추매 필요 없음
일 수 있다.
상황 B
평단 10000
현재가 9800
MACD BUY 발생
이 경우
강한 추매 필요
일 수 있다.
상황 C
평단 없음
MACD BUY 발생
이 경우
최초 진입
이다.
즉 이제 BUY는
매수 명령
이 아니라
매수 검토 트리거
에 가까워지고 있다.
그래서 다음 개념은:
신호 강도
이다.
예를 들어:
MACD BUY 발생
만으로는 부족하다.
루틴은 내부적으로
현재가
평단
보유비중
잔여예산
을 보고
최종적으로:
매수량 0%
매수량 10%
매수량 30%
매수량 100%
를 결정할 수도 있다.
즉.
MACD = 언제 판단할까
평단 = 얼마나 판단할까
까지 왔다면,
다음은:
현재 포지션 상태에 따라
매수 강도를 어떻게 결정할 것인가
이다.
내가 보기엔 이제 루틴 핵심 구조는:
1. MACD 신호 발생
2. 현재 포지션 분석
 - 평단
 - 현재가
 - 보유비중
 - 잔여예산
3. 매수 강도 산출
4. 매수 실행계획 생성
으로 가기 시작한다.
그래서 다음 논의 주제는:

[출처: 마스터스펙_갱신자료_STEP44\작업진행상황대화히스토리_5.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-18 17:43:02 | 분류: 대화히스토리]
간단 구현: 가능
안전 구현: 어려움
실전 신뢰성 구현: 중상급
그래서 바로 전체 구현보다 먼저 주문 상태머신 설계가 필요하다.
이거 할수 있겠냐?
할 수는 있다. 다만 한 번에 완성하려고 하면 안 된다.
가능한 진행 방식은 이거다.

[출처: 05_운영정책_테스트체크리스트_v2026-06-16_종목폴더통합_검토관리_최신갱신.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-16 17:45:20 | 분류: 갱신문서]
검토상태로 남아 있던 종목:
- 000660_SK하이닉스
- 003550_LG
- 005380_현대차
- 055550_신한지주

[출처: 05_운영정책_테스트체크리스트_v2026-06-16_종목폴더통합_검토관리_최신갱신.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-16 17:45:20 | 분류: 갱신문서]
[RV-08] 검토관리 복귀 허용
조건:
- 보유 0, 평단 0, 미수 0, 미도 0, 주문잔량 0, 서버불일치 없음.
동작:
- 복귀 버튼 클릭.
예상:
- review_required False.
- status는 STOPPED 또는 감시/대기 정책값.
- 자동매매설정창에서 다시 표시 가능.
- 단 자동 매매시작 상태로 자동복귀 금지.

[출처: 05_운영정책_테스트체크리스트_v2026-06-16_종목폴더통합_검토관리_최신갱신.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-16 17:45:20 | 분류: 갱신문서]
[RS-01] 보유/미수/미도 없음
조건:
- trade_enabled 여부와 무관하게 보유 0.
- 미수 0.
- 미도 0.
- 이월 메타 없음.
동작:
- 프로그램 종료 후 재시작.
예상:
- 종료상태.
- 시작 OFF.
- 검토관리 이동 없음.
- 자동 매수/매도 복귀 없음.

[출처: 05_운영정책_테스트체크리스트_v2026-06-16_종목폴더통합_검토관리_최신갱신.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-16 17:45:20 | 분류: 갱신문서]
[RS-02] 보유 있음
조건:
- 보유 > 0.
- 미수 0.
- 미도 0.
동작:
- 프로그램 종료 후 재시작.
예상:
- 검토관리 이동.
- 자동복귀 금지.
- 자동매매설정창에서 제거.
- 검토관리창에서 보유 표시.

[출처: 05_운영정책_테스트체크리스트_v2026-06-16_종목폴더통합_검토관리_최신갱신.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-16 17:45:20 | 분류: 갱신문서]
[EM-01] 긴급정지 실행
조건:
- 정상 운영 종목 존재.
동작:
- 긴급정지 실행.
예상:
- 신규 매수 중지.
- 자동 매도 금지.
- 상태 긴급정지 또는 정지 상태.
- 로그 기록.

[출처: 05_운영정책_테스트체크리스트_v2026-06-16_종목폴더통합_검토관리_최신갱신.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-16 17:45:20 | 분류: 갱신문서]
[RV-01] 검토관리 표시
조건:
- REVIEW_REQUIRED 종목 존재.
예상:
- 자동매매설정창에서 미표시.
- 검토관리창에 표시.
- 코드/종목/위치/상태/사유/검출/보유/미수/미도/발생시간 확인.

[출처: 05_운영정책_테스트체크리스트_v2026-06-16_종목폴더통합_검토관리_최신갱신.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-16 17:45:20 | 분류: 갱신문서]
[RV-02] 새로고침 판정
조건:
- 검토관리 종목 존재.
동작:
- 새로고침 실행.
예상:
- 현재 보유/미수/미도/평단/서버불일치/이월 흔적을 다시 읽는다.
- 문제 있으면 계속 검토관리 유지.
- 문제 없으면 복귀 가능 상태로 볼 수 있다.

[출처: 05_운영정책_테스트체크리스트_v2026-06-16_종목폴더통합_검토관리_최신갱신.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-16 17:45:20 | 분류: 갱신문서]
[RV-04] 미지정
예상:
- 루틴 연결/기초종목 상태가 정책대로 정리되는지 확인.
- 문제 남아 있으면 미지정 차단 필요.
[RV-05] 삭제
예상:
- 보유/미수/미도 존재 시 삭제 경고 또는 차단 확인.

[출처: 05_운영정책_테스트체크리스트_v2026-06-16_종목폴더통합_검토관리_최신갱신.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-16 17:45:20 | 분류: 갱신문서]
[BF-01] 완충진입만 발생, 신규매수 없음
조건:
- 완충진입 상태.
- 이후 신규매수 없음.
예상:
- 복구대상 추가 선정 없음.
- 경고/알림 유지.

[출처: 05_운영정책_테스트체크리스트_v2026-06-16_종목폴더통합_검토관리_최신갱신.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-16 17:45:20 | 분류: 갱신문서]
============================================================
13. 현황색 테스트
============================================================
[ST-01] 시작 OFF
예상: 회색.
[ST-02] 시작 ON + 정상 운영 가능
예상: 녹색.
[ST-03] 조기마감 + 보유 있음
예상: 녹색.
[ST-04] 조기마감 + 대상 없음
예상: 주황.
[ST-05] 보유 > 0, 평단 0 등 불일치
예상: 빨강.
[ST-06] 선택행 하이라이트
예상: 상태색으로 해석하지 않음.
[ST-07] 완충진입
예상:
- 완충진입은 자금상태 표시이다.
- 종목 현황색과 혼동하지 않음.

[출처: 04_프로젝트현재상태보고서_v2026-06-16_종목폴더통합_검토관리_최신갱신.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-16 17:45:10 | 분류: 갱신문서]
작성 기준일: 2026-06-13
작성 목적: 다음 새 대화창에서 키움 자동매매 프로젝트를 즉시 이어가기 위한 최신 상태 보고서
작성 방식: 기존 프로젝트현재상태보고서_v2026-06-13을 기반으로, 이번 대화에서 확정된 마감/예산/완충/관제창 개념을 추가 반영한다.

[출처: 04_프로젝트현재상태보고서_v2026-06-16_종목폴더통합_검토관리_최신갱신.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-16 17:45:10 | 분류: 갱신문서]
============================================================
1. 전체 상태 판정
============================================================

[출처: 04_프로젝트현재상태보고서_v2026-06-16_종목폴더통합_검토관리_최신갱신.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-16 17:45:10 | 분류: 갱신문서]
- gui_auto_trade_setting_window.py
 자동매매설정창 본체. 현재는 UI 연결 및 통합 제어 허브 역할. 약 2000줄 수준으로 감소.
- gui_auto_trade_table_loader.py
 자동매매설정창 하단 종목표 로딩/표시 담당.
- gui_auto_trade_status_ops.py
 자동매매 상태 변경/운영방식 재판정.
- gui_auto_trade_close.py
 조기마감/개별청산/마감 관련 UI 및 저장 흐름.

[출처: 04_프로젝트현재상태보고서_v2026-06-16_종목폴더통합_검토관리_최신갱신.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-16 17:45:10 | 분류: 갱신문서]
- gui_auto_trade_situation.py
 현황 표시등 create_auto_trade_situation_item 단일 기준.
- gui_review_required_window.py
 검토관리창 기준 파일.
- gui_routine_assign_window.py
 매매루틴지정/해제 창.
- gui_centered_checkbox_delegate.py
 공용 체크박스 델리게이트.

[출처: 03_작업재개요약서_v2026-06-16_종목폴더통합_검토관리_최신갱신\03_작업재개요약서_v2026-06-16_종목폴더통합_검토관리_최신갱신.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-16 17:45:02 | 분류: 작업재개요약]
검토관리:
- 자동매매설정창 표시 금지.
- 검토관리창 전용 관리.
- 자동복귀 금지.
- 복귀는 새로고침/안정성검사 후 운영자 판단으로 처리.

[출처: 마스터스펙\02_MASTER_ADDENDUM_v2026-06-16_종목폴더통합_검토관리_최신확정.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-16 17:44:52 | 분류: 갱신문서]
구조개선 종료 판정 이유:
- 프로그램 실행 정상.
- 메인창 정상.
- 자동매매설정창 정상.
- 검토관리창 정상.
- 매매루틴지정창 정상.
- ATS 설정 저장 정상.
- 현황 컬럼 정상 표시.
- 정렬 유지 버그 해결.

[출처: 마스터스펙\02_MASTER_ADDENDUM_v2026-06-16_종목폴더통합_검토관리_최신확정.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-16 17:44:52 | 분류: 갱신문서]
============================================================
7. 완충복구 정책 최신 확정
============================================================
완충복구는 완충상태에서 신규 매수가 발생하고, 그 후에도 완충이 해소되지 않는 경우 실행한다.
공식:
완충상태 + 신규 매수 발생 + 완충 미해소 = 완충복구 정책 실행

[출처: 마스터스펙\01_MASTER_SPEC_v2.3_2026-06-16_종목폴더통합_검토관리_최신갱신.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-16 17:44:44 | 분류: 갱신문서]
============================================================
4. 창별 역할 재정의
============================================================
4.1 자동매매설정창

[출처: 마스터스펙\01_MASTER_SPEC_v2.3_2026-06-16_종목폴더통합_검토관리_최신갱신.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-16 17:44:44 | 분류: 갱신문서]
============================================================
5. 상태 체계
============================================================

[출처: 마스터스펙\01_MASTER_SPEC_v2.3_2026-06-16_종목폴더통합_검토관리_최신갱신.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-16 17:44:44 | 분류: 갱신문서]
운영상태는 운영자가 이해 가능한 한국어 표시를 기준으로 한다. 내부 status 값은 영문일 수 있으나 GUI 표시는 아래 기준을 따른다.
주요 상태:

[출처: 마스터스펙\01_MASTER_SPEC_v2.3_2026-06-16_종목폴더통합_검토관리_최신갱신.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-16 17:44:44 | 분류: 갱신문서]
1. 감시/대기
- 매매시작 전 또는 현재 시간/운영방식상 주문 실행 대기 상태.
- 시작 OFF이면 회색.
- 시작 ON이어도 현재 시간이 매수/매도 가능 구간이 아니면 감시/대기로 표시될 수 있다.

[출처: 마스터스펙\01_MASTER_SPEC_v2.3_2026-06-16_종목폴더통합_검토관리_최신갱신.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-16 17:44:44 | 분류: 갱신문서]
2. 매수/매도
- 현재 운영방식과 시간정책상 매수/매도 신호를 처리할 수 있는 상태.
- 보유 유무만으로 매수/매도 여부를 결정하지 않는다.

[출처: 마스터스펙\01_MASTER_SPEC_v2.3_2026-06-16_종목폴더통합_검토관리_최신갱신.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-16 17:44:44 | 분류: 갱신문서]
8. 검토관리/검토종목
- 자동매매설정창에서 제거하고 검토관리창에서만 관리하는 격리 상태.
- 자동복귀 금지.
- 안정성검사 및 운영자 판단 후 복귀 가능.

[출처: 마스터스펙\01_MASTER_SPEC_v2.3_2026-06-16_종목폴더통합_검토관리_최신갱신.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-16 17:44:44 | 분류: 갱신문서]
============================================================
6. 현황 색상 정책
============================================================
현황 컬럼의 점 색상은 상태 텍스트와 같은 개념이 아니다.
색상 기준:

[출처: 마스터스펙\01_MASTER_SPEC_v2.3_2026-06-16_종목폴더통합_검토관리_최신갱신.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-16 17:44:44 | 분류: 갱신문서]
주의:
- 선택행 하이라이트 색상은 현황 색상이 아니다.
- 검정/흰색처럼 보이는 선택색을 상태 이상으로 오판하지 않는다.

[출처: 마스터스펙\01_MASTER_SPEC_v2.3_2026-06-16_종목폴더통합_검토관리_최신갱신.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-16 17:44:44 | 분류: 갱신문서]
============================================================
8. 긴급정지 정책
============================================================
긴급정지는 계좌 단위 위험 차단 상태이다.

[출처: 마스터스펙\01_MASTER_SPEC_v2.3_2026-06-16_종목폴더통합_검토관리_최신갱신.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-16 17:44:44 | 분류: 갱신문서]
============================================================
9. 검토관리 정책
============================================================
검토관리 대상은 자동매매설정창에서 표시하지 않는다.
검토관리창 전용으로 관리한다.

[출처: 마스터스펙\01_MASTER_SPEC_v2.3_2026-06-16_종목폴더통합_검토관리_최신갱신.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-16 17:44:44 | 분류: 갱신문서]
검토관리 컬럼:
- 코드
- 종목
- 위치
- 상태
- 사유
- 검출
- 보유
- 미수
- 미도
- 발생시간
검토관리 버튼:
- 복귀
- 미지정
- 삭제
- 새로고침
- 닫기

[출처: 마스터스펙\01_MASTER_SPEC_v2.3_2026-06-16_종목폴더통합_검토관리_최신갱신.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-16 17:44:44 | 분류: 갱신문서]
완충상태에 진입했다는 사실만으로 계속 대상을 선정하지 않는다.
완충상태에서 신규 매수가 발생하고, 그 후에도 완충이 해소되지 않는 경우 복구정책을 실행한다.
공식:
완충상태 + 신규 매수 발생 + 완충 미해소 = 완충복구 정책 실행
18.3 복구대상 선정

[출처: README_적용내용(25).txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 18:59:54 | 분류: 기타문서/자료]
# 전체 종목 상태 리셋 도구
파일:
- reset_all_stock_state.py

[출처: README_적용내용(25).txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 18:59:54 | 분류: 기타문서/자료]
주의:
- 적용 시 backup_before_full_stock_reset/ 아래에 기존 config/state/orders 백업을 남깁니다.
- 종목 자체는 유지됩니다.
- 적용 후 모든 종목은 루틴 미연결/보유 0/평단 0/검토 아님 상태가 됩니다.

[출처: README_적용내용(22).txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 15:57:48 | 분류: 기타문서/자료]
주의:
- gui_routine_assign_window.py의 `루틴 해제`는 의미가 정확하므로 수정하지 않았습니다.
- gui_auto_trade_unregister.py의 `자동매매 등록해제`는 별도 의미일 수 있어 이번 패치에서 보류했습니다.
- 검토관리 계열 용어는 다음 단계에서 별도 정리합니다.

[출처: terminology_scan.json | 기준일: 2026-06-15 | 수정시각: 2026-06-15 15:56:18 | 분류: 기타문서/자료]
[
 {
 "file": "gui_stock_register_window.py",
 "hits": [
 {
 "line": 11,
 "text": "- 자동매매 루틴 폴더 자동 탐색"
 },
 {
 "line": 13,
 "text": "- budget.json 이 있는 폴더만 루틴으로 인정"
 },
 {
 "line": 15,
 "text": "- 수동등록/검색등록 검증 강화"
 },
 {
 "line": 16,
 "text": "- 신규 종목은 stock_library.json 검색 결과에서만 등록 허용"
 },
 {
 "line": 322,
 "text": "루틴별 종목 state.json 기준 자동매매 상태를 반환한다."
 },
 {
 "line": 347,
 "text": "중앙 종목관리 에는 현재 루틴 등록이 없지만,"
 },
 {
 "line": 348,
 "text": "루틴 폴더 안에 종목 저장 폴더가 남아 있는 경우 등록대기로 표시한다."
 },
 {
 "line": 382,
 "text": "종목 삭제 차단 사유를 runtime 상태 기준으로 반환한다."
 },
 {
 "line": 417,
 "text": "루틴별 상태 점 색상을 반환한다."
 },
 {
 "line": 423,
 "text": "return auto_trade_status_color(\"등록대기\")"
 },
 {
 "line": 431,
 "text": "등록 루틴 셀에 넣을 상태 위젯을 생성한다."
 },
 {
 "line": 432,
 "text": "색상 점과 루틴명을 분리해 시인성을 높인다."
 },
 {
 "line": 474,
 "text": "선택 종목에 운영중 루틴이 있는지 확인한다."
 },
 {
 "line": 488,
 "text": "종목등록설정 삭제/등록해제 정책에 따라 선택 종목을 분류한다."
 },
 {
 "line": 494,
 "text": "- runtime_dirs: 해당 종목의 루틴 runtime 폴더 목록"
 },
 {
 "line": 500,
 "text": "return \"immediate\", title, [\"루틴 연결 없음\"], []"
 },
 {
 "line": 565,
 "text": "종목등록설정 창의 운영상태 표시용 문구를 반환한다."
 },
 {
 "line": 568,
 "text": "- 루틴 미등록 종목은 미지정으로 표시한다."
 },
 {
 "line": 569,
 "text": "- 루틴 등록 종목은 자동매매설정 창과 동일하게 state.json 상태를 사용자 표시명으로 변환한다."
 },
 {
 "line": 573,
 "text": "if not routine_name or routine_name == \"미등록\":"
 },
 {
 "line": 574,
 "text": "return \"미지정\""
 },
 {
 "line": 594,
 "text": "종목등록설정 창."
 },
 {
 "line": 600,
 "text": "self.setWindowTitle(\"종목등록설정\")"
 },
 {
 "line": 604,
 "text": "self.stock_search_input.setPlaceholderText(\"목록 필터: 코드, 종목명, 루틴명, 상태\")"
 },
 {
 "line": 607,
 "text": "self.btn_search_register = QPushButton(\"검색식등록\")"
 },
 {
 "line": 610,
 "text": "self.btn_manual_register = QPushButton(\"수동등록\")"
 },
 {
 "line": 611,
 "text": "self.btn_manual_register.setToolTip(\"종목 라이브러리에서 직접 선택 등록합니다.\")"
 },
 {
 "line": 612,
 "text": "self.btn_routine_assign = QPushButton(\"매매루틴지정\")"
 },
 {
 "line": 615,
 "text": "self.btn_delete_stock = QPushButton(\"선택 종목 삭제\")"
 },
 {
 "line": 661,
 "text": "\"등록 루틴\","
 },
 {
 "line": 709,
 "text": "종목등록설정 창에서 종목 행을 1회 클릭했을 때의 보조 처리."
 },
 {
 "line": 711,
 "text": "itemClicked 시그널 연결은 유지하되, 실제 삭제 버튼 활성화 여부는"
 },
 {
 "line": 713,
 "text": "더블클릭으로 매매루틴지정 창을 여는 기존 동작은 변경하지 않는다."
 },
 {
 "line": 719,
 "text": "종목등록설정 창 종목표 우클릭 메뉴를 표시한다."
 },
 {
 "line": 730,
 "text": "action_select_unassigned = menu.addAction(\"미등록 선택\")"
 },
 {
 "line": 731,
 "text": "action_delete = menu.addAction(\"선택 삭제\")"
 },
 {
 "line": 732,
 "text": "action_clear = menu.addAction(\"선택 해제\")"
 },
 {
 "line": 734,
 "text": "action_assign = menu.addAction(\"루틴 지정\")"
 },
 {
 "line": 735,
 "text": "action_unassign = menu.addAction(\"루틴 해제\")"
 },
 {
 "line": 762,
 "text": "종목등록설정 창 우클릭 루틴 지정 진입 전 확인창을 표시한다."
 },
 {
 "line": 765,
 "text": "매매루틴지정 창에는 루틴 지정 가능 종목만 자동 체크 대상으로 전달되므로,"
 },
 {
 "line": 773,
 "text": "\"루틴 지정할 종목을 1개 이상 선택하세요.\","
 },
 {
 "line": 805,
 "text": "return \" / \".join(details) if details else \"루틴 지정 제한\""
 },
 {
 "line": 819,
 "text": "\"루틴 지정 대상 없음\","
 },
 {
 "line": 821,
 "text": "f\"[루틴 지정 가능 종목: 0개]\\n\""
 },
 {
 "line": 823,
 "text": "f\"[루틴 지정 제한 종목: {blocked_count}개]\\n\""
 },
 {
 "line": 825,
 "text": "\"루틴 지정 가능한 종목이 없어 매매루틴지정 창을 열지 않습니다.\","
 },
 {
 "line": 831,
 "text": "f\"[루틴 지정 가능 종목: {assignable_count}개]\\n\""
 },
 {
 "line": 833,
 "text": "f\"[루틴 지정 제한 종목: {blocked_count}개]\\n\""
 },
 {
 "line": 840,
 "text": "message += \"\\n\\n매매루틴지정 창을 여시겠습니까?\""
 },
 {
 "line": 844,
 "text": "box.setWindowTitle(\"루틴 지정 확인\")"
 },
 {
 "line": 868,
 "text": "\"\"\"현재 화면에서 등록 루틴이 미등록인 종목만 선택한다.\"\"\""
 },
 {
 "line": 876,
 "text": "if routine_text != \"미등록\":"
 },
 {
 "line": 884,
 "text": "선택 종목의 루틴 연결만 해제한다."
 },
 {
 "line": 885,
 "text": "종목 자체와 runtime 폴더는 삭제하지 않는다."
 },
 {
 "line": 889,
 "text": "QMessageBox.warning(self, \"선택 오류\", \"루틴 해제할 종목을 1개 이상 선택하세요.\")"
 },
 {
 "line": 899,
 "text": "if not routine_name and reasons and \"등록 루틴이 없습니다.\" in reasons:"
 },
 {
 "line": 911,
 "text": "QMessageBox.information(self, \"루틴 해제 없음\", \"선택 종목은 이미 미등록 상태입니다.\")"
 },
 {
 "line": 913,
 "text": "QMessageBox.information(self, \"루틴 해제 없음\", \"루틴 해제할 종목이 없습니다.\")"
 },
 {
 "line": 921,
 "text": "routine_name=first_routine_name or \"선택 루틴\","
 },
 {
 "line": 935,
 "text": "report_path = write_blocked_action_report(\"루틴 해제\", blocked_items)"
 },
 {
 "line": 941,
 "text": "f\"종목등록설정 루틴 해제: {' / '.join(removed_items)} / runtime 폴더 유지\","
 },
 {
 "line": 952,
 "text": "result_lines = [f\"루틴 해제 완료: {len(removed_items)}개\"]"
 },
 {
 "line": 954,
 "text": "result_lines.append(f\"해제 불가: {len(blocked_items)}개\")"
 },
 {
 "line": 958,
 "text": "result_lines.append(f\"이미 미등록: {len(skipped_unassigned)}개\")"
 },
 {
 "line": 960,
 "text": "QMessageBox.information(self, \"루틴 해제 결과\", \"\\n\".join(result_lines))"
 },
 {
 "line": 965,
 "text": "선택 종목을 중앙 stocks/ 구조에서 등록해제한다."
 },
 {
 "line": 969,
 "text": "- 즉시 삭제 가능 종목은 stocks/종목폴더를 archive로 이동한다."
 },
 {
 "line": 970,
 "text": "- 강제 등록해제 대상은 선택된 경우 state/orders 초기화 후 archive로 이동한다."
 },
 {
 "line": 971,
 "text": "- 처리불가 종목은 삭제하지 않고 리포트에 기록한다."
 },
 {
 "line": 979,
 "text": "\"삭제할 종목을 1개 이상 선택하세요.\","
 },
 {
 "line": 1007,
 "text": "\"삭제 오류\","
 },
 {
 "line": 1017,
 "text": "\"삭제할 종목 정보를 찾지 못했습니다.\","
 },
 {
 "line": 1059,
 "text": "blocked_report_path = write_blocked_action_report(\"종목 삭제\", blocked_report_items)"
 },
 {
 "line": 1082,
 "text": "\"등록해제 없음\","
 },
 {
 "line": 1083,
 "text": "\"등록해제 처리할 종목이 선택되지 않았습니다.\","
 },
 {
 "line": 1092,
 "text": "\"삭제 오류\","
 },
 {
 "line": 1117,
 "text": "\"강제 등록해제로 state.json과 orders.json 현재 표시/판단값 초기화\","
 },
 {
 "line": 1128,
 "text": "# 삭제 전 루틴 연결 필드를 먼저 비워 둔다."
 },
 {
 "line": 1152,
 "text": "\"중앙 종목관리 등록해제는 아직 저장하지 않았습니다.\\n\\n\""
 },
 {
 "line": 1163,
 "text": "\"삭제 일부 실패\","
 },
 {
 "line": 1171,
 "text": "message = f\"선택 종목 중앙 등록 해제: {deleted_text} / stocks 폴더 archive 이동\""
 },
 {
 "line": 1173,
 "text": "message += f\" / 강제 등록해제 상태/주문표시 초기화: {force_text}\""
 },
 {
 "line": 1189,
 "text": "f\"등록해제 완료: {len(deleted_items)}개\","
 },
 {
 "line": 1192,
 "text": "info_lines.append(f\"강제 등록해제 및 상태/주문표시 초기화: {len(selected_force_items)}개\")"
 },
 {
 "line": 1196,
 "text": "info_lines.append(f\"등록해제 불가: {blocked_count}개\")"
 },
 {
 "line": 1200,
 "text": "info_lines.append(f\"삭제 실패: {len(delete_failed_items)}개\")"
 },
 {
 "line": 1206,
 "text": "QMessageBox.information(self, \"등록해제 결과\", result_message)"
 },
 {
 "line": 1245,
 "text": "registered_routine = routine_list[0] if routine_list else \"미등록\""
 },
 {
 "line": 1294,
 "text": "# 등록 루틴 컬럼은 중앙 종목관리에 실제 연결된 활성 루틴만 표시한다."
 },
 {
 "line": 1295,
 "text": "# 루틴 폴더에 남아 있는 과거 runtime 폴더나 상태값은 이 창에서 표시하지 않는다."
 },
 {
 "line": 1296,
 "text": "# 종목당 활성 루틴 1개 정책에 따라 첫 번째 루틴만 표시하고, 루틴이 없으면 미등록으로 표시한다."
 },
 {
 "line": 1297,
 "text": "registered_routine = routine_list[0] if routine_list else \"미등록\""
 },
 {
 "line": 1311,
 "text": "if value == \"미지정\":"
 },
 {
 "line": 1336,
 "text": "검색식등록은 현재 단계에서 비활성화한다."
 },
 {
 "line": 1343,
 "text": "수동등록 버튼은 종목 라이브러리에서 직접 선택 등록한다."
 },
 {
 "line": 1346,
 "text": "dialog = SearchStockRegisterDialog(self, title=\"수동등록\")"
 },
 {
 "line": 1352,
 "text": "매매루틴지정 창을 연다."
 },
 {
 "line": 1355,
 "text": "선택 종목이 있으면 루틴 변경 가능한 종목만 자동 체크 대상으로 넘기고,"
 },
 {
 "line": 1363,
 "text": "report_path = write_blocked_action_report(\"루틴 지정 사전검사\", blocked_items)"
 },
 {
 "line": 1367,
 "text": "f\"선택 종목 중 루틴 지정 불가: {len(blocked_items)}개\""
 },
 {
 "line": 1368,
 "text": "\" / 매매루틴지정 창은 열립니다.\""
 },
 {
 "line": 1389,
 "text": "종목 행 더블클릭 시 해당 종목을 루틴 지정 사전 검사 후 매매루틴지정 창으로 넘긴다."
 }
 ],
 "hit_count": 103
 },
 {
 "file": "gui_force_unregister_dialog.py",
 "hits": [
 {
 "line": 5,
 "text": "주의 종목 강제 등록해제 확인창."
 },
 {
 "line": 31,
 "text": "보유/미체결 등이 남아 있어 일반 등록해제는 주의가 필요한 종목을"
 },
 {
 "line": 32,
 "text": "개별 체크 후 강제 등록해제할 수 있도록 하는 확인창."
 },
 {
 "line": 47,
 "text": "self.setWindowTitle(\"주의 종목 등록해제\")"
 },
 {
 "line": 87,
 "text": "summary_parts.append(f\"즉시 등록해제 {immediate_count}개\")"
 },
 {
 "line": 91,
 "text": "summary_parts.append(f\"등록해제 불가 {len(self.blocked_items)}개\")"
 },
 {
 "line": 92,
 "text": "summary_text = \" / \".join(summary_parts) if summary_parts else \"등록해제 대상 없음\""
 },
 {
 "line": 104,
 "text": "force_table.setHorizontalHeaderLabels([\"선택\", \"코드\", \"종목명\", \"루틴\", \"사유\"])"
 },
 {
 "line": 107,
 "text": "# 따라서 컬럼 폭은 헤더 교체 후에 지정해야 실제 화면에 반영된다."
 },
 {
 "line": 120,
 "text": "# 800 = 선택 48 + 코드 82 + 종목명 170 + 루틴 180 + 사유 320"
 },
 {
 "line": 138,
 "text": "checkbox.setToolTip(\"체크한 종목만 등록해제합니다.\")"
 },
 {
 "line": 158,
 "text": "blocked_title = QLabel(\"등록해제 불가\")"
 },
 {
 "line": 184,
 "text": "notice = QLabel(\"※ 등록해제 불가 종목은 상태 정리 후 다시 진행하세요.\")"
 },
 {
 "line": 190,
 "text": "ok_text = \"체크 항목 등록해제\" if self.force_items else \"등록해제 실행\""
 }
 ],
 "hit_count": 14
 },
 {
 "file": "gui_routine_assign_window.py",
 "hits": [
 {
 "line": 5,
 "text": "매매루틴지정 창 및 루틴 해제 확인 다이얼로그."
 },
 {
 "line": 87,
 "text": "\"\"\"루틴지정창 좌측 목록의 운영상태 표시값을 반환한다.\"\"\""
 },
 {
 "line": 89,
 "text": "if not routine_name or routine_name == \"미등록\":"
 },
 {
 "line": 90,
 "text": "return \"미지정\""
 },
 {
 "line": 122,
 "text": "\"\"\"루틴 해제 가능/불가 대상을 한 번에 보여주고 진행 여부를 확인한다.\"\"\""
 },
 {
 "line": 132,
 "text": "self.setWindowTitle(\"루틴 해제 확인\")"
 },
 {
 "line": 139,
 "text": "f\"즉시 해제 가능 {len(removable_items)}개 / 해제 불가 {len(blocked_items)}개\""
 },
 {
 "line": 145,
 "text": "blocked_title = QLabel(\"해제 불가\")"
 },
 {
 "line": 165,
 "text": "removable_title = QLabel(\"해제 가능\")"
 },
 {
 "line": 176,
 "text": "\"※ 해제 가능 종목만 처리됩니다.\\n\""
 },
 {
 "line": 177,
 "text": "\"※ 해제 불가 종목은 처리불가 누적리포트에 기록됩니다.\""
 },
 {
 "line": 184,
 "text": "self.btn_confirm = QPushButton(\"해제 실행\")"
 },
 {
 "line": 199,
 "text": "매매루틴지정 창."
 },
 {
 "line": 202,
 "text": "- 기초종목.txt 등록 종목 중 루틴 변경이 가능한 종목만 좌측에 표시한다."
 },
 {
 "line": 204,
 "text": "- 종목등록설정 창에서 전달된 종목 중 루틴 변경 가능한 종목은 자동 체크한다."
 },
 {
 "line": 205,
 "text": "- 루틴 지정/해제 실행 시점에도 삭제/등록해제 안전 규칙을 다시 검사한다."
 },
 {
 "line": 227,
 "text": "self.setWindowTitle(\"매매루틴지정\")"
 },
 {
 "line": 231,
 "text": "self.stock_search_input.setPlaceholderText(\"루틴 지정 가능 종목 검색\")"
 },
 {
 "line": 236,
 "text": "self.btn_apply = QPushButton(\"루틴 지정\")"
 },
 {
 "line": 237,
 "text": "self.btn_unassign = QPushButton(\"루틴 해제\")"
 },
 {
 "line": 266,
 "text": "stock_header_layout.addWidget(QLabel(\"루틴 지정 가능 종목\"))"
 },
 {
 "line": 278,
 "text": "routine_header_layout.addWidget(QLabel(\"자동매매 루틴\"))"
 },
 {
 "line": 293,
 "text": "assigned_header_layout.addWidget(QLabel(\"선택 루틴 연결 종목\"))"
 },
 {
 "line": 364,
 "text": "headers = [\"선택\", \"종목코드\", \"종목명\", \"현재 루틴\", \"운영상태\"]"
 },
 {
 "line": 383,
 "text": "headers = [\"선택\", \"루틴명\"]"
 },
 {
 "line": 510,
 "text": "# 이 창의 상단 목록은 \"신규 루틴 지정 가능 종목\"만 표시한다."
 },
 {
 "line": 511,
 "text": "# 이미 어떤 루틴이든 지정된 종목은 하단 \"선택 루틴 연결 종목\"에서 관리한다."
 },
 {
 "line": 540,
 "text": "current_routine = routine_list[0] if routine_list else \"미등록\""
 },
 {
 "line": 579,
 "text": "current_routine = routine_list[0] if routine_list else \"미등록\""
 },
 {
 "line": 591,
 "text": "if value == \"미지정\":"
 },
 {
 "line": 618,
 "text": "self.routine_table.setHorizontalHeaderLabels([\"선택\", \"루틴명\"])"
 },
 {
 "line": 726,
 "text": "좌측 종목 체크는 루틴 지정 대상 선택만 의미한다."
 },
 {
 "line": 727,
 "text": "우측 루틴 표는 새로 지정할 루틴을 사용자가 직접 선택해야 하므로,"
 },
 {
 "line": 728,
 "text": "좌측 종목의 현재 루틴을 자동 체크하지 않는다."
 },
 {
 "line": 733,
 "text": "self.show_status(f\"루틴 지정 대상: {code} {name}\")"
 },
 {
 "line": 735,
 "text": "self.show_status(f\"루틴 지정 대상: {len(checked)}개\")"
 },
 {
 "line": 773,
 "text": "self.show_status(\"선택 종목 중 루틴 지정 가능한 종목을 찾지 못했습니다.\")"
 },
 {
 "line": 815,
 "text": "action_clear_all = menu.addAction(\"전체 해제\")"
 },
 {
 "line": 923,
 "text": "\"\"\"선택 루틴 연결 종목 표의 종목명은 최대 12자까지만 표시한다.\"\"\""
 },
 {
 "line": 1062,
 "text": "# - last_checked_price / last_checked_pnl_rate 는 안정성검사·검토관리용 스냅샷이다."
 },
 {
 "line": 1063,
 "text": "# - 루틴지정창의 현재가/수익률 표시에는 사용하지 않는다."
 },
 {
 "line": 1065,
 "text": "# 이렇게 해야 자동매매설정창과 루틴지정창이 서로 다른 임시/검사값을 보여주지 않는다."
 },
 {
 "line": 1141,
 "text": "action_clear_all = menu.addAction(\"전체 해제\")"
 },
 {
 "line": 1176,
 "text": "self.show_status(\"루틴을 지정할 종목을 체크하세요.\")"
 },
 {
 "line": 1181,
 "text": "self.show_status(\"지정할 루틴을 체크하세요.\")"
 },
 {
 "line": 1185,
 "text": "self.show_status(\"지정할 루틴은 1개만 선택하세요.\")"
 },
 {
 "line": 1203,
 "text": "skipped_items.append(f\"{code} {name}: 이미 루틴 지정됨({', '.join(existing_routine_list)})\")"
 },
 {
 "line": 1232,
 "text": "\"루틴 지정\","
 },
 {
 "line": 1238,
 "text": "message = \"루틴을 지정한 종목이 없습니다.\""
 },
 {
 "line": 1245,
 "text": "QMessageBox.information(self, \"루틴 지정 결과\", message)"
 },
 {
 "line": 1246,
 "text": "self.show_status(\"루틴을 지정한 종목이 없습니다.\")"
 },
 {
 "line": 1252,
 "text": "f\"매매루틴 지정: {' / '.join(applied_items)} -> {', '.join(selected_routine_names)}\","
 },
 {
 "line": 1289,
 "text": "QMessageBox.information(self, \"루틴 지정 결과\", \"\\n\".join(result_lines))"
 },
 {
 "line": 1297,
 "text": "self.show_status(\"해제할 루틴을 선택하세요.\")"
 },
 {
 "line": 1313,
 "text": "self.show_status(\"루틴 해제할 종목을 체크하세요.\")"
 },
 {
 "line": 1334,
 "text": "skipped_items.append(f\"{code} {name}: 선택 루틴에 연결되어 있지 않음\")"
 },
 {
 "line": 1347,
 "text": "\"루틴 해제 결과\","
 },
 {
 "line": 1348,
 "text": "\"루틴 해제할 수 있는 종목이 없습니다.\""
 },
 {
 "line": 1351,
 "text": "self.show_status(\"루틴 해제할 수 있는 종목이 없습니다.\")"
 },
 {
 "line": 1361,
 "text": "self.show_status(\"루틴 해제를 취소했습니다.\")"
 },
 {
 "line": 1382,
 "text": "\"루틴 해제\","
 },
 {
 "line": 1391,
 "text": "f\"매매루틴 해제: {routine_name} -> {' / '.join(removed_items)}\","
 },
 {
 "line": 1412,
 "text": "f\"{len(removed_items)}개 종목의 {routine_name} 연결이 해제되었습니다.\""
 },
 {
 "line": 1415,
 "text": "result_lines.append(f\"해제 불가: {len(blocked_items)}개\")"
 },
 {
 "line": 1421,
 "text": "QMessageBox.information(self, \"루틴 해제 결과\", \"\\n\".join(result_lines))"
 },
 {
 "line": 1423,
 "text": "f\"{len(removed_items)}개 종목의 {routine_name} 연결이 해제되었습니다.\""
 }
 ],
 "hit_count": 66
 },
 {
 "file": "gui_auto_trade_unregister.py",
 "hits": [
 {
 "line": 5,
 "text": "자동매매설정창의 등록해제 처리 헬퍼."
 },
 {
 "line": 80,
 "text": "등록해제 루틴 연결 갱신."
 },
 {
 "line": 93,
 "text": "\"\"\"자동매매설정 등록해제 가능/주의/불가 대상을 한 창에 표시한다.\"\"\""
 },
 {
 "line": 104,
 "text": "self.setWindowTitle(\"주의 종목 등록해제\")"
 },
 {
 "line": 112,
 "text": "f\"즉시 등록해제 {len(immediate_items)}개 / 주의 등록해제 {len(force_items)}개 / 등록해제 불가 {len(blocked_items)}개\""
 },
 {
 "line": 118,
 "text": "blocked_title = QLabel(\"등록해제 불가\")"
 },
 {
 "line": 129,
 "text": "force_title = QLabel(\"주의 등록해제\")"
 },
 {
 "line": 145,
 "text": "immediate_title = QLabel(\"즉시 등록해제 가능\")"
 },
 {
 "line": 158,
 "text": "\"※ 즉시 등록해제 가능 종목은 바로 처리됩니다.\\n\""
 },
 {
 "line": 159,
 "text": "\"※ 주의 등록해제 종목은 체크한 항목만 처리됩니다.\\n\""
 },
 {
 "line": 160,
 "text": "\"※ 등록해제 불가 종목은 처리불가 누적리포트에 기록됩니다.\""
 },
 {
 "line": 167,
 "text": "self.btn_confirm = QPushButton(\"등록해제 실행\")"
 },
 {
 "line": 186,
 "text": "return \"검토종목\""
 },
 {
 "line": 215,
 "text": "강제 등록해제 시 자동매매설정 표에 남는 매결/도결/미체결 흔적을 제거한다."
 },
 {
 "line": 219,
 "text": "- 기존 주문 기록은 즉시 삭제하지 않고 orders_archive.json 에 보존한다."
 },
 {
 "line": 220,
 "text": "- config.json, logs 폴더, 루틴 종목 폴더는 건드리지 않는다."
 },
 {
 "line": 237,
 "text": "\"reason\": \"강제 등록해제 상태초기화로 orders.json 현재 표시/판단 흔적 초기화\","
 },
 {
 "line": 255,
 "text": "강제 등록해제 시 runtime 폴더와 설정/로그는 유지하되,"
 },
 {
 "line": 306,
 "text": "자동매매설정 창에서 선택 종목을 현재 루틴에서 등록해제한다."
 },
 {
 "line": 309,
 "text": "- 기초종목.txt의 루틴 연결만 제거한다. 종목 자체는 기초종목에 남긴다."
 },
 {
 "line": 310,
 "text": "- 루틴 runtime 폴더, config.json, logs는 유지한다."
 },
 {
 "line": 311,
 "text": "- 정지/감시중 + 보유·미체결 없음은 즉시 등록해제한다."
 },
 {
 "line": 312,
 "text": "- 정지/감시중 + 보유 또는 현재 미체결 있음은 확인창에서 체크한 항목만 등록해제하고 state/orders 현재 흔적을 초기화한다."
 },
 {
 "line": 313,
 "text": "- 매수/매도, 매도만 등 매매 가능 상태는 등록해제 불가로 표시만 한다."
 },
 {
 "line": 319,
 "text": "QMessageBox.warning(window, \"선택 오류\", \"등록해제할 종목을 1개 이상 선택하세요.\")"
 },
 {
 "line": 356,
 "text": "QMessageBox.information(window, \"등록해제 없음\", \"등록해제 처리할 종목이 선택되지 않았습니다.\")"
 },
 {
 "line": 377,
 "text": "\"자동매매설정 등록해제로 state.json과 orders.json 현재 표시/판단값 초기화\","
 },
 {
 "line": 394,
 "text": "\"해당 종목은 루틴 등록해제를 완료하지 않았습니다.\\n\\n\""
 },
 {
 "line": 400,
 "text": "QMessageBox.information(window, \"등록해제 없음\", \"기초종목.txt에서 등록해제할 종목을 찾지 못했습니다.\")"
 },
 {
 "line": 404,
 "text": "\"자동매매설정 등록해제\","
 },
 {
 "line": 411,
 "text": "\"종목 루틴 연결\","
 },
 {
 "line": 412,
 "text": "f\"자동매매설정 창 루틴 등록해제: {' / '.join(completed_items)} / 중앙 종목관리 기준 갱신\","
 },
 {
 "line": 415,
 "text": "window.statusBar_message(f\"루틴 등록해제 완료: {len(completed_items)}개\")"
 },
 {
 "line": 421,
 "text": "result_lines = [f\"등록해제 완료: {len(completed_items)}개\"]"
 },
 {
 "line": 423,
 "text": "result_lines.append(f\"등록해제 불가: {len(blocked_items)}개\")"
 },
 {
 "line": 426,
 "text": "QMessageBox.information(window, \"등록해제 결과\", \"\\n\".join(result_lines))"
 }
 ],
 "hit_count": 36
 },
 {
 "file": "gui_review_required_window.py",
 "hits": [
 {
 "line": 5,
 "text": "검토관리창 및 검토관리 관련 공통 헬퍼."
 },
 {
 "line": 6,
 "text": "- 검토관리 대상 수집"
 },
 {
 "line": 7,
 "text": "- 검토관리창 UI"
 },
 {
 "line": 8,
 "text": "- 복구/삭제/새로고침"
 },
 {
 "line": 9,
 "text": "- 검토관리 관련 변경 로그"
 },
 {
 "line": 58,
 "text": "자동매매 루틴 폴더를 조회한다."
 },
 {
 "line": 64,
 "text": "- budget.json 이 있는 폴더만 루틴으로 인정"
 },
 {
 "line": 81,
 "text": "루틴 폴더명을 GUI 표시명으로 변환한다."
 },
 {
 "line": 82,
 "text": "예: _MACD매매루틴 -> MACD매매루틴"
 },
 {
 "line": 92,
 "text": "\"\"\"검토 사유 목록에서 빈값/중복을 제거하고 입력 순서를 유지한다.\"\"\""
 },
 {
 "line": 109,
 "text": "\"\"\"검토관리 전용 분리 판정."
 },
 {
 "line": 112,
 "text": "검토관리 창에서는 이 조건에 걸린 종목만 표시한다."
 },
 {
 "line": 125,
 "text": "return auto_trade_status_display(raw_status) == \"검토종목\""
 },
 {
 "line": 131,
 "text": "\"\"\"runtime 폴더 기준 검토관리 전용 종목 여부.\"\"\""
 },
 {
 "line": 179,
 "text": "기초종목.txt 의 특정 종목 행에 루틴 목록을 반영한다."
 },
 {
 "line": 226,
 "text": "루틴 폴더 아래 종목별 저장 폴더를 조회한다."
 },
 {
 "line": 352,
 "text": "빨강은 자동 검토관리 이동이 아니라 즉시 운영정지/안정성검사 대상이라는 뜻이다."
 },
 {
 "line": 392,
 "text": "프로그램 전체 단위 검토관리 대상 목록을 수집한다."
 },
 {
 "line": 395,
 "text": "- 검토관리창은 루틴별 창이 아니다."
 },
 {
 "line": 396,
 "text": "- 전체 루틴의 전체 종목 중 REVIEW_REQUIRED 상태만 통합 표시한다."
 },
 {
 "line": 397,
 "text": "- 과거 루틴 폴더에 남은 종목도 상태가 검토종목이면 표시해 운영자가 놓치지 않게 한다."
 },
 {
 "line": 414,
 "text": "# 검토관리창의 상태는 \"복귀 가능 여부\"다."
 },
 {
 "line": 415,
 "text": "# 보유/미체결뿐 아니라 재시작 초기검사에서 검토로 보낸"
 },
 {
 "line": 456,
 "text": "\"\"\"프로그램 전체 단위 검토종목 통합 관리창.\"\"\""
 },
 {
 "line": 460,
 "text": "self.setWindowTitle(\"검토종목 관리\")"
 },
 {
 "line": 463,
 "text": "self.summary_label = QLabel(\"검토종목: 0개\")"
 },
 {
 "line": 466,
 "text": "self.btn_unassign = QPushButton(\"미지정\")"
 },
 {
 "line": 467,
 "text": "self.btn_delete = QPushButton(\"삭제\")"
 },
 {
 "line": 543,
 "text": "\"\"\"검토관리 표 헤더 클릭 정렬.\"\"\""
 },
 {
 "line": 562,
 "text": "\"\"\"검토관리 표 우클릭 메뉴.\"\"\""
 },
 {
 "line": 565,
 "text": "action_clear_all = menu.addAction(\"전체 해제\")"
 },
 {
 "line": 588,
 "text": "\"\"\"검토관리 종목 행에 표시할 상세 툴팁.\"\"\""
 },
 {
 "line": 604,
 "text": "f\"검토위치: {location}\\n\""
 },
 {
 "line": 637,
 "text": "self.summary_label.setText(f\"검토종목: {len(rows)}개\")"
 },
 {
 "line": 640,
 "text": "\"\"\"검토관리창에서 선택된 종목의 runtime 폴더를 반환한다.\"\"\""
 },
 {
 "line": 665,
 "text": "\"\"\"복귀/미지정 전 필요한 최소 무결성 조건을 확인한다.\"\"\""
 },
 {
 "line": 687,
 "text": "\"\"\"검토관리 해제 공통 메타 정리.\"\"\""
 },
 {
 "line": 708,
 "text": "\"\"\"검토관리 종목을 원래 루틴에 남긴 채 감시/대기 상태로 복귀한다.\"\"\""
 },
 {
 "line": 711,
 "text": "QMessageBox.information(self, \"복귀\", \"복귀할 검토종목을 선택하세요.\")"
 },
 {
 "line": 738,
 "text": "append_stock_log(stock_dir, \"GUI\", f\"검토관리 복귀: {before_status} -> MONITORING\")"
 },
 {
 "line": 755,
 "text": "\"\"\"무결성 문제가 해소된 검토관리 종목을 미지정으로 전환한다.\"\"\""
 },
 {
 "line": 758,
 "text": "QMessageBox.information(self, \"미지정\", \"미지정으로 전환할 검토종목을 선택하세요.\")"
 },
 {
 "line": 763,
 "text": "box.setWindowTitle(\"미지정 확인\")"
 },
 {
 "line": 765,
 "text": "\"선택한 검토종목을 미지정으로 전환하시겠습니까?\\n\\n\""
 },
 {
 "line": 766,
 "text": "\"미지정은 무결성 문제가 해소된 종목만 가능합니다.\\n\""
 },
 {
 "line": 767,
 "text": "\"종목은 유지하고 루틴 연결만 해제합니다.\""
 },
 {
 "line": 805,
 "text": "append_stock_log(stock_dir, \"GUI\", f\"검토관리 미지정 전환: {before_status} -> STOPPED\")"
 },
 {
 "line": 811,
 "text": "append_changelog(\"UPDATE\", \"기초종목.txt/state.json\", f\"검토관리 미지정 전환: {changed}개\")"
 },
 {
 "line": 814,
 "text": "message = f\"미지정 전환 완료: {changed}개\""
 },
 {
 "line": 819,
 "text": "message += f\"\\n\\n미지정 불가:\\n{preview}\""
 },
 {
 "line": 822,
 "text": "QMessageBox.information(self, \"미지정 완료\", message)"
 },
 {
 "line": 825,
 "text": "\"\"\"검토관리 종목을 시스템에서 삭제한다.\"\"\""
 },
 {
 "line": 828,
 "text": "QMessageBox.information(self, \"삭제\", \"삭제할 검토종목을 선택하세요.\")"
 },
 {
 "line": 837,
 "text": "box.setWindowTitle(\"검토종목 삭제 확인\")"
 },
 {
 "line": 839,
 "text": "f\"삭제 대상: {len(targets)}건\\n\\n\""
 },
 {
 "line": 841,
 "text": "\"삭제 후 복구할 수 없습니다.\""
 },
 {
 "line": 843,
 "text": "proceed_button = box.addButton(\"삭제\", QMessageBox.AcceptRole)"
 },
 {
 "line": 885,
 "text": "append_changelog(\"DELETE\", \"기초종목.txt/runtime\", f\"검토관리 종목 삭제: {deleted}개\")"
 },
 {
 "line": 888,
 "text": "message = f\"삭제 완료: {deleted}개\""
 },
 {
 "line": 891,
 "text": "QMessageBox.information(self, \"삭제 완료\", message)"
 }
 ],
 "hit_count": 60
 },
 {
 "file": "gui_global_review_required_window.py",
 "hits": [
 {
 "line": 5,
 "text": "검토관리 종목 통합 관리창."
 },
 {
 "line": 56,
 "text": "프로그램 전체 단위 검토관리 대상 목록을 수집한다."
 },
 {
 "line": 59,
 "text": "- 검토관리창은 루틴별 창이 아니다."
 },
 {
 "line": 60,
 "text": "- 전체 루틴의 전체 종목 중 REVIEW_REQUIRED 상태만 통합 표시한다."
 },
 {
 "line": 61,
 "text": "- 과거 루틴 폴더에 남은 종목도 상태가 검토종목이면 표시해 운영자가 놓치지 않게 한다."
 },
 {
 "line": 78,
 "text": "# 검토관리창의 상태는 \"복귀 가능 여부\"다."
 },
 {
 "line": 79,
 "text": "# 보유/미체결뿐 아니라 재시작 초기검사에서 검토로 보낸"
 },
 {
 "line": 120,
 "text": "\"\"\"프로그램 전체 단위 검토종목 통합 관리창.\"\"\""
 },
 {
 "line": 124,
 "text": "self.setWindowTitle(\"검토종목 관리\")"
 },
 {
 "line": 127,
 "text": "self.summary_label = QLabel(\"검토종목: 0개\")"
 },
 {
 "line": 130,
 "text": "self.btn_unassign = QPushButton(\"미지정\")"
 },
 {
 "line": 131,
 "text": "self.btn_delete = QPushButton(\"삭제\")"
 },
 {
 "line": 207,
 "text": "\"\"\"검토관리 표 헤더 클릭 정렬.\"\"\""
 },
 {
 "line": 226,
 "text": "\"\"\"검토관리 표 우클릭 메뉴.\"\"\""
 },
 {
 "line": 229,
 "text": "action_clear_all = menu.addAction(\"전체 해제\")"
 },
 {
 "line": 252,
 "text": "\"\"\"검토관리 종목 행에 표시할 상세 툴팁.\"\"\""
 },
 {
 "line": 268,
 "text": "f\"검토위치: {location}\\n\""
 },
 {
 "line": 301,
 "text": "self.summary_label.setText(f\"검토종목: {len(rows)}개\")"
 },
 {
 "line": 304,
 "text": "\"\"\"검토관리창에서 선택된 종목의 runtime 폴더를 반환한다.\"\"\""
 },
 {
 "line": 329,
 "text": "\"\"\"복귀/미지정 전 필요한 최소 무결성 조건을 확인한다.\"\"\""
 },
 {
 "line": 351,
 "text": "\"\"\"검토관리 해제 공통 메타 정리.\"\"\""
 },
 {
 "line": 372,
 "text": "\"\"\"검토관리 종목을 원래 루틴에 남긴 채 감시/대기 상태로 복귀한다.\"\"\""
 },
 {
 "line": 375,
 "text": "QMessageBox.information(self, \"복귀\", \"복귀할 검토종목을 선택하세요.\")"
 },
 {
 "line": 406,
 "text": "append_stock_log(stock_dir, \"GUI\", f\"검토관리 복귀: {before_status} -> MONITORING\")"
 },
 {
 "line": 423,
 "text": "\"\"\"무결성 문제가 해소된 검토관리 종목을 미지정으로 전환한다.\"\"\""
 },
 {
 "line": 426,
 "text": "QMessageBox.information(self, \"미지정\", \"미지정으로 전환할 검토종목을 선택하세요.\")"
 },
 {
 "line": 431,
 "text": "box.setWindowTitle(\"미지정 확인\")"
 },
 {
 "line": 433,
 "text": "\"선택한 검토종목을 미지정으로 전환하시겠습니까?\\n\\n\""
 },
 {
 "line": 434,
 "text": "\"미지정은 무결성 문제가 해소된 종목만 가능합니다.\\n\""
 },
 {
 "line": 435,
 "text": "\"종목은 유지하고 루틴 연결만 해제합니다.\""
 },
 {
 "line": 474,
 "text": "append_stock_log(stock_dir, \"GUI\", f\"검토관리 미지정 전환: {before_status} -> STOPPED\")"
 },
 {
 "line": 480,
 "text": "append_changelog(\"UPDATE\", \"기초종목.txt/state.json\", f\"검토관리 미지정 전환: {changed}개\")"
 },
 {
 "line": 483,
 "text": "message = f\"미지정 전환 완료: {changed}개\""
 },
 {
 "line": 488,
 "text": "message += f\"\\n\\n미지정 불가:\\n{preview}\""
 },
 {
 "line": 491,
 "text": "QMessageBox.information(self, \"미지정 완료\", message)"
 },
 {
 "line": 494,
 "text": "\"\"\"검토관리 종목을 시스템에서 삭제한다.\"\"\""
 },
 {
 "line": 497,
 "text": "QMessageBox.information(self, \"삭제\", \"삭제할 검토종목을 선택하세요.\")"
 },
 {
 "line": 506,
 "text": "box.setWindowTitle(\"검토종목 삭제 확인\")"
 },
 {
 "line": 508,
 "text": "f\"삭제 대상: {len(targets)}건\\n\\n\""
 },
 {
 "line": 510,
 "text": "\"삭제 후 복구할 수 없습니다.\""
 },
 {
 "line": 512,
 "text": "proceed_button = box.addButton(\"삭제\", QMessageBox.AcceptRole)"
 },
 {
 "line": 554,
 "text": "append_changelog(\"DELETE\", \"기초종목.txt/runtime\", f\"검토관리 종목 삭제: {deleted}개\")"
 },
 {
 "line": 557,
 "text": "message = f\"삭제 완료: {deleted}개\""
 },
 {
 "line": 560,
 "text": "QMessageBox.information(self, \"삭제 완료\", message)"
 }
 ],
 "hit_count": 44
 },
 {
 "file": "gui_search_stock_register_dialog.py",
 "hits": [
 {
 "line": 5,
 "text": "종목 라이브러리 검색 등록창."
 },
 {
 "line": 62,
 "text": "종목 라이브러리 검색 등록창."
 },
 {
 "line": 65,
 "text": "모든 신규 등록은 stock_library.json 검색 결과에서 선택한 종목만 허용한다."
 },
 {
 "line": 68,
 "text": "def __init__(self, parent: QWidget | None = None, title: str = \"종목 검색 등록\") -> None:"
 },
 {
 "line": 80,
 "text": "self.btn_register = QPushButton(\"선택 등록\")"
 },
 {
 "line": 112,
 "text": "\"등록상태\","
 },
 {
 "line": 139,
 "text": "수동등록 검색 결과 테이블 우클릭 메뉴."
 },
 {
 "line": 144,
 "text": "action_clear_selection = menu.addAction(\"전체 해제\")"
 },
 {
 "line": 146,
 "text": "action_register_selected = menu.addAction(\"선택 등록\")"
 },
 {
 "line": 229,
 "text": "\"등록됨\" if registered else \"미등록\","
 },
 {
 "line": 245,
 "text": "QMessageBox.warning(self, \"선택 오류\", \"등록할 종목을 1개 이상 선택하세요.\")"
 },
 {
 "line": 264,
 "text": "# 등록 시점의 중앙 종목관리를 직접 다시 읽어 1차 방어한다."
 },
 {
 "line": 322,
 "text": "f\"종목 라이브러리 선택등록: {' / '.join(registered_items)}\","
 },
 {
 "line": 334,
 "text": "\"종목 등록 처리가 완료되었습니다.\\n\\n\""
 },
 {
 "line": 335,
 "text": "f\"신규등록 : {completed_count}개\\n\""
 },
 {
 "line": 336,
 "text": "f\"등록제외 : {duplicate_count}개\\n\""
 },
 {
 "line": 337,
 "text": "f\"등록불가 : {error_count}개\""
 },
 {
 "line": 343,
 "text": "\"※ 등록불가 종목이 발견되었습니다.\\n\""
 },
 {
 "line": 350,
 "text": "\"등록 결과\","
 }
 ],
 "hit_count": 19
 },
 {
 "file": "gui_main_table_loader.py",
 "hits": [
 {
 "line": 8,
 "text": "- 좌측 루틴표 정렬/로딩"
 },
 {
 "line": 12,
 "text": "- MainWindow UI 생성/버튼 연결/긴급정지/검토관리 로직은 포함하지 않는다."
 },
 {
 "line": 49,
 "text": "\"\"\"메인 관제창 좌측 루틴표 헤더 정렬.\"\"\""
 },
 {
 "line": 97,
 "text": "read_base_stocks() 표준 반환값에서 종목의 루틴명 목록을 추출한다."
 },
 {
 "line": 99,
 "text": "중앙 stocks/ 구조에서는 일반적으로 1종목 1루틴이지만,"
 },
 {
 "line": 112,
 "text": "메인 좌측 루틴표의 종목수를 중앙 종목관리 기준으로 계산한다."
 },
 {
 "line": 115,
 "text": "- 루틴 미지정 종목 제외"
 },
 {
 "line": 116,
 "text": "- 검토관리/검토종목 상태 제외"
 },
 {
 "line": 144,
 "text": "\"\"\"budget.json이 있는 루틴 폴더를 메인 좌측 루틴표에 표시한다."
 },
 {
 "line": 146,
 "text": "종목수는 더 이상 루틴폴더 안의 물리 종목폴더 개수로 계산하지 않는다."
 },
 {
 "line": 214,
 "text": "# 루틴 미지정 종목은 표시하지 않는다."
 },
 {
 "line": 246,
 "text": "\"routine\": routine_name or \"미지정\","
 }
 ],
 "hit_count": 12
 }
]

[출처: terminology_scan_report.txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 15:56:08 | 분류: 기타문서/자료]
금지/퇴출 후보
- 등록해제: 종목 삭제/루틴 해제/자동매매 해제가 섞일 수 있으므로 신규 UI 문구에서 사용 금지

[출처: terminology_scan_report.txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 15:56:08 | 분류: 기타문서/자료]
수정 보류
- gui_routine_assign_window.py: 루틴 지정/루틴 해제 의미가 맞으므로 전역 수정 금지
- gui_auto_trade_unregister.py: 자동매매 등록해제 의미일 수 있어 별도 판정 필요
- gui_review_required_window.py / gui_global_review_required_window.py: 검토관리 용어 단계에서 별도 정리

[출처: terminology_scan_report.txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 15:56:08 | 분류: 기타문서/자료]
## gui_stock_register_window.py (103건)
- L11: - 자동매매 루틴 폴더 자동 탐색
- L13: - budget.json 이 있는 폴더만 루틴으로 인정
- L15: - 수동등록/검색등록 검증 강화
- L16: - 신규 종목은 stock_library.json 검색 결과에서만 등록 허용
- L322: 루틴별 종목 state.json 기준 자동매매 상태를 반환한다.
- L347: 중앙 종목관리 에는 현재 루틴 등록이 없지만,
- L348: 루틴 폴더 안에 종목 저장 폴더가 남아 있는 경우 등록대기로 표시한다.
- L382: 종목 삭제 차단 사유를 runtime 상태 기준으로 반환한다.
- L417: 루틴별 상태 점 색상을 반환한다.
- L423: return auto_trade_status_color("등록대기")
- L431: 등록 루틴 셀에 넣을 상태 위젯을 생성한다.
- L432: 색상 점과 루틴명을 분리해 시인성을 높인다.
- L474: 선택 종목에 운영중 루틴이 있는지 확인한다.
- L488: 종목등록설정 삭제/등록해제 정책에 따라 선택 종목을 분류한다.
- L494: - runtime_dirs: 해당 종목의 루틴 runtime 폴더 목록
- L500: return "immediate", title, ["루틴 연결 없음"], []
- L565: 종목등록설정 창의 운영상태 표시용 문구를 반환한다.
- L568: - 루틴 미등록 종목은 미지정으로 표시한다.
- L569: - 루틴 등록 종목은 자동매매설정 창과 동일하게 state.json 상태를 사용자 표시명으로 변환한다.
- L573: if not routine_name or routine_name == "미등록":
- L574: return "미지정"
- L594: 종목등록설정 창.
- L600: self.setWindowTitle("종목등록설정")
- L604: self.stock_search_input.setPlaceholderText("목록 필터: 코드, 종목명, 루틴명, 상태")
- L607: self.btn_search_register = QPushButton("검색식등록")
- L610: self.btn_manual_register = QPushButton("수동등록")
- L611: self.btn_manual_register.setToolTip("종목 라이브러리에서 직접 선택 등록합니다.")
- L612: self.btn_routine_assign = QPushButton("매매루틴지정")
- L615: self.btn_delete_stock = QPushButton("선택 종목 삭제")
- L661: "등록 루틴",
- L709: 종목등록설정 창에서 종목 행을 1회 클릭했을 때의 보조 처리.
- L711: itemClicked 시그널 연결은 유지하되, 실제 삭제 버튼 활성화 여부는
- L713: 더블클릭으로 매매루틴지정 창을 여는 기존 동작은 변경하지 않는다.
- L719: 종목등록설정 창 종목표 우클릭 메뉴를 표시한다.
- L730: action_select_unassigned = menu.addAction("미등록 선택")
- L731: action_delete = menu.addAction("선택 삭제")
- L732: action_clear = menu.addAction("선택 해제")
- L734: action_assign = menu.addAction("루틴 지정")
- L735: action_unassign = menu.addAction("루틴 해제")
- L762: 종목등록설정 창 우클릭 루틴 지정 진입 전 확인창을 표시한다.
- ... 외 63건

[출처: terminology_scan_report.txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 15:56:08 | 분류: 기타문서/자료]
## gui_auto_trade_unregister.py (36건)
- L5: 자동매매설정창의 등록해제 처리 헬퍼.
- L80: 등록해제 루틴 연결 갱신.
- L93: """자동매매설정 등록해제 가능/주의/불가 대상을 한 창에 표시한다."""
- L104: self.setWindowTitle("주의 종목 등록해제")
- L112: f"즉시 등록해제 {len(immediate_items)}개 / 주의 등록해제 {len(force_items)}개 / 등록해제 불가 {len(blocked_items)}개"
- L118: blocked_title = QLabel("등록해제 불가")
- L129: force_title = QLabel("주의 등록해제")
- L145: immediate_title = QLabel("즉시 등록해제 가능")
- L158: "※ 즉시 등록해제 가능 종목은 바로 처리됩니다.\n"
- L159: "※ 주의 등록해제 종목은 체크한 항목만 처리됩니다.\n"
- L160: "※ 등록해제 불가 종목은 처리불가 누적리포트에 기록됩니다."
- L167: self.btn_confirm = QPushButton("등록해제 실행")
- L186: return "검토종목"
- L215: 강제 등록해제 시 자동매매설정 표에 남는 매결/도결/미체결 흔적을 제거한다.
- L219: - 기존 주문 기록은 즉시 삭제하지 않고 orders_archive.json 에 보존한다.
- L220: - config.json, logs 폴더, 루틴 종목 폴더는 건드리지 않는다.
- L237: "reason": "강제 등록해제 상태초기화로 orders.json 현재 표시/판단 흔적 초기화",
- L255: 강제 등록해제 시 runtime 폴더와 설정/로그는 유지하되,
- L306: 자동매매설정 창에서 선택 종목을 현재 루틴에서 등록해제한다.
- L309: - 기초종목.txt의 루틴 연결만 제거한다. 종목 자체는 기초종목에 남긴다.
- L310: - 루틴 runtime 폴더, config.json, logs는 유지한다.
- L311: - 정지/감시중 + 보유·미체결 없음은 즉시 등록해제한다.
- L312: - 정지/감시중 + 보유 또는 현재 미체결 있음은 확인창에서 체크한 항목만 등록해제하고 state/orders 현재 흔적을 초기화한다.
- L313: - 매수/매도, 매도만 등 매매 가능 상태는 등록해제 불가로 표시만 한다.
- L319: QMessageBox.warning(window, "선택 오류", "등록해제할 종목을 1개 이상 선택하세요.")
- L356: QMessageBox.information(window, "등록해제 없음", "등록해제 처리할 종목이 선택되지 않았습니다.")
- L377: "자동매매설정 등록해제로 state.json과 orders.json 현재 표시/판단값 초기화",
- L394: "해당 종목은 루틴 등록해제를 완료하지 않았습니다.\n\n"
- L400: QMessageBox.information(window, "등록해제 없음", "기초종목.txt에서 등록해제할 종목을 찾지 못했습니다.")
- L404: "자동매매설정 등록해제",
- L411: "종목 루틴 연결",
- L412: f"자동매매설정 창 루틴 등록해제: {' / '.join(completed_items)} / 중앙 종목관리 기준 갱신",
- L415: window.statusBar_message(f"루틴 등록해제 완료: {len(completed_items)}개")
- L421: result_lines = [f"등록해제 완료: {len(completed_items)}개"]
- L423: result_lines.append(f"등록해제 불가: {len(blocked_items)}개")
- L426: QMessageBox.information(window, "등록해제 결과", "\n".join(result_lines))

[출처: terminology_scan_report.txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 15:56:08 | 분류: 기타문서/자료]
## gui_review_required_window.py (60건)
- L5: 검토관리창 및 검토관리 관련 공통 헬퍼.
- L6: - 검토관리 대상 수집
- L7: - 검토관리창 UI
- L8: - 복구/삭제/새로고침
- L9: - 검토관리 관련 변경 로그
- L58: 자동매매 루틴 폴더를 조회한다.
- L64: - budget.json 이 있는 폴더만 루틴으로 인정
- L81: 루틴 폴더명을 GUI 표시명으로 변환한다.
- L82: 예: _MACD매매루틴 -> MACD매매루틴
- L92: """검토 사유 목록에서 빈값/중복을 제거하고 입력 순서를 유지한다."""
- L109: """검토관리 전용 분리 판정.
- L112: 검토관리 창에서는 이 조건에 걸린 종목만 표시한다.
- L125: return auto_trade_status_display(raw_status) == "검토종목"
- L131: """runtime 폴더 기준 검토관리 전용 종목 여부."""
- L179: 기초종목.txt 의 특정 종목 행에 루틴 목록을 반영한다.
- L226: 루틴 폴더 아래 종목별 저장 폴더를 조회한다.
- L352: 빨강은 자동 검토관리 이동이 아니라 즉시 운영정지/안정성검사 대상이라는 뜻이다.
- L392: 프로그램 전체 단위 검토관리 대상 목록을 수집한다.
- L395: - 검토관리창은 루틴별 창이 아니다.
- L396: - 전체 루틴의 전체 종목 중 REVIEW_REQUIRED 상태만 통합 표시한다.
- L397: - 과거 루틴 폴더에 남은 종목도 상태가 검토종목이면 표시해 운영자가 놓치지 않게 한다.
- L414: # 검토관리창의 상태는 "복귀 가능 여부"다.
- L415: # 보유/미체결뿐 아니라 재시작 초기검사에서 검토로 보낸
- L456: """프로그램 전체 단위 검토종목 통합 관리창."""
- L460: self.setWindowTitle("검토종목 관리")
- L463: self.summary_label = QLabel("검토종목: 0개")
- L466: self.btn_unassign = QPushButton("미지정")
- L467: self.btn_delete = QPushButton("삭제")
- L543: """검토관리 표 헤더 클릭 정렬."""
- L562: """검토관리 표 우클릭 메뉴."""
- L565: action_clear_all = menu.addAction("전체 해제")
- L588: """검토관리 종목 행에 표시할 상세 툴팁."""
- L604: f"검토위치: {location}\n"
- L637: self.summary_label.setText(f"검토종목: {len(rows)}개")
- L640: """검토관리창에서 선택된 종목의 runtime 폴더를 반환한다."""
- L665: """복귀/미지정 전 필요한 최소 무결성 조건을 확인한다."""
- L687: """검토관리 해제 공통 메타 정리."""
- L708: """검토관리 종목을 원래 루틴에 남긴 채 감시/대기 상태로 복귀한다."""
- L711: QMessageBox.information(self, "복귀", "복귀할 검토종목을 선택하세요.")
- L738: append_stock_log(stock_dir, "GUI", f"검토관리 복귀: {before_status} -> MONITORING")
- ... 외 20건

[출처: terminology_scan_report.txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 15:56:08 | 분류: 기타문서/자료]
## gui_global_review_required_window.py (44건)
- L5: 검토관리 종목 통합 관리창.
- L56: 프로그램 전체 단위 검토관리 대상 목록을 수집한다.
- L59: - 검토관리창은 루틴별 창이 아니다.
- L60: - 전체 루틴의 전체 종목 중 REVIEW_REQUIRED 상태만 통합 표시한다.
- L61: - 과거 루틴 폴더에 남은 종목도 상태가 검토종목이면 표시해 운영자가 놓치지 않게 한다.
- L78: # 검토관리창의 상태는 "복귀 가능 여부"다.
- L79: # 보유/미체결뿐 아니라 재시작 초기검사에서 검토로 보낸
- L120: """프로그램 전체 단위 검토종목 통합 관리창."""
- L124: self.setWindowTitle("검토종목 관리")
- L127: self.summary_label = QLabel("검토종목: 0개")
- L130: self.btn_unassign = QPushButton("미지정")
- L131: self.btn_delete = QPushButton("삭제")
- L207: """검토관리 표 헤더 클릭 정렬."""
- L226: """검토관리 표 우클릭 메뉴."""
- L229: action_clear_all = menu.addAction("전체 해제")
- L252: """검토관리 종목 행에 표시할 상세 툴팁."""
- L268: f"검토위치: {location}\n"
- L301: self.summary_label.setText(f"검토종목: {len(rows)}개")
- L304: """검토관리창에서 선택된 종목의 runtime 폴더를 반환한다."""
- L329: """복귀/미지정 전 필요한 최소 무결성 조건을 확인한다."""
- L351: """검토관리 해제 공통 메타 정리."""
- L372: """검토관리 종목을 원래 루틴에 남긴 채 감시/대기 상태로 복귀한다."""
- L375: QMessageBox.information(self, "복귀", "복귀할 검토종목을 선택하세요.")
- L406: append_stock_log(stock_dir, "GUI", f"검토관리 복귀: {before_status} -> MONITORING")
- L423: """무결성 문제가 해소된 검토관리 종목을 미지정으로 전환한다."""
- L426: QMessageBox.information(self, "미지정", "미지정으로 전환할 검토종목을 선택하세요.")
- L431: box.setWindowTitle("미지정 확인")
- L433: "선택한 검토종목을 미지정으로 전환하시겠습니까?\n\n"
- L434: "미지정은 무결성 문제가 해소된 종목만 가능합니다.\n"
- L435: "종목은 유지하고 루틴 연결만 해제합니다."
- L474: append_stock_log(stock_dir, "GUI", f"검토관리 미지정 전환: {before_status} -> STOPPED")
- L480: append_changelog("UPDATE", "기초종목.txt/state.json", f"검토관리 미지정 전환: {changed}개")
- L483: message = f"미지정 전환 완료: {changed}개"
- L488: message += f"\n\n미지정 불가:\n{preview}"
- L491: QMessageBox.information(self, "미지정 완료", message)
- L494: """검토관리 종목을 시스템에서 삭제한다."""
- L497: QMessageBox.information(self, "삭제", "삭제할 검토종목을 선택하세요.")
- L506: box.setWindowTitle("검토종목 삭제 확인")
- L508: f"삭제 대상: {len(targets)}건\n\n"
- L510: "삭제 후 복구할 수 없습니다."
- ... 외 4건

[출처: 갱신메모\05_운영정책_테스트체크리스트_v2026-06-13.txt | 기준일: 2026-06-13 | 수정시각: 2026-06-13 09:15:50 | 분류: 갱신문서]
[RV-03] 임시복귀
동작:
- 임시복귀 버튼 또는 유사 기능 사용.
예상:
- 원래 정책과 충돌하지 않는지 확인.
- 자동 정상운영 복귀로 오해되지 않아야 함.
[RV-04] 미지정
예상:
- 루틴 연결/기초종목 상태가 정책대로 정리되는지 확인.
[RV-05] 삭제
예상:
- 보유/미수/미도 존재 시 삭제 경고 또는 차단 확인.

[출처: 갱신메모\05_운영정책_테스트체크리스트_v2026-06-13.txt | 기준일: 2026-06-13 | 수정시각: 2026-06-13 09:15:50 | 분류: 갱신문서]
[EC-07] 조기마감 + 대상 없음
조건:
- 보유 0.
- 미도 0.
예상:
- 상태 감시/대기 또는 마감 대상 없음 표시 정책.
- 현황 주황.

[출처: 갱신메모\05_운영정책_테스트체크리스트_v2026-06-13.txt | 기준일: 2026-06-13 | 수정시각: 2026-06-13 09:15:50 | 분류: 갱신문서]
============================================================
9. 현황색 테스트
============================================================
[ST-01] 시작 OFF
예상: 회색.
[ST-02] 시작 ON + 정상 운영 가능
예상: 녹색.
[ST-03] 조기마감 + 보유 있음
예상: 녹색.
[ST-04] 조기마감 + 대상 없음
예상: 주황.
[ST-05] 보유 > 0, 평단 0 등 불일치
예상: 빨강.
[ST-06] 선택행 하이라이트
예상: 상태색으로 해석하지 않음.

[출처: 갱신메모\04_프로젝트현재상태보고서_v2026-06-13.txt | 기준일: 2026-06-13 | 수정시각: 2026-06-13 09:15:42 | 분류: 갱신문서]
- gui_auto_trade_setting_window.py
 자동매매설정창 본체. 현재는 UI 연결 및 통합 제어 허브 역할. 약 2000줄 수준으로 감소.
- gui_auto_trade_table_loader.py
 자동매매설정창 하단 종목표 로딩/표시 담당.
- gui_auto_trade_status_ops.py
 자동매매 상태 변경/운영방식 재판정.
- gui_auto_trade_close.py
 조기마감/개별청산/마감 관련 UI 및 저장 흐름.
- gui_auto_trade_policy.py
 조기마감/자동마감/청산/현황/시간정책 관련 정책 함수.
- gui_auto_trade_timer.py
 시간정책 및 runtime 파일 변경 감시 타이머.
- gui_auto_trade_run_control.py
 매매시작/정지 실행 제어.
- gui_auto_trade_review_ops.py
 자동매매설정창에서 검토관리/안정성검사 호출.
- gui_auto_trade_context_menu.py
 자동매매설정창 우클릭 메뉴.
- gui_auto_trade_selection.py
 자동매매설정창 종목 선택 관련 함수.

[출처: 갱신메모\03_작업재개요약서_v2026-06-13.txt | 기준일: 2026-06-13 | 수정시각: 2026-06-13 09:15:36 | 분류: 작업재개요약]
검토관리:
- 자동매매설정창 표시 금지.
- 검토관리창 전용 관리.
- 자동복귀 금지.
- 복귀는 운영자 판단 후 수행.

[출처: 마스터스펙\02_MASTER_ADDENDUM_v2026-06-13_운영정책_구조개선_최신확정.txt | 기준일: 2026-06-13 | 수정시각: 2026-06-13 09:15:30 | 분류: 갱신문서]
구조개선 종료 판정 이유:
- 프로그램 실행 정상.
- 메인창 정상.
- 자동매매설정창 정상.
- 검토관리창 정상.
- 매매루틴지정창 정상.
- ATS 설정 저장 정상.
- 현황 컬럼 정상 표시.
- 정렬 유지 버그 해결.
남은 구조개선 후보는 존재하지만 현 단계에서 필수는 아니다.

[출처: 마스터스펙\02_MASTER_ADDENDUM_v2026-06-13_운영정책_구조개선_최신확정.txt | 기준일: 2026-06-13 | 수정시각: 2026-06-13 09:15:30 | 분류: 갱신문서]
판정:
- 보유 있음 → 검토관리.
- 미수 있음 → 검토관리.
- 미도 있음 → 검토관리.
- 이월 있음 → 검토관리.
- 문제 없음 → 종료상태 + 시작 OFF.
자동복귀 금지.
이전 실행 상태 복원 금지.
주황 상태 복원 금지.

[출처: 마스터스펙\02_MASTER_ADDENDUM_v2026-06-13_운영정책_구조개선_최신확정.txt | 기준일: 2026-06-13 | 수정시각: 2026-06-13 09:15:30 | 분류: 갱신문서]
============================================================
7. 현황 색상 최신 정책
============================================================

[출처: 마스터스펙\01_MASTER_SPEC_v2.1_2026-06-13.txt | 기준일: 2026-06-13 | 수정시각: 2026-06-13 09:15:20 | 분류: MASTER_SPEC]
============================================================
4. 상태 체계
============================================================

[출처: 마스터스펙\01_MASTER_SPEC_v2.1_2026-06-13.txt | 기준일: 2026-06-13 | 수정시각: 2026-06-13 09:15:20 | 분류: MASTER_SPEC]
3. 감시/매도
- 신규 매수는 막고 매도 감시만 유지하는 정책 상태.
- 시간운영 종료 후 매도만 허용하는 개념과 연결된다.

[출처: 마스터스펙\01_MASTER_SPEC_v2.1_2026-06-13.txt | 기준일: 2026-06-13 | 수정시각: 2026-06-13 09:15:20 | 분류: MASTER_SPEC]
7. 검토관리/검토종목
- 자동매매설정창에서 제거하고 검토관리창에서만 관리하는 격리 상태.
- 자동복귀 금지.
- 안정성검사 및 운영자 판단 후 복귀 가능.

[출처: 마스터스펙\01_MASTER_SPEC_v2.1_2026-06-13.txt | 기준일: 2026-06-13 | 수정시각: 2026-06-13 09:15:20 | 분류: MASTER_SPEC]
============================================================
5. 현황 색상 정책
============================================================
현황 컬럼의 점 색상은 상태 텍스트와 같은 개념이 아니다.
색상 기준:

[출처: 마스터스펙\01_MASTER_SPEC_v2.1_2026-06-13.txt | 기준일: 2026-06-13 | 수정시각: 2026-06-13 09:15:20 | 분류: MASTER_SPEC]
============================================================
7. 긴급정지 정책
============================================================
긴급정지는 계좌 단위 위험 차단 상태이다.

[출처: 마스터스펙\01_MASTER_SPEC_v2.1_2026-06-13.txt | 기준일: 2026-06-13 | 수정시각: 2026-06-13 09:15:20 | 분류: MASTER_SPEC]
============================================================
8. 검토관리 정책
============================================================
검토관리 대상은 자동매매설정창에서 표시하지 않는다.
검토관리창 전용으로 관리한다.

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_4.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-15 23:01:24 | 분류: 대화히스토리]
4순위
append_changelog / append_stock_log 공용화
바로 다음으로는 현황 표시등 함수 중복 제거가 제일 안전합니다.
현재 같은 함수가 gui_auto_trade_setting_window.py와 gui_auto_trade_table_loader.py에 중복되어 있습니다.
오키 고고
59s 동안 생각함
수정본 만들었습니다.
신규 gui_auto_trade_situation.py
gui_auto_trade_setting_window.py 대체용
gui_auto_trade_table_loader.py 대체용
반영 내용:
create_auto_trade_situation_item() 중복 제거
현황 표시등 함수를 gui_auto_trade_situation.py로 단일화
setting_window, table_loader는 import만 사용
마감/청산/정렬/검토관리 로직 변경 없음
문법검사 통과
기준 파일에서 중복 함수가 setting_window에 남아 있던 부분을 분리했습니다.
image(663).png
시작 잘돼
좋습니다.
지금 스크린샷 기준으로 보면:
프로그램 실행 정상
자동매매설정창 정상
루틴 로딩 정상
종목 로딩 정상
현황 색상 정상
녹색
주황
흰색
전부 정상 표시되고 있습니다.
특히 이번에 건드린 것은:

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_4.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-15 23:01:24 | 분류: 대화히스토리]
create_auto_trade_situation_item()
↓
gui_auto_trade_situation.py
분리였는데,
현황 컬럼이 깨지면 바로 보이는 작업이었습니다.
그런데 현재:
삼성SDI = 녹색
삼성물산 = 주황
NAVER = 흰색
정상 표시됩니다.
즉 이번 분리는 통과입니다.
현재 상태를 냉정하게 평가하면:
구조개선
99%
수준입니다.
남은 후보는
reset_runtime_statuses_for_program_start
default_operation_policy
read_operation_policy
append_stock_log
append_changelog
정도인데,
이건 구조개선 효과가 크지 않습니다.
오히려 지금부터는

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_4.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-15 23:01:24 | 분류: 대화히스토리]
보유/미수/미도 존재 → 검토관리
없음 → 종료상태 / 시작 OFF
그런데 코드 흐름은 아직 완전히 하나의 판정 엔진으로 통일되어 있지는 않습니다.
현재 확인된 흐름:

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_4.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-15 23:01:24 | 분류: 대화히스토리]
검토관리 복귀
→ 별도 복귀 로직
즉 세 흐름이 같은 판정 엔진으로 완전히 통일되어 있지는 않은 상태입니다.
문제 가능성:

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_4.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-15 23:01:24 | 분류: 대화히스토리]
우리가 모르는게 실제 서버를 연결했을경우 우리가 문제라고 정의한 부분 이외에도 새로운 문제가 나올수 있는데 현 상태에서는 알수없다.....

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_4.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-15 23:01:24 | 분류: 대화히스토리]
검토관리창은 “정상 확인 후 복귀”가 아니라, “비정상 또는 미확인 상태를 자동운영에서 격리하는 안전장치”로 설계해야 합니다.

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_4.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-15 23:01:24 | 분류: 대화히스토리]
평가손익 -120,000
실현손익 +350,000
오늘 손익합계 +230,000
3. 중앙: 루틴별 예산/운영 현황
루틴명 | 배정예산 | 사용금액 | 잔여예산 | 종목수 | 운영 | 검토 | 손익 | 상태
단타A | 10,000,000 | 3,200,000 | 6,800,000 | 8 | 6 | 2 | +120,000 | 정상
스윙B | 20,000,000 | 5,000,000 | 15,000,000 | 5 | 5 | 0 | -80,000 | 정상
여기서 루틴별:
시작/정지
조기마감
청산
예산수정
종목보기
가능하게 설계.

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_4.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-15 23:01:24 | 분류: 대화히스토리]
메인창 버튼
자동매매설정창 버튼
 ↓
공통 실행 함수
 ↓
상태/주문/정책 처리
1차 구현 우선순위
바로 다 만들지 말고 순서는 이게 맞습니다.
자금운영 패널
루틴별 예산표
자금설정 창
예산 초과 매수 차단
주문/체결/위험 관제 확장
즉 첫 작업은:
메인창에 자금운영 패널 + 루틴별 예산표 초안 추가
이 방향이 가장 적당합니다.
오키 고고
좋습니다.
다만 여기서는 바로 구현으로 가지 말고, 자금운영 개념을 한 단계 더 확정해야 합니다.
지금 자금운영 설계에서 가장 중요한 미결정 사항이 있습니다.
문제 1. 예산 배정 단위
어느 수준까지 예산을 배정할 것인가?
안 A
전체예산
↓
종목
예)
총예산 5000만원
삼성전자 500만원
SK하이닉스 300만원
NAVER 200만원
단순함.
안 B
전체예산
↓
루틴
↓
종목
예)
총예산 5000만원
단타A 2000만원
스윙B 3000만원
단타A
 ├ 삼성전자 500만원
 ├ 하이닉스 300만원
스윙B
 ├ NAVER 1000만원
확장성 좋음.
개인적으로는 B 확정이 맞다고 봅니다.
왜냐하면 이미 프로젝트 철학이
루틴
↓
종목 운영
구조이기 때문.
문제 2. 종목 배정 방식
종목별 배정을:

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_4.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-15 23:01:24 | 분류: 대화히스토리]
지금 바로 할 작업은 문서 갱신용 개념 정리본 작성이 맞습니다.
다음 답변에서 내가 먼저 “확정 개념 초안”을 정리하고, 확인 후 파일 생성으로 가면 됩니다.
개념 더 진행할 사항 없나?
좋습니다. 이 방향이 더 일관됩니다.
마감예약 상태에서도 매수 제한 없음을 기본 확정하는 게 맞겠습니다.
이유:
마감예약은 “출구예약”이지 “진입금지”가 아님
매수 판단은 루틴 신호 + 예산/매수한도 정책이 담당
운영자가 원하면 여러 번 매수 가능해야 함
프로그램이 임의로 “1회만 허용”하면 운영자 전략을 제한함
다만 관제창에는 반드시 표시해야 합니다.
마감예약 상태
매수진행 3회
최종 매수 10:42
다음 매도신호 대기
설정 옵션은 나중에 둘 수 있습니다.
마감예약 중 매수횟수 제한
- 사용 안 함
- 1회
- 2회
- 3회
- 사용자 지정
현재 기본값은:
매수횟수 제한 OFF
정리하면:

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_4.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-15 23:01:24 | 분류: 대화히스토리]
다만 이건 구현 전 마지막 선택사항 정도이고, 나머지 핵심 개념들은 거의 확정 상태라고 봐도 될 것 같습니다.

[출처: 마스터스펙\MASTER_SPEC_v2.0_FULL_INTEGRATED_ARCHIVE_2026-06-11.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-11 15:25:42 | 분류: MASTER_SPEC]
[검토관리]
- 검토종목은 자동매매설정창 표시 금지
- 검토관리창 전용 관리
- 검토관리 컬럼: 코드 / 종목 / 위치 / 상태 / 사유 / 검출 / 보유 / 미수 / 미도 / 발생시간
- 임시 복귀 버튼 유지
- 자동복귀 금지

[출처: 마스터스펙\MASTER_SPEC_v2.0_FULL_INTEGRATED_ARCHIVE_2026-06-11.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-11 15:25:42 | 분류: MASTER_SPEC]
v1.2는 v1.1의 GUI 기반 자동매매 구조를 유지하면서, 실제 운영 중 발견된 위험 요소를 반영해 상태체계와 안전정책을 재정립한 문서이다.
가장 큰 변화는 아래 6개이다.

[출처: 마스터스펙\MASTER_SPEC_v2.0_FULL_INTEGRATED_ARCHIVE_2026-06-11.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-11 15:25:42 | 분류: MASTER_SPEC]
1. 메인 윈도우 생성
2. 로그인 상태 표시
3. 계좌 구분 표시
4. 자동매매 루틴 현황 표시
5. 실행 중 종목 현황 표시
6. 긴급 정지 버튼 제공
7. 각 설정 창 호출
---
### gui_windows.py
역할 :
주요 GUI 창 클래스를 관리한다.
포함 창 :

[출처: 마스터스펙\MASTER_SPEC_v2.0_FULL_INTEGRATED_ARCHIVE_2026-06-11.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-11 15:25:42 | 분류: MASTER_SPEC]
1. 키움 로그인 상태
2. 계좌번호
3. 계좌 구분
4. 모의투자 / 실계좌 표시
5. 현재 시간
6. 전체 자동매매 상태
중앙 좌측 영역 :
등록된 자동매매 루틴 목록
표시 항목 :

[출처: 마스터스펙\MASTER_SPEC_v2.0_FULL_INTEGRATED_ARCHIVE_2026-06-11.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-11 15:25:42 | 분류: MASTER_SPEC]
1. 루틴명
2. 등록 종목 수
3. 실행 중 종목 수
4. 정지 종목 수
5. 오류 종목 수
6. 루틴 예산
7. 사용 예산
8. 가용 예산
중앙 우측 영역 :
실행 중 자동매매 종목 목록
표시 항목 :

[출처: 마스터스펙\MASTER_SPEC_v2.0_FULL_INTEGRATED_ARCHIVE_2026-06-11.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-11 15:25:42 | 분류: MASTER_SPEC]
1. 종목코드
2. 종목명
3. 루틴명
4. 상태
5. 보유수량
6. 평균단가
7. 매수회차
8. 현재가
9. 평가손익
10. 마지막 주문시간
하단 버튼 영역 :

[출처: 마스터스펙\MASTER_SPEC_v2.0_FULL_INTEGRATED_ARCHIVE_2026-06-11.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-11 15:25:42 | 분류: MASTER_SPEC]
1. 종목등록설정
2. 자동매매설정
3. 전체 자동매매 정지
4. 재시작
5. 초기화
6. 로그 보기
7. 종료
항상 노출 버튼 :
긴급 정지
규칙 :
1. 긴급 정지 버튼은 눈에 띄는 위치에 배치한다.
2. 실계좌 모드일 경우 메인 윈도우 상단에 실계좌 경고 문구를 표시한다.
3. 자동매매 실행 중 오류가 발생하면 해당 행을 오류 상태로 표시한다.
4. 메인 윈도우는 일정 주기로 상태를 새로고침한다.

[출처: 마스터스펙\MASTER_SPEC_v2.0_FULL_INTEGRATED_ARCHIVE_2026-06-11.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-11 15:25:42 | 분류: MASTER_SPEC]
5. 새로고침 기준 데이터는 state.json, orders.json, budget.json, 키움 계좌 조회 결과이다.
---
### 2. 종목등록설정 창
버튼 :
1. 검색식등록
2. 수동등록
3. 매매루틴지정
4. 무결성검증
5. 닫기
종목 목록 표시 항목 :
1. 종목코드
2. 종목명
3. 등록 루틴
4. 등록일시
5. 검증상태
규칙 :
1. 기초종목.txt 내용을 표 형태로 표시한다.
2. 중복 종목은 등록하지 않는다.
3. 등록 결과는 팝업으로 표시한다.
4. 등록 결과는 PROJECT_CHANGELOG.txt 에 기록한다.
---
### 3. 검색식등록 창
기능 :
키움 HTS에 사용자가 미리 생성한 "자동매매" 검색식을 호출한다.
화면 구성 :
1. 검색식 이름 표시
2. 검색식 불러오기 버튼
3. 검색 결과 표
4. 등록 실행 버튼
5. 닫기 버튼
검색 결과 표 표시 항목 :
1. 선택 여부
2. 종목코드
3. 종목명
4. 현재 등록 여부
5. 오류 여부
규칙 :
1. 기본 검색식 이름은 "자동매매"이다.
2. 이미 기초종목.txt 에 등록된 종목은 중복 등록하지 않는다.
3. 중복 종목은 표에서 중복으로 표시한다.
4. 등록 완료 종목 수를 팝업으로 표시한다.
5. 중복 제외 종목 수를 팝업으로 표시한다.
6. 오류 종목 수를 팝업으로 표시한다.
---
### 4. 수동등록 창
화면 구성 :

[출처: 마스터스펙\MASTER_SPEC_v2.0_FULL_INTEGRATED_ARCHIVE_2026-06-11.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-11 15:25:42 | 분류: MASTER_SPEC]
1. 종목코드 입력칸
2. 종목명 입력칸
3. 추가 버튼
4. 등록 예정 목록
5. 등록 실행 버튼
6. 닫기 버튼
규칙 :
1. 종목코드와 종목명을 입력받는다.
2. 입력 형식은 종목코드, 종목명이다.
3. 동일 종목코드가 존재하면 등록하지 않는다.
4. 동일 종목명이 존재하면 등록하지 않는다.
5. 중복 항목은 "중복항목입니다" 팝업을 표시한다.
6. 등록 완료 후 종목등록설정 창 목록을 갱신한다.
---
### 5. 매매루틴지정 창
화면 구성 :
좌측 :
기초종목.txt 등록 종목 목록
우측 :
자동매매 루틴 목록
하단 버튼 :
1. 루틴 지정
2. 지정 해제
3. 저장
4. 닫기
규칙 :
1. 기초종목.txt 에 등록된 종목만 매매루틴에 지정할 수 있다.
2. 동일 종목은 여러 매매루틴에 등록할 수 있다.
3. 동일 종목이 동일 매매루틴에 중복 등록되는 것은 금지한다.
4. 이미 등록된 루틴은 체크된 상태로 표시한다.
5. 저장 시 기초종목.txt 의 해당 종목 행에 루틴명을 반영한다.
6. 저장 시 해당 루틴 폴더 아래에 종목별 폴더를 생성한다.

[출처: 마스터스펙\MASTER_SPEC_v2.0_FULL_INTEGRATED_ARCHIVE_2026-06-11.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-11 15:25:42 | 분류: MASTER_SPEC]
1. 종목코드
2. 종목명
3. 상태
4. 보유수량
5. 평균단가
6. 매수회차
7. pending_order
8. 마지막 신호 봉
9. 마지막 주문 봉
규칙 :
1. 자동매매 루틴 목록은 실제 루틴 폴더를 기준으로 출력한다.
2. "_" 는 GUI 표시 시 제거한다.
3. 자동매매 시작 전 config.json 검증을 수행한다.
4. config 검증 실패 시 자동매매를 시작하지 않는다.
5. 자동매매 정지 시 보유 종목은 유지한다.
6. 종목 삭제 시 보유수량이 있으면 경고창을 표시한다.
---
### 7. MACD 환경설정 창
화면 구성 :
기본 설정 영역 :
1. 종목코드
2. 종목명
3. 루틴명
4. 현재 자동매매 상태
매매 시간 설정 :
1. timeframe 선택
2. start_time 입력
3. end_buy_time 입력
매수 설정 :

[출처: 마스터스펙\MASTER_SPEC_v2.0_FULL_INTEGRATED_ARCHIVE_2026-06-11.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-11 15:25:42 | 분류: MASTER_SPEC]
14. resell_condition 이 AVG_PRICE_PROFIT 이면 resell_profit_percent 는 0보다 커야 한다.
15. 검증 실패 시 해당 종목의 자동매매는 시작하지 않는다.
16. 검증 실패 내역은 GUI 팝업으로 표시하고 system_error.log 에 기록한다.
---
## [state.json]
역할 :
프로그램 복구용 상태 저장
기본 구조 :

[출처: 마스터스펙\MASTER_SPEC_v2.0_FULL_INTEGRATED_ARCHIVE_2026-06-11.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-11 15:25:42 | 분류: MASTER_SPEC]
1. 안정성 최우선.
2. 상태확인 없는 자동주문 금지.
3. 상태확인 없는 자동청산 금지.
4. 상태확인 없는 자동복귀 금지.
5. 자동매매 신뢰성이 훼손된 종목은 검토종목으로 격리.
6. 계좌 단위 문제는 긴급정지.
7. 종목 단위 문제는 해당 종목만 격리.
8. 루틴은 신호 생성기이고, 메인엔진이 실행 가능 여부를 최종 판정한다.

Original Body Marker: END

---

Reference Navigation

- Previous: PART02_02_RUNTIME.md
- Next: PART02_04_RUNTIME.md
- Full PART: PART02_RUNTIME.md
- INDEX: 00_REFERENCE_INDEX.md
- Original Canonical: ../CURRENT/MASTER_SPEC_CANONICAL_2026-07-08_EXECUTION_SENDORDER_CHEJAN_LIFECYCLE_PIPELINE.txt
