# PART01 04 SYSTEM FOUNDATION

Reference Edition Subpart

Original Canonical: MASTER_SPEC_CANONICAL_2026-07-08_EXECUTION_SENDORDER_CHEJAN_LIFECYCLE_PIPELINE.txt

Source Full Part: PART01_SYSTEM_FOUNDATION.md

생성일: 2026-07-08

주의: 본 문서는 AI 참조용 하위 분할본이며 공식 원본은 CURRENT의 Canonical이다.

Original Body Marker: START
[출처: 작업진행상황대화히스토리.txt | 기준일: 2026-06-06 | 수정시각: 2026-06-06 23:18:38 | 분류: 대화히스토리]
현재 흐름상으로는 MASTER_SPEC 반영예정항목 정리를 먼저 하는 게 맞아 보입니다. 그러면 이후 설계가 다시 흔들리지 않습니다.
너 기억 까먹기전에 만들자

[출처: 작업진행상황대화히스토리.txt | 기준일: 2026-06-06 | 수정시각: 2026-06-06 23:18:38 | 분류: 대화히스토리]
면밀히 검토해서 내용을 제대로 넣어서 마스터 스펙 만들어줘..그리고 이전 마스터 스펙과 다른 점이 뭔지 서술해줘

[출처: 작업진행상황대화히스토리.txt | 기준일: 2026-06-06 | 수정시각: 2026-06-06 23:18:38 | 분류: 대화히스토리]
--------------------------------------------------------------------------------------

[출처: 작업진행상황대화히스토리.txt | 기준일: 2026-06-06 | 수정시각: 2026-06-06 23:18:38 | 분류: 대화히스토리]
image(116).png
image(117).png
image(118).png
??? 뭘로 통일한거지? 이게 맞아?
메세지 창의 방향성은 이창이 맞는데

[출처: 작업진행상황대화히스토리.txt | 기준일: 2026-06-06 | 수정시각: 2026-06-06 23:18:38 | 분류: 대화히스토리]
image(120).png
image(121).png
image(122).png
문제가 복합적으로 생기네...

[출처: 작업진행상황대화히스토리.txt | 기준일: 2026-06-06 | 수정시각: 2026-06-06 23:18:38 | 분류: 대화히스토리]
image(153).png
image(154).png
image(155).png
아직 문제는 있고 한가지 더 문제가 스크롤해서 하단에 있는 종목을 변경하면 전체 종목 리스트가 리셋되서 다시 맨위로 이동한다. 변경한 종목을 다시 확인 하려면 스크롤해서 봐야 한다.

[출처: 작업진행상황대화히스토리.txt | 기준일: 2026-06-06 | 수정시각: 2026-06-06 23:18:38 | 분류: 대화히스토리]
수동 → 매수/매도
09:30~12:20 → 매수/매도
09:30~10:20 → 감시/매도
로 바로 가야 한다.
그래서 지금 남은 문제는 딱 하나.

[출처: 작업진행상황대화히스토리.txt | 기준일: 2026-06-06 | 수정시각: 2026-06-06 23:18:38 | 분류: 대화히스토리]
image(182).png
image(183).png
현재 데이터 불일치는 없다. 이상황이 자료가 있는 파일의 일관성을 수정한건가?

[출처: 작업진행상황대화히스토리.txt | 기준일: 2026-06-06 | 수정시각: 2026-06-06 23:18:38 | 분류: 대화히스토리]
image(213).png
image(214).png
첫번째는 네가 작성한 코드, 두번째는 방금전 내가준 형태를 조금 수정한건 비교해보고 두번째 처럼 해줘
image(215).png
image(216).png
아직 두 이미지가 다르다. 수정 못하는건가?

[출처: 작업진행상황대화히스토리.txt | 기준일: 2026-06-06 | 수정시각: 2026-06-06 23:18:38 | 분류: 대화히스토리]
image(219).png
image(220).png
얼추 비슷하다 조금만 더 힘내보자....제목이 설정항목과 다른 줄에 위치 하고 있다...한번더 분석해줘

[출처: 작업진행상황대화히스토리.txt | 기준일: 2026-06-06 | 수정시각: 2026-06-06 23:18:38 | 분류: 대화히스토리]
image(221).png
image(222).png
정말 많이 좋아졌다...그러나 디테일이 조금 부족해..다시 한번 정밀 분석해봐줘

[출처: 관제창_UI_정책확정안_v1.md | 기준일: 2026-06-05 | 수정시각: 2026-06-05 14:27:14 | 분류: 운영정책]
- MONITORING
- RUNNING
- REVIEW_REQUIRED
- EMERGENCY_STOPPED
- SELL_ONLY
- STOPPED
---
### 원칙 2. 텍스트 + 색상 동시 사용
색상만으로 상태를 판단하게 만들지 않는다.
모든 상태는 반드시 텍스트로 표시하고, 색상은 보조 수단으로 사용한다.
예:

[출처: 마스터스펙\MASTER_SPEC_v1.1_vs_v1.2_변경점.md | 기준일: 2026-06-05 | 수정시각: 2026-06-05 14:04:38 | 분류: MASTER_SPEC]
# MASTER_SPEC v1.1 대비 v1.2 변경점
## 목적

[출처: 중요문서1\무결성검사_정책확정안_v1.md | 기준일: 2026-06-05 | 수정시각: 2026-06-05 13:57:46 | 분류: 운영정책]
- 프로그램 시작 후 점검
- 대규모 설정 변경 후 점검
- 백업 복원 후 점검
- 운영자가 이상을 의심할 때
---
# 5. 버튼 원칙
버튼은 1개로 유지한다.
내부적으로 3단계를 순서대로 수행한다.
1. 구조 무결성
2. 종목 무결성
3. 계좌 무결성
---
# 6. 1단계: 구조 무결성
## 검사 항목

[출처: 중요문서1\검토종목_관리정책_확정안_v1.md | 기준일: 2026-06-05 | 수정시각: 2026-06-05 13:32:52 | 분류: 운영정책]
검토종목은 자동매매 신뢰성이 훼손되었거나 운영자 확인이 필요한 종목을 자동운영에서 분리하여 관리하는 격리 영역이다.
검토종목은 자동복귀하지 않는다.
---
## 2. 기본 원칙

[출처: 중요문서1\구조개선_설계의사결정기록_ADR_v1 .md | 기준일: 2026-06-05 | 수정시각: 2026-06-05 12:02:06 | 분류: 기타문서/자료]
본 문서는 정책설계 과정에서 왜 특정 개념을 채택하거나 폐기했는지 기록한다.
새 창에서 동일한 논리와 철학을 유지하기 위한 문서이다.

[출처: 중요문서1\구조개선_정책설계_상세기준서_v1.md | 기준일: 2026-06-05 | 수정시각: 2026-06-05 12:01:06 | 분류: 운영정책]
## 문서 목적
본 문서는 구조개선 단계에서 확정된 운영정책, 상태체계, 무결성 검사, 검토종목 정책, 긴급정지 정책을 상세 기록하여 새 창에서도 동일한 설계 철학을 유지하기 위한 기준 문서이다.
# 1. 운영 철학

[출처: 정책설계서_v20_9_3ag.md | 기준일: 2026-06-04 | 수정시각: 2026-06-04 21:05:52 | 분류: 운영정책]
# 정책설계서_v20_9_3ag

[출처: routine_folder_liveness_report.txt | 기준일: 2026-06-02 | 수정시각: 2026-06-15 16:49:58 | 분류: 기타문서/자료]
루틴폴더 생존성 분석 보고서
========================================================================
분석 ZIP: kiwoom_auto (32).zip
프로젝트 루트: /mnt/data/routine_folder_liveness_analysis/extract/kiwoom_auto

[출처: 마스터스펙\MASTER_SPEC.txt | 기준일: 2026-05-31 | 수정시각: 2026-05-31 14:53:34 | 분류: MASTER_SPEC]
# MASTER_SPEC.txt

2. 실행 환경
============
[출처: 마스터스펙\MASTER_SPEC_최신정리본_2026-07-03.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:40:50 | 분류: MASTER_SPEC]
핵심 ID:
- signal_id
- order_id
- source_signal_id
- execution_id
- lock_id
- request_hash
- kiwoom_order_no
- fill_id
- position_id
- close_history_id
- review_id
- log_id

[출처: 마스터스펙\MASTER_SPEC_최신정리본_2026-07-03.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:40:50 | 분류: MASTER_SPEC]
8. 실행 계층
- Execution Request 생성
- Kiwoom Boundary 연결
- SendOrder 단일 진입점 확인
9. 체결 계층
- Chejan 수신
- Fill 생성
- Position 갱신
- Audit Log 기록

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\90_Misc_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
KiwoomApi → opt10080 → kiwoom_candle_adapter → candle_manager →
candles.json
평가 흐름

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\90_Misc_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
7. 복구 정책
재시작 시
- 마지막 Audit Log
- active Lock
- active Execution
- Kiwoom 상태
를 함께 검토한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\90_Misc_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
Priority 2
- ExecutionController 인터페이스
- Final Execution Guard 구현
Priority 3
- Order Lock Manager
- Request Hash 생성
Priority 4
- Execution Request 생성
- ORDER_QUEUED 생성
Priority 5
- Kiwoom Boundary 연결
- KiwoomOrderExecutor
Priority 6
- Chejan / Fill
- Position Runtime

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\90_Misc_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
[호출 구조]
- Controller Layer
- Architecture Dependency Map
- Kiwoom Boundary

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\90_Misc_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
3단계 (실행 계층)
- ORDER_QUEUED 생성
- Execution Request
- KiwoomOrderExecutor
- SendOrder Boundary
4단계 (체결 계층)
- Chejan 수신
- Fill 처리
- Position 갱신
5단계 (운영 계층)
- Recovery
- Review
- Audit Log
- Close History

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\90_Misc_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
□ hoga/order_type 확정
□ execution_enabled 정책
□ operator_confirmed 정책
□ Final Execution Guard
□ Order Lock
□ Request Hash
□ Execution Request
□ Kiwoom Boundary
□ Review 정책
□ Recovery 정책

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\06_Glossary_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
7. Execution Request
==================================================
실제 주문 요청 단위.
Order와 Kiwoom 주문 사이를 연결한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\06_Glossary_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
17. Boundary
==================================================
프로젝트 내부와 Kiwoom OpenAPI 사이의 유일한 통신 계층.
==================================================
최종 원칙
Signal → Order → Execution → Fill → Position
각 용어는 하나의 의미만 가지며,
동일 용어를 다른 의미로 재정의하지 않는다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\05_Operations_Policy_Governance_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
3단계 : 실주문 계층
==================================================
구현 대상
- Kiwoom Boundary
- KiwoomOrderExecutor
- ORDER_QUEUED
- ORDER_SENT
- 주문 응답 처리
완료 조건
- 단일 SendOrder 진입점
- 중복 주문 방지
- Runtime 일관성 유지

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\05_Operations_Policy_Governance_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
3. 실주문 완료
==================================================
□ ExecutionController
□ Final Execution Guard
□ Order Lock
□ Request Hash
□ Kiwoom Boundary
□ SendOrder 단일 진입점
□ Fill
□ Position

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
8. 실행 계층
==================================================
[ ] Execution Request 생성
[ ] Kiwoom Boundary 연결
[ ] SendOrder 단일 진입점 확인

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
5. 계층
- Engine에서 GUI 접근 금지
- Engine에서 Boundary 호출 금지
- Boundary에서 정책 판단 금지
- Controller에서 OpenAPI 직접 호출 금지
6. 테스트
- 테스트 없이 구조 변경 금지
- 회귀 테스트 생략 금지
- 운영 데이터로 테스트 금지

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
P2
==================================================
- Kiwoom Boundary
- KiwoomOrderExecutor
- ORDER_QUEUED
- ORDER_SENT
- 주문 응답 처리

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
Layer 4. External API Boundary
- Kiwoom OpenAPI
- SendOrder
- Chejan/Event
- TR 조회

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
AdapterPreviewController
허용:
- kiwoom_order_adapter.build_kiwoom_order_request_preview_for_order 호출.
금지:
- send_order_stub 호출.
- SendOrder 호출.
- ADAPTER_READY 생성.
- order_queue status 변경.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
ExecutionController
허용, 향후:
- REAL_READY -> ORDER_QUEUED 전이.
- 중복주문 lock 확인.
- 최종 guard 확인.
- KiwoomOrderExecutor 호출.
금지, 현재:
- 구현 금지.
- Timer 자동 연결 금지.
- execution_enabled 자동 true 전환 금지.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
FillEventController
허용, 향후:
- 키움 체결 이벤트 수신 후 order lifecycle 반영.
금지, 현재:
- 구현 금지.
- 이벤트 없이 FILLED/CANCELLED 처리 금지.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
의존 금지:
- PyQt GUI.
- Kiwoom API.
- Timer.
- Adapter/Executor.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
의존 금지:
- real_order_preflight.
- kiwoom_order_adapter.
- order_executor.
- Kiwoom API.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
금지:
- APPROVED -> EXECUTABLE.
- Real Preflight 호출.
- order_intent unresolved를 실주문 차단으로 임의 사용, 정책 확정 전까지.
- execution_enabled 변경.
- SendOrder 호출.
- GUI 호출.
- Kiwoom API 호출.
의존 가능:
- order_queue.json.
- order dict.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
의존 가능:
- order_queue.json.
- real_trade_guard.json.
- order dict.
의존 금지:
- kiwoom_order_adapter.
- order_executor.
- GUI.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
12. kiwoom_order_adapter
==================================================

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
허용:
- REAL_READY order를 기반으로 request_preview dict 생성.
- build_kiwoom_order_request 호출.
- side/code/quantity/price/account_no 등 요청 필드 구성.
- hoga/order_type은 확정 전 UNDECIDED 유지 가능.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
의존 금지:
- order_executor 자동 호출.
- Kiwoom API 직접 호출, 현재 단계.
- GUI/Timer.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
금지:
- KiwoomOrderExecutor 구현.
- SendOrder 구현.
- Timer/GUI 자동 연결.
- REAL_READY 자동 처리.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
14. Kiwoom API Boundary
==================================================

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
허용 주체, 향후:
- KiwoomOrderExecutor만 SendOrder 호출 가능.
- FillEventController만 체결 이벤트를 lifecycle에 반영 가능.
- KiwoomApi Wrapper는 API 호출 래핑 역할.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
4단계:
- SendOrder Boundary 단일화.
- KiwoomOrderExecutor만 SendOrder 호출.
5단계:
- FillEventController로 체결 이벤트 반영.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
책임:
- REAL_READY order에 대해 키움 주문 요청 preview dict를 생성한다.
- 파일 상태를 변경하지 않는다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
호출 대상:
- kiwoom_order_adapter.build_kiwoom_order_request_preview_for_order()

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
향후 호출 대상 후보:
- order_lock_manager
- final_execution_guard
- kiwoom_order_adapter request builder
- KiwoomOrderExecutor
허용 전이:
- REAL_READY -> ORDER_QUEUED

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
단, 아래 조건 모두 필요:
- execution_enabled == true
- operator_confirmed == true
- real_trade_enabled == true
- kiwoom_logged_in == true
- account_selected == true
- account_no 존재
- hoga/order_type 확정
- order_intent.unresolved == false
- 중복주문 lock 획득
- 최종 실행 호출 주체 존재

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
책임:
- 주문 취소/정정 요청 흐름을 관리한다.
- 실제 취소/정정 완료는 키움 이벤트 또는 조회 확인 후 반영한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
금지:
- 불명확 주문을 자동 DONE 처리 금지.
- 키움 상태 확인 없이 FILLED/CANCELLED 처리 금지.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
1. hoga/order_type 매핑 설계
2. order_intent resolved 조건 설계
3. order lock manager 설계
4. ExecutionController 상세 설계
5. ORDER_QUEUED 생성 helper 설계
6. SendOrder 전 최종 guard helper 설계
7. 키움 체결 이벤트 연결 구조 분석

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
4. 확인 대상
- signal_id
- order_id
- execution_id(향후)
- lock_id(향후)
- request_hash(향후)
- kiwoom_order_no(향후)

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
5. 운영 검토
==================================================
□ Review Management 기준을 만족하는가
□ Recovery 정책과 충돌하지 않는가
□ Kiwoom Boundary를 우회하지 않는가

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
2. 단방향 의존성
==================================================
GUI
 ↓
Controller
 ↓
Engine / Policy / Guard
 ↓
Runtime
 ↓
Boundary
 ↓
Kiwoom OpenAPI
하위 계층이 상위 계층을 호출해서는 안 된다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
Routine
 ↓ routine/routine_name/engine
Signal
 ↓ signal_id
Order
 ↓ order_id + source_signal_id
Execution
 ↓ execution_id + order_id
Kiwoom Order
 ↓ kiwoom_order_no + execution_id
Fill
 ↓ fill_id + kiwoom_order_no
Position
 ↓ position_id + fill_id/order_id
Close History
 ↓ close_history_id + position_id
Review
 ↓ review_id + related_*_id
Audit Log
 ↓ log_id + entity_type/entity_id

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
금지
- SendOrder 관련 필드 저장 금지.
- order_id 직접 생성 금지.
- Kiwoom 주문번호 저장 금지.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
주요 필드
{
 "real_trade_enabled": false,
 "kiwoom_logged_in": false,
 "account_selected": false,
 "operator_confirmed": false,
 "account_no": ""
}

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
역할
- 실제 실행 요청 단위(Execution Request)를 저장한다.
- order_queue의 order와 Kiwoom SendOrder 사이의 연결 고리이다.
생성 시점
- ORDER_QUEUED 생성 시점 또는 직후.
- lock 획득 후.
생성 주체
- 향후 ExecutionController

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
주요 구조 후보
{
 "version": 1,
 "updated_at": "datetime",
 "fills": [
 {
 "fill_id": "string",
 "kiwoom_order_no": "string",
 "order_id": "string",
 "execution_id": "string",
 "source_signal_id": "string",
 "code": "003550",
 "side": "BUY|SELL",
 "fill_qty": 0,
 "fill_price": 0.0,
 "fill_amount": 0.0,
 "remaining_qty": 0,
 "fill_time": "datetime",
 "event_source": "chejan",
 "raw_chejan": {}
 }
 ]
}

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
역할
- 내부 보유 Position 상태를 저장한다.
- Fill 결과와 Kiwoom 잔고를 기준으로 관리한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
금지
- Order만으로 Position 생성 금지.
- SendOrder 성공만으로 Position 변경 금지.
- Kiwoom 잔고 불일치 자동 수정 금지.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
14. candles.json
==================================================
역할
- 루틴 평가 입력 데이터.
- Kiwoom opt10080 등에서 수집된 분봉/캔들 데이터.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
생성/수정 주체
- kiwoom_candle_adapter
- candle_manager
- Timer/수동 조회 경로

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
order_executions.json
- 생성/수정: ExecutionController / KiwoomOrderExecutor, 향후
fills.json
- 생성/수정: FillEventController, 향후

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
- 이 order는 어떤 signal에서 왔는가?
- 이 signal은 어떤 routine이 만들었는가?
- 이 order는 어떤 execution으로 이어졌는가?
- 이 execution은 어떤 Kiwoom 주문번호와 연결되는가?
- 이 fill은 어떤 order의 일부인가?
- 이 position은 어떤 fill/order에서 생겼는가?
- 이 position은 어떤 close order로 종료되었는가?
- 오류/검토관리 항목은 어떤 signal/order/execution에서 유래했는가?
이 관계가 정의되지 않으면 재시작, 복구, 검토관리, 체결 추적, 로그 분석이 어려워진다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
관계:
- execution.order_id -> order_queue.orders[].id
- execution.source_signal_id -> routine_signals.json.id
3.5 Kiwoom Order
의미:
- 키움 API가 접수한 실제 주문.
- SendOrder 이후 키움 주문번호/접수번호와 연결된다.
현재 상태:
- 아직 미구현.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
권장 필드:
- kiwoom_order_no
- original_order_no
- order_id
- execution_id
- account_no
- code
- side
- order_qty
- order_price
- hoga
- order_type
- accepted_at
- api_result_code
- api_message

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
관계:
- kiwoom_order.order_id -> order_queue.orders[].id
- kiwoom_order.execution_id -> Execution Request
- kiwoom_order.kiwoom_order_no -> Fill / Chejan Event 매칭 기준
3.6 Fill
의미:
- 실제 체결 정보.
- 부분체결/전량체결 모두 Fill 이벤트로 누적한다.
권장 저장 위치:
- runtime/fills.json
- 또는 종목별 fill_history.json

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
권장 필드:
- fill_id
- kiwoom_order_no
- order_id
- execution_id
- code
- side
- fill_qty
- fill_price
- fill_amount
- remaining_qty
- fill_time
- event_source
- raw_chejan

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
관계:
- fill.kiwoom_order_no -> Kiwoom Order
- fill.order_id -> Order Queue
- fill.execution_id -> Execution Request
- fill.position_id -> Position, 향후
3.7 Position
의미:
- 현재 보유 상태.
- 여러 fill의 결과로 만들어질 수 있다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
규칙:
- order_id는 주문 후보부터 lifecycle 전체에서 유지되는 핵심 ID이다.
- order_id 없이 SendOrder 금지.
4.3 execution_id
정의:
- 실제 실행 요청 단위 ID.
- ORDER_QUEUED 이후 생성.
사용처:
- SendOrder request
- Kiwoom Order
- Fill
- Audit Log

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
규칙:
- order_id 하나가 여러 execution_id를 가질 수 있는지는 향후 재시도 정책에서 결정한다.
- 1차 정책은 order_id 1개당 execution_id 1개가 안전하다.
4.4 kiwoom_order_no
정의:
- 키움 서버 주문번호/접수번호.
사용처:
- Chejan/Event 매칭
- Fill
- Cancel/Modify

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
규칙:
- Kiwoom 체결 이벤트는 kiwoom_order_no 기준으로 order/execution에 매핑한다.
- kiwoom_order_no 매칭 실패 시 검토관리 대상.
4.5 fill_id
정의:
- 체결 이벤트 단위 ID.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
규칙:
- position은 Kiwoom 잔고와 내부 fill 누적 결과를 비교하여 관리한다.
- 불일치 시 검토관리 대상.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
Routine
 └─ routine_name / engine
 ↓
Signal
 └─ signal_id
 ↓ source_signal_id
Order Queue
 └─ order_id
 ↓ execution_id
Execution Request
 └─ execution_id
 ↓ kiwoom_order_no
Kiwoom Order
 └─ kiwoom_order_no
 ↓ fill_id
Fill
 └─ fill_id
 ↓ position_id
Position
 └─ position_id
 ↓ close_history_id
Close / Exit History

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
1. 최상위 계층
==================================================
GUI
↓
Controller
↓
Engine / Policy
↓
Runtime
↓
Boundary
↓
Kiwoom OpenAPI

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
2. 허용되는 의존 방향
==================================================
GUI → Controller
Controller → Engine
Controller → Runtime
Controller → Boundary
Engine → Runtime(Read)
Boundary → OpenAPI

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
5. Boundary 계층
==================================================
역할
- OpenAPI 통신
- 외부 시스템 연결
출력
- OpenAPI 응답

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
5. Controller ↔ Boundary
==================================================
입력
- 주문 요청
- 조회 요청
출력
- OpenAPI 응답
- 오류 정보

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
Adapter Request Preview
- REAL_READY order 1건을 키움 주문 요청 dict로 변환한 메모리 preview.
- order_queue.json status 변경 없음.
- send_order_stub 미호출.
- SendOrder 미호출.
3. 핵심 파일별 책임

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
kiwoom_order_adapter.py
- build_kiwoom_order_request(order, guard):
 order dict와 guard dict를 키움 주문 요청 preview 형태로 변환한다.
- send_order_stub(request):
 실제 SendOrder 대신 stub 결과를 반환한다. 현재 preview helper에서는 호출하지 않는다.
- build_kiwoom_order_request_preview_for_order(order_id, queue_path=None, guard_path=None):
 REAL_READY order 1건만 request_preview로 변환한다.
 파일 저장 없음.
 status 변경 없음.
 send_order_stub 미호출.
 SendOrder 미호출.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
real_order_executor_stub.py
- REAL_READY order를 읽어 build_kiwoom_order_request()와 send_order_stub()을 호출할 수 있는 stub.
- 실행 시 order_queue.json을 ADAPTER_READY로 변경한다.
- 현재 자동 연결 금지.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
kiwoom_order_adapter.py
- build_kiwoom_order_request(order, guard)
- send_order_stub(request)
- build_kiwoom_order_request_preview_for_order(order_id, queue_path=None, guard_path=None)
5. 테스트 파일 목록

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
python -m py_compile routine_signal_consumer.py gui_auto_trade_timer.py order_queue.py order_approval_engine.py
python -m unittest tests/test_order_queue_approval_scenarios.py

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
python -m py_compile operation_policy_gate.py
python -m unittest tests/test_operation_policy_gate_single_order.py

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
python -m py_compile real_order_preflight.py
python -m unittest tests/test_real_order_preflight_evaluate.py
python -m unittest tests/test_real_order_preflight_single_order.py

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
python -m py_compile kiwoom_order_adapter.py
python -m unittest tests.test_kiwoom_order_adapter_preview

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
python -m unittest tests.test_real_order_preflight_single_order tests.test_real_order_preflight_evaluate tests.test_operation_policy_gate_single_order tests.test_order_queue_approval_scenarios

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
- KiwoomOrderExecutor 실제 구현
- QAxWidget SendOrder 호출
- send_order_stub 자동 호출
- real_order_executor_stub 자동 호출
- REAL_READY -> ADAPTER_READY 자동 전이
- ADAPTER_READY 이후 DONE/ERROR 처리
- Timer에서 Executor 호출
- GUI에서 실주문 실행 버튼 연결
- execution_enabled=true 자동 승격
- operator_confirmed 자동 설정
- 계좌번호 자동 선택
- hoga/order_type 미확정 상태에서 실제 주문 요청 전송
9. 다음 단계 위험 지점

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
가장 안전한 다음 단계:
1) Adapter Request Preview 결과를 GUI 또는 CLI에서 표시만 한다.
2) build_kiwoom_order_request() 입력/출력 테스트를 더 촘촘히 고정한다.
3) hoga/order_type mapping을 문서와 테스트로 먼저 설계한다.
4) REAL_READY order 목록 reader를 표시 전용으로 만든다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
- status == REAL_READY
- execution_enabled == true
- real_trade_enabled == true
- operator_confirmed == true
- kiwoom_logged_in == true
- account_selected == true
- account_no 존재
- quantity > 0
- side가 BUY 또는 SELL
- order_type/hoga 확정
- 중복 주문 방지 lock 통과
단, 이 조건들은 SendOrder 직전 조건이며 현재 단계에서 자동 연결하지 않는다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
1. order.status == REAL_READY
2. order.execution_enabled == true
3. real_trade_guard.real_trade_enabled == true
4. real_trade_guard.operator_confirmed == true
5. real_trade_guard.kiwoom_logged_in == true
6. real_trade_guard.account_selected == true
7. real_trade_guard.account_no 존재
8. quantity > 0
9. side in BUY/SELL
10. order_type 확정
11. hoga 확정
12. 중복 주문 방지 lock 통과
13. 최종 실행 주체가 명확함
14. GUI/운영자 승인 또는 명시 호출 존재
현재 단계에서는 이 조건 검토만 하며 SendOrder 구현은 금지한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
- ADAPTER_READY 상태 생성
- REAL_READY -> ADAPTER_READY 전이
- real_order_executor_stub 자동 연결
- SendOrder 호출
- send_order_stub 호출
- order_executor 연결
- kiwoom_order_adapter 실제 전송 연결
- Timer/GUI 자동 실행 연결
- execution_enabled=true 자동 전환
- operator_confirmed=true 자동 설정
- ORDER_QUEUED 자동 생성
- DONE/ERROR 자동 전이

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
목적
- Kiwoom 체결(Chejan) 이벤트를 내부 주문 파이프라인과 연결하는 기준을 정의한다.
- 체결 이벤트는 주문을 생성하지 않으며, 이미 생성된 주문의 상태를 갱신하는 역할만 수행한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
Kiwoom Chejan
 ↓
