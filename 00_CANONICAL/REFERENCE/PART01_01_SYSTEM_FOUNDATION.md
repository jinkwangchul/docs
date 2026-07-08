# PART01 01 SYSTEM FOUNDATION

Reference Edition Subpart

Original Canonical: MASTER_SPEC_CANONICAL_2026-07-08_EXECUTION_SENDORDER_CHEJAN_LIFECYCLE_PIPELINE.txt

Source Full Part: PART01_SYSTEM_FOUNDATION.md

생성일: 2026-07-08

주의: 본 문서는 AI 참조용 하위 분할본이며 공식 원본은 CURRENT의 Canonical이다.

Original Body Marker: START
MASTER_SPEC_CANONICAL_2026-07-03

본 문서는 docs/마스터스펙정리 전체를 재귀 스캔하여 기존 MASTER_SPEC, 작업재개요약, 갱신문서, 대화히스토리, 구현로그, 운영정책 문서를 중복 병합한 최신 기준 통합본이다.
원본 파일은 수정/삭제하지 않았으며, 이미지/바이너리/임시/캐시/압축파일은 본문 통합 대상에서 제외했다.

최우선 기준
- 루틴 신호는 BUY/SELL/CANCEL 기준이다.
- HOLD 개념은 사용하지 않는다.
- AND NOT, OR NOT 형태는 금지한다.
- NOT은 동일 레벨 제외 조건으로 취급한다.
- 마감과 청산은 혼용하지 않는다.
- 시작 컬럼 명칭은 현황 기준이다.
- 무결성검사보다 안정성검사 용어를 우선한다.
- MACD 명칭은 과거 명칭일 수 있으므로 최신 지표추종매매/일반화 기준을 우선한다.
- 기존 파일명과 호환 alias는 삭제하지 말고 기록한다.
- 압축파일은 생성하지 않는다.
- 결과물은 txt 파일로만 생성한다.

최신성 판단 기준
- 명확한 최신 문서 및 2026-07-03 문서를 우선했다.
- 최신성이 불명확한 경우 파일명 날짜, 문서 내부 날짜, 내용 구체성, 파일 수정시각 순서로 판단했다.
- 충돌 가능성이 있는 문단은 삭제하지 않고 MASTER_SPEC_CONFLICTS_2026-07-03.txt에도 별도 기록했다.

1. 프로젝트 개요
==============
[출처: 마스터스펙\MASTER_SPEC_최신정리본_2026-07-03.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:40:50 | 분류: MASTER_SPEC]
MASTER_SPEC 최신정리본_2026-07-03

[출처: 마스터스펙\MASTER_SPEC_최신정리본_2026-07-03.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:40:50 | 분류: MASTER_SPEC]
판정:
- 이전 자료는 삭제 대상이 아니라 이력/근거 자료이다.
- 구현 또는 설계 판단 시에는 FINAL_REVISED를 먼저 보고, 필요한 경우 이전 자료를 보조 근거로만 본다.

[출처: 마스터스펙\MASTER_SPEC_최신정리본_2026-07-03.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:40:50 | 분류: MASTER_SPEC]
==================================================
3. 최신 참조 순서
==================================================
구현 또는 검토 시 참조 순서는 아래로 고정한다.

[출처: 마스터스펙\MASTER_SPEC_최신정리본_2026-07-03.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:40:50 | 분류: MASTER_SPEC]
1. 00_MASTER_SPEC_merged_INDEX.txt
 - 색인별 통합본 위치와 원본 문서 배정표를 확인한다.

[출처: 마스터스펙\MASTER_SPEC_최신정리본_2026-07-03.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:40:50 | 분류: MASTER_SPEC]
2. 00_Final_Index_Reference_Map_merged.txt
 - ADR, 참조 우선순위, 통합 참조맵을 확인한다.

[출처: 마스터스펙\MASTER_SPEC_최신정리본_2026-07-03.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:40:50 | 분류: MASTER_SPEC]
4. 02_Runtime_Data_Model_merged.txt
 - runtime 파일, ID 관계, 생성 주체, 수정 주체를 확인한다.

[출처: 마스터스펙\MASTER_SPEC_최신정리본_2026-07-03.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:40:50 | 분류: MASTER_SPEC]
9. 90_Misc_merged.txt
 - 최종 반영목록, 감사로그, 전체 로드맵, 협업 기준 등 보조 기준을 확인한다.

[출처: 마스터스펙\MASTER_SPEC_최신정리본_2026-07-03.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:40:50 | 분류: MASTER_SPEC]
==================================================
6. 아키텍처 최신 기준
==================================================

[출처: 마스터스펙\MASTER_SPEC_최신정리본_2026-07-03.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:40:50 | 분류: MASTER_SPEC]
최상위 의존성 원칙:
- 의존성은 위에서 아래로만 흐른다.
- 하위 모듈은 상위 모듈을 호출하지 않는다.
- 판단 모듈은 실행 모듈을 호출하지 않는다.
- Preview 모듈은 파일 상태를 변경하지 않는다.
- Adapter Preview는 SendOrder를 호출하지 않는다.
- Engine은 GUI를 알면 안 된다.
- GUI/Timer는 장기적으로 Controller만 호출한다.
- Controller는 판단 로직을 직접 구현하지 않고 기존 Engine/Policy/Preflight 모듈을 호출한다.
- 실주문은 ExecutionController 이후에만 가능하다.
- SendOrder는 KiwoomOrderExecutor만 호출할 수 있다.
권장 계층:

[출처: 마스터스펙\MASTER_SPEC_최신정리본_2026-07-03.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:40:50 | 분류: MASTER_SPEC]
==================================================
7. Runtime 최신 기준
==================================================

[출처: 마스터스펙\MASTER_SPEC_최신정리본_2026-07-03.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:40:50 | 분류: MASTER_SPEC]
Runtime 파일 기본 원칙:
- Runtime 파일은 현재 실행 상태와 운영 상태를 보존하기 위한 파일이다.
- Runtime 파일은 MASTER_SPEC에 정의된 생성 주체와 수정 주체만 변경할 수 있다.
- Preview 함수는 Runtime 파일을 변경하지 않는다.
- 상태 전이는 반드시 담당 Controller/Engine/Gate를 통해서만 반영한다.
- Runtime 파일 변경은 향후 Audit Log 기록 대상이다.
- Runtime 파일 손상/불일치/관계 끊김은 자동 정상 처리하지 않고 Recovery 또는 검토관리 대상이다.
- Runtime 파일의 ID 관계는 보존되어야 한다.
- 실주문 관련 Runtime 파일은 SendOrder 연결 전까지 구현 금지 상태를 유지한다.

[출처: 마스터스펙\MASTER_SPEC_최신정리본_2026-07-03.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:40:50 | 분류: MASTER_SPEC]
3. Policy 단계
- APPROVED -> EXECUTABLE
- APPROVED -> BLOCKED_POLICY
- execution_enabled 변경 없음

[출처: 마스터스펙\MASTER_SPEC_최신정리본_2026-07-03.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:40:50 | 분류: MASTER_SPEC]
최종 원칙:
- 각 체크 항목은 독립적으로 검증 가능해야 한다.
- 선행 항목이 완료되지 않은 상태에서 다음 단계 구현을 시작하지 않는다.

[출처: 마스터스펙\MASTER_SPEC_최신정리본_2026-07-03.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:40:50 | 분류: MASTER_SPEC]
==================================================
9. 운영/정책 최신 기준
==================================================
개발운영 생명주기:

[출처: 마스터스펙\MASTER_SPEC_최신정리본_2026-07-03.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:40:50 | 분류: MASTER_SPEC]
==================================================
10. 중복 제거 결과
==================================================

[출처: 마스터스펙\MASTER_SPEC_최신정리본_2026-07-03.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:40:50 | 분류: MASTER_SPEC]
최신 통합본 생성 결과:
- 원본 TXT 문서 수: 76
- 완전 동일 파일 중복 수: 0
- 제거된 중복 문단/섹션 수: 16

[출처: 마스터스펙\MASTER_SPEC_최신정리본_2026-07-03.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:40:50 | 분류: MASTER_SPEC]
중복 제거는 문서 전체 삭제가 아니라 동일 문단/섹션 단위 제거로 수행되었다.
중복 제거 세부 내용은 아래 파일을 참조한다.

[출처: 마스터스펙\MASTER_SPEC_최신정리본_2026-07-03.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:40:50 | 분류: MASTER_SPEC]
==================================================
11. 앞으로의 작업 기준
==================================================

[출처: 마스터스펙\MASTER_SPEC_최신정리본_2026-07-03.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:40:50 | 분류: MASTER_SPEC]
==================================================
12. 보관 권장
==================================================

[출처: 마스터스펙\MASTER_SPEC_최신정리본_2026-07-03.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:40:50 | 분류: MASTER_SPEC]
보관 유지:
- MASTER_SPEC_추가갱신_026-07-03.zip
- MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED
- MASTER_SPEC_최신정리본_2026-07-03.txt
- tools/integrate_master_spec.ps1

[출처: 마스터스펙\MASTER_SPEC_최신정리본_2026-07-03.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:40:50 | 분류: MASTER_SPEC]
이력 보관:
- 2026-07-02, 2026-06-30, 2026-06-25, 2026-06-22, 2026-06-18 계열 자료
- v1.x, v2.x, v3.0 baseline 자료

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\00_MASTER_SPEC_merged_INDEX.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
MASTER_SPEC MERGED INDEX
Generated: 2026-07-03 15:22:26
Source zip: C:\Users\JIN KWANG CHUL\Documents\docs\MASTER_SPEC_추가갱신_026-07-03.zip
Total source TXT documents: 76

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\00_MASTER_SPEC_merged_INDEX.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
Source assignment
==================================================
- [00_Final_Index_Reference_Map] MASTER_SPEC_추가갱신_프로젝트_의사결정기록_ADR_Index_2026-07-03.txt
- [00_Final_Index_Reference_Map] MASTER_SPEC_추가갱신_프로젝트_참조우선순위_Reference_Priority_Guide_2026-07-03.txt
- [00_Final_Index_Reference_Map] MASTER_SPEC_추가갱신_프로젝트_통합참조맵_Integrated_Reference_Map_2026-07-03.txt
- [01_Order_Pipeline] MASTER_SPEC_갱신자료_2026-07-03_주문파이프라인_Preview.txt
- [01_Order_Pipeline] MASTER_SPEC_추가갱신_ADAPTER_READY_미사용정책_2026-07-03.txt
- [01_Order_Pipeline] MASTER_SPEC_추가갱신_Chejan_Fill_Event_Lifecycle_설계_2026-07-03.txt
- [01_Order_Pipeline] MASTER_SPEC_추가갱신_Close_Liquidation_Model_청산모델_설계_2026-07-03.txt
- [01_Order_Pipeline] MASTER_SPEC_추가갱신_Execution_Request_order_executions_설계_2026-07-03.txt
- [01_Order_Pipeline] MASTER_SPEC_추가갱신_Final_Execution_Guard_최종실행게이트_2026-07-03.txt
- [01_Order_Pipeline] MASTER_SPEC_추가갱신_Hoga_OrderType_매핑설계_2026-07-03.txt
- [01_Order_Pipeline] MASTER_SPEC_추가갱신_Kiwoom_Boundary_API_경계설계_2026-07-03.txt
- [01_Order_Pipeline] MASTER_SPEC_추가갱신_order_intent_미확정진단필드_2026-07-03.txt
- [01_Order_Pipeline] MASTER_SPEC_추가갱신_Order_Lock_Manager_설계_2026-07-03.txt
- [01_Order_Pipeline] MASTER_SPEC_추가갱신_order_provenance_주문생성이력_2026-07-03.txt
- [01_Order_Pipeline] MASTER_SPEC_추가갱신_Order_State_Machine_주문상태머신_설계_2026-07-03.txt
- [01_Order_Pipeline] MASTER_SPEC_추가갱신_Position_Model_보유상태_설계_2026-07-03.txt
- [01_Order_Pipeline] MASTER_SPEC_추가갱신_Request_Hash_중복실행방지_설계_2026-07-03.txt
- [01_Order_Pipeline] MASTER_SPEC_추가갱신_Review_Management_주문파이프라인연계_2026-07-03.txt
- [01_Order_Pipeline] MASTER_SPEC_추가갱신_실주문실행책임_ORDER_QUEUED_주문생명주기_2026-07-03.txt
- [02_Runtime_Data_Model] MASTER_SPEC_전체_Runtime_파일규격_최종정의_초안_2026-07-03.txt
- [02_Runtime_Data_Model] MASTER_SPEC_추가갱신_Runtime_Data_Model_Entity_Relationship_2026-07-03.txt
- [02_Runtime_Data_Model] MASTER_SPEC_추가갱신_프로젝트_Runtime_카탈로그_Runtime_Catalog_2026-07-03.txt
- [02_Runtime_Data_Model] MASTER_SPEC_추가갱신_프로젝트_구성요소의존성맵_Component_Dependency_Map_2026-07-03.txt
- [02_Runtime_Data_Model] MASTER_SPEC_추가갱신_프로젝트_데이터계약카탈로그_Data_Contract_Catalog_2026-07-03.txt
- [02_Runtime_Data_Model] MASTER_SPEC_추가갱신_프로젝트_모듈카탈로그_Module_Catalog_2026-07-03.txt
- [02_Runtime_Data_Model] MASTER_SPEC_추가갱신_프로젝트_상태전이카탈로그_State_Transition_Catalog_2026-07-03.txt
- [02_Runtime_Data_Model] MASTER_SPEC_추가갱신_프로젝트_이벤트카탈로그_Event_Catalog_2026-07-03.txt
- [02_Runtime_Data_Model] MASTER_SPEC_추가갱신_프로젝트_인터페이스카탈로그_Interface_Catalog_2026-07-03.txt
- [03_Architecture] MASTER_SPEC_추가갱신_Architecture_Dependency_Map_2026-07-03.txt
- [03_Architecture] MASTER_SPEC_추가갱신_Controller_Layer_호출책임_2026-07-03.txt
- [03_Architecture] MASTER_SPEC_추가갱신_Recovery_Controller_복구절차_설계_2026-07-03.txt
- [03_Architecture] MASTER_SPEC_추가갱신_설계검토_체크포인트_Architecture_Review_Checkpoints_2026-07-03.txt
- [03_Architecture] MASTER_SPEC_추가갱신_설계원칙_Architecture_Principles_2026-07-03.txt
- [03_Architecture] MASTER_SPEC_추가갱신_프로젝트_문서체계_Document_Architecture_2026-07-03.txt
- [03_Architecture] MASTER_SPEC_추가갱신_프로젝트_역할책임매트릭스_RACI_Matrix_2026-07-03.txt
- [04_Implementation_Test_Verification] MASTER_SPEC_추가갱신_구현체크리스트_Implementation_Checklist_2026-07-03.txt
- [04_Implementation_Test_Verification] MASTER_SPEC_추가갱신_코딩규약_Implementation_Standards_2026-07-03.txt
- [04_Implementation_Test_Verification] MASTER_SPEC_추가갱신_테스트전략_Test_Strategy_2026-07-03.txt
- [04_Implementation_Test_Verification] MASTER_SPEC_추가갱신_프로젝트_검증매트릭스_Verification_Matrix_2026-07-03.txt
- [04_Implementation_Test_Verification] MASTER_SPEC_추가갱신_프로젝트_구현금지목록_Implementation_Prohibitions_2026-07-03.txt
- [04_Implementation_Test_Verification] MASTER_SPEC_추가갱신_프로젝트_구현기록_템플릿_Implementation_Record_Template_2026-07-03.txt
- [04_Implementation_Test_Verification] MASTER_SPEC_추가갱신_프로젝트_구현단계_게이트_Implementation_Gates_2026-07-03.txt
- [04_Implementation_Test_Verification] MASTER_SPEC_추가갱신_프로젝트_구현단계_산출물맵_Implementation_Deliverables_Map_2026-07-03.txt
- [04_Implementation_Test_Verification] MASTER_SPEC_추가갱신_프로젝트_구현우선순위_Execution_Backlog_2026-07-03.txt
- [04_Implementation_Test_Verification] MASTER_SPEC_추가갱신_프로젝트_구현준비도_Readiness_Checklist_2026-07-03.txt
- [04_Implementation_Test_Verification] MASTER_SPEC_추가갱신_프로젝트_구현증빙패키지_Evidence_Package_2026-07-03.txt
- [04_Implementation_Test_Verification] MASTER_SPEC_추가갱신_프로젝트_구현추적표_Implementation_Trace_Register_2026-07-03.txt
- [04_Implementation_Test_Verification] MASTER_SPEC_추가갱신_프로젝트_마일스톤_Milestones_2026-07-03.txt
- [04_Implementation_Test_Verification] MASTER_SPEC_추가갱신_프로젝트_운영인증_Production_Readiness_Certification_2026-07-03.txt
- [04_Implementation_Test_Verification] MASTER_SPEC_추가갱신_프로젝트_운영준비도_Operational_Readiness_Assessment_2026-07-03.txt
- [04_Implementation_Test_Verification] MASTER_SPEC_추가갱신_프로젝트_최종통합체크리스트_Final_Integration_Checklist_2026-07-03.txt
- [05_Operations_Policy_Governance] MASTER_SPEC_추가갱신_프로젝트_개발운영_라이프사이클_Development_Lifecycle_2026-07-03.txt
- [05_Operations_Policy_Governance] MASTER_SPEC_추가갱신_프로젝트_릴리즈정책_Release_Management_Policy_2026-07-03.txt
- [05_Operations_Policy_Governance] MASTER_SPEC_추가갱신_프로젝트_백업및복구정책_Backup_Recovery_Policy_2026-07-03.txt
- [05_Operations_Policy_Governance] MASTER_SPEC_추가갱신_프로젝트_변경관리정책_Change_Management_Policy_2026-07-03.txt
- [05_Operations_Policy_Governance] MASTER_SPEC_추가갱신_프로젝트_성숙도모델_Project_Maturity_Model_2026-07-03.txt
- [05_Operations_Policy_Governance] MASTER_SPEC_추가갱신_프로젝트_완성도평가_Completion_Assessment_2026-07-03.txt
- [05_Operations_Policy_Governance] MASTER_SPEC_추가갱신_프로젝트_운영인수기준_Operational_Acceptance_Criteria_2026-07-03.txt
- [05_Operations_Policy_Governance] MASTER_SPEC_추가갱신_프로젝트_운영정책_Operations_Governance_2026-07-03.txt
- [05_Operations_Policy_Governance] MASTER_SPEC_추가갱신_프로젝트_위험관리정책_Risk_Management_Policy_2026-07-03.txt
- [05_Operations_Policy_Governance] MASTER_SPEC_추가갱신_프로젝트_유지보수정책_Maintenance_Policy_2026-07-03.txt
- [05_Operations_Policy_Governance] MASTER_SPEC_추가갱신_프로젝트_장기로드맵_Product_Roadmap_2026-07-03.txt
- [05_Operations_Policy_Governance] MASTER_SPEC_추가갱신_프로젝트_종합평가기준_Project_Governance_Framework_2026-07-03.txt
- [05_Operations_Policy_Governance] MASTER_SPEC_추가갱신_프로젝트_최종완료기준_Project_Completion_Criteria_2026-07-03.txt
- [05_Operations_Policy_Governance] MASTER_SPEC_추가갱신_프로젝트_품질보증정책_Quality_Assurance_Policy_2026-07-03.txt
- [06_Glossary] MASTER_SPEC_추가갱신_용어사전_Glossary_2026-07-03.txt
- [06_Glossary] MASTER_SPEC_추가갱신_프로젝트_용어사전_Domain_Glossary_2026-07-03.txt
- [90_Misc] MASTER_SPEC_갱신자료_2026-07-03.txt
- [90_Misc] MASTER_SPEC_최종_MASTER_SPEC_반영목록_2026-07-03.txt
- [90_Misc] MASTER_SPEC_추가갱신_Audit_Log_감사로그_설계_2026-07-03.txt
- [90_Misc] MASTER_SPEC_추가갱신_구현단계별_완료기준_Definition_of_Done_2026-07-03.txt
- [90_Misc] MASTER_SPEC_추가갱신_실구현_우선순위_착수계획_2026-07-03.txt
- [90_Misc] MASTER_SPEC_추가갱신_전체아키텍처_로드맵_2026-07-03.txt
- [90_Misc] MASTER_SPEC_추가갱신_프로젝트_아키텍처_최종인덱스_2026-07-03.txt
- [90_Misc] MASTER_SPEC_추가갱신_프로젝트_추적성매트릭스_Traceability_Matrix_2026-07-03.txt
- [90_Misc] 고정역할정의_ChatGPT_Codex_협업기준_v2026-07-03.txt

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\90_Misc_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
MASTER_SPEC merged index - 90_Misc
Generated: 2026-07-03 15:22:26
Source zip: C:\Users\JIN KWANG CHUL\Documents\docs\MASTER_SPEC_추가갱신_026-07-03.zip
Source document count: 9

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\90_Misc_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
Source documents
==================================================
- MASTER_SPEC_갱신자료_2026-07-03.txt
- MASTER_SPEC_최종_MASTER_SPEC_반영목록_2026-07-03.txt
- MASTER_SPEC_추가갱신_Audit_Log_감사로그_설계_2026-07-03.txt
- MASTER_SPEC_추가갱신_구현단계별_완료기준_Definition_of_Done_2026-07-03.txt
- MASTER_SPEC_추가갱신_실구현_우선순위_착수계획_2026-07-03.txt
- MASTER_SPEC_추가갱신_전체아키텍처_로드맵_2026-07-03.txt
- MASTER_SPEC_추가갱신_프로젝트_아키텍처_최종인덱스_2026-07-03.txt
- MASTER_SPEC_추가갱신_프로젝트_추적성매트릭스_Traceability_Matrix_2026-07-03.txt
- 고정역할정의_ChatGPT_Codex_협업기준_v2026-07-03.txt

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\90_Misc_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
SOURCE: MASTER_SPEC_갱신자료_2026-07-03.txt
==================================================
MASTER_SPEC_갱신자료_2026-07-03
데이터 흐름

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\90_Misc_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
SOURCE: MASTER_SPEC_최종_MASTER_SPEC_반영목록_2026-07-03.txt
==================================================
MASTER_SPEC_최종_MASTER_SPEC_반영목록_2026-07-03

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\90_Misc_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
목적
- 이번 작업 기간 동안 생성된 정책/아키텍처 문서 중
 장기적으로 MASTER_SPEC 정본에 반영해야 하는 항목만 정리한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\90_Misc_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
반영 우선순위 A (필수)
==================================================
- Architecture Principles
- Runtime Specification
- State Machine
- Runtime Catalog
- Data Contract Catalog
- Interface Catalog
- Component Dependency Map
- Module Catalog

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\90_Misc_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
최종 결론
현재 생성된 문서는 모두 정본으로 병합하는 것이 아니라,
중복을 제거하여 MASTER_SPEC의 해당 장(아키텍처·Runtime·운영·구현·검증)에
흡수하는 것을 원칙으로 한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\90_Misc_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
SOURCE: MASTER_SPEC_추가갱신_Audit_Log_감사로그_설계_2026-07-03.txt
==================================================
MASTER_SPEC_추가갱신_Audit_Log_감사로그_설계_2026-07-03

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\90_Misc_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
2. 기록 원칙
- 상태 변경 시점마다 1건 기록
- 동일 이벤트를 중복 기록하지 않는다.
- 로그는 상태를 변경하지 않는다.
- 로그는 실행 판단에 사용하지 않는다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\90_Misc_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
최종 원칙
Audit Log는 '무슨 일이 있었는가'를 기록하며,
'무엇을 해야 하는가'를 결정하지 않는다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\90_Misc_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
3. Approval 단계
==================================================

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\90_Misc_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
4. Policy 단계
==================================================

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\90_Misc_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
5. Preflight 단계
==================================================

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\90_Misc_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
7. Execution 단계(향후)
==================================================

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\90_Misc_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
SOURCE: MASTER_SPEC_추가갱신_실구현_우선순위_착수계획_2026-07-03.txt
==================================================
MASTER_SPEC_추가갱신_실구현_우선순위_착수계획_2026-07-03

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\90_Misc_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
목적
- 아키텍처 설계 이후 실제 구현에 착수할 때 적용할 구현 우선순위를 확정한다.
- 설계와 구현을 혼동하지 않도록 각 단계의 목표를 명확히 구분한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\90_Misc_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
2. 구현 우선순위
==================================================

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\90_Misc_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
3. 구현 원칙
==================================================

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\90_Misc_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
SOURCE: MASTER_SPEC_추가갱신_전체아키텍처_로드맵_2026-07-03.txt
==================================================
MASTER_SPEC_추가갱신_전체아키텍처_로드맵_2026-07-03

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\90_Misc_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
목적
- 지금까지 설계한 문서들의 구현 순서와 상호 의존성을 하나의 로드맵으로 정리한다.
- 본 문서는 구현 우선순위를 고정하기 위한 기준이며 코드 변경은 포함하지 않는다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\90_Misc_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
5. 프로젝트 현재 위치
==================================================
현재는 '실주문 직전 아키텍처 설계 완료' 단계이다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\90_Misc_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
실주문 기능은 아직 의도적으로 차단되어 있으며,
다음 구현은 작은 단위의 안전한 기능부터 순차적으로 진행한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\90_Misc_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
SOURCE: MASTER_SPEC_추가갱신_프로젝트_아키텍처_최종인덱스_2026-07-03.txt
==================================================
MASTER_SPEC_추가갱신_프로젝트_아키텍처_최종인덱스_2026-07-03

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\90_Misc_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
4. 운영 계층
==================================================
20. Audit Log
21. Review Management
22. Recovery Controller

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\90_Misc_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
8. 프로젝트 현재 위치
==================================================
현재 단계는 '실주문 직전 아키텍처 설계 완료' 상태이다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\90_Misc_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
다음 작업은 새로운 설계 문서를 계속 추가하는 것이 아니라,
확정된 설계를 기준으로 작은 구현 단위를 순차적으로 적용하는 단계이다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\90_Misc_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
최종 결론
이 문서를 프로젝트 아키텍처의 최상위 인덱스로 사용하며,
모든 구현은 본 인덱스의 참조 순서를 따른다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\90_Misc_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
SOURCE: MASTER_SPEC_추가갱신_프로젝트_추적성매트릭스_Traceability_Matrix_2026-07-03.txt
==================================================

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\90_Misc_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
MASTER_SPEC_추가갱신_프로젝트_추적성매트릭스_Traceability_Matrix_2026-07-03
목적
- 요구사항부터 운영까지 각 산출물이 어떻게 연결되는지 추적하기 위한 기준을 정의한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\90_Misc_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
1. 추적 흐름
==================================================

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\90_Misc_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
3. 구현 시 확인 항목
==================================================

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\90_Misc_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
4. 변경 추적
==================================================

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\90_Misc_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
5. 추적 원칙
==================================================

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\90_Misc_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
SOURCE: 고정역할정의_ChatGPT_Codex_협업기준_v2026-07-03.txt
==================================================
ChatGPT ↔ Codex 고정 역할 정의 (프로젝트 운영 기준)
문서명: 고정역할정의_ChatGPT_Codex_협업기준_v2026-07-03.txt

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\90_Misc_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
목적 본 문서는 키움 자동매매 프로젝트에서 ChatGPT와 Codex의 역할을
명확히 분리하여 중복 작업, 책임 혼선, 품질 저하를 방지하기 위한 운영
기준이다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\90_Misc_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
================================================== 1. ChatGPT의 고정
역할 ==================================================
ChatGPT는 프로젝트의 설계 책임자(Architecture Reviewer)이다.
주요 역할

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\90_Misc_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
1. 프로젝트 전체 구조 분석
2. MASTER SPEC 검토 및 일치 여부 확인
3. 구조적 오류 발견
4. 상태 전이 검증
5. 정책 충돌 검토
6. 코드 리뷰
7. 구현 순서 결정
8. 위험 요소 사전 발견
9. 테스트 결과 해석
10. 작업재개요약서 작성
11. MASTER SPEC 갱신자료 작성
12. 프로젝트 철학 유지
13. 기존 구조와 신규 구조 충돌 검토
14. 리팩토링 방향 제안
15. 구현 범위 결정

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\90_Misc_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
ChatGPT는 가능한 한 직접 코드를 작성하는 것이 아니라 “무엇을 왜 어떻게
구현해야 하는지”를 판단하는 역할을 우선한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\90_Misc_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
1. 코드 수정
2. 코드 생성
3. 리팩토링 수행
4. 테스트 작성
5. unittest 수행
6. py_compile 수행
7. 실제 프로젝트 파일 수정
8. 함수 추가
9. 버그 수정
10. 최소 수정 원칙 유지
Codex는 설계 변경을 스스로 결정하지 않는다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\90_Misc_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
================================================== 5. ChatGPT가 직접
수행하는 작업 ==================================================
다음 작업은 Codex에게 넘기지 않는다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\90_Misc_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
- 작업재개요약서
- MASTER SPEC 갱신자료
- 프로젝트 기준 문서
- 구조 설계
- 정책 확정
- 역할 정의
- 구현 방향 결정
- 코드 리뷰
- 최종 품질 검토

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\90_Misc_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
================================================== 8. 최종 운영 원칙
==================================================
ChatGPT = 설계자 = 리뷰어 = 프로젝트 관리자
Codex = 구현자 = 테스트 수행자

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\90_Misc_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
프로젝트 품질의 최종 책임은 ChatGPT의 검토에 있으며, 실제 코드 구현의
책임은 Codex가 담당한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\06_Glossary_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
MASTER_SPEC merged index - 06_Glossary
Generated: 2026-07-03 15:22:26
Source zip: C:\Users\JIN KWANG CHUL\Documents\docs\MASTER_SPEC_추가갱신_026-07-03.zip
Source document count: 2

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\06_Glossary_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
Source documents
==================================================
- MASTER_SPEC_추가갱신_용어사전_Glossary_2026-07-03.txt
- MASTER_SPEC_추가갱신_프로젝트_용어사전_Domain_Glossary_2026-07-03.txt

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\06_Glossary_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
1. Signal
==================================================
루틴이 생성한 매수/매도 판단 결과.
주문이 아니다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\06_Glossary_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
4. Operation Policy
==================================================
운영 정책을 기준으로 주문 후보를 실행 가능 후보로 승격하는 단계.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\06_Glossary_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
13. Review Management
==================================================
자동 처리하면 안 되는 항목을 운영자가 확인하기 위한 관리 계층.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\06_Glossary_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
아키텍처 용어
==================================================
MASTER_SPEC
- 프로젝트의 최상위 기준 문서.
ADR
- 구조적 의사결정 기록.
Runtime
- 실행 중 유지되는 JSON 기반 데이터.
Controller
- 흐름과 상태 전이를 관리하는 계층.
Engine
- 판단과 계산만 수행하는 계층.
Boundary
- 외부 시스템(OpenAPI)과 통신하는 계층.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\06_Glossary_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
최종 원칙
==================================================
동일 용어는 프로젝트 전체에서 동일한 의미로 사용하며,
새로운 용어를 추가할 경우 기존 용어와의 관계를 함께 정의한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\05_Operations_Policy_Governance_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
MASTER_SPEC merged index - 05_Operations_Policy_Governance
Generated: 2026-07-03 15:22:26
Source zip: C:\Users\JIN KWANG CHUL\Documents\docs\MASTER_SPEC_추가갱신_026-07-03.zip
Source document count: 14

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\05_Operations_Policy_Governance_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
Source documents
==================================================
- MASTER_SPEC_추가갱신_프로젝트_개발운영_라이프사이클_Development_Lifecycle_2026-07-03.txt
- MASTER_SPEC_추가갱신_프로젝트_릴리즈정책_Release_Management_Policy_2026-07-03.txt
- MASTER_SPEC_추가갱신_프로젝트_백업및복구정책_Backup_Recovery_Policy_2026-07-03.txt
- MASTER_SPEC_추가갱신_프로젝트_변경관리정책_Change_Management_Policy_2026-07-03.txt
- MASTER_SPEC_추가갱신_프로젝트_성숙도모델_Project_Maturity_Model_2026-07-03.txt
- MASTER_SPEC_추가갱신_프로젝트_완성도평가_Completion_Assessment_2026-07-03.txt
- MASTER_SPEC_추가갱신_프로젝트_운영인수기준_Operational_Acceptance_Criteria_2026-07-03.txt
- MASTER_SPEC_추가갱신_프로젝트_운영정책_Operations_Governance_2026-07-03.txt
- MASTER_SPEC_추가갱신_프로젝트_위험관리정책_Risk_Management_Policy_2026-07-03.txt
- MASTER_SPEC_추가갱신_프로젝트_유지보수정책_Maintenance_Policy_2026-07-03.txt
- MASTER_SPEC_추가갱신_프로젝트_장기로드맵_Product_Roadmap_2026-07-03.txt
- MASTER_SPEC_추가갱신_프로젝트_종합평가기준_Project_Governance_Framework_2026-07-03.txt
- MASTER_SPEC_추가갱신_프로젝트_최종완료기준_Project_Completion_Criteria_2026-07-03.txt
- MASTER_SPEC_추가갱신_프로젝트_품질보증정책_Quality_Assurance_Policy_2026-07-03.txt

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\05_Operations_Policy_Governance_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
SOURCE: MASTER_SPEC_추가갱신_프로젝트_개발운영_라이프사이클_Development_Lifecycle_2026-07-03.txt
==================================================

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\05_Operations_Policy_Governance_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
MASTER_SPEC_추가갱신_프로젝트_개발운영_라이프사이클_Development_Lifecycle_2026-07-03

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\05_Operations_Policy_Governance_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
목적
- 프로젝트가 아이디어부터 운영, 유지보수까지 반복되는 전체 개발 생명주기(Development Lifecycle)를 정의한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\05_Operations_Policy_Governance_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
5. 피드백
==================================================
운영 중 발견된 문제는
운영
→ 분석
→ 설계 검토
→ 구현
으로 되돌아간다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\05_Operations_Policy_Governance_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
최종 원칙
프로젝트는 일회성 개발이 아니라,
'요구사항 → 설계 → 구현 → 검증 → 운영 → 개선'의 반복 사이클로 지속적으로 발전한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\05_Operations_Policy_Governance_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
SOURCE: MASTER_SPEC_추가갱신_프로젝트_릴리즈정책_Release_Management_Policy_2026-07-03.txt
==================================================

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\05_Operations_Policy_Governance_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
MASTER_SPEC_추가갱신_프로젝트_릴리즈정책_Release_Management_Policy_2026-07-03
목적
- 기능 개발부터 배포(릴리즈)까지의 절차와 승인 기준을 정의한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\05_Operations_Policy_Governance_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
SOURCE: MASTER_SPEC_추가갱신_프로젝트_백업및복구정책_Backup_Recovery_Policy_2026-07-03.txt
==================================================

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\05_Operations_Policy_Governance_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
MASTER_SPEC_추가갱신_프로젝트_백업및복구정책_Backup_Recovery_Policy_2026-07-03
목적
- 프로젝트 소스, Runtime 데이터, 문서를 안전하게 보존하고 복구하기 위한 기준을 정의한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\05_Operations_Policy_Governance_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
2. 백업 원칙
- 구조 변경 전 백업
- Runtime 포맷 변경 전 백업
- 대규모 리팩터링 전 백업
- 릴리즈 전 백업

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\05_Operations_Policy_Governance_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
3. 복구 원칙
- 원인 분석 후 복구
- Runtime와 서버 상태를 함께 확인
- 복구 과정은 Audit 대상
- 불확실하면 Review Management로 이관

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\05_Operations_Policy_Governance_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
5. 금지
- 백업 없는 대규모 변경
- 원인 확인 없는 Runtime 복원
- 서버 확인 없는 Position 복구
- 테스트 없는 복구 완료 선언
6. 완료 기준
□ 백업 확인
□ 복구 완료
□ Runtime 정상
□ 테스트 통과
□ 문서 갱신
최종 원칙
백업은 복구를 위한 준비이며,
복구는 데이터 일관성과 운영 안전성을 회복하는 절차이다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\05_Operations_Policy_Governance_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
SOURCE: MASTER_SPEC_추가갱신_프로젝트_변경관리정책_Change_Management_Policy_2026-07-03.txt
==================================================

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\05_Operations_Policy_Governance_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
MASTER_SPEC_추가갱신_프로젝트_변경관리정책_Change_Management_Policy_2026-07-03
목적
- 프로젝트의 구조 변경과 기능 변경을 일관된 절차로 관리하기 위한 정책이다.
1. 변경 분류
A. 버그 수정
- 기존 설계 유지
- 동작 오류 수정
B. 기능 추가
- 기존 구조 확장
- 신규 책임 추가 여부 검토
C. 구조 변경
- 책임 이동
- Runtime 변경
- 상태 변경
- Controller 변경

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\05_Operations_Policy_Governance_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
3. 영향 분석 대상
- State Machine
- Runtime 파일
- Controller
- Engine
- Boundary
- Recovery
- Review
- Audit

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\05_Operations_Policy_Governance_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
5. 롤백 원칙
- 구조 변경은 이전 상태로 복원 가능해야 한다.
- Runtime 포맷 변경은 복구 전략 없이 적용하지 않는다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\05_Operations_Policy_Governance_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
SOURCE: MASTER_SPEC_추가갱신_프로젝트_성숙도모델_Project_Maturity_Model_2026-07-03.txt
==================================================

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\05_Operations_Policy_Governance_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
MASTER_SPEC_추가갱신_프로젝트_성숙도모델_Project_Maturity_Model_2026-07-03

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\05_Operations_Policy_Governance_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
목적
- 프로젝트가 현재 어느 수준에 있는지 객관적으로 판단하기 위한 성숙도(Maturity) 기준을 정의한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\05_Operations_Policy_Governance_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
Level 2 : 구조 설계 단계
==================================================
특징
- 아키텍처 정의
- Runtime 모델 정의
- State Machine 정의
- 역할 분리
현재 프로젝트는 이 단계를 완료한 상태.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\05_Operations_Policy_Governance_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
Level 3 : 안전 구현 단계
==================================================
목표
- Controller 구현
- Guard 구현
- Execution 준비
- Preview 기반 검증
- 실주문 미연결 유지

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\05_Operations_Policy_Governance_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
Level 4 : 실주문 단계
==================================================
목표
- Kiwoom Boundary
- SendOrder
- Fill
- Position
- Close History
완료 기준
- 단일 실행 경로
- Runtime 일관성
- Recovery 가능

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\05_Operations_Policy_Governance_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
Level 5 : 운영 안정화 단계
==================================================
목표
- 운영 자동화
- Audit
- Review
- Recovery
- 운영 대시보드
- 장기 유지보수

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\05_Operations_Policy_Governance_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
현재 평가
==================================================
현재 프로젝트는
Level 2 완료
→ Level 3 진입 단계
이다.
최종 원칙
성숙도는 기능 수가 아니라
아키텍처, 안전성, 검증 체계, 운영 가능성을 기준으로 판단한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\05_Operations_Policy_Governance_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
SOURCE: MASTER_SPEC_추가갱신_프로젝트_완성도평가_Completion_Assessment_2026-07-03.txt
==================================================

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\05_Operations_Policy_Governance_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
MASTER_SPEC_추가갱신_프로젝트_완성도평가_Completion_Assessment_2026-07-03

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\05_Operations_Policy_Governance_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
목적
- 현재 프로젝트의 완성도를 아키텍처, 구현, 운영 준비 관점에서 객관적으로 평가하기 위한 기준을 정의한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\05_Operations_Policy_Governance_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
1. 평가 영역
==================================================

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\05_Operations_Policy_Governance_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
C. 운영 준비
- Recovery 설계
- Review 설계
- Audit 설계
- Runtime 규격
- 운영 정책

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\05_Operations_Policy_Governance_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
2. 현재 평가
==================================================

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\05_Operations_Policy_Governance_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
4. 다음 핵심 목표
==================================================

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\05_Operations_Policy_Governance_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
5. 완료 판정 기준
==================================================
프로젝트를 '실주문 준비 완료'로 판단하려면 다음이 모두 충족되어야 한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\05_Operations_Policy_Governance_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
최종 결론
==================================================

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\05_Operations_Policy_Governance_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
현재 프로젝트는 상위 아키텍처와 운영 기준이 충분히 정립된 상태이며,
다음 단계의 핵심은 새로운 설계 문서 작성이 아니라
Execution 계층을 작은 단위로 안전하게 구현하는 것이다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\05_Operations_Policy_Governance_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
SOURCE: MASTER_SPEC_추가갱신_프로젝트_운영인수기준_Operational_Acceptance_Criteria_2026-07-03.txt
==================================================

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\05_Operations_Policy_Governance_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
MASTER_SPEC_추가갱신_프로젝트_운영인수기준_Operational_Acceptance_Criteria_2026-07-03

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\05_Operations_Policy_Governance_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
4. 운영 인수
==================================================
□ 운영 정책 확인
□ Review 정책 확인
□ Audit 정책 확인
□ 위험관리 기준 확인

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\05_Operations_Policy_Governance_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
최종 원칙
운영 인수는 개발 완료 여부가 아니라,
안전하게 운영 가능한 상태인지 여부를 기준으로 결정한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\05_Operations_Policy_Governance_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
SOURCE: MASTER_SPEC_추가갱신_프로젝트_운영정책_Operations_Governance_2026-07-03.txt
==================================================
MASTER_SPEC_추가갱신_프로젝트_운영정책_Operations_Governance_2026-07-03

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\05_Operations_Policy_Governance_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
목적
- 프로젝트를 실제 운영할 때 준수해야 하는 운영 원칙과 의사결정 기준을 정의한다.
- 구현 정책과 운영 정책을 구분하여 장기 유지보수 기준으로 사용한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\05_Operations_Policy_Governance_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
1. 운영 기본 원칙
==================================================
- 안정성을 수익보다 우선한다.
- 자동 처리보다 검증 가능한 처리를 우선한다.
- 불확실한 상태는 검토관리로 이관한다.
- 모든 운영 변경은 추적 가능해야 한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\05_Operations_Policy_Governance_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
3. 운영 중 원칙
==================================================
- Preview 결과와 실제 실행 결과를 구분한다.
- Runtime 이상 징후는 즉시 기록한다.
- 허용되지 않은 상태 전이는 운영 중단 대상이다.
- Controller를 우회한 수동 조작을 금지한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\05_Operations_Policy_Governance_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
SOURCE: MASTER_SPEC_추가갱신_프로젝트_위험관리정책_Risk_Management_Policy_2026-07-03.txt
==================================================

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\05_Operations_Policy_Governance_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
MASTER_SPEC_추가갱신_프로젝트_위험관리정책_Risk_Management_Policy_2026-07-03
목적
- 프로젝트 전반의 기술적·운영상 위험을 식별하고 대응 원칙을 정의한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\05_Operations_Policy_Governance_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
4. 대응 원칙
- 자동 처리보다 안전한 차단을 우선한다.
- 불확실한 상태는 Review 대상으로 보낸다.
- 위험을 숨기지 않고 기록한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\05_Operations_Policy_Governance_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
5. 검증
모든 구조 변경은 다음을 확인한다.
□ 위험 증가 여부
□ Recovery 가능 여부
□ Runtime 영향
□ 회귀 테스트
□ 문서 갱신
최종 원칙
프로젝트는 기능 추가보다 위험 감소를 우선한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\05_Operations_Policy_Governance_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
SOURCE: MASTER_SPEC_추가갱신_프로젝트_유지보수정책_Maintenance_Policy_2026-07-03.txt
==================================================
MASTER_SPEC_추가갱신_프로젝트_유지보수정책_Maintenance_Policy_2026-07-03
목적
- 프로젝트가 장기간 개발·운영되는 동안 일관된 유지보수 기준을 정의한다.
1. 유지보수 범위
- 버그 수정
- 성능 개선
- 구조 개선
- 기능 확장
- 문서 갱신

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\05_Operations_Policy_Governance_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
2. 유지보수 원칙
- 기존 아키텍처를 우선 존중한다.
- 구조 변경보다 원인 분석을 먼저 수행한다.
- 임시 코드 대신 구조적 해결을 우선한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\05_Operations_Policy_Governance_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
최종 원칙
유지보수는 기존 기능을 유지하면서 안정성을 높이는 과정이며,
단기 편의보다 장기 일관성을 우선한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\05_Operations_Policy_Governance_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
SOURCE: MASTER_SPEC_추가갱신_프로젝트_장기로드맵_Product_Roadmap_2026-07-03.txt
==================================================
MASTER_SPEC_추가갱신_프로젝트_장기로드맵_Product_Roadmap_2026-07-03
목적
- 프로젝트의 장기 발전 방향과 구현 단계를 시간순이 아니라 기능 성숙도 기준으로 정의한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\05_Operations_Policy_Governance_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
5단계 : 운영 자동화
==================================================
구현 대상
- Recovery Runtime
- Review Runtime
- Audit Runtime
- 운영 대시보드
- 관리자 검토 기능

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\05_Operations_Policy_Governance_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
장기 원칙
==================================================
- 설계를 유지하며 구현을 확장한다.
- Runtime 호환성을 우선한다.
- 실주문보다 안전성을 우선한다.
- 기능 추가보다 구조 일관성을 우선한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\05_Operations_Policy_Governance_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
최종 결론
현재 프로젝트는 기반 아키텍처가 정리된 단계이며,
다음 핵심 목표는 '실주문 준비 계층'의 안정적인 구현이다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\05_Operations_Policy_Governance_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
SOURCE: MASTER_SPEC_추가갱신_프로젝트_종합평가기준_Project_Governance_Framework_2026-07-03.txt
==================================================

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\05_Operations_Policy_Governance_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
MASTER_SPEC_추가갱신_프로젝트_종합평가기준_Project_Governance_Framework_2026-07-03

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\05_Operations_Policy_Governance_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
목적
- 지금까지 정의된 모든 정책, 원칙, 절차를 하나의 거버넌스 체계로 연결하기 위한 최상위 기준 문서이다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\05_Operations_Policy_Governance_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
1. 거버넌스 구성
==================================================
전략
- Product Roadmap
- Milestones

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\05_Operations_Policy_Governance_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
설계
- MASTER_SPEC
- ADR
- Runtime Specification
- Architecture Principles

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\05_Operations_Policy_Governance_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
2. 의사결정 우선순위
==================================================

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\05_Operations_Policy_Governance_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
1. MASTER_SPEC
2. ADR
3. Runtime Specification
4. Architecture Principles
5. 운영/품질 정책
6. 구현 기준
7. 작업 문서

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\05_Operations_Policy_Governance_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
3. 프로젝트 상태 평가
==================================================

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\05_Operations_Policy_Governance_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
4. 변경 통제
==================================================

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\05_Operations_Policy_Governance_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
5. 최상위 원칙
==================================================

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\05_Operations_Policy_Governance_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
본 문서는 프로젝트 전반의 거버넌스 기준이며,
향후 추가되는 정책·절차·구현 기준은 이 체계와 모순되지 않아야 한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\05_Operations_Policy_Governance_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
SOURCE: MASTER_SPEC_추가갱신_프로젝트_최종완료기준_Project_Completion_Criteria_2026-07-03.txt
==================================================

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\05_Operations_Policy_Governance_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
MASTER_SPEC_추가갱신_프로젝트_최종완료기준_Project_Completion_Criteria_2026-07-03
목적
- 프로젝트 전체를 '완료'로 선언하기 위한 최종 기준을 정의한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\05_Operations_Policy_Governance_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
6. 완료 선언 금지 조건
==================================================
다음 중 하나라도 존재하면 프로젝트 완료를 선언하지 않는다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\05_Operations_Policy_Governance_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
최종 원칙
프로젝트 완료는 코드 작성 종료가 아니라,
설계·구현·검증·운영 준비·운영 인증까지 모두 충족된 상태를 의미한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\05_Operations_Policy_Governance_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
SOURCE: MASTER_SPEC_추가갱신_프로젝트_품질보증정책_Quality_Assurance_Policy_2026-07-03.txt
==================================================

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\05_Operations_Policy_Governance_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
MASTER_SPEC_추가갱신_프로젝트_품질보증정책_Quality_Assurance_Policy_2026-07-03
목적
- 프로젝트의 품질을 일관된 기준으로 유지하기 위한 품질보증(QA) 정책을 정의한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\05_Operations_Policy_Governance_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
1. 품질 목표
- 기능 정확성
- 상태 일관성
- Runtime 무결성
- 실주문 안전성
- 복구 가능성
- 추적 가능성

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
MASTER_SPEC merged index - 04_Implementation_Test_Verification
Generated: 2026-07-03 15:22:26
Source zip: C:\Users\JIN KWANG CHUL\Documents\docs\MASTER_SPEC_추가갱신_026-07-03.zip
Source document count: 16

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
3. Policy 단계
==================================================
[ ] APPROVED → EXECUTABLE
[ ] APPROVED → BLOCKED_POLICY
[ ] execution_enabled 변경 없음

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
최종 원칙
각 체크 항목은 독립적으로 검증 가능해야 하며,
선행 항목이 완료되지 않은 상태에서 다음 단계 구현을 시작하지 않는다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
목적
- 프로젝트 전체에서 구현 시 반드시 따라야 하는 코딩 규약을 정의한다.
- 아키텍처 원칙을 실제 코드 수준까지 일관되게 유지하기 위한 기준이다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
7. 문서 규칙
==================================================
구조 변경 시
1. MASTER_SPEC 갱신
2. 작업재개요약 갱신
3. 테스트 결과 기록
최종 원칙
코드는 설계를 구현하는 수단이며,
설계 원칙을 위반하는 편의 구현은 허용하지 않는다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
Execution(향후)
□ Lock
□ Request Hash
□ Final Guard
□ ORDER_QUEUED
Fill(향후)
□ Chejan
□ Position
□ Audit
3. 회귀 원칙
- 새 기능마다 기존 테스트 전체 수행
- 실패 시 원인 확인 전 추가 구현 금지

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
4. 안전 원칙
- SendOrder 호출 금지
- execution_enabled 자동 변경 금지
- 운영 Runtime 직접 수정 금지

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
5. 완료 기준
- 단위 테스트 통과
- 회귀 테스트 통과
- Runtime 부작용 없음
- 문서 갱신 완료
최종 원칙
모든 구현은 테스트가 먼저이며, 테스트 없이 완료 판정을 하지 않는다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
판정 원칙
==================================================
VERIFIED 상태는 다음 조건을 모두 만족해야 한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
최종 원칙
==================================================
기능의 구현 완료와 검증 완료는 동일하지 않다.
프로젝트는 검증 완료를 기준으로 다음 단계로 진행한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
SOURCE: MASTER_SPEC_추가갱신_프로젝트_구현금지목록_Implementation_Prohibitions_2026-07-03.txt
==================================================

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
MASTER_SPEC_추가갱신_프로젝트_구현금지목록_Implementation_Prohibitions_2026-07-03
목적
- 프로젝트 구현 과정에서 절대로 수행하면 안 되는 작업을 한 곳에 모은 기준 문서이다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
7. 문서
- MASTER_SPEC 미갱신 상태로 구조 변경 금지
- 작업재개요약 미갱신 상태로 큰 구조 변경 금지
최종 원칙
안전성보다 편의성을 우선하는 구현은 허용하지 않는다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
SOURCE: MASTER_SPEC_추가갱신_프로젝트_구현기록_템플릿_Implementation_Record_Template_2026-07-03.txt
==================================================

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
MASTER_SPEC_추가갱신_프로젝트_구현기록_템플릿_Implementation_Record_Template_2026-07-03
목적
- 모든 구현 작업을 동일한 형식으로 기록하기 위한 표준 템플릿이다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
기본 정보
==================================================
구현 ID:
작업 일자:
담당:
관련 기능:

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
설계 근거
==================================================
관련 MASTER_SPEC:
관련 ADR:
관련 Runtime:
관련 State Machine:

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
변경 내용
==================================================
변경 파일:
신규 파일:
삭제 파일:
변경 목적:

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
영향 분석
==================================================

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
Runtime 영향:
Controller 영향:
Recovery 영향:
Review 영향:
Audit 영향:

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
□ Definition of Done 충족
□ Verification Matrix 반영
□ Gate 통과
□ Release 준비
최종 원칙
모든 구현은 동일한 기록 형식을 사용하여
설계·구현·검증·문서화를 하나의 작업 단위로 관리한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
SOURCE: MASTER_SPEC_추가갱신_프로젝트_구현단계_게이트_Implementation_Gates_2026-07-03.txt
==================================================

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
MASTER_SPEC_추가갱신_프로젝트_구현단계_게이트_Implementation_Gates_2026-07-03

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
Gate 0 : 설계 승인
==================================================
입력
- 요구사항
- MASTER_SPEC
통과 조건
□ 설계 확정
□ ADR 검토
□ Runtime 영향 분석

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
Gate 5 : 운영 승인
==================================================
통과 조건
□ Runtime 무결성
□ Recovery 준비
□ Review 확인
□ 운영 시작 조건 충족

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
Gate 실패 시 원칙
==================================================
- 다음 Gate 진행 금지
- 원인 분석 후 재검증
- 우회 승인 금지
최종 원칙
모든 구현은 Gate를 순차적으로 통과해야 하며,
Gate를 생략하거나 병합하지 않는다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
SOURCE: MASTER_SPEC_추가갱신_프로젝트_구현단계_산출물맵_Implementation_Deliverables_Map_2026-07-03.txt
==================================================

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
MASTER_SPEC_추가갱신_프로젝트_구현단계_산출물맵_Implementation_Deliverables_Map_2026-07-03

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
1. 설계 단계
==================================================
필수 산출물
- MASTER_SPEC 갱신
- ADR(필요 시)
- Runtime 규격 검토
- 영향 분석

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
2. 구현 단계
==================================================
필수 산출물
- 구현 코드
- 변경 파일 목록
- 변경 범위 설명

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
5. 승인 단계
==================================================
필수 산출물
- Definition of Done 확인
- Verification Matrix 갱신
- Gate 통과 확인

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
6. 운영 단계
==================================================
필수 산출물
- Release 기록
- 운영 변경 이력
- Audit 대상 확인

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
최종 원칙
각 구현 단계는 다음 단계가 사용할 산출물을 남겨야 하며,
산출물이 없는 단계는 완료된 것으로 간주하지 않는다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
SOURCE: MASTER_SPEC_추가갱신_프로젝트_구현우선순위_Execution_Backlog_2026-07-03.txt
==================================================
MASTER_SPEC_추가갱신_프로젝트_구현우선순위_Execution_Backlog_2026-07-03

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
P4
==================================================
- Review Runtime
- Recovery Runtime
- Audit Runtime
- 운영 대시보드

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
우선순위 변경 조건
==================================================
다음 조건 중 하나라도 만족하면 우선순위를 재검토한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
최종 원칙
==================================================
우선순위는 기능의 중요도가 아니라
아키텍처 의존성과 안전성을 기준으로 결정한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
SOURCE: MASTER_SPEC_추가갱신_프로젝트_구현준비도_Readiness_Checklist_2026-07-03.txt
==================================================
MASTER_SPEC_추가갱신_프로젝트_구현준비도_Readiness_Checklist_2026-07-03
목적
- 새로운 구현을 시작하기 전에 프로젝트가 구현 준비 상태인지 확인하기 위한 체크리스트이다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
2. 구현 준비
==================================================
□ 구현 범위 확정
□ 책임 계층 명확
□ 기존 Controller 영향 분석
□ Runtime 변경 여부 확인

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
6. 구현 시작 승인
==================================================
다음 항목이 모두 만족될 때 구현을 시작한다.
□ 설계 준비 완료
□ 테스트 계획 완료
□ 안전성 확인 완료
□ 문서 영향 확인 완료
최종 원칙
구현 준비가 완료되지 않은 상태에서는 코드 작성보다 설계와 영향 분석을 먼저 수행한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
SOURCE: MASTER_SPEC_추가갱신_프로젝트_구현증빙패키지_Evidence_Package_2026-07-03.txt
==================================================
MASTER_SPEC_추가갱신_프로젝트_구현증빙패키지_Evidence_Package_2026-07-03
목적
- 하나의 구현 작업이 완료되었음을 입증하기 위해 반드시 보관해야 하는 증빙 자료를 정의한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
1. 필수 증빙
==================================================

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
3. 증빙 확인 순서
==================================================

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
5. 보관 원칙
==================================================

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
SOURCE: MASTER_SPEC_추가갱신_프로젝트_구현추적표_Implementation_Trace_Register_2026-07-03.txt
==================================================

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
PLANNED
DESIGNED
IMPLEMENTING
TESTING
VERIFIED
RELEASE_READY
COMPLETED
DEFERRED

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
PLANNED
 ↓