Kiwoom Boundary
 ↓
FillEventController
 ↓
Execution
 ↓
Order
 ↓
Position
 ↓
Audit Log
 ↓
Review Management(필요 시)

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
8. Recovery
재시작 시
- Kiwoom 주문번호
- Fill
- Position
을 함께 비교한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
7. Recovery
재시작 시
- Position
- Close History
- Fill
- Kiwoom 잔고
를 비교한다.
8. Audit Log
기록
- 청산 시작
- 부분청산
- 청산 완료
- 청산 실패

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
현재 ORDER_QUEUED 이후에는 실제 실행 요청 단위가 아직 정의되지 않았다.
따라서 order_queue의 order와 실제 키움 주문 요청 사이에 Execution Request 엔티티가 필요하다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
의미:
- order 후보를 실제 주문 실행 파이프라인으로 넘긴 기록
- ORDER_QUEUED 이후 생성
- SendOrder 요청 파라미터, guard snapshot, lock 정보, 실행 시각을 보관
- Kiwoom 주문번호가 생기기 전까지 order와 실제 API 호출 사이의 연결 고리

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
- order.status == REAL_READY
- execution_enabled == true
- operator_confirmed == true
- real_trade_enabled == true
- kiwoom_logged_in == true
- account_selected == true
- account_no 존재
- order_type 확정
- hoga 확정
- quantity > 0
- order_intent.unresolved == false
- order_lock 획득 성공
- Adapter Request 생성 성공
- ExecutionController의 명시 호출 존재

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
order_type / hoga
- SendOrder 입력에 필요한 주문유형/호가구분.
- 아직 미확정이므로 Execution Request 구현 전 hoga/order_type 설계 필요.
request_preview
- Adapter Request Preview 결과 snapshot.
request_hash
- 동일 요청 중복 실행 방지를 위한 hash.
guard_snapshot
- 실행 직전 real_trade_guard snapshot.
operator_confirmed
- 실행 시점 operator_confirmed 값.
execution_enabled
- 실행 시점 order.execution_enabled 값.
kiwoom_order_no
- SendOrder 접수 이후 키움 주문번호.
- 생성 직후에는 null.
api_result_code / api_message
- SendOrder 반환 결과 또는 오류 메시지.
error
- 실행 요청 오류 정보.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
7. Kiwoom Order와의 관계
==================================================
SendOrder 이후 키움 주문번호가 생기면 다음 관계가 형성된다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
Execution Request
 ↓ kiwoom_order_no
Kiwoom Order
 ↓ Chejan/Event
Fill

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
관계:
- execution.kiwoom_order_no -> 키움 주문번호
- fill.kiwoom_order_no -> execution.kiwoom_order_no
- fill.execution_id -> execution.execution_id
- fill.order_id -> order_id

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
정책:
- SendOrder 반환값만으로 FILLED 처리 금지.
- 키움 주문번호가 없으면 체결 이벤트 매칭이 불안정하므로 검토관리 대상 가능.
- kiwoom_order_no 매칭 실패 시 ERROR 또는 Review Management 후보.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
정책:
- execution은 있는데 kiwoom_order_no가 없으면 SendOrder 호출 여부 불명확.
- SendOrder 호출 여부가 불명확하면 자동 재호출 금지.
- 키움 서버 조회 후 상태 확정.
- 불일치하면 검토관리.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
현재 금지:
- runtime/order_executions.json 생성
- execution_id 생성 코드 추가
- Execution Request helper 구현
- ORDER_QUEUED 생성 코드 추가
- SendOrder 호출
- KiwoomOrderExecutor 구현
- ORDER_SENT/ORDER_ACCEPTED 상태 추가
- request_hash 실행 로직 추가
- lock 연동 코드 추가
- GUI/Timer 연결
- 체결 이벤트 연결

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
1. hoga/order_type 매핑 설계
2. order_intent resolved 조건 설계
3. order_locks.json 상세 구조 설계 보강
4. ORDER_QUEUED 생성 helper 설계
5. final_execution_guard 설계
6. SendOrder request_hash 설계
7. Kiwoom order_no 매칭 설계

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
따라서 SendOrder 구현 전 execution_id, lock_id, request_hash, guard_snapshot, kiwoom_order_no 관계를 먼저 확정해야 한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
REAL_READY
 ↓ Adapter Request Preview
REAL_READY 유지
 ↓ Final Execution Guard
ORDER_QUEUED
 ↓ KiwoomOrderExecutor, 향후
ORDER_SENT / ORDER_ACCEPTED / REJECTED

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
필수:
- side 정상
- code 정상
- quantity > 0
- price 정책 정상
- account_no 정상
- hoga/order_type 확정
- send_order_enabled는 여전히 false일 수 있음, preview 기준
- 실제 SendOrder enabled 여부는 ExecutionController/KiwoomOrderExecutor에서 별도 관리
Adapter Preview 실패 시 ORDER_QUEUED 금지.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
현재 단계에서 금지:
- Final Execution Guard 코드 구현
- ORDER_QUEUED 생성
- SendOrder 호출
- KiwoomOrderExecutor 구현
- order_locks.json 생성
- order_executions.json 생성
- execution_enabled=true UI 구현
- operator_confirmed=true UI 구현
- Timer/GUI 자동 실행 연결
- BLOCKED_EXECUTION 등 새 상태값 추가
- Adapter Preview를 실행 요청으로 오해
- order_intent.unresolved 상태에서 실행 허용

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
SOURCE: MASTER_SPEC_추가갱신_Kiwoom_Boundary_API_경계설계_2026-07-03.txt
==================================================
MASTER_SPEC_추가갱신_Kiwoom_Boundary_API_경계설계_2026-07-03

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
2. 계층 구조
GUI / Timer
 ↓
Controller Layer
 ↓
Domain Engine
 ↓
Execution Controller
 ↓
Kiwoom Boundary
 ↓
Kiwoom OpenAPI

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
5. Boundary가 반환하는 정보
- success/fail
- api_result_code
- api_message
- kiwoom_order_no
- requested_at

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
현재 주문 파이프라인은 Adapter Request Preview까지 안전하게 구성되었으나, 실제 키움 주문 요청으로 넘어가기 전 핵심 미완성 항목이 남아 있다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
현재 hoga:
- 확정하지 않음
- kiwoom_order_adapter.py에서 여전히 UNDECIDED 가능

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
금지:
- order_intent 추가를 이유로 hoga를 임의 확정 금지
- 시장가/지정가/현재가를 임의 변환 금지
- 한글 combo text를 바로 키움 hoga code로 매핑 금지
- SendOrder 입력값으로 사용 금지

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
7. Recovery 정책
재시작 시 Lock은 Kiwoom 상태와 대조한다.
불일치 시 자동 삭제하지 않고 검토관리 대상으로 분류한다.
8. Runtime 관계
향후 후보 파일:
- runtime/order_locks.json

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
검증 명령:
- python -m py_compile order_queue.py order_candidate_engine.py routine_signal_consumer.py
- python -m unittest tests.test_order_queue_approval_scenarios
- python -m unittest tests.test_kiwoom_order_adapter_preview tests.test_real_order_preflight_single_order

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
2. 생성 흐름
Signal
→ Order
→ Execution
→ Kiwoom Order
→ Fill
→ Position

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
매도 Fill:
- holding_qty 감소
- realized_pnl 갱신
- holding_qty가 0이면 Position 종료 후보
5. Position과 Kiwoom 잔고
정기 비교 항목
- 보유수량
- 가용수량
- 평균단가
- 종목코드
불일치 시 자동 수정하지 않고 검토관리 후보로 분류한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
7. Recovery
재시작 시 확인 순서
- Position
- Fill
- Kiwoom 잔고
- Order
- Review Management

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
Execution 단계(향후)
- Lock 충돌
- Request Hash 충돌
- SendOrder 결과 불명확
Kiwoom 단계(향후)
- 주문번호 매칭 실패
- 체결 이벤트 불일치
- 잔고와 체결 불일치

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
4. 필수 연결 ID
- review_id
- related_signal_id
- related_order_id
- related_execution_id(향후)
- related_fill_id(향후)
- related_position_id(향후)
- request_hash(향후)
- kiwoom_order_no(향후)

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
8. Recovery 연계
재시작 시
- Signal
- Order
- Lock
- Execution
- Kiwoom 상태
를 비교하여 불명확한 항목은 검토관리로 이동한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
- order.status == REAL_READY
- real_trade_guard.real_trade_enabled == true
- real_trade_guard.operator_confirmed == true
- real_trade_guard.kiwoom_logged_in == true
- real_trade_guard.account_selected == true
- real_trade_guard.account_no 존재
- quantity > 0
- side가 BUY 또는 SELL
- order_type 확정
- hoga 확정
- 중복 주문 방지 lock 통과
- 종목 상태가 정상 운영 가능
- 미수/미도/잔량 충돌 없음
- 검토관리 대상 아님
- 실행 버튼/명시 호출 등 최종 실행 주체가 존재

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
- order.status == REAL_READY
- execution_enabled == true
- operator_confirmed == true
- real_trade_enabled == true
- kiwoom_logged_in == true
- account_selected == true
- account_no 존재
- Adapter request 생성 성공
- order_type/hoga 확정
- 중복 주문 lock 획득 성공
- 최종 실행 함수/버튼에서 명시 호출
4.3 생성 금지 조건
아래 경우 ORDER_QUEUED 생성 금지.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
단, 실제 키움 OpenAPI에서는 SendOrder 반환값만으로 체결 완료를 의미하지 않는다.
따라서 DONE의 의미는 단계별로 재정의가 필요하다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
1. hoga/order_type 매핑 설계
2. Adapter Request Preview 결과 필드 정책 검증
3. 중복주문 방지 lock 설계
4. ORDER_QUEUED 생성 helper 설계
5. SendOrder 전 최종 guard helper 설계
6. GUI 주문후보 목록/수동 승인 다이얼로그 설계
7. 실제 KiwoomOrderExecutor 구현 여부 검토

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\00_Final_Index_Reference_Map_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
6. 코드 참조 순서
==================================================
GUI
↓
Controller
↓
Engine / Policy
↓
Runtime
↓
Boundary
↓
Kiwoom API

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:21:58 | 분류: MASTER_SPEC]
==================================================
Source documents
==================================================
- MASTER_SPEC_추가갱신_ADAPTER_READY_미사용정책_2026-07-03.txt
- MASTER_SPEC_추가갱신_Chejan_Fill_Event_Lifecycle_설계_2026-07-03.txt
- MASTER_SPEC_추가갱신_Close_Liquidation_Model_청산모델_설계_2026-07-03.txt
- MASTER_SPEC_추가갱신_Execution_Request_order_executions_설계_2026-07-03.txt
- MASTER_SPEC_추가갱신_Hoga_OrderType_매핑설계_2026-07-03.txt
- MASTER_SPEC_추가갱신_Kiwoom_Boundary_API_경계설계_2026-07-03.txt
- MASTER_SPEC_추가갱신_order_intent_미확정진단필드_2026-07-03.txt
- MASTER_SPEC_추가갱신_Order_Lock_Manager_설계_2026-07-03.txt
- MASTER_SPEC_추가갱신_order_provenance_주문생성이력_2026-07-03.txt
- MASTER_SPEC_추가갱신_Order_State_Machine_주문상태머신_설계_2026-07-03.txt
- MASTER_SPEC_추가갱신_Position_Model_보유상태_설계_2026-07-03.txt
- MASTER_SPEC_추가갱신_Request_Hash_중복실행방지_설계_2026-07-03.txt
- MASTER_SPEC_추가갱신_Review_Management_주문파이프라인연계_2026-07-03.txt
- MASTER_SPEC_추가갱신_실주문실행책임_ORDER_QUEUED_주문생명주기_2026-07-03.txt

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
kiwoom_auto (13)(1).zip
ZIP 아카이브
다음 작업을 진행 하기 위해 내용 빠짐없이 파악해

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
_gui_macd_buy_method_controls.py
Python
현재 자동매매루틴 UI프로토 타입을 막바지 조정 작업중이다. 가능하면 오늘 이 작업을 마무리하고 UI의 각 설정 기능과 동작 로직을 작성 연결하는 작업으로 간다..
kiwoom_auto (14)(1).zip
ZIP 아카이브
우선 실태 파악은 네가 하고 다음 대책을 논의

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
kiwoom_auto (15)(1).zip
ZIP 아카이브
완료했습니다. 자동매매루틴 이름 하드코딩을 Registry/routine.json 기반으로 정리했습니다.

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
kiwoom_auto오류.zip
ZIP 아카이브
분석해서 네가 복원파일 줘라...코덱스는 백업파일이 없어서 복원이 안된다
kiwoom_auto (17)(2).zip
ZIP 아카이브
체크박이 이동작이 맞는건가?
희미하게 박스테두리가 보이는데 하단 높이가 달라. 높이를 같이 맞춰줘
무슨상황인가?
표시한 부분 높이를 다른 것들과 맞춰서 줄여
kiwoom_auto (19)(1).zip
ZIP 아카이브
분석해서 파일 작성해줘
다시 만들어
이게 뭐냐???
별 변화는 없는데?
kiwoom_auto (21)(1).zip
ZIP 아카이브
노답이네..
kiwoom_auto (21)(2).zip
ZIP 아카이브
이 폴더로 복원 ?
kiwoom_auto (20)(1).zip
ZIP 아카이브
kiwoom_auto (19)(2).zip
ZIP 아카이브
kiwoom_auto (18)(1).zip
ZIP 아카이브
일단 배치는 됐는데 각 설정의 기능들이 풀려 버렸다.

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
py_compile 통과:
text
python -m py_compile routines\지표추종매매\routine_rule_mapper.py

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
검증:
- python -m py_compile routines\지표추종매매\routine_rule_mapper.py 통과
- mapper 파일 내 non-ASCII 문자 수: 0

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
추가 파일:
- [tests/test_indicator_follow_rule_mapper_preview.py](C:/Users/JIN%20KWANG%20CHUL/Documents/kiwoom_auto/tests/test_indicator_follow_rule_mapper_preview.py)

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
python -m unittest tests/test_indicator_follow_rule_mapper_preview.py
Ran 6 tests in 0.025s
OK
좋습니다. 여기까지는 안정적으로 완료입니다.
현재 완료 판정:

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
반환 후보:
python
{
 "changes": [
 {
 "path": "bar.bar_minutes",
 "status": "changed",
 "current_value": 1,
 "preview_value": 5,
 "risk": "low",
 "note": "Mapped from UI basic signal interval"
 }
 ],
 "summary": {
 "added": 0,
 "changed": 3,
 "same": 2,
 "postponed": 10
 },
 "warnings": [...]
}

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
추가 함수:
python
compare_engine_rules_preview(current_rules, preview_result)

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
python -m unittest tests/test_indicator_follow_rule_mapper_preview.py
Ran 10 tests in 0.055s
OK
좋습니다. 여기까지 완료 판정입니다.
현재 상태:

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
검증:
text
python -m py_compile gui_indicator_follow_routine_settings_dialog.py
통과

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
python -m unittest tests/test_indicator_follow_rule_mapper_preview.py
Ran 12 tests in 0.083s
OK
좋습니다. 이 단계는 정상 완료입니다.
현재 판정:

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
검증:
- python -m py_compile gui_auto_trade_timer.py routine_signal_consumer.py
- signal_probe_only=False 상태에서는 consumer 호출 안 됨
- signal_probe_only=True 상태에서만 consumer 호출됨
- 신규 PENDING이 있으면 BLOCKED/PREVIEWED/ERROR로 전이됨
- routine_signals.json 외 orders/state/rules/order_queue.json 변경 없음
- SendOrder/SetRealReg 없음 확인

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
검증:
- python -m py_compile gui_auto_trade_timer.py routine_signal_consumer.py 통과
- helper 검증:
 - signal_probe_only=False → False
 - signal_probe_only=True → True
- fake timer 검증:
 - false 상태: consumer 호출 0회
 - true 상태: consumer 호출 1회
 - 호출 인자: limit=5, mark_previewed=True
 - 표시 메시지: 주문후보검증: 확인 2 / 차단 1 / 허용 1 / 오류 0

[출처: MASTER_SPEC_최종_작업재개요약_2026-07-03.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:53:13 | 분류: 작업재개요약]
execution_enabled = false 유지
SendOrder 미연결
Kiwoom Boundary 미연결
Fill / Position Runtime 미구현

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\raw_extracted\MASTER_SPEC_추가갱신_프로젝트_모듈카탈로그_Module_Catalog_2026-07-03.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:48:40 | 분류: 갱신문서]
==================================================
5. Boundary 계층
==================================================
역할
- OpenAPI 통신
- 외부 시스템 연결
입력
- Controller
출력
- OpenAPI 응답

[출처: 작업재개요약서_2026-07-03_주문파이프라인_아키텍처설계_중간정리.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:02:24 | 분류: 작업재개요약]
미연결:
- SendOrder
- order_executor
- KiwoomOrderExecutor
- real_order_executor_stub 자동 연결
- GUI/Timer 실주문 연결
- ORDER_QUEUED 자동 생성

[출처: 작업재개요약서_2026-07-03_주문파이프라인_아키텍처설계_중간정리.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:02:24 | 분류: 작업재개요약]
Routine
 ↓
Signal(signal_id)
 ↓ source_signal_id
Order(order_id)
 ↓ execution_id
Execution Request(execution_id)
 ↓ kiwoom_order_no
Kiwoom Order
 ↓ fill_id
Fill
 ↓ position_id
Position
 ↓ close_history_id
Close / Exit History

[출처: 작업재개요약서_2026-07-03_주문파이프라인_아키텍처설계_중간정리.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:02:24 | 분류: 작업재개요약]
Execution Request 의미:
- REAL_READY order를 실제 SendOrder 대상으로 올리는 실행 요청 단위.
- order_queue와 실제 Kiwoom 주문 사이의 연결 고리.
향후 후보 파일:
- runtime/order_executions.json

[출처: 작업재개요약서_2026-07-03_주문파이프라인_아키텍처설계_중간정리.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:02:24 | 분류: 작업재개요약]
검토관리 후보:
- signal/order 연결 손상
- order_intent/order_provenance 손상
- 반복 BLOCKED
- guard 불일치 반복
- lock/request_hash 충돌
- 주문번호 매칭 실패
- 체결/Position 불일치
- Runtime와 Kiwoom 서버 불일치

[출처: 작업재개요약서_2026-07-03_주문파이프라인_아키텍처설계_중간정리.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:02:24 | 분류: 작업재개요약]
==================================================
16. Kiwoom Boundary
==================================================
역할:
- 내부 도메인과 Kiwoom OpenAPI 사이의 단일 경계.

[출처: 작업재개요약서_2026-07-03_주문파이프라인_아키텍처설계_중간정리.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:02:24 | 분류: 작업재개요약]
흐름:
Kiwoom Chejan
 ↓
Kiwoom Boundary
 ↓
FillEventController
 ↓
Execution
 ↓
Order
 ↓
Position
 ↓
Audit Log
 ↓
Review Management, 필요 시

[출처: 작업재개요약서_2026-07-03_주문파이프라인_아키텍처설계_중간정리.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:02:24 | 분류: 작업재개요약]
현재 금지:
- SendOrder 구현
- KiwoomOrderExecutor 구현
- ExecutionController 구현
- ORDER_QUEUED 자동 생성
- ORDER_SENT/ORDER_ACCEPTED/FILLED 코드 추가
- execution_enabled=true 자동 전환
- operator_confirmed=true 자동 설정
- hoga/order_type 확정 구현
- order_locks.json 생성
- order_executions.json 생성
- audit_log.jsonl 생성
- fills/positions/review runtime 파일 생성
- GUI/Timer 실주문 연결
- real_order_executor_stub 자동 연결
- ADAPTER_READY 부활
- 체결 이벤트 구현
- 취소/정정 구현

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\raw_extracted\MASTER_SPEC_추가갱신_Kiwoom_Boundary_API_경계설계_2026-07-03.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 12:48:26 | 분류: 갱신문서]
MASTER_SPEC_추가갱신_Kiwoom_Boundary_API_경계설계_2026-07-03

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\raw_extracted\MASTER_SPEC_추가갱신_Runtime_Data_Model_Entity_Relationship_2026-07-03.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 12:25:24 | 분류: 갱신문서]
관계:
- kiwoom_order.order_id -> order_queue.orders[].id
- kiwoom_order.execution_id -> Execution Request
- kiwoom_order.kiwoom_order_no -> Fill / Chejan Event 매칭 기준
3.6 Fill
의미:
- 실제 체결 정보.
- 부분체결/전량체결 모두 Fill 이벤트로 누적한다.
현재 상태:
- 아직 미구현.
권장 저장 위치:
- runtime/fills.json
- 또는 종목별 fill_history.json

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\raw_extracted\MASTER_SPEC_추가갱신_Controller_Layer_호출책임_2026-07-03.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 12:01:20 | 분류: 갱신문서]
책임:
- 주문 취소/정정 요청 흐름을 관리한다.
- 실제 취소/정정 완료는 키움 이벤트 또는 조회 확인 후 반영한다.
현재 상태:
- 설계만 존재.
- 구현 금지.

[출처: 작업재개요약서_2026-07-03_주문파이프라인_Preview.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 10:42:48 | 분류: 작업재개요약]
6) REAL_READY -> Adapter Request Preview
- kiwoom_order_adapter.py에 단건 preview helper가 추가되었다.
- REAL_READY order 1건만 키움 주문 요청 preview dict로 변환한다.
- build_kiwoom_order_request(order, guard)만 사용한다.
- send_order_stub()은 호출하지 않는다.
- SendOrder는 호출하지 않는다.
- order_queue.json status 변경 없음.
- ADAPTER_READY 생성 없음.
2. 단계별 변경 파일 및 추가 함수

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
================================================================================
파일: MASTER_SPEC_누락보강_111_OpenAPI연동_실시간처리아키텍처_신규.txt
================================================================================
MASTER_SPEC 누락보강 111 주제 : 키움 OpenAPI 연동 및 실시간 처리
아키텍처 (신규)

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
※ 본 문서는 기존 01~110의 재통합이 아니라, 아직 독립적으로 정리되지 않은
OpenAPI 연동 영역을 신규 설계 문서 형태로 작성한 것이다.
1. 목적 키움 OpenAPI와 프로젝트 내부 엔진을 연결하는 구조를 표준화한다.
2. OpenAPI 계층

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- Thread 응답 지연 감시
- 비정상 종료 감지
- 자동 재시작 가능 여부 판정
- 로그 기록 및 운영 알림
8. 성능 관리
- Thread 수 모니터링
- Queue 적체 감시
- 평균 처리시간 측정
- 병목 구간 분석
9. 향후 확장
- Thread Pool
- Process Pool
- 비동기 I/O
- 분산 실행 환경
10. 구현 원칙

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
1. 목적 프로토타입 UI와 루틴 엔진을 실제 OpenAPI 환경으로 안전하게
 연결하기 위한 운영 전환 절차와 정책을 정의한다.
2. 운영 전환 원칙

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
10. 결론 OpenAPI 연계는 프로젝트의 최종 단계이며, 모든 구조와 정책이
 안정화된 이후에만 운영 환경으로 전환한다.

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_05.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:30 | 분류: MASTER_SPEC]
1. 목적 PLAN 중심 자동매매 프레임워크를 실제 운영 환경에 적용하기 전에
 반드시 확인해야 하는 최종 승인 기준을 정의한다.

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_04.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:24 | 분류: MASTER_SPEC]
- 일시적 네트워크 오류
- OpenAPI 재연결
- Runtime 파일 재로드
- Queue 재처리
- 설정 재검증
7. 복구 불가 대상
- 데이터 무결성 손상
- 반복 치명 오류
- 설정 호환성 실패
- 참조 구조 손상
8. 기록 항목
- 발생 시각
- 오류 코드
- 심각도
- 발생 위치
- 예외 메시지
- 복구 결과
- 관련 이벤트 ID
- 오류 사전(Error Catalog)
- 자동 원인 분석
- 오류 통계 대시보드
- AI 기반 장애 예측
- 모든 예외는 공통 예외 처리기를 통해 처리한다.
- 사용자 표시와 내부 오류 코드를 분리한다.
- 치명적 오류는 데이터 무결성을 우선 보호한다.
반영 원칙 본 문서는 오류 코드 및 예외 처리 표준을 신규 정의한 설계

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_03.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:18 | 분류: MASTER_SPEC]
2. 데이터 계층 ① OpenAPI 실시간 수신 ② 이벤트 수집기 ③ 데이터 정규화 ④
 실시간 캐시 ⑤ 이벤트 브로커 ⑥ 엔진 전달 ⑦ UI 반영
3. 수집 대상
- 현재가
- 호가
- 거래량
- 장상태
- 계좌 이벤트
- 주문 이벤트
4. 실시간 캐시

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_03.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:18 | 분류: MASTER_SPEC]
- 프로그램 비정상 종료
- OpenAPI 연결 해제
- 주문 응답 누락
- 실시간 데이터 중단
- 내부 예외

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_03.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:18 | 분류: MASTER_SPEC]
- 정기 상태 점검
- 시간 정책 자동 재판정
- 실시간 연결 감시
- 이상 징후 자동 탐지
- 운영 알림 생성
7. 검토관리 연계 다음 경우 자동 복구를 중단하고 검토관리로 전환한다.
- 데이터 불일치 지속
- 반복 장애
- 수동 확인 필요
8. 향후 확장
- 다중 서버 감시
- 이중화 환경
- 원격 모니터링
- 자동 장애 리포트
- 복구보다 데이터 무결성을 우선한다.
- 복구 과정은 모두 로그로 기록한다.
- 운영 재개 전 반드시 무결성 검사를 완료한다.
반영 원칙 본 문서는 장애 복구 및 운영 자동화 아키텍처를 신규 정의한 설계

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_03.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:18 | 분류: MASTER_SPEC]
MASTER_SPEC 누락보강 119 주제 : 설정(Profile) 관리 및 운영 환경 전환
시스템 (신규)
※ 본 문서는 기존 01~118과 중복되지 않는 설정(Profile) 관리 체계를 신규

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_03.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:18 | 분류: MASTER_SPEC]
1. 목적 프로그램 시작부터 종료까지 모든 구성 정보를 일관성 있게
 관리하고, 환경 변화에도 안정적으로 초기화할 수 있는 구조를 정의한다.