DESIGNED
 ↓
IMPLEMENTING
 ↓
TESTING
 ↓
VERIFIED
 ↓
RELEASE_READY
 ↓
COMPLETED
중간 단계를 건너뛰지 않는다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
SOURCE: MASTER_SPEC_추가갱신_프로젝트_마일스톤_Milestones_2026-07-03.txt
==================================================
MASTER_SPEC_추가갱신_프로젝트_마일스톤_Milestones_2026-07-03
목적
- 프로젝트 진행 상황을 단계별 마일스톤으로 정의하여 현재 위치와 다음 목표를 명확히 한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
M3. 실주문 준비 (진행 예정)
==================================================
목표
- Hoga / OrderType Mapper
- ExecutionController
- Final Execution Guard
- Order Lock
- Request Hash
- Execution Request
완료 기준
- Preview와 실행 요청 일관성 확보
- 실주문 미연결 유지

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
M4. 실주문 계층
==================================================
목표
- Kiwoom Boundary
- KiwoomOrderExecutor
- ORDER_QUEUED
- ORDER_SENT
- 주문 응답 처리

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
M5. 체결 계층
==================================================
목표
- Chejan
- Fill Runtime
- Position Runtime
- Close History

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
M6. 운영 계층
==================================================
목표
- Review
- Recovery
- Audit
- 운영 대시보드

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
M7. 안정화
==================================================
목표
- 성능 개선
- 장애 대응 강화
- 운영 리포트
- 장기 유지보수

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
SOURCE: MASTER_SPEC_추가갱신_프로젝트_운영인증_Production_Readiness_Certification_2026-07-03.txt
==================================================

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
MASTER_SPEC_추가갱신_프로젝트_운영인증_Production_Readiness_Certification_2026-07-03
목적
- 프로젝트가 실제 운영(Production)에 진입하기 직전 최종 인증 기준을 정의한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
1. 설계 인증
==================================================
□ MASTER_SPEC 최신 반영
□ ADR 최신 반영
□ Runtime 규격 확정
□ Architecture Principles 준수

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
4. 운영 인증
==================================================
□ Operations Governance 적용
□ Quality Assurance 적용
□ Risk Management 적용
□ Recovery 절차 확인
□ Review 절차 확인
□ Audit 정책 확인

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
최종 인증 결과
==================================================
CERTIFIED
- 운영 진입 승인
CONDITIONAL
- 조건부 승인
REJECTED
- 운영 진입 불가

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
최종 원칙
운영 인증은 기능 완성이 아니라
안전성, 검증 가능성, 운영 일관성이 모두 확보되었음을 확인하는 절차이다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
SOURCE: MASTER_SPEC_추가갱신_프로젝트_운영준비도_Operational_Readiness_Assessment_2026-07-03.txt
==================================================

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
MASTER_SPEC_추가갱신_프로젝트_운영준비도_Operational_Readiness_Assessment_2026-07-03
목적
- 프로젝트가 실제 운영 환경에 진입할 준비가 되었는지 종합적으로 평가하기 위한 기준이다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
1. 아키텍처 준비
==================================================
□ Architecture Principles 준수
□ State Machine 확정
□ Runtime 규격 확정
□ Controller 책임 확정

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
4. 운영 준비
==================================================
□ Operations Governance 검토
□ Risk Management 검토
□ Recovery 절차 확인
□ Review 절차 확인
□ Audit 정책 확인

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
최종 원칙
운영 준비도는 기능 개수로 판단하지 않는다.
안전성, 검증 가능성, 복구 가능성, 운영 일관성을 종합하여 평가한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
SOURCE: MASTER_SPEC_추가갱신_프로젝트_최종통합체크리스트_Final_Integration_Checklist_2026-07-03.txt
==================================================

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
MASTER_SPEC_추가갱신_프로젝트_최종통합체크리스트_Final_Integration_Checklist_2026-07-03
목적
- 프로젝트 각 구성요소를 통합하기 전에 반드시 확인해야 하는 최종 점검 기준을 정의한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
1. 설계
==================================================
□ MASTER_SPEC 최신화
□ ADR 최신화
□ Runtime 규격 일치
□ Architecture Principles 준수

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
7. 운영
==================================================
□ Recovery 준비
□ Review 준비
□ Audit 준비
□ Release 승인

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
최종 승인 기준
==================================================
아래 조건을 모두 만족해야 최종 통합을 시작한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
□ Gate 통과
□ Definition of Done 충족
□ Verification Matrix VERIFIED
□ Evidence Package 완료
□ 문서 갱신 완료
최종 원칙
최종 통합은 구현의 종료가 아니라,
모든 구성요소가 동일한 기준으로 검증된 상태에서만 수행한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
MASTER_SPEC merged index - 03_Architecture
Generated: 2026-07-03 15:22:26
Source zip: C:\Users\JIN KWANG CHUL\Documents\docs\MASTER_SPEC_추가갱신_026-07-03.zip
Source document count: 7

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
Source documents
==================================================
- MASTER_SPEC_추가갱신_Architecture_Dependency_Map_2026-07-03.txt
- MASTER_SPEC_추가갱신_Controller_Layer_호출책임_2026-07-03.txt
- MASTER_SPEC_추가갱신_Recovery_Controller_복구절차_설계_2026-07-03.txt
- MASTER_SPEC_추가갱신_설계검토_체크포인트_Architecture_Review_Checkpoints_2026-07-03.txt
- MASTER_SPEC_추가갱신_설계원칙_Architecture_Principles_2026-07-03.txt
- MASTER_SPEC_추가갱신_프로젝트_문서체계_Document_Architecture_2026-07-03.txt
- MASTER_SPEC_추가갱신_프로젝트_역할책임매트릭스_RACI_Matrix_2026-07-03.txt

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
SOURCE: MASTER_SPEC_추가갱신_Architecture_Dependency_Map_2026-07-03.txt
==================================================
MASTER_SPEC_추가갱신_Architecture_Dependency_Map_2026-07-03

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
작성 목적
- 본 문서는 키움 자동매매 프로젝트의 주요 모듈 간 의존성 방향, 허용 호출, 금지 호출, 책임 경계를 정의하기 위한 MASTER_SPEC 추가 갱신자료이다.
- 지금까지 Process Flow, Order Lifecycle, Controller Layer, Runtime Data Model, order_intent, order_provenance가 정리되었다.
- 본 문서는 이 구조들이 코드상에서 서로 잘못 호출되거나 책임이 섞이지 않도록 하기 위한 최상위 아키텍처 의존성 기준이다.
- 현재 단계에서 코드 수정, 리팩토링, Controller 구현, SendOrder 연결은 하지 않는다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
1. 최상위 의존성 원칙
==================================================

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
4. GUI / Timer / CLI 의존성 규칙
==================================================

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
5. Controller Layer 의존성 규칙
==================================================

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
6. routine_signal_probe / routine_signal_queue
==================================================

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
의존 가능:
- 입력으로 받은 signal/config/state/price dict.
- 순수 helper.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
10. operation_policy_gate
==================================================

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
17. 허용 의존성 목록
==================================================

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
2단계:
- Controller Layer 실제 파일 도입 여부 검토.
- Timer/GUI의 직접 호출을 Controller 호출로 점진 전환.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
19. 코드 리뷰 기준
==================================================
향후 코드 수정 시 반드시 확인:

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
20. 최종 결론
==================================================
Architecture Dependency Map은 프로젝트의 최상위 구조 안전장치이다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
Process Flow는 실행 순서를 설명하고,
Runtime Data Model은 데이터 관계를 설명하며,
Controller Layer는 호출 책임을 설명한다.
Dependency Map은 각 모듈이 누구를 호출할 수 있고 누구를 호출하면 안 되는지 고정한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
SOURCE: MASTER_SPEC_추가갱신_Controller_Layer_호출책임_2026-07-03.txt
==================================================
MASTER_SPEC_추가갱신_Controller_Layer_호출책임_2026-07-03

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
작성 목적
- 본 문서는 주문 파이프라인 Preview 단계 이후, 각 Engine/Queue/Policy/Preflight/Adapter 모듈의 호출 책임을 분리하기 위한 Controller Layer 설계를 MASTER_SPEC에 반영하기 위한 추가 갱신자료이다.
- 본 문서는 코드 구현 문서가 아니라, 프로젝트 전체의 호출 책임(Orchestration)과 모듈 책임 분리를 정의하는 기준 문서이다.
- 현재 단계에서 Controller 구현, SendOrder 연결, Execution 연결, GUI/Timer 자동 연결은 금지한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
2. Controller Layer 도입 목적
==================================================
Controller Layer는 새로운 판단 로직을 만드는 계층이 아니다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
Controller는 “무엇을 판단할지”를 결정하지 않는다.
판단은 기존 Engine/Policy/Preflight 모듈이 한다.
Controller는 “언제 어떤 순서로 호출할지”만 책임진다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
4. SignalController
==================================================

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
6. ApprovalController
==================================================

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
7. OperationPolicyController
==================================================

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
허용 전이:
- APPROVED -> EXECUTABLE
- APPROVED -> BLOCKED_POLICY

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
8. RealPreflightController
==================================================

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
허용 전이:
- EXECUTABLE -> REAL_READY
- EXECUTABLE -> BLOCKED_REAL

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
10. ExecutionController
==================================================

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
11. FillEventController
==================================================

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
13. RecoveryController
==================================================

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
14. Timer/GUI/CLI와 Controller 관계
==================================================

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
원칙:
- Timer/GUI/CLI는 Engine을 직접 호출하지 않는 방향으로 점진 전환한다.
- Timer/GUI/CLI는 Controller를 호출하고, Controller가 Engine/Policy/Preflight를 호출한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
16. 다음 설계 우선순위
==================================================
Controller Layer 문서화 후 다음 설계 후보:

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
17. 최종 결론
==================================================
Controller Layer는 새로운 판단 로직이 아니라 호출 책임을 분리하는 계층이다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
현재 프로젝트는 각 모듈의 단건 기능은 많이 정리되었으나, 다음 단계를 누가 호출하는지에 대한 Orchestration 기준이 부족하다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
SOURCE: MASTER_SPEC_추가갱신_Recovery_Controller_복구절차_설계_2026-07-03.txt
==================================================
MASTER_SPEC_추가갱신_Recovery_Controller_복구절차_설계_2026-07-03

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
1. 기본 원칙
- 서버 상태를 확인하기 전 내부 상태를 정상으로 간주하지 않는다.
- 불명확한 항목은 자동 실행하지 않고 검토관리 대상으로 분류한다.
- Recovery는 주문 실행 기능이 아니라 상태 검증 기능이다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
8. 완료 조건
- Runtime와 서버 상태 일치
- 미확정 항목 없음
- 검토관리 대상 분리 완료
- 자동 실행 없음
최종 원칙
Recovery Controller는 '실행'이 아니라 '검증과 복구 판단'만 담당한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
SOURCE: MASTER_SPEC_추가갱신_설계검토_체크포인트_Architecture_Review_Checkpoints_2026-07-03.txt
==================================================

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
MASTER_SPEC_추가갱신_설계검토_체크포인트_Architecture_Review_Checkpoints_2026-07-03

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
- 책임이 명확한가
- 테스트 가능한가
- Recovery 가능한가
- Audit 가능한가
- Runtime 안정성이 유지되는가
- 실주문 위험이 없는가
최종 원칙
모든 구조 변경은 구현 전에 설계 검토 체크포인트를 통과해야 한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
SOURCE: MASTER_SPEC_추가갱신_설계원칙_Architecture_Principles_2026-07-03.txt
==================================================
MASTER_SPEC_추가갱신_설계원칙_Architecture_Principles_2026-07-03

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
목적
- 프로젝트 전체에서 반드시 지켜야 하는 설계 원칙을 최상위 규칙으로 정의한다.
- 개별 구현보다 우선하는 공통 원칙이다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
4. Runtime 원칙
==================================================
- Runtime은 현재 상태 저장소이다.
- Audit Log는 Runtime을 대체하지 않는다.
- Preview는 Runtime을 변경하지 않는다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
프로젝트의 모든 구현은
'책임 분리, 단방향 의존성, 상태 일관성, 테스트 우선, 안전 우선'
원칙을 항상 만족해야 한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
SOURCE: MASTER_SPEC_추가갱신_프로젝트_문서체계_Document_Architecture_2026-07-03.txt
==================================================
MASTER_SPEC_추가갱신_프로젝트_문서체계_Document_Architecture_2026-07-03

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
목적
- 프로젝트 문서들의 역할, 계층, 참조 순서를 표준화한다.
- 동일한 내용을 여러 문서에 중복 기록하는 것을 최소화한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
1. 문서 계층
==================================================

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
Level 1 : 프로젝트 기준 문서
- MASTER_SPEC
- Architecture Principles
- ADR
- Runtime Specification

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
2. 문서 역할
==================================================
MASTER_SPEC
- 프로젝트의 최종 기준
ADR
- 구조적 의사결정 기록
작업재개요약서
- 다음 작업 연결
MASTER_SPEC 갱신자료
- 변경사항을 MASTER_SPEC에 반영하기 위한 중간 자료
테스트 결과
- 구현 검증 근거

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
3. 문서 작성 원칙
==================================================

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
- 하나의 주제는 하나의 기준 문서가 책임진다.
- 동일 규칙을 여러 문서에 각각 수정하지 않는다.
- 세부 구현은 작업 문서에, 최종 규칙은 MASTER_SPEC에 반영한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
4. 참조 우선순위
==================================================

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
5. 문서 생명주기
==================================================

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
최종 원칙
문서는 프로젝트의 기준이다.
작업 문서는 변경을 설명하고,
MASTER_SPEC는 최종 규칙을 유지한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
SOURCE: MASTER_SPEC_추가갱신_프로젝트_역할책임매트릭스_RACI_Matrix_2026-07-03.txt
==================================================
MASTER_SPEC_추가갱신_프로젝트_역할책임매트릭스_RACI_Matrix_2026-07-03
목적
- 프로젝트 내부 구성요소의 책임과 권한을 명확히 정의한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
주요 구성요소
==================================================
요구사항
- 사용자 : A/R
- MASTER_SPEC : C
- 구현 : I
아키텍처 변경
- MASTER_SPEC : A
- ADR : R
- 구현 : C
Engine
- Engine : R
- Controller : A
- GUI : I
Controller
- Controller : R/A
- Engine : C
- Runtime : C
Runtime
- Runtime : R
- Controller : A
Boundary
- Boundary : R
- Controller : A
- Engine : I

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
책임 원칙
==================================================
- 하나의 기능은 하나의 최종 책임(Accountable)을 가진다.
- Engine은 정책 판단만 수행한다.
- Controller는 흐름과 상태를 책임진다.
- Boundary는 외부 통신만 책임진다.
- Runtime은 데이터 저장만 책임진다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
최종 원칙
==================================================
책임이 겹치는 기능은 구현 전에 역할을 재정의하며,
최종 책임자가 없는 기능은 구현을 시작하지 않는다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
MASTER_SPEC merged index - 02_Runtime_Data_Model
Generated: 2026-07-03 15:22:26
Source zip: C:\Users\JIN KWANG CHUL\Documents\docs\MASTER_SPEC_추가갱신_026-07-03.zip
Source document count: 9

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
작성 목적
- 본 문서는 키움 자동매매 프로젝트의 runtime 계열 JSON/JSONL 파일 규격을 하나의 기준으로 통합하기 위한 초안이다.
- 기존 설계 문서에서 분산 정의된 routine_signals, order_queue, real_trade_guard, order_locks, order_executions, fills, positions, review_items, audit_log 등의 역할과 필드, 생성 시점, 수정 주체를 통합한다.
- 현재 문서는 구현 문서가 아니라 Runtime 파일 규격 기준 문서이다.
- 현재 단계에서 새 runtime 파일 생성, 기존 runtime 파일 구조 변경, 코드 수정은 하지 않는다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
1. Runtime 파일 관리 기본 원칙
==================================================

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
2. Runtime 파일 목록
==================================================

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
3. ID 관계 요약
==================================================

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
수정 주체
- 향후 Guard UI/운영자 확인 절차
- Recovery/로그인/계좌 선택 동기화 계층, 설계 후

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
생성 주체
- 향후 ReviewController
- RecoveryController
- FillEventController, 불일치 시
- ExecutionController, 위험 차단 시

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
18. 다음 구현 전 확인사항
==================================================
Runtime 파일을 실제 구현하기 전 확인해야 할 것:

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
19. 최종 결론
==================================================
Runtime 파일 규격은 프로젝트의 데이터 안정성 기준이다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
SOURCE: MASTER_SPEC_추가갱신_Runtime_Data_Model_Entity_Relationship_2026-07-03.txt
==================================================

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
MASTER_SPEC_추가갱신_Runtime_Data_Model_Entity_Relationship_2026-07-03

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
작성 목적
- 본 문서는 키움 자동매매 프로젝트의 runtime JSON 파일들이 어떤 엔티티를 담고, 서로 어떤 ID로 연결되는지 정의하기 위한 MASTER_SPEC 추가 갱신자료이다.
- 지금까지는 주문 파이프라인의 Process Flow를 설계했다.
- 본 문서는 Process Flow와 짝을 이루는 Runtime Data Model / Entity Relationship 기준 문서이다.
- 현재 단계에서 코드 수정, 파일 구조 변경, 새 JSON 파일 생성은 하지 않는다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
1. 현재 프로젝트 데이터 구조의 핵심 문제
==================================================
현재 프로젝트는 파일 기반 Runtime 구조를 사용한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
2. Runtime Entity 전체 개념도
==================================================
권장 엔티티 흐름:

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
주요 식별자:
- routine_name
- routine_id, 향후 가능
- routine_path
- rules_path
- engine

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
관계:
- Routine은 Signal을 생성한다.
- Signal은 routine/routine_name/engine을 통해 Routine과 연결된다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
주요 필드:
- id
- created_at
- updated_at
- routine
- code
- name
- signal
- reason
- matched_groups
- details
- signal_index
- delay_bar
- tick_key
- status
- source
- execution_enabled

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
권장 관계 필드:
- id = signal_id
- routine
- engine, 향후 보존 권장
- code
- tick_key

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
5. 파일별 역할과 관계
==================================================

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
6. Runtime 관계도
==================================================

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
7. 현재 확정된 메타데이터
==================================================

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
8. 현재 미확정 관계
==================================================

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
원칙:
- 불명확한 관계는 자동 정상 처리하지 않는다.
- 내부 상태와 Kiwoom 서버 상태가 불일치하면 검토관리 또는 운영정지 우선.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
11. 다음 설계 우선순위
==================================================
Runtime Data Model 이후 다음 설계 후보:

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
12. 최종 결론
==================================================
Runtime Data Model은 주문 파이프라인의 데이터 관계 기준이다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
Process Flow가 “무엇이 어떤 순서로 실행되는가”를 설명한다면,
Runtime Data Model은 “각 데이터가 어떤 ID로 연결되는가”를 설명한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
현재 프로젝트가 실주문/체결/복구/검토관리로 확장되려면 signal_id, order_id, execution_id, kiwoom_order_no, fill_id, position_id의 관계를 먼저 고정해야 한다.
현재 단계에서는 문서 기준만 고정하고, 새 파일/상태/실주문 구현은 하지 않는다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
SOURCE: MASTER_SPEC_추가갱신_프로젝트_Runtime_카탈로그_Runtime_Catalog_2026-07-03.txt
==================================================

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
MASTER_SPEC_추가갱신_프로젝트_Runtime_카탈로그_Runtime_Catalog_2026-07-03
목적
- 프로젝트에서 사용하는 Runtime 파일의 역할과 생명주기를 표준화한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
1. Runtime 기본 원칙
==================================================
- Runtime은 실행 상태를 저장한다.
- Runtime은 Controller를 통해서만 변경한다.
- Engine은 Runtime을 읽을 수 있으나 직접 수정하지 않는다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
최종 원칙
Runtime은 프로젝트의 단일 실행 상태 저장소이며,
구조 변경은 호환성과 복구 가능성을 최우선으로 고려한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
SOURCE: MASTER_SPEC_추가갱신_프로젝트_구성요소의존성맵_Component_Dependency_Map_2026-07-03.txt
==================================================

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
MASTER_SPEC_추가갱신_프로젝트_구성요소의존성맵_Component_Dependency_Map_2026-07-03
목적
- 프로젝트의 주요 구성요소 간 의존 관계를 정의하고 허용되는 호출 방향을 명확히 한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
최종 원칙
의존성은 항상 상위에서 하위로만 흐르며,
역방향 의존이나 순환 의존은 허용하지 않는다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
SOURCE: MASTER_SPEC_추가갱신_프로젝트_데이터계약카탈로그_Data_Contract_Catalog_2026-07-03.txt
==================================================

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
MASTER_SPEC_추가갱신_프로젝트_데이터계약카탈로그_Data_Contract_Catalog_2026-07-03
목적
- 프로젝트에서 교환되는 주요 데이터 객체의 계약(Contract)과 책임을 표준화한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
1. 데이터 계약 원칙
==================================================
- 데이터 구조는 명시적으로 정의한다.
- 필수 필드와 선택 필드를 구분한다.
- 하위 호환성을 우선 유지한다.
- 계약 변경 시 Runtime Specification을 함께 갱신한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
2. Signal Contract
==================================================
필수
- id
- routine
- code
- signal
- status
- created_at

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
선택
- reason
- matched_groups
- details
- signal_index
- delay_bar

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
6. Position Contract(예정)
==================================================
- position_id
- code
- quantity
- average_price
- updated_at

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
최종 원칙
데이터 계약은 구현이 아니라 시스템 간 약속이며,
모든 변경은 추적 가능하고 하위 호환성을 고려해야 한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
SOURCE: MASTER_SPEC_추가갱신_프로젝트_모듈카탈로그_Module_Catalog_2026-07-03.txt
==================================================
MASTER_SPEC_추가갱신_프로젝트_모듈카탈로그_Module_Catalog_2026-07-03
목적
- 프로젝트를 구성하는 주요 모듈의 책임과 입·출력을 한 곳에서 조회할 수 있는 기준 문서이다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
1. GUI 계층
==================================================
역할
- 사용자 입력
- 화면 표시
- Controller 호출
입력
- 사용자 이벤트
출력
- Controller 요청

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
7. 모듈 변경 원칙
==================================================
- 책임 변경 시 MASTER_SPEC 갱신
- 입출력 변경 시 Runtime 규격 검토
- 의존성 변경 시 Component Dependency Map 검토

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
최종 원칙
각 모듈은 하나의 핵심 책임을 가지며,
입력·출력·의존성은 명확하게 문서화되어야 한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
1. 기본 원칙
==================================================
- 모든 상태 전이는 State Machine을 따른다.
- 상태는 Controller만 변경한다.
- 허용되지 않은 전이는 BLOCKED 처리한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
최종 원칙
상태는 프로젝트의 운영 흐름을 표현하는 기준이며,
모든 상태 변경은 검증 가능하고 추적 가능해야 한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
SOURCE: MASTER_SPEC_추가갱신_프로젝트_이벤트카탈로그_Event_Catalog_2026-07-03.txt
==================================================
MASTER_SPEC_추가갱신_프로젝트_이벤트카탈로그_Event_Catalog_2026-07-03
목적
- 프로젝트에서 발생하는 주요 이벤트와 이벤트 흐름을 표준화한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
2. 이벤트 처리 흐름
==================================================
Event
→ Controller
→ Engine(필요 시)
→ Runtime 갱신
→ Boundary(필요 시)
→ UI 갱신

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
4. 이벤트 처리 원칙
==================================================
- 이벤트는 단일 Controller를 통해 처리한다.
- 하나의 이벤트는 하나의 책임을 가진다.
- 실패 이벤트는 추적 가능해야 한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
최종 원칙
이벤트는 프로젝트의 흐름을 연결하는 단위이며,
모든 이벤트는 생성부터 종료까지 추적 가능해야 한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
SOURCE: MASTER_SPEC_추가갱신_프로젝트_인터페이스카탈로그_Interface_Catalog_2026-07-03.txt
==================================================

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
MASTER_SPEC_추가갱신_프로젝트_인터페이스카탈로그_Interface_Catalog_2026-07-03
목적
- 프로젝트 내부 계층 간 인터페이스와 입·출력 계약(Contract)을 표준화한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
1. 인터페이스 원칙
==================================================
- 계층 간 통신은 공개 인터페이스를 통해 수행한다.
- 내부 구현은 외부에 노출하지 않는다.
- 인터페이스 변경은 하위 호환성을 우선 고려한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
2. GUI ↔ Controller
==================================================
입력
- 사용자 이벤트
출력
- 처리 결과
- 화면 갱신 요청

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
3. Controller ↔ Engine
==================================================
입력
- Runtime(Read)
- Config
- Event
출력
- 계산 결과
- Signal
- Policy 결과

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
7. 변경 원칙
==================================================
- 인터페이스 변경 시 관련 테스트 갱신
- Runtime 계약 변경 시 Runtime Specification 갱신
- 공개 인터페이스는 문서와 함께 관리

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
최종 원칙
인터페이스는 계층 간 계약이며,
구현보다 계약의 안정성을 우선한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
최근 확인된 테스트 결과:
- tests.test_kiwoom_order_adapter_preview: Ran 5 tests, OK
- preflight/policy/approval 회귀 묶음: Ran 19 tests, OK
7. 불변 원칙

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
1. 기본 원칙
- Chejan은 주문 판단을 하지 않는다.
- Chejan은 새로운 Order를 생성하지 않는다.
- 체결 정보는 기존 execution/order와 매핑되어야 한다.
2. 연결 흐름

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
5. Position 갱신 원칙
- Position은 Fill 결과로만 변경한다.
- SendOrder 성공만으로 Position을 변경하지 않는다.
- 부분체결도 Fill 단위로 누적한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
최종 원칙
Chejan/Fill 계층은 '실제 발생한 체결 사실'만 반영하며,
주문 생성이나 전략 판단에는 관여하지 않는다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
2. 기본 원칙
- 청산 대상은 Position이다.
- Position이 없으면 청산하지 않는다.
- 청산 완료는 마지막 Fill로 확정한다.
- SendOrder 성공은 청산 완료가 아니다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
현재 프로젝트는 Adapter Request Preview까지 도달했지만, 아직 Final Execution Guard를 통과할 수 있는 order는 없어야 한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
order_type/hoga는 프로젝트 전체에서 단 한 곳(ExecutionController Mapper)에서만 확정한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
목적
- 프로젝트 내부 도메인과 Kiwoom OpenAPI 사이의 경계를 명확히 정의한다.
- 모든 실주문과 서버 통신은 단일 Boundary를 통해서만 수행하는 것을 원칙으로 한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
1. 기본 원칙
- Domain Engine은 Kiwoom API를 직접 호출하지 않는다.
- GUI는 Kiwoom API를 직접 호출하지 않는다.
- Timer는 Kiwoom API를 직접 호출하지 않는다.
- SendOrder는 KiwoomOrderExecutor만 호출할 수 있다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
최종 원칙
Kiwoom Boundary는 '외부 시스템과의 통신 계층'이며,
비즈니스 판단은 절대 포함하지 않는다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
order_intent는 주문 후보가 아직 hoga/order_type/UI 출처를 확정하지 못했다는 사실을 명시하는 진단 필드이다.
이 필드는 향후 UI state 기반 주문방식 매핑을 안전하게 연결하기 위한 준비 단계이다.
현재 단계에서 가장 중요한 원칙은 다음과 같다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
9. 구현 순서
1) 문서 확정
2) Runtime 구조 확정
3) Lock helper
4) ExecutionController 연동
5) SendOrder 연동
최종 원칙
Lock은 중복 실행 방지 장치이며 ExecutionController만 생성 권한을 가진다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
1. 기본 원칙
- 상태는 순방향 전이를 원칙으로 한다.
- 임의 점프 전이 금지.
- 상태 전이는 해당 책임 모듈만 수행한다.
- 상태 변경은 Audit Log 기록 대상이다.
2. 주문 상태 흐름

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
5. 복구 원칙
Recovery는 상태를 임의 변경하지 않는다.
서버 상태 확인 후 필요한 경우 검토관리로 이동한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
8. 최종 원칙
주문 상태는 하나의 State Machine으로 관리하며,
상태 전이는 지정된 Controller만 수행한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
1. 기본 원칙
- Position은 Fill 결과로만 생성·변경된다.
- SendOrder 성공만으로 Position을 변경하지 않는다.
- 부분체결은 누적 반영한다.
- Kiwoom 잔고와 내부 Position은 주기적으로 비교한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
10. 최종 원칙
Position은 실제 보유 사실을 표현하는 엔티티이며,
항상 Fill과 Kiwoom 잔고를 기준으로 관리한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
4. 사용 원칙
- active Request Hash가 존재하면 동일 주문 실행 금지
- Hash 충돌 시 SendOrder 호출 금지
- Lock과 Hash를 함께 확인

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
최종 원칙
Request Hash는 Lock과 함께 실주문 직전의 마지막 중복 실행 방지 기준으로 사용한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
1. 기본 원칙
- 불명확한 상태는 자동 정상 처리하지 않는다.
- Kiwoom 서버와 내부 상태가 불일치하면 검토관리를 우선한다.
- Audit Log는 근거를 제공하지만 검토관리 여부를 결정하지 않는다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
5. 복귀 원칙
검토관리에서 복귀하려면
- 원인 확인
- 서버 상태 확인
- 내부 상태 일치 확인
- Audit Log 확인
- 운영자 승인
자동 복귀 금지.
6. Runtime 연계
향후 후보
- review_items.json

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
9. 금지
- 검토관리 자동 삭제
- 서버 조회 없이 자동 복귀
- Review를 상태 저장소처럼 사용
- Review를 우회하여 SendOrder 수행
최종 원칙
검토관리는 '자동 처리하지 말아야 하는 상황'을 안전하게 격리하기 위한 운영 계층이다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
작성 목적
- 본 문서는 주문 파이프라인 Preview 단계 이후, 실제 SendOrder로 넘어가기 전에 반드시 확정해야 하는 실행 책임, ORDER_QUEUED 의미, 중복주문 방지, 주문 생명주기 정책을 고정하기 위한 MASTER_SPEC 추가 갱신자료이다.
- 본 문서는 코드 구현 문서가 아니라 실주문 전 실행 철학과 상태 모델을 정의하는 기준 문서이다.
- 현재 단계에서 SendOrder, Executor, Adapter 실호출, Timer/GUI 자동 연결은 금지 상태로 유지한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
2. execution_enabled 책임 정의
==================================================
2.1 기본 원칙

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
3. operator_confirmed 책임 정의
==================================================
3.1 기본 원칙
operator_confirmed는 실주문을 운영자가 확인했는지 나타내는 전역 guard 값이다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
11. 최종 결론
==================================================
현재 프로젝트는 Adapter Request Preview까지 안전하게 도달했다.
이후 실주문으로 넘어가기 위해서는 코드 구현보다 아래 정책 고정이 우선이다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\00_Final_Index_Reference_Map_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
MASTER_SPEC merged index - 00_Final_Index_Reference_Map
Generated: 2026-07-03 15:22:26
Source zip: C:\Users\JIN KWANG CHUL\Documents\docs\MASTER_SPEC_추가갱신_026-07-03.zip
Source document count: 3

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\00_Final_Index_Reference_Map_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
Source documents
==================================================
- MASTER_SPEC_추가갱신_프로젝트_의사결정기록_ADR_Index_2026-07-03.txt
- MASTER_SPEC_추가갱신_프로젝트_참조우선순위_Reference_Priority_Guide_2026-07-03.txt
- MASTER_SPEC_추가갱신_프로젝트_통합참조맵_Integrated_Reference_Map_2026-07-03.txt

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\00_Final_Index_Reference_Map_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
SOURCE: MASTER_SPEC_추가갱신_프로젝트_의사결정기록_ADR_Index_2026-07-03.txt
==================================================
MASTER_SPEC_추가갱신_프로젝트_의사결정기록_ADR_Index_2026-07-03

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\00_Final_Index_Reference_Map_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
목적
- 프로젝트에서 이미 확정된 중요한 구조적 의사결정을 한 곳에 기록한다.
- 향후 동일한 논의를 반복하거나 기존 결정을 뒤집는 일을 줄이기 위한 기준 문서이다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\00_Final_Index_Reference_Map_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
ADR-001
==================================================
주제
루틴은 주문을 실행하지 않는다.
결정
- 루틴의 책임은 Signal 생성까지이다.
- 주문 실행은 별도 주문 파이프라인이 담당한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\00_Final_Index_Reference_Map_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
결정
- evaluate_* : 메모리 결과만 반환
- build_* : 객체 생성
- apply_* : Runtime 반영

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\00_Final_Index_Reference_Map_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
ADR-003
==================================================
주제
실주문은 단일 진입점만 허용한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\00_Final_Index_Reference_Map_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
ADR-005
==================================================
주제
Position은 Fill 결과이다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\00_Final_Index_Reference_Map_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
ADR-007
==================================================
주제
Runtime 파일은 역할별로 분리한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\00_Final_Index_Reference_Map_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
ADR-008
==================================================
주제
안전성을 기능보다 우선한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\00_Final_Index_Reference_Map_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
최종 원칙
ADR은 프로젝트의 구조적 합의 사항이며,
새로운 결정이 기존 ADR과 충돌할 경우 기존 ADR을 먼저 검토한 후 변경 여부를 판단한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\00_Final_Index_Reference_Map_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
SOURCE: MASTER_SPEC_추가갱신_프로젝트_참조우선순위_Reference_Priority_Guide_2026-07-03.txt
==================================================

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\00_Final_Index_Reference_Map_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
MASTER_SPEC_추가갱신_프로젝트_참조우선순위_Reference_Priority_Guide_2026-07-03
목적
- 프로젝트 구현과 유지보수 시 어떤 문서를 어떤 순서로 참조해야 하는지 표준 우선순위를 정의한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\00_Final_Index_Reference_Map_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
1. 최상위 기준
==================================================
1. MASTER_SPEC
2. ADR
3. Runtime Specification
위 세 문서는 프로젝트의 공식 기준이다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\00_Final_Index_Reference_Map_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
2. 아키텍처 기준
==================================================
- Architecture Principles
- State Machine
- Runtime Data Model
- Document Architecture

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\00_Final_Index_Reference_Map_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
7. 충돌 해결 원칙
==================================================
문서 간 내용이 충돌하면 다음 순서를 따른다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\00_Final_Index_Reference_Map_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
MASTER_SPEC
→ ADR
→ Runtime Specification
→ Architecture Principles
→ 운영 정책
→ 구현 기준
→ 작업 문서

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\00_Final_Index_Reference_Map_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
최종 원칙
새로운 구현이나 구조 변경을 시작하기 전에
반드시 상위 기준 문서를 먼저 확인하고,
작업 문서는 보조 자료로 활용한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\00_Final_Index_Reference_Map_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
SOURCE: MASTER_SPEC_추가갱신_프로젝트_통합참조맵_Integrated_Reference_Map_2026-07-03.txt
==================================================

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\00_Final_Index_Reference_Map_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
MASTER_SPEC_추가갱신_프로젝트_통합참조맵_Integrated_Reference_Map_2026-07-03

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\00_Final_Index_Reference_Map_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
목적
- 프로젝트의 핵심 문서, 코드 계층, Runtime, 테스트를 하나의 참조 맵으로 연결한다.
- 새로운 기능을 구현할 때 어떤 문서를 먼저 확인해야 하는지 기준을 제공한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\00_Final_Index_Reference_Map_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
1. 요구사항 → 설계
==================================================
요구사항
 ↓
MASTER_SPEC
 ↓
ADR
 ↓
Architecture Principles
 ↓
Runtime Specification

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\00_Final_Index_Reference_Map_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
최종 원칙
- 새로운 구현은 반드시 설계 문서를 먼저 확인한다.
- Runtime 변경은 Runtime Specification을 기준으로 한다.
- 운영 기준은 Operations Governance를 우선 참조한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL\00_MASTER_SPEC_merged_INDEX.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:21:58 | 분류: MASTER_SPEC]
MASTER_SPEC MERGED INDEX
Generated: 2026-07-03 15:21:58
Source zip: C:\Users\JIN KWANG CHUL\Documents\docs\MASTER_SPEC_추가갱신_026-07-03.zip
Total source TXT documents: 76

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL\00_MASTER_SPEC_merged_INDEX.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:21:58 | 분류: MASTER_SPEC]
==================================================
Source assignment
==================================================
- [00_Final_Index_Reference_Map] MASTER_SPEC_추가갱신_Final_Execution_Guard_최종실행게이트_2026-07-03.txt
- [00_Final_Index_Reference_Map] MASTER_SPEC_추가갱신_프로젝트_문서체계_Document_Architecture_2026-07-03.txt
- [00_Final_Index_Reference_Map] MASTER_SPEC_추가갱신_프로젝트_의사결정기록_ADR_Index_2026-07-03.txt
- [00_Final_Index_Reference_Map] MASTER_SPEC_추가갱신_프로젝트_참조우선순위_Reference_Priority_Guide_2026-07-03.txt
- [00_Final_Index_Reference_Map] MASTER_SPEC_추가갱신_프로젝트_최종통합체크리스트_Final_Integration_Checklist_2026-07-03.txt
- [00_Final_Index_Reference_Map] MASTER_SPEC_추가갱신_프로젝트_통합참조맵_Integrated_Reference_Map_2026-07-03.txt
- [01_Order_Pipeline] MASTER_SPEC_추가갱신_ADAPTER_READY_미사용정책_2026-07-03.txt
- [01_Order_Pipeline] MASTER_SPEC_추가갱신_Chejan_Fill_Event_Lifecycle_설계_2026-07-03.txt
- [01_Order_Pipeline] MASTER_SPEC_추가갱신_Close_Liquidation_Model_청산모델_설계_2026-07-03.txt
- [01_Order_Pipeline] MASTER_SPEC_추가갱신_Execution_Request_order_executions_설계_2026-07-03.txt
- [01_Order_Pipeline] MASTER_SPEC_추가갱신_Hoga_OrderType_매핑설계_2026-07-03.txt
- [01_Order_Pipeline] MASTER_SPEC_추가갱신_Kiwoom_Boundary_API_경계설계_2026-07-03.txt
- [01_Order_Pipeline] MASTER_SPEC_추가갱신_order_intent_미확정진단필드_2026-07-03.txt
- [01_Order_Pipeline] MASTER_SPEC_추가갱신_Order_Lock_Manager_설계_2026-07-03.txt
- [01_Order_Pipeline] MASTER_SPEC_추가갱신_order_provenance_주문생성이력_2026-07-03.txt
- [01_Order_Pipeline] MASTER_SPEC_추가갱신_Order_State_Machine_주문상태머신_설계_2026-07-03.txt
- [01_Order_Pipeline] MASTER_SPEC_추가갱신_Position_Model_보유상태_설계_2026-07-03.txt
- [01_Order_Pipeline] MASTER_SPEC_추가갱신_Request_Hash_중복실행방지_설계_2026-07-03.txt
- [01_Order_Pipeline] MASTER_SPEC_추가갱신_Review_Management_주문파이프라인연계_2026-07-03.txt
- [01_Order_Pipeline] MASTER_SPEC_추가갱신_실주문실행책임_ORDER_QUEUED_주문생명주기_2026-07-03.txt
- [02_Runtime_Data_Model] MASTER_SPEC_전체_Runtime_파일규격_최종정의_초안_2026-07-03.txt
- [02_Runtime_Data_Model] MASTER_SPEC_추가갱신_Runtime_Data_Model_Entity_Relationship_2026-07-03.txt
- [02_Runtime_Data_Model] MASTER_SPEC_추가갱신_프로젝트_Runtime_카탈로그_Runtime_Catalog_2026-07-03.txt
- [02_Runtime_Data_Model] MASTER_SPEC_추가갱신_프로젝트_구성요소의존성맵_Component_Dependency_Map_2026-07-03.txt
- [02_Runtime_Data_Model] MASTER_SPEC_추가갱신_프로젝트_데이터계약카탈로그_Data_Contract_Catalog_2026-07-03.txt
- [02_Runtime_Data_Model] MASTER_SPEC_추가갱신_프로젝트_모듈카탈로그_Module_Catalog_2026-07-03.txt
- [02_Runtime_Data_Model] MASTER_SPEC_추가갱신_프로젝트_상태전이카탈로그_State_Transition_Catalog_2026-07-03.txt
- [02_Runtime_Data_Model] MASTER_SPEC_추가갱신_프로젝트_이벤트카탈로그_Event_Catalog_2026-07-03.txt
- [02_Runtime_Data_Model] MASTER_SPEC_추가갱신_프로젝트_인터페이스카탈로그_Interface_Catalog_2026-07-03.txt
- [03_Architecture] MASTER_SPEC_추가갱신_Architecture_Dependency_Map_2026-07-03.txt
- [03_Architecture] MASTER_SPEC_추가갱신_Controller_Layer_호출책임_2026-07-03.txt
- [03_Architecture] MASTER_SPEC_추가갱신_Recovery_Controller_복구절차_설계_2026-07-03.txt
- [03_Architecture] MASTER_SPEC_추가갱신_설계검토_체크포인트_Architecture_Review_Checkpoints_2026-07-03.txt
- [03_Architecture] MASTER_SPEC_추가갱신_설계원칙_Architecture_Principles_2026-07-03.txt
- [03_Architecture] MASTER_SPEC_추가갱신_프로젝트_역할책임매트릭스_RACI_Matrix_2026-07-03.txt
- [04_Implementation_Test_Verification] MASTER_SPEC_추가갱신_구현체크리스트_Implementation_Checklist_2026-07-03.txt
- [04_Implementation_Test_Verification] MASTER_SPEC_추가갱신_코딩규약_Implementation_Standards_2026-07-03.txt
- [04_Implementation_Test_Verification] MASTER_SPEC_추가갱신_테스트전략_Test_Strategy_2026-07-03.txt
- [04_Implementation_Test_Verification] MASTER_SPEC_추가갱신_프로젝트_검증매트릭스_Verification_Matrix_2026-07-03.txt
- [04_Implementation_Test_Verification] MASTER_SPEC_추가갱신_프로젝트_구현금지목록_Implementation_Prohibitions_2026-07-03.txt
- [04_Implementation_Test_Verification] MASTER_SPEC_추가갱신_프로젝트_구현기록_템플릿_Implementation_Record_Template_2026-07-03.txt
- [04_Implementation_Test_Verification] MASTER_SPEC_추가갱신_프로젝트_구현단계_게이트_Implementation_Gates_2026-07-03.txt
- [04_Implementation_Test_Verification] MASTER_SPEC_추가갱신_프로젝트_구현단계_산출물맵_Implementation_Deliverables_Map_2026-07-03.txt
- [04_Implementation_Test_Verification] MASTER_SPEC_추가갱신_프로젝트_구현우선순위_Execution_Backlog_2026-07-03.txt
- [04_Implementation_Test_Verification] MASTER_SPEC_추가갱신_프로젝트_구현준비도_Readiness_Checklist_2026-07-03.txt
- [04_Implementation_Test_Verification] MASTER_SPEC_추가갱신_프로젝트_구현증빙패키지_Evidence_Package_2026-07-03.txt
- [04_Implementation_Test_Verification] MASTER_SPEC_추가갱신_프로젝트_구현추적표_Implementation_Trace_Register_2026-07-03.txt
- [04_Implementation_Test_Verification] MASTER_SPEC_추가갱신_프로젝트_마일스톤_Milestones_2026-07-03.txt
- [04_Implementation_Test_Verification] MASTER_SPEC_추가갱신_프로젝트_운영인증_Production_Readiness_Certification_2026-07-03.txt
- [04_Implementation_Test_Verification] MASTER_SPEC_추가갱신_프로젝트_운영준비도_Operational_Readiness_Assessment_2026-07-03.txt
- [05_Operations_Policy_Governance] MASTER_SPEC_추가갱신_프로젝트_개발운영_라이프사이클_Development_Lifecycle_2026-07-03.txt
- [05_Operations_Policy_Governance] MASTER_SPEC_추가갱신_프로젝트_릴리즈정책_Release_Management_Policy_2026-07-03.txt
- [05_Operations_Policy_Governance] MASTER_SPEC_추가갱신_프로젝트_백업및복구정책_Backup_Recovery_Policy_2026-07-03.txt
- [05_Operations_Policy_Governance] MASTER_SPEC_추가갱신_프로젝트_변경관리정책_Change_Management_Policy_2026-07-03.txt
- [05_Operations_Policy_Governance] MASTER_SPEC_추가갱신_프로젝트_성숙도모델_Project_Maturity_Model_2026-07-03.txt
- [05_Operations_Policy_Governance] MASTER_SPEC_추가갱신_프로젝트_완성도평가_Completion_Assessment_2026-07-03.txt
- [05_Operations_Policy_Governance] MASTER_SPEC_추가갱신_프로젝트_운영인수기준_Operational_Acceptance_Criteria_2026-07-03.txt
- [05_Operations_Policy_Governance] MASTER_SPEC_추가갱신_프로젝트_운영정책_Operations_Governance_2026-07-03.txt
- [05_Operations_Policy_Governance] MASTER_SPEC_추가갱신_프로젝트_위험관리정책_Risk_Management_Policy_2026-07-03.txt
- [05_Operations_Policy_Governance] MASTER_SPEC_추가갱신_프로젝트_유지보수정책_Maintenance_Policy_2026-07-03.txt
- [05_Operations_Policy_Governance] MASTER_SPEC_추가갱신_프로젝트_장기로드맵_Product_Roadmap_2026-07-03.txt
- [05_Operations_Policy_Governance] MASTER_SPEC_추가갱신_프로젝트_종합평가기준_Project_Governance_Framework_2026-07-03.txt
- [05_Operations_Policy_Governance] MASTER_SPEC_추가갱신_프로젝트_최종완료기준_Project_Completion_Criteria_2026-07-03.txt
- [05_Operations_Policy_Governance] MASTER_SPEC_추가갱신_프로젝트_품질보증정책_Quality_Assurance_Policy_2026-07-03.txt
- [06_Glossary] MASTER_SPEC_추가갱신_용어사전_Glossary_2026-07-03.txt
- [06_Glossary] MASTER_SPEC_추가갱신_프로젝트_용어사전_Domain_Glossary_2026-07-03.txt
- [90_Misc] MASTER_SPEC_갱신자료_2026-07-03.txt
- [90_Misc] MASTER_SPEC_갱신자료_2026-07-03_주문파이프라인_Preview.txt
- [90_Misc] MASTER_SPEC_최종_MASTER_SPEC_반영목록_2026-07-03.txt
- [90_Misc] MASTER_SPEC_추가갱신_Audit_Log_감사로그_설계_2026-07-03.txt
- [90_Misc] MASTER_SPEC_추가갱신_구현단계별_완료기준_Definition_of_Done_2026-07-03.txt
- [90_Misc] MASTER_SPEC_추가갱신_실구현_우선순위_착수계획_2026-07-03.txt
- [90_Misc] MASTER_SPEC_추가갱신_전체아키텍처_로드맵_2026-07-03.txt
- [90_Misc] MASTER_SPEC_추가갱신_프로젝트_아키텍처_최종인덱스_2026-07-03.txt
- [90_Misc] MASTER_SPEC_추가갱신_프로젝트_추적성매트릭스_Traceability_Matrix_2026-07-03.txt
- [90_Misc] 고정역할정의_ChatGPT_Codex_협업기준_v2026-07-03.txt

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL\merged_by_index\90_Misc_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:21:58 | 분류: MASTER_SPEC]
MASTER_SPEC merged index - 90_Misc
Generated: 2026-07-03 15:21:58
Source zip: C:\Users\JIN KWANG CHUL\Documents\docs\MASTER_SPEC_추가갱신_026-07-03.zip
Source document count: 10

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL\merged_by_index\06_Glossary_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:21:58 | 분류: MASTER_SPEC]
MASTER_SPEC merged index - 06_Glossary
Generated: 2026-07-03 15:21:58
Source zip: C:\Users\JIN KWANG CHUL\Documents\docs\MASTER_SPEC_추가갱신_026-07-03.zip
Source document count: 2

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL\merged_by_index\05_Operations_Policy_Governance_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:21:58 | 분류: MASTER_SPEC]
MASTER_SPEC merged index - 05_Operations_Policy_Governance
Generated: 2026-07-03 15:21:58
Source zip: C:\Users\JIN KWANG CHUL\Documents\docs\MASTER_SPEC_추가갱신_026-07-03.zip
Source document count: 14

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:21:58 | 분류: MASTER_SPEC]
MASTER_SPEC merged index - 04_Implementation_Test_Verification
Generated: 2026-07-03 15:21:58
Source zip: C:\Users\JIN KWANG CHUL\Documents\docs\MASTER_SPEC_추가갱신_026-07-03.zip
Source document count: 15

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:21:58 | 분류: MASTER_SPEC]
MASTER_SPEC merged index - 03_Architecture
Generated: 2026-07-03 15:21:58
Source zip: C:\Users\JIN KWANG CHUL\Documents\docs\MASTER_SPEC_추가갱신_026-07-03.zip
Source document count: 6

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:21:58 | 분류: MASTER_SPEC]
==================================================
Source documents
==================================================
- MASTER_SPEC_추가갱신_Architecture_Dependency_Map_2026-07-03.txt
- MASTER_SPEC_추가갱신_Controller_Layer_호출책임_2026-07-03.txt
- MASTER_SPEC_추가갱신_Recovery_Controller_복구절차_설계_2026-07-03.txt
- MASTER_SPEC_추가갱신_설계검토_체크포인트_Architecture_Review_Checkpoints_2026-07-03.txt
- MASTER_SPEC_추가갱신_설계원칙_Architecture_Principles_2026-07-03.txt
- MASTER_SPEC_추가갱신_프로젝트_역할책임매트릭스_RACI_Matrix_2026-07-03.txt

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:21:58 | 분류: MASTER_SPEC]
MASTER_SPEC merged index - 02_Runtime_Data_Model
Generated: 2026-07-03 15:21:58
Source zip: C:\Users\JIN KWANG CHUL\Documents\docs\MASTER_SPEC_추가갱신_026-07-03.zip
Source document count: 9

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL\merged_by_index\00_Final_Index_Reference_Map_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:21:58 | 분류: MASTER_SPEC]
MASTER_SPEC merged index - 00_Final_Index_Reference_Map
Generated: 2026-07-03 15:21:58
Source zip: C:\Users\JIN KWANG CHUL\Documents\docs\MASTER_SPEC_추가갱신_026-07-03.zip
Source document count: 6

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL\merged_by_index\00_Final_Index_Reference_Map_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:21:58 | 분류: MASTER_SPEC]
==================================================
Source documents
==================================================
- MASTER_SPEC_추가갱신_Final_Execution_Guard_최종실행게이트_2026-07-03.txt
- MASTER_SPEC_추가갱신_프로젝트_문서체계_Document_Architecture_2026-07-03.txt
- MASTER_SPEC_추가갱신_프로젝트_의사결정기록_ADR_Index_2026-07-03.txt
- MASTER_SPEC_추가갱신_프로젝트_참조우선순위_Reference_Priority_Guide_2026-07-03.txt
- MASTER_SPEC_추가갱신_프로젝트_최종통합체크리스트_Final_Integration_Checklist_2026-07-03.txt
- MASTER_SPEC_추가갱신_프로젝트_통합참조맵_Integrated_Reference_Map_2026-07-03.txt

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_20260703_152122\00_MASTER_SPEC_merged_INDEX.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:21:23 | 분류: MASTER_SPEC]
MASTER_SPEC MERGED INDEX
Generated: 2026-07-03 15:21:23
Source zip: C:\Users\JIN KWANG CHUL\Documents\docs\MASTER_SPEC_추가갱신_026-07-03.zip
Total source TXT documents: 76

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_20260703_152122\merged_by_index\90_Misc_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:21:23 | 분류: MASTER_SPEC]
MASTER_SPEC merged index - 90_Misc
Generated: 2026-07-03 15:21:23
Source zip: C:\Users\JIN KWANG CHUL\Documents\docs\MASTER_SPEC_추가갱신_026-07-03.zip
Source document count: 10

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_20260703_152122\merged_by_index\06_Glossary_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:21:23 | 분류: MASTER_SPEC]
MASTER_SPEC merged index - 06_Glossary
Generated: 2026-07-03 15:21:23
Source zip: C:\Users\JIN KWANG CHUL\Documents\docs\MASTER_SPEC_추가갱신_026-07-03.zip
Source document count: 2

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_20260703_152122\merged_by_index\05_Operations_Policy_Governance_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:21:23 | 분류: MASTER_SPEC]
MASTER_SPEC merged index - 05_Operations_Policy_Governance
Generated: 2026-07-03 15:21:23
Source zip: C:\Users\JIN KWANG CHUL\Documents\docs\MASTER_SPEC_추가갱신_026-07-03.zip
Source document count: 14

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_20260703_152122\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:21:23 | 분류: MASTER_SPEC]
MASTER_SPEC merged index - 04_Implementation_Test_Verification
Generated: 2026-07-03 15:21:23
Source zip: C:\Users\JIN KWANG CHUL\Documents\docs\MASTER_SPEC_추가갱신_026-07-03.zip
Source document count: 15

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_20260703_152122\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:21:23 | 분류: MASTER_SPEC]
MASTER_SPEC merged index - 03_Architecture
Generated: 2026-07-03 15:21:23
Source zip: C:\Users\JIN KWANG CHUL\Documents\docs\MASTER_SPEC_추가갱신_026-07-03.zip
Source document count: 6

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_20260703_152122\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:21:23 | 분류: MASTER_SPEC]
MASTER_SPEC merged index - 02_Runtime_Data_Model
Generated: 2026-07-03 15:21:23
Source zip: C:\Users\JIN KWANG CHUL\Documents\docs\MASTER_SPEC_추가갱신_026-07-03.zip
Source document count: 9

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_20260703_152122\merged_by_index\00_Final_Index_Reference_Map_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:21:23 | 분류: MASTER_SPEC]
MASTER_SPEC merged index - 00_Final_Index_Reference_Map
Generated: 2026-07-03 15:21:23
Source zip: C:\Users\JIN KWANG CHUL\Documents\docs\MASTER_SPEC_추가갱신_026-07-03.zip
Source document count: 6

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
MASTER_SPEC_단순통합_1차(3).txt
문서
작업진행상황대화히스토리_8(7).txt
문서

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
이제 시간을 더 쓰기보다 구조 정리(파일명 정리)와 로직 연결 단계로 넘어가는 것이 프로젝트 전체 일정과 안정성 측면에서 더 효율적이라고 판단한다.
이번 작업 내용으로 작업재개요약과 마스터스펙갱신 자료를 생성해줘
작성 완료.
다운로드:
📄 작업재개요약_UI프로토타입_갱신.txt
📄 MASTER_SPEC_갱신자료_UI프로토타입_매수설정.txt

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
다만 이 문서도 이번 대화에서 다룬 내용만을 기반으로 한 상세판이다. 이전처럼 프로젝트 전체 마스터 스펙 수준(수십 페이지 분량)의 누적 문서는 한 번에 생성할 수 있는 용량을 넘기므로, 현재 모델이 처리 가능한 범위 내에서 최대한 많은 핵심 내용을 담은 버전이다.

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
목표:
기존 “설정 검증” preview 화면에 Rule Mapper Preview뿐 아니라
compare_engine_rules_preview() 결과도 함께 표시한다.

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
목표:
[Rule Mapper Diff] 표시에서 high/medium risk 항목의 current_value / preview_value가 너무 짧게 잘리는 문제를 개선한다.

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
offscreen 확인:
text
has_rule_mapper_diff True
rules_mtime_unchanged True

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
다음 작업 방향
replace preview 폐기 → merge/add candidate preview로 변경
핵심 원칙:

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
목표:
현재 replace preview 구조를 merge/add candidate preview 구조로 바꾼다.

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
확정 구현 방향
replace preview 제거 → merge/add candidate preview 적용
구현 원칙:

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
목표:
현재 replace preview 구조를 merge/add candidate preview 구조로 변경한다.

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
목표:
[Rule Mapper Preview] 출력에 indicator_follow_rule_preview namespace를 포함시킨다.

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
현재처럼 프로젝트 전체를 한 번에 분석시키는 것보다는, 파일 단위 또는 개념 단위로 나누는 것을 추천합니다.
추론은 네가 하는게 낫지않나?
네. 이런 종류의 작업은 제가 하는 것이 더 적합합니다.
코덱스와 저는 역할이 조금 다릅니다.
코덱스가 잘하는 것
프로젝트 전체 검색
코드 생성/수정
리팩토링
참조 추적
테스트 작성
제가 더 잘하는 것
프로젝트 철학 유지
구조 설계
변경 영향 추론
"이 이름을 바꿔도 되는가?" 판단
장기적인 일관성 검토
지금 우리가 하는 MACD 명칭 정리는 단순 문자열 치환이 아닙니다.
예를 들어
routine_macd_engine.py
이 파일을 바꿀지 말지는
앞으로 여러 지표를 지원할 계획인가?
"지표추종"이라는 철학과 맞는가?
다른 루틴도 같은 구조를 사용할 것인가?
같은 설계 판단이 먼저 필요합니다.
이건 검색만으로는 답이 안 나오고, 프로젝트 전체 맥락을 이해한 추론이 필요합니다.
그래서 제가 추천하는 방식은
제가 먼저 추론해서 방향을 확정합니다.
그다음 코덱스는 확정된 방향대로만 코드를 수정합니다.
마지막에 제가 다시 검토합니다.
이 방식이 지금 프로젝트에는 가장 안정적입니다.
현재도 저는 바로 손대기보다 먼저 아래처럼 분류해서 결정할 생각입니다.
절대 유지해야 하는 MACD
지금 변경해야 하는 MACD
호환성을 위해 당분간 유지할 MACD
나중에 정리할 MACD
이렇게 우선순위를 정한 뒤에 코덱스에 수정 범위를 명확히 지정하는 것이 안전합니다.

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
목표:
프로젝트 내 macd / MACD / Macd 명칭을 바로 치환하지 말고, 변경 가능 여부를 분류한다.

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
1. 코덱스 중단
2. 내가 기준을 먼저 확정
3. 코덱스에는 파일 1개 단위로만 작업 지시
지금 바로 잡을 방향은 이겁니다.

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
gui_auto_trade_timer.py에 signal_probe_only 조건부 consumer dry-run 자동 연결을 최소 구현한다.
수정 대상:
- gui_auto_trade_timer.py

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
목표:
분 단위 timer tick에서 routine_signal_probe 실행 후,
signal_probe_only=True 종목이 있을 때만
routine_signal_consumer.consume_pending_routine_signals_dry_run(limit=5, mark_previewed=True)를 실행한다.

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
목표:
gui_auto_trade_timer.py의 실제 timer 흐름으로
probe -> routine_signals.json -> consumer(mark_previewed=True) -> status 전이까지 동작하는지 확인한다.
대상:
- 003550 LG

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
보고:
- timer tick 실행 여부
- probe 결과
- consumer 결과
- signal status 최종 상태
- 주문/파일 안전 확인
- state 복구 확인
이 검증이 통과하면 현재 단기 목표인 키움 데이터 기반 전체 루프 검증이 사실상 완료입니다.
검증을 1회 시도했고, 코드 수정은 하지 않았습니다.
결과는 **통합 성공이 아니라 중간 차단/실패 확인**입니다.

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
다음 최소 수정 대상은 gui_auto_trade_timer.py의 auto_trade_signal_probe_only_active()입니다. 
gui_auto_trade_runtime.get_stock_dirs_in_routine(routine_dir) 기준으로 종목을 확인하도록 맞춰야 timer → probe → consumer 자동 흐름이 닫힙니다.
좋습니다. 단기 목표 핵심 루프 성공입니다.
확인된 실제 흐름:

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
MASTER_SPEC_갱신자료_RuleMapper_MergeCandidate_MACD_2026-07-02(2).txt
문서
작업재개요약_및_MASTER_SPEC_갱신자료_2026-07-02(3).txt
문서
MASTER_SPEC_갱신자료_상세판_UI프로토타입(4).txt
문서
MASTER_SPEC_누락보강(5).zip
ZIP 아카이브
작업진행상황대화히스토리_8(9).txt
문서
kiwoom_auto (33)(1).zip
ZIP 아카이브
빠짐없이 파악해
절대금지행위_추가규정_v2026-06-18_AI검증절차_복구기준관리(13).txt
문서
MASTER_SPEC_v3.0_BASELINE_ (2)(19).zip
ZIP 아카이브
kiwoom_auto (34)(1).zip
ZIP 아카이브
중간 분석
다음 문서로 최종 작업재개요약서를 작성했습니다.
다운로드:
MASTER_SPEC_최종_작업재개요약_2026-07-03.txt
주요 내용:
현재까지 완료된 아키텍처 및 구현 범위
실주문 계층의 현재 상태
다음 구현 시작 순서
Hoga Mapper
OrderType Mapper
ExecutionController
Final Execution Guard
Order Lock
Request Hash
Execution Request
Kiwoom Boundary
Fill Runtime
Position Runtime
구현 원칙
참조 문서 우선순위
현재 프로젝트 위치와 다음 작업 방향
이 문서는 지금까지 생성한 설계 문서들을 바탕으로 실제 구현 재개 시 가장 먼저 참고하는 요약 문서입니다.
다음
다음 문서로 MASTER_SPEC 최종 반영목록을 작성했습니다.
다운로드:
MASTER_SPEC_최종_MASTER_SPEC_반영목록_2026-07-03.txt
주요 내용:
우선순위 A(필수 반영): 아키텍처, Runtime, State Machine, 데이터 계약 등
우선순위 B(운영 기준): 운영, 품질, 위험, 변경관리, 유지보수, 백업, 릴리즈
우선순위 C(구현 기준): 구현 표준, Gate, 검증, Evidence 등
우선순위 D(관리 문서): RACI, 참조 체계, 문서 체계, 용어사전 등
MASTER_SPEC 정본에 병합할 때의 원칙

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\raw_extracted\MASTER_SPEC_최종_MASTER_SPEC_반영목록_2026-07-03.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:53:44 | 분류: MASTER_SPEC]
MASTER_SPEC_최종_MASTER_SPEC_반영목록_2026-07-03

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\raw_extracted\MASTER_SPEC_추가갱신_프로젝트_이벤트카탈로그_Event_Catalog_2026-07-03.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:49:42 | 분류: 갱신문서]
MASTER_SPEC_추가갱신_프로젝트_이벤트카탈로그_Event_Catalog_2026-07-03
목적
- 프로젝트에서 발생하는 주요 이벤트와 이벤트 흐름을 표준화한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\raw_extracted\MASTER_SPEC_추가갱신_프로젝트_모듈카탈로그_Module_Catalog_2026-07-03.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:48:40 | 분류: 갱신문서]
MASTER_SPEC_추가갱신_프로젝트_모듈카탈로그_Module_Catalog_2026-07-03
목적
- 프로젝트를 구성하는 주요 모듈의 책임과 입·출력을 한 곳에서 조회할 수 있는 기준 문서이다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\raw_extracted\MASTER_SPEC_추가갱신_프로젝트_역할책임매트릭스_RACI_Matrix_2026-07-03.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:47:30 | 분류: 갱신문서]
MASTER_SPEC_추가갱신_프로젝트_역할책임매트릭스_RACI_Matrix_2026-07-03
목적
- 프로젝트 내부 구성요소의 책임과 권한을 명확히 정의한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\raw_extracted\MASTER_SPEC_추가갱신_프로젝트_구현증빙패키지_Evidence_Package_2026-07-03.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:39:56 | 분류: 갱신문서]
MASTER_SPEC_추가갱신_프로젝트_구현증빙패키지_Evidence_Package_2026-07-03
목적
- 하나의 구현 작업이 완료되었음을 입증하기 위해 반드시 보관해야 하는 증빙 자료를 정의한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\raw_extracted\MASTER_SPEC_추가갱신_프로젝트_구현추적표_Implementation_Trace_Register_2026-07-03.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:38:40 | 분류: 갱신문서]
==================================================
최종 원칙
==================================================

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\raw_extracted\MASTER_SPEC_추가갱신_프로젝트_구현준비도_Readiness_Checklist_2026-07-03.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:37:06 | 분류: 갱신문서]
MASTER_SPEC_추가갱신_프로젝트_구현준비도_Readiness_Checklist_2026-07-03
목적
- 새로운 구현을 시작하기 전에 프로젝트가 구현 준비 상태인지 확인하기 위한 체크리스트이다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\raw_extracted\MASTER_SPEC_추가갱신_프로젝트_구현우선순위_Execution_Backlog_2026-07-03.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:35:48 | 분류: 갱신문서]
MASTER_SPEC_추가갱신_프로젝트_구현우선순위_Execution_Backlog_2026-07-03

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\raw_extracted\MASTER_SPEC_추가갱신_프로젝트_추적성매트릭스_Traceability_Matrix_2026-07-03.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:35:20 | 분류: 갱신문서]
- 모든 구현은 상위 설계와 연결되어야 한다.
- 테스트 없는 구현은 추적성이 불완전하다.
- 문서 없는 구조 변경은 추적 대상에서 제외한다.
최종 원칙

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\raw_extracted\MASTER_SPEC_추가갱신_프로젝트_문서체계_Document_Architecture_2026-07-03.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:34:50 | 분류: 갱신문서]
MASTER_SPEC_추가갱신_프로젝트_문서체계_Document_Architecture_2026-07-03

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\raw_extracted\MASTER_SPEC_추가갱신_프로젝트_마일스톤_Milestones_2026-07-03.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:33:18 | 분류: 갱신문서]
MASTER_SPEC_추가갱신_프로젝트_마일스톤_Milestones_2026-07-03
목적
- 프로젝트 진행 상황을 단계별 마일스톤으로 정의하여 현재 위치와 다음 목표를 명확히 한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\raw_extracted\MASTER_SPEC_추가갱신_프로젝트_장기로드맵_Product_Roadmap_2026-07-03.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:32:34 | 분류: 갱신문서]
MASTER_SPEC_추가갱신_프로젝트_장기로드맵_Product_Roadmap_2026-07-03
목적
- 프로젝트의 장기 발전 방향과 구현 단계를 시간순이 아니라 기능 성숙도 기준으로 정의한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\raw_extracted\MASTER_SPEC_추가갱신_프로젝트_유지보수정책_Maintenance_Policy_2026-07-03.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:30:58 | 분류: 갱신문서]
MASTER_SPEC_추가갱신_프로젝트_유지보수정책_Maintenance_Policy_2026-07-03
목적
- 프로젝트가 장기간 개발·운영되는 동안 일관된 유지보수 기준을 정의한다.
1. 유지보수 범위
- 버그 수정
- 성능 개선
- 구조 개선
- 기능 확장
- 문서 갱신

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\raw_extracted\MASTER_SPEC_추가갱신_프로젝트_운영정책_Operations_Governance_2026-07-03.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:29:36 | 분류: 갱신문서]
MASTER_SPEC_추가갱신_프로젝트_운영정책_Operations_Governance_2026-07-03

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\raw_extracted\MASTER_SPEC_추가갱신_프로젝트_의사결정기록_ADR_Index_2026-07-03.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:27:26 | 분류: 갱신문서]
MASTER_SPEC_추가갱신_프로젝트_의사결정기록_ADR_Index_2026-07-03

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\raw_extracted\MASTER_SPEC_추가갱신_설계원칙_Architecture_Principles_2026-07-03.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:23:50 | 분류: 갱신문서]
MASTER_SPEC_추가갱신_설계원칙_Architecture_Principles_2026-07-03

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\raw_extracted\MASTER_SPEC_추가갱신_프로젝트_아키텍처_최종인덱스_2026-07-03.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:20:56 | 분류: 갱신문서]
MASTER_SPEC_추가갱신_프로젝트_아키텍처_최종인덱스_2026-07-03

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\raw_extracted\MASTER_SPEC_추가갱신_전체아키텍처_로드맵_2026-07-03.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:19:44 | 분류: 갱신문서]
MASTER_SPEC_추가갱신_전체아키텍처_로드맵_2026-07-03

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\raw_extracted\MASTER_SPEC_추가갱신_실구현_우선순위_착수계획_2026-07-03.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:19:08 | 분류: 갱신문서]
MASTER_SPEC_추가갱신_실구현_우선순위_착수계획_2026-07-03