- 프로그램 전역 설정
- 운영환경 설정
- UI 설정
- 로그 설정
- Runtime 설정

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_136_데이터검증_Validation프레임워크_신규.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:51:34 | 분류: 구현로그/검증보고]
2. 검증 대상
- 설정 데이터
- Runtime 데이터
- OpenAPI 수신 데이터
- 주문 데이터
- 체결 데이터
- JSON 파일
- Profile 정보

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_135_오류코드_예외처리표준_신규.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:51:30 | 분류: MASTER_SPEC]
2. 오류 분류
- System Error
- Configuration Error
- Runtime Error
- OpenAPI Error
- Network Error
- Order Error
- Execution Error
- Validation Error
- Unknown Error

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_135_오류코드_예외처리표준_신규.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:51:30 | 분류: MASTER_SPEC]
6. 자동 복구 대상
- 일시적 네트워크 오류
- OpenAPI 재연결
- Runtime 파일 재로드
- Queue 재처리
- 설정 재검증
7. 복구 불가 대상
- 데이터 무결성 손상
- 반복 치명 오류
- 설정 호환성 실패
- 참조 구조 손상

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_132_Thread관리_동시성아키텍처_신규.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:51:14 | 분류: MASTER_SPEC]
1. 목적
여러 작업이 동시에 수행되는 환경에서 데이터 무결성과 운영 안정성을 유지하기
위한 Thread 관리 체계를 정의한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_132_Thread관리_동시성아키텍처_신규.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:51:14 | 분류: MASTER_SPEC]
2. Thread 구성
- Main(UI) Thread
- OpenAPI Event Thread
- Scheduler Thread
- Runtime 저장 Thread
- 로그 처리 Thread
- 백업 Thread

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_132_Thread관리_동시성아키텍처_신규.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:51:14 | 분류: MASTER_SPEC]
8. 성능 관리
- Thread 수 모니터링
- Queue 적체 감시
- 평균 처리시간 측정
- 병목 구간 분석
9. 향후 확장
- Thread Pool
- Process Pool
- 비동기 I/O
- 분산 실행 환경

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_131_Configuration관리_시스템초기화아키텍처_신규.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:51:02 | 분류: MASTER_SPEC]
1. 목적
프로그램 시작부터 종료까지 모든 구성 정보를 일관성 있게 관리하고,
환경 변화에도 안정적으로 초기화할 수 있는 구조를 정의한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_131_Configuration관리_시스템초기화아키텍처_신규.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:51:02 | 분류: MASTER_SPEC]
2. 관리 대상
- 프로그램 전역 설정
- 운영환경 설정
- 루틴 설정
- 종목 설정
- UI 설정
- 로그 설정
- Runtime 설정

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_131_Configuration관리_시스템초기화아키텍처_신규.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:51:02 | 분류: MASTER_SPEC]
3. 초기화 단계
① 환경 확인
② 설정 로드
③ 버전 확인
④ 무결성 검사
⑤ 기본값 보완
⑥ 모듈 초기화
⑦ 운영 준비 완료

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_131_Configuration관리_시스템초기화아키텍처_신규.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:51:02 | 분류: MASTER_SPEC]
6. 변경 정책
- 변경 이력 기록
- 즉시 반영 가능 항목과 재시작 필요 항목 구분
- 실패 시 이전 설정 복원
7. 장애 대응
- 기본 설정 자동 생성
- 손상 설정 격리
- 백업 설정 복원
- 초기화 실패 로그 기록
8. 향후 확장
- 환경별 설정 템플릿
- 원격 설정 동기화
- 설정 비교 기능
- 자동 마이그레이션

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_124_프로젝트성능_안정성_모니터링아키텍처_신규.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:50:14 | 분류: MASTER_SPEC]
2. 모니터링 대상
- CPU 사용률
- 메모리 사용량
- OpenAPI 연결 상태
- 실시간 데이터 수신률
- 이벤트 큐 길이
- 주문 처리량
- 체결 처리량
- 로그 발생량

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_121_초기운영정책_ATS_검토관리확정이력_신규.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:49:58 | 분류: 운영정책]
7. 데이터 무결성
- 내부 상태와 OpenAPI 정보를 비교한다.
- 불일치가 해소되지 않으면 자동 운영을 중단한다.
- 검토 완료 후에만 복귀를 허용한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_120_플러그인루틴SDK_개발자확장규격_신규.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:39:28 | 분류: MASTER_SPEC]
6. 호환성 정책
- SDK 버전 명시
- 최소 엔진 버전 명시
- 비호환 기능 차단
- Deprecated API 관리
7. 개발자 지원
- 샘플 루틴
- Mock 환경
- 테스트 도구
- 디버그 로그
- 문서 템플릿

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_119_Profile관리_운영환경전환시스템_신규.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:39:24 | 분류: 운영정책]
1. 목적
운영 환경을 안전하게 전환하고 다양한 설정 조합을 Profile 단위로 관리하기 위한
표준 구조를 정의한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_118_로그저장소_분석아키텍처_신규.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:39:18 | 분류: 구현로그/검증보고]
3. 로그 분류
- 시스템 로그
- 운영 로그
- 루틴 로그
- PLAN 로그
- 주문 로그
- 체결 로그
- OpenAPI 로그
- 오류 로그
- 복구 로그

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_117_다중루틴_스케줄링_실행우선순위엔진_신규.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:39:14 | 분류: MASTER_SPEC]
1. 목적
복수의 자동매매 루틴이 동시에 동작하는 환경에서 실행 순서와 자원 배분을
일관성 있게 관리하기 위한 스케줄링 엔진을 정의한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_115_장애복구_운영자동화아키텍처_신규.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:39:06 | 분류: 운영정책]
2. 복구 대상
- 프로그램 비정상 종료
- OpenAPI 연결 해제
- 주문 응답 누락
- 체결 불일치
- 실시간 데이터 중단
- 내부 예외

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_115_장애복구_운영자동화아키텍처_신규.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:39:06 | 분류: 운영정책]
7. 검토관리 연계
다음 경우 자동 복구를 중단하고 검토관리로 전환한다.
- 복구 실패
- 데이터 불일치 지속
- 반복 장애
- 수동 확인 필요
8. 향후 확장
- 다중 서버 감시
- 이중화 환경
- 원격 모니터링
- 자동 장애 리포트

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_114_실시간데이터수집_캐시_동기화아키텍처_신규.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:39:00 | 분류: MASTER_SPEC]
2. 데이터 계층
① OpenAPI 실시간 수신
② 이벤트 수집기
③ 데이터 정규화
④ 실시간 캐시
⑤ 이벤트 브로커
⑥ 엔진 전달
⑦ UI 반영
3. 수집 대상
- 현재가
- 호가
- 체결
- 거래량
- 장상태
- 계좌 이벤트
- 주문 이벤트

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_111_OpenAPI연동_실시간처리아키텍처_신규.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:35:06 | 분류: MASTER_SPEC]
MASTER_SPEC 누락보강 111
주제 : 키움 OpenAPI 연동 및 실시간 처리 아키텍처 (신규)

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_111_OpenAPI연동_실시간처리아키텍처_신규.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:35:06 | 분류: MASTER_SPEC]
※ 본 문서는 기존 01~110의 재통합이 아니라, 아직 독립적으로 정리되지 않은
OpenAPI 연동 영역을 신규 설계 문서 형태로 작성한 것이다.
1. 목적
키움 OpenAPI와 프로젝트 내부 엔진을 연결하는 구조를 표준화한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_111_OpenAPI연동_실시간처리아키텍처_신규.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:35:06 | 분류: MASTER_SPEC]
2. OpenAPI 계층
- 로그인 관리자
- 서버 상태 관리자
- 계좌 관리자
- 실시간 등록 관리자
- TR 관리자
- 주문 관리자
- 체결 관리자

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_111_OpenAPI연동_실시간처리아키텍처_신규.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:35:06 | 분류: MASTER_SPEC]
8. 이벤트 브로커
OpenAPI 이벤트를 직접 루틴으로 전달하지 않고
공통 이벤트 브로커를 통해
PLAN 엔진 → 운영엔진 → UI로 전달한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_90_히스토리기반_PLAN중심_자동매매프레임워크_최종운영검증기준.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:22:54 | 분류: 구현로그/검증보고]
1. 목적
PLAN 중심 자동매매 프레임워크가 실제 운영 환경에서도 설계 의도와 동일하게
동작하는지 확인하기 위한 최종 운영 검증 기준을 정의한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_88_히스토리기반_PLAN중심_자동매매프레임워크_운영표준.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:22:32 | 분류: 운영정책]
1. 목적
PLAN 중심 자동매매 프레임워크를 실제 운영 환경에서 일관되게 적용하기 위한
운영 표준을 정의한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_40_OpenAPI연계절차_운영전환정책.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:50:22 | 분류: 운영정책]
MASTER_SPEC 누락보강 40
주제 : OpenAPI 연계 절차 및 운영 전환 정책

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_40_OpenAPI연계절차_운영전환정책.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:50:22 | 분류: 운영정책]
1. 목적
프로토타입 UI와 루틴 엔진을 실제 OpenAPI 환경으로 안전하게 연결하기 위한
운영 전환 절차와 정책을 정의한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_40_OpenAPI연계절차_운영전환정책.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:50:22 | 분류: 운영정책]
7. 장애 대응
- OpenAPI 연결 실패
- 주문 오류
- 체결 불일치
- 서버 상태 이상
- 재시작 복구
모든 상황은 공통 복구 정책을 따른다.

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_8.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-30 19:18:38 | 분류: 대화히스토리]
검증:
- python -m py_compile gui_macd_sell_controls.py 통과
- QTimer, singleShot, _sell_complete_policy_sync_timer, _sync_all_sell_complete_policy_results 잔여 검색 결과 없음
- 오프스크린 PyQt 검증으로 구성 탭/두 번째 생성 UI/edit 탭에서 완료정책 체크 변경, 시간조건 콤보 변경, 표시 전환 동작 확인했습니다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART29_1차본_29.1-29.10.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:42:50 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
29.6 운영 검증
실운영 환경에서 정책 일치 여부를 확인한다.

[출처: STEP41D_구성화면_중복제목_흰색박스제거_수정보고_v2026-06-19.txt | 기준일: 2026-06-19 | 수정시각: 2026-06-19 16:42:11 | 분류: 구현로그/검증보고]
수정 목적:
- 사용자가 표시한 빨간 영역의 불필요한 BUY/매수설정 중복 제목 제거
- 구성 화면의 텍스트 박스 흰색 배경 제거
- 환경설정 화면처럼 회색 배경 위에 자연스럽게 항목이 놓이는 방향으로 수정

[출처: kiwoom_auto_43_분석보고_v2026-06-19.txt | 기준일: 2026-06-19 | 수정시각: 2026-06-19 08:14:11 | 분류: 구현로그/검증보고]
kiwoom_auto_43_분석보고_v2026-06-19
분석 대상:
- kiwoom_auto (43).zip

[출처: kiwoom_auto_43_분석보고_v2026-06-19.txt | 기준일: 2026-06-19 | 수정시각: 2026-06-19 08:14:11 | 분류: 구현로그/검증보고]
분석 목적:
- 현재 압축본 기준 STEP23~STEP35 산출물 적용 상태 확인
- PyQt5 관련 검증 가능/불가능 범위 확인
- 다음 작업 판단

[출처: kiwoom_auto_43_분석보고_v2026-06-19.txt | 기준일: 2026-06-19 | 수정시각: 2026-06-19 08:14:11 | 분류: 구현로그/검증보고]
판정:
- STEP29 다이얼로그 파일은 현재 압축본에 이미 들어가 있음.
- 단, 실제 GUI 실행 검증은 이 환경에서 PyQt5 부재로 수행하지 못함.

[출처: kiwoom_auto_43_분석보고_v2026-06-19.txt | 기준일: 2026-06-19 | 수정시각: 2026-06-19 08:14:11 | 분류: 구현로그/검증보고]
이 환경에서 실행 결과:
- PyQt5 미설치로 실행 불가.
- ModuleNotFoundError: No module named 'PyQt5'

[출처: kiwoom_auto_43_분석보고_v2026-06-19.txt | 기준일: 2026-06-19 | 수정시각: 2026-06-19 08:14:11 | 분류: 구현로그/검증보고]
중요:
- 이는 사용자의 PC 문제가 아니라 현재 분석 환경의 문제.
- 사용자의 PC에는 이전 확인 기준 PyQt5 5.15.11 / PyQt5-Qt5 5.15.2가 설치되어 있었음.
- 따라서 실제 GUI 테스트는 사용자 PC에서 해야 함.

[출처: kiwoom_auto_43_분석보고_v2026-06-19.txt | 기준일: 2026-06-19 | 수정시각: 2026-06-19 08:14:11 | 분류: 구현로그/검증보고]
------------------------------------------------------------
9. 다음 작업 판단
------------------------------------------------------------
현재 바로 추가 구현을 진행하면 안 됨.

[출처: kiwoom_auto_43_분석보고_v2026-06-19.txt | 기준일: 2026-06-19 | 수정시각: 2026-06-19 08:14:11 | 분류: 구현로그/검증보고]
2. STEP31 후보를 실제 적용할지 결정
 - 적용 시 gui_routine_assign_window.py 백업 필수
 - 후보 파일을 gui_routine_assign_window.py로 교체

[출처: kiwoom_auto_43_분석보고_v2026-06-19.txt | 기준일: 2026-06-19 | 수정시각: 2026-06-19 08:14:11 | 분류: 구현로그/검증보고]
------------------------------------------------------------
10. 가장 안전한 선택지
------------------------------------------------------------

[출처: kiwoom_auto_43_분석보고_v2026-06-19.txt | 기준일: 2026-06-19 | 수정시각: 2026-06-19 08:14:11 | 분류: 구현로그/검증보고]
선택지 B:
- STEP31 후보 적용 후 STEP32까지 진행
- 루틴지정창에 버튼 연결 확인 가능
- 백업 필수

[출처: kiwoom_auto_43_분석보고_v2026-06-19.txt | 기준일: 2026-06-19 | 수정시각: 2026-06-19 08:14:11 | 분류: 구현로그/검증보고]
------------------------------------------------------------
12. 최종 결론
------------------------------------------------------------
kiwoom_auto (43).zip 기준 결론:

[출처: kiwoom_auto_43_분석보고_v2026-06-19.txt | 기준일: 2026-06-19 | 수정시각: 2026-06-19 08:14:11 | 분류: 구현로그/검증보고]
- STEP23은 적용 및 테스트 가능 상태다.
- STEP29 다이얼로그 파일은 이미 프로젝트에 들어가 있다.
- STEP31 루틴지정창 연결은 아직 실제 파일에는 적용되지 않았고 후보 파일로만 존재한다.
- 현재 추가 구현보다 사용자 PC에서 PyQt5 기반 STEP30 독립 테스트가 우선이다.
- STEP30 통과 후 STEP31 후보 적용 여부를 결정하는 것이 가장 안전하다.

[출처: STEP36_최신프로젝트_GUI구조재검증_STEP29_STEP35_적용가능성판정_v2026-06-19.txt | 기준일: 2026-06-19 | 수정시각: 2026-06-19 07:59:56 | 분류: 구현로그/검증보고]
------------------------------------------------------------
1. 검증 대상
------------------------------------------------------------
기준 압축본:
- kiwoom_auto (42)(1).zip

[출처: STEP36_최신프로젝트_GUI구조재검증_STEP29_STEP35_적용가능성판정_v2026-06-19.txt | 기준일: 2026-06-19 | 수정시각: 2026-06-19 07:59:56 | 분류: 구현로그/검증보고]
제한:
- 현재 실행 환경에는 PyQt5가 없어 실제 창 표시 테스트는 수행하지 못했다.
- 사용자 Windows 프로젝트에는 PyQt5가 있으므로 사용자 환경에서 실행 검증 필요.

[출처: STEP36_최신프로젝트_GUI구조재검증_STEP29_STEP35_적용가능성판정_v2026-06-19.txt | 기준일: 2026-06-19 | 수정시각: 2026-06-19 07:59:56 | 분류: 구현로그/검증보고]
------------------------------------------------------------
8. 실제 실행 검증 미완료 사유
------------------------------------------------------------
컨테이너 환경에서 PyQt5 모듈이 없어 다음 테스트는 실제 실행하지 못했다.
실행 실패 사유:
- ModuleNotFoundError: No module named 'PyQt5'

[출처: STEP36_최신프로젝트_GUI구조재검증_STEP29_STEP35_적용가능성판정_v2026-06-19.txt | 기준일: 2026-06-19 | 수정시각: 2026-06-19 07:59:56 | 분류: 구현로그/검증보고]
재검증 결과:
- 우려는 타당했으나, 실제 최신 gui_routine_assign_window.py에는 STEP31이 기대한 핵심 구조가 존재한다.
- 따라서 STEP31 후보 자체는 완전히 가상 구조에 만든 것은 아니다.
- 다만 실제 PyQt 실행 검증은 아직 사용자 환경에서 필요하다.

[출처: STEP36_최신프로젝트_GUI구조재검증_STEP29_STEP35_적용가능성판정_v2026-06-19.txt | 기준일: 2026-06-19 | 수정시각: 2026-06-19 07:59:56 | 분류: 구현로그/검증보고]
현재 정적 검증 기준:
- STEP29 파일: 수정 없이 테스트 가능
- STEP31 후보: 수정 없이 테스트 가능
- STEP30 테스트: PyQt 환경에서 테스트 필요
- STEP32 테스트: PyQt 환경에서 테스트 필요
- STEP34/STEP35 스크립트: 사용 가능하나, 적용 전 백업 확인 필수

[출처: STEP32_루틴지정창_MACD설정버튼_연결후보검증파일_생성보고_v2026-06-19.txt | 기준일: 2026-06-19 | 수정시각: 2026-06-19 07:47:06 | 분류: 구현로그/검증보고]
------------------------------------------------------------
3. 실행 명령
------------------------------------------------------------
python test_routine_assign_window_step32.py

[출처: STEP28_GUI파일구조확인_MACD설정UI_부착위치판정_v2026-06-19.txt | 기준일: 2026-06-19 | 수정시각: 2026-06-19 07:33:10 | 분류: 구현로그/검증보고]
------------------------------------------------------------
1. 확인 대상
------------------------------------------------------------
확인 기준 압축본:
- kiwoom_auto (42)(1).zip

[출처: STEP23_profit_rate_sell_signal_logic_검증보고_실행통과본.txt | 기준일: 2026-06-19 | 수정시각: 2026-06-19 07:16:18 | 분류: 구현로그/검증보고]
작성 기준:
- 사용자 로컬 실행 결과 기준
- 실행 위치: C:\Users\JIN KWANG CHUL\Documents\kiwoom_auto
- 실행 명령: python test_sell_profit_rate_signal_logic_step23.py
- 결과: 통과

[출처: STEP23_profit_rate_sell_signal_logic_검증보고.txt | 기준일: 2026-06-19 | 수정시각: 2026-06-19 06:59:00 | 분류: 구현로그/검증보고]
검증:
- python3 -m py_compile 통과
- python3 test_sell_profit_rate_signal_logic_step23.py 통과

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_6.txt | 기준일: 2026-06-18 | 수정시각: 2026-06-22 15:39:42 | 분류: 대화히스토리]
kiwoom_auto/test_sell_signals_structure_step22.py
파일:
test_sell_signals_structure_step22.py
실행:
python test_sell_signals_structure_step22.py

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_6.txt | 기준일: 2026-06-18 | 수정시각: 2026-06-22 15:39:42 | 분류: 대화히스토리]
PS C:\Users\JIN KWANG CHUL\Documents\kiwoom_auto> python test_sell_signals_structure_step22.py
[rules.json path]
C:\Users\JIN KWANG CHUL\Documents\kiwoom_auto\routines\MACD매매루틴\rules.json
[루틴 결과]
{'signal': 'SELL', 'reason': '매도조건 충족', 'matched_groups': ['STEP22_SELL_SIGNALS_MACD_FORCE'], 'details': ['PASS CLOSE > 0.0'], 'signal_index': 5, 'delay_bar': 0, 'routine': 'MACD매매루틴', 'execution_enabled': False, 'engine': 'engines.macd_signal_engine'}
[OK] STEP22 sell.signals.macd_sell 구조 검증 통과
[복구] rules.json 원본 복구 완료
PS C:\Users\JIN KWANG CHUL\Documents\kiwoom_auto>
통과.
현재 확정:
sell.signals.macd_sell 구조 정상
기존 테스트 정상
rules.json 원본 복구 정상
SELL 강제 검증 성공
코드 변경 범위 안정
현재 완료 단계:

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_6.txt | 기준일: 2026-06-18 | 수정시각: 2026-06-22 15:39:42 | 분류: 대화히스토리]
image(800).png
image(801).png
내 의도와는 많잉 다르네..일단 너도 확인해보고 법전이라는 문구는 설명을 쉽게 하기 위한 방편이지 정식 용어로 쓰기에는 맞지 않다
진입 페이지 구성이 대략 이렇게
kiwoom_auto (44).zip
ZIP 아카이브
네가 찾아봐
창자체를 옆으로 넓여봐...그리고 매수/매도 탭은 안쓰기로 했지 안ㄶ나?

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_6.txt | 기준일: 2026-06-18 | 수정시각: 2026-06-22 15:39:42 | 분류: 대화히스토리]
PS C:\Users\JIN KWANG CHUL\Documents\kiwoom_auto> copy gui_macd_routine_settings_dialog_STEP41D_no_white_box.py gui_macd_routine_settings_dialog.py
>> python test_macd_settings_dialog_step41d_no_white_box.py
Traceback (most recent call last):
 File "C:\Users\JIN KWANG CHUL\Documents\kiwoom_auto\test_macd_settings_dialog_step41d_no_white_box.py", line 12, in <module>
 from gui_macd_routine_settings_dialog import MacdRoutineSettingsDialog
 File "C:\Users\JIN KWANG CHUL\Documents\kiwoom_auto\gui_macd_routine_settings_dialog.py", line 283
 ) def _readonly_line(self):
 ^^^
SyntaxError: invalid syntax
PS C:\Users\JIN KWANG CHUL\Documents\kiwoom_auto> & "C:\Users\JIN KWANG CHUL\AppData\Local\Programs\Python\Python311-32\python.exe" "c:/Users/JIN KWANG CHUL/Documents/kiwoom_auto/gui_main.py"
PS C:\Users\JIN KWANG CHUL\Documents\kiwoom_auto>

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_6.txt | 기준일: 2026-06-18 | 수정시각: 2026-06-22 15:39:42 | 분류: 대화히스토리]
image(809).png
image(810).png
빨간 부분들은 제목이니까 강조, 녹색부분은 너무 많이 자리 차지 하니까 "루틴 [활성] | " 이런 형식으로 수정 여기서 활성은 네모 박스에 넣어서 두번째 이미지 유사하게....근데 이 항목이 필요해? 이건 뭘 위해서 넣은건가?
루틴 상태도 모두 삭제해. 루틴이 활성이나 수익율 매도 같은거도 그렇고 의미없는 걸 왜 넣어 놨나?
kiwoom_auto (46).zip
ZIP 아카이브
없으면 바로 달라고 해.
gui_macd_routine_settings_dialog.py
Python
gui_macd_routine_settings_dialog.py
Python
kiwoom_auto (47).zip
ZIP 아카이브

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_6.txt | 기준일: 2026-06-18 | 수정시각: 2026-06-22 15:39:42 | 분류: 대화히스토리]
참 말이 안나오네.....빨간영역에 왜????체크박스 진짜를 넣으라고 이건 더미도 아니고 문자로 넣으면 ???
kiwoom_auto (48).zip
ZIP 아카이브
체크박스 이거 지짜야??

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_6.txt | 기준일: 2026-06-18 | 수정시각: 2026-06-22 15:39:42 | 분류: 대화히스토리]
이건 나의 실수인가???고정 문구들은 그냥 그대로 두고 설정칸의 폰트크기를 1~2싸이즈 크게 해주라고....다시 수정해줘...고정문구는 이전 사이즈로 복원 옵션으로 들어가는 폰트는 고정폰트보다 2 크게 해줘봐..보고 정하자
kiwoom_auto (49).zip
ZIP 아카이브

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_6.txt | 기준일: 2026-06-18 | 수정시각: 2026-06-22 15:39:42 | 분류: 대화히스토리]
아직도 좀더 크다..이렇게 고정문구와 입력사항이 폰트 크기 구분이 안되고 같이 쓸거면 메수설정 이라는 제목을 좀 키우고 뒤에 설정사항의 문구를 줄여야 하지
???이게 뭐지?
조정이 안돼...제대로 해봐...안바뀌잔아
아직 안어울린다. 매수 설정이 너무 크니까 2 포인트 줄이고 뒤에 입력설정 폰트도 2포인트 줄여줘
kiwoom_auto (50).zip
ZIP 아카이브
매수설정은 몇포인드? 메인신호는 몇포인드? 설정입력은 몇포인트?
너 왜이래??? 설정 입력칸을 줄여 주라니까 고정문구를 줄여?
입력항목 칸을 1포인트만 더 줄여보자
kiwoom_auto (51).zip
ZIP 아카이브
이거 줄인거 맞나?
image(827).png
다 왔다....포인트만 더 줄여보자...

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_6.txt | 기준일: 2026-06-18 | 수정시각: 2026-06-22 15:39:42 | 분류: 대화히스토리]
kiwoom_auto (53).zip
ZIP 아카이브
내용을 하나도 빠짐없이 파악해서 마지막 진행했던 작업을 이어서하자
지금부터 소항목 들 설정 모양을 잡아가자...
이 부분도 설정 항목들을 더미로 형태를 만들어 놔야 하는데? 가능해?

[출처: STEP13_실제주문_안전요구사항_v2026-06-18_HOLD오염제거_복구본.txt | 기준일: 2026-06-18 | 수정시각: 2026-06-18 17:58:53 | 분류: 구현로그/검증보고]
kiwoom_auto/
- real_order_executor.py
- kiwoom_order_adapter.py
- order_execution_log_reader.py
역할 분리:

[출처: STEP13_실제주문_안전요구사항_v2026-06-18_HOLD오염제거_복구본.txt | 기준일: 2026-06-18 | 수정시각: 2026-06-18 17:58:53 | 분류: 구현로그/검증보고]
1) real_order_executor.py
- EXECUTABLE 주문을 읽는다.
- 실제 주문 요청 가능 여부를 최종 확인한다.
- 아직 직접 Kiwoom API를 알 필요는 없다.
- Kiwoom Adapter에 넘기기 전 마지막 사전검사 계층이다.