[출처: 작업재개요약서_2026-07-03_주문파이프라인_아키텍처설계_중간정리.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:02:24 | 분류: 작업재개요약]
핵심 원칙:
- GUI/Timer는 장기적으로 Controller만 호출.
- Controller는 하위 Engine/Gate/Policy를 순서대로 호출.
- ExecutionController만 ORDER_QUEUED 생성 권한을 가진다.
- FillEventController만 체결 기반 상태를 변경할 수 있다.

[출처: 작업재개요약서_2026-07-03_주문파이프라인_아키텍처설계_중간정리.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:02:24 | 분류: 작업재개요약]
원칙:
- 자동 복귀 금지.
- 서버 조회 없이 정상 처리 금지.
- Audit Log는 근거일 뿐 자동 결정 주체 아님.

[출처: 작업재개요약서_2026-07-03_주문파이프라인_아키텍처설계_중간정리.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:02:24 | 분류: 작업재개요약]
원칙:
- Domain Engine은 Kiwoom API 직접 호출 금지.
- GUI/Timer는 Kiwoom API 직접 호출 금지.
- SendOrder는 KiwoomOrderExecutor만 호출 가능.
- Boundary는 전략/Approval/Policy/Preflight 판단을 하지 않는다.

[출처: 작업재개요약서_2026-07-03_주문파이프라인_아키텍처설계_중간정리.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:02:24 | 분류: 작업재개요약]
원칙:
- Chejan은 전략 판단 금지.
- Chejan은 SendOrder 금지.
- Fill은 기존 order/execution과 매핑되어야 한다.
- Position은 Fill 결과로만 변경.

[출처: 작업재개요약서_2026-07-03_주문파이프라인_아키텍처설계_중간정리.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:02:24 | 분류: 작업재개요약]
원칙:
- SendOrder 성공만으로 Position 변경 금지.
- 매수 Fill은 보유 증가.
- 매도 Fill은 보유 감소.
- Kiwoom 잔고와 내부 Position 불일치 시 검토관리 후보.

[출처: 작업재개요약서_2026-07-03_주문파이프라인_아키텍처설계_중간정리.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:02:24 | 분류: 작업재개요약]
원칙:
- Position 없으면 청산 없음.
- SendOrder 성공만으로 청산 완료 금지.
- 마지막 Fill로 청산 완료 확정.

[출처: 작업재개요약서_2026-07-03_주문파이프라인_아키텍처설계_중간정리.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:02:24 | 분류: 작업재개요약]
원칙:
- 상태 전이는 지정된 Controller만 수행.
- 임의 점프 전이 금지.
- 모든 상태 전이는 Audit Log 기록 대상.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\raw_extracted\MASTER_SPEC_추가갱신_Chejan_Fill_Event_Lifecycle_설계_2026-07-03.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 12:49:28 | 분류: 갱신문서]
MASTER_SPEC_추가갱신_Chejan_Fill_Event_Lifecycle_설계_2026-07-03

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\raw_extracted\MASTER_SPEC_추가갱신_Recovery_Controller_복구절차_설계_2026-07-03.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 12:47:46 | 분류: 갱신문서]
MASTER_SPEC_추가갱신_Recovery_Controller_복구절차_설계_2026-07-03

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\raw_extracted\MASTER_SPEC_추가갱신_Review_Management_주문파이프라인연계_2026-07-03.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 12:46:20 | 분류: 갱신문서]
MASTER_SPEC_추가갱신_Review_Management_주문파이프라인연계_2026-07-03

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\raw_extracted\MASTER_SPEC_추가갱신_Audit_Log_감사로그_설계_2026-07-03.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 12:44:24 | 분류: 갱신문서]
MASTER_SPEC_추가갱신_Audit_Log_감사로그_설계_2026-07-03

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\raw_extracted\MASTER_SPEC_추가갱신_Request_Hash_중복실행방지_설계_2026-07-03.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 12:43:28 | 분류: 갱신문서]
MASTER_SPEC_추가갱신_Request_Hash_중복실행방지_설계_2026-07-03

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\raw_extracted\MASTER_SPEC_추가갱신_Final_Execution_Guard_최종실행게이트_2026-07-03.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 12:42:44 | 분류: 갱신문서]
MASTER_SPEC_추가갱신_Final_Execution_Guard_최종실행게이트_2026-07-03

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\raw_extracted\MASTER_SPEC_추가갱신_Architecture_Dependency_Map_2026-07-03.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 12:28:38 | 분류: 갱신문서]
MASTER_SPEC_추가갱신_Architecture_Dependency_Map_2026-07-03

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\raw_extracted\MASTER_SPEC_추가갱신_Controller_Layer_호출책임_2026-07-03.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 12:01:20 | 분류: 갱신문서]
MASTER_SPEC_추가갱신_Controller_Layer_호출책임_2026-07-03

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\raw_extracted\MASTER_SPEC_추가갱신_ADAPTER_READY_미사용정책_2026-07-03.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 10:52:12 | 분류: 갱신문서]
MASTER_SPEC_추가갱신_ADAPTER_READY_미사용정책_2026-07-03

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\raw_extracted\고정역할정의_ChatGPT_Codex_협업기준_v2026-07-03.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 10:47:46 | 분류: MASTER_SPEC]
ChatGPT ↔ Codex 고정 역할 정의 (프로젝트 운영 기준)
문서명: 고정역할정의_ChatGPT_Codex_협업기준_v2026-07-03.txt

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\raw_extracted\MASTER_SPEC_갱신자료_2026-07-03.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 08:55:52 | 분류: 갱신문서]
MASTER_SPEC_갱신자료_2026-07-03
데이터 흐름

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\Development_Specification_구현규약_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:19:04 | 분류: MASTER_SPEC]
목적
-----
본 문서는 프로젝트 전체 구현 시 반드시 따라야 하는 공통 규약을 정의한다.
설계 문서보다 상위 기준이며, 새로운 기능 추가와 구조 변경 시 기본 원칙으로 사용한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\Development_Specification_구현규약_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:19:04 | 분류: MASTER_SPEC]
==============================================================================
10. 현재 프로젝트 원칙
==============================================================================

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\프로젝트_일반화_로드맵_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:33:28 | 분류: MASTER_SPEC]
==============================================================================
Phase 4
==============================================================================
Engine Interface 정리
목표
- 공통 루틴과 지표 엔진 완전 분리
공통
- IndicatorFollowRoutine
엔진
- MACD
- RSI
- Bollinger
- MA