[출처: STEP13_실제주문_안전요구사항_v2026-06-18_HOLD오염제거_복구본.txt | 기준일: 2026-06-18 | 수정시각: 2026-06-18 17:58:53 | 분류: 구현로그/검증보고]
2) kiwoom_order_adapter.py
- Kiwoom OpenAPI 주문 함수와 직접 연결되는 어댑터다.
- SendOrder 호출은 이 파일로 격리한다.
- 루틴 또는 주문후보 생성기가 SendOrder를 직접 호출하면 안 된다.

[출처: STEP13_실제주문_안전요구사항_v2026-06-18_HOLD오염제거_복구본.txt | 기준일: 2026-06-18 | 수정시각: 2026-06-18 17:58:53 | 분류: 구현로그/검증보고]
- 긴급정지 활성
- 키움 로그인 안 됨
- 계좌 미선택
- 실거래 허용 플래그 꺼짐
- 장 상태 불명
- 서버/프로그램 상태 불일치
- 안정성검사 미통과
- 운영정책 게이트 미통과
- 실계좌/Mock 데이터 혼재 의심
- 복구 기준본 불명확
- 사용자 승인 없음
6.2 종목 차단

[출처: STEP13_실제주문_안전요구사항_v2026-06-18_HOLD오염제거_복구본.txt | 기준일: 2026-06-18 | 수정시각: 2026-06-18 17:58:53 | 분류: 구현로그/검증보고]
------------------------------------------------------------
9. Kiwoom SendOrder 연결 전 필요한 값
------------------------------------------------------------
실제 SendOrder를 호출하려면 최소한 아래 값들이 확정되어야 한다.

[출처: STEP13_실제주문_안전요구사항_v2026-06-18_HOLD오염제거_복구본.txt | 기준일: 2026-06-18 | 수정시각: 2026-06-18 17:58:53 | 분류: 구현로그/검증보고]
- EXECUTABLE 주문을 읽는다.
- 실주문 가능 여부를 검사한다.
- 조건이 맞으면 REAL_READY로 변경한다.
- 조건이 부족하면 REAL_FAILED 또는 BLOCKED_REAL로 둔다.
- Kiwoom API 호출 없음.
10.3 STEP13-B 실주문 모드 플래그 파일
예:
runtime/real_trade_guard.json

[출처: STEP13_실제주문_안전요구사항_v2026-06-18_HOLD오염제거_복구본.txt | 기준일: 2026-06-18 | 수정시각: 2026-06-18 17:58:53 | 분류: 구현로그/검증보고]
{
 "real_trade_enabled": false,
 "account_selected": false,
 "kiwoom_logged_in": false,
 "operator_confirmed": false
}
기본값은 무조건 false.
10.4 STEP13-C kiwoom_order_adapter.py 스텁
역할:

[출처: 마스터스펙_갱신자료_STEP44\02_MACD루틴구현진행결과보고서_v2026-06-18.txt | 기준일: 2026-06-18 | 수정시각: 2026-06-18 14:02:10 | 분류: 갱신문서]
미구현 - 실제 Kiwoom SendOrder - 실제 OnReceiveChejanData - 실계좌
잔고동기화 - 미체결 관리 - 정정/취소 주문 - 실주문 주문번호 추적 -
관제창 실시간 연동
총평 주문엔진 Mock 검증 단계 완료. 다음 단계는 Kiwoom OpenAPI 실연동.

[출처: 마스터스펙_갱신자료_STEP44\01_작업재개요약서_v2026-06-18.txt | 기준일: 2026-06-18 | 수정시각: 2026-06-18 14:02:00 | 분류: 작업재개요약]
현재 상태 - 실제 주문 없음 - 실제 체결 없음 - Kiwoom SendOrder 호출
없음 - execution_enabled 기본 False

[출처: 마스터스펙_갱신자료_STEP44\01_작업재개요약서_v2026-06-18.txt | 기준일: 2026-06-18 | 수정시각: 2026-06-18 14:02:00 | 분류: 작업재개요약]
다음 작업 후보 1. 실제 Kiwoom Adapter 연결 2. 실제
체결통보(OnReceiveChejanData) 3. 실계좌 잔고동기화 4. 정정/취소 주문 5.
관제창 실시간 연동
결론 주문엔진 Mock 검증 단계 완료. 다음 단계는 Kiwoom OpenAPI 실연동
계층 구현.

[출처: 마스터스펙_갱신자료_STEP44\작업진행상황대화히스토리_5.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-18 17:43:02 | 분류: 대화히스토리]
cleanup_after_stock_migration_dry_run_20260616_065222.txt
문서
PS C:\Users\JIN KWANG CHUL\Documents\kiwoom_auto> & "C:\Users\JIN KWANG CHUL\AppData\Local\Programs\Python\Python311-32\python.exe" "c:/Users/JIN KWANG CHUL/Documents/kiwoom_auto/cleanup_after_stock_migration.py"
======================================================================
중앙 stocks 통합 후 정리 도구 실행 보고서
======================================================================
모드: DRY-RUN
프로젝트 루트: C:\Users\JIN KWANG CHUL\Documents\kiwoom_auto
백업 예정 위치: C:\Users\JIN KWANG CHUL\Documents\kiwoom_auto\cleanup_backup_20260616_065222
보관 이동 위치: C:\Users\JIN KWANG CHUL\Documents\kiwoom_auto\old_migration_tools

[출처: 마스터스펙_갱신자료_STEP44\작업진행상황대화히스토리_5.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-18 17:43:02 | 분류: 대화히스토리]
[보고서 생성] C:\Users\JIN KWANG CHUL\Documents\kiwoom_auto\cleanup_after_stock_migration_dry_run_20260616_065222.txt
PS C:\Users\JIN KWANG CHUL\Documents\kiwoom_auto>
image(773).png
image(774).png
image(775).png
image(776).png
루틴명에 따라 해당 종목이 보여지지는 않는다. ...
kiwoom_auto (37).zip
ZIP 아카이브
분석고고
kiwoom_auto (38).zip
ZIP 아카이브
확인해봐
image(778).png
image(779).png
kiwoom_auto (39).zip
ZIP 아카이브
직접 확인해봐
image(781).png
image(782).png
image(783).png
image(784).png
image(785).png
image(786).png
안정성 검사는 안돼

[출처: 마스터스펙_갱신자료_STEP44\작업진행상황대화히스토리_5.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-18 17:43:02 | 분류: 대화히스토리]
루틴신호
↓
주문후보 생성
↓
승인판정
↓
운영정책 차단기
↓
실주문 사전검사
↓
Kiwoom Adapter
↓
SendOrder
↓
체결
↓
보유반영
상태머신:

[출처: 05_운영정책_테스트체크리스트_v2026-06-16_종목폴더통합_검토관리_최신갱신.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-16 17:45:20 | 분류: 갱신문서]
[UX-05] 관제창 직접 클릭 수정
조건:
- 예산/비율/시간/정책/한도 표시 클릭.
예상:
- 별도 환경설정창 없이 인라인 또는 간단 편집으로 수정 가능.
- 수정 후 즉시 계산값 반영.

[출처: 03_작업재개요약서_v2026-06-16_종목폴더통합_검토관리_최신갱신\03_작업재개요약서_v2026-06-16_종목폴더통합_검토관리_최신갱신.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-16 17:45:02 | 분류: 작업재개요약]
옵션:
- 별도 시간 사용 가능.
- 관제창에서 시간 표시를 직접 클릭해 수정.
- 체크박스: 시간운영 설정값 사용.
5.7 관제창 철학
관제창은 계좌/자금/성과/위험 관제센터이다.
자동매매설정창은 종목 운영 설정센터이다.
관제창은 별도 환경설정창을 늘리지 않고, 직접 클릭 수정 구조를 지향한다.

[출처: 03_작업재개요약서_v2026-06-16_종목폴더통합_검토관리_최신갱신\03_작업재개요약서_v2026-06-16_종목폴더통합_검토관리_최신갱신.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-16 17:45:02 | 분류: 작업재개요약]
수익성:
- 빨강: 비용 포함 실질 손실.
- 노랑: 비용을 충분히 충당하지 못한 손익분기 근처.
- 녹색: 비용 포함 실질 순이익.
계산은 키움 서버 제공값 우선, 없으면 프로그램 자체 산식 사용.

[출처: 마스터스펙\02_MASTER_ADDENDUM_v2026-06-16_종목폴더통합_검토관리_최신확정.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-16 17:44:52 | 분류: 갱신문서]
관제창 방향:
- 별도 환경설정창 최소화.
- 직접 클릭 수정 최대화.
- 정보 전달이 핵심.
- 운영자가 자금 재배치 판단을 쉽게 할 수 있어야 한다.
- 대부분의 항목은 전체 적용.
- 개별 조정은 루틴/종목 행에서 직접 클릭.

[출처: 마스터스펙\02_MASTER_ADDENDUM_v2026-06-16_종목폴더통합_검토관리_최신확정.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-16 17:44:52 | 분류: 갱신문서]
수익성 신호등:
- 빨강: 세금/수수료/거래비용 반영 후 실질 손실.
- 노랑: 표면 수익이 있거나 손익분기 근처이나 제반비용을 충분히 충당하지 못함.
- 녹색: 제반비용 반영 후 명확한 순이익.
계산 우선순위:
1. 키움 서버가 제공하는 값이 있으면 우선 사용.
2. 없으면 프로그램 자체 산식 사용.

[출처: 마스터스펙\01_MASTER_SPEC_v2.3_2026-06-16_종목폴더통합_검토관리_최신갱신.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-16 17:44:44 | 분류: 갱신문서]
# MASTER_SPEC_v2.2_2026-06-13
# 키움 OpenAPI 자동매매 시스템 최신 통합 마스터 스펙

[출처: 마스터스펙\01_MASTER_SPEC_v2.3_2026-06-16_종목폴더통합_검토관리_최신갱신.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-16 17:44:44 | 분류: 갱신문서]
본 시스템은 키움 OpenAPI 기반 자동매매 시스템이지만, 최우선 목표는 수익 극대화가 아니라 운영 안정성과 운영자 판단 보조이다.

[출처: 마스터스펙\01_MASTER_SPEC_v2.3_2026-06-16_종목폴더통합_검토관리_최신갱신.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-16 17:44:44 | 분류: 갱신문서]
관제창은 별도 환경설정창을 늘리는 방향이 아니라, 화면에서 직접 클릭하여 수정할 수 있는 직관적 구조를 지향한다.
관제창의 성격:
- 정보 확인
- 즉시 개입
- 즉시 수정
- 자금 재배치 판단 보조
자동매매설정창이 설계실이라면, 메인 관제창은 운영실이다.
4.3 루틴
루틴은 신호 생성기이다.
담당 범위:
- 매수 조건
- 매도 조건
- 진입/이탈 타이밍 후보

[출처: 마스터스펙\01_MASTER_SPEC_v2.3_2026-06-16_종목폴더통합_검토관리_최신갱신.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-16 17:44:44 | 분류: 갱신문서]
2. 노랑
- 표면상 수익이 있거나 손익분기 근처이지만, 세금/수수료/거래비용을 충분히 충당하지 못하는 구간.
- 키움 서버가 관련 정보를 제공하면 서버값을 우선 사용.
- 제공하지 않으면 프로그램 자체 산식으로 계산.
3. 녹색
- 세금, 수수료, 기타 거래비용을 반영하고도 명확한 실질 순이익 구간.
종목 수익성:
- 해당 종목을 현재가 기준으로 전량 처분한다고 가정하고 계산한다.

[출처: 마스터스펙\01_MASTER_SPEC_v2.3_2026-06-16_종목폴더통합_검토관리_최신갱신.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-16 17:44:44 | 분류: 갱신문서]
============================================================
19. 관제창 자금운영 UI 정책
============================================================
19.1 기본 방향
관제창은 별도 환경설정창을 많이 만드는 방향이 아니다.
관제창은 직접 보고 직접 수정하는 방향으로 간다.

[출처: 마스터스펙\01_MASTER_SPEC_v2.3_2026-06-16_종목폴더통합_검토관리_최신갱신.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-16 17:44:44 | 분류: 갱신문서]
원칙:
- 환경설정창 최소화.
- 직접 클릭 수정 최대화.
- 대부분의 설정은 전체 적용 사항.
- 개별 조정은 루틴/종목 행에서 직접 클릭하여 수정.
- 설정값과 환산값을 병기.
19.2 상단 자금 패널

[출처: project_reference_analysis_report.txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 16:34:52 | 분류: 기타문서/자료]
[_등록확인폴더]
참조 파일 수: 1
- kiwoom_auto/gui_auto_trade_runtime.py

[출처: project_reference_analysis_report.txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 16:34:52 | 분류: 기타문서/자료]
[stock_migration_]
참조 파일 수: 2
- kiwoom_auto/stock_migration_to_central_stocks.py
- kiwoom_auto/registry_migratio/stock_migration_dry_run.py

[출처: project_reference_analysis_report.txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 16:34:52 | 분류: 기타문서/자료]
[registry_migration]
참조 파일 수: 1
- kiwoom_auto/registry_migratio/stock_migration_dry_run.py

[출처: project_reference_analysis_report.txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 16:34:52 | 분류: 기타문서/자료]
[gui_windows_149]
참조 파일 수: 1
- kiwoom_auto/gui_windows_149_manual_ats_status_policy_fix.py

[출처: kiwoom32_cleanup_analysis_report.txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 16:32:54 | 분류: 기타문서/자료]
kiwoom_auto (32) 종목폴더 통합 후 파일/흔적 정리 분석 보고서
================================================================================
분석 시각: 2026-06-15 10:17:24
분석 ZIP: kiwoom_auto (32).zip

[출처: kiwoom32_cleanup_analysis_report.txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 16:32:54 | 분류: 기타문서/자료]
A. 즉시 삭제 가능 후보(프로그램 실행과 무관, 재생성 가능)
- __pycache__/ : Python 캐시 폴더, 파일 59개
- system_error.log : 현재 0바이트면 삭제 가능

[출처: kiwoom32_cleanup_analysis_report.txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 16:32:54 | 분류: 기타문서/자료]
## gui_routine_policy.py
- L98: 루틴 해제는 종목 자체는 유지하고 기초종목.txt의 루틴명만 제거한다.
- L103: return False, "", ["기초종목.txt에서 종목을 찾지 못했습니다."]

[출처: README_적용내용(21).txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 15:13:20 | 분류: 기타문서/자료]
확인:
1. 파일 교체
2. python gui_main.py 실행
3. 종목등록설정창 열기
4. 안전한 미등록 종목 1개를 선택해 삭제 테스트
5. 목록에서 사라지고 archived_stocks/ 아래로 이동되는지 확인

[출처: README_적용내용(17).txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 13:39:42 | 분류: 기타문서/자료]
확인:
1. 세 파일 교체
2. python gui_main.py 실행
3. 수동등록창 열기 확인
4. 종목등록설정창 확인

[출처: README_적용내용(15).txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 12:52:32 | 분류: 기타문서/자료]
확인:
1. 파일 교체
2. python gui_main.py 실행
3. 종목등록설정창 제목 확인
4. 등록 루틴/운영상태 표시 확인
5. 루틴 해제/지정 후 표시 갱신 확인

[출처: README_적용내용(8).txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 09:40:12 | 분류: 기타문서/자료]
# 종목구조 개편 3차: 중앙 stocks/ 마이그레이션 도구
파일:
- stock_migration_to_central_stocks.py
저장 위치:
- 프로젝트 루트 `kiwoom_auto/` 안에 넣습니다.
기본 실행:
python stock_migration_to_central_stocks.py

[출처: README_적용내용(8).txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 09:40:12 | 분류: 기타문서/자료]
기본은 dry-run입니다.
- 파일 복사 없음
- stocks/ 생성 없음
- stock_migration_apply_report.txt 생성
- stock_migration_manifest.json 생성
실제 적용:
python stock_migration_to_central_stocks.py --apply

[출처: README_적용내용(4).txt | 기준일: 2026-06-14 | 수정시각: 2026-06-14 12:56:42 | 분류: 기타문서/자료]
1. order_executor.py 신규 생성
- 실제 키움 주문 실행은 하지 않음.
- DryRunOrderExecutor 제공.
- dry_run_order_executor 함수 제공.
- KiwoomOrderExecutor 자리는 만들었지만 실제 주문은 NotImplementedError로 막아둠.

[출처: README_적용내용.txt | 기준일: 2026-06-13 | 수정시각: 2026-06-13 15:20:30 | 분류: 기타문서/자료]
현재 한계:
- 실제 루틴 매수/매도 신호 엔진이 아직 구현되어 있지 않아 자동 호출되지는 않음.
- 키움 실연동 전에는 실제 주문 차단/허용 최종 검증 불가.

[출처: 갱신메모\04_프로젝트현재상태보고서_v2026-06-13.txt | 기준일: 2026-06-13 | 수정시각: 2026-06-13 09:15:42 | 분류: 갱신문서]
개념 정립: 완료.
정책 정립: 1차 완료.
구조개선: 사실상 완료.
운영정책 실전검증: 현재 단계.
키움 실연동 검증: 대기.

[출처: 마스터스펙\01_MASTER_SPEC_v2.1_2026-06-13.txt | 기준일: 2026-06-13 | 수정시각: 2026-06-13 09:15:20 | 분류: MASTER_SPEC]
# MASTER_SPEC_v2.1_2026-06-13
# 키움 OpenAPI 자동매매 시스템 최신 통합 마스터 스펙

[출처: 마스터스펙\01_MASTER_SPEC_v2.1_2026-06-13.txt | 기준일: 2026-06-13 | 수정시각: 2026-06-13 09:15:20 | 분류: MASTER_SPEC]
본 시스템은 키움 OpenAPI 기반 자동매매 시스템이지만, 최우선 목표는 수익 극대화가 아니라 운영 안전성이다.

[출처: 마스터스펙\01_MASTER_SPEC_v2.1_2026-06-13.txt | 기준일: 2026-06-13 | 수정시각: 2026-06-13 09:15:20 | 분류: MASTER_SPEC]
1. 개념 정립: 완료.
2. 정책 정립: 1차 완료. 단, 마감/청산 세부 정책은 지속 테스트 대상.
3. 구조개선: 1차 사실상 완료.
4. 운영정책 실전검증: 현재 단계.
5. 키움 OpenAPI 실연동 안정성 검증: 미진입 또는 대기 단계.

[출처: 마스터스펙\01_MASTER_SPEC_v2.1_2026-06-13.txt | 기준일: 2026-06-13 | 수정시각: 2026-06-13 09:15:20 | 분류: MASTER_SPEC]
5. 자동마감
- 환경설정/운영정책에 따라 일정 시점에 자동으로 운영 종료 절차를 수행하는 상태.
- 자동마감도 청산과 동일하지 않다.

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_4.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-15 23:01:24 | 분류: 대화히스토리]
MASTER_SPEC_v2.0_FULL_INTEGRATED_ARCHIVE_2026-06-11(1).txt
문서
MASTER_SPEC_v2.0_통합최종본_2026-06-11(1).txt
문서
MASTER_SPEC_v1.5_2026-06-11_통합갱신본(2).txt
문서
새창시작_즉시참조_v2026-06-11(1).txt
문서
작업진행상황대화히스토리_4_v2026-06-11(1).txt
문서
구조개선_남은작업_분석서_v2026-06-11(1).txt
문서
MASTER_ADDENDUM_v2026-06-11_구조개선_최신확정(2).txt
문서
작업재개요약서_v2026-06-11_구조개선_최신갱신(1).txt
문서
kiwoom_auto (9).zip
ZIP 아카이브
모든 문서를 빠짐없이 분석, 파악해봐
수정본 줄때 내가 확인 해봐야 할 사항도 같이 알려줘
이미 등록되어있는 종목과 비교 안하나?
이게 실제 등록작업을 다시 수행하는건지, 아니면 메세지만 이렇게 나오는건지 알려줘
gui_search_stock_register_dialog(3).py
Python
이제 좀 깔끔 해져다...이제 원래 하던거로 고고
이 우클릭 메뉴도 전체 선택 /미등록선택/ 선택 삭제/선택 해제/루틴 지정/ 루틴 해제 로 수정해줘
gui_windows(171).py
Python
분석
gui_windows(172).py
Python
다시 분석 고고
image(624).png
image(625).png
이게 뭐지?
gui_auto_trade_table_loader(1).py
Python
gui_windows(173).py
Python
분석 다시해
안돼..
gui_auto_trade_display(2).py
Python
gui_auto_trade_table_loader(3).py
Python
gui_main_emergency_ops(3).py
Python
gui_windows(176).py
Python
gui_schedule_window(8).py
Python
이거 왜이래

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_4.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-15 23:01:24 | 분류: 대화히스토리]
kiwoom_auto (10).zip
ZIP 아카이브
이거 하나도 빠짐없이 파악하고 다시 분석해서 수정본 파일 다시 만들어줘
이게 뭐야? 하이닉스가왜 빨강?
이건 뭔가?
image(635).png
image(636).png
조기/자동마감에서 이월이면 청산은 실행하면 안돼
gui_auto_trade_policy(2).py
Python
image(639).png
image(640).png
gui_auto_trade_close.py
Python
맞나?
image(642).png
image(643).png
조기 마감이 이월이면 청산 비활성화
image(644).png
image(646).png
내가 봐서는 정상
image(649).png
image(650).png
image(651).png
image(652).png

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_4.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-15 23:01:24 | 분류: 대화히스토리]
gui_auto_trade_table_loader(4).py
Python
정렬 이후 그냥 놔두면 수정중에 정렬룰에 어긋나도 그상태로 보전. 이게 안되나?
kiwoom_auto (11).zip
ZIP 아카이브
다 찾아서 분석해봐
gui_auto_trade_setting_window(7).py
Python
gui_auto_trade_table_loader(5).py
Python
gui_auto_trade_table_loader(6).py
Python
세부 기능들은 다 확인 못하고 몇가지 창 열어서 아직 문제 없음 확인
kiwoom_auto (12).zip
ZIP 아카이브
이 안에서 차아봐
image(657).png
image(658).png
뭘 보여줘야 할지..
일단 실행
확인
좋습니다.
현재 판정은:
프로그램 실행 정상
메인창 정상
자동매매설정창 정상
검토관리 정상
매매루틴지정창 정상
ImportError 해결
여기까지는 확인됐습니다.
즉 방금 한
gui_base_stock_service.py 분리
작업은 일단 성공으로 보입니다.
현재 구조개선 진행률은 체감상:
95% 이상
입니다.
남은 건 이제
구조개선
↓
실사용 테스트
↓
버그 수정
단계에 가까워졌습니다.
그리고 솔직히 지금 시점에서 가장 가치 있는 건 또 파일 쪼개기가 아닙니다.
최근 며칠 동안 발견된 버그가 전부:
정렬
조기마감
자동마감
이월
검토관리
재시작
긴급정지
같은 운영 정책 쪽에서 나왔습니다.
그래서 다음 추천은:
실전 시나리오 점검
예를 들면

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_4.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-15 23:01:24 | 분류: 대화히스토리]
1차 확인 결과, TXT 문서들은 모두 UTF-8로 정상 판독됐고 ZIP 내부에는 총 811개 항목, Python 파일 69개가 있습니다. Python 문법 오류는 현재 0건으로 확인됩니다.
39s 동안 생각함
파악 완료.
확인한 범위:
TXT 문서 7개 전체 판독
kiwoom_auto (14).zip 내부 811개 항목 확인
Python 파일 69개 문법검사 완료
문법 오류 0건
현재 핵심 판정:
기준 문서 최우선은 MASTER_SPEC v2.1_2026-06-13
구조개선 1차는 사실상 완료
현재 단계는 운영정책 실전검증
다음 우선순위는 재시작 → 긴급정지 → 검토관리 → 조기마감 → 자동마감 → 청산 → ATS
코드 수정은 바로 들어가면 안 되고, 체크리스트 기준 위험구간 분석부터 해야 함
ZIP 내부 최신 구조도 문서 내용과 대체로 일치함
gui_auto_trade_setting_window.py는 약 2029줄, 자동매매설정창 허브 역할

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_4.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-15 23:01:24 | 분류: 대화히스토리]
네가 말거중에 만약에 정상기능을 수행하던중 약간의 딜레이로 프로그램에 정보반영이 즉시 안됐을때 마침 안정성 판정과 겹치는 문제도 있을듯한데..
맞습니다. 그게 실서버 연동에서 가장 조심해야 할 오판정입니다.
정상 동작 중인데:
주문 넣음
키움 서버 체결/잔고 반영 지연
프로그램 내부값은 아직 이전 상태
그 순간 안정성검사 실행
내부값/서버값 불일치로 빨강 또는 검토관리 판정
이런 흐름이 생길 수 있습니다.
그래서 안정성 판정은 즉시 단정하면 안 되고, 유예 상태가 필요합니다.
개념은 이렇게 잡는 게 맞습니다.

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_4.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-15 23:01:24 | 분류: 대화히스토리]
검토관리창 구조는 일단 유지.
진짜 문제는 상상 설계가 아니라 키움 서버 연동 후 실제로 어떤 불일치/지연/예외가 나오는지 확인하는 것입니다.
그래서 다음 방향은 이게 맞습니다.
검토관리창은 더 건드리지 말고 보류.
다음 작업 후보는:
서버 연동 전 준비 상태 점검
키움 OpenAPI 연결/잔고/보유/미체결 조회 흐름 확인
실제 서버값과 내부 state 비교 구조 확인
거기서 나온 문제만 검토관리 정책에 반영

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_4.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-15 23:01:24 | 분류: 대화히스토리]
별도 시간을설정해서 사용하게 하는게 좋을듯..사실 환경설정에 들어간 시간운영 서정값을 써도 문제가 없을듯 한데 만약에 어떤 이유로 별도의 시간을 사용해야 할때 로직을 수정해양 하는 수고로움이 발생한다. 디폴트 값을 시간운영 설정값(체크박스활용) 을 사용하게 하고, 옵션으로 별개 시간을 사용하게 구성 관제창 ui 구성시 완충영역 사용 시간도 넣어야 할듯 그 시간표시를 직접 클릭해서 수정
맞습니다. 이 방식이 제일 안전합니다.
확정 방향:
완충복구 적용시간
기본값 = 기존 시간운영 설정값 사용
옵션 = 별도 시간 직접 설정
구성:
완충복구 시간
[✓] 시간운영 설정값 사용
적용시간: 09:00 ~ 13:30
체크 해제 시:
완충복구 시간
[ ] 시간운영 설정값 사용
적용시간: 09:00 ~ 13:30
이 시간을 관제창에서 직접 클릭해서 수정.
의미:
기본은 기존 시간운영과 연동
특별한 운용이 필요하면 별도 시간 사용
나중에 로직 수정 없이 UI 설정만으로 대응
관제창에서 현재 적용시간이 바로 보임
문서에는 이렇게 넣으면 됩니다.

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_4.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-15 23:01:24 | 분류: 대화히스토리]
kiwoom_auto (23)(1).zip
ZIP 아카이브
그러면 일단 종목 관리 구조 개편부다 하자. 정밀한 구조분석 해서 방향확정해줘
image(699).png
image(700).png
image(701).png
image(702).png
image(703).png
image(704).png
stock_migration_apply_report.txt
문서
kiwoom_auto (25).zip
ZIP 아카이브

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_4.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-15 23:01:24 | 분류: 대화히스토리]
image(705).png
image(706).png
image(707).png
image(708).png
image(709).png
이 종목들이 이제 막 등록을 했는데 왜 등록 해제 불가 종목인가
image(711).png
image(712).png
일단 분석 고고
kiwoom_auto (26).zip
ZIP 아카이브
다시 분석
image(713).png
image(714).png
image(715).png
???
kiwoom_auto (27).zip
ZIP 아카이브
image(716).png
image(717).png
image(718).png
image(719).png

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_4.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-15 23:01:24 | 분류: 대화히스토리]
image(728).png
image(729).png
image(730).png
image(731).png
image(732).png
image(733).png
image(734).png
image(735).png
실제 보이는건 6개인데 카운트는 7개....그리고 오른쪽에는 실제 운영대상만 ㅍ표기 미지정은 제외
kiwoom_auto (28).zip
ZIP 아카이브
gui_base_stock_service(2).py
Python
image(742).png
image(743).png
image(744).png
image(745).png
image(746).png
image(747).png

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_4.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-15 23:01:24 | 분류: 대화히스토리]
image(748).png
image(749).png
image(750).png
마지막 창에 헤더 정렬기능이 없다...
kiwoom_auto (29).zip
ZIP 아카이브
분석고고
용어 정리가 필요한거 같다. 루틴지정/해제와 라이브러리에서 등록/해제를 혼용해서 쓴다...
kiwoom_auto (30).zip
ZIP 아카이브
image(752).png
image(753).png
image(754).png
image(755).png
kiwoom_auto (31).zip
ZIP 아카이브
내가 수정
삭제 불가 구문은 모두 삭제 했다..나중에 복구 해놓지마라
kiwoom_auto (32).zip
ZIP 아카이브
분석고고
legacy_routine_stock_archive_report.txt
문서
kiwoom_auto (33).zip
ZIP 아카이브
니가 열어보라고 압축폴더 줬구만..
아직 안끝난듯해...종목 등록했더니 이렇게 됐다
kiwoom_auto (34).zip
ZIP 아카이브
다시 분석 고고
image(761).png
image(762).png
reset_all_stock_state_report.txt
문서