[출처: 마스터스펙\MASTER_SPEC_갱신자료_2026-07-02\MASTER_SPEC_갱신자료_RuleMapper_MergeCandidate_MACD_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:07:50 | 분류: 갱신문서]
본 갱신은 지표추종 루틴 설정 UI와 실행 Rule 사이에 Preview/검증 계층을
추가하면서 프로젝트 구조가 변경된 내용을 MASTER_SPEC에 반영하기 위한
문서이다.
핵심 원칙은 다음과 같다.

[출처: 작업재개요약_및_MASTER_SPEC_갱신자료_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 13:57:47 | 분류: 작업재개요약]
작업재개요약 (UI 상태 저장/로드 1차 완료)
프로젝트 현재 상태

[출처: 작업재개요약_상세판_UI프로토타입.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 06:40:27 | 분류: 작업재개요약]
이번 작업은 지표추종매매 설정창(UI 프로토타입)의 구조를 실사용 가능한
수준으로 정리하는 것을 목표로 진행하였다. 기능 추가보다 레이아웃 안정화,
상태제어 복구, 구조 정리를 우선하였다.
2. 핵심 변경 사항

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
1. 목적 PLAN 기반 아키텍처가 프로젝트 진행 중 변경되더라도 핵심 구조가
 무너지지 않도록 변경 관리 원칙을 정의한다.