[출처: 마스터스펙\MASTER_SPEC_v2.0_FULL_INTEGRATED_ARCHIVE_manifest.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-11 15:25:52 | 분류: MASTER_SPEC]
포함 파일:
01. MASTER_SPEC_v1.1_vs_v1.2_변경점(4).md | 515 lines | 4,914 chars
02. MASTER_SPEC_v1.1_윈도우창버전_키움자동매매(5).txt | 2,313 lines | 24,482 chars
03. MASTER_SPEC_v1.2_structure_phase2(6).txt | 1,289 lines | 12,357 chars
04. MASTER_SPEC_v1.2_갱신메모_v2026_06_07(5).txt | 103 lines | 1,138 chars
05. MASTER_SPEC_v1.3_2026-06-08(4).txt | 69 lines | 587 chars
06. MASTER_SPEC_v1.4_2026-06-09(4).txt | 59 lines | 657 chars
07. MASTER_SPEC_v1.4_2026-06-09(5).txt | 59 lines | 657 chars
08. MASTER_SPEC_v1.4_2026-06-09(6).txt | 59 lines | 657 chars
09. MASTER_SPEC_v1.5_2026-06-11_통합갱신본(1).txt | 252 lines | 3,155 chars
10. MASTER_SPEC_v1.5_2026-06-11_통합갱신본.txt | 252 lines | 3,155 chars
11. MASTER_ADDENDUM_v2026-06-10_ATS정책(1).txt | 55 lines | 409 chars
12. MASTER_ADDENDUM_v2026-06-10_ATS정책(2).txt | 55 lines | 409 chars
13. MASTER_ADDENDUM_v2026-06-10_ATS정책(3).txt | 55 lines | 409 chars
14. MASTER_ADDENDUM_v2026-06-11_구조개선_최신확정(1).txt | 61 lines | 1,146 chars
15. MASTER_ADDENDUM_v2026-06-11_구조개선_최신확정.txt | 61 lines | 1,146 chars
16. MASTER_SPEC(4).txt | 3 lines | 101 chars
17. MASTER_SPEC_업데이트_2026-06-07(3).md | 61 lines | 478 chars

[출처: 마스터스펙\MASTER_SPEC_v2.0_FULL_INTEGRATED_ARCHIVE_2026-06-11.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-11 15:25:42 | 분류: MASTER_SPEC]
# MASTER_SPEC v2.0 FULL INTEGRATED ARCHIVE
# 키움 OpenAPI 자동매매 시스템 통합 마스터 스펙
# 생성일시: 2026-06-11 12:17:00

[출처: 마스터스펙\MASTER_SPEC_v2.0_FULL_INTEGRATED_ARCHIVE_2026-06-11.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-11 15:25:42 | 분류: MASTER_SPEC]
01. MASTER_SPEC_v1.1_vs_v1.2_변경점(4).md | 515 lines | 4,914 chars
02. MASTER_SPEC_v1.1_윈도우창버전_키움자동매매(5).txt | 2,313 lines | 24,482 chars
03. MASTER_SPEC_v1.2_structure_phase2(6).txt | 1,289 lines | 12,357 chars
04. MASTER_SPEC_v1.2_갱신메모_v2026_06_07(5).txt | 103 lines | 1,138 chars
05. MASTER_SPEC_v1.3_2026-06-08(4).txt | 69 lines | 587 chars
06. MASTER_SPEC_v1.4_2026-06-09(4).txt | 59 lines | 657 chars
07. MASTER_SPEC_v1.4_2026-06-09(5).txt | 59 lines | 657 chars
08. MASTER_SPEC_v1.4_2026-06-09(6).txt | 59 lines | 657 chars
09. MASTER_SPEC_v1.5_2026-06-11_통합갱신본(1).txt | 252 lines | 3,155 chars
10. MASTER_SPEC_v1.5_2026-06-11_통합갱신본.txt | 252 lines | 3,155 chars
11. MASTER_ADDENDUM_v2026-06-10_ATS정책(1).txt | 55 lines | 409 chars
12. MASTER_ADDENDUM_v2026-06-10_ATS정책(2).txt | 55 lines | 409 chars
13. MASTER_ADDENDUM_v2026-06-10_ATS정책(3).txt | 55 lines | 409 chars
14. MASTER_ADDENDUM_v2026-06-11_구조개선_최신확정(1).txt | 61 lines | 1,146 chars
15. MASTER_ADDENDUM_v2026-06-11_구조개선_최신확정.txt | 61 lines | 1,146 chars
16. MASTER_SPEC(4).txt | 3 lines | 101 chars
17. MASTER_SPEC_업데이트_2026-06-07(3).md | 61 lines | 478 chars

[출처: 마스터스펙\MASTER_SPEC_v2.0_FULL_INTEGRATED_ARCHIVE_2026-06-11.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-11 15:25:42 | 분류: MASTER_SPEC]
============================================================
원문 전체 보존 섹션 02
파일명: MASTER_SPEC_v1.1_윈도우창버전_키움자동매매(5).txt
============================================================
# MASTER_SPEC v1.1 - Windows GUI Edition
프로젝트명 : 키움 OpenAPI 기반 자동매매 시스템
버전 : v1.1
작성일 : 2026-05-31
문서 유형 : Windows GUI 기반 확정 설계서

[출처: 마스터스펙\MASTER_SPEC_v2.0_FULL_INTEGRATED_ARCHIVE_2026-06-11.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-11 15:25:42 | 분류: MASTER_SPEC]
1. Windows GUI 관리자 화면 구조 확정
2. 메인 윈도우 구조 확정
3. 종목등록설정 창 구조 확정
4. 자동매매설정 창 구조 확정
5. MACD 환경설정 창 구조 확정
6. 긴급 정지 버튼 정책 확정
7. 키움 HTS 검색식 "자동매매" 등록 기능 추가
8. 수동등록 규칙 구체화
9. 매매루틴 지정 규칙 구체화
10. 종목별 저장 구조 확정
11. orders.json 추가
12. 중복 주문 방지 규칙 추가
13. MACD 환경설정 항목 구체화
14. 추가매수 제한 규칙 추가
15. 매도신호 무시 상태 규칙 추가
16. 무결성 검증 정책 추가
17. budget.json 추가
18. config.json 검증 규칙 추가
19. 실계좌 전환 안전장치 추가
20. 에러 코드 체계 추가
---
## [프로젝트 목표]
키움 OpenAPI를 이용한 Windows GUI 기반 자동매매 시스템 구축.
자동매매 루틴을 독립적으로 운영 가능하도록 설계한다.
동일 종목에 여러 자동매매 루틴을 동시 적용할 수 있어야 한다.
시스템 종료 후 재시작 시 자동 복구가 가능해야 한다.
모든 자동매매 루틴은 종목별 설정, 상태, 주문, 로그를 독립적으로 관리해야 한다.
사용자는 콘솔 명령어가 아니라 Windows 창에서 자동매매 상태를 확인하고 제어할 수 있어야 한다.
---
## [구현 UI 원칙]
1. 기본 UI는 Windows GUI 방식이다.
2. 콘솔 입력 방식은 개발자 디버그 용도로만 허용한다.
3. 일반 사용자는 버튼, 목록, 입력창, 확인창을 통해 기능을 실행한다.
4. 실계좌 실행, 종목 삭제, 초기화, 전체 자동매매 정지는 반드시 확인창을 표시한다.
5. 긴급 정지 버튼은 메인 윈도우에서 항상 접근 가능해야 한다.
6. 실행 중인 자동매매 종목은 표 형태로 표시한다.
7. 오류 발생 시 팝업 알림과 system_error.log 기록을 동시에 수행한다.

[출처: 마스터스펙\MASTER_SPEC_v2.0_FULL_INTEGRATED_ARCHIVE_2026-06-11.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-11 15:25:42 | 분류: MASTER_SPEC]
8. 자동매매 시작, 정지, 종목 삭제, 환경설정 변경은 PROJECT_CHANGELOG.txt 에 기록한다.
9. GUI는 내부 데이터 파일을 직접 수정하지 않고 관리자 기능 함수를 통해서만 수정한다.
10. GUI 표시값과 실제 파일 상태가 불일치할 경우 파일 상태를 기준으로 다시 로딩한다.
---
## [추천 GUI 프레임워크]
Python 기반 Windows 프로그램으로 구현한다.
추천 프레임워크 :
1순위 : PySide6
2순위 : PyQt5
3순위 : tkinter
추천 기준 :
PySide6는 현대적인 Windows GUI 구현에 적합하고 라이선스 측면에서도 비교적 안정적이다.
단, 키움 OpenAPI의 ActiveX 연동 제약이 있을 경우 PyQt5 사용을 허용한다.
최종 선택은 키움 OpenAPI 연동 테스트 결과에 따른다.
---
## [최상위 규칙]
1. 기초종목.txt 는 시스템의 마스터 데이터이다.
2. 자동매매 루틴은 기초종목.txt 를 직접 수정할 수 없다.
3. 종목 등록 및 삭제는 관리자 GUI 기능을 통해서만 가능하다.
4. 기존 함수 삭제 금지.
5. 기존 데이터 구조 변경 금지.
6. 기존 파일명 변경 금지.
7. 기존 폴더 구조 변경 금지.
8. 신규 기능은 추가 방식으로 구현한다.
9. 모든 변경사항은 PROJECT_CHANGELOG.txt 에 기록한다.
10. 로그 파일은 삭제하지 않는다.
11. 주문 상태는 반드시 orders.json 에 기록한다.
12. 자동매매 실행 상태는 반드시 state.json 에 기록한다.
13. 루틴별 예산 상태는 반드시 budget.json 에 기록한다.
14. 실계좌 자동매매는 기본 비활성화한다.
15. 실계좌 자동매매 실행은 사용자 수동 승인 후에만 허용한다.
16. GUI에서 표시되는 모든 상태는 파일 및 키움 계좌 조회 결과를 기준으로 갱신한다.
17. GUI 버튼 클릭으로 실행되는 모든 기능은 로그를 남긴다.
---
## [폴더 구조]
/kiwoom_auto
├─ kiwoom_login.py
├─ kiwoom_api.py
├─ gui_main.py
├─ gui_windows.py
├─ gui_dialogs.py
├─ order_manager.py
├─ risk_manager.py
├─ candle_manager.py
├─ config_validator.py
├─ routine_loader.py
├─ 기초종목.txt
├─ system_error.log
├─ invalid_items.log
├─ PROJECT_CHANGELOG.txt
├─ MASTER_SPEC.txt
├─ screen_registry.json
├─ _MACD매매루틴
│ ├─ budget.json
│ ├─ 005930_삼성전자
│ │ ├─ config.json
│ │ ├─ state.json
│ │ ├─ orders.json
│ │ └─ logs
│ │ ├─ 20260531.log
│ │ └─ 20260601.log
│ ├─ 000660_SK하이닉스
│ │ ├─ config.json
│ │ ├─ state.json
│ │ ├─ orders.json
│ │ └─ logs
│ └─ ...
├─ _RSI매매루틴
│ ├─ budget.json
│ └─ ...
└─ ...
---
## [파일 역할]
### kiwoom_login.py
역할 :

[출처: 마스터스펙\MASTER_SPEC_v2.0_FULL_INTEGRATED_ARCHIVE_2026-06-11.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-11 15:25:42 | 분류: MASTER_SPEC]
1. 키움 OpenAPI 로그인
2. 프로그램 시작점
3. GUI 실행 전 키움 API 초기화
4. 자동매매 루틴 폴더 자동 탐색
5. 로그인 성공 후 gui_main.py 호출
주의 :
kiwoom_login.py 에 매매 로직을 직접 작성하지 않는다.
kiwoom_login.py 에 GUI 세부 화면 코드를 직접 작성하지 않는다.
---
### gui_main.py
역할 :
Windows GUI 프로그램의 메인 실행 파일.
주요 기능 :

[출처: 마스터스펙\MASTER_SPEC_v2.0_FULL_INTEGRATED_ARCHIVE_2026-06-11.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-11 15:25:42 | 분류: MASTER_SPEC]
1. 오류 알림창
2. 확인창
3. 실계좌 승인 입력창
4. 종목 입력창
5. 루틴 선택창
6. 삭제 확인창
7. 초기화 확인창
8. 긴급 정지 확인창
---
### kiwoom_api.py
역할 :
키움 OpenAPI 직접 호출을 담당한다.
주요 기능 :

[출처: 마스터스펙\MASTER_SPEC_v2.0_FULL_INTEGRATED_ARCHIVE_2026-06-11.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-11 15:25:42 | 분류: MASTER_SPEC]
1. 로그인
2. 계좌번호 조회
3. 예수금 조회
4. 보유종목 조회
5. 종목명 조회
6. 검색식 조회
7. 검색식 결과 수신
8. 분봉 / 일봉 데이터 요청
9. 실시간 시세 등록
10. 주문 전송
11. 주문 취소
12. 체결 이벤트 수신
13. 미체결 주문 조회
주의 :
키움 OpenAPI 호출은 반드시 kiwoom_api.py 를 통해 수행한다.
다른 파일에서 키움 OpenAPI를 직접 호출하지 않는다.
---
### order_manager.py
역할 :
주문 상태를 관리한다.
주요 기능 :

[출처: 마스터스펙\MASTER_SPEC_v2.0_FULL_INTEGRATED_ARCHIVE_2026-06-11.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-11 15:25:42 | 분류: MASTER_SPEC]
1. 자동매매 시작
2. 자동매매 정지
3. 종목 삭제
4. 환경설정
5. 주문상태 보기
6. 로그 보기
7. 닫기
종목 목록 표시 항목 :

[출처: 마스터스펙\MASTER_SPEC_v2.0_FULL_INTEGRATED_ARCHIVE_2026-06-11.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-11 15:25:42 | 분류: MASTER_SPEC]
8. 종목별 폴더 생성 시 config.json, state.json, orders.json, logs 폴더를 함께 생성한다.
9. 루틴 지정 결과는 PROJECT_CHANGELOG.txt 에 기록한다.
---
## [무결성 검증 정책]
1. 기초종목.txt 의 종목코드와 종목명을 키움 API 기준 실제 종목 정보와 비교한다.
2. 루틴 폴더 내 종목 폴더와 기초종목.txt 의 루틴 등록 정보를 비교한다.
3. 불일치 항목을 즉시 삭제하지 않는다.
4. 먼저 불일치 목록을 GUI 표로 출력한다.
5. invalid_items.log 에 기록한다.
6. 사용자 확인 후 삭제 또는 격리한다.
7. 삭제 또는 격리 결과를 PROJECT_CHANGELOG.txt 에 기록한다.
검증 대상 :
1. 기초종목.txt 중복 종목
2. 기초종목.txt 종목코드 오류
3. 기초종목.txt 종목명 오류
4. 루틴 폴더에는 있으나 기초종목.txt 에 없는 종목
5. 기초종목.txt 에는 있으나 루틴 폴더에 없는 종목
6. 종목 폴더명 형식 오류
7. 필수 파일 누락
필수 파일 :
config.json
state.json
orders.json
logs
---
## [중복 주문 방지 정책]
1. 동일 종목, 동일 루틴, 동일 봉에서는 매수 주문을 1회만 허용한다.
2. 동일 종목, 동일 루틴, 동일 봉에서는 매도 주문을 1회만 허용한다.
3. 주문 요청 후 체결, 취소, 거부, 실패 중 하나가 확정되기 전까지 추가 주문을 금지한다.
4. pending_order 가 true 인 경우 신규 주문을 발생시키지 않는다.

[출처: 마스터스펙\MASTER_SPEC_v2.0_FULL_INTEGRATED_ARCHIVE_2026-06-11.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-11 15:25:42 | 분류: MASTER_SPEC]
============================================================
원문 전체 보존 섹션 03
파일명: MASTER_SPEC_v1.2_structure_phase2(6).txt
============================================================
# MASTER_SPEC v1.2 - Structure Phase 2
프로젝트명: 키움 OpenAPI 기반 Windows GUI 자동매매 시스템
버전: v1.2
작성일: 2026-06-05
문서 유형: 구조개선 2차 정책 반영 최상위 설계서

[출처: 마스터스펙\MASTER_SPEC_v2.0_FULL_INTEGRATED_ARCHIVE_2026-06-11.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-11 15:25:42 | 분류: MASTER_SPEC]
코드가 아직 v1.2를 완전히 반영하지 않았더라도, 이후 구조개선 및 OpenAPI 연결 전 정책 기준은 본 문서를 따른다.
---
# 1. 문서 목적
본 문서는 키움 OpenAPI 기반 자동매매 시스템의 최상위 기준 문서이다.
본 문서에 정의된 아래 항목은 구조개선 2차 이후의 기준으로 사용한다.

[출처: 마스터스펙\MASTER_SPEC_v2.0_FULL_INTEGRATED_ARCHIVE_2026-06-11.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-11 15:25:42 | 분류: MASTER_SPEC]
============================================================
원문 전체 보존 섹션 04
파일명: MASTER_SPEC_v1.2_갱신메모_v2026_06_07(5).txt
============================================================
# MASTER_SPEC_v1.2_갱신메모_v2026_06_07
## 1. 문서 지위
MASTER_SPEC_v1.2_structure_phase2는 최신 기준 문서로 유지한다.
이번 세션에서 별도 마스터스펙 전체 교체는 하지 않는다.
단, 아래 내용은 v1.2에 추가 반영해야 할 메모이다.
---
## 2. 추가 반영 필요 항목
### 2.1 운영환경설정 UI 확정
운영환경설정 UI가 실사용 가능 수준으로 정리되었다.

[출처: 마스터스펙\MASTER_SPEC_v2.0_FULL_INTEGRATED_ARCHIVE_2026-06-11.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-11 15:25:42 | 분류: MASTER_SPEC]
MASTER_SPEC_v1.1_윈도우창버전_키움자동매매.txt 파일을 이 폴더에 복사한 뒤 MASTER_SPEC.txt로 저장하는 것을 권장한다.

[출처: 작업재개요약서_v2026-06-11_구조개선_최신갱신.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-11 15:05:44 | 분류: 작업재개요약]
현재 작업 주제:
- 키움 자동매매 GUI 구조개선
- gui_windows.py 대형 클래스/기능 분리
- 자동매매설정/루틴지정/검토관리/종목등록 계열 안정화
[2026-06-11 최신 구조개선 진행 요약]

[출처: 작업재개요약서_v2026-06-11_구조개선_최신갱신.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-11 15:05:44 | 분류: 작업재개요약]
4순위:
 - OperationEnvironmentSettingsDialog 분리
 - 환경설정 UI가 크지만 이미 별도 설정창 성격이므로 분리 효과 큼

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_3.txt | 기준일: 2026-06-09 | 수정시각: 2026-06-11 15:30:36 | 분류: 대화히스토리]
하단에 적색 표시한 환경설정 버튼은 삭제, 주문 상태보기는 메인 창에서 구현, 진짜 문제는 하이닉스 에 데이터 문제가 있는데 현황표시도없고 원칙은 프로그래 재시작시 걸러져서 검토로 이동. 네 생각은?
gui_windows(123).py
Python
면밀히 검토해서 파일 덮어 쓰기 할 패치파일 만들어줘
이것도 문제야. 하이닉스를 검토로 뺐는데 해결로 뜬다...

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_3.txt | 기준일: 2026-06-09 | 수정시각: 2026-06-11 15:30:36 | 분류: 대화히스토리]
gui_windows(124).py
Python
다시 임의로 하이닉스에 평단을 넣었는데 현황표시 변화가없다...확인해봐

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_3.txt | 기준일: 2026-06-09 | 수정시각: 2026-06-11 15:30:36 | 분류: 대화히스토리]
gui_windows_136_data_inconsistency_red_path_fix(1).py
Python
전에 네가 준 패치 파일이다..여기는어떻게 ?

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_3.txt | 기준일: 2026-06-09 | 수정시각: 2026-06-11 15:30:36 | 분류: 대화히스토리]
gui_windows(125).py
Python
프로그램상 재시작시 한번 걸르고, 운영시작시 2번째 걸르게 돼어 있는데 운영시작에서는 걸러진다.. 검토/분석해봐
오케이 ..
gui_windows(126).py
Python
파악/분석 해봐
gui_windows(127).py
Python
개념 확립해서 파일 분석하고 패치 작성 해줘..
image(475).png
image(476).png
수동메뉴에서 추가 시간 설정과 변경 리셋은 어떤기능?
추가 시간을 "ATS설정" 으로 바꾸자
gui_windows(128).py
Python
다시 분석해서 패치 줘
image(478).png
image(479).png
추가1,2,3에 활설 표시는 못만드나 가령 체크박스
gui_windows(129).py
Python
gui_windows(130).py
Python
체크박스는 구현이 안되는걸로
gui_windows(131).py
Python
다시분석
ㅋㅋㅋ새창으로 대체 했네
이거는 이정도가 최선인듯
일단 이렇게 하자...
수동+ats 가 들어오면 일단 청산은 사용못함 지금은 환경설정 값을 따른다
gui_windows(132).py
Python
코드 분석해보고 패치파일 줘
image(485).png
image(486).png
image(487).png
state(4).json
파일
결과 확인 해보고 셀트리온케어는 왜 복귀가 안되는지 모르겠어. 확인해줘

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_3.txt | 기준일: 2026-06-09 | 수정시각: 2026-06-11 15:30:36 | 분류: 대화히스토리]
image(488).png
image(489).png
image(490).png
청산방식에 환경설정값 반영 잘된다
ats 적용 | 장전프리/마감후ntx 형식으로 변경. 주저리주저리 써넣지마...
gui_windows(133).py
Python
이거 왜 메세지가 중간에 줄바꿈?
이렇게 확정...다음
gui_windows(134).py
Python
복원해놔..
안보인다...주황색으로 바꿔보까?
이미지 생성됨
•
자동매매설정 화면 구성
자동매매설정 화면 구성
생성된 이미지: 자동매매설정 화면 구성
편집
gui_windows(135).py
Python
이거 폐기
gui_windows(137).py
Python
이걸로 확정 또 개같은 짓 하기만 해라....
설정차이 왜 찐빵 눌러놓은거 같은 모습이지? 그리고 왜 쓸데없는 메세지를 넣었나?
대상종목 빼줘
gui_windows(138).py
Python
삼성물산의 경우 이런 설정이면 어떻게 움질일지 흐름좀 분석해봐...장중 거래가 있다는 전재하에
다시 지금 설정으로 흐름을 분석해봐 ats 설정 참고
gui_windows(139).py
Python
분석해서 수정 파일 줘
image(504).png
image(505).png
청산 들어가면 상태는 감/시대기 맞는거 아닌가?
image(507).png
image(508).png
이게 청산 이후 상태...보유등이 있는것은 프로그램종료 재식작이후 검토지정
gui_windows(140).py
Python
현재 로직은 어떻게 되어 있나? 분석해봐
gui_windows(141).py
Python
다시 분석해보고 수정본 파일 준비해줘,

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_3.txt | 기준일: 2026-06-09 | 수정시각: 2026-06-11 15:30:36 | 분류: 대화히스토리]
현재 lg에는 보유는 없는데 총금액이 들어있다..하이닉스는 이미지보면 정상이다. 문제는 청산 시가에 왜 하이닉스의 "-" 표시에 활성이 뜨냐는거지
gui_windows(142).py
Python
다시 분석해서 수정본 파일 줘
이거 개별 넣으니까 뭘로 진행되는진몰라...
gui_windows(143).py
Python
분석해서 수정본 만들어줘
배경은 힌색으로, 강조 빼고 개별 빼고 그냥 5분/시장가 형식으로 색만 주황으로 바꿔줘....노답이다..
gui_windows(144).py
Python
왜 시간과 네 리소스를 낭비하나??
배경에 활성/ 비활성 적용해줘.
적용은 잘 됐는데 시인성이 조금 부족하네.
이미지 생성됨
•
자동매매설정 화면 내용
자동매매설정 화면 내용
생성된 이미지: 자동매매설정 화면 내용
편집
적용 된건가?
gui_windows(145).py
Python
gui_windows(146).py
Python
아마가 아니라 진짜를 가져와...

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_3.txt | 기준일: 2026-06-09 | 수정시각: 2026-06-11 15:30:36 | 분류: 대화히스토리]
image(534).png
image(535).png
lg는 전역설정에 따라서 매수매도시간이다....이건 표시를 따로 해야 할듯한데...즉 전역설정에 시간외거래 활성과 개별설정에 시간외 거래 활성...
gui_windows(150).py
Python
분석해서 수정본 파일 만들어줘봐

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_3.txt | 기준일: 2026-06-09 | 수정시각: 2026-06-11 15:30:36 | 분류: 대화히스토리]
gui_windows(152).py
Python
지금 전체수동 +ats 가 전역설정값을 가져다 쓴다..개별설정값을 쓰지를 않아 다시 확인해봐

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_3.txt | 기준일: 2026-06-09 | 수정시각: 2026-06-11 15:30:36 | 분류: 대화히스토리]
gui_windows(153).py
Python
이 시점으로 다시 복원해놔다...다시 정밀하게 분석해서 수정본 파일 만들어줘
너 개념을 잘못잡고 있는거 같아
gui_windows(154).py
Python
다시 분석해봐..너 하고싶은거 다해봐
gui_windows(155).py
Python
분석더해
image(546).png
image(547).png
두번째 이미지의 메세지는 뭔가?

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_3.txt | 기준일: 2026-06-09 | 수정시각: 2026-06-11 15:30:36 | 분류: 대화히스토리]
스크린샷 2026-06-10 213054.png
스크린샷 2026-06-10 213146.png
직전작업 결과로 다음 작업은?
수동은 툴팁 제거해..내용 들어갈게 없다...
이 툴팁도 뒤에 초 단위 표시는 삭제
gui_windows(160).py
Python
실행가능
image(562).png
image(563).png
8시 54분은 거래 시간 아님
gui_windows(161).py
Python
gui_auto_trade_display(1).py
Python
gui_windows(162).py
Python

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_3.txt | 기준일: 2026-06-09 | 수정시각: 2026-06-11 15:30:36 | 분류: 대화히스토리]
PS C:\Users\JIN KWANG CHUL\Documents\kiwoom_auto> & "C:\Users\JIN KWANG CHUL\AppData\Local\Programs\Python\Python311-32\python.exe" "c:/Users/JIN KWANG CHUL/Documents/kiwoom_auto/gui_main.py"
Traceback (most recent call last):
 File "c:\Users\JIN KWANG CHUL\Documents\kiwoom_auto\gui_auto_trade_setting_window.py", line 2587, in on_time_policy_timer_tick
 if isinstance(parent, MainWindow):
 ^^^^^^^^^^
NameError: name 'MainWindow' is not defined
PS C:\Users\JIN KWANG CHUL\Documents\kiwoom_auto>
image(571).png
image(572).png
image(573).png
gui_windows(163).py
Python
gui_auto_trade_setting_window(1).py
Python

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_3.txt | 기준일: 2026-06-09 | 수정시각: 2026-06-11 15:30:36 | 분류: 대화히스토리]
PS C:\Users\JIN KWANG CHUL\Documents\kiwoom_auto> & "C:\Users\JIN KWANG CHUL\AppData\Local\Programs\Python\Python311-32\python.exe" "c:/Users/JIN KWANG CHUL/Documents/kiwoom_auto/gui_main.py"
Traceback (most recent call last):
 File "c:\Users\JIN KWANG CHUL\Documents\kiwoom_auto\gui_auto_trade_setting_window.py", line 1721, in on_time_policy_timer_tick
 if isinstance(parent, MainWindow):
 ^^^^^^^^^^
NameError: name 'MainWindow' is not defined
PS C:\Users\JIN KWANG CHUL\Documents\kiwoom_auto>
image(577).png
image(578).png
gui_auto_trade_integrity(1).py
Python
gui_auto_trade_order_log(1).py
Python
gui_auto_trade_policy(1).py
Python
gui_auto_trade_setting_window(2).py
Python
gui_windows(164).py
Python
중간 점검
gui_operation_environment(1).py
Python
gui_windows(165).py
Python
image(587).png
image(588).png
image(589).png

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_3.txt | 기준일: 2026-06-09 | 수정시각: 2026-06-11 15:30:36 | 분류: 대화히스토리]
PS C:\Users\JIN KWANG CHUL\Documents\kiwoom_auto> & "C:\Users\JIN KWANG CHUL\AppData\Local\Programs\Python\Python311-32\python.exe" "c:/Users/JIN KWANG CHUL/Documents/kiwoom_auto/gui_main.py"
Traceback (most recent call last):
 File "c:\Users\JIN KWANG CHUL\Documents\kiwoom_auto\gui_auto_trade_setting_window.py", line 1569, in on_stock_table_context_menu
 show_auto_trade_stock_context_menu(self, pos)
 File "c:\Users\JIN KWANG CHUL\Documents\kiwoom_auto\gui_auto_trade_context_menu.py", line 82, in show_auto_trade_stock_context_menu
 window.apply_selected_early_close("루틴", source="우클릭")
 File "c:\Users\JIN KWANG CHUL\Documents\kiwoom_auto\gui_auto_trade_setting_window.py", line 3332, in apply_selected_early_close
 auto_trade_apply_selected_early_close(
 File "c:\Users\JIN KWANG CHUL\Documents\kiwoom_auto\gui_auto_trade_close.py", line 621, in auto_trade_apply_selected_early_close
 append_changelog(
 ^^^^^^^^^^^^^^^^
NameError: name 'append_changelog' is not defined
image(592).png
image(593).png
image(594).png
근데 kb금융이 왜 감시/대기 지?
테스트 정상인듯
gui_auto_trade_status_ops(1).py
Python

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_3.txt | 기준일: 2026-06-09 | 수정시각: 2026-06-11 15:30:36 | 분류: 대화히스토리]
image(597).png
image(598).png
PS C:\Users\JIN KWANG CHUL\Documents\kiwoom_auto> & "C:\Users\JIN KWANG CHUL\AppData\Local\Programs\Python\Python311-32\python.exe" "c:/Users/JIN KWANG CHUL/Documents/kiwoom_auto/gui_main.py"
Traceback (most recent call last):
 File "c:\Users\JIN KWANG CHUL\Documents\kiwoom_auto\gui_auto_trade_setting_window.py", line 1393, in on_time_policy_timer_tick
 auto_trade_on_time_policy_timer_tick(self)
 File "c:\Users\JIN KWANG CHUL\Documents\kiwoom_auto\gui_auto_trade_timer.py", line 88, in auto_trade_on_time_policy_timer_tick
 result = window.recalculate_all_status_by_operation_policy(
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
TypeError: AutoTradeSettingWindow.recalculate_all_status_by_operation_policy() got an unexpected keyword argument 'silent_unchanged'
PS C:\Users\JIN KWANG CHUL\Documents\kiwoom_auto>
gui_auto_trade_setting_window(3).py
Python
gui_auto_trade_run_control(1).py
Python

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_3.txt | 기준일: 2026-06-09 | 수정시각: 2026-06-11 15:30:36 | 분류: 대화히스토리]
image(601).png
image(602).png
PS C:\Users\JIN KWANG CHUL\Documents\kiwoom_auto> & "C:\Users\JIN KWANG CHUL\AppData\Local\Programs\Python\Python311-32\python.exe" "c:/Users/JIN KWANG CHUL/Documents/kiwoom_auto/gui_main.py"
Traceback (most recent call last):
 File "c:\Users\JIN KWANG CHUL\Documents\kiwoom_auto\gui_auto_trade_setting_window.py", line 1523, in on_stock_table_context_menu
 show_auto_trade_stock_context_menu(self, pos)
 File "c:\Users\JIN KWANG CHUL\Documents\kiwoom_auto\gui_auto_trade_context_menu.py", line 76, in show_auto_trade_stock_context_menu
 window.open_selected_individual_liquidation_settings()
 File "c:\Users\JIN KWANG CHUL\Documents\kiwoom_auto\gui_auto_trade_setting_window.py", line 1526, in open_selected_individual_liquidation_settings
 auto_trade_open_selected_individual_liquidation_settings(self)
 File "c:\Users\JIN KWANG CHUL\Documents\kiwoom_auto\gui_auto_trade_close.py", line 285, in auto_trade_open_selected_individual_liquidation_settings
 changed_count = auto_trade_save_selected_individual_liquidation_settings(window, policy_values)
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 File "c:\Users\JIN KWANG CHUL\Documents\kiwoom_auto\gui_auto_trade_close.py", line 332, in auto_trade_save_selected_individual_liquidation_settings
 append_stock_log(stock_dir, "GUI", f"개별 청산 저장: {window.individual_liquidation_status_text(normalized)}")
 ^^^^^^^^^^^^^^^^
NameError: name 'append_stock_log' is not defined
PS C:\Users\JIN KWANG CHUL\Documents\kiwoom_auto>

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_3.txt | 기준일: 2026-06-09 | 수정시각: 2026-06-11 15:30:36 | 분류: 대화히스토리]
PS C:\Users\JIN KWANG CHUL\Documents\kiwoom_auto> & "C:\Users\JIN KWANG CHUL\AppData\Local\Programs\Python\Python311-32\python.exe" "c:/Users/JIN KWANG CHUL/Documents/kiwoom_auto/gui_main.py"
Traceback (most recent call last):
 File "c:\Users\JIN KWANG CHUL\Documents\kiwoom_auto\gui_auto_trade_setting_window.py", line 2566, in run_current_routine_stability_check
 auto_trade_run_current_routine_stability_check(self)
 File "c:\Users\JIN KWANG CHUL\Documents\kiwoom_auto\gui_auto_trade_review_ops.py", line 33, in auto_trade_run_current_routine_stability_check
 stock_dirs = assigned_stock_dirs_in_routine(routine_dir)
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
NameError: name 'assigned_stock_dirs_in_routine' is not defined
gui_auto_trade_review_ops(1).py
Python
gui_auto_trade_setting_window(4).py
Python
gui_windows(166).py
Python
점검해서 수정본 만들어줘
image(605).png
image(606).png
?운영중 대상이 뭐지?
지금 확인 해본니까 운영중 대상이 검토관리에 지정된 종목이네..이거 이름 바꿔야지.
gui_auto_trade_review_ops(2).py
Python
gui_auto_trade_setting_window(5).py
Python
gui_windows(167).py
Python
gui_review_required_window(7).py
Python
gui_auto_trade_review_ops(3).py
Python
gui_auto_trade_order_log(2).py
Python
gui_log_view_window(8).py
Python
gui_order_status_window(9).py
Python
gui_auto_trade_setting_window(6).py
Python
image(610).png
image(611).png
이건 내가 보기에도 용어가 꼬여있다.
현재 캡처 기준:
정상 대상: 16
운영중 대상: 0
검토관리 대상: 0
기분류 종목: 2
그런데 화면에는
SK하이닉스 수동+ATS
KB금융 수동+ATS
카카오게임즈 수동+ATS
가 존재한다.
즉 "운영중 대상"이
실제 운영중 종목 수
를 의미하는 건 절대 아니다.
예전 안정성검사 코드를 보면 아마:
매수/매도 상태
종목만 세고
감시/대기
는 제외하는 식으로 집계한 흔적이 있다.
그래서 현재 숫자:
운영중 대상: 0
은
현재 매수/매도 상태인 종목 수
정도일 가능성이 높다.
문제는 사용자 입장에서
운영중 대상
이라고 쓰여 있으면
당연히
현재 실제 운용중인 종목 수
로 읽힌다.
근데 지금 의미가 그게 아니다.
그래서 내가 보기에는 아예 삭제하는 게 낫다.
현재 확정된 구조라면:
전체검사
정상 종목
검토관리 대상
기분류 종목
만 있어도 충분하다.
예:
전체검사: 18개
정상 종목: 16개
검토관리 대상: 0개
기분류 종목: 2개
이게 훨씬 명확하다.
그래서 먼저 확인해야 할 것:
현재 안정성검사 코드에서

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_3.txt | 기준일: 2026-06-09 | 수정시각: 2026-06-11 15:30:36 | 분류: 대화히스토리]
정상
검토관리
기분류
3분류 체계가 확정되어 있어서 "운영중"이라는 중간 집계값이 운영 판단에 도움을 주지 않기 때문이다.
분석 중지됨
생각 중지됨
gui_auto_trade_status_ops(2).py
Python
원인 찾았다.

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_3.txt | 기준일: 2026-06-09 | 수정시각: 2026-06-11 15:30:36 | 분류: 대화히스토리]
PS C:\Users\JIN KWANG CHUL\Documents\kiwoom_auto> & "C:\Users\JIN KWANG CHUL\AppData\Local\Programs\Python\Python311-32\python.exe" "c:/Users/JIN KWANG CHUL/Documents/kiwoom_auto/gui_main.py"
Traceback (most recent call last):
 File "c:\Users\JIN KWANG CHUL\Documents\kiwoom_auto\gui_main.py", line 16, in <module>
 from gui_windows import MainWindow
 File "c:\Users\JIN KWANG CHUL\Documents\kiwoom_auto\gui_windows.py", line 122, in <module>
 from gui_routine_assign_window import RoutineAssignWindow
 File "c:\Users\JIN KWANG CHUL\Documents\kiwoom_auto\gui_routine_assign_window.py", line 86, in <module>
 from gui_stock_register_utils import (
ModuleNotFoundError: No module named 'gui_stock_register_utils'
PS C:\Users\JIN KWANG CHUL\Documents\kiwoom_auto>

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_3.txt | 기준일: 2026-06-09 | 수정시각: 2026-06-11 15:30:36 | 분류: 대화히스토리]
없는 gui_stock_register_utils import 제거
active_stock_register_status_display 로컬 구현 추가
문법검사 통과했습니다.
image(613).png
image(614).png
image(615).png
gui_routine_assign_window(1).py
Python
gui_windows(169).py
Python
image(616).png
오케이. 그러면 현재 화면은 정상입니다.
해제 후라면:
상단: 미등록 / 미지정
하단: 연결 종목 없음
이게 맞습니다.
다음 테스트는 1개만 다시 지정해보면 됩니다.

[출처: 통합_작업재개_마스터패키지_v2026-06-09.txt | 기준일: 2026-06-09 | 수정시각: 2026-06-09 19:54:28 | 분류: 작업재개요약]
========================
8. 다음 작업 순서
========================
1순위
자동매매설정 미구현 기능 전수조사
대상
- 주문상태보기
- 로그보기
- 환경설정
- 강제종료
- 매매시작
- 미사용 버튼
2순위
관제창 완성
3순위
2차 구조개선

[출처: 작업재개요약서_2026_06_09_관제창이후 (1).md | 기준일: 2026-06-09 | 수정시각: 2026-06-09 15:33:24 | 분류: 작업재개요약]
1. 자동매매설정 미구현 기능 점검
2. not_implemented 전수조사
3. 주문상태보기 구현
4. 로그보기 구현
5. 환경설정 기능 정리
6. 매매시작/강제종료 최종 검증
## 보류

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_2.txt | 기준일: 2026-06-07 | 수정시각: 2026-06-09 20:07:50 | 분류: 대화히스토리]
kiwoom_auto (2)(3).zip
ZIP 아카이브
이 프로젝트의 구조및 파일 내용 정밀하게 파악해
구조개선_작업로그_v20_9_3ah_step41_운영환경설정_UI정비(2).txt
문서
MASTER_SPEC_v1.2_갱신메모_v2026_06_07(2).txt
문서
운영환경설정_UI_확정본_v1(2).txt
문서
중요결정사항_확정본_v2026_06_07_상세판(2).txt
문서
작업재개요약서_v2026_06_07_UI최종반영판(2).txt
문서
중요결정사항_확정본_v2026_06_07(2).txt
문서
MASTER_SPEC_v1.1_vs_v1.2_변경점(3).md
파일
MASTER_SPEC_v1.2_structure_phase2(4).txt
문서
정책설계서_v20_9_3ag(2).md
파일
MASTER_SPEC(2).txt
문서

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_2.txt | 기준일: 2026-06-07 | 수정시각: 2026-06-09 20:07:50 | 분류: 대화히스토리]
MASTER_SPEC_v1.1_윈도우창버전_키움자동매매(3).txt
문서
이 내용들들 모두 파악해서다음 진행할작업을 알려줘
작업진행상황대화히스토리(2).txt
문서
이내용에서 작업 내용흐름을 파악해봐
눈으로는 바뀐게 없어 보인다...그리고 설정 사항들을 변경하고 저장해서 다시 열어서 내용 확인 문제 없다
image(241).png
image(242).png
이상한데??

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_2.txt | 기준일: 2026-06-07 | 수정시각: 2026-06-09 20:07:50 | 분류: 대화히스토리]
kiwoom_auto (3).zip
ZIP 아카이브
gui_windows_manual_liquidation_regular_only_patch.py 패치로 복원해놓은 전체 폴더 압축본이다. 하나도 빼먹지 말고 정밀하게 검토해봐

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_2.txt | 기준일: 2026-06-07 | 수정시각: 2026-06-09 20:07:50 | 분류: 대화히스토리]
이 메세지 수저하자. 선택된 n종목 개별시간적용 , 하단 메세지> 기본값은 환경설정에서 변경 그리고 운영환경설정> 그냥 환결설정으로 변경....씨발 주저리주저리 설명 충이냐고...앞으로 창설정의 메세지는 모두 검사 맡고 설정해
image(250).png
image(251).png
아직 기능 구현은 ?
이거 말이야
gui_windows(64).py
Python
이거 필요해?
다시 조정해줘

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_2.txt | 기준일: 2026-06-07 | 수정시각: 2026-06-09 20:07:50 | 분류: 대화히스토리]
다음 배정 기준
코드 62
종목 135
운영 105
상태 88
방식 48
청산 90
보유 42
평단 50
매매 30
미수 29
미도 29
합계:
708px
이 정도가 현재 영역에 맞다.
핵심은 현재 총합이 너무 작다는 거다.
다음 패치는 컬럼 총합을 708px 근처로 강제로 맞춰야 한다.
gui_windows(65).py
Python
gui_windows(66).py
Python
이 씨발왜 이러는거야??
어느세월에 맞추냐??
모든 컬럼을 조금씩 늘려봐
우선 종목과 방식,보유,평단의 픽셀값 알려줘
번호들어간는 부분을 3자리가 들어가게 넓혀줘
image(263).png
이미지 생성됨
•
파이썬 코드 작성 및 UI 설정
세로 헤더 폭 설정 코드 설명
생성된 이미지: 파이썬 코드 작성 및 UI 설정
편집

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_2.txt | 기준일: 2026-06-07 | 수정시각: 2026-06-09 20:07:50 | 분류: 대화히스토리]
생성된 이미지: 세로 헤더 폭 설정 코드 설명
생성된 이미지: 세로 헤더 폭 설정 코드 설명
생성된 이미지: 세로 헤더 폭 설정 코드 설명
image(264).png
직접 픽셀값을 넣었다..그런데 앞에 헤더 숫자값 공간을 강제로 넓히는방법?
gui_windows(67).py
Python
이거 분석해서 숫자 넓이를 넓혀줘..
image(265).png
일단 맞췄다. 다음은 뭘하자?
확인
gui_windows(68).py
Python
분석해..네가준 패치가 효과가 있는건가?

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_2.txt | 기준일: 2026-06-07 | 수정시각: 2026-06-09 20:07:50 | 분류: 대화히스토리]
이미지 보면 수동에서 시간으로 전환하면 검토종목으로 뜬다. 다시 시간에서 수동으로 전환하면 매수/매도로 뜨고...뭐가 문제지??
gui_windows(69).py
Python
분석해서 결과 내줘
kiwoom_auto (4).zip
ZIP 아카이브
압축폴더 분석해
다시 복구해서 패치 했다...
시간정보를 확인
image(270).png
image(271).png
?? 안돼는데?
일단 청산 활성화는 됐는데 색상이 흰색은 별로네...이거 어쩌지?
좀더 노랑 원색쪽으로 조정을 해주고 한가지 궁금한게 시간을 보면 청산이 비활성될 시간인데 왜?

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_2.txt | 기준일: 2026-06-07 | 수정시각: 2026-06-09 20:07:50 | 분류: 대화히스토리]
image(288).png
image(289).png
이 감시대기에서는기능은 비활성화? 두번째 이미지는 넥스트장 활성해놨는데 매수/매도 안떠
gui_windows(72).py
Python
state_policy(12).py
Python
그리고 추가시간 옵선 설정부분 기능을 분석해줘
일단 적용 됀거 같은데..감시종료가 안먹어...

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_2.txt | 기준일: 2026-06-07 | 수정시각: 2026-06-09 20:07:50 | 분류: 대화히스토리]
그러면 감시시작 버튼은 기능을 변경할게 아니라 창 어딘가에 따로 동작 표시를 해주는걸로 보완을 하고 이미지안의 그어딘가 색상으로 동작중인지 정지중인지 표시하는 방법으로
gui_windows(73).py
Python
image(292).png
image(293).png
적용이 안돼는 건 왜그래?
먼 개소리여..정신 못차리네...욕한다.
gui_windows(74).py
Python
6s 동안 생각함
패치 파일 만들었다.
gui_windows_v74_start_big_status_dot_removed_patch.py
적용:
시작 점 크게
상태 문구 앞 점 제거
색상정책은 그대로 유지
문법검사 통과
image(295).png
뭘 수정하거여?
36s 동안 생각함
패치 다시 만들었다.
gui_windows_v74_start_indicator_fix_patch.py
수정:
시작 점 크게 변경
상태 문구 앞 점 제거
매매시작 눌러도 상태가 동일하면 trade_enabled=True가 저장 안 되던 문제 수정
왜 검토종목이 여기 있냐고??
맞다. 여기서 검토종목이 나오면 안 된다.
지금 “시작 컬럼”은 오직 이것만 표시해야 한다.

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_2.txt | 기준일: 2026-06-07 | 수정시각: 2026-06-09 20:07:50 | 분류: 대화히스토리]
gui_windows(78).py
Python
지금 바꿔주고 파일에 컬럼넓이 조정한상황 파악부터 하고 패치 줘

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_2.txt | 기준일: 2026-06-07 | 수정시각: 2026-06-09 20:07:50 | 분류: 대화히스토리]
gui_windows(79).py
Python
우클릭시 메뉴가 노출되며 상단부에 공통사항을, 하단부에는 운영방식에따른 설정사항을 ....분석해서 일단 패치 준비 해줘봐. 적용해보고 다시 수정드가자

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_2.txt | 기준일: 2026-06-07 | 수정시각: 2026-06-09 20:07:50 | 분류: 대화히스토리]
디폴트값 적용 기능은 삭제, "선택종목 등록해제"를 "등록해제" 로 변경 전체선택, 전체해제 바로 아래로 위치 이동
이거 뭐냐?? 손절과 익절을 따로 넣게 해서 환경설정의 입력방식과 동작방식을 따라가야지

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_2.txt | 기준일: 2026-06-07 | 수정시각: 2026-06-09 20:07:50 | 분류: 대화히스토리]
gui_windows(82).py
Python
 조기/자동 마감시 방식이 제대로 적용이 안되고 있어...분석해봐

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_2.txt | 기준일: 2026-06-07 | 수정시각: 2026-06-09 20:07:50 | 분류: 대화히스토리]
gui_windows(83).py
Python
조기마감 청산정책은 디폴트로 환경설정 청산정책을 따른다. 그런데 조기마감 방식을 따라가..이거 다시 분석해

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_2.txt | 기준일: 2026-06-07 | 수정시각: 2026-06-09 20:07:50 | 분류: 대화히스토리]
image(340).png
image(341).png
이게 왜 중복 확인을 받고 있는거야? 아 열받네...확인창한개만 두고 중지대상, 검토관리 대상 만 표시하고 확인 누르면 그냥 진행
gui_windows(85).py
Python
강제 종료가 안먹어..

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_2.txt | 기준일: 2026-06-07 | 수정시각: 2026-06-09 20:07:50 | 분류: 대화히스토리]
gui_windows(86).py
Python
시작 상태의 실행 로직을 확인해봐.. 강제종료가 안먹는게 아니라 시가 표시는 녹색인데 다시 시작을 하면 시작으로 전환, 다시 강제종료 하면 종료로 변환. 그러나 시작 표시는 바뀜 없음
개소리 삭제 해줘...그리고 사작 칼럼의 표시 크기가 좀 큰거 같아 크기를 조금 줄여줘
gui_windows(87).py
Python
분석해보고 메세지창 크기 보기좋게 만들어줘

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_2.txt | 기준일: 2026-06-07 | 수정시각: 2026-06-09 20:07:50 | 분류: 대화히스토리]
image(344).png
image(345).png
첫번쩨 이미지의 창도 강제종료 메세지 창형식으로 변경, 2번이미지이 메세지창 제거
gui_windows(88).py
Python
이거 다시 분석해서 패치파일 만들어줘

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_2.txt | 기준일: 2026-06-07 | 수정시각: 2026-06-09 20:07:50 | 분류: 대화히스토리]
gui_windows(92).py
Python
상태가 자동으로 변환이 안된다...신한지주는 청산시간잉 아닌데 청산이 활성화 되어서 시간이 지났는데 바뀜이 없어
gui_windows(93).py
Python
이거 분석해서 수정패치줘
패치를 했는데 이상황이다...
안돼.....지금 시간확인해서 이 시간에 보유가 있어도 청산정지..이건 그냥 거토관리로 보내야지

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_2.txt | 기준일: 2026-06-07 | 수정시각: 2026-06-09 20:07:50 | 분류: 대화히스토리]
현재 이미지에서 시작은 운영상태, 상태는 감시대기, 방식은 루틴으로 나와있는데 감시/대기는 방식 배경에 비활성 회색 표시를 해줘.
프로그램 재시작을 했는데 왜 또 운영중 종목이있냐고??
내가 직전에 패시 시켰던거 다 삭제 해버렸냐?
gui_windows(96).py
Python
분석 다시 정밀하게 해서 기능 패치 만들어줘
방식 비 활성화 적용 못해?

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_2.txt | 기준일: 2026-06-07 | 수정시각: 2026-06-09 20:07:50 | 분류: 대화히스토리]
gui_windows(97).py
Python
아니 시발개새끼야 방식에 운영중이고 감시 대기 상태에 비활성, 종료상태면 감시/대기 비활성, 방식 비활성. 이게 안돼?

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_2.txt | 기준일: 2026-06-07 | 수정시각: 2026-06-09 20:07:50 | 분류: 대화히스토리]
gui_windows(101).py
Python
네 임의로 "루틴"을 "루틴마감"으로 수정한거잔아? 다시 전체 토씨하나 빼지말고 파악해서 다시 분석해
gui_windows(102).py
Python
다시분석해서 준비 돼면 패치 만들어

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_2.txt | 기준일: 2026-06-07 | 수정시각: 2026-06-09 20:07:50 | 분류: 대화히스토리]
gui_windows(110).py
Python
대충 정리는 했는데 이거 종목행에 마우스 위치하면 "코드/종목명/현재위치/검토위치/검토원인/발생시간" 형식의 상세 정보를 노출해주는거 가능한가?
이렇게 나온다...현재 검토종목관리 창에 표시 정보 외에 더필요한 정보가 있나?
image(410).png
image(411).png

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_2.txt | 기준일: 2026-06-07 | 수정시각: 2026-06-09 20:07:50 | 분류: 대화히스토리]
gui_windows(111).py
Python
정보표시가 이건 더 보기 힘드네. 다시 원래대로 해줘.보유나 미수,미도는 우측 정렬로 해줘야 보기 편할듯. 컬럼 간격조정 해놓은거야
보구버튼 기능 구현 하자

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_2.txt | 기준일: 2026-06-07 | 수정시각: 2026-06-09 20:07:50 | 분류: 대화히스토리]
image(414).png
image(415).png
image(416).png
image(417).png
image(418).png
gui_windows(112).py
Python
문제 없으며 안정성 해결하자
gui_windows(113).py
Python
정밀하게 분석해보고 문제 없으면 패치 줘
확인
image(421).png
image(422).png
조기 마감 상태가 안풀린다. 왜?
config(2).json
파일
orders(2).json
파일
state(2).json
파일
하이닉스꺼다
조기마감이 안먹어
gui_windows(114).py
Python
다시 분석 패치줘
image(424).png
image(425).png
image(426).png
state_policy(14).py
Python
gui_windows(115).py
Python
config(3).json
파일
orders(3).json
파일
state(3).json
파일
image(427).png
image(428).png
image(429).png
안돼

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_2.txt | 기준일: 2026-06-07 | 수정시각: 2026-06-09 20:07:50 | 분류: 대화히스토리]
gui_windows(118).py
Python
컬럼 넓이 조정했어..그런데 종목 가운데 정렬 하려는데 파일 파악부터해