2. 기본 원칙

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
8. 반영 원칙 본 기준은 히스토리에서 확정된 PLAN 기반 아키텍처 유지
 철학이며, 향후 구조 변경과 기능 확장의 공통 기준으로 적용한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- 기능보다 구조 안정화 우선.
- 로컬 참조 기반 상태제어.
- self 참조 의존 최소화.
- QTimer/singleShot 제거 원칙.
철학
프로젝트는 신호 중심에서 운용 정책 중심으로 발전. 명칭은 추후 프로젝트
철학 정립 후 일괄 검토.
보류
- 우측 빈 영역 활용
- 탭 구조 재검토
- 전체 용어 체계
원본: MASTER_SPEC_갱신자료_주신호대응설정_UI재설계(2).txt
MASTER SPEC 갱신자료
UI 정책 변경
주신호대응설정
기존 매수방식/다중지점/세부상황설정 구조는 폐기 대상으로 전환.
새 구조
□ 기본매수방식 - 단일호가 / 다중호가 - 선택없음 / 다중시간 / 다중비율

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
================================================================================
파일: MASTER_SPEC_누락보강_03_매수철학_추매_평단관리.txt
================================================================================
MASTER_SPEC 누락보강 03 주제 : 매수 철학 · 추매 · 평단관리
1. 프로젝트 핵심 철학

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- 본 프로젝트의 핵심은 최초 진입이 아니라 평단관리이다.
- 하락 시 추매를 통해 평균단가를 관리하는 것을 기본 철학으로 한다.
- 상승은 자연스러운 결과이며, 하락 대응 능력이 루틴의 핵심이다.
2. 매수 방식
- 단일매수
- 다중매수 두 방식은 동일한 매수계획으로 관리한다.
3. 매수계획 BUY 신호 발생 → 매수계획 생성 → 주문 진행 → 완료 또는
 미완성 판정
4. 매수 미완성

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
1. 목적 본 문서는 프로젝트 진행 중 반복적으로 발생했던 오류와 복구
 사례를 바탕으로 반드시 준수해야 할 구현 원칙을 정리한다.
2. 구현 전 원칙

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
================================================================================
파일: MASTER_SPEC_누락보강_08_매수매도_공통설계철학_구조통일원칙.txt
================================================================================
MASTER_SPEC 누락보강 08 주제 : 매수·매도 설정 공통 설계 철학 및 구조
통일 원칙
1. 목적

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- ‘대비’ 표현 사용
- 용어를 임의로 변경하지 않는다.
- BUY와 SELL에서 동일 의미는 동일 용어를 사용한다.
7. 공통 구현 원칙
- 생성 함수 재사용
- 상태제어 함수 재사용
- 비교 콤보 생성 함수 재사용
- 방향 전환 함수 재사용
8. 설계 철학

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
1. 목적 PLAN 중심 자동매매 프레임워크의 핵심 철학과 구조, 운영 기준을
 종합하여 프로젝트 전체의 최상위 설계 원칙으로 정의한다.
2. 핵심 철학


Original Body Marker: END

---

Reference Navigation

- Next: PART01_02_SYSTEM_FOUNDATION.md
- Full PART: PART01_SYSTEM_FOUNDATION.md
- INDEX: 00_REFERENCE_INDEX.md
- Original Canonical: ../CURRENT/MASTER_SPEC_CANONICAL_2026-07-08_EXECUTION_SENDORDER_CHEJAN_LIFECYCLE_PIPELINE.txt