[출처: 구조개선_작업로그_v20_9_3ah_step41_운영환경설정_UI정비.txt | 기준일: 2026-06-07 | 수정시각: 2026-06-07 07:41:38 | 분류: 구현로그/검증보고]
# 구조개선_작업로그_v20_9_3ah_step41_운영환경설정_UI정비
## Step41
작업명:
운영환경설정 UI 정비
기준 파일:
gui_windows_88_align_manual_liquidation_checkbox.py
---
## 작업 배경

[출처: 마스터스펙\MASTER_SPEC_v1.2_갱신메모_v2026_06_07.txt | 기준일: 2026-06-07 | 수정시각: 2026-06-07 07:41:34 | 분류: 갱신문서]
# MASTER_SPEC_v1.2_갱신메모_v2026_06_07
## 1. 문서 지위
MASTER_SPEC_v1.2_structure_phase2는 최신 기준 문서로 유지한다.
이번 세션에서 별도 마스터스펙 전체 교체는 하지 않는다.
단, 아래 내용은 v1.2에 추가 반영해야 할 메모이다.
---
## 2. 추가 반영 필요 항목
### 2.1 운영환경설정 UI 확정
운영환경설정 UI가 실사용 가능 수준으로 정리되었다.

[출처: 운영환경설정_UI_확정본_v1.txt | 기준일: 2026-06-07 | 수정시각: 2026-06-07 07:41:30 | 분류: 운영정책]
# 운영환경설정_UI_확정본_v1
## 1. 문서 목적
이 문서는 운영환경설정 창의 최종 UI 배치 기준을 기록한다.

[출처: 운영환경설정_UI_확정본_v1.txt | 기준일: 2026-06-07 | 수정시각: 2026-06-07 07:41:30 | 분류: 운영정책]
1. 이미지 재생성 방식 금지.
2. 실제 PyQt 코드 수정으로만 반영.
3. 1번, 2번 영역은 현재 확정 상태이므로 불필요한 수정 금지.
4. 3~6번 체크박스는 체크박스 사각형 위치 기준으로 정렬.
5. 텍스트 시작점이 아니라 체크박스 위치가 기준이다.
6. 익절/손절 입력칸은 익절/손절 옵션 소속으로 보이게 가깝게 배치.
7. 이월 위치는 각 행의 의미 기준에 맞춘다.
---
## 3. 1번 운영시간 설정

[출처: 운영환경설정_UI_확정본_v1.txt | 기준일: 2026-06-07 | 수정시각: 2026-06-07 07:41:30 | 분류: 운영정책]
확정 사항:
- 6번 시장가 체크박스는 5번 현재가 체크박스와 같은 열
- 6번 현재가 체크박스는 5번 익절/손절 체크박스와 같은 열
- 6번 이월은 6번 시장가와 6번 현재가 사이 거리와 같은 간격으로 오른쪽 배치
- 6번 이월은 4/5번 이월과 억지 정렬하지 않는다
---
## 9. 남은 UI 관련 보류
현재는 실사용 가능 수준.
추후 실제 사용 중에만 아래 항목을 조정한다.
- 1~2px 단위 미세조정
- 입력칸 폭 조정
- 버튼 폭 조정
- 행 높이 조정
- 폰트 크기 미세조정
---
## 10. 다음 검증 항목
UI 배치보다 저장/불러오기 검증이 우선.

[출처: 중요결정사항_확정본_v2026_06_07_상세판.txt | 기준일: 2026-06-07 | 수정시각: 2026-06-07 07:41:24 | 분류: 기타문서/자료]
최신 코드 기준:
gui_windows_88_align_manual_liquidation_checkbox.py
최신 문서 기준:
MASTER_SPEC_v1.2_structure_phase2
작업 단계:
운영환경설정 UI 정렬 완료
저장/불러오기 검증 전 단계
---
## 2. 프로그램 재시작 정의
다음 상황은 동일한 복구/재판정 프로세스로 취급한다.
- 프로그램 재실행
- 강제종료 후 재실행
- 긴급정지 후 복구
원칙:
기존 상태를 그대로 자동복구하지 않는다.
현재 조건을 다시 계산한다.
---
## 3. 복구 정책
재시작 또는 긴급정지 복구 시 확인할 것:

[출처: 작업재개요약서_v2026_06_07_UI최종반영판.txt | 기준일: 2026-06-07 | 수정시각: 2026-06-07 07:41:20 | 분류: 작업재개요약]
# 작업재개요약서_v2026_06_07_UI최종반영판
## 1. 프로젝트 개요
프로젝트명:
키움 OpenAPI 기반 Windows GUI 자동매매 시스템
현재 단계:
구조개선 2차 정책 반영 이후, 운영환경설정 UI 정비 완료 단계

[출처: 작업재개요약서_v2026_06_07_UI최종반영판.txt | 기준일: 2026-06-07 | 수정시각: 2026-06-07 07:41:20 | 분류: 작업재개요약]
현재 최신 기준 문서:
- MASTER_SPEC_v1.2_structure_phase2
- 구조개선_작업로그_v20_9_3ag_step38_40
- 운영환경설정_UI_확정본_v1
- 중요결정사항_확정본_v2026_06_07

[출처: 작업재개요약서_v2026_06_07_UI최종반영판.txt | 기준일: 2026-06-07 | 수정시각: 2026-06-07 07:41:20 | 분류: 작업재개요약]
주의:
새 창에서 이어갈 때는 gui_windows_88_align_manual_liquidation_checkbox.py를 기준 파일로 사용한다.
이전 gui_windows_83~87 패치는 중간 시행착오 버전으로만 취급한다.
---
## 2. 현재 작업 완료 판정
운영환경설정 창 UI 정렬 작업은 실사용 가능 수준까지 완료.
현재 단계에서는 1~2px 단위 미세조정보다 저장/불러오기 검증이 더 중요하다.
UI 작업은 일단 중단하고, 다음 작업은 기능 검증으로 넘어간다.
---
## 3. 운영환경설정 UI 완료 내용
### 3.1 1번 운영시간 설정

[출처: 작업재개요약서_v2026_06_07_UI최종반영판.txt | 기준일: 2026-06-07 | 수정시각: 2026-06-07 07:41:20 | 분류: 작업재개요약]
정렬 기준:
- 6번 시장가 체크박스는 5번 현재가 체크박스 열과 일치
- 6번 현재가 체크박스는 5번 익절/손절 체크박스 열과 일치
- 6번 이월 체크박스는 6번 시장가와 현재가 사이 거리와 같은 간격으로 오른쪽 배치
- 6번 이월은 4/5번 이월과 억지 정렬하지 않음
판정:
완료.
---
## 4. 다음 작업 우선순위
### 1순위: 운영환경설정 저장/불러오기 검증

[출처: 작업재개요약서_v2026_06_07_UI최종반영판.txt | 기준일: 2026-06-07 | 수정시각: 2026-06-07 07:41:20 | 분류: 작업재개요약]
검증 방식:
1. 운영환경설정 창 열기
2. 값을 변경
3. 저장
4. 프로그램 종료
5. 재실행
6. 운영환경설정 다시 열기
7. 값이 유지되는지 확인
---
### 2순위: 시간정책 재판정 누락 검증
남은 핵심 버그:
시작 직후 시간정책 재판정 1회 누락

[출처: 작업재개요약서_v2026_06_07_UI최종반영판.txt | 기준일: 2026-06-07 | 수정시각: 2026-06-07 07:41:20 | 분류: 작업재개요약]
필수:
1. gui_windows_88_align_manual_liquidation_checkbox.py
2. 작업재개요약서_v2026_06_07_UI최종반영판.txt
3. 중요결정사항_확정본_v2026_06_07.txt
4. 운영환경설정_UI_확정본_v1.txt
5. MASTER_SPEC_v1.2_structure_phase2_갱신메모.txt

[출처: 작업재개요약서_v2026_06_07_UI최종반영판.txt | 기준일: 2026-06-07 | 수정시각: 2026-06-07 07:41:20 | 분류: 작업재개요약]
"이 파일들을 기준으로 이어서 작업하자. 최신 기준 코드는 gui_windows_88_align_manual_liquidation_checkbox.py이고, 다음 작업은 운영환경설정 저장/불러오기 검증이다."
---
END

[출처: 작업재개요약서_v2026_06_07.txt | 기준일: 2026-06-07 | 수정시각: 2026-06-07 07:25:22 | 분류: 작업재개요약]
현재 기준 파일:
gui_windows_88_align_manual_liquidation_checkbox.py
현재 상태
- 운영환경설정 UI 정비 작업 진행
- UI 정렬/배치 작업 중심
- 실사용 가능 수준 도달

[출처: 작업진행상황대화히스토리.txt | 기준일: 2026-06-06 | 수정시각: 2026-06-06 23:18:38 | 분류: 대화히스토리]
kiwoom_auto(1).zip
ZIP 아카이브
이제는 “분석만 하는 단계”보다
“작은 실전 검증 시작 단계”
압축파일형태로 일괄로 주면 위험해
폴더에 넣기 완료
gui_windows(4).py
Python
분석해
여기 메세지 창은 조금 수정이필요 하다. 구조개선 끝나고 수정하자...확인부탁
이전에 주문 상태창 기능 구현 했던가??
gui_order_utils(9).py
Python
gui_windows(13).py
Python
runtime_io.py
Python
검토
아...화면 보니까 기억난다...
051910_LG화학.zip
ZIP 아카이브
구조 확인 해봐
원래 파일의 코드 줄수가 몇개였지?
image(36).png
image(37).png
이 창이 맞나?
검색식은 정상 구현이안되어 있는상황이였는데
위 파일 업데이트?
gui_windows(26).py
Python

[출처: 작업진행상황대화히스토리.txt | 기준일: 2026-06-06 | 수정시각: 2026-06-06 23:18:38 | 분류: 대화히스토리]
잘 되는듯. 그러나 하단 연결종목 영역의 상태헤더에 해당하는 컬럼들의 표시 상태가 신호등/색상 표현을 하지 않고 있다...
gui_windows(34).py
Python
image(51).png
image(52).png

[출처: 작업진행상황대화히스토리.txt | 기준일: 2026-06-06 | 수정시각: 2026-06-06 23:18:38 | 분류: 대화히스토리]
-----------------------------------------------------------------
kiwoom_auto.zip
ZIP 아카이브
structure_phase1_final_docs(1).zip
ZIP 아카이브
UX_UI_보류항목_v20_9_3ad(1).md
파일
구조개선_1차완료_판정서_v20_9_3ad(1).md
파일
구조개선_작업로그_v20_9_3ad_step22_28_append(1).md
파일

[출처: 작업진행상황대화히스토리.txt | 기준일: 2026-06-06 | 수정시각: 2026-06-06 23:18:38 | 분류: 대화히스토리]
image(53).png
image(54).png
선택루틴 연결종목 에 보여 주는 정보가 더 필요한듯해...영역이 넓어서 허전하다. 어떤 정보를 더 추가 할까?
gui_windows(35).py
Python
035720_카카오.zip
ZIP 아카이브
현재 감시중인 종목은 삭제/변경이 가능한가?

[출처: 작업진행상황대화히스토리.txt | 기준일: 2026-06-06 | 수정시각: 2026-06-06 23:18:38 | 분류: 대화히스토리]
C:\Users\JIN KWANG CHUL\Documents\kiwoom_auto> & "C:\Users\JIN KWANG CHUL\AppData\Local\Programs\Python\Python311-32\python.exe" "c:/Users/JIN KWANG CHUL/Documents/kiwoom_auto/gui_main.py"
Traceback (most recent call last):
 File "c:\Users\JIN KWANG CHUL\Documents\kiwoom_auto\gui_windows.py", line 1680, in load_selected_routine_stocks
 summary = self.runtime_assigned_stock_summary(routine_dir, code, name)
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 File "c:\Users\JIN KWANG CHUL\Documents\kiwoom_auto\gui_windows.py", line 1785, in runtime_assigned_stock_summary
 status = routine_status_display_text(raw_status)
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
TypeError: routine_status_display_text() missing 1 required positional argument: 'status'
PS C:\Users\JIN KWANG CHUL\Documents\kiwoom_auto>
gui_windows(39).py
Python
structure_phase1_final_docs(2).zip
ZIP 아카이브
UX_UI_보류항목_v20_9_3ad(2).md
파일
구조개선_1차완료_판정서_v20_9_3ad(2).md
파일
구조개선_작업로그_v20_9_3ad_step22_28_append(2).md
파일

[출처: 작업진행상황대화히스토리.txt | 기준일: 2026-06-06 | 수정시각: 2026-06-06 23:18:38 | 분류: 대화히스토리]
이미지의 화면 시간과 운영상태를 봐바...직전에 시간을 수정해서 감시 시작을 눌러보고 별 이상이 없는건 확인했는데 시간을 원래 시간으로 돌려놓고 새로 고침을 눌려보면 마감이후의 운영방침이 적용되지않는다
gui_windows(44).py
Python
state_policy(2).py
Python
네가 마지막준 파일이다. 정밀한 검증/확인 해봐.

[출처: 작업진행상황대화히스토리.txt | 기준일: 2026-06-06 | 수정시각: 2026-06-06 23:18:38 | 분류: 대화히스토리]
심각한 오류다....시간 정책을 아무것도 자동으로 전환 되지 않아 새로 고침을 하면 그대로 이고 감시종료이후 다시 감시 시작을 해야 해당 시간에맞는 상태 표시가돼...
안된다....왜 안돼지?
gui_windows(45).py
Python
state_policy(3).py
Python
정밀 분석해서 수정해줘

[출처: 작업진행상황대화히스토리.txt | 기준일: 2026-06-06 | 수정시각: 2026-06-06 23:18:38 | 분류: 대화히스토리]
image(127).png
image(128).png
1. 시간적용은 여전히 안된다 2. 수동의 경우는 매수/수매도야하는데 적용안되2. 감시종료를 하면 감시/대기로 돌아가야 하는데 동작 안한다. 기타 다른 문제들도 있을등
gui_windows(46).py
Python
state_policy(4).py
Python
다시 정밀 파악해보고 수저해줘
뭐부터 잡아야하나???이거 그냥 안되는채로야
kiwoom_auto(4).zip
ZIP 아카이브
다시 파악해봐
기능이 잘 안돼......
이걸로 복구?
kiwoom_auto(5).zip
ZIP 아카이브
 이 압축폴더로 복구?
gui_windows(47).py
Python
state_policy(5).py
Python

[출처: 작업진행상황대화히스토리.txt | 기준일: 2026-06-06 | 수정시각: 2026-06-06 23:18:38 | 분류: 대화히스토리]
image(146).png
image(147).png
image(148).png
image(149).png
수동의 경우 시간참조기능에 문제가 있다
image(150).png
image(151).png
image(152).png
시간 에 따른 상태 표시
state_policy(7).py
Python
네가 분석해봐
gui_windows(49).py
Python
다시 분석해봐

[출처: 작업진행상황대화히스토리.txt | 기준일: 2026-06-06 | 수정시각: 2026-06-06 23:18:38 | 분류: 대화히스토리]
image(156).png
image(157).png
image(159).png
image(160).png
화면 리셋되는 문제는 그대로야
창 문제는 해결 됬지만 ..
gui_windows(50).py
Python
state_policy(8).py
Python
15s 동안 생각함
확인했다. 최신 gui_windows(50).py에는 패치가 일부만 들어가 있다.
문제 1.
load_selected_routine_stocks()에는 스크롤 보존 시작부가 들어가 있다.

[출처: 작업진행상황대화히스토리.txt | 기준일: 2026-06-06 | 수정시각: 2026-06-06 23:18:38 | 분류: 대화히스토리]
ack (most recent call last):
 File "c:\Users\JIN KWANG CHUL\Documents\kiwoom_auto\gui_windows.py", line 1054, in on_emergency_stop_clicked
 self.release_emergency_stop()
 File "c:\Users\JIN KWANG CHUL\Documents\kiwoom_auto\gui_windows.py", line 1002, in release_emergency_stop
 has_problem, reason = self.emergency_review_reason_for_stock(stock_dir)
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 File "c:\Users\JIN KWANG CHUL\Documents\kiwoom_auto\gui_windows.py", line 922, in emergency_review_reason_for_stock
 buy_pending_qty, sell_pending_qty = pending_order_side_quantities(orders)
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
TypeError: pending_order_side_quantities() missing 1 required positional argument: 'state'
PS C:\Users\JIN KWANG CHUL\Documents\kiwoom_auto>

[출처: 작업진행상황대화히스토리.txt | 기준일: 2026-06-06 | 수정시각: 2026-06-06 23:18:38 | 분류: 대화히스토리]
image(170).png
image(171).png
긴급정지/정지해제 버튼은 누름과 동시에 실행>메세지창 띄워서 기능및 종목들 취급상황을 브리핑 ok 로 단축
검토관리에 와있는 종목은 없는데?
image(173).png
image(174).png
왜 검토관리가 종목별로 다른 내용이지?
gui_schedule_utils(1).py
Python
gui_schedule_window(5).py
Python
gui_windows(53).py
Python
state_policy(10).py
Python
분석 고고

[출처: 작업진행상황대화히스토리.txt | 기준일: 2026-06-06 | 수정시각: 2026-06-06 23:18:38 | 분류: 대화히스토리]
글자가 너무작아...정규장 시작시간 뒤에 종료와 시간설정칸이 너무멀어 왜 이러냐...이러면 보기가 힘들어 검토도 어렵잔아..
이미지 생성됨
•
운영 환경 설정 화면
운영환경설정 대화상자 화면
생성된 이미지: 운영 환경 설정 화면
편집

[출처: 작업진행상황대화히스토리.txt | 기준일: 2026-06-06 | 수정시각: 2026-06-06 23:18:38 | 분류: 대화히스토리]
생성된 이미지: 운영 환경 설정 화면
생성된 이미지: 운영 환경 설정 화면
생성된 이미지: 운영 환경 설정 화면

[출처: 작업진행상황대화히스토리.txt | 기준일: 2026-06-06 | 수정시각: 2026-06-06 23:18:38 | 분류: 대화히스토리]
생성된 이미지: 운영환경설정 대화상자 화면
생성된 이미지: 운영환경설정 대화상자 화면
생성된 이미지: 운영환경설정 대화상자 화면
뭘 바꾼건데??

[출처: 작업진행상황대화히스토리.txt | 기준일: 2026-06-06 | 수정시각: 2026-06-06 23:18:38 | 분류: 대화히스토리]
이게 뭐야 ?? 개판으로 해놨어....폰트도 처음보다 작아져서 보기도 힘들고, 왜 쓸데없는 설명은 집어 넣어서 공간만 낭비하고
gui_windows(54).py
Python
아...이제 욕나올라고한다...왜 폰트 크기가 이러는거야...글자 겹치은 어쩌고...제대로 못하냐?
나랑 장난해??? 뭐가 바뀌어서????
gui_windows(55).py
Python
정밀하게 분석해서 패치 내줘
뒤창에 폰트 사이즈 보이지? 맞춰줘
많이 좋아 졌다...근데 제목폰트는 왜 이러나? 그래고 글자 잘리는 문제 해결해
생성된 이미지: 운영환경설정 대화창과 자동매매 시스템
편집
제목?
생성된 이미지: 자동매매 시스템 설정 화면
편집
이미지 생성됨
•
운영환경설정 창 인터페이스
이미지 생성됨
•
자동매매 시스템 설정 화면
이미지 생성됨
•
자동매매 시스템 설정 화면
운영환경설정 창 인터페이스
생성된 이미지: 운영환경설정 창 인터페이스
편집
자동매매 시스템 설정 화면
생성된 이미지: 자동매매 시스템 설정 화면
편집
자동매매 시스템 설정 화면
생성된 이미지: 자동매매 시스템 설정 화면
편집
gui_schedule_window(6).py
Python
이미지 생성됨
•
운영환경설정 대화창 화면
운영환경설정 대화창 화면
생성된 이미지: 운영환경설정 대화창 화면
편집
gui_windows(56).py
Python
확인해봐
제목은 해결 됬다.. 속이 다 시원하구만..근데..누락된 항목 넣어줘

[출처: 작업진행상황대화히스토리.txt | 기준일: 2026-06-06 | 수정시각: 2026-06-06 23:18:38 | 분류: 대화히스토리]
gui_windows(57).py
Python
PS C:\Users\JIN KWANG CHUL\Documents\kiwoom_auto> & "C:\Users\JIN KWANG CHUL\AppData\Local\Programs\Python\Python311-32\python.exe" "c:/Users/JIN KWANG CHUL/Documents/kiwoom_auto/gui_main.py"
Traceback (most recent call last):
 File "c:\Users\JIN KWANG CHUL\Documents\kiwoom_auto\gui_windows.py", line 4534, in open_operation_environment_settings
 dialog = OperationEnvironmentSettingsDialog(self)
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 File "c:\Users\JIN KWANG CHUL\Documents\kiwoom_auto\gui_windows.py", line 2893, in __init__
 self._connect_close_option_checks()
 File "c:\Users\JIN KWANG CHUL\Documents\kiwoom_auto\gui_windows.py", line 2929, in _connect_close_option_checks
 bind(self.auto_close_options)
 File "c:\Users\JIN KWANG CHUL\Documents\kiwoom_auto\gui_windows.py", line 2926, in bind
 cb.clicked.connect(lambda checked, current=cb, all_options=options: self._exclusive_close_option(current, all_options))
 ^^^^^^^^^^
RuntimeError: wrapped C/C++ object of type QCheckBox has been deleted
PS C:\Users\JIN KWANG CHUL\Documents\kiwoom_auto>

[출처: 작업진행상황대화히스토리.txt | 기준일: 2026-06-06 | 수정시각: 2026-06-06 23:18:38 | 분류: 대화히스토리]
이미지내 빨간색영역 삭제. 추가 시간 입력에 칸에 별도 저장 버튼 만들어서 수동운영 옵션 추가1, 추가2...에 자동 표시, 마감정책에 이월 항목 부재
이미지 생성됨
•
운영환경설정 대화상자 화면
생성된 이미지: 운영환경설정 대화상자 화면
편집
패치 만들었습니다.
gui_windows_67_extra_time_save_and_close_rollover.py
수정:
빨간 영역 삭제
추가 거래시간 좌측 제목 제거
좌측 추가1/추가2/추가3 라벨 제거
추가시간 저장 버튼 추가
추가시간 저장 시 수동운영 옵션명이 자동 반영
자동마감/조기마감 방식에 이월 추가
익절/손절 글자 잘림 완화
마감방식 체크박스 간격 축소
문법 검사 통과

[출처: 작업진행상황대화히스토리.txt | 기준일: 2026-06-06 | 수정시각: 2026-06-06 23:18:38 | 분류: 대화히스토리]
추가시간 저장 자리는 "거래시간 추가" 제목으로 대체, 추가시간 이름 저장 버튼은그냥 "저장" 으로만 만들어서 이름칸 바로 뒤에 배치 각 칸에 1개씩 설치, 구간명은 삭제. 마감설정에 "방식" 문구 삭제. 청산설정에 정규장 종료 시간설정 마우스로 콤보박스 설정 5분단위 100분 세팅, <--이번은 이정도만 변경해보자
이미지 생성됨
•
운영환경설정 창 화면
운영환경설정 창 화면
생성된 이미지: 운영환경설정 창 화면
편집

[출처: 작업진행상황대화히스토리.txt | 기준일: 2026-06-06 | 수정시각: 2026-06-06 23:18:38 | 분류: 대화히스토리]
편집된 이미지
거래시간 추가는 제목 헤더로 쓸거고 그아래 배치를 추가시간1 [저장] 이형식이고 청산설정에 숫자만 넣어주고 "분전" 이라는 문구는 그냐 하던대로 해
이미지 생성됨
•
운영 환경 설정 화면
운영 환경 설정 화면
생성된 이미지: 운영 환경 설정 화면
편집
image(208).png
거래시간 추가는 추가시간 항목의 제목헤더라니까....

[출처: 작업진행상황대화히스토리.txt | 기준일: 2026-06-06 | 수정시각: 2026-06-06 23:18:38 | 분류: 대화히스토리]
image(209).png
저장 버튼 넓이가 너무 넓어 2/3 크기로 줄여줘, 추가시간 입력칸 앞에 ◉ 넣고, 해당 열을 왼쪽으로 조금 이동시켜주. 헤더는 추가시간칸과 저장버튼의 총 넑이의 중간에 오게 배치해줘. 시작, 종료 도 해당 내용의 총넓이에 중앙정렬
이미지 생성됨
•
운영환경설정 다이얼로그 창
이미지 생성됨
•
운영환경설정 창 화면
운영환경설정 다이얼로그 창
생성된 이미지: 운영환경설정 다이얼로그 창
편집
운영환경설정 창 화면
생성된 이미지: 운영환경설정 창 화면
편집

[출처: 작업진행상황대화히스토리.txt | 기준일: 2026-06-06 | 수정시각: 2026-06-06 23:18:38 | 분류: 대화히스토리]
생성된 이미지: 운영환경설정 창 화면
생성된 이미지: 운영환경설정 창 화면
생성된 이미지: 운영환경설정 창 화면

[출처: 작업진행상황대화히스토리.txt | 기준일: 2026-06-06 | 수정시각: 2026-06-06 23:18:38 | 분류: 대화히스토리]
생성된 이미지: 운영 환경 설정 화면
생성된 이미지: 운영 환경 설정 화면
생성된 이미지: 운영 환경 설정 화면
image(210).png
image(212).png
이렇게 만들어줘

[출처: 작업진행상황대화히스토리.txt | 기준일: 2026-06-06 | 수정시각: 2026-06-06 23:18:38 | 분류: 대화히스토리]
image(227).png
image(228).png
운영 시간과 ATS 항목 사이에 약간의 위아래 공간과 경계선을 넣어줘
이미지 생성됨
•
운영환경설정 - 거래 시스템 설정 화면
운영환경설정 - 거래 시스템 설정 화면
생성된 이미지: 운영환경설정 - 거래 시스템 설정 화면
편집
분석해줘

[출처: 작업진행상황대화히스토리.txt | 기준일: 2026-06-06 | 수정시각: 2026-06-06 23:18:38 | 분류: 대화히스토리]
잘됐어. ATS 설정에서 [저장] 버튼의 좌우가 너무 빡빡해...아주 조금만 여유를 줘. 그리고 3번에 사용시간 문구도 삭제 해주고
이미지 생성됨
•
운영환경설정 대화창 화면
이미지 생성됨
•
운영환경설정 화면 구성
생성된 이미지: 운영환경설정 화면 구성
편집
생성된 이미지: 운영환경설정 대화창 화면
편집
패치 만듭니다.
이번 수정은 2개만 적용합니다.
8s 동안 생각함
패치 만들었습니다.
gui_windows_82_save_button_manual_label_fix.py
수정:
ATS 저장 버튼 폭 약간 확대
저장 버튼 열 여유 추가
3번 사용시간 문구 삭제
문법 검사 통과
이 창에 체크박스도 빨간색 원으로 묶은 것끼리 열을 일치 시켜줘
이미지 생성됨
•
운영환경설정 대화상자 화면
운영환경설정 대화상자 화면
생성된 이미지: 운영환경설정 대화상자 화면
편집
이렇게 적용가능해?
이미지 생성됨
•
운영환경설정 대시보드 화면
운영환경설정 대시보드 화면
생성된 이미지: 운영환경설정 대시보드 화면
편집

[출처: 작업진행상황대화히스토리.txt | 기준일: 2026-06-06 | 수정시각: 2026-06-06 23:18:38 | 분류: 대화히스토리]
지금 체크박스 와 체크박스의 거리가 왜 이런거지? 빨간색으로 표시한 공간을 동일 넓이로 조정해줘, 첫체크박스와 두번째 채크박스의 거리가 얼마야?
gui_windows(58).py
Python

[출처: 작업진행상황대화히스토리.txt | 기준일: 2026-06-06 | 수정시각: 2026-06-06 23:18:38 | 분류: 대화히스토리]
3번의 "청산 정책적용", 4,5,번의 "이월"을 뒤로 더 체크박스 거리의 40%정도를 이동 시켜줘서 체크박스열을 같은위치에 놔줘, 3번의 청산정책 적용 체크박스 앞에 "/"를 넣어 줘. 6번의 시장가 체크박스는 5번의 현재가 체크박스와 일치, 익절/손절체크박스와 6번의 현재가 일치해주고 시장가 체크박스와 현재가 체크박스의 거리만큼 띄워서 이월 체크박스 위치.
이미지 생성됨
•
운영환경설정 창 화면
운영환경설정 창 화면
생성된 이미지: 운영환경설정 창 화면
편집
image(235).png
왜 체크박스간 거리가 좁혀졌냐고...욕한다...

[출처: 작업진행상황대화히스토리.txt | 기준일: 2026-06-06 | 수정시각: 2026-06-06 23:18:38 | 분류: 대화히스토리]
gui_windows(59).py
Python
3번의 "청산 정책적용", 4,5,번의 "이월"을 뒤로 더 체크박스 거리의 40%정도를 이동 시켜줘서 체크박스열을 같은위치에 놔줘, 3번의 청산정책 적용 체크박스 앞에 "/"를 넣어 줘. 6번의 시장가 체크박스는 5번의 현재가 체크박스와 일치, 익절/손절체크박스와 6번의 현재가 일치해주고 시장가 체크박스와 현재가 체크박스의 거리만큼 띄워서 이월 체크박스 위치.

[출처: 작업재개참조_운영시간정책재정의_v1.md | 기준일: 2026-06-06 | 수정시각: 2026-06-06 06:47:12 | 분류: 작업재개요약]
```text
환경설정
└─ 운영시간표
 ├ 정규장 시작/종료
 ├ 시간운영 전역 매수 시작/종료
 └ 추가시장1~3 시작/종료

[출처: 시간정책_코드수정계획_v1.md | 기준일: 2026-06-05 | 수정시각: 2026-06-06 06:47:04 | 분류: 운영정책]
```python
def decide_status_on_start(config: dict, now_dt=None) -> str:
 """감시시작 시 저장할 내부 상태 반환"""

[출처: 운영시간정책_확정안_v1.md | 기준일: 2026-06-05 | 수정시각: 2026-06-06 06:46:58 | 분류: 운영정책]
작성일: 2026-06-05
목적: 시간정책 패치 실패를 중단하고, 환경설정/종목설정/상태판정 기준을 먼저 고정한다.
---
## 1. 핵심 결론
시간정책은 `gui_windows.py` 안에서 직접 처리하지 않는다.
구조는 아래처럼 분리한다.

[출처: 운영시간정책_확정안_v1.md | 기준일: 2026-06-05 | 수정시각: 2026-06-06 06:46:58 | 분류: 운영정책]
```text
환경설정 = 시간표 관리
종목설정 = 해당 시간표를 사용할지 결정
상태정책 = 현재 상태명을 표시명으로 변환
시간판정엔진 = 현재시간 + 종목설정으로 다음 상태 산출
```
---
## 2. 환경설정 역할
환경설정은 시간표만 관리한다.
### 2-1. 정규장 시간표

[출처: 마스터스펙\MASTER_SPEC_v1.2_structure_phase2.txt | 기준일: 2026-06-05 | 수정시각: 2026-06-05 14:04:32 | 분류: MASTER_SPEC]
# MASTER_SPEC v1.2 - Structure Phase 2
프로젝트명: 키움 OpenAPI 기반 Windows GUI 자동매매 시스템
버전: v1.2
작성일: 2026-06-05
문서 유형: 구조개선 2차 정책 반영 최상위 설계서

[출처: 마스터스펙\MASTER_SPEC_v1.1_윈도우창버전_키움자동매매.txt | 기준일: 2026-05-31 | 수정시각: 2026-05-31 14:36:24 | 분류: MASTER_SPEC]
# MASTER_SPEC v1.1 - Windows GUI Edition
프로젝트명 : 키움 OpenAPI 기반 자동매매 시스템
버전 : v1.1
작성일 : 2026-05-31
문서 유형 : Windows GUI 기반 확정 설계서

3. 전체 폴더/파일 구조
==================
[출처: 마스터스펙\MASTER_SPEC_최신정리본_2026-07-03.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:40:50 | 분류: MASTER_SPEC]
작성 기준
- 작성일: 2026-07-03
- 검토 위치: C:\Users\JIN KWANG CHUL\Documents\docs\마스터스펙
- 최신 통합 기준 폴더: MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED
- 최신 원본 압축: C:\Users\JIN KWANG CHUL\Documents\docs\MASTER_SPEC_추가갱신_026-07-03.zip
- 목적: 현재 폴더에 흩어진 MASTER_SPEC 계열 자료 중 최신 정본 기준, 참조 순서, 구현 금지선, 색인별 통합 위치를 명확히 고정한다.

[출처: 마스터스펙\MASTER_SPEC_최신정리본_2026-07-03.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:40:50 | 분류: MASTER_SPEC]
==================================================
1. 최신본 판정
==================================================
현재 폴더 기준 최신 정본은 아래 폴더이다.
MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED

[출처: 마스터스펙\MASTER_SPEC_최신정리본_2026-07-03.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:40:50 | 분류: MASTER_SPEC]
이 폴더는 2026-07-03 추가갱신 압축파일의 TXT 문서 76개를 색인별로 통합하고, 중복 문단/섹션 16개를 제거한 결과물이다.

[출처: 마스터스펙\MASTER_SPEC_최신정리본_2026-07-03.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:40:50 | 분류: MASTER_SPEC]
이전 통합 시도 폴더:
- MASTER_SPEC_통합본_2026-07-03
- MASTER_SPEC_통합본_2026-07-03_20260703_152122
- MASTER_SPEC_통합본_2026-07-03_FINAL
위 폴더들은 중간 산출물로 보고, 최신 정본 참조에서는 FINAL_REVISED만 우선한다.

[출처: 마스터스펙\MASTER_SPEC_최신정리본_2026-07-03.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:40:50 | 분류: MASTER_SPEC]
==================================================
2. 현재 폴더 자료의 역할 구분
==================================================
정본 기준:
- MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED
최신 입력 원본:
- MASTER_SPEC_추가갱신_026-07-03.zip

[출처: 마스터스펙\MASTER_SPEC_최신정리본_2026-07-03.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:40:50 | 분류: MASTER_SPEC]
3. 03_Architecture_merged.txt
 - 계층 구조, 의존성 방향, Controller 책임, 금지 호출을 확인한다.

[출처: 마스터스펙\MASTER_SPEC_최신정리본_2026-07-03.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:40:50 | 분류: MASTER_SPEC]
현재 단계에서 금지:
- SendOrder 호출
- QAxWidget SendOrder 호출
- send_order_stub을 실주문 대체 경로로 사용
- ADAPTER_READY 상태 생성
- REAL_READY -> ADAPTER_READY 자동 전이
- REAL_READY -> ORDER_QUEUED 자동 전이
- Adapter Preview만으로 ORDER_QUEUED 전환
- order_queue.json을 preview 함수에서 수정
- execution_enabled=true 자동 승격
- Controller 없이 GUI/Timer가 하위 Engine/Gate/Adapter를 직접 엮는 구조
- Chejan 이벤트에서 SendOrder 호출
- SendOrder 성공만으로 Position 변경
- runtime 파일 손상/불일치를 자동 정상 처리

[출처: 마스터스펙\MASTER_SPEC_최신정리본_2026-07-03.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:40:50 | 분류: MASTER_SPEC]
혼선 방지:
- FINAL_REVISED보다 오래된 통합 폴더는 최신 정본으로 인용하지 않는다.
- "FINAL"보다 "FINAL_REVISED"를 우선한다.
- 압축파일 내부 원본은 근거 자료이며, 실무 참조는 색인별 통합본을 우선한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\90_Misc_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
[데이터 구조]
- Runtime Data Model
- Execution Request
- Order Lock
- Request Hash
- Position Model
- Close/Liquidation Model

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\90_Misc_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
[운영 구조]
- Final Execution Guard
- Review Management
- Recovery Controller
- Audit Log
[실주문 이후]
- Chejan / Fill Lifecycle

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\90_Misc_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
구조 변경 시 확인
- 영향받는 MASTER_SPEC
- 영향받는 Runtime
- 영향받는 테스트
- 영향받는 운영 정책
- 영향받는 Recovery

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\90_Misc_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
- 모든 구현은 상위 설계와 연결되어야 한다.
- 테스트 없는 구현은 추적성이 불완전하다.
- 문서 없는 구조 변경은 추적 대상에서 제외한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\05_Operations_Policy_Governance_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
6. 금지
==================================================
- 설계 없이 구현
- 테스트 없이 릴리즈
- 문서 없이 구조 변경
- 운영 중 Runtime 직접 수정

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\05_Operations_Policy_Governance_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
5. 버전 관리
- 기능 단위로 버전 증가
- Runtime 구조 변경은 별도 기록
- 구조 변경은 ADR 및 MASTER_SPEC와 함께 관리

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\05_Operations_Policy_Governance_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
Level 1 : 개념 단계
==================================================
특징
- 아이디어 중심
- 구조 미정
- 문서 부족
- 테스트 체계 없음

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\05_Operations_Policy_Governance_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
A. 아키텍처
- 책임 분리
- State Machine
- Runtime 구조
- Controller 구조
- Boundary 구조

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\05_Operations_Policy_Governance_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
6. 유지보수 금지
- 원인 분석 없는 수정
- 테스트 없는 수정
- 문서 없는 구조 변경
- Runtime 직접 편집으로 문제 해결

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\05_Operations_Policy_Governance_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
구조 변경 시 확인 대상
- Runtime
- State Machine
- Controller
- Recovery
- Review
- Audit
- Test
- Documentation

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\05_Operations_Policy_Governance_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
4. Runtime 품질
- JSON 구조 유지
- ID 참조 무결성 유지
- 손상 데이터 자동 정상화 금지
5. 운영 품질
- 실주문은 단일 진입점 유지
- 검토관리 우회 금지
- Recovery 검증 생략 금지

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
5. Runtime 규칙
==================================================
- JSON 구조 임의 변경 금지.
- 필드 삭제보다 신규 필드 추가 우선.
- ID는 생성 후 변경 금지.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
6. 금지 사항
==================================================
- SendOrder 직접 호출
- GUI에서 Engine 직접 수정
- Preview에서 Runtime 변경
- 테스트 없는 구조 변경
- Controller 우회

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
목적
- 현재 설계 완료 상태를 기준으로 실제 구현 순서를 고정한다.
- 구현 순서 변경으로 인한 구조 훼손을 방지한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
- 아키텍처 변경
- Runtime 구조 변경
- State Machine 변경
- 실주문 안전성 영향
- ADR 변경

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
4. 안전성 확인
==================================================
□ SendOrder 미연결
□ Preview 경로 유지
□ execution_enabled 자동 변경 없음
□ operator_confirmed 자동 변경 없음

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
2. 권장 계층 구조
==================================================
Layer 0. GUI / Timer / CLI
- 사용자 조작, 타이머, 수동 실행 진입점.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
금지:
- Domain Engine을 직접 다단계 호출하는 구조의 확대.
- SendOrder 직접 호출.
- order_queue 상태 직접 조작.
- execution_enabled=true 직접 변경, 별도 승인 설계 전까지.
- operator_confirmed=true 직접 변경, 별도 guard UI 설계 전까지.
- REAL_READY -> ORDER_QUEUED 자동 전환.
- KiwoomOrderExecutor 직접 호출.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
현재 예외/과도기:
- 기존 gui_auto_trade_timer.py는 signal_probe_only 흐름에서 consumer/order_queue/approval 일부를 직접 호출할 수 있다.
- 장기적으로 Controller Layer를 통해 호출하도록 전환 권장.
- 기존 구조는 즉시 대규모 변경하지 않는다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
Controller 공통 허용:
- 하위 Domain Engine/Gate/Policy 호출.
- Runtime 파일 경로 전달.
- 단건/수동/자동 호출 경계 관리.
- 결과 summary 구성.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
18. 향후 리팩토링 방향
==================================================
1단계:
- 현재 구조 유지.
- 의존성 문서 기준으로 신규 작업 검토.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
1. 이 모듈이 호출해도 되는 대상인가?
2. 이 모듈이 변경해도 되는 status인가?
3. Preview 함수가 파일을 저장하지 않는가?
4. 실행 판단과 메타데이터가 섞이지 않았는가?
5. 하위 모듈이 상위 모듈을 호출하지 않는가?
6. SendOrder 접근 경로가 하나로 제한되는가?
7. execution_enabled/operator_confirmed를 임의 변경하지 않는가?
8. source_ui_path/setting_a/b/c를 추정하지 않는가?
9. 새 상태값이 문서 승인 없이 추가되지 않았는가?
10. Timer/GUI 자동 연결이 실주문 위험을 만들지 않는가?

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
목적:
- 각 모듈 호출 순서를 관리한다.
- 상태 전이 주체를 명확히 한다.
- 자동 실행과 수동 실행 경계를 분리한다.
- Timer/GUI/CLI가 직접 Engine을 막 호출하지 않도록 한다.
- 향후 SendOrder, 체결 이벤트, 취소/정정, 재시도까지 일관된 구조로 확장할 수 있게 한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
3. Controller Layer 권장 구조
==================================================
권장 Controller 후보:

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
현재는 기존 구조가 있으므로 즉시 전환하지 않는다.
신규 실주문 관련 흐름부터 Controller 중심으로 설계한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
목적
- 새로운 기능을 구현하거나 구조를 변경하기 전에 반드시 확인해야 하는 설계 검토 항목을 정의한다.
- 변경으로 인해 기존 아키텍처가 훼손되는 것을 방지한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
3. 데이터 검토
==================================================
□ 기존 ID 체계를 유지하는가
□ Runtime 구조를 깨지 않는가
□ Recovery 가능한 구조인가
□ Audit 추적이 가능한가

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
7. 문서 우선
==================================================
- 구조 변경은 문서 기준을 먼저 확정한다.
- 구현 후 문서를 맞추는 방식은 지양한다.
- 문서와 구현이 다르면 문서를 기준으로 검토한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
주요 구조
{
 "version": 1,
 "updated_at": "datetime",
 "orders": []
}

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
주요 구조 후보
{
 "version": 1,
 "updated_at": "datetime",
 "locks": [
 {
 "lock_id": "string",
 "order_id": "string",
 "source_signal_id": "string",
 "execution_id": "optional",
 "request_hash": "optional",
 "code": "003550",
 "side": "BUY|SELL",
 "account_no": "string",
 "status": "active|released|error",
 "created_at": "datetime",
 "released_at": null,
 "reason": "string"
 }
 ]
}

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
주요 구조 후보
{
 "version": 1,
 "updated_at": "datetime",
 "executions": [
 {
 "execution_id": "string",
 "order_id": "string",
 "source_signal_id": "string",
 "lock_id": "string",
 "request_hash": "string",
 "status": "REQUEST_PREPARED",
 "created_at": "datetime",
 "requested_at": null,
 "account_no": "string",
 "code": "003550",
 "side": "BUY|SELL",
 "quantity": 0,
 "price": 0.0,
 "order_type": "string",
 "hoga": "string",
 "request_preview": {},
 "guard_snapshot": {},
 "operator_confirmed": true,
 "execution_enabled": true,
 "kiwoom_order_no": null,
 "api_result_code": null,
 "api_message": null,
 "error": null
 }
 ]
}

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
주요 구조 후보
{
 "version": 1,
 "updated_at": "datetime",
 "items": [
 {
 "review_id": "string",
 "created_at": "datetime",
 "status": "OPEN|RESOLVED|IGNORED",
 "severity": "INFO|WARN|ERROR|CRITICAL",
 "reason": "string",
 "related_signal_id": null,
 "related_order_id": null,
 "related_execution_id": null,
 "related_fill_id": null,
 "related_position_id": null,
 "request_hash": null,
 "kiwoom_order_no": null,
 "details": {}
 }
 ]
}

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
주요 구조 후보
{
 "version": 1,
 "updated_at": "datetime",
 "close_history": [
 {
 "close_history_id": "string",
 "position_id": "string",
 "close_order_id": "string",
 "close_fill_ids": [],
 "code": "003550",
 "reason": "string",
 "close_type": "liquidation|signal_sell|manual|auto_close",
 "requested_at": "datetime",
 "completed_at": "datetime",
 "realized_pnl": 0.0,
 "status": "CLOSED"
 }
 ]
}

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
현재 단계에서 금지:
- 새 runtime JSON 파일 생성
- 기존 파일 구조 대규모 변경
- execution_id 자동 생성 구현
- kiwoom_order_no 저장 구현
- fills/positions/review/audit 신규 구현
- SendOrder 연결
- 체결 이벤트 연결
- 상태값 코드 추가
- 기존 order_queue status 의미 변경

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
5. 변경 규칙
==================================================
- Runtime 구조 변경 시 Runtime Specification 갱신
- 기존 필드 삭제보다 신규 필드 추가를 우선
- 식별자(id)는 변경하지 않는다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
6. 검증
==================================================
□ JSON 구조 유효성
□ 참조 무결성
□ 상태 일관성
□ Recovery 가능성

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
실패 경로
→ BLOCKED
→ BLOCKED_POLICY
→ BLOCKED_REAL
→ CANCELLED(예정)

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
금지:
- REAL_READY -> ADAPTER_READY 자동 실행.
- Timer Tick에서 호출.
- GUI 버튼으로 직접 호출.
- SendOrder 대체 경로로 사용.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
기존 구조에서는 order_queue 후보가 side, quantity, price 등 기본 정보는 가지고 있었지만,
주문방식이 왜 확정되지 않았는지 설명하는 필드가 없었다.
따라서 order_intent를 추가하여 주문 후보가 자기 자신의 주문방식 미확정 상태를 명시하도록 한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
4. BUY order_intent 구조
==================================================
BUY 예시:

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
5. SELL order_intent 구조
==================================================
SELL 예시:

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
4. order_provenance 구조
==================================================
예시:

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
Order 단계
- order_id 누락
- source_signal_id 연결 실패
- order_intent 불일치
- order_provenance 손상
Approval 단계
- 반복 BLOCKED
- 구조 오류
Policy 단계
- 정책 충돌
- 운영 정책 모순
Preflight 단계
- Guard 불일치가 반복 발생
- account 정보 이상

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
보이는 GUI 이벤트 루프는 계속 대기하는 구조라 직접 띄워 종료까지는 하지 않고, 같은 생성 경로로 오류 여부를 확인했습니다.
점검해봐
전체적으로 보면 UI 프로토타입 수준으로는 상당히 많이 정리됐다.
내가 보이는 기준으로 마지막 점검을 해보면:
좋은 점
기본설정과 매수/매도 영역의 구분이 명확하다.
매수 3열 구조는 이전보다 훨씬 읽기 쉽다.
반복매수설정 분리는 자연스럽다.
상황변화대응/추가기능설정/순환설정의 흐름도 어색하지 않다.
이탈조건/회차마감을 별도로 뺀 것은 판단하기 편하다.
전체적으로 "프로토타입" 느낌에서 "실사용 가능한 UI" 수준까지 올라왔다.
지금 눈에 보이는 아쉬운 점
① 매도설정
매수는 많이 정리됐는데
매도는 아직
설정A
설정B
설정C
를 그대로 복사한 구조다.
이 부분은 나중에
매수처럼
기본매도설정
상황변화대응
순환설정
이탈조건
세트마감
방식으로 재구성하면 된다.
② 상단 폭
매수
신호검출필터
는 잘 정리됐는데
매도
신호검출조건 A
B
C
는 조금 답답해 보인다.
③ 파일 구조
지금이 딱 좋다.
여기서 더 UI를 건드리기보다
다음 순서가 맞다.
UI 마감
↓
파일명 정리
↓
설정값 수집
↓
rules.json 연결
↓
엔진 연결
내가 가장 마음에 드는 점
이전에는
고급
검증
설정
탭이 있어서
사용자가 계속 왔다 갔다 해야 했는데
지금은
기본설정
↓
매수
↓
매도
한 화면에서 끝난다.
이게 실제 사용성은 훨씬 좋다.
현재 판정
나는 UI 프로토타입 완료 판정을 줄 수 있다고 본다.

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
다만 이번 문서는 요약판이다.
이번 UI 작업 전체(레이아웃 변경 과정, 반복매수설정 분리, 상태제어 수정 이력, 구조 개선 방향, 향후 파일명 변경 계획 등)를 모두 포함한 상세판(마스터 스펙 수준)도 작성할 수 있다.
내용이 너무 부실하다. 네가 처리할수 있는 용량안에서 이것보다 자세히 중요내용은모두 넣어서 새로 작성해줘

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
참고로 warning 일부 한글은 기존 mapper 파일 안의 문자열 인코딩이 이미 깨진 상태라 preview에도 그대로 깨져 보입니다. 이번 요청 범위가 mapper 구조 수정이라 해당 문구 정리는 건드리지 않았습니다.
구조 수정은 정상입니다.
현재 판정:

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
우선 함수만 설계/구현 후보 검토:
compare_engine_rules_preview(current_rules, preview_rules)
산출:
- 변경 후보 경로
- 기존 값
- preview 값
- 위험도
- note
먼저 코드 수정하지 말고 구현 방향만 보고해라.

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
**구현 방향**
compare_engine_rules_preview(current_rules, preview_rules)는 실제 rules를 바꾸지 않고, 두 dict를 경로 단위로 비교해서 목록만 반환하는 함수가 적절합니다.

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
**비교 status**
- same: 기존 값과 preview 값 동일
- changed: 기존 경로가 있고 값이 다름
- added: 기존 경로가 없고 preview에만 있음
- removed: preview 생성 결과에서 빠진 경로. 단 현재 mapper는 전체 rules copy 기반이라 거의 없어야 함
- postponed: mapper warnings에 있는 보류 항목 또는 명시적 미매핑 영역
**우선 비교할 경로**
현재 mapper의 mapped_paths 기준으로만 비교하는 게 안전합니다.

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
전체 dict recursive diff는 아직 위험합니다. preview가 current_rules를 deepcopy한 뒤 일부만 바꾸는 구조라, 전체 비교를 하면 기존 rules의 부가 설명/필터까지 섞여 해석이 흐려질 수 있습니다.

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
아직은 전체 recursive diff보다 mapped_paths 기반 diff가 안전합니다. 지금 구조에서는 “무엇이 바뀔 후보인가”를 명확히 보여주는 게 목적이지, rules 전체를 비교하는 게 목적은 아닙니다.
맞습니다. 이 구현 방향이 현재 단계에 가장 안전합니다.
다음 코덱스 지시는 이렇게 가면 됩니다.
routine_rule_mapper.py만 최소 수정한다.
목표:
Preview 결과와 기존 current_rules를 비교하는 diff 전용 함수 추가.

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
routine_rule_mapper.py만 최소 수정해서 diff 전용 함수를 추가했고, 기존 build_engine_rules_preview_from_ui_state() 구조는 건드리지 않았습니다.

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
buy.groups
→ 기존 5그룹 구조 유지
→ preview 단일 그룹으로 대체 금지
→ 향후에는 기존 그룹에 병합하거나 UI 전용 후보 그룹으로 추가 검토

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
현재 기존 구조:
- group[0]: enabled true, OSC TURN_UP
- group[1~4]: disabled, 빈 conditions

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
이렇게 하면 기존 5그룹 구조를 잃지 않고, UI의 OCR threshold만 추가 후보로 표현할 수 있습니다.

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
하지만 실제 rules 구조에 _preview_*를 섞는 건 엔진 오염처럼 보일 수 있으므로, preview 전용 namespace가 더 안전합니다.

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
산출:
1. 변경 대상 함수
2. 변경될 preview 구조
3. diff 함수 영향
4. 테스트 수정 방향
5. 위험 요소
6. 구현 여부 판단
이제 구현으로 바로 들어가지 말고, 변경 계획을 먼저 받아서 확인하는 게 맞습니다.
아직 구현하지 않는 기준으로, routine_rule_mapper.py 변경 계획만 정리합니다.
**1. 변경 대상 함수**

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
주의:
- buy.delay_bar와 sell.signals.macd_sell.delay_bar를 계속 포함할지 별도 판단 필요.
- 이번 목표 구조에는 delay 경로가 빠져 있음.

Original Body Marker: END

---

Reference Navigation

- Previous: PART01_03_SYSTEM_FOUNDATION.md
- Next: PART01_SYSTEM_FOUNDATION.md
- Full PART: PART01_SYSTEM_FOUNDATION.md
- INDEX: 00_REFERENCE_INDEX.md
- Original Canonical: ../CURRENT/MASTER_SPEC_CANONICAL_2026-07-08_EXECUTION_SENDORDER_CHEJAN_LIFECYCLE_PIPELINE.txt
