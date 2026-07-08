# PART01_SYSTEM_FOUNDATION

Reference Edition

Original Canonical: MASTER_SPEC_CANONICAL_2026-07-08_EXECUTION_SENDORDER_CHEJAN_LIFECYCLE_PIPELINE.txt

생성일: 2026-07-08

주의: 본 문서는 AI 참조용 분할본이며 공식 원본은 CURRENT의 Canonical이다.

Part Summary: Legacy large part / Full part: Original start to first split boundary

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

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
8. 결론 PLAN 중심 자동매매 프레임워크는 프로젝트 전체를 관통하는 핵심
 아키텍처이며, 향후 모든 루틴, 주문 엔진, 운영 기능 및 구조 개선은 본
 원칙을 최상위 기준으로 설계·구현·검증한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- UI 규칙은 모든 루틴 설정창에서 동일하게 적용
- 기능 추가 시 기존 레이아웃 철학 유지
- 중복 구현보다 공통화를 우선
반영 원칙 본 문서는 기존 누락보강 101~110 수준의 UI 구현 규칙을 통합한
기준 문서이다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
================================================================================
파일:
MASTER_SPEC_누락보강_107_프로젝트개발원칙_코딩규칙_MASTERSPEC관리기준_통합.txt
================================================================================

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
MASTER_SPEC 누락보강 107 주제 : 프로젝트 개발 원칙·코딩 규칙·MASTER_SPEC
관리 기준 통합
출처 : 작업진행상황대화히스토리 3~8 비교 반영

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
목적 프로젝트 전반에서 일관된 개발 품질을 유지하기 위한 개발 원칙, 코딩
규칙, 문서 관리 기준을 통합 정의한다.
1. 개발 기본 원칙

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- 설계 철학을 유지하면서 기능을 확장한다.
- 변경 이력을 지속적으로 관리한다.
- 프로젝트 전체에서 동일한 개발 기준을 적용한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
목적 프로젝트의 디렉터리 구조, 모듈 구성, 의존성 관리 원칙을 통합하여
장기적인 유지보수성과 확장성을 확보한다.
1. 구조 원칙

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
반영 원칙 본 문서는 기존 누락보강 171~180 수준의 프로젝트 구조·모듈
구성·의존성 관리 내용을 통합한 기준 문서이다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
목적 프로젝트 전반에서 데이터 흐름, 상태 관리, 이벤트 전달 방식을 하나의
기준으로 통일하여 모듈 간 일관성과 유지보수성을 확보한다.
1. 데이터 흐름 원칙

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
================================================================================
파일: MASTER_SPEC_누락보강_10_프로젝트철학_설계원칙종합.txt
================================================================================
MASTER_SPEC 누락보강 10 주제 : 프로젝트 철학 및 설계 원칙 종합

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
1. 목적 본 문서는 프로젝트 전반에 공통 적용되는 핵심 철학과 설계 원칙을
 정리하여 향후 기능 추가와 구조 변경 시 기준 문서로 활용한다.
2. 프로젝트 철학

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- 기존 구조를 존중한다.
- 필요한 부분만 수정한다.
- 변경 범위를 명확히 기록한다.
- 변경 이유를 문서화한다.
8. 검증 원칙
- UI 검증
- 저장 검증
- 엔진 검증
- 통합 검증 단계를 거쳐 기능을 확정한다.
9. 장기 목표

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
10. 최종 원칙 프로젝트의 모든 구현은 ’확장 가능성, 일관성, 안정성’을
 유지하는 방향으로 진행하며, 임시 구현이나 예외 처리는 최소화한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
================================================================================
파일:
MASTER_SPEC_누락보강_110_프로젝트전체아키텍처_운영철학_구현원칙_종합.txt
================================================================================
MASTER_SPEC 누락보강 110 주제 : 프로젝트 전체 아키텍처·운영 철학·구현
원칙 종합
출처 : 작업진행상황대화히스토리 3~8 비교 반영

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
목적 프로젝트 전체를 관통하는 아키텍처, 운영 철학, 구현 원칙을 하나의
기준으로 정리하여 향후 모든 개발과 유지보수의 최상위 참조 문서로
사용한다.
1. 핵심 철학

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
7. 최종 적용 기준 본 문서는 프로젝트의 아키텍처, 운영, 구현, 유지보수
 원칙을 통합한 최상위 기준으로 사용하며, 모든 신규 기능과 구조 변경은
 본 문서를 우선 참조하여 설계·구현·검증한다.
반영 원칙 본 문서는 기존 누락보강 191~200 수준의 프로젝트 종합 운영
원칙을 통합한 기준 문서이다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- 모든 핵심 이벤트는 로그를 남긴다.
- 로그는 상태 복구의 근거가 되어야 한다.
- 로그 형식은 프로젝트 전체에서 동일하게 유지한다.
반영 원칙 본 문서는 로그 저장소 및 분석 아키텍처를 신규 정의한 설계
문서이다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- 매수 미완성 : 목표 매수계획이 아직 완료되지 않은 상태
- 매수 실패 : 더 이상 정상적으로 매수계획을 이어갈 수 없는 상태
3. 핵심 원칙
- 미완성을 즉시 실패로 판정하지 않는다.
- 유효조건이 유지되는 동안은 매수계획을 계속 유지할 수 있다.
4. 영향도 구분 ① 전략에 영향이 거의 없는 미완성 ② 전략 수행 자체에
 영향을 주는 실패
5. 후속 처리
- 유효조건 유지 : 잔여 매수 진행 가능
- 유효조건 종료 : 루틴 정책에 따라 종료 또는 후속정책 수행
6. 주문 실패와 전략 실패

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- 주문 실패는 시스템/체결 문제이다.
- 전략 실패는 루틴 목표를 유지할 수 없는 상태이다.
- 두 개념을 혼용하지 않는다.
7. 연속 BUY 신호
- 기존 매수계획과의 관계를 우선 검토한다.
- 새로운 계획 생성보다 기존 계획의 상태를 먼저 확인한다.
8. 평단관리 연계
- 프로젝트의 핵심은 평균단가 관리이다.
- 최초 진입보다 이후 포지션 관리가 중요하다.
9. 구현 원칙

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
반영 원칙 본 문서는 프로젝트 초기 운영정책, ATS 정책, 검토관리 정책의
확정 이력을 신규 설계 문서로 정리한 기준 문서이다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- 신규 기능은 통합 테스트를 통과해야 한다.
- 운영 승인 전에는 모든 핵심 시나리오를 재검증한다.
- 테스트 결과는 문서와 함께 보관한다.
반영 원칙 본 문서는 프로젝트 운영 시뮬레이션 및 통합 테스트 절차를 신규
정의한 설계 문서이다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- 모니터링은 운영 로직과 분리한다.
- 성능 측정이 운영 성능을 저하시키지 않아야 한다.
- 모든 경고는 로그와 연계하여 추적 가능해야 한다.
반영 원칙 본 문서는 프로젝트 성능·안정성·모니터링 체계를 신규 정의한
설계 문서이다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- 모든 중요 변경은 Audit 로그를 남긴다.
- Audit 데이터는 일반 로그와 분리 관리한다.
- 권한 정책은 운영 정책보다 우선 적용한다.
반영 원칙 본 문서는 프로젝트 보안·권한관리·감사(Audit) 체계를 신규
정의한 설계 문서이다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- 모든 배포는 문서와 동일한 버전으로 관리한다.
- 검증되지 않은 버전은 운영 환경에 배포하지 않는다.
- 모든 릴리스는 복구 가능한 상태를 유지한다.
반영 원칙 본 문서는 프로젝트 버전관리·릴리스·배포 운영 체계를 신규
정의한 설계 문서이다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
※ 본 문서는 기존 01~126과 중복되지 않으며 프로젝트를 구성하는 객체들의
생명주기와 상태 관리 원칙을 정의한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
1. 목적 프로젝트를 구성하는 모든 객체를 동일한 생명주기 규칙으로
 관리하여 상태 불일치와 운영 오류를 최소화한다.
2. 관리 대상
- 루틴
- 종목
- PLAN
- 주문
- 체결
- Profile
- 로그
- Runtime 데이터
3. 공통 생명주기 ① 생성 ② 초기화 ③ 활성 ④ 일시 비활성 ⑤ 종료 ⑥ 보관 ⑦
 삭제
4. 상태 전이 원칙

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- 모든 구성요소는 동일한 Lifecycle 모델을 따른다.
- 생명주기 정책은 운영 정책과 일관성을 유지한다.
- 상태 추적은 항상 가능해야 한다.
반영 원칙 본 문서는 프로젝트 구성요소의 Lifecycle 관리 체계를 신규
정의한 설계 문서이다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- 모듈은 직접 서로를 호출하지 않고 Event Bus를 통해 통신한다.
- 이벤트는 불변(Immutable) 데이터로 전달한다.
- 이벤트 처리 결과는 추적 가능해야 한다.
반영 원칙 본 문서는 프로젝트 Event Bus 및 메시지 전달 구조를 신규 정의한
설계 문서이다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- 모든 핵심 데이터는 Validation을 거친 후 사용한다.
- Validation은 공통 프레임워크를 통해 수행한다.
- Validation 실패 데이터는 운영 로직에 직접 전달하지 않는다.
반영 원칙 본 문서는 프로젝트 데이터 검증(Validation) 프레임워크를 신규
정의한 설계 문서이다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
※ 본 문서는 기존 01~137과 중복되지 않으며 프로젝트에서 사용하는 파일
저장 구조와 Storage 관리 원칙을 정의한다.
1. 목적 프로젝트의 모든 파일을 일관된 규칙으로 관리하여 유지보수성과
 데이터 안전성을 확보한다.
2. 관리 대상

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- 모듈은 구현체가 아닌 인터페이스에 의존한다.
- 공통 API는 프로젝트 전체에서 동일하게 사용한다.
- 인터페이스 변경은 최소화하고 점진적으로 수행한다.
반영 원칙 본 문서는 프로젝트 공통 API 및 인터페이스 규격을 신규 정의한
설계 문서이다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- 프로젝트에서 확정된 정책
- 구현 완료 후 검증된 구조
- 반복적으로 사용되는 공통 규칙
- UI/엔진 공통 설계 원칙
3. 반영 제외
- 아이디어
- 검토 중인 안
- 임시 구현
- 테스트 전용 코드
- 일시적인 우회 방법
4. 변경 상태 구분 [확정] 즉시 MASTER_SPEC 반영
[보류] 추후 검토 대상으로 기록
[폐기] 폐기 사유와 함께 보존
[재검토] 후속 작업에서 다시 판단
5. 변경 이력 기록 항상 다음 항목을 기록한다.
- 변경 대상
- 변경 이유
- 변경 전 구조
- 변경 후 구조
- 영향 범위
- 관련 문서
6. 문서 관리 원칙

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
================================================================================
파일: MASTER_SPEC_누락보강_19_루틴설정창전체구성철학_확장원칙.txt
================================================================================
MASTER_SPEC 누락보강 19 주제 : 루틴 설정창 전체 구성 철학 및 확장 원칙

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
10. 결론 루틴 설정창은 프로젝트 전체의 표준 UI로 사용하며, 모든 신규
 루틴은 본 구조와 철학을 기준으로 설계한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
1. 목적 프로젝트 전반에서 동일한 개념은 항상 동일한 용어를 사용하여 UI,
 문서, 엔진 간 혼선을 방지한다.
2. 기본 원칙

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
================================================================================
파일: MASTER_SPEC_누락보강_30_프로젝트전체아키텍처_계층별책임원칙.txt
================================================================================
MASTER_SPEC 누락보강 30 주제 : 프로젝트 전체 아키텍처 및 계층별 책임
원칙

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
10. 결론 공통 위젯은 프로젝트 전체 UI의 기반이며, 재사용을 기본 원칙으로
 유지하여 구조 변경 비용을 최소화한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
10. 결론 상태 동기화는 프로젝트 전체 안정성의 핵심이며, 모든 이벤트는
 공통 상태 관리 원칙을 기반으로 처리한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
1. 목적 예상하지 못한 오류, API 이상, 데이터 불일치, 프로그램 재시작
 등의 상황에서 프로젝트가 일관된 방식으로 복구되도록 공통 정책을
 정의한다.
2. 기본 원칙

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
1. 목적 루틴과 설정 파일의 버전을 체계적으로 관리하여 프로젝트 확장과
 업데이트 과정에서 호환성을 유지하고 데이터 손실을 방지한다.
2. 기본 원칙

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
1. 목적 프로젝트 진행 과정에서 확인된 AI의 잘못된 추론으로 인해 발생할
 수 있는 구조 오염을 방지하기 위한 운영 기준을 정의한다.
2. 기본 원칙

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
8. 반영 원칙 본 용어 변경은 실제 UI 설계 과정에서 확정된 결정사항이며,
 향후 프로젝트 전체의 공식 용어로 유지한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- 한 번에 많은 요소를 변경하지 않는다.
- 변경 후 반드시 화면으로 검증한다.
- 만족스럽지 않으면 이전 방향에 얽매이지 않고 재구성한다.
6. 확정 기준
- 기능 정상
- 화면 가독성 확보
- 항목 간 일관성 유지
- 프로젝트 전체 UI 규칙과 충돌 없음
7. 기록 원칙

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- 프로젝트 전체 UI와 일관성 유지
- 단계별 이해가 쉬움
- 향후 기능 추가 시 수행 블록 내부 확장 가능
- 불필요한 시각 요소 최소화
6. 향후 원칙

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
================================================================================
파일:
MASTER_SPEC_누락보강_59_히스토리기반_매도설정UI_최종설계철학_유지원칙.txt
================================================================================
MASTER_SPEC 누락보강 59 주제 : 히스토리 기반 매도설정 UI 최종 설계 철학
및 유지 원칙
출처 : 작업진행상황대화히스토리_7~8 비교 반영

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
1. 목적 매도설정 UI의 최종 설계 철학과 향후 구조 변경 시 반드시
 유지해야 할 공통 원칙을 정의한다.
2. 핵심 철학

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
8. 반영 원칙 본 문서는 매도설정 UI의 최종 설계 철학을 정리한 기준
 문서이며, 향후 UI 개편 시 우선 참조 문서로 사용한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
7. 반영 원칙 본 개념은 히스토리에서 확정된 매수 처리 철학이며, 향후
 모든 루틴의 공통 매수 구조로 적용한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
7. 반영 원칙 본 정책은 히스토리에서 확정된 BUY PLAN 운영 철학이며,
 단일매수와 다중매수 모두에 동일하게 적용한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
1. 목적 단일매수와 다중매수를 서로 다른 로직으로 처리하지 않고, 하나의
 BUY PLAN 체계에서 관리하기 위한 공통 원칙을 정의한다.
2. 기본 철학

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
7. 반영 원칙 본 내용은 히스토리에서 확정된 매수 구조 통합 철학이며,
 향후 모든 루틴 구현의 공통 기준으로 적용한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
8. 반영 원칙 본 정책은 히스토리에서 확정된 연속 BUY 처리 철학이며, 향후
 모든 루틴의 공통 BUY PLAN 운영 기준으로 적용한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
8. 반영 원칙 본 기준은 히스토리에서 확정된 역할 분리 철학이며, 향후
 모든 루틴과 메인 엔진 구현의 공통 기준으로 적용한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- 목표 미달 시 BUY PLAN은 즉시 실패하지 않는다.
- 루틴의 유효 조건이 유지되는 동안 계속 관리한다.
5. 종료 조건
- 목표 금액/수량 달성
- 루틴 종료 조건 충족
- 유효 조건 종료
- 운영 정책에 따른 종료
6. 구현 원칙

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
4. 처리 흐름 ① BUY PLAN 생성 ② 유효 조건 유지 여부 확인 ③ 주문 및 체결
 진행 ④ 목표 달성 여부 확인 ⑤ 유효 조건 종료 시 종료 판정 수행
5. 종료 판정 다음 중 하나를 만족하면 종료를 검토한다.
- 목표 금액 또는 목표 수량 달성
- 유효봉 종료
- 유효시간 종료
- 루틴 종료 조건 충족
6. 구현 원칙

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
1. 목적 BUY PLAN 진행 중 일부만 체결된 경우 잔여 목표를 어떻게 처리할
 것인지에 대한 공통 정책을 정의한다.
2. 기본 원칙

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
5. 처리 흐름 ① 부분 체결 발생 ② 잔여 목표 계산 ③ 루틴 정책 확인 ④
 재매수 수행 또는 유지 ⑤ 완료 또는 종료 판정
6. 역할 분리 루틴
- 재매수 허용 여부
- 재매수 조건
- 종료 정책
메인 - 잔여 목표 계산 - 주문 실행 - 체결 상태 갱신
7. 구현 원칙

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
6. 처리 흐름 ① BUY PLAN 종료 시도 ② 목표 달성 여부 확인 ③ 유효 조건
 확인 ④ 후속 정책 확인 ⑤ 완료 / 미완성 / 실패 판정
7. 구현 원칙

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- 체결 발생 시 즉시 갱신
- 재매수 수행 시 진행 상태 유지
- 목표 달성 시 완료
- 유효조건 종료 후 정책 완료 시 종료
6. 구현 원칙

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
8. 반영 원칙 본 기준은 히스토리에서 확정된 CANCEL 처리 철학을 기반으로
 하며, 향후 모든 루틴의 BUY PLAN 취소 처리 기준으로 적용한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
8. 반영 원칙 본 기준은 히스토리에서 확정된 BUY PLAN 상태기록 및 복구
 철학을 기반으로 하며, 향후 모든 루틴의 상태 관리와 복구 기준으로
 적용한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
1. 목적 매수(BUY PLAN)와 매도(SELL PLAN)를 서로 독립적으로 구현하면서도
 동일한 구조와 철학을 유지하기 위한 공통 설계 원칙을 정의한다.
2. 기본 철학

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
8. 반영 원칙 본 기준은 히스토리에서 확정된 BUY/SELL 대칭 설계 철학을
 기반으로 하며, 향후 모든 루틴의 주문 처리 구조 설계 기준으로
 적용한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
1. 목적 주문 엔진을 BUY/SELL 개별 기능 중심이 아니라 PLAN 중심 구조로
 설계하기 위한 공통 원칙을 정의한다.
2. 기본 철학

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
8. 반영 원칙 본 기준은 히스토리에서 확정된 PLAN 중심 주문 엔진 설계
 철학을 기반으로 하며, 향후 모든 자동매매 루틴의 공통 실행 구조로
 적용한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
1. 목적 모든 자동매매 루틴이 동일한 PLAN 인터페이스를 사용하면서도 각
 루틴은 독립적으로 전략을 정의할 수 있도록 하는 구조 원칙을 정의한다.
2. 기본 철학

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
8. 반영 원칙 본 기준은 히스토리에서 확정된 PLAN 기반 구조 설계
 철학이며, 향후 모든 자동매매 루틴의 공통 인터페이스 기준으로
 적용한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
1. 목적 모든 PLAN(BUY/SELL)이 동일한 상태 전이 규칙을 따르도록 공통
 상태 머신 설계 원칙을 정의한다.
2. 기본 철학

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
8. 반영 원칙 본 기준은 히스토리에서 확정된 PLAN 기반 상태 머신 설계
 철학이며, 향후 모든 자동매매 루틴의 공통 상태 관리 기준으로
 적용한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
8. 반영 원칙 본 기준은 히스토리에서 확정된 PLAN 이벤트 기반 처리
 철학이며, 향후 모든 자동매매 루틴의 공통 상태 전이 기준으로
 적용한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
8. 반영 원칙 본 기준은 히스토리에서 확정된 PLAN 예외 처리 및 복구
 철학을 기반으로 하며, 향후 모든 자동매매 루틴의 공통 예외 처리
 기준으로 적용한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
================================================================================
파일:
MASTER_SPEC_누락보강_80_히스토리기반_PLAN설계철학_종합_공통운영원칙.txt
================================================================================
MASTER_SPEC 누락보강 80 주제 : 히스토리 기반 PLAN 설계 철학 종합 및 공통
운영 원칙
출처 : 작업진행상황대화히스토리_3~8 비교 반영

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
1. 목적 BUY PLAN과 SELL PLAN을 포함한 PLAN 기반 자동매매 구조의 핵심
 설계 철학과 공통 운영 원칙을 종합적으로 정리한다.
2. 핵심 철학

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
8. 결론 PLAN 중심 구조는 프로젝트 전체 자동매매 엔진의 핵심
 아키텍처이며, 향후 모든 루틴과 주문 엔진은 본 원칙을 기준으로 설계
 및 확장한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
8. 반영 원칙 본 기준은 히스토리에서 확정된 PLAN 기반 확장 철학이며,
 향후 모든 신규 자동매매 루틴 개발의 기본 기준으로 적용한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
7. 반영 원칙 본 기준은 히스토리에서 확정된 PLAN 기반 자동매매 엔진의
 계층 설계 철학이며, 향후 모든 루틴과 주문 처리 구조의 공통 아키텍처
 기준으로 적용한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
1. 목적 PLAN 중심 자동매매 엔진의 공통 아키텍처를 정의하고, 모든 루틴이
 동일한 구현 원칙을 따르도록 기준을 확립한다.
2. 핵심 철학

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
1. 목적 프로젝트 전반에서 채택한 PLAN 중심 자동매매 프레임워크의 최종
 설계 원칙을 정리하여 향후 구현과 확장의 최상위 기준으로 사용한다.
2. 최상위 설계 철학

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
8. 반영 원칙 본 기준은 히스토리에서 확정된 PLAN 중심 자동매매
 프레임워크의 최종 설계 원칙이며, 향후 프로젝트 전체 아키텍처의
 최상위 기준으로 적용한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
8. 반영 원칙 본 기준은 히스토리에서 확정된 PLAN 중심 자동매매
 프레임워크 운영 표준이며, 향후 프로젝트 전체 운영의 공통 기준으로
 적용한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
7. 반영 원칙 본 기준은 히스토리에서 확정된 PLAN 중심 프레임워크의
 유지보수 및 버전 관리 기준이며, 향후 프로젝트의 장기 운영 기준으로
 적용한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
8. 반영 원칙 본 기준은 히스토리에서 확정된 PLAN 중심 프레임워크 문서
 관리 원칙이며, 향후 프로젝트의 공식 문서 관리 기준으로 적용한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
1. 목적 PLAN 중심 자동매매 프레임워크를 장기간 운영하면서도 핵심 구조와
 설계 철학을 안정적으로 유지하기 위한 기준을 정의한다.
2. 기본 원칙

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
8. 반영 원칙 본 기준은 히스토리에서 확정된 PLAN 중심 자동매매
 프레임워크의 장기 운영 원칙이며, 향후 프로젝트의 구조 보존과
 아키텍처 유지 기준으로 적용한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
1. 목적 프로젝트가 장기간 확장되더라도 PLAN 중심 아키텍처의 핵심 구조가
 유지되도록 최종 보존 기준을 정의한다.
2. 핵심 보존 원칙

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
8. 반영 원칙 본 기준은 히스토리에서 확정된 PLAN 중심 자동매매
 프레임워크의 최종 아키텍처 보존 기준이며, 향후 프로젝트의 구조
 안정성과 장기 유지보수의 최상위 기준으로 적용한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
8. 반영 원칙 본 기준은 히스토리에서 확정된 PLAN 중심 자동매매
 프레임워크의 핵심 설계 원칙을 종합한 문서이며 향후 프로젝트 전체의
 상위 설계 기준으로 적용한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
8. 반영 원칙 본 문서는 히스토리에서 확정된 PLAN 중심 설계 철학을 통합
 정리한 기준으로, MASTER_SPEC 상위 설계 기준으로 유지한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
7. 반영 원칙 본 기준은 히스토리에서 확정된 PLAN 중심 자동매매
 프레임워크의 운영 아키텍처 기준이며, 향후 프로젝트 운영 및 구조
 확장의 최상위 기준으로 적용한다.

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_05.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:30 | 분류: MASTER_SPEC]
MASTER SPEC 통합본_05 (1차 편집)

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_05.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:30 | 분류: MASTER_SPEC]
작업범위 - 통합본 120,001자 ~ 끝 - 동일 문장 1차 제거 - 연속 중복 제거 -
파일 경계 유지 - 내용 추가/요약 없음

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_05.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:30 | 분류: MASTER_SPEC]
============================================================
발생 여부
9. 향후 보강

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_05.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:30 | 분류: MASTER_SPEC]
8. 검증 항목 □ 예외 감지 □ 복구 성공 □ 상태 동기화 □ 로그 생성 □ 데이터
 무결성 □ 정상 운영 복귀
- 복구 시나리오
- 자동 복구 정책
- 장애 등급 분류
- 복구 이력 관리
10. 결론 모든 예외는 동일한 복구 원칙을 따르며, 데이터의 일관성과
 안전성을 최우선으로 유지한다.

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_05.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:30 | 분류: MASTER_SPEC]
1. 목적 루틴과 설정 파일의 버전을 체계적으로 관리하여 프로젝트 확장과
 업데이트 과정에서 호환성을 유지하고 데이터 손실을 방지한다.

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_05.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:30 | 분류: MASTER_SPEC]
1. 목적 프로젝트 진행 과정에서 확인된 AI의 잘못된 추론으로 인해 발생할
 수 있는 구조 오염을 방지하기 위한 운영 기준을 정의한다.

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_05.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:30 | 분류: MASTER_SPEC]
================================================================================
파일: MASTER_SPEC_누락보강_47_히스토리기반_시나리오중심_UI설계원칙.txt
================================================================================
MASTER_SPEC 누락보강 47 주제 : 히스토리 기반 시나리오 중심 UI 설계 원칙

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_05.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:30 | 분류: MASTER_SPEC]
================================================================================
파일:
MASTER_SPEC_누락보강_50_히스토리기반_반복이탈조건_도입배경_설계목적.txt
================================================================================
MASTER_SPEC 누락보강 50 주제 : 히스토리 기반 반복이탈조건 도입 배경 및
설계 목적

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_05.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:30 | 분류: MASTER_SPEC]
3. 처리 순서 ① 매도 신호 발생 ② 후속매도반복설정 수행 ③ 반복이탈조건
 확인 ④ 반복 종료 ⑤ 매도완료정책 수행
4. 역할 구분 후속매도반복설정
- 반복 방식
- 반복 간격
- 반복 조건
반복이탈조건 - 가격 비교 - 반복 횟수 - 제한 시간 - 종료 판정
5. UI 구성 원칙
- 후속매도반복설정은 수행 3 영역에 배치한다.
- 반복이탈조건은 수행 4 영역에 배치한다.
- 두 영역은 동일한 들여쓰기와 행 구성 규칙을 따른다.
- 반복 종료 판단은 반복이탈조건에서만 수행한다.
- 완료정책은 반복 종료 이후에만 실행한다.
- 정책 간 중복 판정을 금지한다.

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_05.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:30 | 분류: MASTER_SPEC]
================================================================================
파일:
MASTER_SPEC_누락보강_52_히스토리기반_매도리셋_일괄취소_용어변경원칙.txt
================================================================================
MASTER_SPEC 누락보강 52 주제 : 히스토리 기반 매도리셋·일괄취소 용어 변경
배경 및 적용 원칙

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_05.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:30 | 분류: MASTER_SPEC]
================================================================================
파일: MASTER_SPEC_누락보강_53_히스토리기반_비교조건콤보_통합규칙.txt
================================================================================
MASTER_SPEC 누락보강 53 주제 : 히스토리 기반 비교조건 콤보 통합 규칙

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_05.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:30 | 분류: MASTER_SPEC]
================================================================================
파일: MASTER_SPEC_누락보강_55_히스토리기반_UI문구잘림방지_폭조정기준.txt
================================================================================
MASTER_SPEC 누락보강 55 주제 : 히스토리 기반 UI 문구 잘림 방지 및 폭
조정 기준

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_05.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:30 | 분류: MASTER_SPEC]
================================================================================
파일:
MASTER_SPEC_누락보강_56_히스토리기반_시제품검토_반복수정절차_UI확정기준.txt
================================================================================
MASTER_SPEC 누락보강 56 주제 : 히스토리 기반 시제품 검토·반복 수정 절차
및 UI 확정 기준

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_05.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:30 | 분류: MASTER_SPEC]
3. 반복 절차 ① 시제품 구현 ② 화면 확인 ③ 문제점 기록 ④ 부분 수정 ⑤
 재확인 ⑥ 확정 또는 추가 수정
4. 검토 대상
- 문구 잘림
- 들여쓰기
- 줄간격
- 그룹 구성
- 시선 흐름
- 설정 입력 편의성
5. 수정 원칙

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_05.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:30 | 분류: MASTER_SPEC]
================================================================================
파일:
MASTER_SPEC_누락보강_59_히스토리기반_매도설정UI_최종설계철학_유지원칙.txt
================================================================================
MASTER_SPEC 누락보강 59 주제 : 히스토리 기반 매도설정 UI 최종 설계 철학
및 유지 원칙

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_05.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:30 | 분류: MASTER_SPEC]
- 설정 나열보다 매도 시나리오의 흐름을 우선한다.
- 사용자는 위에서 아래로 읽으며 전체 과정을 이해할 수 있어야 한다.
- 각 단계는 독립적이면서도 자연스럽게 다음 단계로 이어져야 한다.
3. 구조 원칙
- 그룹박스 구조 유지
- 수행 번호(1~5) 유지
- 제목과 입력부 분리
- 입력부 반칸 들여쓰기
- 공통 행 구성 유지
- 시각 효과보다 정보 전달을 우선한다.
- 긴 정책 문구를 우선적으로 표시한다.
- 불필요한 장식 요소를 최소화한다.
- 동일한 컨트롤은 동일한 크기와 정렬을 사용한다.
- 신규 기능은 기존 수행 영역 내부에 추가한다.
- 수행 번호를 임의로 변경하지 않는다.
- 공통 비교 규칙과 공통 레이아웃을 유지한다.
6. 변경 원칙

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_05.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:30 | 분류: MASTER_SPEC]
- 제목은 좌측 정렬
- 설정 입력은 반칸 들여쓰기
- 동일 종류의 입력 컨트롤은 동일 높이와 정렬 적용
- 긴 정책 문구의 가독성을 우선 확보
4. 공통 기능 기준
- 비교조건 콤보는 공통 규칙 사용
- 반복 수행과 반복이탈조건은 역할을 분리
- 완료정책은 반복 종료 이후 수행
- 용어는 프로젝트 전체에서 동일하게 유지
- 공통 Row 생성 규칙을 사용한다.
- 화면별 개별 레이아웃 구현을 최소화한다.
- 동일 기능은 동일한 UI 패턴을 따른다.
- 신규 기능은 기존 수행 영역 내부에서 확장한다.

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_05.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:30 | 분류: MASTER_SPEC]
MASTER_SPEC 누락보강 62 주제 : 히스토리 기반 매수 미완성(Incomplete)
정책 및 재매수 발동 조건
1. 목적 매수 목표가 완전히 체결되지 않은 상황을 ’실패’와 구분하고,
 재매수 발동 기준을 표준화한다.

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_05.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:30 | 분류: MASTER_SPEC]
5. 재매수 대상 재매수는 전체 목표가 아니라 ’잔여 목표 금액 또는 잔여
 목표 수량’만 대상으로 수행한다.
- 재매수 허용 여부
- 유효 조건
- 종료 조건
메인 - 잔여 목표 계산 - 주문 실행 - 체결 상태 갱신

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_05.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:30 | 분류: MASTER_SPEC]
MASTER_SPEC 누락보강 63 주제 : 히스토리 기반 단일매수·다중매수 통합 처리
철학 및 완료 판정 구조

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_05.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:30 | 분류: MASTER_SPEC]
- 체결 확인
- 잔여 목표 계산
- BUY PLAN 상태 관리
- 주문 재시도 실행
- 상태 저장 및 복구

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_05.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:30 | 분류: MASTER_SPEC]
- 목표 미달 시 BUY PLAN은 즉시 실패하지 않는다.
- 루틴의 유효 조건이 유지되는 동안 계속 관리한다.
5. 종료 조건
- 목표 금액/수량 달성
- 루틴 종료 조건 충족
- 유효 조건 종료
- 운영 정책에 따른 종료
- 상태 전이는 단일 관리 지점에서 수행한다.
- 동일 상태를 중복 생성하지 않는다.
- 종료된 BUY PLAN은 재사용하지 않는다.
7. 검증 항목 □ 생성 □ 진행 □ 부분 체결 □ 완료 □ 미완성 □ 종료 □ 상태
 복원 일치

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_05.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:30 | 분류: MASTER_SPEC]
MASTER_SPEC 누락보강 67 주제 : 히스토리 기반 BUY PLAN 종료 정책 및
검토관리 연계 기준
1. 목적 BUY PLAN 종료 시 정상 종료와 운영 검토 대상을 명확히 구분하기
 위한 기준을 정의한다.
2. 종료 유형 가. 정상 완료
- 목표 금액 또는 목표 수량 충족
- 루틴 종료 조건 정상 만족

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_05.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:30 | 분류: MASTER_SPEC]
4. 처리 흐름 ① BUY PLAN 생성 ② 유효 조건 유지 여부 확인 ③ 주문 및 체결
 진행 ④ 목표 달성 여부 확인 ⑤ 유효 조건 종료 시 종료 판정 수행
5. 종료 판정 다음 중 하나를 만족하면 종료를 검토한다.
- 목표 금액 또는 목표 수량 달성
- 유효봉 종료
- 유효시간 종료
- 유효봉과 유효시간은 루틴 정책으로 정의한다.
- 메인은 해당 조건을 감시하고 실행만 담당한다.
- 종료 이후에는 동일 BUY PLAN을 재사용하지 않는다.

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_05.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:30 | 분류: MASTER_SPEC]
MASTER_SPEC 누락보강 69 주제 : 히스토리 기반 BUY PLAN 재매수 정책 및
잔여 목표 처리 기준

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_05.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:30 | 분류: MASTER_SPEC]
5. 처리 흐름 ① 부분 체결 발생 ② 잔여 목표 계산 ③ 루틴 정책 확인 ④
 재매수 수행 또는 유지 ⑤ 완료 또는 종료 판정
- 재매수 조건
- 종료 정책
- 재매수는 잔여 목표만 대상으로 한다.
- 기존 BUY PLAN을 유지한 상태에서 수행한다.
- 새로운 BUY PLAN을 임의 생성하지 않는다.

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_05.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:30 | 분류: MASTER_SPEC]
- 완료, 미완성, 실패는 서로 다른 상태이다.
- 부분 체결만으로 실패를 판정하지 않는다.
- 실패는 루틴 정책과 운영 정책을 모두 적용한 이후 최종 결정한다.
3. 완료(Completed) 다음 중 하나를 만족하면 완료로 판정한다.
- 목표 금액 충족
4. 미완성(Incomplete) 다음 조건을 만족하면 미완성으로 유지한다.
- 목표 미달
- BUY PLAN 유효
- 후속 정책 수행 가능
5. 실패(Failed) 다음 조건을 모두 만족할 경우 실패로 판정한다.
- 후속 정책 종료
- 더 이상 루틴 정책으로 진행 불가

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_05.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:30 | 분류: MASTER_SPEC]
6. 처리 흐름 ① BUY PLAN 종료 시도 ② 목표 달성 여부 확인 ③ 유효 조건
 확인 ④ 후속 정책 확인 ⑤ 완료 / 미완성 / 실패 판정

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_05.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:30 | 분류: MASTER_SPEC]
8. 반영 원칙 본 기준은 히스토리에서 확정된 BUY PLAN 상태기록 및 복구
 철학을 기반으로 하며, 향후 모든 루틴의 상태 관리와 복구 기준으로

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_05.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:30 | 분류: MASTER_SPEC]
1. 목적 매수(BUY PLAN)와 매도(SELL PLAN)를 서로 독립적으로 구현하면서도
 동일한 구조와 철학을 유지하기 위한 공통 설계 원칙을 정의한다.

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_05.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:30 | 분류: MASTER_SPEC]
8. 반영 원칙 본 기준은 히스토리에서 확정된 BUY/SELL 대칭 설계 철학을
 기반으로 하며, 향후 모든 루틴의 주문 처리 구조 설계 기준으로

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_05.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:30 | 분류: MASTER_SPEC]
================================================================================
파일:
MASTER_SPEC_누락보강_75_히스토리기반_PLAN중심_주문엔진구조_확장원칙.txt
================================================================================
MASTER_SPEC 누락보강 75 주제 : 히스토리 기반 PLAN 중심 주문 엔진 구조 및
확장 원칙

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_05.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:30 | 분류: MASTER_SPEC]
8. 반영 원칙 본 기준은 히스토리에서 확정된 PLAN 중심 주문 엔진 설계
 철학을 기반으로 하며, 향후 모든 자동매매 루틴의 공통 실행 구조로

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_05.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:30 | 분류: MASTER_SPEC]
================================================================================
파일:
MASTER_SPEC_누락보강_76_히스토리기반_PLAN공통인터페이스_루틴독립성원칙.txt
================================================================================
MASTER_SPEC 누락보강 76 주제 : 히스토리 기반 PLAN 공통 인터페이스 및
루틴 독립성 원칙

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_05.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:30 | 분류: MASTER_SPEC]
1. 목적 모든 자동매매 루틴이 동일한 PLAN 인터페이스를 사용하면서도 각
 루틴은 독립적으로 전략을 정의할 수 있도록 하는 구조 원칙을 정의한다.

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_05.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:30 | 분류: MASTER_SPEC]
8. 반영 원칙 본 기준은 히스토리에서 확정된 PLAN 기반 구조 설계
 철학이며, 향후 모든 자동매매 루틴의 공통 인터페이스 기준으로

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_05.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:30 | 분류: MASTER_SPEC]
MASTER_SPEC 누락보강 77 주제 : 히스토리 기반 PLAN 공통 상태 머신(State
Machine) 설계 원칙

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_05.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:30 | 분류: MASTER_SPEC]
8. 반영 원칙 본 기준은 히스토리에서 확정된 PLAN 기반 상태 머신 설계
 철학이며, 향후 모든 자동매매 루틴의 공통 상태 관리 기준으로

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_05.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:30 | 분류: MASTER_SPEC]
8. 반영 원칙 본 기준은 히스토리에서 확정된 PLAN 이벤트 기반 처리
 철학이며, 향후 모든 자동매매 루틴의 공통 상태 전이 기준으로

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_05.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:30 | 분류: MASTER_SPEC]
================================================================================
파일:
MASTER_SPEC_누락보강_79_히스토리기반_PLAN_예외처리_복구우선순위.txt
================================================================================
MASTER_SPEC 누락보강 79 주제 : 히스토리 기반 PLAN 예외 처리 및 복구
우선순위

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_05.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:30 | 분류: MASTER_SPEC]
================================================================================
파일:
MASTER_SPEC_누락보강_80_히스토리기반_PLAN설계철학_종합_공통운영원칙.txt
================================================================================
MASTER_SPEC 누락보강 80 주제 : 히스토리 기반 PLAN 설계 철학 종합 및 공통
운영 원칙

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_05.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:30 | 분류: MASTER_SPEC]
1. 목적 BUY PLAN과 SELL PLAN을 포함한 PLAN 기반 자동매매 구조의 핵심
 설계 철학과 공통 운영 원칙을 종합적으로 정리한다.

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_05.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:30 | 분류: MASTER_SPEC]
================================================================================
파일:
MASTER_SPEC_누락보강_81_히스토리기반_PLAN확장성_신규루틴적용원칙.txt
================================================================================
MASTER_SPEC 누락보강 81 주제 : 히스토리 기반 PLAN 확장성 및 신규 루틴
적용 원칙

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_05.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:30 | 분류: MASTER_SPEC]
1. 목적 PLAN 기반 구조를 유지하면서 새로운 자동매매 루틴을 추가할 수
 있도록 확장 원칙을 정의한다.

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_05.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:30 | 분류: MASTER_SPEC]
================================================================================
파일:
MASTER_SPEC_누락보강_82_히스토리기반_루틴등록_PLAN생성_주문실행_전체흐름.txt
================================================================================
MASTER_SPEC 누락보강 82 주제 : 히스토리 기반 루틴 등록·PLAN 생성·주문
실행의 전체 흐름

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_05.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:30 | 분류: MASTER_SPEC]
7. 반영 원칙 본 기준은 히스토리에서 확정된 PLAN 기반 자동매매 엔진의
 계층 설계 철학이며, 향후 모든 루틴과 주문 처리 구조의 공통 아키텍처

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_05.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:30 | 분류: MASTER_SPEC]
MASTER_SPEC 누락보강 84 주제 : 히스토리 기반 PLAN 기반 자동매매 엔진의
공통 아키텍처 및 구현 원칙

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_05.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:30 | 분류: MASTER_SPEC]
1. 목적 PLAN 중심 자동매매 엔진의 공통 아키텍처를 정의하고, 모든 루틴이
 동일한 구현 원칙을 따르도록 기준을 확립한다.

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_05.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:30 | 분류: MASTER_SPEC]
MASTER_SPEC 누락보강 85 주제 : 히스토리 기반 PLAN 중심 자동매매
프레임워크 최종 설계 원칙

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_05.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:30 | 분류: MASTER_SPEC]
7. 운영 체크 □ PLAN 생성 정상 □ 주문 실행 정상 □ 상태 일관성 □ 로그
 일관성 □ 복구 정상 □ 검토관리 연계
프레임워크 운영 표준이며, 향후 프로젝트 전체 운영의 공통 기준으로

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_05.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:30 | 분류: MASTER_SPEC]
1. 목적 PLAN 중심 자동매매 프레임워크가 실제 운영 환경에서도 설계
 의도와 동일하게 동작하는지 확인하기 위한 최종 운영 검증 기준을
2. 운영 검증 원칙

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_05.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:30 | 분류: MASTER_SPEC]
MASTER_SPEC 누락보강 92 주제 : 히스토리 기반 PLAN 중심 자동매매
프레임워크 유지보수 및 버전 관리 원칙

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_05.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:30 | 분류: MASTER_SPEC]
1. 목적 PLAN 중심 자동매매 프레임워크를 장기간 안정적으로 유지하기 위한
 유지보수 및 버전 관리 원칙을 정의한다.

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_05.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:30 | 분류: MASTER_SPEC]
- 공통 아키텍처는 안정성을 우선한다.
- 변경은 추적 가능해야 한다.
- 버전별 변경 이력은 반드시 기록한다.
3. 버전 관리 대상
- PLAN 구조
- 공통 인터페이스
- 주문 엔진
- 운영 정책
4. 변경 절차 ① 변경 요청 접수 ② 영향 범위 분석 ③ 구현 ④ 테스트 ⑤ 문서
 갱신 ⑥ 버전 반영
5. 유지보수 원칙
- 하위 호환성을 우선 검토한다.
- 기존 루틴 동작을 훼손하지 않는다.
- 공통 구조 변경은 최소화한다.

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_05.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:30 | 분류: MASTER_SPEC]
MASTER_SPEC 누락보강 93 주제 : 히스토리 기반 PLAN 중심 자동매매
프레임워크 문서 관리 및 변경 이력 원칙

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_05.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:30 | 분류: MASTER_SPEC]
1. 목적 PLAN 중심 자동매매 프레임워크와 관련된 설계 문서, 운영 문서,
 변경 이력을 체계적으로 관리하기 위한 공통 원칙을 정의한다.

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_05.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:30 | 분류: MASTER_SPEC]
MASTER_SPEC 누락보강 94 주제 : 히스토리 기반 PLAN 중심 자동매매
프레임워크 장기 운영 및 구조 보존 원칙

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_05.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:30 | 분류: MASTER_SPEC]
1. 목적 PLAN 중심 자동매매 프레임워크를 장기간 운영하면서도 핵심 구조와
 설계 철학을 안정적으로 유지하기 위한 기준을 정의한다.

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_05.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:30 | 분류: MASTER_SPEC]
- 단기 기능보다 장기 구조를 우선한다.
- 공통 아키텍처는 가능한 변경하지 않는다.
- 구조 변경이 필요한 경우 명확한 근거를 남긴다.
3. 보존 대상
- 이벤트 처리 체계
- 계층 분리 원칙
- 로그 및 복구 체계

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_05.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:30 | 분류: MASTER_SPEC]
프레임워크의 최종 아키텍처 보존 기준이며, 향후 프로젝트의 구조
 안정성과 장기 유지보수의 최상위 기준으로 적용한다.

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_05.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:30 | 분류: MASTER_SPEC]
MASTER_SPEC 누락보강 96 주제 : 히스토리 기반 PLAN 중심 자동매매
프레임워크 핵심 설계 원칙 종합

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_05.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:30 | 분류: MASTER_SPEC]
1. 목적 PLAN 중심 자동매매 프레임워크의 핵심 설계 원칙을 하나의
 기준으로 정리하여 향후 기능 추가와 구조 개선 시 최우선 참조 문서로
2. 핵심 설계 원칙

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_05.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:30 | 분류: MASTER_SPEC]
7. 최종 검증 □ 구조 일관성 □ 상태 일관성 □ 이벤트 일관성 □ 로그 일관성
 □ 복구 일관성 □ 장기 확장성
프레임워크의 핵심 설계 원칙을 종합한 문서이며 향후 프로젝트 전체의
 상위 설계 기준으로 적용한다.

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_05.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:30 | 분류: MASTER_SPEC]
1. 목적 PLAN 중심 자동매매 프레임워크의 핵심 구조를 하나의 통합
 기준으로 정의하여 향후 모든 기능 구현과 구조 개선의 기준으로
2. 통합 설계 원칙

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_05.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:30 | 분류: MASTER_SPEC]
2. 운영 아키텍처 ① Routine Layer : 전략 및 신호 생성 ② PLAN Layer :
 주문 계획·상태·생명주기 관리 ③ Execution Layer : 주문
 실행·체결·재시도 ④ Management Layer : 로그·복구·검토관리·운영 상태
3. 운영 원칙
- 상태 변경은 이벤트를 통해서만 수행한다.
- 상태와 로그를 항상 동기화한다.

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_05.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:30 | 분류: MASTER_SPEC]
6. 검증 기준 □ 계층 분리 □ 상태 머신 유지 □ 이벤트 기반 처리 □ 로그
 일치 □ 복구 일치 □ 운영 안정성
프레임워크의 운영 아키텍처 기준이며, 향후 프로젝트 운영 및 구조
 확장의 최상위 기준으로 적용한다.

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_04.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:24 | 분류: MASTER_SPEC]
MASTER SPEC 통합본_04 (1차 편집)

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_04.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:24 | 분류: MASTER_SPEC]
작업범위 - 통합본 90,001 ~ 120,000자 - 동일 문장 1차 제거 - 연속 중복
제거 - 파일 경계 유지 - 내용 추가/요약 없음

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_04.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:24 | 분류: MASTER_SPEC]
- 오류 코드 생성
- Validation 로그 기록
- 운영 영향도 평가
- 자동 보정 가능 여부 판단
- 검토관리 연계
6. 자동 보정
- 기본값 적용
- 누락 항목 보완
- 구버전 데이터 변환
- 안전 범위 내 값 보정
7. 검증 결과
- PASS
- WARNING
- FAIL
- CRITICAL
- Validation 실패율
- 자동 보정 횟수
- 반복 오류 유형
- 데이터 품질 통계
- JSON Schema 자동 검증
- Rule 기반 Validation
- 사용자 정의 Validation
- AI 기반 데이터 이상 탐지
- 모든 핵심 데이터는 Validation을 거친 후 사용한다.
- Validation은 공통 프레임워크를 통해 수행한다.
- Validation 실패 데이터는 운영 로직에 직접 전달하지 않는다.
반영 원칙 본 문서는 프로젝트 데이터 검증(Validation) 프레임워크를 신규
정의한 설계 문서이다.

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_04.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:24 | 분류: MASTER_SPEC]
- Storage 계층은 업무 로직과 분리한다.
- 동일 데이터는 단일 저장 위치를 원칙으로 한다.
- 저장 경로는 Configuration을 통해 관리한다.
반영 원칙 본 문서는 파일 시스템(Storage) 관리 체계를 신규 정의한 설계

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_04.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:24 | 분류: MASTER_SPEC]
================================================================================
파일: MASTER_SPEC_누락보강_139_프로젝트공통API_인터페이스규격_신규.txt
================================================================================
MASTER_SPEC 누락보강 139 주제 : 프로젝트 공통 API 및 인터페이스 규격

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_04.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:24 | 분류: MASTER_SPEC]
- 사용하지 않는 항목은 숨김 처리한다.
- 의미 없는 선택지는 노출하지 않는다.
- 모든 비교 UI는 동일한 동작을 수행한다.
6. 구현 원칙
- 공통 비교 콤보 생성 함수 사용
- 공통 방향 변경 함수 사용
- 개별 화면에서 별도 구현 금지
7. UI 원칙
- 동일한 순서 유지
- 동일한 폭 유지
- 동일한 정렬 유지
- 동일한 높이 유지
8. 검증 항목
- 방향 변경
- 표시 전환
- 저장값 확인
- 로드 확인
- UI 상태 확인
- 신규 비교조건 추가 시 본 정책을 우선 적용한다.
- 모든 루틴에서 동일한 비교 규칙을 사용한다.

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_04.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:24 | 분류: MASTER_SPEC]
- 기존 내용을 임의 삭제하지 않는다.
- 새로운 정책은 해당 항목에 편입한다.
- 중복은 통합하고 의미는 유지한다.
7. 번호 관리
- 누락 보강은 연속 번호로 관리한다.
- 번호는 재사용하지 않는다.
- 폐기 문서도 번호는 유지한다.
8. 검증 절차 ① 구현 ② UI 확인 ③ 기능 검증 ④ 문서 반영 ⑤ MASTER_SPEC
 갱신
9. 장기 운영 원칙
- MASTER_SPEC는 프로젝트의 최종 기준이다.
- 작업재개 문서는 임시 참조 문서이다.
- 확정 내용은 반드시 MASTER_SPEC로 흡수한다.
- 파트별 변경 이력 관리
- 버전별 비교표
- 자동 반영 체크리스트

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_04.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:24 | 분류: MASTER_SPEC]
1. 목적 프로토타입 단계에서 반복적으로 발생한 UI 수정 과정을 기록하고,
 동일한 시행착오의 재발을 방지한다.

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_04.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:24 | 분류: MASTER_SPEC]
1. 목적 매수설정 UI가 현재 프로토타입 구조로 정리되기까지의 변경 과정과
 최종 확정된 설계 원칙을 기록한다.
- 설정 항목 중심의 나열 방식
- 중복 설정이 많고 실행 흐름이 직관적이지 않았음
3. 주요 변경 과정

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_04.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:24 | 분류: MASTER_SPEC]
- 원본 정책을 그대로 유지한다.
- 새 이름과 식별자만 변경한다.
- 복제 후 독립적으로 수정 가능해야 한다.
5. 루틴 삭제
- 등록 목록에서 제거
- 실행 중인 루틴은 즉시 삭제하지 않는다.
- 삭제 전 참조 여부를 확인한다.
6. 루틴 지정
- 종목별 독립 지정
- 지정 해제 가능
- 변경 즉시 내부 상태 동기화
7. 데이터 원칙
- 루틴 자체와 사용자 설정을 분리 관리한다.
- 원본 루틴을 직접 수정하지 않는다.
8. 검증 항목 □ 중복 등록 □ 복제 무결성 □ 삭제 후 참조 오류 □ 지정/해제
 동기화
- 신규 루틴도 동일 등록 절차 사용
- 공통 등록 구조 유지
- 루틴 버전 정책
- 호환성 검사
- 자동 마이그레이션 기준

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_03.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:18 | 분류: MASTER_SPEC]
MASTER SPEC 통합본_03 (1차 편집)

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_03.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:18 | 분류: MASTER_SPEC]
작업범위 - 통합본 60,001 ~ 90,000자 - 동일 문장 1차 제거 - 연속 중복
제거 - 파일 경계 유지 - 내용 추가/요약 없음

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_03.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:18 | 분류: MASTER_SPEC]
============================================================
호환성 유지 - 문서와 구현 동시 갱신 - 테스트 후 반영
5. 유지보수 원칙

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_03.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:18 | 분류: MASTER_SPEC]
================================================================================
파일:
MASTER_SPEC_누락보강_116_루틴패키지_배포_설치_업데이트아키텍처_신규.txt
================================================================================
MASTER_SPEC 누락보강 116 주제 : 루틴 패키지 배포·설치·업데이트 아키텍처
※ 본 문서는 기존 01~115와 중복되지 않는 루틴 패키지의 배포 및 관리
구조를 신규 정의한다.
1. 목적 루틴을 프로그램 수정 없이 추가·업데이트·제거할 수 있는 표준
 패키지 구조를 정의한다.
2. 목표

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_03.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:18 | 분류: MASTER_SPEC]
1. 목적 프로젝트 전반에서 발생하는 모든 이벤트를 일관된 형식으로
 기록하고, 장애 분석과 운영 개선에 활용할 수 있는 로그 아키텍처를
2. 로그 계층 ① 이벤트 발생 ② 로그 수집 ③ 로그 분류 ④ 저장 ⑤ 조회 ⑥ 분석
 ⑦ 보관/정리
3. 로그 분류

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_03.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:18 | 분류: MASTER_SPEC]
- 발생시각
- 모듈
- 종목
- 루틴
- PLAN ID
- 이벤트 종류
- 상세 내용
- 결과
- 추적 ID
5. 저장 정책
- 날짜별 저장
- 로그 레벨 구분
- 검색 가능 구조
- 압축/보관 정책
- 장기 보존 정책
6. 분석 기능
- 오류 빈도
- 주문 성공률
- 체결 지연
- 루틴별 성능
- 예산 사용
- 장애 이력
- 운영 통계
- 중요 오류 즉시 기록
- 동일 오류 그룹화
- 반복 오류 감지
- 시각화 대시보드
- 원격 로그 서버
- AI 기반 이상 탐지
- 로그 리플레이
- 모든 핵심 이벤트는 로그를 남긴다.
- 로그는 상태 복구의 근거가 되어야 한다.
- 로그 형식은 프로젝트 전체에서 동일하게 유지한다.
반영 원칙 본 문서는 로그 저장소 및 분석 아키텍처를 신규 정의한 설계

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_03.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:18 | 분류: MASTER_SPEC]
- 주문 실패는 시스템/체결 문제이다.
- 전략 실패는 루틴 목표를 유지할 수 없는 상태이다.
- 두 개념을 혼용하지 않는다.
7. 연속 BUY 신호
- 기존 매수계획과의 관계를 우선 검토한다.
- 새로운 계획 생성보다 기존 계획의 상태를 먼저 확인한다.
8. 평단관리 연계
- 프로젝트의 핵심은 평균단가 관리이다.
- 최초 진입보다 이후 포지션 관리가 중요하다.
- 실패 판정은 최소화한다.
- 가능한 범위에서 매수완성을 유도한다.
- 후속정책은 루틴 정책에 따라 수행한다.
10. 향후 보강
- 실패 판정 알고리즘
- 후속정책 상태도
- 매수계획 상태전이

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_03.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:18 | 분류: MASTER_SPEC]
================================================================================
파일: MASTER_SPEC_누락보강_120_플러그인루틴SDK_개발자확장규격_신규.txt
================================================================================
MASTER_SPEC 누락보강 120 주제 : 플러그인(루틴) SDK 및 개발자 확장 규격
※ 본 문서는 기존 01~119와 중복되지 않는 루틴 개발자용 SDK 및 확장 규격을

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_03.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:18 | 분류: MASTER_SPEC]
================================================================================
파일:
MASTER_SPEC_누락보강_124_프로젝트성능_안정성_모니터링아키텍처_신규.txt
================================================================================
MASTER_SPEC 누락보강 124 주제 : 프로젝트 성능·안정성·모니터링 아키텍처

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_03.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:18 | 분류: MASTER_SPEC]
5. 경고 단계 1단계 : 정보(Info) 2단계 : 주의(Warning) 3단계 :
 위험(Critical) 4단계 : 운영 중단(Emergency)
6. 운영 알림
- 연결 끊김
- 데이터 지연
- 주문 실패 증가
- 메모리 이상
7. 통계 수집
- 평균 처리 시간
- 최대 처리 시간
- 이벤트 처리량
- 장애 발생 빈도
- 복구 성공률
- 웹 대시보드
- AI 이상 탐지
- 성능 예측
- 자동 리포트 생성
- 모니터링은 운영 로직과 분리한다.
- 성능 측정이 운영 성능을 저하시키지 않아야 한다.
- 모든 경고는 로그와 연계하여 추적 가능해야 한다.
반영 원칙 본 문서는 프로젝트 성능·안정성·모니터링 체계를 신규 정의한

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_03.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:18 | 분류: MASTER_SPEC]
================================================================================
파일: MASTER_SPEC_누락보강_125_보안_권한관리_Audit아키텍처_신규.txt
================================================================================
MASTER_SPEC 누락보강 125 주제 : 보안·권한관리·감사(Audit) 아키텍처

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_03.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:18 | 분류: MASTER_SPEC]
- 로그인/로그아웃
- 설정 변경
- 루틴 등록 및 삭제
- 종목 등록 및 삭제
- 예산 변경
- 운영 시작/중지
- 검토관리 복귀
6. 감사 기록
- 수행 시각
- 수행 주체
- 대상 기능
- 변경 전 상태
- 변경 후 상태
- 사유
7. 이상 행위 감지
- 반복 실패
- 비정상 설정 변경
- 권한 없는 접근
- 동일 작업 반복
- 예상치 못한 운영 중단
8. 복구 지원
- 설정 변경 이력 복원
- Audit 기반 원인 분석
- 변경 시점 비교
- 운영 이력 추적
- 전자서명
- 다중 승인
- 원격 감사
- 변경 비교 리포트
- 보안 정책 자동 점검
- 모든 중요 변경은 Audit 로그를 남긴다.
- Audit 데이터는 일반 로그와 분리 관리한다.
- 권한 정책은 운영 정책보다 우선 적용한다.
반영 원칙 본 문서는 프로젝트 보안·권한관리·감사(Audit) 체계를 신규

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_03.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:18 | 분류: MASTER_SPEC]
1. 목적 프로젝트를 구성하는 모든 객체를 동일한 생명주기 규칙으로
 관리하여 상태 불일치와 운영 오류를 최소화한다.
2. 관리 대상
- PLAN
- Profile
- 로그
- Runtime 데이터
3. 공통 생명주기 ① 생성 ② 초기화 ③ 활성 ④ 일시 비활성 ⑤ 종료 ⑥ 보관 ⑦
 삭제
4. 상태 전이 원칙

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_03.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:18 | 분류: MASTER_SPEC]
8. 생명주기 검증 □ 생성 정상 □ 상태 전이 정상 □ 종료 정상 □ 삭제 정상 □
 복원 정상 □ 로그 기록
- 객체 버전 관리
- Snapshot 기반 복원
- 자동 정리 정책
- 장기 보관 정책
- 모든 구성요소는 동일한 Lifecycle 모델을 따른다.
- 생명주기 정책은 운영 정책과 일관성을 유지한다.
- 상태 추적은 항상 가능해야 한다.
반영 원칙 본 문서는 프로젝트 구성요소의 Lifecycle 관리 체계를 신규

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_03.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:18 | 분류: MASTER_SPEC]
1. 목적 프로젝트 실행 중 생성되는 모든 Runtime 데이터를 안정적으로
 저장하고, 프로그램 재시작 및 장애 복구 시 동일한 상태를 재현할 수
 있도록 한다.
2. Runtime 데이터 대상
- 종목 상태(State)
- PLAN 정보
- 주문 정보
- 체결 정보
- 검토관리 정보
- 임시 캐시
3. 저장 계층 ① 메모리(Runtime) ② Runtime 파일 ③ 로그 저장소 ④ 백업
 저장소
4. 저장 정책

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_03.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:18 | 분류: MASTER_SPEC]
================================================================================
파일: MASTER_SPEC_누락보강_129_EventBus_메시지전달아키텍처_신규.txt
================================================================================
MASTER_SPEC 누락보강 129 주제 : 이벤트 버스(Event Bus) 및 메시지 전달
※ 본 문서는 기존 01~128과 중복되지 않으며 프로젝트 내부 이벤트 전달
체계를 정의한다.

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_03.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:18 | 분류: MASTER_SPEC]
- 발행(Publish) / 구독(Subscribe)
- 비동기 처리 지원
- 우선순위 기반 전달
- 중복 이벤트 제거
6. 장애 대응
- 이벤트 처리 실패 기록
- 재시도 정책
- Dead Event Queue
- 장애 분석 로그
7. 모니터링
- 대기 큐 길이
- 실패율
- 분산 Event Bus
- 원격 이벤트
- 멀티 프로세스 이벤트
- 이벤트 리플레이
- 모듈은 직접 서로를 호출하지 않고 Event Bus를 통해 통신한다.
- 이벤트는 불변(Immutable) 데이터로 전달한다.
- 이벤트 처리 결과는 추적 가능해야 한다.
반영 원칙 본 문서는 프로젝트 Event Bus 및 메시지 전달 구조를 신규 정의한

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_03.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:18 | 분류: MASTER_SPEC]
※ 본 문서는 기존 01~129와 중복되지 않으며 프로젝트 내부의 작업(Job)
실행, 예약 및 비동기 처리 체계를 정의한다.
1. 목적 동시에 발생하는 다양한 작업을 안정적으로 관리하고 실행 순서를
2. Job 종류

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_03.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:18 | 분류: MASTER_SPEC]
================================================================================
파일: MASTER_SPEC_누락보강_132_Thread관리_동시성아키텍처_신규.txt
================================================================================
MASTER_SPEC 누락보강 132 주제 : Thread 관리 및 동시성(Concurrency)

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_02.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:10 | 분류: MASTER_SPEC]
MASTER SPEC 통합본_02 (1차 편집)

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_02.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:10 | 분류: MASTER_SPEC]
작업범위 - 통합본 30,001 ~ 60,000자 - 동일 문장 1차 제거 - 연속 중복
제거 - 파일 경계 유지 - 내용 추가/요약 없음

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_02.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:10 | 분류: MASTER_SPEC]
============================================================

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_02.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:10 | 분류: MASTER_SPEC]
================================================================================
파일: MASTER_SPEC_누락보강_04_입력컨트롤_UI통일정책.txt
================================================================================
MASTER_SPEC 누락보강 04 주제 : 입력 컨트롤 및 UI 통일 정책

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_02.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:10 | 분류: MASTER_SPEC]
- 제목은 좌측 정렬
- 설정은 반칸 들여쓰기
- 콤보 폭 충분히 확보
- 줄간격 일정 유지
- 가로 스크롤 지양
7. 입력 스타일 통일

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_02.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:10 | 분류: MASTER_SPEC]
================================================================================
파일: MASTER_SPEC_누락보강_08_매수매도_공통설계철학_구조통일원칙.txt
================================================================================
MASTER_SPEC 누락보강 08 주제 : 매수·매도 설정 공통 설계 철학 및 구조
통일 원칙

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_02.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:10 | 분류: MASTER_SPEC]
================================================================================
파일: MASTER_SPEC_누락보강_09_루틴엔진연계_UI엔진매핑원칙.txt
================================================================================
MASTER_SPEC 누락보강 09 주제 : 루틴 엔진 연계 및 UI-엔진 매핑 원칙

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_02.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:10 | 분류: MASTER_SPEC]
- Row Builder 공통 사용
- Show/Hide 정책
- 활성/비활성 정책
- 반칸 들여쓰기
- 공통 정렬
9. 구현 원칙

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_02.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:10 | 분류: MASTER_SPEC]
MASTER_SPEC 누락보강 107 주제 : 프로젝트 개발 원칙·코딩 규칙·MASTER_SPEC
관리 기준 통합

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_02.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:10 | 분류: MASTER_SPEC]
- 이벤트 기반 처리 구조를 사용한다.
- 이벤트는 명확한 의미와 단일 책임을 가진다.
- 동일 이벤트의 중복 처리를 방지한다.
4. 계층 간 흐름 Routine → PLAN → Execution → Management → UI
각 계층은 필요한 정보만 전달하며 직접 내부 구현에 의존하지 않는다.
5. 동기화 원칙
- 상태와 로그를 항상 동기화한다.
- UI는 내부 상태를 기준으로 갱신한다.
- 복구 시 저장된 상태를 기준으로 재구성한다.
- 이벤트 없이 상태를 변경하지 않는다.
- 데이터 전달은 공통 인터페이스를 사용한다.
- 상태 불일치 발생 시 운영 정책에 따라 처리한다.

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_02.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:10 | 분류: MASTER_SPEC]
- 공통 구조를 최대한 재사용한다.
- 동일 기능은 동일한 정책을 사용한다.
- UI와 엔진은 독립성을 유지한다.
- 정책 변경이 엔진 변경으로 이어지지 않도록 설계한다.
5. UI 철학
- 실행 흐름을 그대로 표현한다.
- 사용자가 한 화면에서 전체 흐름을 이해할 수 있어야 한다.
6. 데이터 관리 원칙
- 설정은 데이터로 저장한다.
- 위젯 상태를 직접 저장하지 않는다.
7. 유지보수 원칙
- 기존 구조를 존중한다.
- 필요한 부분만 수정한다.
- 변경 이유를 문서화한다.
8. 검증 원칙
- UI 검증
- 저장 검증
- 엔진 검증
- 통합 검증 단계를 거쳐 기능을 확정한다.
9. 장기 목표

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_02.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:10 | 분류: MASTER_SPEC]
================================================================================
파일:
MASTER_SPEC_누락보강_110_프로젝트전체아키텍처_운영철학_구현원칙_종합.txt
================================================================================
MASTER_SPEC 누락보강 110 주제 : 프로젝트 전체 아키텍처·운영 철학·구현
원칙 종합

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_02.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:10 | 분류: MASTER_SPEC]
목적 프로젝트 전체를 관통하는 아키텍처, 운영 철학, 구현 원칙을 하나의
기준으로 정리하여 향후 모든 개발과 유지보수의 최상위 참조 문서로
1. 핵심 철학

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_02.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:10 | 분류: MASTER_SPEC]
- Routine Layer : 전략 및 신호
- PLAN Layer : 계획 및 상태
- Execution Layer : 주문 및 체결
- Management Layer : 로그, 복구, 운영 관리
- UI Layer : 사용자 표시 및 설정
3. 운영 원칙
- 이벤트 기반 상태 전이
- 상태와 로그의 일관성 유지
- 예외 발생 시 복구 우선
- 자동 처리 불가 상황은 검토관리 연계
- 계층 간 책임 분리
- 하위

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_01.txt | 기준일: 2026-06-30 | 수정시각: 2026-07-01 08:03:04 | 분류: MASTER_SPEC]
MASTER SPEC 통합본_01 (1차 편집)

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_01.txt | 기준일: 2026-06-30 | 수정시각: 2026-07-01 08:03:04 | 분류: MASTER_SPEC]
작업범위 - 통합본 앞부분 - 동일 문장 1차 제거 - 연속 중복 제거 - 파일
경계 유지 - 내용 추가/요약 없음

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_01.txt | 기준일: 2026-06-30 | 수정시각: 2026-07-01 08:03:04 | 분류: MASTER_SPEC]
============================================================ 6. 매수방식

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_86_히스토리기반_PLAN설계변경관리_아키텍처유지원칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:59:12 | 분류: MASTER_SPEC]
MASTER_SPEC 누락보강 86
주제 : 히스토리 기반 PLAN 설계 변경 관리 및 아키텍처 유지 원칙
출처 : 작업진행상황대화히스토리_3~8 비교 반영

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_86_히스토리기반_PLAN설계변경관리_아키텍처유지원칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:59:12 | 분류: MASTER_SPEC]
1. 목적
PLAN 기반 아키텍처가 프로젝트 진행 중 변경되더라도 핵심 구조가
무너지지 않도록 변경 관리 원칙을 정의한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_86_히스토리기반_PLAN설계변경관리_아키텍처유지원칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:59:12 | 분류: MASTER_SPEC]
6. 구현 원칙
- 기존 루틴과의 호환성을 유지한다.
- 공통 엔진 수정은 최소화한다.
- 변경 사유와 영향 범위를 기록한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_139_프로젝트공통API_인터페이스규격_신규.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:53:06 | 분류: MASTER_SPEC]
MASTER_SPEC 누락보강 139
주제 : 프로젝트 공통 API 및 인터페이스 규격 (신규)

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_139_프로젝트공통API_인터페이스규격_신규.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:53:06 | 분류: MASTER_SPEC]
※ 본 문서는 기존 01~138과 중복되지 않으며 프로젝트 내부 모듈 간 공통 API와 인터페이스 규격을 정의한다.
1. 목적
모듈 간 결합도를 낮추고 확장성과 유지보수성을 확보하기 위해 공통 인터페이스 규칙을 표준화한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_139_프로젝트공통API_인터페이스규격_신규.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:53:06 | 분류: MASTER_SPEC]
2. 적용 대상
- Routine API
- PLAN API
- Runtime API
- Order API
- Execution API
- UI API
- Storage API
- Logging API
3. 인터페이스 원칙
- 단일 책임
- 명확한 입·출력
- 구현과 인터페이스 분리
- 하위 호환성 유지

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_139_프로젝트공통API_인터페이스규격_신규.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:53:06 | 분류: MASTER_SPEC]
8. 향후 확장
- 외부 API Adapter
- REST/WebSocket Gateway
- SDK 자동 생성
- API 문서 자동화

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_139_프로젝트공통API_인터페이스규격_신규.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:53:06 | 분류: MASTER_SPEC]
9. 구현 원칙
- 모듈은 구현체가 아닌 인터페이스에 의존한다.
- 공통 API는 프로젝트 전체에서 동일하게 사용한다.
- 인터페이스 변경은 최소화하고 점진적으로 수행한다.
반영 원칙
본 문서는 프로젝트 공통 API 및 인터페이스 규격을 신규 정의한 설계 문서이다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_138_파일시스템_Storage관리체계_신규.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:52:34 | 분류: MASTER_SPEC]
※ 본 문서는 기존 01~137과 중복되지 않으며 프로젝트에서 사용하는 파일 저장 구조와
Storage 관리 원칙을 정의한다.
1. 목적
프로젝트의 모든 파일을 일관된 규칙으로 관리하여 유지보수성과 데이터 안전성을 확보한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_138_파일시스템_Storage관리체계_신규.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:52:34 | 분류: MASTER_SPEC]
9. 구현 원칙
- Storage 계층은 업무 로직과 분리한다.
- 동일 데이터는 단일 저장 위치를 원칙으로 한다.
- 저장 경로는 Configuration을 통해 관리한다.
반영 원칙
본 문서는 파일 시스템(Storage) 관리 체계를 신규 정의한 설계 문서이다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_136_데이터검증_Validation프레임워크_신규.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:51:34 | 분류: 구현로그/검증보고]
MASTER_SPEC 누락보강 136
주제 : 데이터 검증(Validation) 프레임워크 (신규)
※ 본 문서는 기존 01~135와 중복되지 않으며 프로젝트 전반의 데이터 검증 체계를 정의한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_136_데이터검증_Validation프레임워크_신규.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:51:34 | 분류: 구현로그/검증보고]
10. 구현 원칙
- 모든 핵심 데이터는 Validation을 거친 후 사용한다.
- Validation은 공통 프레임워크를 통해 수행한다.
- Validation 실패 데이터는 운영 로직에 직접 전달하지 않는다.
반영 원칙
본 문서는 프로젝트 데이터 검증(Validation) 프레임워크를 신규 정의한 설계 문서이다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_135_오류코드_예외처리표준_신규.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:51:30 | 분류: MASTER_SPEC]
※ 본 문서는 기존 01~134와 중복되지 않으며 프로젝트 전반의 오류 코드,
예외 처리 및 장애 대응 표준을 정의한다.
1. 목적
오류를 일관된 방식으로 식별·기록·복구하여 운영 안정성과 디버깅 효율을 높인다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_135_오류코드_예외처리표준_신규.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:51:30 | 분류: MASTER_SPEC]
8. 기록 항목
- 발생 시각
- 오류 코드
- 심각도
- 발생 위치
- 예외 메시지
- 복구 결과
- 관련 이벤트 ID

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_135_오류코드_예외처리표준_신규.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:51:30 | 분류: MASTER_SPEC]
10. 구현 원칙
- 모든 예외는 공통 예외 처리기를 통해 처리한다.
- 사용자 표시와 내부 오류 코드를 분리한다.
- 치명적 오류는 데이터 무결성을 우선 보호한다.
반영 원칙
본 문서는 오류 코드 및 예외 처리 표준을 신규 정의한 설계 문서이다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_134_RuntimeQueue_Buffer관리체계_신규.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:51:26 | 분류: MASTER_SPEC]
MASTER_SPEC 누락보강 134
주제 : Runtime Queue 및 Buffer 관리 체계 (신규)

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_134_RuntimeQueue_Buffer관리체계_신규.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:51:26 | 분류: MASTER_SPEC]
7. 장애 대응
- Queue 손상 검사
- 재처리 가능 여부 판정
- Retry Queue 이동
- Dead Queue 기록

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_134_RuntimeQueue_Buffer관리체계_신규.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:51:26 | 분류: MASTER_SPEC]
10. 구현 원칙
- Queue는 단일 책임을 가진다.
- Buffer는 영구 저장소가 아니다.
- Queue 처리 순서는 추적 가능해야 한다.
반영 원칙
본 문서는 Runtime Queue 및 Buffer 관리 체계를 신규 정의한 설계 문서이다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_133_메모리관리_객체캐시전략_신규.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:51:20 | 분류: MASTER_SPEC]
MASTER_SPEC 누락보강 133
주제 : 메모리 관리 및 객체 캐시 전략 (신규)

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_133_메모리관리_객체캐시전략_신규.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:51:20 | 분류: MASTER_SPEC]
9. 향후 확장
- LRU 캐시
- 객체 풀(Object Pool)
- 공유 메모리
- 메모리 Snapshot

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_133_메모리관리_객체캐시전략_신규.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:51:20 | 분류: MASTER_SPEC]
10. 구현 원칙
- Runtime을 기준으로 캐시를 유지한다.
- 캐시는 영구 저장소가 아니다.
- 메모리 최적화보다 데이터 정확성을 우선한다.
반영 원칙
본 문서는 메모리 관리 및 객체 캐시 전략을 신규 정의한 설계 문서이다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_132_Thread관리_동시성아키텍처_신규.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:51:14 | 분류: MASTER_SPEC]
5. 동시성 제어
- 공유 데이터 접근 최소화
- Lock은 필요한 범위에서만 사용
- 읽기/쓰기 충돌 방지
- 동일 객체의 중복 갱신 방지

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_132_Thread관리_동시성아키텍처_신규.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:51:14 | 분류: MASTER_SPEC]
10. 구현 원칙
- UI Thread는 항상 응답성을 유지한다.
- 공유 데이터는 일관된 동기화 정책을 따른다.
- 동시성 제어는 성능보다 데이터 무결성을 우선한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_131_Configuration관리_시스템초기화아키텍처_신규.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:51:02 | 분류: MASTER_SPEC]
4. Configuration 계층
- System Config
- Runtime Config
- Routine Config
- Stock Config
- User Profile Config

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_131_Configuration관리_시스템초기화아키텍처_신규.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:51:02 | 분류: MASTER_SPEC]
9. 구현 원칙
- 설정은 단일 Configuration Manager를 통해 관리한다.
- 초기화 순서는 항상 동일하게 유지한다.
- 설정 변경은 추적 가능해야 한다.
반영 원칙
본 문서는 Configuration 관리 및 시스템 초기화 구조를 신규 정의한 설계 문서이다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_130_작업스케줄러_비동기실행아키텍처_신규.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:50:56 | 분류: MASTER_SPEC]
※ 본 문서는 기존 01~129와 중복되지 않으며 프로젝트 내부의 작업(Job) 실행,
예약 및 비동기 처리 체계를 정의한다.
1. 목적
동시에 발생하는 다양한 작업을 안정적으로 관리하고 실행 순서를 표준화한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_130_작업스케줄러_비동기실행아키텍처_신규.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:50:56 | 분류: MASTER_SPEC]
9. 향후 확장
- 멀티 스레드 Job
- 멀티 프로세스 Job
- 분산 Scheduler
- 우선순위 자동 조정

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_130_작업스케줄러_비동기실행아키텍처_신규.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:50:56 | 분류: MASTER_SPEC]
10. 구현 원칙
- 모든 비동기 작업은 Scheduler를 통해 실행한다.
- Job 상태는 항상 추적 가능해야 한다.
- Scheduler는 업무 로직이 아닌 실행만 담당한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_129_EventBus_메시지전달아키텍처_신규.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:50:48 | 분류: MASTER_SPEC]
5. 전달 정책
- 발행(Publish) / 구독(Subscribe)
- 비동기 처리 지원
- 우선순위 기반 전달
- 중복 이벤트 제거

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_129_EventBus_메시지전달아키텍처_신규.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:50:48 | 분류: MASTER_SPEC]
9. 구현 원칙
- 모듈은 직접 서로를 호출하지 않고 Event Bus를 통해 통신한다.
- 이벤트는 불변(Immutable) 데이터로 전달한다.
- 이벤트 처리 결과는 추적 가능해야 한다.
반영 원칙
본 문서는 프로젝트 Event Bus 및 메시지 전달 구조를 신규 정의한 설계 문서이다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_128_Runtime데이터저장소_Persistence아키텍처_신규.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:50:44 | 분류: MASTER_SPEC]
1. 목적
프로젝트 실행 중 생성되는 모든 Runtime 데이터를 안정적으로 저장하고,
프로그램 재시작 및 장애 복구 시 동일한 상태를 재현할 수 있도록 한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_127_프로젝트구성요소_Lifecycle관리체계_신규.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:50:38 | 분류: MASTER_SPEC]
1. 목적
프로젝트를 구성하는 모든 객체를 동일한 생명주기 규칙으로 관리하여
상태 불일치와 운영 오류를 최소화한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_127_프로젝트구성요소_Lifecycle관리체계_신규.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:50:38 | 분류: MASTER_SPEC]
4. 상태 전이 원칙
- 상태는 이벤트로만 변경한다.
- 이전 상태를 추적 가능해야 한다.
- 종료 객체는 임의로 재활성화하지 않는다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_127_프로젝트구성요소_Lifecycle관리체계_신규.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:50:38 | 분류: MASTER_SPEC]
10. 구현 원칙
- 모든 구성요소는 동일한 Lifecycle 모델을 따른다.
- 생명주기 정책은 운영 정책과 일관성을 유지한다.
- 상태 추적은 항상 가능해야 한다.
반영 원칙
본 문서는 프로젝트 구성요소의 Lifecycle 관리 체계를 신규 정의한 설계 문서이다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_126_버전관리_릴리스_배포운영체계_신규.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:50:30 | 분류: 운영정책]
MASTER_SPEC 누락보강 126
주제 : 버전관리·릴리스·배포 운영 체계 (신규)

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_126_버전관리_릴리스_배포운영체계_신규.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:50:30 | 분류: 운영정책]
※ 본 문서는 기존 01~125와 중복되지 않으며 프로젝트의 버전관리,
릴리스 절차 및 배포 운영 기준을 정의한다.
1. 목적
프로젝트의 모든 변경 사항을 추적 가능하게 관리하고 안정적인 배포 체계를 구축한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_126_버전관리_릴리스_배포운영체계_신규.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:50:30 | 분류: 운영정책]
8. 향후 확장
- 자동 릴리스
- CI/CD 연계
- 패키지 서명
- 버전 비교 리포트
- 자동 변경 로그 생성

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_126_버전관리_릴리스_배포운영체계_신규.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:50:30 | 분류: 운영정책]
9. 구현 원칙
- 모든 배포는 문서와 동일한 버전으로 관리한다.
- 검증되지 않은 버전은 운영 환경에 배포하지 않는다.
- 모든 릴리스는 복구 가능한 상태를 유지한다.
반영 원칙
본 문서는 프로젝트 버전관리·릴리스·배포 운영 체계를 신규 정의한 설계 문서이다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_125_보안_권한관리_Audit아키텍처_신규.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:50:22 | 분류: MASTER_SPEC]
MASTER_SPEC 누락보강 125
주제 : 보안·권한관리·감사(Audit) 아키텍처 (신규)

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_125_보안_권한관리_Audit아키텍처_신규.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:50:22 | 분류: MASTER_SPEC]
※ 본 문서는 기존 01~124와 중복되지 않으며 프로젝트의 보안, 권한관리,
감사(Audit) 체계를 정의한다.
1. 목적
운영 환경의 안전성을 확보하고 모든 중요 작업을 추적 가능한 형태로 관리한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_125_보안_권한관리_Audit아키텍처_신규.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:50:22 | 분류: MASTER_SPEC]
4. 권한 정책
- 최소 권한 원칙
- 기능별 접근 제어
- 중요 설정 변경 제한
- 운영 중 위험 기능 확인 절차

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_125_보안_권한관리_Audit아키텍처_신규.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:50:22 | 분류: MASTER_SPEC]
7. 이상 행위 감지
- 반복 실패
- 비정상 설정 변경
- 권한 없는 접근
- 동일 작업 반복
- 예상치 못한 운영 중단

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_125_보안_권한관리_Audit아키텍처_신규.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:50:22 | 분류: MASTER_SPEC]
10. 구현 원칙
- 모든 중요 변경은 Audit 로그를 남긴다.
- Audit 데이터는 일반 로그와 분리 관리한다.
- 권한 정책은 운영 정책보다 우선 적용한다.
반영 원칙
본 문서는 프로젝트 보안·권한관리·감사(Audit) 체계를 신규 정의한 설계 문서이다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_124_프로젝트성능_안정성_모니터링아키텍처_신규.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:50:14 | 분류: MASTER_SPEC]
MASTER_SPEC 누락보강 124
주제 : 프로젝트 성능·안정성·모니터링 아키텍처 (신규)

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_124_프로젝트성능_안정성_모니터링아키텍처_신규.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:50:14 | 분류: MASTER_SPEC]
3. 성능 관리
- 불필요한 연산 최소화
- 이벤트 기반 처리
- 캐시 활용
- UI 갱신 최소화
- 병목 구간 분석

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_124_프로젝트성능_안정성_모니터링아키텍처_신규.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:50:14 | 분류: MASTER_SPEC]
9. 구현 원칙
- 모니터링은 운영 로직과 분리한다.
- 성능 측정이 운영 성능을 저하시키지 않아야 한다.
- 모든 경고는 로그와 연계하여 추적 가능해야 한다.
반영 원칙
본 문서는 프로젝트 성능·안정성·모니터링 체계를 신규 정의한 설계 문서이다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_123_프로젝트운영시뮬레이션_통합테스트표준_신규.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:50:10 | 분류: 운영정책]
MASTER_SPEC 누락보강 123
주제 : 프로젝트 운영 시뮬레이션 및 통합 테스트 표준 (신규)

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_123_프로젝트운영시뮬레이션_통합테스트표준_신규.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:50:10 | 분류: 운영정책]
9. 구현 원칙
- 신규 기능은 통합 테스트를 통과해야 한다.
- 운영 승인 전에는 모든 핵심 시나리오를 재검증한다.
- 테스트 결과는 문서와 함께 보관한다.
반영 원칙
본 문서는 프로젝트 운영 시뮬레이션 및 통합 테스트 절차를 신규 정의한 설계 문서이다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_120_플러그인루틴SDK_개발자확장규격_신규.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:39:28 | 분류: MASTER_SPEC]
3. 루틴 개발 절차
① 프로젝트 생성
② 메타데이터 작성
③ 신호 로직 구현
④ 설정 정의
⑤ 테스트
⑥ 패키징
⑦ 배포

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_120_플러그인루틴SDK_개발자확장규격_신규.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:39:28 | 분류: MASTER_SPEC]
4. 필수 인터페이스
- initialize()
- validate()
- on_market_data()
- evaluate_signal()
- build_plan()
- shutdown()

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_120_플러그인루틴SDK_개발자확장규격_신규.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:39:28 | 분류: MASTER_SPEC]
10. 구현 원칙
- SDK는 엔진 내부 구현에 의존하지 않는다.
- 루틴은 공개 API만 사용한다.
- SDK 변경 시 하위 호환성을 우선 고려한다.
반영 원칙
본 문서는 플러그인(루틴) SDK 및 개발자 확장 규격을 신규 정의한 설계 문서이다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_119_Profile관리_운영환경전환시스템_신규.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:39:24 | 분류: 운영정책]
9. 구현 원칙
- Profile은 운영 상태와 분리하여 관리한다.
- 적용 실패 시 기존 Profile로 즉시 복원한다.
- 모든 변경은 추적 가능해야 한다.
반영 원칙
본 문서는 설정(Profile) 관리 및 운영 환경 전환 시스템을 신규 정의한 설계 문서이다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_118_로그저장소_분석아키텍처_신규.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:39:18 | 분류: 구현로그/검증보고]
1. 목적
프로젝트 전반에서 발생하는 모든 이벤트를 일관된 형식으로 기록하고,
장애 분석과 운영 개선에 활용할 수 있는 로그 아키텍처를 정의한다.
2. 로그 계층
① 이벤트 발생
② 로그 수집
③ 로그 분류
④ 저장
⑤ 조회
⑥ 분석
⑦ 보관/정리

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_118_로그저장소_분석아키텍처_신규.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:39:18 | 분류: 구현로그/검증보고]
9. 구현 원칙
- 모든 핵심 이벤트는 로그를 남긴다.
- 로그는 상태 복구의 근거가 되어야 한다.
- 로그 형식은 프로젝트 전체에서 동일하게 유지한다.
반영 원칙
본 문서는 로그 저장소 및 분석 아키텍처를 신규 정의한 설계 문서이다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_117_다중루틴_스케줄링_실행우선순위엔진_신규.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:39:14 | 분류: MASTER_SPEC]
2. 설계 목표
- 루틴 간 독립성 유지
- 실행 충돌 방지
- 예산 및 주문 경쟁 최소화
- 공정한 실행 순서 보장

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_117_다중루틴_스케줄링_실행우선순위엔진_신규.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:39:14 | 분류: MASTER_SPEC]
3. 스케줄링 계층
① 이벤트 수신
② 실행 대상 선별
③ 우선순위 계산
④ 실행 큐 생성
⑤ 실행
⑥ 결과 반영

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_117_다중루틴_스케줄링_실행우선순위엔진_신규.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:39:14 | 분류: MASTER_SPEC]
5. 실행 큐
- FIFO 기본
- 우선순위 재정렬 허용
- 중복 실행 방지
- 실행 중 락(Lock) 적용

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_117_다중루틴_스케줄링_실행우선순위엔진_신규.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:39:14 | 분류: MASTER_SPEC]
10. 구현 원칙
- 스케줄러는 전략을 변경하지 않는다.
- 루틴은 실행 순서를 직접 제어하지 않는다.
- 실행 엔진은 스케줄러의 결과만 수행한다.
반영 원칙
본 문서는 다중 루틴 스케줄링과 실행 우선순위 엔진을 신규 정의한 설계 문서이다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_116_루틴패키지_배포_설치_업데이트아키텍처_신규.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:39:10 | 분류: MASTER_SPEC]
2. 목표
- 파일 배치만으로 루틴 자동 인식
- 설치 프로그램 불필요
- 기존 루틴과 독립 운영
- 버전 호환성 유지

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_116_루틴패키지_배포_설치_업데이트아키텍처_신규.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:39:10 | 분류: MASTER_SPEC]
4. 등록 절차
① 패키지 복사
② 무결성 검사
③ 메타데이터 확인
④ 버전 확인
⑤ 자동 등록
⑥ UI 반영

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_116_루틴패키지_배포_설치_업데이트아키텍처_신규.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:39:10 | 분류: MASTER_SPEC]
10. 구현 원칙
- 루틴은 플러그인처럼 독립 동작한다.
- 메인 프로그램은 패키지 규격만 의존한다.
- 배포 절차는 운영 환경과 개발 환경에서 동일해야 한다.
반영 원칙
본 문서는 루틴 패키지 배포·설치·업데이트 체계를 신규 정의한 설계 문서이다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_115_장애복구_운영자동화아키텍처_신규.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:39:06 | 분류: 운영정책]
9. 구현 원칙
- 복구보다 데이터 무결성을 우선한다.
- 복구 과정은 모두 로그로 기록한다.
- 운영 재개 전 반드시 무결성 검사를 완료한다.
반영 원칙
본 문서는 장애 복구 및 운영 자동화 아키텍처를 신규 정의한 설계 문서이다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_114_실시간데이터수집_캐시_동기화아키텍처_신규.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:39:00 | 분류: MASTER_SPEC]
10. 구현 원칙
- OpenAPI 이벤트를 직접 UI나 루틴으로 전달하지 않는다.
- 실시간 캐시를 단일 진실 공급원(Source of Truth)으로 사용한다.
- 모든 엔진은 공통 이벤트 브로커를 통해 데이터를 수신한다.
반영 원칙
본 문서는 실시간 데이터 수집, 캐시 및 동기화 구조를 신규 정의한 설계 문서이다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_112_종목관리엔진_종목생명주기설계_신규.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:38:42 | 분류: MASTER_SPEC]
MASTER_SPEC 누락보강 112
주제 : 종목관리 엔진 및 종목 생명주기 설계 (신규)
※ 본 문서는 기존 01~111과 중복되지 않는 종목관리 엔진의 내부 설계를 신규 정의한다.
1. 목적
프로젝트 전체에서 종목 등록부터 운영 종료까지의 생명주기를 표준화한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_112_종목관리엔진_종목생명주기설계_신규.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:38:42 | 분류: MASTER_SPEC]
9. 구현 원칙
- 종목은 독립 객체로 관리한다.
- 루틴과 종목을 직접 결합하지 않는다.
- 운영 상태는 공통 인터페이스로 조회한다.
10. 향후 확장
- 다중 계좌
- 다중 시장
- 종목 그룹
- 우선순위 운영
반영 원칙
본 문서는 종목관리 엔진과 종목 생명주기를 신규 설계한 기준 문서이다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_111_OpenAPI연동_실시간처리아키텍처_신규.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:35:06 | 분류: MASTER_SPEC]
11. 구현 원칙
- OpenAPI 의존성은 Adapter 계층으로 제한한다.
- 루틴은 OpenAPI 객체를 직접 사용하지 않는다.
- 이벤트는 공통 인터페이스를 통해 전달한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_110_프로젝트전체아키텍처_운영철학_구현원칙_종합.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:31:02 | 분류: 운영정책]
MASTER_SPEC 누락보강 110
주제 : 프로젝트 전체 아키텍처·운영 철학·구현 원칙 종합
출처 : 작업진행상황대화히스토리 3~8 비교 반영

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_110_프로젝트전체아키텍처_운영철학_구현원칙_종합.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:31:02 | 분류: 운영정책]
목적
프로젝트 전체를 관통하는 아키텍처, 운영 철학, 구현 원칙을 하나의 기준으로
정리하여 향후 모든 개발과 유지보수의 최상위 참조 문서로 사용한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_110_프로젝트전체아키텍처_운영철학_구현원칙_종합.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:31:02 | 분류: 운영정책]
1. 핵심 철학
- 전략과 실행을 분리한다.
- PLAN 중심 구조를 유지한다.
- 공통 기능은 재사용하고 중복 구현을 지양한다.
- 운영 안정성을 기능 추가보다 우선한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_110_프로젝트전체아키텍처_운영철학_구현원칙_종합.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:31:02 | 분류: 운영정책]
2. 아키텍처 원칙
- Routine Layer : 전략 및 신호
- PLAN Layer : 계획 및 상태
- Execution Layer : 주문 및 체결
- Management Layer : 로그, 복구, 운영 관리
- UI Layer : 사용자 표시 및 설정

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_110_프로젝트전체아키텍처_운영철학_구현원칙_종합.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:31:02 | 분류: 운영정책]
3. 운영 원칙
- 이벤트 기반 상태 전이
- 상태와 로그의 일관성 유지
- 예외 발생 시 복구 우선
- 자동 처리 불가 상황은 검토관리 연계

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_110_프로젝트전체아키텍처_운영철학_구현원칙_종합.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:31:02 | 분류: 운영정책]
4. 구현 원칙
- 공통 인터페이스 유지
- 계층 간 책임 분리
- 하위 호환성 유지
- 문서와 구현 동시 갱신
- 테스트 후 반영

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_110_프로젝트전체아키텍처_운영철학_구현원칙_종합.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:31:02 | 분류: 운영정책]
5. 유지보수 원칙
- 구조 변경보다 정책 변경을 우선한다.
- 변경 영향 범위를 사전에 검토한다.
- 버전 및 변경 이력을 관리한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_109_데이터흐름_상태관리_이벤트전달체계_통합기준.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:30:58 | 분류: MASTER_SPEC]
MASTER_SPEC 누락보강 109
주제 : 프로젝트 데이터 흐름·상태 관리·이벤트 전달 체계 통합 기준
출처 : 작업진행상황대화히스토리 3~8 비교 반영

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_109_데이터흐름_상태관리_이벤트전달체계_통합기준.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:30:58 | 분류: MASTER_SPEC]
목적
프로젝트 전반에서 데이터 흐름, 상태 관리, 이벤트 전달 방식을 하나의 기준으로
통일하여 모듈 간 일관성과 유지보수성을 확보한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_109_데이터흐름_상태관리_이벤트전달체계_통합기준.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:30:58 | 분류: MASTER_SPEC]
1. 데이터 흐름 원칙
- 데이터는 단방향 흐름을 기본으로 한다.
- 이벤트 발생 → 상태 변경 → UI 갱신 순서를 유지한다.
- 동일 데이터를 여러 위치에서 임의 수정하지 않는다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_109_데이터흐름_상태관리_이벤트전달체계_통합기준.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:30:58 | 분류: MASTER_SPEC]
5. 동기화 원칙
- 상태와 로그를 항상 동기화한다.
- UI는 내부 상태를 기준으로 갱신한다.
- 복구 시 저장된 상태를 기준으로 재구성한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_109_데이터흐름_상태관리_이벤트전달체계_통합기준.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:30:58 | 분류: MASTER_SPEC]
6. 구현 원칙
- 이벤트 없이 상태를 변경하지 않는다.
- 데이터 전달은 공통 인터페이스를 사용한다.
- 상태 불일치 발생 시 운영 정책에 따라 처리한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_108_프로젝트구조_모듈구성_의존성관리_통합기준.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:30:46 | 분류: MASTER_SPEC]
목적
프로젝트의 디렉터리 구조, 모듈 구성, 의존성 관리 원칙을 통합하여
장기적인 유지보수성과 확장성을 확보한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_108_프로젝트구조_모듈구성_의존성관리_통합기준.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:30:46 | 분류: MASTER_SPEC]
1. 구조 원칙
- 기능별 모듈 분리
- UI, 엔진, 데이터, 운영 기능 분리
- 공통 기능은 공용 모듈로 관리
- 순환 참조를 지양한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_108_프로젝트구조_모듈구성_의존성관리_통합기준.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:30:46 | 분류: MASTER_SPEC]
3. 모듈 의존성
Routine → PLAN → Execution → Management
상위 정책은 하위 실행을 직접 구현하지 않는다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_108_프로젝트구조_모듈구성_의존성관리_통합기준.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:30:46 | 분류: MASTER_SPEC]
5. 구현 원칙
- 모듈 간 역할을 중복하지 않는다.
- 내부 구현보다 공개 인터페이스를 사용한다.
- 변경 영향 범위를 최소화한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_107_프로젝트개발원칙_코딩규칙_MASTERSPEC관리기준_통합.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:30:40 | 분류: MASTER_SPEC]
목적
프로젝트 전반에서 일관된 개발 품질을 유지하기 위한 개발 원칙, 코딩 규칙,
문서 관리 기준을 통합 정의한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_107_프로젝트개발원칙_코딩규칙_MASTERSPEC관리기준_통합.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:30:40 | 분류: MASTER_SPEC]
1. 개발 기본 원칙
- 설계 후 구현을 원칙으로 한다.
- 공통 구조를 우선하고 중복 구현을 지양한다.
- 기능보다 구조 안정성을 우선한다.
- 구현과 문서는 동시에 갱신한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_107_프로젝트개발원칙_코딩규칙_MASTERSPEC관리기준_통합.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:30:40 | 분류: MASTER_SPEC]
2. 코딩 규칙
- 계층별 책임을 명확히 분리한다.
- 공통 기능은 재사용 가능한 형태로 구현한다.
- 하드코딩을 최소화한다.
- 상태 변경은 명확한 이벤트를 통해 수행한다.
- 예외 처리는 일관된 방식으로 기록한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_107_프로젝트개발원칙_코딩규칙_MASTERSPEC관리기준_통합.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:30:40 | 분류: MASTER_SPEC]
3. 구조 관리 원칙
- Routine, PLAN, Execution, Management 계층을 유지한다.
- 공통 인터페이스를 변경할 경우 영향 범위를 먼저 분석한다.
- 신규 기능은 기존 구조와의 호환성을 우선 검토한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_107_프로젝트개발원칙_코딩규칙_MASTERSPEC관리기준_통합.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:30:40 | 분류: MASTER_SPEC]
7. 장기 유지보수 원칙
- 설계 철학을 유지하면서 기능을 확장한다.
- 변경 이력을 지속적으로 관리한다.
- 프로젝트 전체에서 동일한 개발 기준을 적용한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_106_루틴엔진_신호처리_통합기준.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:30:36 | 분류: MASTER_SPEC]
6. 구현 원칙
- 동일 신호 처리 인터페이스를 사용한다.
- 루틴은 거래소 API를 직접 호출하지 않는다.
- 루틴 추가 시 공통 신호 인터페이스를 유지한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_105_운영정책_통합기준.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:30:30 | 분류: 운영정책]
1. 운영 기본 원칙
- 자동 처리보다 데이터 무결성을 우선한다.
- 운영 상태는 항상 실제 주문 상태와 일치해야 한다.
- 예외 상황은 검토 가능한 형태로 기록한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_104_테스트정책_검증절차_통합기준.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:30:26 | 분류: 구현로그/검증보고]
MASTER_SPEC 누락보강 104
주제 : 테스트 정책 및 검증 절차 통합 기준
출처 : 작업진행상황대화히스토리 3~8 비교 반영
목적
프로젝트 전반의 테스트 철학, 검증 절차, 회귀 테스트 기준을 하나의 문서로 통합한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_102_루틴설정UI_통합설계기준.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:30:16 | 분류: MASTER_SPEC]
9. 구현 원칙
- 모든 루틴 설정창은 동일한 UI 철학을 따른다.
- 공통 기능은 재사용한다.
- 화면별 예외 구현을 최소화한다.
- UI 변경 시 문서와 구현을 함께 갱신한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_101_UI구현표준_통합본.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:30:10 | 분류: MASTER_SPEC]
4. Show / Hide 정책
- 선택값에 따라 필요한 항목만 표시
- 불필요한 입력은 숨김
- 레이아웃이 무너지지 않도록 공간 유지

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_101_UI구현표준_통합본.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:30:10 | 분류: MASTER_SPEC]
6. Row Builder 원칙
- 동일 형식의 입력행은 공통 생성 규칙 사용
- 화면별 개별 구현 최소화
- 공통 스타일 유지

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_101_UI구현표준_통합본.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:30:10 | 분류: MASTER_SPEC]
7. 폭 및 정렬
- 긴 정책 문구 우선 확보
- 입력폭 표준화
- 문구 잘림 방지
- 좌우 정렬 일관성 유지

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_101_UI구현표준_통합본.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:30:10 | 분류: MASTER_SPEC]
8. 공통 구현 원칙
- UI 규칙은 모든 루틴 설정창에서 동일하게 적용
- 기능 추가 시 기존 레이아웃 철학 유지
- 중복 구현보다 공통화를 우선
반영 원칙
본 문서는 기존 누락보강 101~110 수준의 UI 구현 규칙을 통합한 기준 문서이다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_100_히스토리기반_PLAN중심_자동매매프레임워크_최종종합원칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:23:54 | 분류: MASTER_SPEC]
1. 목적
PLAN 중심 자동매매 프레임워크의 핵심 철학과 구조, 운영 기준을 종합하여
프로젝트 전체의 최상위 설계 원칙으로 정의한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_100_히스토리기반_PLAN중심_자동매매프레임워크_최종종합원칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:23:54 | 분류: MASTER_SPEC]
5. 장기 확장 원칙
- 신규 루틴은 기존 PLAN 구조를 재사용한다.
- 공통 엔진은 전략에 의존하지 않는다.
- 구조 변경보다 정책 변경을 우선한다.
- 기존 루틴과의 호환성을 유지한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_99_히스토리기반_PLAN중심_자동매매프레임워크_최종구조검증기준.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:23:48 | 분류: 구현로그/검증보고]
1. 목적
PLAN 중심 자동매매 프레임워크의 구조가 설계 원칙대로 유지되는지
최종적으로 검증하기 위한 기준을 정의한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_99_히스토리기반_PLAN중심_자동매매프레임워크_최종구조검증기준.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:23:48 | 분류: 구현로그/검증보고]
2. 구조 검증 원칙
- 설계 철학과 구현이 일치해야 한다.
- 계층 간 책임이 혼합되지 않아야 한다.
- 공통 구조는 모든 루틴에서 동일하게 사용한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_96_히스토리기반_PLAN중심_자동매매프레임워크_핵심설계원칙종합.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:23:34 | 분류: MASTER_SPEC]
1. 목적
PLAN 중심 자동매매 프레임워크의 핵심 설계 원칙을 하나의 기준으로 정리하여
향후 기능 추가와 구조 개선 시 최우선 참조 문서로 사용한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_95_히스토리기반_PLAN중심_자동매매프레임워크_최종아키텍처보존기준.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:23:30 | 분류: MASTER_SPEC]
1. 목적
프로젝트가 장기간 확장되더라도 PLAN 중심 아키텍처의 핵심 구조가 유지되도록
최종 보존 기준을 정의한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_94_히스토리기반_PLAN중심_자동매매프레임워크_장기운영_구조보존원칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:23:22 | 분류: 운영정책]
2. 기본 원칙
- 단기 기능보다 장기 구조를 우선한다.
- 공통 아키텍처는 가능한 변경하지 않는다.
- 구조 변경이 필요한 경우 명확한 근거를 남긴다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_93_히스토리기반_PLAN중심_자동매매프레임워크_문서관리_변경이력원칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:23:12 | 분류: MASTER_SPEC]
2. 기본 원칙
- 구현과 문서는 항상 함께 갱신한다.
- 변경 이력은 추적 가능해야 한다.
- 설계 의도와 실제 구현의 차이를 남기지 않는다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_93_히스토리기반_PLAN중심_자동매매프레임워크_문서관리_변경이력원칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:23:12 | 분류: MASTER_SPEC]
4. 문서 갱신 절차
① 변경 사항 확정
② 영향 범위 분석
③ 구현 반영
④ 문서 갱신
⑤ 검토 및 승인
⑥ 버전 기록

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_93_히스토리기반_PLAN중심_자동매매프레임워크_문서관리_변경이력원칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:23:12 | 분류: MASTER_SPEC]
5. 변경 이력 원칙
- 변경 목적
- 변경 내용
- 영향 범위
- 호환성 여부
- 관련 문서
를 함께 기록한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_93_히스토리기반_PLAN중심_자동매매프레임워크_문서관리_변경이력원칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:23:12 | 분류: MASTER_SPEC]
6. 유지 원칙
- 최신 문서를 기준으로 개발한다.
- 중복 문서를 최소화한다.
- 폐기 문서는 폐기 사유를 남긴다.
7. 검증 항목
□ 문서 최신화
□ 구현 일치
□ 변경 이력 기록
□ 버전 일치
□ 관련 문서 연계

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_92_히스토리기반_PLAN중심_자동매매프레임워크_유지보수_버전관리원칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:23:08 | 분류: MASTER_SPEC]
2. 기본 원칙
- 공통 아키텍처는 안정성을 우선한다.
- 변경은 추적 가능해야 한다.
- 버전별 변경 이력은 반드시 기록한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_91_히스토리기반_PLAN중심_자동매매프레임워크_릴리스승인기준.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:23:00 | 분류: MASTER_SPEC]
2. 기본 원칙
- 기능 구현 완료와 운영 가능 판정은 구분한다.
- 모든 핵심 시나리오가 검증된 경우에만 릴리스를 승인한다.
- 설계 철학과 구현 결과가 일치해야 한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_88_히스토리기반_PLAN중심_자동매매프레임워크_운영표준.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:22:32 | 분류: 운영정책]
6. 유지보수 원칙
- 공통 프레임워크는 안정성을 우선한다.
- 신규 기능은 공통 구조를 해치지 않는 범위에서 추가한다.
- 구조 변경 시 관련 문서와 구현을 함께 갱신한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_85_히스토리기반_PLAN중심_자동매매프레임워크_최종설계원칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:22:22 | 분류: MASTER_SPEC]
1. 목적
프로젝트 전반에서 채택한 PLAN 중심 자동매매 프레임워크의 최종 설계 원칙을
정리하여 향후 구현과 확장의 최상위 기준으로 사용한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_85_히스토리기반_PLAN중심_자동매매프레임워크_최종설계원칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:22:22 | 분류: MASTER_SPEC]
6. 유지보수 원칙
- 정책 변경은 루틴에서 해결한다.
- 실행 계층은 전략과 독립적으로 유지한다.
- 공통 기능은 중복 구현하지 않는다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_84_히스토리기반_PLAN기반_자동매매엔진_공통아키텍처_구현원칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:22:18 | 분류: MASTER_SPEC]
2. 핵심 철학
- 전략(Strategy)과 실행(Execution)을 분리한다.
- PLAN은 전략과 실행을 연결하는 표준 계층이다.
- 공통 기능은 엔진에서 제공하고 전략은 루틴이 정의한다.
3. 공통 아키텍처
① Routine Layer
- 신호 생성
- 정책 정의
② PLAN Layer
- 주문 계획
- 상태 관리
- 생명주기 관리
③ Execution Layer
- 주문 전송
- 체결 확인
- 재시도 수행
④ Management Layer
- 로그
- 복구
- 검토관리
- 운영 상태 관리

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_84_히스토리기반_PLAN기반_자동매매엔진_공통아키텍처_구현원칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:22:18 | 분류: MASTER_SPEC]
4. 구현 원칙
- 계층 간 책임을 혼합하지 않는다.
- 동일 기능을 중복 구현하지 않는다.
- 공통 인터페이스를 우선 사용한다.
- 루틴 추가 시 기존 엔진 수정은 최소화한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_83_히스토리기반_PLAN기반_자동매매엔진_계층구조_데이터흐름.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:22:10 | 분류: MASTER_SPEC]
5. 구현 원칙
- 각 계층은 자신의 책임만 수행한다.
- 계층 간 직접 참조를 최소화한다.
- 공통 인터페이스를 통해서만 데이터를 전달한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_82_히스토리기반_루틴등록_PLAN생성_주문실행_전체흐름.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:22:04 | 분류: MASTER_SPEC]
MASTER_SPEC 누락보강 82
주제 : 히스토리 기반 루틴 등록·PLAN 생성·주문 실행의 전체 흐름
출처 : 작업진행상황대화히스토리_3~8 비교 반영

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_82_히스토리기반_루틴등록_PLAN생성_주문실행_전체흐름.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:22:04 | 분류: MASTER_SPEC]
2. 기본 원칙
- 루틴은 전략을 정의한다.
- PLAN은 전략을 실행 가능한 형태로 관리한다.
- 주문 엔진은 PLAN만 실행한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_82_히스토리기반_루틴등록_PLAN생성_주문실행_전체흐름.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:22:04 | 분류: MASTER_SPEC]
5. 구현 원칙
- 단계 순서를 임의 변경하지 않는다.
- 각 계층은 자신의 책임만 수행한다.
- 계층 간 직접 의존을 최소화한다.
6. 검증 항목
□ 루틴 등록
□ PLAN 생성
□ 주문 실행
□ 상태 전이
□ 종료
□ 로그
□ 복구

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_81_히스토리기반_PLAN확장성_신규루틴적용원칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:22:00 | 분류: MASTER_SPEC]
MASTER_SPEC 누락보강 81
주제 : 히스토리 기반 PLAN 확장성 및 신규 루틴 적용 원칙
출처 : 작업진행상황대화히스토리_3~8 비교 반영
1. 목적
PLAN 기반 구조를 유지하면서 새로운 자동매매 루틴을 추가할 수 있도록
확장 원칙을 정의한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_81_히스토리기반_PLAN확장성_신규루틴적용원칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:22:00 | 분류: MASTER_SPEC]
2. 기본 원칙
- 신규 루틴은 기존 PLAN 구조를 재사용한다.
- 주문 엔진은 루틴 종류에 의존하지 않는다.
- 전략만 교체하고 실행 계층은 유지한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_81_히스토리기반_PLAN확장성_신규루틴적용원칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:22:00 | 분류: MASTER_SPEC]
6. 구현 원칙
- 기존 루틴에 영향을 주지 않는다.
- 공통 인터페이스를 변경하지 않는다.
- 공통 엔진 수정은 최소화한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_80_히스토리기반_PLAN설계철학_종합_공통운영원칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:21:56 | 분류: 운영정책]
MASTER_SPEC 누락보강 80
주제 : 히스토리 기반 PLAN 설계 철학 종합 및 공통 운영 원칙
출처 : 작업진행상황대화히스토리_3~8 비교 반영

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_80_히스토리기반_PLAN설계철학_종합_공통운영원칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:21:56 | 분류: 운영정책]
2. 핵심 철학
- 모든 주문은 PLAN을 중심으로 관리한다.
- 전략(Policy)과 실행(Execution)을 명확히 분리한다.
- 루틴은 판단을, 메인은 실행을 담당한다.
- 상태는 이벤트 기반으로만 전이한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_80_히스토리기반_PLAN설계철학_종합_공통운영원칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:21:56 | 분류: 운영정책]
3. PLAN 공통 생명주기
① 신호 생성
② PLAN 생성
③ 주문 실행
④ 체결 관리
⑤ 완료·미완성·실패 판정
⑥ 종료
⑦ 로그 및 복구

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_80_히스토리기반_PLAN설계철학_종합_공통운영원칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:21:56 | 분류: 운영정책]
5. 구현 원칙
- 공통 인터페이스 유지
- 공통 상태 머신 사용
- 공통 이벤트 처리 규칙 적용
- 공통 로그 및 복구 체계 유지
- 루틴 독립성 보장

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_80_히스토리기반_PLAN설계철학_종합_공통운영원칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:21:56 | 분류: 운영정책]
6. 유지보수 원칙
- 신규 루틴 추가 시 PLAN 구조를 변경하지 않는다.
- 정책 변경은 루틴 내부에서 해결한다.
- 실행 계층은 공통 구조를 유지한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_79_히스토리기반_PLAN_예외처리_복구우선순위.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:21:44 | 분류: MASTER_SPEC]
MASTER_SPEC 누락보강 79
주제 : 히스토리 기반 PLAN 예외 처리 및 복구 우선순위
출처 : 작업진행상황대화히스토리_3~8 비교 반영

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_79_히스토리기반_PLAN_예외처리_복구우선순위.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:21:44 | 분류: MASTER_SPEC]
2. 기본 원칙
- 예외 발생 시 상태를 임의로 변경하지 않는다.
- 가능한 한 현재 PLAN을 보존하며 복구를 우선한다.
- 복구가 불가능한 경우에만 종료 또는 검토관리로 전환한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_79_히스토리기반_PLAN_예외처리_복구우선순위.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:21:44 | 분류: MASTER_SPEC]
5. 복구 원칙
- 복구 후 동일 PLAN을 계속 사용할 수 있으면 유지한다.
- 중복 PLAN 생성을 금지한다.
- 상태와 로그를 동기화한 후 처리 재개 여부를 판단한다.
6. 역할 분리
루틴
- 예외 정책 정의
- 종료 조건 정의
메인
- 상태 보존
- 복구 수행
- 로그 기록
- 검토관리 연계

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_77_히스토리기반_PLAN공통상태머신_설계원칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:21:36 | 분류: MASTER_SPEC]
2. 기본 철학
- PLAN은 상태 머신으로 관리한다.
- 모든 상태 전이는 명확한 이벤트를 통해서만 발생한다.
- 임의 상태 변경을 허용하지 않는다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_77_히스토리기반_PLAN공통상태머신_설계원칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:21:36 | 분류: MASTER_SPEC]
4. 상태 전이 원칙
- 생성 → 진행
- 진행 → 부분체결
- 진행/부분체결 → 완료
- 진행/부분체결 → 미완성
- 미완성 → 완료 또는 실패 또는 취소
- 완료/실패/취소 → 종료

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_77_히스토리기반_PLAN공통상태머신_설계원칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:21:36 | 분류: MASTER_SPEC]
6. 구현 원칙
- 하나의 이벤트는 하나의 상태 전이만 수행한다.
- 종료 상태에서는 추가 전이를 허용하지 않는다.
- 상태 전이는 로그와 함께 기록한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_76_히스토리기반_PLAN공통인터페이스_루틴독립성원칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:21:30 | 분류: MASTER_SPEC]
MASTER_SPEC 누락보강 76
주제 : 히스토리 기반 PLAN 공통 인터페이스 및 루틴 독립성 원칙
출처 : 작업진행상황대화히스토리_3~8 비교 반영

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_76_히스토리기반_PLAN공통인터페이스_루틴독립성원칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:21:30 | 분류: MASTER_SPEC]
2. 기본 철학
- PLAN 인터페이스는 공통이다.
- 전략은 루틴마다 독립적이다.
- 실행 계층은 루틴 종류를 직접 알 필요가 없다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_76_히스토리기반_PLAN공통인터페이스_루틴독립성원칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:21:30 | 분류: MASTER_SPEC]
5. 구현 원칙
- 신규 루틴 추가 시 주문 엔진 수정은 최소화한다.
- 공통 인터페이스를 유지한다.
- 루틴별 예외 처리는 루틴 내부 정책으로 해결한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_75_히스토리기반_PLAN중심_주문엔진구조_확장원칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:21:24 | 분류: MASTER_SPEC]
MASTER_SPEC 누락보강 75
주제 : 히스토리 기반 PLAN 중심 주문 엔진 구조 및 확장 원칙
출처 : 작업진행상황대화히스토리_3~8 비교 반영

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_75_히스토리기반_PLAN중심_주문엔진구조_확장원칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:21:24 | 분류: MASTER_SPEC]
5. 확장 원칙
- 새로운 루틴이 추가되어도 주문 엔진은 변경을 최소화한다.
- PLAN 인터페이스를 공통으로 유지한다.
- 실행 로직은 전략에 종속되지 않는다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_73_히스토리기반_BUYPLAN_로그상태기록_복구기준.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:21:14 | 분류: 구현로그/검증보고]
2. 기본 원칙
- BUY PLAN의 모든 주요 상태 변화는 기록한다.
- 로그와 내부 상태는 서로 일치해야 한다.
- 복구 시 기록을 기준으로 상태를 재구성한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_73_히스토리기반_BUYPLAN_로그상태기록_복구기준.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:21:14 | 분류: 구현로그/검증보고]
6. 구현 원칙
- 상태 변경과 로그 기록은 동일 이벤트에서 수행한다.
- 기록 누락으로 상태 불일치가 발생하지 않도록 한다.
- 복구 후 동일 BUY PLAN을 중복 생성하지 않는다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_71_히스토리기반_BUYPLAN_상태표시_운영상태관리기준.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:09:16 | 분류: 운영정책]
2. 기본 원칙
- 내부 처리 상태와 화면 표시 상태를 혼용하지 않는다.
- 상태는 BUY PLAN 생명주기를 그대로 반영한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_71_히스토리기반_BUYPLAN_상태표시_운영상태관리기준.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:09:16 | 분류: 운영정책]
5. 상태 변경 기준
- 체결 발생 시 즉시 갱신
- 재매수 수행 시 진행 상태 유지
- 목표 달성 시 완료
- 유효조건 종료 후 정책 완료 시 종료

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_71_히스토리기반_BUYPLAN_상태표시_운영상태관리기준.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:09:16 | 분류: 운영정책]
6. 구현 원칙
- 상태 변경은 단일 관리 지점에서 수행한다.
- 동일 이벤트로 복수 상태를 동시에 생성하지 않는다.
- 상태 변경 이력을 기록한다.
7. 검증 항목
□ 생성
□ 진행
□ 부분 체결
□ 미완성
□ 완료
□ 종료
□ 상태 기록 일치

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_70_히스토리기반_BUYPLAN_완료_미완성_실패_최종판정체계.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:09:12 | 분류: MASTER_SPEC]
2. 기본 원칙
- 완료, 미완성, 실패는 서로 다른 상태이다.
- 부분 체결만으로 실패를 판정하지 않는다.
- 실패는 루틴 정책과 운영 정책을 모두 적용한 이후 최종 결정한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_70_히스토리기반_BUYPLAN_완료_미완성_실패_최종판정체계.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:09:12 | 분류: MASTER_SPEC]
3. 완료(Completed)
다음 중 하나를 만족하면 완료로 판정한다.
- 목표 금액 충족
- 목표 수량 충족

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_70_히스토리기반_BUYPLAN_완료_미완성_실패_최종판정체계.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:09:12 | 분류: MASTER_SPEC]
4. 미완성(Incomplete)
다음 조건을 만족하면 미완성으로 유지한다.
- 목표 미달
- BUY PLAN 유효
- 후속 정책 수행 가능

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_70_히스토리기반_BUYPLAN_완료_미완성_실패_최종판정체계.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:09:12 | 분류: MASTER_SPEC]
5. 실패(Failed)
다음 조건을 모두 만족할 경우 실패로 판정한다.
- 목표 미달
- 유효 조건 종료
- 후속 정책 종료
- 더 이상 루틴 정책으로 진행 불가

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_70_히스토리기반_BUYPLAN_완료_미완성_실패_최종판정체계.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:09:12 | 분류: MASTER_SPEC]
7. 구현 원칙
- 미완성과 실패를 동일하게 취급하지 않는다.
- 실패 판정은 최종 단계에서만 수행한다.
- 판정 결과와 종료 사유를 함께 기록한다.
8. 검증 항목
□ 완료 판정
□ 미완성 유지
□ 실패 판정
□ 종료 사유 기록
□ 상태 복원 일치

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_69_히스토리기반_BUYPLAN_재매수정책_잔여목표처리기준.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:09:04 | 분류: 운영정책]
2. 기본 원칙
- 부분 체결은 실패가 아니다.
- 잔여 목표는 BUY PLAN 내부에서 계속 관리한다.
- 재매수 여부는 루틴 정책에 의해 결정된다.
3. 잔여 목표
잔여 목표는 다음 기준으로 계산한다.
- 잔여 목표금액
또는
- 잔여 목표수량
이미 체결된 수량은 다시 주문 대상으로 삼지 않는다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_69_히스토리기반_BUYPLAN_재매수정책_잔여목표처리기준.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:09:04 | 분류: 운영정책]
5. 처리 흐름
① 부분 체결 발생
② 잔여 목표 계산
③ 루틴 정책 확인
④ 재매수 수행 또는 유지
⑤ 완료 또는 종료 판정
6. 역할 분리
루틴
- 재매수 허용 여부
- 재매수 조건
- 종료 정책
메인
- 잔여 목표 계산
- 주문 실행
- 체결 상태 갱신

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_69_히스토리기반_BUYPLAN_재매수정책_잔여목표처리기준.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:09:04 | 분류: 운영정책]
7. 구현 원칙
- 재매수는 잔여 목표만 대상으로 한다.
- 기존 BUY PLAN을 유지한 상태에서 수행한다.
- 새로운 BUY PLAN을 임의 생성하지 않는다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_68_히스토리기반_BUYPLAN_유효봉_유효시간_종료판정.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:08:56 | 분류: MASTER_SPEC]
2. 기본 원칙
- BUY PLAN은 무기한 유지하지 않는다.
- 루틴에서 정의한 유효 조건 안에서만 유지된다.
- 유효 조건이 종료되면 종료 판정을 수행한다.
3. 유효 조건
- 유효봉
- 유효시간
- 허용 가격 범위
- 루틴별 추가 종료 조건

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_68_히스토리기반_BUYPLAN_유효봉_유효시간_종료판정.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:08:56 | 분류: MASTER_SPEC]
4. 처리 흐름
① BUY PLAN 생성
② 유효 조건 유지 여부 확인
③ 주문 및 체결 진행
④ 목표 달성 여부 확인
⑤ 유효 조건 종료 시 종료 판정 수행

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_68_히스토리기반_BUYPLAN_유효봉_유효시간_종료판정.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:08:56 | 분류: MASTER_SPEC]
5. 종료 판정
다음 중 하나를 만족하면 종료를 검토한다.
- 목표 금액 또는 목표 수량 달성
- 유효봉 종료
- 유효시간 종료
- 루틴 종료 조건 충족

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_68_히스토리기반_BUYPLAN_유효봉_유효시간_종료판정.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:08:56 | 분류: MASTER_SPEC]
6. 구현 원칙
- 유효봉과 유효시간은 루틴 정책으로 정의한다.
- 메인은 해당 조건을 감시하고 실행만 담당한다.
- 종료 이후에는 동일 BUY PLAN을 재사용하지 않는다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_67_히스토리기반_BUYPLAN_종료정책_검토관리연계기준.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:08:50 | 분류: 운영정책]
3. 기본 원칙
- 매수 미완성은 즉시 검토관리 대상이 아니다.
- 루틴 정책으로 처리 가능한 경우 정상 흐름으로 관리한다.
- 검토관리는 운영 정책으로 해결할 수 없는 경우에만 지정한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_66_히스토리기반_BUYPLAN_상태전이_생명주기관리.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:08:42 | 분류: MASTER_SPEC]
5. 종료 조건
- 목표 금액/수량 달성
- 루틴 종료 조건 충족
- 유효 조건 종료
- 운영 정책에 따른 종료

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_65_히스토리기반_루틴과메인의책임분리_BUYPLAN운영기준.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:08:34 | 분류: 운영정책]
2. 설계 원칙
- 루틴은 '무엇을 할지'를 결정한다.
- 메인은 '어떻게 수행할지'를 담당한다.
- 동일 기능을 양쪽에서 중복 판단하지 않는다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_65_히스토리기반_루틴과메인의책임분리_BUYPLAN운영기준.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:08:34 | 분류: 운영정책]
4. 메인의 책임
- 주문 실행
- 체결 확인
- 잔여 목표 계산
- BUY PLAN 상태 관리
- 주문 재시도 실행
- 상태 저장 및 복구

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_65_히스토리기반_루틴과메인의책임분리_BUYPLAN운영기준.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:08:34 | 분류: 운영정책]
6. 구현 원칙
- 루틴은 실행 로직을 직접 수행하지 않는다.
- 메인은 전략을 임의로 변경하지 않는다.
- 정책과 실행의 경계를 유지한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_63_히스토리기반_단일매수_다중매수_통합처리철학.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:08:22 | 분류: MASTER_SPEC]
1. 목적
단일매수와 다중매수를 서로 다른 로직으로 처리하지 않고,
하나의 BUY PLAN 체계에서 관리하기 위한 공통 원칙을 정의한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_63_히스토리기반_단일매수_다중매수_통합처리철학.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:08:22 | 분류: MASTER_SPEC]
2. 기본 철학
- 단일매수와 다중매수는 매수 방식만 다를 뿐 동일한 목표를 가진다.
- 두 방식 모두 동일한 완료/미완성 판정 구조를 사용한다.
- 매수 방식에 따라 상태 관리 로직을 분리하지 않는다.
3. 완료 판정
완료는 다음 기준으로 판단한다.
- 목표 금액 충족 또는
- 목표 수량 충족
진행률(체결률)은 상태 표시용 정보이며 완료 판정 기준이 아니다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_63_히스토리기반_단일매수_다중매수_통합처리철학.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:08:22 | 분류: MASTER_SPEC]
6. 구현 원칙
- 매수 방식별 별도 상태를 만들지 않는다.
- BUY PLAN을 중심으로 상태를 관리한다.
- 완료·미완성·실패의 판정 기준은 공통으로 유지한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_62_히스토리기반_매수미완성_재매수발동조건.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:08:16 | 분류: MASTER_SPEC]
MASTER_SPEC 누락보강 62
주제 : 히스토리 기반 매수 미완성(Incomplete) 정책 및 재매수 발동 조건
출처 : 작업진행상황대화히스토리_3~8 비교 반영
1. 목적
매수 목표가 완전히 체결되지 않은 상황을 '실패'와 구분하고,
재매수 발동 기준을 표준화한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_62_히스토리기반_매수미완성_재매수발동조건.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:08:16 | 분류: MASTER_SPEC]
5. 재매수 대상
재매수는 전체 목표가 아니라
'잔여 목표 금액 또는 잔여 목표 수량'만 대상으로 수행한다.
6. 역할 분리
루틴
- 재매수 허용 여부
- 유효 조건
- 종료 조건
메인
- 잔여 목표 계산
- 주문 실행
- 체결 상태 갱신

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_61_히스토리기반_BUYPLAN_매수계획_공통구조.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:08:06 | 분류: MASTER_SPEC]
5. 미완성 정책
목표를 충족하지 못한 경우 즉시 실패로 처리하지 않는다.
우선 BUY PLAN을 '매수 미완성' 상태로 유지하고 루틴의 후속 정책을 적용한다.
6. 역할 분리
루틴
- BUY PLAN 생성
- 목표 정의
- 후속 정책 정의
메인
- 주문 실행
- 체결 관리
- 상태 갱신

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_60_히스토리기반_매도설정UI_최종확정사항_구현기준.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:01:44 | 분류: MASTER_SPEC]
4. 공통 기능 기준
- 비교조건 콤보는 공통 규칙 사용
- 반복 수행과 반복이탈조건은 역할을 분리
- 완료정책은 반복 종료 이후 수행
- 용어는 프로젝트 전체에서 동일하게 유지

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_59_히스토리기반_매도설정UI_최종설계철학_유지원칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:01:40 | 분류: MASTER_SPEC]
MASTER_SPEC 누락보강 59
주제 : 히스토리 기반 매도설정 UI 최종 설계 철학 및 유지 원칙
출처 : 작업진행상황대화히스토리_7~8 비교 반영
1. 목적
매도설정 UI의 최종 설계 철학과 향후 구조 변경 시 반드시 유지해야 할
공통 원칙을 정의한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_59_히스토리기반_매도설정UI_최종설계철학_유지원칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:01:40 | 분류: MASTER_SPEC]
2. 핵심 철학
- 설정 나열보다 매도 시나리오의 흐름을 우선한다.
- 사용자는 위에서 아래로 읽으며 전체 과정을 이해할 수 있어야 한다.
- 각 단계는 독립적이면서도 자연스럽게 다음 단계로 이어져야 한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_59_히스토리기반_매도설정UI_최종설계철학_유지원칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:01:40 | 분류: MASTER_SPEC]
3. 구조 원칙
- 그룹박스 구조 유지
- 수행 번호(1~5) 유지
- 제목과 입력부 분리
- 입력부 반칸 들여쓰기
- 공통 행 구성 유지

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_59_히스토리기반_매도설정UI_최종설계철학_유지원칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:01:40 | 분류: MASTER_SPEC]
4. UI 원칙
- 시각 효과보다 정보 전달을 우선한다.
- 긴 정책 문구를 우선적으로 표시한다.
- 불필요한 장식 요소를 최소화한다.
- 동일한 컨트롤은 동일한 크기와 정렬을 사용한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_59_히스토리기반_매도설정UI_최종설계철학_유지원칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:01:40 | 분류: MASTER_SPEC]
5. 확장 원칙
- 신규 기능은 기존 수행 영역 내부에 추가한다.
- 수행 번호를 임의로 변경하지 않는다.
- 공통 비교 규칙과 공통 레이아웃을 유지한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_59_히스토리기반_매도설정UI_최종설계철학_유지원칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:01:40 | 분류: MASTER_SPEC]
6. 변경 원칙
- 구조 변경 전 기존 시나리오 흐름을 검토한다.
- 반복 수정은 실제 화면 검증 후 진행한다.
- 확정된 UI 철학과 충돌하는 변경은 지양한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_58_히스토리기반_매도설정UI_시안비교_최종선택근거.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:01:26 | 분류: MASTER_SPEC]
5. 최종 선택 이유
- 프로젝트 전체 UI와 일관성 유지
- 단계별 이해가 쉬움
- 향후 기능 추가 시 수행 블록 내부 확장 가능
- 불필요한 시각 요소 최소화

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_58_히스토리기반_매도설정UI_시안비교_최종선택근거.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:01:26 | 분류: MASTER_SPEC]
6. 향후 원칙
- 동일한 비교 기준으로 새로운 UI를 검토한다.
- 시제품은 실제 화면 검증 후 채택 여부를 결정한다.
- 채택·보류·폐기 사유를 함께 기록한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_57_히스토리기반_매도설정UI_발전과정_구조변경이력.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:01:22 | 분류: MASTER_SPEC]
4. 확정된 설계 철학
- 설정보다 시나리오 흐름을 우선한다.
- 한 화면에서 전체 흐름을 이해할 수 있어야 한다.
- 동일한 UI 규칙을 모든 수행 영역에 적용한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_57_히스토리기반_매도설정UI_발전과정_구조변경이력.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:01:22 | 분류: MASTER_SPEC]
5. 향후 변경 원칙
- 기존 수행 구조를 유지한 상태에서 확장한다.
- 구조 변경보다 항목 확장을 우선한다.
- 변경 시 이전 결정 이유를 함께 검토한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_56_히스토리기반_시제품검토_반복수정절차_UI확정기준.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:01:16 | 분류: MASTER_SPEC]
MASTER_SPEC 누락보강 56
주제 : 히스토리 기반 시제품 검토·반복 수정 절차 및 UI 확정 기준
출처 : 작업진행상황대화히스토리_8 비교 반영

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_56_히스토리기반_시제품검토_반복수정절차_UI확정기준.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:01:16 | 분류: MASTER_SPEC]
2. 기본 원칙
- 최초 구현은 시제품으로 간주한다.
- 실제 화면 확인 결과를 우선한다.
- 기능보다 가독성을 함께 검토한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_56_히스토리기반_시제품검토_반복수정절차_UI확정기준.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:01:16 | 분류: MASTER_SPEC]
3. 반복 절차
① 시제품 구현
② 화면 확인
③ 문제점 기록
④ 부분 수정
⑤ 재확인
⑥ 확정 또는 추가 수정

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_56_히스토리기반_시제품검토_반복수정절차_UI확정기준.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:01:16 | 분류: MASTER_SPEC]
5. 수정 원칙
- 한 번에 많은 요소를 변경하지 않는다.
- 변경 후 반드시 화면으로 검증한다.
- 만족스럽지 않으면 이전 방향에 얽매이지 않고 재구성한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_56_히스토리기반_시제품검토_반복수정절차_UI확정기준.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:01:16 | 분류: MASTER_SPEC]
6. 확정 기준
- 기능 정상
- 화면 가독성 확보
- 항목 간 일관성 유지
- 프로젝트 전체 UI 규칙과 충돌 없음

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_56_히스토리기반_시제품검토_반복수정절차_UI확정기준.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:01:16 | 분류: MASTER_SPEC]
7. 기록 원칙
- 폐기된 시안도 결정 이유를 남긴다.
- 최종 채택 이유를 함께 기록한다.
- 동일한 시행착오를 반복하지 않는다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_55_히스토리기반_UI문구잘림방지_폭조정기준.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:01:10 | 분류: MASTER_SPEC]
MASTER_SPEC 누락보강 55
주제 : 히스토리 기반 UI 문구 잘림 방지 및 폭 조정 기준
출처 : 작업진행상황대화히스토리_8 비교 반영

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_55_히스토리기반_UI문구잘림방지_폭조정기준.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:01:10 | 분류: MASTER_SPEC]
2. 기본 원칙
- 창 폭보다 설정 문구의 가독성을 우선한다.
- 필요한 경우 창 폭을 조정하되 과도한 확장은 지양한다.
- 한 항목의 폭 확보를 위해 다른 항목을 임의로 축소하지 않는다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_55_히스토리기반_UI문구잘림방지_폭조정기준.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:01:10 | 분류: MASTER_SPEC]
3. 폭 조정 기준
- 콤보박스는 표시 문구가 잘리지 않는 최소 폭을 확보한다.
- 입력칸은 숫자 자릿수를 고려하여 폭을 결정한다.
- 긴 설정문은 입력 영역을 우선 확보한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_55_히스토리기반_UI문구잘림방지_폭조정기준.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:01:10 | 분류: MASTER_SPEC]
4. 창 크기 조정
- 전체 창 확장은 마지막 수단으로 사용한다.
- 먼저 여백과 불필요한 공간을 줄인다.
- 조정 후 실제 화면에서 확인한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_55_히스토리기반_UI문구잘림방지_폭조정기준.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:01:10 | 분류: MASTER_SPEC]
5. 레이아웃 원칙
- 제목 영역은 최소화한다.
- 설정 입력 영역은 최대한 확보한다.
- 좌우 균형보다 실제 읽기 편한 배치를 우선한다.
6. 검증 절차
① 문구 잘림 확인
② 콤보 표시 확인
③ 입력칸 표시 확인
④ 창 크기 재조정 여부 결정

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_54_히스토리기반_설정입력부_레이아웃_정렬표준.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:01:06 | 분류: MASTER_SPEC]
2. 기본 원칙
- 제목과 입력부를 명확히 구분한다.
- 제목은 최대한 좌측 정렬한다.
- 실제 설정 입력은 제목보다 반칸 들여쓴다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_54_히스토리기반_설정입력부_레이아웃_정렬표준.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:01:06 | 분류: MASTER_SPEC]
3. 정렬 기준
- 제목은 동일 시작 위치를 유지한다.
- 입력 컨트롤은 동일 기준선에 맞춘다.
- 콤보박스와 입력칸 높이를 통일한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_54_히스토리기반_설정입력부_레이아웃_정렬표준.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:01:06 | 분류: MASTER_SPEC]
4. 간격 기준
- 각 행의 줄간격을 동일하게 유지한다.
- 체크박스와 콤보박스 사이에는 충분한 여백을 둔다.
- 설정 블록 간 간격은 행 간격보다 크게 유지한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_54_히스토리기반_설정입력부_레이아웃_정렬표준.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:01:06 | 분류: MASTER_SPEC]
5. 입력부 구성
- '제목 | 설정입력' 형식을 기본으로 한다.
- 긴 설정 문장은 입력 영역 폭을 우선 확보한다.
- 제목보다 설정 내용의 가독성을 우선한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_54_히스토리기반_설정입력부_레이아웃_정렬표준.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:01:06 | 분류: MASTER_SPEC]
6. 구현 원칙
- 모든 설정창에 동일한 레이아웃 규칙을 적용한다.
- 화면마다 임의의 들여쓰기나 정렬 방식을 사용하지 않는다.
- 공통 Row Builder 또는 공통 생성 규칙을 따른다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_53_히스토리기반_비교조건콤보_통합규칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:01:02 | 분류: MASTER_SPEC]
MASTER_SPEC 누락보강 53
주제 : 히스토리 기반 비교조건 콤보 통합 규칙
출처 : 작업진행상황대화히스토리_8 비교 반영

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_53_히스토리기반_비교조건콤보_통합규칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:01:02 | 분류: MASTER_SPEC]
1. 목적
방향 선택과 비교조건 선택의 동작을 프로젝트 전체에서 동일하게 적용하기 위한
공통 규칙을 정의한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_53_히스토리기반_비교조건콤보_통합규칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:01:02 | 분류: MASTER_SPEC]
6. 구현 원칙
- 공통 함수로 제어한다.
- 화면마다 별도 구현하지 않는다.
- 모든 비교 UI는 동일한 동작을 따른다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_52_히스토리기반_매도리셋_일괄취소_용어변경원칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:00:56 | 분류: MASTER_SPEC]
MASTER_SPEC 누락보강 52
주제 : 히스토리 기반 매도리셋·일괄취소 용어 변경 배경 및 적용 원칙
출처 : 작업진행상황대화히스토리_8 비교 반영

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_51_히스토리기반_후속매도반복설정_반복이탈조건_연계규칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:00:52 | 분류: MASTER_SPEC]
2. 기본 원칙
- 후속매도반복설정은 반복 수행 방법을 정의한다.
- 반복이탈조건은 반복 종료 여부를 판단한다.
- 두 정책은 서로 대체하지 않는다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_51_히스토리기반_후속매도반복설정_반복이탈조건_연계규칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:00:52 | 분류: MASTER_SPEC]
5. UI 구성 원칙
- 후속매도반복설정은 수행 3 영역에 배치한다.
- 반복이탈조건은 수행 4 영역에 배치한다.
- 두 영역은 동일한 들여쓰기와 행 구성 규칙을 따른다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_51_히스토리기반_후속매도반복설정_반복이탈조건_연계규칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:00:52 | 분류: MASTER_SPEC]
6. 구현 원칙
- 반복 종료 판단은 반복이탈조건에서만 수행한다.
- 완료정책은 반복 종료 이후에만 실행한다.
- 정책 간 중복 판정을 금지한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_50_히스토리기반_반복이탈조건_도입배경_설계목적.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:00:46 | 분류: MASTER_SPEC]
MASTER_SPEC 누락보강 50
주제 : 히스토리 기반 반복이탈조건 도입 배경 및 설계 목적
출처 : 작업진행상황대화히스토리_8 비교 반영

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_50_히스토리기반_반복이탈조건_도입배경_설계목적.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:00:46 | 분류: MASTER_SPEC]
7. UI 원칙
- 체크박스로 활성 여부를 제어한다.
- 세부 설정은 반칸 들여쓰기 형태를 유지한다.
- 가격비교, 반복횟수, 제한시간을 동일 형식으로 배치한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_49_히스토리기반_수행1_5구조확정과정.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:00:42 | 분류: MASTER_SPEC]
4. 배치 원칙
- 수행 번호는 위에서 아래 순서로 유지한다.
- 각 수행은 독립 영역으로 표시한다.
- 제목은 좌측 정렬을 유지한다.
- 설정 입력은 제목보다 반칸 들여쓴다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_49_히스토리기반_수행1_5구조확정과정.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:00:42 | 분류: MASTER_SPEC]
5. 확장 원칙
- 신규 옵션은 해당 수행 내부에 추가한다.
- 수행 번호 체계는 유지한다.
- 수행 간 역할을 중복하지 않는다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_48_히스토리기반_카드형UI검토_폐기사유.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:00:38 | 분류: MASTER_SPEC]
5. 검토 결과
카드형은 완전 폐기 대상은 아니었으나,
현재 프로젝트의 긴 설정 문장과는 적합성이 낮다고 판단하였다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_47_히스토리기반_시나리오중심_UI설계원칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:00:34 | 분류: MASTER_SPEC]
MASTER_SPEC 누락보강 47
주제 : 히스토리 기반 시나리오 중심 UI 설계 원칙
출처 : 작업진행상황대화히스토리_8 비교 반영

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_47_히스토리기반_시나리오중심_UI설계원칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:00:34 | 분류: MASTER_SPEC]
1. 목적
매도설정 UI를 '설정 항목 나열' 방식이 아니라 '시나리오 흐름' 중심으로
구성하기 위해 확정된 설계 원칙을 기록한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_47_히스토리기반_시나리오중심_UI설계원칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:00:34 | 분류: MASTER_SPEC]
4. UI 원칙
- 시나리오 번호를 유지한다.
- 각 수행은 독립 블록으로 구성한다.
- 설정은 제목 아래 반칸 들여쓰기 형태로 배치한다.
- 흐름을 우선하고 설정은 보조 정보로 배치한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_47_히스토리기반_시나리오중심_UI설계원칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:00:34 | 분류: MASTER_SPEC]
5. 구현 기준
- 새 기능이 추가되어도 수행 번호 체계를 유지한다.
- 시나리오 순서를 임의로 변경하지 않는다.
- 동일한 레이아웃 규칙을 모든 수행 블록에 적용한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_46_히스토리기반_프로젝트복구기준_기준문서우선순위.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:51:00 | 분류: MASTER_SPEC]
MASTER_SPEC 누락보강 46
주제 : 히스토리 기반 프로젝트 복구 기준 및 기준 문서 우선순위
출처 : 프로젝트 복구 이력 및 작업 히스토리 비교 반영
1. 목적
프로젝트 복구 및 재개 시 어떤 자료를 기준으로 판단할 것인지
공식 우선순위를 정의한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_46_히스토리기반_프로젝트복구기준_기준문서우선순위.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:51:00 | 분류: MASTER_SPEC]
3. 복구 원칙
- 가장 최근 구현 상태를 먼저 확인한다.
- 코드와 문서가 다르면 원인을 분석한다.
- 문서가 오래된 경우 최신 구현에 맞게 갱신한다.
- 추정으로 복구하지 않는다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_46_히스토리기반_프로젝트복구기준_기준문서우선순위.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:51:00 | 분류: MASTER_SPEC]
5. 작업 재개 원칙
- 최신 정상 파일을 기준으로 시작한다.
- 중간 결과물이 아닌 확정본을 우선 사용한다.
- 폐기된 구조를 다시 적용하지 않는다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_46_히스토리기반_프로젝트복구기준_기준문서우선순위.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:51:00 | 분류: MASTER_SPEC]
6. 충돌 처리
- 코드와 문서가 다르면 이유를 기록한다.
- 히스토리와 문서가 다르면 실제 결정 과정을 확인한다.
- 사용자 최종 결정이 항상 우선한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_45_히스토리기반_AI오판복구_절대금지규칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:50:56 | 분류: 운영정책]
MASTER_SPEC 누락보강 45
주제 : 히스토리 기반 AI 오판 복구 및 절대금지 규칙
출처 : 프로젝트 복구 이력 및 히스토리 비교 반영

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_45_히스토리기반_AI오판복구_절대금지규칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:50:56 | 분류: 운영정책]
2. 기본 원칙
- 프로젝트에 존재하지 않는 개념을 새로 만들지 않는다.
- 기존 문서에 없는 정책을 사실처럼 추가하지 않는다.
- 추정과 확정 사항을 혼용하지 않는다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_45_히스토리기반_AI오판복구_절대금지규칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:50:56 | 분류: 운영정책]
6. 문서 반영 기준
- 히스토리에서 실제 확정된 내용만 반영한다.
- 추론으로 생성한 일반 원칙은 확정 정책과 구분한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_42_히스토리기반_UI수정원칙_점진조정기준.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:50:36 | 분류: MASTER_SPEC]
MASTER_SPEC 누락보강 42
주제 : 히스토리 기반 UI 수정 원칙 및 점진적 조정 기준
출처 : 작업진행상황대화히스토리_6 비교 반영
1. 목적
UI 수정 과정에서 반복적으로 확정된 운영 원칙을 MASTER_SPEC에 반영한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_42_히스토리기반_UI수정원칙_점진조정기준.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:50:36 | 분류: MASTER_SPEC]
2. 점진적 UI 조정 원칙
- UI 폭은 한 번에 크게 변경하지 않는다.
- 소폭 조정 후 화면 확인을 수행한다.
- 확인 결과에 따라 추가 조정을 진행한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_40_OpenAPI연계절차_운영전환정책.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:50:22 | 분류: 운영정책]
6. 실운영 원칙
- 신규 기능은 테스트 후 운영 반영
- 운영 중 구조 변경 최소화
- 장애 발생 시 안전 정지 우선
- 데이터 무결성 유지

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_39_루틴버전관리_호환성정책.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:50:18 | 분류: 운영정책]
4. 호환성 원칙
- 신규 필드 추가는 기존 버전과 호환되도록 한다.
- 기존 필드 삭제는 가능한 한 지양한다.
- 변경이 불가피할 경우 변환 규칙을 함께 정의한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_39_루틴버전관리_호환성정책.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:50:18 | 분류: 운영정책]
8. 구현 원칙
- 버전 비교는 공통 계층에서 수행한다.
- UI는 버전 정보를 표시만 한다.
- 엔진은 변환 완료된 데이터만 사용한다.
9. 향후 보강
- 자동 마이그레이션
- 버전 변경 로그
- 호환성 테스트
- 변환 규칙 관리
10. 결론
버전 관리는 장기 유지보수의 핵심 요소이며,
모든 구조 변경은 버전 정책과 함께 관리한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_38_예외처리_복구정책.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:50:14 | 분류: 운영정책]
MASTER_SPEC 누락보강 38
주제 : 예외 처리 및 복구 정책

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_38_예외처리_복구정책.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:50:14 | 분류: 운영정책]
2. 기본 원칙
- 예외 상황에서는 기능 수행보다 데이터 무결성을 우선한다.
- 자동 복구가 불가능하면 안전한 상태로 전환한다.
- 모든 예외는 기록 가능해야 한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_38_예외처리_복구정책.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:50:14 | 분류: 운영정책]
7. 구현 원칙
- 예외 처리는 공통 계층에서 수행한다.
- UI는 예외를 표시만 한다.
- 루틴은 복구 정책을 직접 수행하지 않는다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_36_UI_데이터_엔진매핑상세규칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:50:04 | 분류: MASTER_SPEC]
8. 매핑 원칙
- UI는 JSON을 직접 수정하지 않는다.
- JSON은 UI 위젯을 알지 않는다.
- 엔진은 UI 객체를 참조하지 않는다.
- 모든 변환은 공통 매핑 계층에서 처리한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_35_상태동기화_이벤트처리정책.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:50:00 | 분류: 운영정책]
2. 기본 원칙
- 하나의 상태는 하나의 기준값만 가진다.
- 표시 상태와 내부 상태가 서로 달라지지 않아야 한다.
- 이벤트는 항상 상태 변경을 통해 처리한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_35_상태동기화_이벤트처리정책.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:50:00 | 분류: 운영정책]
5. 처리 원칙
- 동일 이벤트는 동일 처리 함수 사용
- 중복 이벤트 처리 금지
- 상태 변경 없이 화면만 변경 금지

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_35_상태동기화_이벤트처리정책.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:50:00 | 분류: 운영정책]
7. 구현 원칙
- 상태 변경은 공통 관리 계층에서 수행
- UI는 상태 표시 역할에 집중
- 엔진은 상태 변경 요청만 수행

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_34_공통위젯생성규칙_재사용정책.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:49:56 | 분류: 운영정책]
2. 기본 원칙
- 동일한 기능은 동일한 생성 함수를 사용한다.
- 화면마다 별도의 위젯을 새로 구현하지 않는다.
- 공통 위젯 수정 시 전체 화면에 동일하게 반영되도록 설계한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_34_공통위젯생성규칙_재사용정책.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:49:56 | 분류: 운영정책]
7. 구현 원칙
- 위젯명은 의미 기반으로 작성한다.
- 동일 기능에 다른 이름을 사용하지 않는다.
- 생성 함수는 한 가지 책임만 가진다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_33_rulesjson_설계원칙_데이터구조.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:49:52 | 분류: MASTER_SPEC]
5. 제외 대상
- QWidget 정보
- 화면 좌표
- 색상 및 UI 스타일
- 런타임 객체
- 임시 계산값

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_31_루틴등록_복제_삭제정책.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:49:44 | 분류: 운영정책]
MASTER_SPEC 누락보강 31
주제 : 루틴 등록 · 복제 · 삭제 정책

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_31_루틴등록_복제_삭제정책.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:49:44 | 분류: 운영정책]
2. 기본 원칙
- 루틴은 하나의 독립 패키지로 관리한다.
- 등록은 파일 배치만으로 가능해야 한다.
- 별도의 설치 절차를 요구하지 않는다.
3. 루틴 등록
- 루틴 폴더 자동 인식
- 메타데이터 검증
- 중복 여부 확인
- 등록 가능 여부 판정

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_31_루틴등록_복제_삭제정책.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:49:44 | 분류: 운영정책]
4. 루틴 복제
- 원본 정책을 그대로 유지한다.
- 새 이름과 식별자만 변경한다.
- 복제 후 독립적으로 수정 가능해야 한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_31_루틴등록_복제_삭제정책.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:49:44 | 분류: 운영정책]
5. 루틴 삭제
- 등록 목록에서 제거
- 실행 중인 루틴은 즉시 삭제하지 않는다.
- 삭제 전 참조 여부를 확인한다.
6. 루틴 지정
- 종목별 독립 지정
- 지정 해제 가능
- 변경 즉시 내부 상태 동기화
7. 데이터 원칙
- 루틴 자체와 사용자 설정을 분리 관리한다.
- 원본 루틴을 직접 수정하지 않는다.
8. 검증 항목
□ 중복 등록
□ 복제 무결성
□ 삭제 후 참조 오류
□ 지정/해제 동기화
9. 장기 원칙
- 신규 루틴도 동일 등록 절차 사용
- 공통 등록 구조 유지
10. 향후 보강
- 루틴 버전 정책
- 호환성 검사
- 자동 마이그레이션 기준

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_30_프로젝트전체아키텍처_계층별책임원칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:41:36 | 분류: MASTER_SPEC]
MASTER_SPEC 누락보강 30
주제 : 프로젝트 전체 아키텍처 및 계층별 책임 원칙
1. 목적
프로젝트를 UI, 데이터, 루틴, 메인 엔진으로 명확히 분리하여
확장성과 유지보수성을 확보한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_30_프로젝트전체아키텍처_계층별책임원칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:41:36 | 분류: MASTER_SPEC]
6. 메인 실행 계층 책임
- 주문 요청
- 체결 관리
- 자금 관리
- 종목 상태 관리
- 운영 정책 적용
7. OpenAPI 계층 책임
- 시세 수신
- 주문 송수신
- 체결 이벤트
- 서버 상태 확인

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_30_프로젝트전체아키텍처_계층별책임원칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:41:36 | 분류: MASTER_SPEC]
8. 계층 간 통신 원칙
- UI는 엔진을 직접 제어하지 않는다.
- 엔진은 UI 위젯을 참조하지 않는다.
- 데이터 구조를 통해서만 계층을 연결한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_30_프로젝트전체아키텍처_계층별책임원칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:41:36 | 분류: MASTER_SPEC]
10. 장기 목표
- 루틴 추가 시 UI 변경 최소화
- 엔진 교체 시 UI 영향 최소화
- 정책 확장 시 저장 구조 유지
- 전체 프로젝트를 모듈 단위로 독립 운영 가능하도록 설계한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_28_완료정책_후속정책_설계원칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:41:26 | 분류: 운영정책]
MASTER_SPEC 누락보강 28
주제 : 완료정책 및 후속 정책 설계 원칙

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_28_완료정책_후속정책_설계원칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:41:26 | 분류: 운영정책]
2. 기본 철학
- 완료와 종료는 동일한 의미가 아니다.
- 완료 이후에도 후속 정책이 존재할 수 있다.
- 후속 정책은 루틴이 결정하고 메인은 수행한다.
3. 완료 판단
- 목표 조건 충족
- 반복 종료 조건 충족
- 미체결 정책 종료
- 루틴 종료 조건 충족

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_26_평단관리정책_확정이력_설계철학.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:41:18 | 분류: 운영정책]
MASTER_SPEC 누락보강 26
주제 : 평단관리 정책 확정 이력 및 설계 철학

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_26_평단관리정책_확정이력_설계철학.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:41:18 | 분류: 운영정책]
1. 목적
평단관리 기능의 역할과 설계 철학을 정의하고,
회차기준·예산기준·능동매수의 책임을 명확히 구분한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_26_평단관리정책_확정이력_설계철학.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:41:18 | 분류: 운영정책]
2. 핵심 철학
- 프로젝트의 핵심은 최초 진입이 아니라 평단관리이다.
- 추매를 통해 평균단가를 관리하고 손실을 최소화하는 것을 기본 전략으로 한다.
- 상승은 결과이며, 하락 대응 능력이 루틴의 경쟁력이다.
3. 평단관리 구성
① 회차기준
② 예산기준
③ 능동매수
④ 조건별동작
각 항목은 서로 독립된 역할을 수행한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_26_평단관리정책_확정이력_설계철학.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:41:18 | 분류: 운영정책]
6. 능동매수
- 기본 추매 정책을 대체하지 않는다.
- 현재 포지션을 보정하기 위한 보조 정책이다.
- 루틴이 허용한 경우에만 수행한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_26_평단관리정책_확정이력_설계철학.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:41:18 | 분류: 운영정책]
8. 설계 원칙
- 하나의 정책은 하나의 목적만 가진다.
- 동일 기능을 여러 정책에 중복 구현하지 않는다.
- 공통 비교조건 정책을 적용한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_25_매수설정UI변경이력_최종확정과정.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:41:14 | 분류: MASTER_SPEC]
1. 목적
매수설정 UI가 현재 프로토타입 구조로 정리되기까지의 변경 과정과
최종 확정된 설계 원칙을 기록한다.
2. 초기 구조
- 설정 항목 중심의 나열 방식
- 중복 설정이 많고 실행 흐름이 직관적이지 않았음

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_24_매도설정UI변경이력_최종확정과정.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:41:10 | 분류: MASTER_SPEC]
8. 공통 설계 철학
- 실행 순서와 화면 순서를 동일하게 유지
- 하나의 수행은 하나의 목적만 담당
- UI와 엔진을 직접 연결하지 않는다.
9. 프로토타입 상태
- 구조는 확정 단계
- 로직 연결은 후속 단계
- 디자인은 일부 보완 가능

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_23_UI시행착오_반복개선원칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:41:04 | 분류: MASTER_SPEC]
MASTER_SPEC 누락보강 23
주제 : UI 시행착오 및 반복 개선 원칙

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_23_UI시행착오_반복개선원칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:41:04 | 분류: MASTER_SPEC]
2. 기본 원칙
- 화면을 실제 확인한 후 수정 여부를 결정한다.
- 추론만으로 UI를 확정하지 않는다.
- 작은 수정 후 즉시 검증한다.
3. 반복 개선 방식
① 시안 적용
② 화면 확인
③ 문제점 기록
④ 최소 수정
⑤ 재검증

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_23_UI시행착오_반복개선원칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:41:04 | 분류: MASTER_SPEC]
4. 대표 개선 항목
- 콤보박스 글자 잘림
- 입력칸 폭 조정
- 줄간격 조정
- 제목 정렬
- 반칸 들여쓰기
- 체크박스 위치
- 입력 컨트롤 높이 통일

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_23_UI시행착오_반복개선원칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:41:04 | 분류: MASTER_SPEC]
5. 금지 사항
- 여러 영역을 한 번에 수정
- 확인 없이 대규모 레이아웃 변경
- 검증되지 않은 디자인 적용
6. 변경 기준
- 가독성 향상
- 실행 흐름 유지
- 공통 규칙 유지
- 구조 단순화
7. 기록 원칙
- 수정 이유
- 수정 결과
- 남은 문제
- 보류 여부
8. 완료 기준
- 기능보다 구조가 안정된 상태
- 동일 문제가 반복되지 않는 상태
9. 향후 적용
- 신규 UI도 동일 절차 적용
- 모든 변경은 단계적으로 진행

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_22_UI변경의사결정_설계검토원칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:41:00 | 분류: MASTER_SPEC]
MASTER_SPEC 누락보강 22
주제 : UI 변경 의사결정 및 설계 검토 원칙
1. 목적
UI 변경 과정에서 반복된 시행착오를 줄이고, 변경 여부를 판단하는 공통 기준을 정의한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_22_UI변경의사결정_설계검토원칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:41:00 | 분류: MASTER_SPEC]
3. 채택 기준
- 실행 순서가 명확하게 보일 것
- 설정 간 관계를 쉽게 이해할 것
- 동일 패턴을 다른 화면에도 적용 가능할 것

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_22_UI변경의사결정_설계검토원칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:41:00 | 분류: MASTER_SPEC]
6. 변경 절차
① 시안 작성
② 화면 확인
③ 장단점 기록
④ 채택/보류/폐기 결정
⑤ MASTER_SPEC 반영
7. 기록 원칙
- 왜 변경했는지 기록
- 왜 기존안을 버렸는지 기록
- 향후 재검토 가능 여부 기록

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_22_UI변경의사결정_설계검토원칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:41:00 | 분류: MASTER_SPEC]
8. 프로토타입 원칙
- 화면을 실제로 확인한 뒤 결정한다.
- 추측만으로 구조를 확정하지 않는다.
- 필요 시 여러 시안을 비교한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_22_UI변경의사결정_설계검토원칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:41:00 | 분류: MASTER_SPEC]
9. 장기 원칙
- UI는 점진적으로 개선한다.
- 큰 구조는 쉽게 바꾸지 않는다.
- 확정된 설계 철학은 일관되게 유지한다.
10. 결론
모든 UI 변경은 '구조의 일관성'과 '실행 흐름의 가독성'을 최우선 기준으로 판단한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_21_루틴설정창_용어체계_명명규칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:40:54 | 분류: MASTER_SPEC]
1. 목적
프로젝트 전반에서 동일한 개념은 항상 동일한 용어를 사용하여
UI, 문서, 엔진 간 혼선을 방지한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_19_루틴설정창전체구성철학_확장원칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:40:46 | 분류: MASTER_SPEC]
MASTER_SPEC 누락보강 19
주제 : 루틴 설정창 전체 구성 철학 및 확장 원칙

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_19_루틴설정창전체구성철학_확장원칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:40:46 | 분류: MASTER_SPEC]
2. 기본 철학
- 설정창은 실행 흐름을 그대로 표현한다.
- 사용자는 화면만 보고도 루틴의 동작 순서를 이해할 수 있어야 한다.
- 기능보다 정책 구조의 표현을 우선한다.
3. 화면 구성 원칙
상단
- 루틴 기본정보
- 신호검출조건
- 공통 설정
중앙
- 매수 정책
- 매도 정책
- 평단관리
하단
- 후속 정책
- 상태 표시
- 향후 확장 영역

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_19_루틴설정창전체구성철학_확장원칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:40:46 | 분류: MASTER_SPEC]
4. 구성 원칙
- 하나의 정책은 하나의 영역만 가진다.
- 동일 정책을 여러 위치에 중복 배치하지 않는다.
- 설정 간 책임을 명확히 분리한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_19_루틴설정창전체구성철학_확장원칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:40:46 | 분류: MASTER_SPEC]
5. 확장성
- 새로운 루틴이 추가되어도 동일한 프레임을 사용한다.
- 새로운 정책은 기존 계층에 자연스럽게 편입한다.
- 기존 UI를 크게 변경하지 않고 확장 가능해야 한다.
6. 공통 컴포넌트
- 체크박스
- 콤보박스
- 입력칸
- 상태 표시
- 그룹 박스
공통 생성 로직을 사용한다.
7. 정책 계층
① 신호
② 필터
③ 실행 정책
④ 후속 정책
⑤ 종료 정책
모든 루틴은 이 계층을 따른다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_19_루틴설정창전체구성철학_확장원칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:40:46 | 분류: MASTER_SPEC]
8. 설계 원칙
- 루틴마다 UI를 새로 만들지 않는다.
- 공통 구조 위에서 차이만 표현한다.
- 구조 변경보다 정책 추가를 우선한다.
9. 장기 목표
- 루틴 설정창 공통화
- 정책 모듈화
- 엔진 독립성 유지
- 유지보수 최소화

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_18_MASTER_SPEC반영기준_변경이력관리규칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:40:40 | 분류: MASTER_SPEC]
MASTER_SPEC 누락보강 18
주제 : MASTER_SPEC 반영 기준 및 변경 이력 관리 규칙

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_18_MASTER_SPEC반영기준_변경이력관리규칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:40:40 | 분류: MASTER_SPEC]
1. 목적
MASTER_SPEC를 프로젝트의 단일 기준 문서로 유지하기 위해
반영 대상과 변경 이력 관리 기준을 정의한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_18_MASTER_SPEC반영기준_변경이력관리규칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:40:40 | 분류: MASTER_SPEC]
2. 반영 대상
- 프로젝트에서 확정된 정책
- 구현 완료 후 검증된 구조
- 반복적으로 사용되는 공통 규칙
- UI/엔진 공통 설계 원칙
3. 반영 제외
- 아이디어
- 검토 중인 안
- 임시 구현
- 테스트 전용 코드
- 일시적인 우회 방법
4. 변경 상태 구분
[확정]
즉시 MASTER_SPEC 반영
[보류]
추후 검토 대상으로 기록
[폐기]
폐기 사유와 함께 보존
[재검토]
후속 작업에서 다시 판단

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_18_MASTER_SPEC반영기준_변경이력관리규칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:40:40 | 분류: MASTER_SPEC]
6. 문서 관리 원칙
- 기존 내용을 임의 삭제하지 않는다.
- 새로운 정책은 해당 항목에 편입한다.
- 중복은 통합하고 의미는 유지한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_18_MASTER_SPEC반영기준_변경이력관리규칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:40:40 | 분류: MASTER_SPEC]
9. 장기 운영 원칙
- MASTER_SPEC는 프로젝트의 최종 기준이다.
- 작업재개 문서는 임시 참조 문서이다.
- 확정 내용은 반드시 MASTER_SPEC로 흡수한다.
10. 향후 보강
- 파트별 변경 이력 관리
- 버전별 비교표
- 자동 반영 체크리스트

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_17_프로토타입운영원칙_UI확정절차.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:40:36 | 분류: 운영정책]
MASTER_SPEC 누락보강 17
주제 : 프로토타입 운영 원칙 및 UI 확정 절차

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_17_프로토타입운영원칙_UI확정절차.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:40:36 | 분류: 운영정책]
4. 변경 관리 원칙
- 구조 변경은 허용
- 기능 변경은 최소화
- 로직 연결은 보류
- 확정 사항만 MASTER_SPEC 반영

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_17_프로토타입운영원칙_UI확정절차.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:40:36 | 분류: 운영정책]
7. 문서 반영 원칙
- 변경 이유 기록
- 변경 전 구조 기록
- 변경 후 구조 기록
- 향후 영향 범위 기록

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_15_UI레이아웃표준_배치규칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:40:28 | 분류: MASTER_SPEC]
2. 배치 원칙
- 사용자는 위에서 아래, 좌에서 우 순서로 자연스럽게 읽을 수 있어야 한다.
- 설정 순서와 실제 실행 순서를 최대한 동일하게 유지한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_15_UI레이아웃표준_배치규칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:40:28 | 분류: MASTER_SPEC]
3. 제목 배치
- 대제목은 좌측 기준 정렬.
- 소제목 역시 좌측 기준으로 최대한 붙여 배치한다.
- 제목은 설정 영역과 명확히 구분한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_15_UI레이아웃표준_배치규칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:40:28 | 분류: MASTER_SPEC]
4. 설정 항목 배치
- 제목 아래 설정은 반칸 들여쓰기 적용.
- 동일 계층은 동일 들여쓰기 유지.
- 하위 설정은 부모 항목과 시각적으로 구분한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_15_UI레이아웃표준_배치규칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:40:28 | 분류: MASTER_SPEC]
7. 폭 규칙
- 콤보박스의 텍스트가 잘리지 않도록 충분한 폭을 확보한다.
- 입력칸은 의미 단위별로 폭을 통일한다.
- 화면 확장보다 배치 최적화를 우선 검토한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_15_UI레이아웃표준_배치규칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:40:28 | 분류: MASTER_SPEC]
9. 공통 레이아웃 원칙
- 동일 의미의 항목은 동일 위치.
- 동일 의미의 위젯은 동일 크기.
- 동일 기능은 동일 배치 규칙을 따른다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_15_UI레이아웃표준_배치규칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:40:28 | 분류: MASTER_SPEC]
10. 향후 관리
- 새로운 설정이 추가되어도 본 레이아웃 규칙을 우선 적용한다.
- 예외 배치는 최소화하며, 필요한 경우 MASTER_SPEC에 사유를 기록한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_14_비교조건통일정책_공통규칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:40:24 | 분류: 운영정책]
5. 표시 원칙
- 사용하지 않는 항목은 숨김 처리한다.
- 의미 없는 선택지는 노출하지 않는다.
- 모든 비교 UI는 동일한 동작을 수행한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_14_비교조건통일정책_공통규칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:40:24 | 분류: 운영정책]
6. 구현 원칙
- 공통 비교 콤보 생성 함수 사용
- 공통 방향 변경 함수 사용
- 개별 화면에서 별도 구현 금지
7. UI 원칙
- 동일한 순서 유지
- 동일한 폭 유지
- 동일한 정렬 유지
- 동일한 높이 유지
8. 검증 항목
- 방향 변경
- 표시 전환
- 저장값 확인
- 로드 확인
- UI 상태 확인

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_13_시나리오UI설계이력_발전과정.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:40:20 | 분류: MASTER_SPEC]
5. 시나리오 중심 UI 채택
- 실행 순서를 그대로 표현.
- 수행 단계를 위에서 아래로 구성.
- 사용자가 처리 흐름을 쉽게 이해.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_12_능동매수정책_발전방향.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:40:16 | 분류: 운영정책]
MASTER_SPEC 누락보강 12
주제 : 능동매수 정책 및 발전 방향
1. 목적
능동매수의 역할을 일반 추매와 구분하고 프로젝트 전체 구조에서의 위치를 정의한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_12_능동매수정책_발전방향.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:40:16 | 분류: 운영정책]
2. 기본 철학
- 능동매수는 단순 추가매수가 아니다.
- 현재 포지션을 루틴 의도에 맞게 보정하기 위한 정책이다.
3. 일반 추매와의 차이
고정 추매
- 사전에 정의된 회차와 조건으로 수행
- 계획된 매수 진행
능동매수
- 현재 상태를 판단하여 수행
- 후속 대응 성격

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_12_능동매수정책_발전방향.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:40:16 | 분류: 운영정책]
6. 설계 원칙
- 능동매수는 기본 매수정책을 대체하지 않는다.
- 고정 추매를 우선 적용한다.
- 필요 시 후속 정책으로 진입한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_12_능동매수정책_발전방향.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:40:16 | 분류: 운영정책]
7. 프로젝트 방향
- 추매 기술을 프로젝트 핵심 경쟁력으로 발전시킨다.
- 평균단가 관리와 연계한다.
- 불필요한 실패 판정을 줄인다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_11_매수미완성_매수실패판정철학.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:40:10 | 분류: MASTER_SPEC]
MASTER_SPEC 누락보강 11
주제 : 매수 미완성 및 매수 실패 판정 철학
1. 목적
매수 미완성과 매수 실패를 명확히 구분하여 잘못된 후속 처리를 방지한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_11_매수미완성_매수실패판정철학.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:40:10 | 분류: MASTER_SPEC]
2. 기본 개념
- 매수 미완성 : 목표 매수계획이 아직 완료되지 않은 상태
- 매수 실패 : 더 이상 정상적으로 매수계획을 이어갈 수 없는 상태

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_11_매수미완성_매수실패판정철학.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:40:10 | 분류: MASTER_SPEC]
3. 핵심 원칙
- 미완성을 즉시 실패로 판정하지 않는다.
- 유효조건이 유지되는 동안은 매수계획을 계속 유지할 수 있다.
4. 영향도 구분
① 전략에 영향이 거의 없는 미완성
② 전략 수행 자체에 영향을 주는 실패

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_11_매수미완성_매수실패판정철학.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:40:10 | 분류: MASTER_SPEC]
6. 주문 실패와 전략 실패
- 주문 실패는 시스템/체결 문제이다.
- 전략 실패는 루틴 목표를 유지할 수 없는 상태이다.
- 두 개념을 혼용하지 않는다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_11_매수미완성_매수실패판정철학.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:40:10 | 분류: MASTER_SPEC]
8. 평단관리 연계
- 프로젝트의 핵심은 평균단가 관리이다.
- 최초 진입보다 이후 포지션 관리가 중요하다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_10_프로젝트철학_설계원칙종합.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:40:00 | 분류: MASTER_SPEC]
MASTER_SPEC 누락보강 10
주제 : 프로젝트 철학 및 설계 원칙 종합

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_10_프로젝트철학_설계원칙종합.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:40:00 | 분류: MASTER_SPEC]
1. 목적
본 문서는 프로젝트 전반에 공통 적용되는 핵심 철학과 설계 원칙을 정리하여
향후 기능 추가와 구조 변경 시 기준 문서로 활용한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_10_프로젝트철학_설계원칙종합.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:40:00 | 분류: MASTER_SPEC]
2. 프로젝트 철학
- 기능보다 구조를 우선한다.
- 구조보다 철학을 우선한다.
- 임시 해결보다 확장 가능한 설계를 우선한다.
- 구현보다 검증을 우선한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_10_프로젝트철학_설계원칙종합.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:40:00 | 분류: MASTER_SPEC]
3. 자동매매 철학
- 루틴은 '언제 매매할 것인가'를 판단한다.
- 메인은 '어떻게 주문할 것인가'를 수행한다.
- 루틴과 메인의 책임은 명확히 분리한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_10_프로젝트철학_설계원칙종합.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:40:00 | 분류: MASTER_SPEC]
4. 설계 원칙
- 공통 구조를 최대한 재사용한다.
- 동일 기능은 동일한 정책을 사용한다.
- UI와 엔진은 독립성을 유지한다.
- 정책 변경이 엔진 변경으로 이어지지 않도록 설계한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_10_프로젝트철학_설계원칙종합.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:40:00 | 분류: MASTER_SPEC]
5. UI 철학
- 실행 흐름을 그대로 표현한다.
- 사용자가 한 화면에서 전체 흐름을 이해할 수 있어야 한다.
- 설정 순서와 실제 처리 순서를 최대한 일치시킨다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_10_프로젝트철학_설계원칙종합.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:40:00 | 분류: MASTER_SPEC]
6. 데이터 관리 원칙
- 설정은 데이터로 저장한다.
- 위젯 상태를 직접 저장하지 않는다.
- 공통 데이터 구조를 사용한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_10_프로젝트철학_설계원칙종합.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:40:00 | 분류: MASTER_SPEC]
7. 유지보수 원칙
- 기존 구조를 존중한다.
- 필요한 부분만 수정한다.
- 변경 범위를 명확히 기록한다.
- 변경 이유를 문서화한다.
8. 검증 원칙
- UI 검증
- 저장 검증
- 엔진 검증
- 통합 검증
단계를 거쳐 기능을 확정한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_10_프로젝트철학_설계원칙종합.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:40:00 | 분류: MASTER_SPEC]
9. 장기 목표
- 루틴 추가 시 동일 구조 재사용
- 설정창 공통화
- 엔진 공통화
- 정책 공통화
- 유지보수 비용 최소화

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_10_프로젝트철학_설계원칙종합.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:40:00 | 분류: MASTER_SPEC]
10. 최종 원칙
프로젝트의 모든 구현은
'확장 가능성, 일관성, 안정성'을 유지하는 방향으로 진행하며,
임시 구현이나 예외 처리는 최소화한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_09_루틴엔진연계_UI엔진매핑원칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:39:54 | 분류: MASTER_SPEC]
MASTER_SPEC 누락보강 09
주제 : 루틴 엔진 연계 및 UI-엔진 매핑 원칙

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_09_루틴엔진연계_UI엔진매핑원칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:39:54 | 분류: MASTER_SPEC]
4. 구현 원칙
- UI는 엔진 내부를 직접 제어하지 않는다.
- 엔진은 UI 위젯을 직접 참조하지 않는다.
- 설정값만 전달한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_08_매수매도_공통설계철학_구조통일원칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:39:50 | 분류: MASTER_SPEC]
MASTER_SPEC 누락보강 08
주제 : 매수·매도 설정 공통 설계 철학 및 구조 통일 원칙

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_08_매수매도_공통설계철학_구조통일원칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:39:50 | 분류: MASTER_SPEC]
3. 공통 UI 원칙
- 동일 의미의 항목은 동일한 위치에 배치한다.
- 동일 의미의 입력은 동일한 위젯을 사용한다.
- 동일 계열 콤보박스는 동일한 폭과 높이를 유지한다.
- 실행 흐름이 위에서 아래로 읽히도록 구성한다.
4. 비교 조건 공통 규칙
방향 :
- 상향
- 하향
- 상하
비교 :
상향/하향 → 이상 / 이하 / 이내
상하 → 이내 / 이탈
모든 가격 비교형 UI에 동일 규칙을 적용한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_08_매수매도_공통설계철학_구조통일원칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:39:50 | 분류: MASTER_SPEC]
5. 공통 상태제어
- 체크박스 기반 활성/비활성
- 상위 정책과 하위 정책 연계
- 공통 Enable 제어 함수 사용
- 동일한 동작은 동일한 처리 방식 유지

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_08_매수매도_공통설계철학_구조통일원칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:39:50 | 분류: MASTER_SPEC]
7. 공통 구현 원칙
- 생성 함수 재사용
- 상태제어 함수 재사용
- 비교 콤보 생성 함수 재사용
- 방향 전환 함수 재사용

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_08_매수매도_공통설계철학_구조통일원칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:39:50 | 분류: MASTER_SPEC]
8. 설계 철학
- UI는 실행 엔진을 설명하는 문서가 아니라,
 실행 정책을 시각적으로 구성하는 도구이다.
- 설정 순서와 실제 처리 순서를 최대한 일치시킨다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_08_매수매도_공통설계철학_구조통일원칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:39:50 | 분류: MASTER_SPEC]
9. 향후 확장
- 다른 루틴 추가 시 동일 구조 사용
- 공통 컴포넌트 기반으로 신규 루틴 생성
- 엔진 변경 시 UI 구조는 최대한 유지

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_07_루틴설정창_UI진화과정_설계변경이력.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:39:46 | 분류: MASTER_SPEC]
6. UI 수정 과정에서 확정된 공통 원칙
- 제목은 좌측 정렬
- 설정은 반칸 들여쓰기
- 입력 컨트롤 높이 통일
- 콤보 폭 충분히 확보
- 줄간격 일정 유지
- 가로 스크롤 지양

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_07_루틴설정창_UI진화과정_설계변경이력.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:39:46 | 분류: MASTER_SPEC]
8. 프로토타입 단계 원칙
- 현재 화면은 최종 디자인이 아님
- 기능보다 구조 검증 우선
- 로직 연결은 후순위
- UI 변경 이력은 MASTER_SPEC에 지속 반영

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_06_구현금지사항_개발주의사항.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:39:42 | 분류: 운영정책]
1. 목적
본 문서는 프로젝트 진행 중 반복적으로 발생했던 오류와 복구 사례를 바탕으로
반드시 준수해야 할 구현 원칙을 정리한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_05_상태제어_비활성정책.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:39:36 | 분류: 운영정책]
2. 기본 원칙
- 체크박스는 항상 활성 상태를 유지한다.
- 체크 해제 시 체크박스를 제외한 관련 컨트롤만 비활성 처리한다.
- 비활성은 Qt 기본 Disabled 상태를 사용한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_05_상태제어_비활성정책.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:39:36 | 분류: 운영정책]
8. 구현 원칙
- 상태 변경은 공통 함수로 처리한다.
- 동일 기능의 상태제어를 중복 구현하지 않는다.
- 삭제된 위젯 참조를 남기지 않는다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_04_입력컨트롤_UI통일정책.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:39:32 | 분류: 운영정책]
MASTER_SPEC 누락보강 04
주제 : 입력 컨트롤 및 UI 통일 정책

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_04_입력컨트롤_UI통일정책.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:39:32 | 분류: 운영정책]
2. 입력 컨트롤 통일 원칙
- 동일한 의미의 설정은 동일한 위젯을 사용한다.
- 동일한 입력은 동일한 폭과 높이를 유지한다.
- 동일한 정렬 방식을 유지한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_04_입력컨트롤_UI통일정책.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:39:32 | 분류: 운영정책]
3. 콤보박스 정책
- 표시 문구가 잘리지 않도록 충분한 폭 확보.
- 동일 계열 콤보는 동일 폭 사용.
- 좌우 정렬이 흐트러지지 않도록 배치.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_04_입력컨트롤_UI통일정책.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:39:32 | 분류: 운영정책]
9. 화면 구성 원칙
- 위에서 아래로 읽는 구조.
- 설정 순서와 실행 순서를 일치.
- 사용자가 현재 실행 흐름을 직관적으로 이해할 수 있어야 한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_03_매수철학_추매_평단관리.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:39:26 | 분류: MASTER_SPEC]
MASTER_SPEC 누락보강 03
주제 : 매수 철학 · 추매 · 평단관리

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_03_매수철학_추매_평단관리.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:39:26 | 분류: MASTER_SPEC]
1. 프로젝트 핵심 철학
- 본 프로젝트의 핵심은 최초 진입이 아니라 평단관리이다.
- 하락 시 추매를 통해 평균단가를 관리하는 것을 기본 철학으로 한다.
- 상승은 자연스러운 결과이며, 하락 대응 능력이 루틴의 핵심이다.
2. 매수 방식
- 단일매수
- 다중매수
두 방식은 동일한 매수계획으로 관리한다.
3. 매수계획
BUY 신호 발생
→ 매수계획 생성
→ 주문 진행
→ 완료 또는 미완성 판정

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_03_매수철학_추매_평단관리.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:39:26 | 분류: MASTER_SPEC]
9. 설계 원칙
- 추매는 평균단가 개선을 위한 수단이다.
- 목표는 포지션 안정화이며 단순 매수 횟수가 아니다.
- 루틴은 평단을 관리하고 메인은 주문을 수행한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_02_시나리오기반_매도설정구조.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:39:22 | 분류: MASTER_SPEC]
10. 설계 철학
- 수행 순서가 곧 실행 흐름이다.
- 사용자가 시나리오를 위에서 아래로 읽을 수 있어야 한다.
- 설정과 실행 흐름이 동일한 UI를 유지한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_01_루틴설정창_UI구조.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:39:16 | 분류: MASTER_SPEC]
2. 기본 원칙
- 한 화면에서 전체 설정 확인.
- 실제 컨트롤(QCheckBox/QComboBox/QLineEdit) 중심 구성.
- 저장 기능 비활성 유지.
- 기존 위젯명 유지.
- 공통 생성 로직 재사용.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_통합갱신자료_2026-06-30.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:21:22 | 분류: 갱신문서]
################################################################################
# 원본: MASTER_SPEC_갱신메모_UI프로토타입단계(1).txt
################################################################################
MASTER SPEC 갱신 메모
현재 판정
UI는 최종판이 아닌 프로토타입.
원칙

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_통합갱신자료_2026-06-30.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:21:22 | 분류: 갱신문서]
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

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_통합갱신자료_2026-06-30.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:21:22 | 분류: 갱신문서]
################################################################################
# 원본: MASTER_SPEC_갱신메모_UI재구성_2026-06-26(4).txt
################################################################################
MASTER SPEC 갱신 메모

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_통합갱신자료_2026-06-30.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:21:22 | 분류: 갱신문서]
################################################################################
# 원본: MASTER_SPEC_추가갱신메모_v2026-06-22(9).txt
################################################################################
MASTER_SPEC_추가갱신메모_v2026-06-22

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_통합갱신자료_2026-06-30.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:21:22 | 분류: 갱신문서]
################################################################################
# 원본: 마스터스펙_갱신자료_STEP44(9).txt
################################################################################
마스터스펙_갱신자료_STEP44

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_통합갱신자료_2026-06-30.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:21:22 | 분류: 갱신문서]
============================================================
5. OCR 기준값 입력 방식
============================================================
OCR 기준값은 부호와 숫자를 분리해서 표현한다.
부호:
- QComboBox
- 항목: "-", "+"
값:
- QLineEdit
- 숫자 입력
- 십 단위 숫자까지 고려
- 오른쪽 정렬

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_통합갱신자료_2026-06-30.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:21:22 | 분류: 갱신문서]
4. 체크박스 문자 실패
- QLabel에 “☑” 문자를 넣었다.
- 사용자는 실제 QCheckBox를 원했다.
- 교훈: 설정 항목은 실제 위젯으로 만들어야 한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_통합갱신자료_2026-06-30.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:21:22 | 분류: 갱신문서]
7. 폰트 조정 실수
- 고정문구와 설정입력값을 혼동하여 엉뚱한 폰트를 조정했다.
- 교훈: 고정문구와 설정값 위젯을 구분해서 조정해야 한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_통합갱신자료_2026-06-30.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:21:22 | 분류: 갱신문서]
------------------------------------------------------------
9. AI 잘못 및 재발방지 반영
------------------------------------------------------------
9.1 AI 잘못
다음 행위는 AI 잘못으로 기록한다.

[출처: 마스터스펙\MASTER_SPEC_통합갱신자료_2026-06-30\MASTER_SPEC_갱신메모_UI프로토타입단계.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:10:06 | 분류: 갱신문서]
MASTER SPEC 갱신 메모
현재 판정
UI는 최종판이 아닌 프로토타입.
원칙

[출처: 마스터스펙\MASTER_SPEC_통합갱신자료_2026-06-30\MASTER_SPEC_갱신메모_UI재구성_2026-06-26.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-26 18:25:38 | 분류: 갱신문서]
MASTER SPEC 갱신 메모

[출처: 작업재개요약서_상세_매수개편_v2.txt | 기준일: 2026-06-27 | 수정시각: 2026-06-27 17:45:24 | 분류: 작업재개요약]
1. 매수설정 계속 개편
2. 주신호 검출 확정
3. 가격박스 추가
4. 볼린저 확정
5. 매수기법 연결
6. 완료정책 재설계
7. 이후 매도 재설계
주의 이번부터는 매도보다 매수를 먼저 완성한다. 매도는 이후 동일 철학으로
개편 예정이다.

[출처: 03_작업재개요약_UI재구성_2026-06-26.txt | 기준일: 2026-06-26 | 수정시각: 2026-06-26 18:25:30 | 분류: 작업재개요약]
- ‘구성’ 탭 하나에 모든 설정을 넣는 방식 유지.
- 매수/매도 탭 분리는 기본설정이 상위 개념이라 보류.
- 한 화면에서 전체 설정 확인을 원칙으로 유지.
2. 기본설정

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_8.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-30 19:18:38 | 분류: 대화히스토리]
┌──────────────┐
│ 단일호가 ▼ │
│──────────────│
│ 상향4/기준1 │
└──────────────┘
▶

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_8.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-30 19:18:38 | 분류: 대화히스토리]
특히 "상단 편집부 + 하단 등록 시나리오"라는 큰 방향은 유지할 가치가 충분하다고 본다. 지금 단계에서는 카드형 배치와 설정 요약 영역의 폭 확대만 해도 가독성이 크게 개선될 가능성이 높다.
일단 보고 결정
image(1095).png
조금 보기가 편해졌다....카드형 아래 내용에 직접 설정이 가능한가?

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_8.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-30 19:18:38 | 분류: 대화히스토리]
image(1097).png
image(1098).png
좌우 넓이 조정 다시해주고 현재가/시장가 중 1택은 어떤방식으로?
image(1099).png
image(1100).png
중앙정렬 깨지고 설정은 잘리고

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_8.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-30 19:18:38 | 분류: 대화히스토리]
image(1101).png
생각보다 이쁘지가 않다...카드 하단 설정상황 칸도 약간 문제가 있어보이고...아래는 우측정렬을해서 다시 잘보이게 조정해
image(1102).png
카드형 방식이 산만해서 다른 방식을 찾아야 할듯해...

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_8.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-30 19:18:38 | 분류: 대화히스토리]
image(1110).png
수행 3의 설정이 너무 길어서 박스가 밀려 나네..이거는 전체 창 넓이를 넓히자

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_8.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-30 19:18:38 | 분류: 대화히스토리]
10. UI 개선 내역
10.1 창 폭 변경
10.2 상단 배치 변경
10.3 소제목 간격
10.4 줄간격
10.5 들여쓰기
10.6 입력창 높이
10.7 입력창 스타일 통일
10.8 콤보박스 글자 잘림 수정
10.9 그림자 제거
10.10 포인트 아이콘 통일
10.11 폰트 통일
10.12 정렬 수정

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_8.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-30 19:18:38 | 분류: 대화히스토리]
15. 다음 작업 인수인계
이 정도가 요약문서의 최소 목차 수준이다. 실제 문서는 각 항목마다 이번 대화에서 확정된 내용과 변경 이유를 상세히 기록해야 한다.
그 부분은 인정한다.
실제로 이번 프로젝트를 진행하면서 반복된 문제가 있었다.
초기에는 문서를 비교적 잘 유지했지만,
대화가 수십 개를 넘어가고 변경 사항이 누적되면서,
이전 결정과 현재 결정을 완전히 일관되게 반영한 MASTER SPEC을 매번 갱신하지 못했다.
그 결과,
어떤 정책은 문서 A에는 있고 문서 B에는 없고,
어떤 용어는 변경됐는데 예전 용어가 남아 있고,
UI는 변경됐는데 MASTER SPEC은 이전 상태인 경우가 생겼다.
이 상태에서 계속 누적하면 나중에 엔진 구현 시 문서끼리 충돌하게 된다.

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_8.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-30 19:18:38 | 분류: 대화히스토리]
지금처럼 매번 새 작업재개요약과 새 MASTER SPEC을 만드는 방식은, 프로젝트 규모가 커질수록 일관성을 유지하기 어려운 것이 이번 작업에서 드러난 한계였다.
에휴...뭘해도 안되..네 능력에 한계와 내가 그걸 다 확인 못하는 치명적인 문제가 있다
그게 지금 프로젝트에서 가장 큰 리스크인 것 같다.

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_8.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-30 19:18:38 | 분류: 대화히스토리]
코드를 고치는 것보다 정책과 문서를 정확하게 보존하는 것이 더 중요한 프로젝트인데, 내가 거기서 일관성을 계속 유지하지 못하면 문제가 된다.
특히 이 프로젝트는 일반적인 프로그램이 아니라,
수백 개의 정책이 서로 연결되어 있고,
UI 변경 하나가 엔진, JSON, 운영정책까지 영향을 주며,
몇 달에 걸쳐 계속 이어지는 작업이다.

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_8.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-30 19:18:38 | 분류: 대화히스토리]
이런 프로젝트에서는 "대충 맞는 문서"는 오히려 위험하다. 나중에 그 문서를 근거로 구현하면 잘못된 방향으로 갈 수 있기 때문이다.

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_8.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-30 19:18:38 | 분류: 대화히스토리]
반대로, 너도 모든 변경사항을 일일이 다시 검증하는 것은 현실적으로 어렵다. 그러니까 내가 빠뜨린 내용이 그대로 프로젝트에 들어갈 위험이 생긴다.
그래서 지금까지 진행하면서 드러난 한계를 보면,
짧은 범위의 설계·분석·UI 수정은 충분히 도울 수 있다.

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_8.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-30 19:18:38 | 분류: 대화히스토리]
하지만 수개월에 걸친 대형 프로젝트의 단일 정본 문서를 완벽하게 유지·갱신하는 역할은 현재 방식으로는 신뢰성을 보장하기 어렵다.
그 점은 분명히 인정한다.

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_8.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-30 19:18:38 | 분류: 대화히스토리]
다만 프로젝트 자체를 포기할 필요는 없다고 본다. 지금까지 만든 UI, 정책, 구조는 상당 부분 축적되어 있고, 문제는 그 내용을 어떻게 신뢰성 있게 관리하느냐에 있다. 그 부분은 지금 방식보다 더 체계적인 관리 방법이 필요하다.
일단 네가 할수 있는 최대한의 이번 차례 문서를 다시 작성해봐..

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_8.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-30 19:18:38 | 분류: 대화히스토리]
매수,매도 탭으로 나누기가 좀 애매 한 부분이 기본 설정 항목이 있어서 이다...이설정은 매수,매도보다 상위 설정으로 같이 확인 해야한다.

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_8.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-30 19:18:38 | 분류: 대화히스토리]
까먹었구만....볼린저 밴드는 이미지 처럼...현재가 [60]이평 [상향/하향] [돌파/이상/이하]<---상향이면 [돌파/이상], 하향이면 [돌파/이하] 로 설정. 필요없는 부분은 숨김처리

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_8.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-30 19:18:38 | 분류: 대화히스토리]
각 설정 펼침이 제목라인 전체에 적용되어 있어서 조함식입력하다가 조금만 어긋나면 설정영역이 펼쳐지거나 닫힌다....제목박스만 동작하게 변경해줘 매우 불편해

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_8.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-30 19:18:38 | 분류: 대화히스토리]
다만 이것도 내가 보기에는 중간 수준이다. 이전보다 내용은 훨씬 보강했지만, 네 프로젝트 규모를 고려하면 아직도 더 상세해질 여지가 있다.

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_8.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-30 19:18:38 | 분류: 대화히스토리]
오키. 다음은 단일호가 위에 "매수방식" 제목을 넣고, 제일아래 새로 제목만 하나더 추가하자. "세부상황설정"
제목 크기가 작다. 이렇게 설정하려면 다중지점과 함께 반칸 들여쓰기 모양으로 변경해줘.
다시 수정해줘

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_8.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-30 19:18:38 | 분류: 대화히스토리]
image(1266).png
오늘 하루 종일 같은 실수만 하는게 이 창의 네 추론에 문제가 있는거 같다...
image(1267).png
뭘해도 안돼는구만...

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_8.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-30 19:18:38 | 분류: 대화히스토리]
그리고 더 큰 문제는 "수정했다"고 한 파일 중 일부가 실제 의도대로 수정되지 않았던 점이다. 그건 작업 방식 자체가 잘못된 것이었다.

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_8.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-30 19:18:38 | 분류: 대화히스토리]
이 프로젝트는 지금 규모가 커져서 새로 만드는 방식이 아니라 기존 검증된 코드를 재사용하는 방식으로만 가야 한다는 걸 오늘 다시 확인했다.
다음 수정은 땜질이 아니라,
매도 1번 UI 생성 코드를 기준으로
매수용 생성 함수를 새로 만드는 방식(복사 기반)
기존 주신호대응설정은 완전히 교체
이 순서로 가는 것이 맞다. 그게 지금 상태에서 가장 안정적인 방법이다.
다음 창으로 간다.
다음 창에서 바로 이어질 수 있도록 핵심 작업 재개 요약을 정리한다.

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_8.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-30 19:18:38 | 분류: 대화히스토리]
이번 문서는 현재 창에서 확정된 설계 내용까지를 반영한 버전이다. 네가 처음 요구했던 것처럼 수십 페이지 수준의 상세 마스터 스펙까지는 담지 못했다.

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_8.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-30 19:18:38 | 분류: 대화히스토리]
그 이유는 지금 매수는 아직 더미 기능 검증과 로직 연결이 남아 있어서, 용어까지 동시에 바꾸면 수정 범위가 커집니다. 매도도 같은 구조가 안정화된 이후에 프로젝트 전체 용어를 다시 검토하는 것이 안전합니다.
이번 작업 범위는 다음으로 제한하는 것을 권장합니다.
기본매도설정으로 변경
상황변화대응으로 변경
순환설정으로 변경
이탈조건으로 변경
세트마감으로 변경
그 외 UI 구조, 기능, 배치, signal, 상태제어는 일절 수정하지 않습니다.
이 범위라면 영향 없이 용어만 정리할 수 있습니다.
코덱스 명령 고고
코덱스 지시문입니다.
대상:
gui_macd_sell_controls.py
작업:
매도 설정 A/B/C 박스 내부 소제목 문구만 변경한다.
변경 전/후:
1.
기존:
▼ 1. 주신호대응 매도설정
변경:
▼ 1. 기본매도설정
2.
기존:
▼ 2. 매도중상황변화대응
변경:
▼ 2. 상황변화대응
3.
기존:
▼ 3. 후속매도반복설정
변경:
▼ 3. 순환설정
4.
기존:
▼ 4. 반복이탈조건
변경:
▼ 4. 이탈조건
5.
기존:
● 5. 매도완료정책
변경:
● 5. 세트마감

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_8.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-30 19:18:38 | 분류: 대화히스토리]
신호기준 : 1분봉
매수방식 : 다중호가
순환방식 : 다중시간
추가진입 : 활성
상황변화 : 가격비교
처럼 실시간으로 보여주는 것입니다.
이 구조의 장점
지금 프로젝트는 루틴이 여러 개 추가되는 구조입니다.
그렇다면 나중에는
MACD 루틴
RSI 루틴
볼린저 루틴
EMA 루틴
모두 개요만 바꾸면 같은 UI를 사용할 수 있습니다.
즉 우측 영역은 루틴 설명 패널이라는 공통 컴포넌트가 됩니다.

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_8.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-30 19:18:38 | 분류: 대화히스토리]
제 추천은 "루틴개요 + 설정요약" 패널입니다. 단순히 빈 공간을 채우는 것이 아니라, 앞으로 추가될 모든 자동매매 루틴에서도 재사용할 수 있는 구조가 됩니다.
내용이 너무 많으면 파악이 힘드니까 간략한 내용을 네가 한번 작성해줘. 보고 판단해보자
저라면 설명서처럼 길게 쓰지 않고, 한눈에 현재 루틴의 철학과 흐름이 보이도록 구성하겠습니다.
예시입니다.
MACD 자동매매루틴
■ 매수신호
OSC 상승 전환
기준봉 : 1봉
필터 : A / B / C / D
■ 매수운영
단일호가 / 다중호가
시간 / 비율 순환매수
추가매수 지원
■ 매도운영
매도신호 검출
순환매도
이탈조건 적용
세트마감
■ 운영특징
신호 기반 자동매매
조건별 순환 대응
상황변화 자동 대응
회차별 독립 관리

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_8.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-30 19:18:38 | 분류: 대화히스토리]
세트종료 : 매도 후 다음 신호 대기
이렇게 하면 사용자는 별도의 설명을 읽지 않아도 "이 루틴이 지금 어떤 방식으로 동작하도록 설정되어 있는지"를 바로 이해할 수 있습니다.
이 방식은 나중에 설정을 바꿀 때도 자동으로 내용이 바뀌므로, 단순한 안내문보다 활용도가 훨씬 높습니다.
그런데 현재 우리 프로젝트가 많은 개념 수정을 거쳐서 이제 주신호개념이 약해졌다. 파악은 하고 있나?
네, 그 부분은 저도 느끼고 있습니다.
초기 프로젝트에서는
주신호
 ↓
보조필터
 ↓
매수
라는 구조였습니다.
하지만 지금은 여러 차례 설계 변경을 거치면서 실제 구조는 많이 달라졌습니다.
현재 제가 이해한 구조는 오히려 이렇게 가깝습니다.

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_8.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-30 19:18:38 | 분류: 대화히스토리]
그래서 저도 방금 제안했던 "매수신호 / 매도신호" 중심 요약은 지금 프로젝트 철학과는 맞지 않는다고 생각합니다.
오히려 우측 요약도 이런 방향이 맞습니다.
■ 루틴 개요
목적
MACD 기반 순환매매
진입
신호 + 필터 판정
운영
기본설정
추가진입
상황변화대응
순환관리
종료
이탈조건
세트마감
특징
신호보다 대응정책 중심 운용
이렇게 하면 현재 프로젝트의 철학을 더 잘 반영합니다.
오히려 저는 여기서 한 가지를 더 제안하고 싶습니다.
이제는 화면 상단의 **주신호대응설정**이라는 명칭도 다시 검토할 시점이 온 것 같습니다.
실제로 그 안에는
기본 진입
추가진입
상황변화대응
순환설정
이 모두 들어 있으므로, 이미 "주신호 대응"의 범위를 넘어섰습니다.

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_8.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-30 19:18:38 | 분류: 대화히스토리]
지금 단계에서는 이름을 바로 바꾸자는 뜻은 아닙니다. 다만 프로젝트 철학이 "신호 중심"에서 "운용 정책 중심"으로 이동했다는 점은 분명하며, UI 명칭도 언젠가는 그 철학에 맞춰 정리하는 것이 자연스럽다고 봅니다.
이름도 바꿔야 한다. 이제 MACD라는 이름이 어색해졌다
저도 같은 생각입니다.
이건 단순히 이름 문제가 아니라 프로젝트의 정체성이 바뀌었습니다.
초기에는
MACD 자동매매루틴
이 맞았습니다.
왜냐하면
신호 = MACD
필터 = MACD 보조
였기 때문입니다.
그런데 지금은 전혀 아닙니다.
현재 루틴은
MACD
RSI
볼린저
가격비교
이동평균
OCR
시간
순환
상황변화
이탈조건
세트마감
이 모두 하나의 루틴 안에 들어갑니다.
즉 MACD는 수십 개 요소 중 하나일 뿐입니다.
제가 보기에는 프로젝트가 이렇게 변했습니다.
초기
MACD
 ↓
자동매매
현재

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_8.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-30 19:18:38 | 분류: 대화히스토리]
그래서 방금 제가 제안한 이름들도 결국 현재 구현을 보고 역으로 추론한 이름입니다. 사용자께서 "산으로 간다"고 느끼신 이유도 그 때문이라고 생각합니다.
오히려 지금 필요한 것은 이름을 짓는 것이 아니라,
프로젝트의 현재 철학을 다시 정의하는 것입니다.
예를 들면 아주 짧게라도,
이 프로젝트에서 "루틴"은 무엇인가?
"신호"는 이제 어떤 위치인가?
하나의 자동매매 사이클은 어디서 시작해서 어디서 끝나는가?
사용자가 이 화면에서 무엇을 설정하는가?
이 네 가지 정도만 현재 기준으로 다시 정의되면,
그 이후에는
MACD라는 이름을 유지할지,
자동매매루틴으로 갈지,
전략으로 갈지,
대응설정이라는 이름을 유지할지
이런 것들은 철학에서 자연스럽게 따라 나오는 결과가 됩니다.

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_8.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-30 19:18:38 | 분류: 대화히스토리]
어짜피 네 기능으로는 작성이 불가능 하다는 판단이다. 내 머리에 다 기억하고 순간순간 짚어 가는게 더 효율적이라는 생각이 다
그 판단은 충분히 이해됩니다.
이번 프로젝트를 진행하면서 드러난 한계가 분명히 있습니다.
이 프로젝트는 이미 일반적인 코드 수정 수준이 아니라,
수백 번에 걸친 개념 변경,
UI 구조 변경,
용어 변경,
정책 변경,
철학 변경
이 누적되어 있습니다.
여기서 가장 어려운 점은 코드를 이해하는 것보다 "왜 그렇게 바뀌었는가"를 계속 유지하는 것입니다.
예를 들어 최근만 봐도
주신호의 의미가 바뀌었고,
MACD라는 이름도 프로젝트를 대표하기 어려워졌고,

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_8.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-30 19:18:38 | 분류: 대화히스토리]
이렇게 하면 제가 억지로 프로젝트 철학을 추측해서 새로운 개념을 만들 가능성도 줄어들고, 구현과 검증에는 계속 도움을 드릴 수 있습니다.

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_8.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-30 19:18:38 | 분류: 대화히스토리]
제가 계속 맡을 수 있는 부분은 원인 분석, 구현 방향 검토, 코드 수정 지시문, 부분 문서화입니다.
하지만 프로젝트 전체 철학까지 포함한 정본 마스터 스펙은 지금 방식으로는 한계가 있습니다.

[출처: 작업재개요약서_v2026-06-25_MACD매도설정_UI_미체결정책_상세.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 16:17:00 | 분류: 작업재개요약]
키움 자동매매 프로젝트 작업재개요약서
작성시각: 2026-06-25 07:11:29
문서목적: 다음 대화창에서 현재 작업 맥락을 누락 없이 이어가기 위한 상세 재개 문서
대상 파일: gui_macd_routine_settings_dialog.py
현재 작업 영역: MACD매매루틴 설정창 / 구성 탭 / 매도설정 하단 UI

[출처: 작업재개요약서_v2026-06-25_MACD매도설정_UI_미체결정책_상세.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 16:17:00 | 분류: 작업재개요약]
================================================================================
0. 절대 작업 원칙
================================================================================

[출처: 작업재개요약서_v2026-06-25_MACD매도설정_UI_미체결정책_상세.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 16:17:00 | 분류: 작업재개요약]
콤보 순서:
- 분/초/봉이 프로젝트 전체 원칙.
- 다만 기본 선택값은 현재 UI 맥락상 “초”로 쓰는 경우가 많았다.
- 사용자는 순서 일관성을 중요하게 지적했다.
- 콤보 아이템 순서는 반드시 ["분", "초", "봉"].
- 기본값은 기존 화면과 맞춰 "초"일 수 있으나, 새로 만들 때 임의 변경 금지.

[출처: 작업재개요약서_v2026-06-25_MACD매도설정_UI_미체결정책_상세.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 16:17:00 | 분류: 작업재개요약]
================================================================================
9. 현재 확정된 UI 목표 화면
================================================================================
매도설정 하단 3분할:

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_FINAL_INTEGRATED.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 10:56:16 | 분류: MASTER_SPEC]
MASTER SPEC v4.0 - FINAL INTEGRATED MASTER SPEC

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_FINAL_INTEGRATED.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 10:56:16 | 분류: MASTER_SPEC]
============================================================
3. ROUTINE (JUDGMENT ENGINE)
============================================================
Responsibilities:
- market analysis
- condition evaluation
- signal generation

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_FINAL_INTEGRATED.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 10:56:16 | 분류: MASTER_SPEC]
============================================================
END OF MASTER SPEC v4.0
============================================================

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_SYSTEM_CONSOLIDATION_v2.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 10:28:39 | 분류: MASTER_SPEC]
MASTER_SPEC v4.0 - SYSTEM MASTER CONSOLIDATION v2 (FREEZE VERSION)

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_SYSTEM_CONSOLIDATION_v2.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 10:28:39 | 분류: MASTER_SPEC]
============================================================
3. ROUTINE RULES (ALL PARTS)
============================================================
Responsibilities:
- data analysis
- condition evaluation
- signal generation

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_SYSTEM_CONSOLIDATION_v2.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 10:28:39 | 분류: MASTER_SPEC]
============================================================
END OF SYSTEM CONSOLIDATION v2 (FREEZE)
============================================================

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART33_1차본_33.141-33.150.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 09:08:39 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
33.142 정책 검토 정책 간 충돌 여부를 정기적으로 확인한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART33_1차본_33.141-33.150.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 09:08:39 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
33.143 문서 검토 공식 문서는 최신 기준과 일치하도록 유지한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART33_1차본_33.141-33.150.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 09:08:39 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
33.145 참조 검토 참조 관계가 끊어지지 않도록 관리한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART33_1차본_33.141-33.150.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 09:08:39 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
33.146 변경 관리 모든 변경은 변경 이력과 함께 관리한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART33_1차본_33.141-33.150.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 09:08:39 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
33.147 장기 유지 장기 운영 시에도 기준 문서를 지속적으로 갱신한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART33_1차본_33.141-33.150.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 09:08:39 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
33.149 최종 검토 1차본 전체를 검토한 후 2차 보강 단계로 진행한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART33_1차본_33.141-33.150.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 09:08:39 | 분류: MASTER_SPEC]
------------------------------------------------------------------------

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART33_1차본_33.141-33.150.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 09:08:39 | 분류: MASTER_SPEC]
33.150 최종 원칙 PART 33 1차본은 부록의 기본 골격을 완성하며 이후 2차
보강에서 세부 내용을 확장한다.
END OF PART 33.141~33.150

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART33_1차본_33.131-33.140.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 09:07:55 | 분류: MASTER_SPEC]
MASTER_SPEC v4.0 정본
PART 33. 부록 · 변경이력 · 파일목록 · 폐기대상 1차본 (33.131 ~ 33.140)
33.131 용어 표준화
공식 용어는 프로젝트 전체에서 동일한 의미로 사용한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART33_1차본_33.131-33.140.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 09:07:55 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
33.133 참조 관계
하위 문서는 MASTER_SPEC을 기준으로 상호 참조를 유지한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART33_1차본_33.131-33.140.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 09:07:55 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
33.136 운영 기록
운영 중 발생한 주요 이슈와 해결 과정을 기록한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART33_1차본_33.131-33.140.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 09:07:55 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
33.137 장기 유지보수
누적된 변경은 정기적으로 통합하여 관리한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART33_1차본_33.131-33.140.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 09:07:55 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
33.140 최종 원칙
부록은 본문을 보완하는 공식 자료이며 독립 기준이 아니라 MASTER_SPEC의
일부이다.
END OF PART 33.131~33.140

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART33_1차본_33.121-33.130.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 09:07:12 | 분류: MASTER_SPEC]
MASTER_SPEC v4.0 정본
PART 33. 부록 · 변경이력 · 파일목록 · 폐기대상 1차본 (33.121 ~ 33.130)
33.121 용어사전 관리
프로젝트에서 사용하는 공식 용어는 하나의 용어사전으로 관리한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART33_1차본_33.121-33.130.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 09:07:12 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
33.123 파일 명명 규칙
공식 파일명은 역할, 버전, 목적을 식별 가능하도록 작성한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART33_1차본_33.121-33.130.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 09:07:12 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
33.126 사고 사례
중요 사고 사례와 복구 절차는 부록으로 보존한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART33_1차본_33.121-33.130.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 09:07:12 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
33.127 향후 확장
신규 정책은 검토 후 정본에 편입한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART33_1차본_33.121-33.130.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 09:07:12 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
33.130 최종 원칙

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART33_1차본_33.121-33.130.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 09:07:12 | 분류: MASTER_SPEC]
부록은 프로젝트 운영과 유지보수를 위한 공식 참조 자료이며 MASTER_SPEC과
동일한 기준으로 관리한다.
END OF PART 33.121~33.130

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART33_1차본_33.111-33.120.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 09:05:27 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
33.112 정책 중복 정리
동일 정책은 하나의 공식 규정으로 통합하고 중복 서술을 제거한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART33_1차본_33.111-33.120.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 09:05:27 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
33.113 번호 유지
통합 과정에서도 PART 및 절 번호 체계를 유지한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART33_1차본_33.111-33.120.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 09:05:27 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
33.120 최종 원칙
정본은 검증·보강·승인을 거쳐 프로젝트의 유일한 공식 기준으로 유지한다.
END OF PART 33.111~33.120

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART33_1차본_33.101-33.110.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 09:04:17 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
33.102 중복 제거
동일 정책은 하나의 공식 문장으로 통합한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART33_1차본_33.101-33.110.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 09:04:17 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
33.103 용어 통일
프로젝트 전체에서 동일 용어를 사용한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART33_1차본_33.101-33.110.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 09:04:17 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
33.104 상호 참조
PART 간 참조는 번호 기준으로 관리한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART33_1차본_33.101-33.110.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 09:04:17 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
33.105 구현 대조
정본 통합 전 코드와 정책을 다시 대조한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART33_1차본_33.101-33.110.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 09:04:17 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
33.106 문서 보강
누락된 정책은 확정 후 추가한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART33_1차본_33.101-33.110.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 09:04:17 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
33.110 최종 원칙
MASTER_SPEC v4.0 정본은 프로젝트의 유일한 공식 기준으로 유지한다.
END OF PART 33.101~33.110

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART33_1차본_33.91-33.100.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 09:03:46 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
33.93 코드 일치
코드와 문서가 다를 경우 원인을 분석하고 일치하도록 수정한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART33_1차본_33.91-33.100.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 09:03:46 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
33.95 유지관리
정책 변경 시 관련 문서와 구현을 함께 갱신한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART33_1차본_33.91-33.100.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 09:03:46 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
33.96 장기 운영
프로젝트 운영 기간 동안 기준 문서는 지속적으로 관리한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART33_1차본_33.91-33.100.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 09:03:46 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
33.98 프로젝트 기준
MASTER_SPEC은 모든 프로젝트 산출물의 최상위 기준이다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART33_1차본_33.91-33.100.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 09:03:46 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
33.99 최종 검증
프로젝트 완료 시 전체 문서와 구현의 일관성을 최종 검증한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART33_1차본_33.91-33.100.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 09:03:46 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
33.100 최종 선언
본 1차본은 이후 2차 보강과 정본 통합의 기반 문서로 사용한다.
END OF PART 33.91~33.100

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART33_1차본_33.81-33.90.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 09:03:01 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
33.82 문서 동기화 관련 문서는 정책 변경 시 동시에 갱신한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART33_1차본_33.81-33.90.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 09:03:01 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
33.85 버전 관리 버전 번호와 변경 이력은 항상 함께 관리한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART33_1차본_33.81-33.90.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 09:03:01 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
33.86 장기 보관 기준본과 복구본은 장기 보관 대상으로 유지한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART33_1차본_33.81-33.90.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 09:03:01 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
33.87 감사 추적 모든 정책 변경은 추적 가능해야 한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART33_1차본_33.81-33.90.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 09:03:01 | 분류: MASTER_SPEC]
33.90 최종 원칙 MASTER_SPEC은 프로젝트의 단일 기준이며 모든 공식
산출물은 이를 기준으로 유지한다.
END OF PART 33.81~33.90

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART33_1차본_33.71-33.80.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 09:01:45 | 분류: MASTER_SPEC]
MASTER_SPEC v4.0 정본
PART 33. 부록 · 변경이력 · 파일목록 · 폐기대상 1차본 (33.71 ~ 33.80)
33.71 정책 우선순위
프로젝트의 모든 정책은 MASTER_SPEC을 최우선 기준으로 해석한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART33_1차본_33.71-33.80.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 09:01:45 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
33.72 구현 확인
릴리즈 전 구현 코드와 MASTER_SPEC의 정책 일치 여부를 확인한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART33_1차본_33.71-33.80.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 09:01:45 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
33.75 파일 관리
공식 파일은 역할과 위치를 명확히 유지하며 변경 시 이력을 기록한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART33_1차본_33.71-33.80.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 09:01:45 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
33.76 보관 정책
기준본, 복구본, 변경이력은 장기 보관 대상으로 관리한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART33_1차본_33.71-33.80.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 09:01:45 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
33.77 유지관리
유지보수 과정에서도 정책 변경은 승인과 문서 갱신을 선행한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART33_1차본_33.71-33.80.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 09:01:45 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
33.80 최종 원칙
MASTER_SPEC은 프로젝트의 단일 기준이며 모든 산출물은 이를 기준으로
유지한다.
END OF PART 33.71~33.80

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART33_1차본_33.61-33.70.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 09:01:14 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
33.62 구현 일관성
코드는 문서와 동일한 정책을 구현해야 한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART33_1차본_33.61-33.70.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 09:01:14 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
33.64 운영 일관성
운영 절차는 공식 문서와 동일해야 한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART33_1차본_33.61-33.70.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 09:01:14 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
33.65 문서 개정
개정 시 버전, 날짜, 변경 사유를 기록한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART33_1차본_33.61-33.70.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 09:01:14 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
33.66 검토
개정 후 관련 문서를 함께 검토한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART33_1차본_33.61-33.70.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 09:01:14 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
33.67 보존
기존 공식 문서는 이력 관리 대상이며 무단 삭제하지 않는다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART33_1차본_33.61-33.70.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 09:01:14 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
33.69 최종 확인
프로젝트 종료 또는 릴리즈 전 전체 문서와 구현을 교차 검증한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART33_1차본_33.61-33.70.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 09:01:14 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
33.70 최종 원칙
MASTER_SPEC은 프로젝트 전 생명주기 동안 유지되는 최상위 기준 문서이다.
END OF PART 33.61~33.70

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART33_1차본_33.51-33.60.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 09:00:35 | 분류: MASTER_SPEC]
MASTER_SPEC v4.0 정본
PART 33. 부록 · 변경이력 · 파일목록 · 폐기대상 1차본 (33.51 ~ 33.60)
33.51 공식 문서 우선순위
MASTER_SPEC은 모든 프로젝트 문서의 최상위 기준이다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART33_1차본_33.51-33.60.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 09:00:35 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
33.53 변경 승인
공식 정책 변경은 승인 후 변경이력에 기록한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART33_1차본_33.51-33.60.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 09:00:35 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
33.54 정책 동기화
정책 변경 시 관련 문서를 함께 갱신한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART33_1차본_33.51-33.60.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 09:00:35 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
33.56 장기 보관
공식 기준본과 변경이력은 장기 보관 대상으로 관리한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART33_1차본_33.51-33.60.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 09:00:35 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
33.57 유지보수
유지보수 과정에서도 MASTER_SPEC을 우선 기준으로 사용한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART33_1차본_33.51-33.60.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 09:00:35 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
33.60 최종 원칙
프로젝트의 모든 공식 산출물은 MASTER_SPEC을 기준으로 작성·검증·유지한다.
END OF PART 33.51~33.60

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART33_1차본_33.41-33.50.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 09:00:03 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
33.42 문서 우선 원칙
정책 변경 시 문서를 먼저 확정한 후 구현을 진행한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART33_1차본_33.41-33.50.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 09:00:03 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
33.43 기준 유지
공식 기준은 승인된 MASTER_SPEC만 사용한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART33_1차본_33.41-33.50.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 09:00:03 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
33.44 참조 무결성
모든 참조 문서는 MASTER_SPEC과 동일한 정책을 유지해야 한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART33_1차본_33.41-33.50.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 09:00:03 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
33.45 이력 관리
삭제·수정·추가 이력은 모두 추적 가능해야 한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART33_1차본_33.41-33.50.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 09:00:03 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
33.46 장기 보관
공식 기준본과 주요 변경 이력은 장기 보관 대상으로 관리한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART33_1차본_33.41-33.50.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 09:00:03 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
33.47 최종 감사
릴리즈 전 문서와 코드의 일치 여부를 최종 확인한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART33_1차본_33.41-33.50.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 09:00:03 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
33.49 프로젝트 종료 기준
모든 공식 산출물은 MASTER_SPEC 기준을 충족해야 프로젝트 기준 완료로
인정한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART33_1차본_33.41-33.50.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 09:00:03 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
33.50 최종 원칙

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART33_1차본_33.41-33.50.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 09:00:03 | 분류: MASTER_SPEC]
MASTER_SPEC은 프로젝트의 단일 기준 문서이며, 모든 정책, 구현, 테스트,
운영은 이를 최우선 기준으로 유지한다.
END OF PART 33.41~33.50

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART33_1차본_33.31-33.40.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:58:38 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
33.36 기록 유지
주요 변경과 복구 기록은 삭제하지 않고 보관한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART33_1차본_33.31-33.40.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:58:38 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
33.37 감사 추적
정책 변경은 변경 사유와 승인 이력을 추적 가능해야 한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART33_1차본_33.31-33.40.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:58:38 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
33.40 최종 원칙
MASTER_SPEC은 프로젝트의 최상위 기준 문서이며 모든 구현과 운영은 이를
기준으로 유지한다.
END OF PART 33.31~33.40

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART33_1차본_33.21-33.30.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:58:03 | 분류: MASTER_SPEC]
MASTER_SPEC v4.0 정본
PART 33. 부록 · 변경이력 · 파일목록 · 폐기대상 1차본 (33.21 ~ 33.30)
33.21 문서 보관 원칙
공식 문서는 삭제하지 않고 버전별로 보관한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART33_1차본_33.21-33.30.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:58:03 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
33.22 변경 추적
모든 변경은 변경 전·후 내용을 추적 가능해야 한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART33_1차본_33.21-33.30.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:58:03 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
33.23 파일 식별
공식 파일명은 버전과 역할을 식별할 수 있도록 작성한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART33_1차본_33.21-33.30.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:58:03 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
33.26 유지보수
정책 변경 시 관련 문서를 함께 수정한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART33_1차본_33.21-33.30.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:58:03 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
33.27 검토 절차
공식 문서는 정기적으로 일관성을 검토한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART33_1차본_33.21-33.30.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:58:03 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
33.30 최종 원칙
MASTER_SPEC은 프로젝트의 최상위 기준 문서이며, 모든 부속 문서는 이를
기준으로 유지·관리한다.
END OF PART 33.21~33.30

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART33_1차본_33.11-33.20.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:57:26 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
33.12 문서 버전
모든 공식 문서는 버전과 작성일을 함께 관리한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART33_1차본_33.11-33.20.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:57:26 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
33.13 변경 승인
정책 변경은 사용자 승인 후 변경이력에 기록한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART33_1차본_33.11-33.20.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:57:26 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
33.14 파일 관리
프로젝트 파일은 역할별로 관리하며 위치 변경 시 문서를 함께 수정한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART33_1차본_33.11-33.20.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:57:26 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
33.16 참조 일치
참조문서는 MASTER_SPEC과 동일한 정책을 유지한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART33_1차본_33.11-33.20.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:57:26 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
33.17 기록 보존
주요 변경 이력과 복구 기록은 장기 보관한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART33_1차본_33.11-33.20.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:57:26 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
33.20 최종 원칙
프로젝트의 모든 공식 문서는 하나의 기준(MASTER_SPEC)을 중심으로
관리한다.
END OF PART 33.11~33.20

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART33_1차본_33.1-33.10.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:56:31 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
33.3 변경이력
모든 공식 정책 변경은 날짜, 버전, 변경 사유를 기록한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART33_1차본_33.1-33.10.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:56:31 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
33.4 파일목록
공식 프로젝트 파일은 역할과 위치를 함께 관리한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART33_1차본_33.1-33.10.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:56:31 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
33.10 최종 원칙
모든 공식 문서는 MASTER_SPEC을 중심으로 일관성을 유지한다.
END OF PART 33.1~33.10

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART32_1차본_32.21-32.30.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:55:59 | 분류: MASTER_SPEC]
MASTER_SPEC v4.0 정본
PART 32. 릴리즈 · 기준본 · 복구본 관리 1차본 (32.21 ~ 32.30)
32.21 기준본 보존
공식 기준본은 별도 보관하며 임시 수정본으로 대체하지 않는다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART32_1차본_32.21-32.30.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:55:59 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
32.22 복구본 선택
복구 시 가장 최근 파일이 아니라 마지막 정상 동작이 확인된 기준본을
선택한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART32_1차본_32.21-32.30.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:55:59 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
32.23 버전 식별
모든 기준본과 복구본은 버전 번호와 작성일을 함께 관리한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART32_1차본_32.21-32.30.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:55:59 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
32.26 문서 일치
릴리즈된 코드와 MASTER_SPEC은 항상 동일한 정책을 반영해야 한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART32_1차본_32.21-32.30.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:55:59 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
32.27 기록 유지
릴리즈와 복구 이력은 장기적으로 보관하여 추적 가능해야 한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART32_1차본_32.21-32.30.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:55:59 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
32.30 최종 원칙
릴리즈와 복구는 ’검증된 기준본’을 중심으로 수행하며, 임시 수정본을 공식
기준으로 사용하지 않는다.
END OF PART 32.21~32.30

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART32_1차본_32.11-32.20.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:54:58 | 분류: MASTER_SPEC]
MASTER_SPEC v4.0 정본
PART 32. 릴리즈 · 기준본 · 복구본 관리 1차본 (32.11 ~ 32.20)
32.11 변경 이력 관리
모든 공식 변경은 버전과 변경 사유를 함께 기록한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART32_1차본_32.11-32.20.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:54:58 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
32.13 복구 절차
복구는 마지막 정상 기준본을 사용하며 임시 수정본을 기준으로 삼지 않는다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART32_1차본_32.11-32.20.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:54:58 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
32.14 백업 정책
주요 변경 전 기준본을 별도로 백업한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART32_1차본_32.11-32.20.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:54:58 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
32.16 문서 동기화
릴리즈 시 MASTER_SPEC과 관련 문서를 함께 갱신한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART32_1차본_32.11-32.20.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:54:58 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
32.17 장애 대응
문제 발생 시 즉시 기준본으로 복구하고 원인을 분석한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART32_1차본_32.11-32.20.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:54:58 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
32.20 최종 원칙
기준본은 공식 운영 기준이며, 릴리즈와 복구는 항상 문서와 테스트를
기반으로 수행한다.
END OF PART 32.11~32.20

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART32_1차본_32.1-32.10.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:54:24 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
32.2 적용 범위
- 기준본
- 복구본
- 릴리즈
- 백업
- 버전 관리

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART32_1차본_32.1-32.10.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:54:24 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
32.6 버전 관리
모든 공식 릴리즈는 버전과 변경 이력을 함께 기록한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART32_1차본_32.1-32.10.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:54:24 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
32.7 백업
기준본은 별도 보관하여 복구 기준으로 사용한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART32_1차본_32.1-32.10.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:54:24 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
32.10 최종 원칙
기준본은 프로젝트의 공식 참조 기준이며 복구본은 마지막 정상 상태를
유지한다.
END OF PART 32.1~32.10

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART31_1차본_31.21-31.30.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:53:46 | 분류: MASTER_SPEC]
MASTER_SPEC v4.0 정본
PART 31. AI 구현절차와 사용자 승인 원칙 1차본 (31.21 ~ 31.30)
31.21 작업 전 확인
구현 전 관련 문서, 기존 코드, 최신 확정사항을 모두 확인한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART31_1차본_31.21-31.30.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:53:46 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
31.22 영향 범위 분석
수정이 다른 모듈에 미치는 영향을 먼저 분석한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART31_1차본_31.21-31.30.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:53:46 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
31.23 사용자 지시 우선
사용자가 명시한 요구사항을 우선 적용한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART31_1차본_31.21-31.30.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:53:46 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
31.24 구현 기록
주요 구현 내용은 작업 기록과 문서에 반영한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART31_1차본_31.21-31.30.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:53:46 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
31.26 문서 일치
구현과 MASTER_SPEC의 내용은 항상 일치해야 한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART31_1차본_31.21-31.30.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:53:46 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
31.27 코드 품질
불필요한 중복을 줄이고 책임 분리를 유지한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART31_1차본_31.21-31.30.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:53:46 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
31.30 최종 원칙
모든 구현은 사용자 승인과 MASTER_SPEC을 기준으로 수행한다.
END OF PART 31.21~31.30

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART31_1차본_31.11-31.20.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:53:10 | 분류: MASTER_SPEC]
MASTER_SPEC v4.0 정본
PART 31. AI 구현절차와 사용자 승인 원칙 1차본 (31.11 ~ 31.20)
31.11 변경 범위 확인
수정 전 변경 대상 파일과 영향을 받는 모듈을 확인한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART31_1차본_31.11-31.20.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:53:10 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
31.12 최소 수정 원칙
요청된 범위만 수정한다.
무관한 코드와 UI는 변경하지 않는다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART31_1차본_31.11-31.20.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:53:10 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
31.13 기존 정책 유지
기존 확정 정책과 충돌하는 구현은 수행하지 않는다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART31_1차본_31.11-31.20.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:53:10 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
31.14 파일 생성 정책
결과물은 개별 파일을 기본으로 제공한다.
특별한 요청이 없는 한 ZIP 파일은 생성하지 않는다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART31_1차본_31.11-31.20.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:53:10 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
31.15 문서 갱신
정책이 확정되면 MASTER_SPEC을 우선 갱신한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART31_1차본_31.11-31.20.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:53:10 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
31.17 복구 원칙
문제 발생 시 마지막 정상 동작 기준으로 복구한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART31_1차본_31.11-31.20.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:53:10 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
31.18 기록 유지
주요 정책 변경과 복구 내역은 문서로 기록한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART31_1차본_31.11-31.20.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:53:10 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
31.20 최종 원칙
AI는 구현을 지원하는 도구이며, 최종 기준은 MASTER_SPEC과 사용자
승인이다.
END OF PART 31.11~31.20

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART31_1차본_31.1-31.10.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:51:24 | 분류: MASTER_SPEC]
MASTER_SPEC v4.0 정본
PART 31. AI 구현절차와 사용자 승인 원칙 1차본 (31.1 ~ 31.10)
31.1 문서 목적
본 문서는 AI를 활용한 프로젝트 구현 절차와 사용자 승인 원칙을 정의한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART31_1차본_31.1-31.10.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:51:24 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
31.3 구현 시작 조건
구현 전 다음을 확인한다.
- MASTER_SPEC
- 최신 확정 정책
- 기존 코드
- 관련 문서

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART31_1차본_31.1-31.10.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:51:24 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
31.5 신규 개념
확정되지 않은 신규 개념은 구현하지 않는다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART31_1차본_31.1-31.10.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:51:24 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
31.6 기존 코드 검토
기존 구현을 확인한 후 필요한 범위만 수정한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART31_1차본_31.1-31.10.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:51:24 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
31.7 문서 우선
문서와 구현이 충돌하면 원인을 분석하여 문서를 기준으로 정리한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART31_1차본_31.1-31.10.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:51:24 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
31.10 최종 원칙
AI는 제안을 수행하고 프로젝트 기준은 MASTER_SPEC과 사용자 최종 승인에
따른다.
END OF PART 31.1~31.10

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART30_1차본_30.21-30.30.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:50:11 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
30.24 원인 분석
증상이 아닌 최초 원인을 분석하여 수정한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART30_1차본_30.21-30.30.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:50:11 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
30.26 문서 갱신
복구로 확정된 정책은 MASTER_SPEC에 반영한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART30_1차본_30.21-30.30.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:50:11 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
30.29 관련 원칙
문서 > 구현 > 테스트 순으로 일관성을 유지한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART30_1차본_30.21-30.30.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:50:11 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
30.30 최종 원칙
복구의 목표는 최신 상태가 아니라 정상 상태의 회복이다.
END OF PART 30.21~30.30

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART30_1차본_30.11-30.20.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:47:24 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
30.20 최종 원칙

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART30_1차본_30.1-30.10.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:46:19 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
30.6 복구 기준
마지막 정상 버전을 기준으로 복구한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART30_1차본_30.1-30.10.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:46:19 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
30.10 최종 원칙
HOLD는 프로젝트의 공식 주문 신호가 아니다. 비신호는 signal=None으로
처리한다.
END OF PART 30.1~30.10

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART29_1차본_29.21-29.30.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:44:48 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
29.30 최종 원칙
모든 테스트는 정책, 문서, 구현의 일치를 확인하기 위한 절차이다.
END OF PART 29.21~29.30

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART29_1차본_29.11-29.20.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:44:09 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
29.18 실패 처리
실패 원인과 재현 절차를 기록한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART29_1차본_29.1-29.10.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:42:50 | 분류: MASTER_SPEC]
MASTER_SPEC v4.0 정본
PART 29. 테스트 원칙과 검증 절차 1차본 (29.1 ~ 29.10)
29.1 문서 목적 본 문서는 프로젝트 테스트와 검증의 공식 기준을 정의한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART29_1차본_29.1-29.10.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:42:50 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
29.3 테스트 철학
테스트는 정책을 변경하기 위한 수단이 아니다. 정책이 올바르게
구현되었는지를 확인하는 절차이다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART29_1차본_29.1-29.10.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:42:50 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
29.10 최종 원칙
테스트 통과보다 정책 일치가 우선한다.
END OF PART 29.1~29.10

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART28_1차본_28.21-28.30.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:42:12 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
28.23 체크박스 정책
체크박스는 기능 활성 여부를 결정한다. 체크 해제 시 관련 입력 항목 전체를
비활성화한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART28_1차본_28.21-28.30.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:42:12 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
28.30 최종 원칙

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART28_1차본_28.21-28.30.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:42:12 | 분류: MASTER_SPEC]
설정창은 프로젝트 정책을 정확하게 표현하는 인터페이스이다. UI 구현은
MASTER_SPEC의 정책을 그대로 반영해야 한다.
END OF PART 28.21~28.30

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART28_1차본_28.11-28.20.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:36:20 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
28.13 기본값
필수 항목은 기본값을 제공할 수 있으나 사용자 설정을 우선한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART28_1차본_28.11-28.20.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:36:20 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
28.14 비활성 정책
체크 해제 시 해당 설정 행 전체를 비활성화한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART28_1차본_28.11-28.20.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:36:20 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
28.20 최종 원칙
설정창은 정책을 정확히 표현해야 하며 구현 편의를 위해 정책을 변경해서는
안 된다.
END OF PART 28.11~28.20

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART28_1차본_28.1-28.10.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:34:00 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
28.3 기본 원칙
설정창은 설명 화면이 아니라 설정 컨트롤 패널이다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART28_1차본_28.1-28.10.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:34:00 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
28.8 UI 활성 정책
체크 해제 시 해당 행 전체를 비활성 처리한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART28_1차본_28.1-28.10.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:34:00 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
28.10 최종 원칙
UI는 정책을 표현하는 수단이며 정책 자체를 변경하지 않는다.
END OF PART 28.1~28.10

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART27_1차본_27.21-27.30.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:32:11 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
27.23 필수 항목
필수 항목이 누락되면 해당 루틴은 활성화하지 않는다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART27_1차본_27.21-27.30.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:32:11 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
27.24 선택 항목
선택 항목은 기본 정책을 적용할 수 있다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART27_1차본_27.21-27.30.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:32:11 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
27.30 최종 원칙
신호엔진은 검증된 설정만 사용한다. 설정 무결성은 모든 신호 생성보다
우선한다.
END OF PART 27.21~27.30

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART27_1차본_27.11-27.20.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:31:13 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
27.12 기본값 처리
누락 가능한 선택 항목은 기본값을 적용한다. 필수 항목은 기본값으로
대체하지 않는다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART27_1차본_27.11-27.20.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:31:13 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
27.18 오류 로그 정책
설정 오류는 로그에 기록한다.
오류 발생 시 임의 설정으로 계속 진행하지 않는다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART27_1차본_27.1-27.10.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:28:49 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
27.10 최종 원칙
rules.json은 신호엔진의 공식 입력 데이터이며 구조 변경은 프로젝트 기준
문서를 따른다.
END OF PART 27.1~27.10

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART26_1차본_26.21-26.30.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:26:51 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
26.26 사용자 설정
조건 조합과 활성 여부는 사용자 설정을 우선 적용한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART26_1차본_26.21-26.30.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:26:51 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
26.30 최종 원칙
NOT은 프로젝트 전체에서 ’조건 제외’만 의미한다.
모든 BUY/SELL 조건조합은 동일한 해석 규칙을 사용한다.
END OF PART 26.21~26.30

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART26_1차본_26.11-26.20.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:26:08 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
26.12 동일 레벨 평가 원칙
A, B, C, NOT 대상은 동일 레벨의 조건으로 평가한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART26_1차본_26.11-26.20.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:26:08 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
26.17 UI 수식 입력 규칙
수식 입력기는 프로젝트의 공식 규칙만 허용한다.
허용되지 않는 수식은 저장하지 않는다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART26_1차본_26.11-26.20.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:26:08 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
26.20 최종 원칙
NOT은 논리연산자가 아니라 조건 제외 규칙이다.
프로젝트 전체에서 동일한 의미로 적용한다.
END OF PART 26.11~26.20

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART26_1차본_26.1-26.10.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:24:52 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
26.10 최종 원칙
NOT은 ’제외 규칙’이며 프로젝트 전체에서 동일한 의미로 사용한다.
END OF PART 26.1~26.10

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART25_1차본_25.21-25.30.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:24:13 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
25.30 최종 원칙
SELL은 조건그룹과 조합 규칙을 모두 만족할 때만 생성한다.
루틴은 SELL을 판단하고 메인은 SELL 주문을 수행한다.
END OF PART 25.21~25.30

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART25_1차본_25.11-25.20.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:23:35 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
25.20 최종 원칙
SELL은 조건그룹 기반의 판단 결과이며, 실제 주문 실행은 메인 프로그램이
담당한다.
END OF PART 25.11~25.20

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART25_1차본_25.1-25.10.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:22:42 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
25.3 SELL 기본 철학
SELL은 보유 포지션 종료를 위한 판단이다.
주문 실행은 메인이 담당한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART25_1차본_25.1-25.10.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:22:42 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
25.10 최종 원칙
SELL은 단일 조건이 아니라 조건그룹 조합으로 판단한다.
END OF PART 25.1~25.10

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART23_1차본_23.21-23.30.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:20:06 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
23.23 기준가격 유지
다중매수 진행 중 기준가격은 임의로 변경하지 않는다.
새 기준가격이 필요한 경우 새로운 매수계획을 생성한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART23_1차본_23.21-23.30.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:20:06 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
23.25 사용자 설정 우선
매수방식 관련 설정은 사용자 설정을 우선 적용한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART23_1차본_23.21-23.30.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:20:06 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
23.30 최종 원칙
다중매수는 계획된 포지션 구축 전략이다.
능동매수는 평단 개선을 위한 보조 정책이다.
매수방식은 루틴이 판단하고 메인이 실행한다.
END OF PART 23.21~23.30

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART23_1차본_23.11-23.20.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:19:29 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
23.12 주문가 기준
주문가는 다중매수 계산의 기준값으로 사용할 수 있다.
현재가와 주문가를 혼용하지 않는다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART23_1차본_23.11-23.20.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:19:29 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
23.14 다중지점 생성
다중지점은 사용자 설정에 따라 생성한다.
생성된 지점은 순서대로 평가한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART23_1차본_23.11-23.20.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:19:29 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
23.17 중복 매수 방지
동일 매수지점에서 반복 주문이 발생하지 않도록 중복 방지 정책을 적용할 수
있다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART23_1차본_23.11-23.20.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:19:29 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
23.20 최종 원칙
매수방식은 사용자 전략을 표현하는 정책이다.
루틴은 정책을 판단하고 메인은 주문을 실행한다.
END OF PART 23.11~23.20

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART23_1차본_23.1-23.10.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:18:52 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
23.2 적용 범위
본 문서는 다음 기능에 적용한다.
- 단일매수
- 다중매수
- 다중지점
- 능동매수
- 주문가 기준 정책

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART23_1차본_23.1-23.10.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:18:52 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
23.4 단일매수
단일매수는 하나의 매수지점만 사용하는 방식이다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART23_1차본_23.1-23.10.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:18:52 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
23.5 다중매수
다중매수는 하나 이상의 매수지점을 계획하여 순차적으로 수행하는 방식이다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART23_1차본_23.1-23.10.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:18:52 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
23.6 다중지점
다중지점은 기준가격을 중심으로 여러 매수 후보 가격을 구성하는 기능이다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART23_1차본_23.1-23.10.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:18:52 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
23.7 호가 기준
다중매수는 호가 기준 구성을 지원한다.
상향호가와 하향호가를 사용자 설정에 따라 적용한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART23_1차본_23.1-23.10.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:18:52 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
23.10 최종 원칙
매수방식은 주문 지점을 구성한다.
평단관리는 예산을 관리한다.
두 정책은 독립적으로 동작한다.
END OF PART 23.1~23.10

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART22_1차본_22.21-22.30.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:18:02 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
22.27 사용자 설정
평단관리 정책은 사용자 설정을 우선 적용한다.
정책 변경은 보유가 없는 상태에서 수행하는 것을 원칙으로 한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART22_1차본_22.21-22.30.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:18:02 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
22.30 최종 원칙
BUY는 포지션 구축의 시작이다.
평단관리는 장기적인 평균단가 관리 정책이다.
루틴은 판단을 담당하고 메인은 실행을 담당한다.
END OF PART 22.21~22.30

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART22_1차본_22.11-22.20.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:17:06 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
22.16 매수계획
BUY 발생 시 매수계획을 생성할 수 있다.
매수계획에는 회차, 기준가격, 목표예산, 평단관리 정책을 포함한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART22_1차본_22.11-22.20.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:17:06 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
22.20 최종 원칙
평단관리는 포지션 구축 정책이다.
루틴은 판단을 수행한다.
메인은 주문을 수행한다.
END OF PART 22.11~22.20

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART22_1차본_22.1-22.10.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:16:33 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
22.3 BUY 기본 철학
BUY는 주문이 아니라 매수 판단이다.
BUY 발생 이후 실제 주문 실행 여부는 메인 프로그램이 결정한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART22_1차본_22.1-22.10.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:16:33 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
22.10 최종 원칙
BUY는 판단이다.
평단관리는 포지션 구축 정책이다.
주문 실행은 메인 프로그램의 책임이다.
END OF PART 22.1~22.10

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART21_1차본_21.21-21.30.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:16:01 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
21.22 조건 평가 원칙
모든 조건은 독립적으로 평가한 후 최종 결합한다.
조건 평가 과정에서 순환 참조를 허용하지 않는다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART21_1차본_21.21-21.30.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:16:01 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
21.26 성능 원칙
루틴은 반복 계산을 최소화한다.
동일 계산 결과는 가능한 범위에서 재사용한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART21_1차본_21.21-21.30.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:16:01 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
21.27 확장 원칙
새로운 필터와 조건은 기존 구조를 변경하지 않고 확장 가능한 형태로
추가한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART21_1차본_21.21-21.30.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:16:01 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
21.28 문서 우선 원칙
구현보다 MASTER_SPEC을 우선한다.
문서와 코드가 충돌하면 원인을 분석한 후 수정한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART21_1차본_21.11-21.20.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:15:10 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
21.14 기준봉 정책
지원 기준봉
- 0봉
- 1봉
기본값은 1봉이다.
보유 중 기준봉 변경은 허용하지 않는다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_00_전체목차_및_작성맵_초안.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:06:32 | 분류: MASTER_SPEC]
MASTER_SPEC v4.0
00. 전체목차 및 작성맵 초안

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_00_전체목차_및_작성맵_초안.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:06:32 | 분류: MASTER_SPEC]
작성 원칙:
- 요약본 금지
- 단순 개요문 금지
- 얇은 문서 남발 금지
- 한 PART는 충분한 분량의 정식 기준 문서로 작성
- 한 번에 완성하지 못하면 1차본 → 보강본 → 정리본 순으로 다듬음
- ZIP 생성 금지
- 개별 TXT 파일 유지
- 확정되지 않은 신규 개념 생성 금지
- 기존 갱신자료는 정본에 흡수 후 중복 참조문서로 남기지 않음

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_00_전체목차_및_작성맵_초안.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:06:32 | 분류: MASTER_SPEC]
============================================================
1. MASTER_SPEC v4.0 전체 구성
============================================================

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_00_전체목차_및_작성맵_초안.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:06:32 | 분류: MASTER_SPEC]
제1권. 프로젝트 최상위 기준
- PART 01. 프로젝트 정의, 철학, 최상위원칙
- PART 02. 프로젝트 구조, 계층 분리, 파일 구조
- PART 03. 문서 체계, 변경관리, 개발 절차
- PART 04. 용어 정의, 금지행위, 복구 기준

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_00_전체목차_및_작성맵_초안.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:06:32 | 분류: MASTER_SPEC]
제4권. GUI와 관제 구조
- PART 15. 관제창 UI 정책
- PART 16. 종목등록창, 루틴지정창, 검토관리창
- PART 17. 운영환경 설정창
- PART 18. 공통 UI 원칙과 사용자 확인 절차

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_00_전체목차_및_작성맵_초안.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:06:32 | 분류: MASTER_SPEC]
============================================================
2. v3.0 BASELINE 흡수 기준
============================================================
v3.0 BASELINE은 v4.0의 직접 편집 대상이 아니라, 내용 흡수 대상이다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_00_전체목차_및_작성맵_초안.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:06:32 | 분류: MASTER_SPEC]
============================================================
3. 갱신자료 반영 위치
============================================================

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_00_전체목차_및_작성맵_초안.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:06:32 | 분류: MASTER_SPEC]
[2026-06-18 HOLD 오염복구 / rules 구조]
반영 위치:
- PART 20. 루틴/메인 역할분리와 신호 큐
- PART 21. MACD 루틴 기본 철학과 신호 구조
- PART 27. rules.json 구조와 신호엔진 검증
- PART 30. HOLD 오염복구와 금지행위
- PART 31. AI 구현절차와 사용자 승인 원칙

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_00_전체목차_및_작성맵_초안.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:06:32 | 분류: MASTER_SPEC]
[2026-06-22 STEP44 평단관리 / 압축파일 금지]
반영 위치:
- PART 01. 프로젝트 정의, 철학, 최상위원칙
- PART 22. MACD BUY 구조와 평단관리
- PART 23. MACD 매수방식, 다중매수, 능동매수
- PART 31. AI 구현절차와 사용자 승인 원칙

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_00_전체목차_및_작성맵_초안.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:06:32 | 분류: MASTER_SPEC]
============================================================
4. 작성 우선순위
============================================================

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_00_전체목차_및_작성맵_초안.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:06:32 | 분류: MASTER_SPEC]
3순위:
- PART 01~04 최상위 원칙
- PART 05~18 메인 프로그램 / GUI / 운영정책
- PART 29~33 테스트 / 복구 / 부록

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_00_전체목차_및_작성맵_초안.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:06:32 | 분류: MASTER_SPEC]
1. 문서 목적
2. 적용 범위
3. 공식 정의
4. 핵심 철학
5. 세부 정책
6. UI 기준
7. 구현 기준
8. 금지사항
9. 테스트 기준
10. 관련 파일
11. 최종 원칙
단, PART 성격에 따라 일부 제목은 조정할 수 있다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_00_전체목차_및_작성맵_초안.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:06:32 | 분류: MASTER_SPEC]
============================================================
6. 작성·보강·정리 3단계 절차
============================================================
각 PART는 한 번에 완성하려 하지 않는다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_00_전체목차_및_작성맵_초안.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:06:32 | 분류: MASTER_SPEC]
============================================================
7. 지금부터의 실제 작성 순서
============================================================
다음 파일부터 작성한다.

[출처: 마스터스펙\마스터스펙_갱신자료_v2026-06-25_MACD매도신호조합_NOT규칙_확정.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 06:45:48 | 분류: 갱신문서]
7. NOT 최종 정의
본 프로젝트의 NOT은 일반 프로그래밍식 단항 NOT이 아니다.
NOT은 해당 조건 상황을 제외하는 프로젝트 전용 조합토큰이다.

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_7.txt | 기준일: 2026-06-22 | 수정시각: 2026-06-25 16:17:54 | 분류: 대화히스토리]
image(929).png
image(930).png
image(931).png
이게 뭐야????다 동일하게 수정해달라고 상향/하향은 이상/이하, 상하는 이내/이탈 넣어주라고....

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_7.txt | 기준일: 2026-06-22 | 수정시각: 2026-06-25 16:17:54 | 분류: 대화히스토리]
----------------------------------------------------------------
마스터스펙_갱신자료_STEP44.zip
ZIP 아카이브
작업진행상황대화히스토리_7.txt
문서

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_7.txt | 기준일: 2026-06-22 | 수정시각: 2026-06-25 16:17:54 | 분류: 대화히스토리]
이 이미지의 3봉동안 수행과 아래 다중지점 30초 이내 의 설정항목이 충돌가능성이 있다...이부분의 어떻게 처리 해야할까? 네의견은?

[출처: 작업재개요약서_v2026-06-22_MACD설정창_BUY정리완료_SELL진입직전.txt | 기준일: 2026-06-22 | 수정시각: 2026-06-22 19:17:26 | 분류: 작업재개요약]
============================================================
2. 작업 중 확정된 핵심 원칙
============================================================

[출처: 작업재개요약서_v2026-06-22_MACD설정창_BUY정리완료_SELL진입직전.txt | 기준일: 2026-06-22 | 수정시각: 2026-06-22 19:17:26 | 분류: 작업재개요약]
2-4. 결과물 제공 원칙
- 수정 요청 후 파일 생성 단계에서는 말만 하지 말고 실제 파일을 생성해야 한다.
- 가능한 개별 .py 파일 단위로 제공.
- 압축파일 생성은 지양.
- 다음 창으로 넘어가기 전에는 작업재개요약서와 마스터스펙 갱신자료를 파일로 제공.

[출처: 마스터스펙\MASTER_SPEC_추가갱신메모_v2026-06-22.txt | 기준일: 2026-06-22 | 수정시각: 2026-06-22 12:40:54 | 분류: 갱신문서]
MASTER_SPEC_추가갱신메모_v2026-06-22

[출처: 마스터스펙\마스터스펙_갱신자료_STEP44.txt | 기준일: 2026-06-20 | 수정시각: 2026-06-20 18:08:56 | 분류: 갱신문서]
마스터스펙_갱신자료_STEP44

[출처: 작업재개요약서_v2026-06-20_STEP44.txt | 기준일: 2026-06-20 | 수정시각: 2026-06-20 18:08:36 | 분류: 작업재개요약]
[압축파일 생성 금지 정책]
- 작업 결과 전달 시 ZIP 생성 금지
- 참조문서, 패치파일, 로그파일은 개별 파일 제공
- 압축본 생성은 사용자가 명시적으로 요청한 경우에만 허용
- 기본 원칙은 단일 파일 직접 전달

[출처: STEP41D_구성화면_중복제목_흰색박스제거_수정보고_v2026-06-19.txt | 기준일: 2026-06-19 | 수정시각: 2026-06-19 16:42:11 | 분류: 구현로그/검증보고]
STEP41D_구성화면_중복제목_흰색박스제거_수정보고_v2026-06-19

[출처: STEP41B_구성단일중심_UI_수정보고_v2026-06-19.txt | 기준일: 2026-06-19 | 수정시각: 2026-06-19 16:28:06 | 분류: 구현로그/검증보고]
STEP41B_구성단일중심_UI_수정보고_v2026-06-19

[출처: kiwoom_auto_43_분석보고_v2026-06-19.txt | 기준일: 2026-06-19 | 수정시각: 2026-06-19 08:14:11 | 분류: 구현로그/검증보고]
판정:
- STEP34/STEP35 PowerShell 스크립트는 현재 압축본에 포함되어 있지 않음.
- 적용/검증 자동화 스크립트는 아직 프로젝트 폴더에 반영되지 않은 상태로 보임.

[출처: STEP36_최신프로젝트_GUI구조재검증_STEP29_STEP35_적용가능성판정_v2026-06-19.txt | 기준일: 2026-06-19 | 수정시각: 2026-06-19 07:59:56 | 분류: 구현로그/검증보고]
STEP36_최신프로젝트_GUI구조재검증_STEP29_STEP35_적용가능성판정_v2026-06-19

[출처: STEP36_최신프로젝트_GUI구조재검증_STEP29_STEP35_적용가능성판정_v2026-06-19.txt | 기준일: 2026-06-19 | 수정시각: 2026-06-19 07:59:56 | 분류: 구현로그/검증보고]
역할:
- 선택된 루틴 행을 확인
- 선택이 없으면 체크된 루틴을 확인
- routine_display_name(path) 기준으로 routine_dir 탐색
- routine_name, routine_dir 반환

[출처: STEP36_최신프로젝트_GUI구조재검증_STEP29_STEP35_적용가능성판정_v2026-06-19.txt | 기준일: 2026-06-19 | 수정시각: 2026-06-19 07:59:56 | 분류: 구현로그/검증보고]
미완료 검증:
- 실제 QDialog 창 생성
- 실제 RoutineAssignWindow 창 생성
- 실제 루틴 설정 버튼 클릭
- gui_main.py 실행
이 검증은 사용자 Windows 프로젝트에서 수행해야 한다.

[출처: STEP36_최신프로젝트_GUI구조재검증_STEP29_STEP35_적용가능성판정_v2026-06-19.txt | 기준일: 2026-06-19 | 수정시각: 2026-06-19 07:59:56 | 분류: 구현로그/검증보고]
------------------------------------------------------------
9. 기존 우려에 대한 재판정
------------------------------------------------------------
직전 우려:
- STEP29~STEP35가 실제 코드 대조 없이 확장되었을 수 있다.

[출처: STEP36_최신프로젝트_GUI구조재검증_STEP29_STEP35_적용가능성판정_v2026-06-19.txt | 기준일: 2026-06-19 | 수정시각: 2026-06-19 07:59:56 | 분류: 구현로그/검증보고]
------------------------------------------------------------
11. 적용 전 추가 수정 필요 여부
------------------------------------------------------------

[출처: STEP36_최신프로젝트_GUI구조재검증_STEP29_STEP35_적용가능성판정_v2026-06-19.txt | 기준일: 2026-06-19 | 수정시각: 2026-06-19 07:59:56 | 분류: 구현로그/검증보고]
------------------------------------------------------------
12. 최종 결론
------------------------------------------------------------
STEP36 결론:

[출처: STEP35_MACD설정UI_검증실행스크립트_생성보고_v2026-06-19.txt | 기준일: 2026-06-19 | 수정시각: 2026-06-19 07:52:41 | 분류: 구현로그/검증보고]
------------------------------------------------------------
2. 실행 위치
------------------------------------------------------------
프로젝트 루트:
C:\Users\JIN KWANG CHUL\Documents\kiwoom_auto

[출처: STEP34_MACD설정UI_적용보조스크립트_생성보고_v2026-06-19.txt | 기준일: 2026-06-19 | 수정시각: 2026-06-19 07:51:19 | 분류: 구현로그/검증보고]
작성 목적:
본 문서는 STEP29~STEP32 파일을 프로젝트 루트에 안전하게 배치하기 위한
PowerShell 적용 보조 스크립트 생성 결과를 기록한다.

[출처: STEP34_MACD설정UI_적용보조스크립트_생성보고_v2026-06-19.txt | 기준일: 2026-06-19 | 수정시각: 2026-06-19 07:51:19 | 분류: 구현로그/검증보고]
------------------------------------------------------------
2. 사용 위치
------------------------------------------------------------
두 ps1 파일과 아래 py 파일들을 모두 프로젝트 루트에 둔다.
프로젝트 루트:
C:\Users\JIN KWANG CHUL\Documents\kiwoom_auto

[출처: STEP34_MACD설정UI_적용보조스크립트_생성보고_v2026-06-19.txt | 기준일: 2026-06-19 | 수정시각: 2026-06-19 07:51:19 | 분류: 구현로그/검증보고]
------------------------------------------------------------
3. 실행 명령
------------------------------------------------------------
PowerShell에서 프로젝트 루트 이동 후:

[출처: STEP33_MACD설정UI_적용순서_검증체크리스트_v2026-06-19.txt | 기준일: 2026-06-19 | 수정시각: 2026-06-19 07:48:31 | 분류: 구현로그/검증보고]
------------------------------------------------------------
3. 파일 배치 순서
------------------------------------------------------------
프로젝트 루트:
C:\Users\JIN KWANG CHUL\Documents\kiwoom_auto

[출처: STEP32_루틴지정창_MACD설정버튼_연결후보검증파일_생성보고_v2026-06-19.txt | 기준일: 2026-06-19 | 수정시각: 2026-06-19 07:47:06 | 분류: 구현로그/검증보고]
------------------------------------------------------------
2. 실행 전 배치
------------------------------------------------------------
프로젝트 루트에 아래 파일을 배치한다.

[출처: STEP31_루틴지정창_MACD설정버튼_연결후보_생성보고_v2026-06-19.txt | 기준일: 2026-06-19 | 수정시각: 2026-06-19 07:43:41 | 분류: 구현로그/검증보고]
------------------------------------------------------------
5. 적용 방법
------------------------------------------------------------
프로젝트 루트에서 파일 배치:

[출처: STEP30_MACD설정다이얼로그_독립검증파일_생성보고_v2026-06-19.txt | 기준일: 2026-06-19 | 수정시각: 2026-06-19 07:39:24 | 분류: 구현로그/검증보고]
------------------------------------------------------------
3. 실행 전 배치 방법
------------------------------------------------------------
아래 파일을 프로젝트 루트에 배치한다.

[출처: STEP29_gui_macd_routine_settings_dialog_초안생성보고_v2026-06-19.txt | 기준일: 2026-06-19 | 수정시각: 2026-06-19 07:36:50 | 분류: 구현로그/검증보고]
------------------------------------------------------------
4. 설계 원칙 반영
------------------------------------------------------------

[출처: STEP28_GUI파일구조확인_MACD설정UI_부착위치판정_v2026-06-19.txt | 기준일: 2026-06-19 | 수정시각: 2026-06-19 07:33:10 | 분류: 구현로그/검증보고]
단점:
- 파일이 이미 매우 큼
- 운영정책/시간정책/청산/상태관리와 섞일 위험
- MACD 설정 UI가 커지면 유지보수 악화
- 사용자 프로젝트의 구조분리 철학과 다소 충돌
판정:
- 본체 구현 위치로는 비추천
- 호출 버튼/연결 지점으로만 활용 권장
후보 B:
gui_routine_assign_window.py 내부에 직접 구현
장점:
- 루틴 목록과 가까움
- 루틴 선택 후 설정 버튼을 붙이기 쉬움

[출처: STEP27_MACD설정UI_초안설계_B안_확장형_v2026-06-19.txt | 기준일: 2026-06-19 | 수정시각: 2026-06-19 07:26:36 | 분류: 구현로그/검증보고]
2. 목표 수익률
- target_profit_rate 또는 profit_rate_percent
- 단위: %
- 기준: 평단 대비 현재가 수익률

[출처: STEP27_MACD설정UI_초안설계_B안_확장형_v2026-06-19.txt | 기준일: 2026-06-19 | 수정시각: 2026-06-19 07:26:36 | 분류: 구현로그/검증보고]
설명 문구:
- "현재가가 보유 평단 대비 목표 수익률 이상이면 SELL 후보가 됩니다."
- "보유 수량이 없거나 평단 정보가 없으면 평가하지 않습니다."
- "평단/현재가/보유수량은 설정값이 아니라 메인 context에서 제공됩니다."

[출처: STEP27_MACD설정UI_초안설계_B안_확장형_v2026-06-19.txt | 기준일: 2026-06-19 | 수정시각: 2026-06-19 07:26:36 | 분류: 구현로그/검증보고]
------------------------------------------------------------
10. 데이터 매핑 원칙
------------------------------------------------------------

[출처: STEP26_MACD설정UI_항목목록화_v2026-06-19.txt | 기준일: 2026-06-19 | 수정시각: 2026-06-19 07:22:20 | 분류: 구현로그/검증보고]
10. 목표 수익률
- sell.signals.profit_rate_sell.target_profit_rate 또는 profit_rate_percent
- 기준: 평단 대비 현재가 수익률
- STEP23 검증 완료

[출처: STEP26_MACD설정UI_항목목록화_v2026-06-19.txt | 기준일: 2026-06-19 | 수정시각: 2026-06-19 07:22:20 | 분류: 구현로그/검증보고]
수익률 SELL 설명:
- "현재가가 보유 평단 대비 목표 수익률 이상이면 SELL 후보가 됩니다."
- "보유 수량이 없거나 평단 정보가 없으면 평가하지 않습니다."

[출처: STEP25_rules_json_v0.3_구조점검보고_v2026-06-19.txt | 기준일: 2026-06-19 | 수정시각: 2026-06-19 07:21:15 | 분류: 구현로그/검증보고]
------------------------------------------------------------
3. v0.3에서 보존해야 할 기본 원칙
------------------------------------------------------------

[출처: STEP24_BUY_구조점검보고_v2026-06-19.txt | 기준일: 2026-06-19 | 수정시각: 2026-06-19 07:18:29 | 분류: 구현로그/검증보고]
장점:
- 프로젝트 철학 훼손 위험 최소
- 평단 중심 철학 반영 가능
- CANCEL/다중매수/지속매수와 함께 설계 가능
단점:
- 당장 코드 구현 진도는 느림

[출처: 작업재개요약서_추가갱신_STEP23_profit_rate_sell_signal_logic_완료.txt | 기준일: 2026-06-19 | 수정시각: 2026-06-19 07:16:23 | 분류: 작업재개요약]
------------------------------------------------------------
1. 현재 상태 요약
------------------------------------------------------------
프로젝트는 계속 진행 가능하다.

[출처: 작업재개요약서_추가갱신_STEP23_profit_rate_sell_signal_logic_완료.txt | 기준일: 2026-06-19 | 수정시각: 2026-06-19 07:16:23 | 분류: 작업재개요약]
------------------------------------------------------------
4. 유지된 원칙
------------------------------------------------------------

[출처: STEP23_profit_rate_sell_signal_logic_검증보고_실행통과본.txt | 기준일: 2026-06-19 | 수정시각: 2026-06-19 07:16:18 | 분류: 구현로그/검증보고]
[OR profit only]
{'signal': 'SELL', 'reason': '매도조건 충족(OR)', 'matched_groups': ['profit_rate_sell'], 'details': ['PASS profit_rate_sell 평단대비수익률 4.0000% >= 목표 3.0000% (평단=100.0, 현재가=104.0)'], 'signal_index': 5, 'delay_bar': 0}
판정:
- OR 조건에서 profit_rate_sell 단독 SELL 성공

[출처: 마스터스펙\STEP30_MACD설정다이얼로그_독립검증파일_생성보고_v2026-06-19\작업재개요약서_v2026-06-18_MACD루틴_HOLD오염복구_rules구조_STEP22완료.txt | 기준일: 2026-06-19 | 수정시각: 2026-06-19 06:18:18 | 분류: 작업재개요약]
프로젝트 폐기 아님.
메인 주문엔진 파이프라인 유지 가능.
오염은 루틴 신호부와 일부 테스트/문서에 한정되었고 현재 보정 완료.

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_6.txt | 기준일: 2026-06-18 | 수정시각: 2026-06-22 15:39:42 | 분류: 대화히스토리]
kiwoom_auto (41)(2).zip
ZIP 아카이브
프로젝트 진행에 중요한 문서들의 모든 내용을 하나도 빠짐없이 파악해줘.

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_6.txt | 기준일: 2026-06-18 | 수정시각: 2026-06-22 15:39:42 | 분류: 대화히스토리]
루틴에 관련한 설정은 여기서..이창 배치도 나중에 다시 조정은 해야 겠지만..이창에서 루틴을 직접 클릭하면 들어가게 설정해..

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_6.txt | 기준일: 2026-06-18 | 수정시각: 2026-06-22 15:39:42 | 분류: 대화히스토리]
image(791).png
image(792).png
image(793).png
image(794).png
image(795).png
image(796).png
붙여넣은 텍스트 (1)(3).txt
문서

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_6.txt | 기준일: 2026-06-18 | 수정시각: 2026-06-22 15:39:42 | 분류: 대화히스토리]
일단 제일 직관적이 체크박스 형태로 설정사항의 우선순위를 횡으로 넣어보자. 여기서 빠진 개념이나 보완사항 검토해봐

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_6.txt | 기준일: 2026-06-18 | 수정시각: 2026-06-22 15:39:42 | 분류: 대화히스토리]
image(806).png
image(807).png
빨간색 표시 삭제..글자 배경에 왜 흰색을 넣어?? 두번째 이미지와 유사하게 만들고 싶어...

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_6.txt | 기준일: 2026-06-18 | 수정시각: 2026-06-22 15:39:42 | 분류: 대화히스토리]
오키....내가 바라는 모습에 가깝다....일단 모든 선택항목들을 콤보나 직접입력 형식으로 구현 해놔도 나중에 네가 로직 연결 문제 없지?
요거 부터 가자... 이미지 안에[-1] 는 뭘로 표현 하까?

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_6.txt | 기준일: 2026-06-18 | 수정시각: 2026-06-22 15:39:42 | 분류: 대화히스토리]
좋다...잘했어,,...그런데 좀 작아서 설정이 좀 힘드네...좀 키워줄수 있어? 그리고 숫자 직접 입려 정렬을 오른쪽으로 ..그러면 아주 좋을거 같아..

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_6.txt | 기준일: 2026-06-18 | 수정시각: 2026-06-22 15:39:42 | 분류: 대화히스토리]
self.tabs = QTabWidget()
root.addWidget(self.tabs, 1)
이 부분이 지금 화면 상단의 큰 제목을 만드는 코드다.
수정안:

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_6.txt | 기준일: 2026-06-18 | 수정시각: 2026-06-22 15:39:42 | 분류: 대화히스토리]
root = QVBoxLayout(self)
root.setContentsMargins(4, 4, 4, 4)
root.setSpacing(2)

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_6.txt | 기준일: 2026-06-18 | 수정시각: 2026-06-22 15:39:42 | 분류: 대화히스토리]
self.tabs = QTabWidget()
root.addWidget(self.tabs, 1)
그리고 아래도 같이 수정.
현재:

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_6.txt | 기준일: 2026-06-18 | 수정시각: 2026-06-22 15:39:42 | 분류: 대화히스토리]
routine_name = ...
self.title_label.setText(str(routine_name))
수정:

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_6.txt | 기준일: 2026-06-18 | 수정시각: 2026-06-22 15:39:42 | 분류: 대화히스토리]
- 작업 결과 전달 시 ZIP 생성 금지
- 참조문서, 패치파일, 로그파일은 개별 파일 제공
- 압축본 생성은 사용자가 명시적으로 요청한 경우에만 허용
- 기본 원칙은 단일 파일 직접 전달
새창에서는 이 2개 문서와 현재 작업 파일 기준으로 바로 이어가면 된다.

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_6.txt | 기준일: 2026-06-18 | 수정시각: 2026-06-22 15:39:42 | 분류: 대화히스토리]
MASTER_SPEC_v3.0_BASELINE_ (2)(4).zip
ZIP 아카이브
문서내용을 빠짐없이 모두 파악해
이부분 더미 넣어서 구성하자...
이미지 생성됨
•
매매 전략 설정 화면
매매 전략 설정 화면
생성된 이미지: 매매 전략 설정 화면
편집

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_6.txt | 기준일: 2026-06-18 | 수정시각: 2026-06-22 15:39:42 | 분류: 대화히스토리]
올려준 자료 전체를 기준으로 먼저 “정책/개념 문서”와 “실제 코드 압축본”을 분리해서 보겠습니다. 임의 수정은 하지 않고, 분석 결과만 정리합니다.

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_6.txt | 기준일: 2026-06-18 | 수정시각: 2026-06-22 15:39:42 | 분류: 대화히스토리]
row = add_row(0)
row.addWidget(make_line("20", 36))
row.addWidget(make_line("5", 36))

[출처: STEP13_실제주문_안전요구사항_v2026-06-18_HOLD오염제거_복구본.txt | 기준일: 2026-06-18 | 수정시각: 2026-06-18 17:58:53 | 분류: 구현로그/검증보고]
------------------------------------------------------------
5. 실제 주문 실행기 도입 전 핵심 원칙
------------------------------------------------------------
실제 주문 실행기는 절대 루틴 안에 넣지 않는다.
실제 주문 실행기는 메인 프로그램의 주문관리 계층에 위치해야 한다.
권장 파일 위치:

[출처: STEP13_실제주문_안전요구사항_v2026-06-18_HOLD오염제거_복구본.txt | 기준일: 2026-06-18 | 수정시각: 2026-06-18 17:58:53 | 분류: 구현로그/검증보고]
- 실제 주문 실행기는 루틴에 넣지 않는 원칙
- SendOrder 호출부를 adapter로 격리하는 원칙
- execution_enabled=False 기본값
- 실주문 차단 조건
- 계좌/로그인/운영정책/안정성검사 확인
- EXECUTABLE 이후에도 바로 주문하지 않는 원칙
- REAL_READY 사전단계 도입
- Mock과 실주문 분리 원칙

[출처: 마스터스펙\절대금지행위_추가규정_v2026-06-18_AI검증절차_복구기준관리.txt | 기준일: 2026-06-18 | 수정시각: 2026-06-18 17:33:26 | 분류: 갱신문서]
--------------------------------------------------
4. 문서 남발 금지
--------------------------------------------------
문서 작성은 아래 경우만 허용.
- 프로젝트 기준 문서
- 작업재개요약서
- 사고 기록 문서
- 사용자 요청 문서
설계 가설 문서 무분별 생성 금지.

[출처: 마스터스펙\절대금지행위_추가규정_v2026-06-18_AI검증절차_복구기준관리.txt | 기준일: 2026-06-18 | 수정시각: 2026-06-18 17:33:26 | 분류: 갱신문서]
--------------------------------------------------
8. 최종 원칙
--------------------------------------------------
추론보다 문서.
문서보다 확정사항.
확정사항보다 사용자 승인.
이를 최우선 원칙으로 한다.

[출처: 마스터스펙\MASTER_SPEC_v3.0_BASELINE_ (2)\MASTER_SPEC_v3.0_BASELINE_\MASTER_SPEC_v3.0_BASELINE_13_16_STEP08_20_갱신본.txt | 기준일: 2026-06-18 | 수정시각: 2026-06-18 16:44:08 | 분류: 갱신문서]
================================================================================
MASTER_SPEC_v3.0_BASELINE
제4권
PART 13. 현황 및 표시 정책
문서등급 : 최상위 기준 문서
작성일 : 2026-06
본 문서는 프로젝트의 상태 표시, 현황 표시, 색상 정책 및 사용자 표시 체계를 정의한다.
---
1. 목적
---
본 프로젝트는 단순 정보 표시를 사용하지 않는다.
표시 체계는 운영 상태를 직관적으로 전달해야 한다.
---
2. 기본 철학
---
사용자는 현재 상태를 즉시 이해할 수 있어야 한다.
표시는 직관성을 우선한다.
---
3. 현황 정의
---
종목의 현재 운영 가능 상태를 나타낸다.
---
4. 용어 변경
---
기존 "시작" 컬럼 사용 금지.
---
5. 공식 명칭
---
현황
---
6. 현황 역할
---
운영 가능 여부 표시.
---
7. 현황 색상 체계
---
녹색
주황
회색
적색
---
8. 녹색 정의
---
정상 운영 가능.
---
9. 녹색 의미
---
감시 가능.
운영 가능.
---
10. 주황 정의
---
정상 상태.
---
11. 주황 의미
---
다음 진행 대상 없음.
---
12. 주황 예시
---
조기마감 완료.
---
13. 주황 예시
---
자동마감 완료.
---
14. 주황 예시
---
청산 완료.
---
15. 회색 정의
---
비활성 상태.
---
16. 회색 의미
---
운영 불가.
---
17. 적색 정의
---
신뢰 불가 상태.
---
18. 적색 의미
---
운영 금지.
---
19. 적색 예시
---
데이터 불일치.
---
20. 적색 예시
---
서버 정보 불일치.
---
21. 적색 예시
---
판정 실패.
---
22. 적색 처리
---
즉시 운영 중단.
---
23. 적색 처리
---
안정성검사 수행.
---
24. 적색 처리
---
필요 시 검토관리.
---
25. 사용자 상태 표시
---
감시/대기
매수/매도
조기마감
자동마감
청산
검토관리
---
26. 상태 추가 금지 원칙
---
상태 무분별 추가 금지.
---
27. 상태 목적
---
직관성 유지.
---
28. 운영방식 표시
---
수동
시간
ATS
---
29. 수동 색상
---
보라색.
---
30. 전역 설정 표시
---
검정색.
---
31. 개별 설정 표시
---
파란색.
---
32. ATS 표시
---
주황색.
---
33. 상태 표시 원칙
---
현재 실제 상태 표시.
---
34. 추정 상태 표시 금지
---
예상 상태 표시 금지.
---
35. 상태 우선순위
---
검토관리 우선.
---
36. TROUBLE 우선순위
---
최상위 표시 대상.
---
37. 표시 정책 핵심 철학
---
표시는 운영 판단을 돕기 위한 수단이다.
적색은 위험을 의미한다.
주황은 정상 상태일 수 있다.
---
38. PART 13 핵심 요약
---
현황 컬럼을 사용한다.
녹색=정상
주황=진행대상 없음
회색=비활성
적색=신뢰불가
표시는 직관성을 우선한다.
END OF PART 13
MASTER_SPEC_v3.0_BASELINE
제4권
PART 14. 예산 및 완충영역 정책
문서등급 : 최상위 기준 문서
작성일 : 2026-06
본 문서는 자금관리, 예산관리 및 완충영역 정책을 정의한다.
---
1. 목적
---
예산은 프로젝트 전체 위험도를 제어한다.
---
2. 기본 철학
---
예산은 제한(Limit) 개념으로 사용한다.
---
3. 예산 구조
---
전체예산
↓
루틴예산
↓
종목예산
---
4. 전체예산 정의
---
프로젝트 전체 사용 가능 자금.
---
5. 전체예산 역할
---
최상위 제한.
---
6. 루틴예산 정의
---
루틴별 사용 제한.
---
7. 루틴예산 특징
---
선택 적용.
---
8. 종목예산 정의
---
종목별 사용 제한.
---
9. 종목예산 특징
---
선택 적용.
---
10. 예산 우선순위
---
전체
↓
루틴
↓
종목
---
11. 예산 표시
---
금액 표시.
---
12. 예산 표시
---
비율 표시.
---
13. 경고 단계
---
70%
80%
90%
---
14. 70%
---
주의.
---
15. 80%
---
경계.
---
16. 90%
---
위험.
---
17. 완충영역 정의
---
자동 위험감축 영역.
---
18. 완충영역 철학
---
경고 기능이 아니다.
---
---
19. 완충영역 오해 금지
---
완충영역은 추가 예산이 아니다.
---
20. 완충영역 위치
---
전체예산 내부에 존재하는 비상 대응 영역이다.
---
21. 완충영역 목적
---
위험 노출 감소.
운영자 부재 상황 대응.
---
22. 완충영역 사용 원칙
---
예산 한도 초과를 허용하지 않는다.
---
23. 완충영역 핵심 철학
---
완충영역은 추가 자금이 아니다.
전체예산 내부의 위험관리 구간이다.
.
---
24. 개입 조건
---
완충영역 진입 상태.
---
25. 개입 조건
---
신규 체결 발생.
---
26. 대상 선정 기준
---
수익률 최저 종목.
---
27. 대상 범위
---
조기마감 미진입 종목.
---
28. 제외 대상
---
조기마감 진행 중.
---
29. 제외 대상
---
자동마감 진행 중.
---
30. 제외 대상
---
청산 진행 중.
---
31. 제외 대상
---
검토관리.
---
32. 위험감축 방법
---
조기마감 진입.
---
33. 위험감축 절차
---
조기마감
↓
청산
↓
Reset Complete
---
34. 반복 원칙
---
신규 체결마다 재판정.
---
35. 완충 해제
---
사용률 감소.
---
36. 완충 해제 효과
---
자동 개입 중단.
---
37. 진행 중 절차
---
취소 안 함.
---
38. ATS 연계
---
조기마감 사용 안 함.
---
39. ATS 대응
---
현재가 또는 시장가 정리.
---
40. 예산 정책 핵심 철학
---
예산은 위험관리 수단이다.
완충영역은 자동 위험감축 엔진이다.
---
41. PART 14 핵심 요약
---
전체→루틴→종목 예산 구조 사용.
완충영역은 자동 위험감축 기능이다.
신규 체결 발생 시 수익률 최저 종목을 정리한다.
END OF PART 14
MASTER_SPEC_v3.0_BASELINE
제4권
PART 15. 주문 생명주기 정책
문서등급 : 최상위 기준 문서
작성일 : 2026-06
본 문서는 주문 생성부터 종료까지의 전체 생명주기를 정의한다.
---
1. 목적
---
주문 상태를 명확히 추적한다.
---
2. 기본 철학
---
신호와 주문은 다르다.
주문과 체결은 다르다.
---
3. 주문 흐름
---
신호
↓
주문 생성
↓
주문 접수
↓
체결
↓
종료
---
4. 주문 생성
---
메인엔진 담당.
---
5. 주문 접수
---
증권사 수신 완료 상태.
---
6. 체결 정의
---
실제 거래 성립.
---
7. 부분체결 정의
---
일부만 체결.
---
8. 미체결 정의
---
체결 안 됨.
---
9. 정정 정의
---
기존 주문 수정.
---
10. 취소 정의
---
기존 주문 취소.
---
11. 주문번호
---
고유 식별자.
---
12. 원주문번호
---
정정/취소 기준.
---
13. 종료 주문 원칙
---
매도신호
=
종료 아님.
---
14. 핵심 원칙
---
매도신호
↓
주문 접수 성공
↓
EXITING
---
15. 주문 추적
---
orders.json 기록.
---
16. 체결 우선순위
---
실체결 우선.
---
17. 데이터 우선순위
---
실계좌
↓
체결통보
↓
orders
---
18. 주문 실패
---
재시도 정책 적용 가능.
---
19. 주문 동기화
---
실계좌 기준.
---
20. 주문 생명주기 핵심 철학
---
신호는 주문이 아니다.
주문은 체결이 아니다.
실계좌 정보가 최우선이다.
---
21. PART 15 핵심 요약
---
주문은 생성→접수→체결 순서로 진행된다.
매도신호만으로 종료되지 않는다.
주문 접수 성공 후 EXITING 상태 진입한다.
---
22. STEP08~STEP20 구현 검증 반영 주문 파이프라인
---
다음 주문 파이프라인이 Mock 환경에서 검증되었다.
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
Kiwoom Adapter Stub
↓
Mock SendOrder
↓
Mock Fill
↓
Mock Position 반영
↓
SELL 후보 생성
↓
Mock 전량매도
↓
포지션 종료
---
23. 주문후보 상태
---
PENDING
APPROVED
BLOCKED
BLOCKED_POLICY
EXECUTABLE
REAL_READY
ADAPTER_READY
ORDER_SENT_MOCK
FILLED_MOCK
---
24. 주문후보 생성
---
BUY 신호는 주문후보 생성기로 전달된다.
SELL 신호는 보유수량 검증 후 주문후보 생성기로 전달된다.
BUY는 entry_amount, entry_quantity, 현재가를 기준으로 수량을 산정할 수 있다.
SELL은 보유수량을 기준으로 수량을 산정한다.
---
25. 승인기 역할
---
승인기는 주문후보가 실제 실행 가능 후보인지 1차 판정한다.
승인기는 APPROVED 또는 BLOCKED 상태를 부여한다.
---
26. 운영정책 차단기 역할
---
운영정책 차단기는 긴급정지, 조기마감, 검토관리 등 운영상 차단 조건을 확인한다.
통과 시 EXECUTABLE 상태가 된다.
차단 시 BLOCKED_POLICY 상태가 된다.
---
27. 실주문 사전검사 역할
---
실주문 사전검사는 실제 주문 직전의 최종 안전계층이다.
검사 항목은 다음과 같다.
real_trade_enabled
kiwoom_logged_in
account_selected
operator_confirmed
execution_enabled
quantity
order_type
통과 시 REAL_READY 상태가 된다.
차단 시 BLOCKED_REAL 상태가 된다.
---
28. Kiwoom Adapter Stub 역할
---
Kiwoom Adapter Stub은 실제 SendOrder 호출 직전의 요청 객체 생성 계층이다.
현재 구현 단계에서는 SendOrder를 호출하지 않고 ADAPTER_READY 상태까지만 생성한다.
---
29. Mock SendOrder
---
Mock SendOrder는 실제 SendOrder를 호출하지 않는다.
가짜 주문번호를 생성하고 ORDER_SENT_MOCK 상태를 부여한다.
---
30. Mock Fill
---
Mock Fill은 실제 체결통보 없이 Mock 체결 이벤트를 생성한다.
체결 이벤트는 mock_fill_events.json에 기록된다.
주문 상태는 FILLED_MOCK으로 변경된다.
---
31. 주문 생명주기 구현 검증 결론
---
신호와 주문은 분리되었다.
주문과 체결은 분리되었다.
주문 전송과 체결 이벤트는 분리되었다.
Mock 환경에서 주문 생성부터 체결 및 보유반영까지 전체 흐름이 검증되었다.
---
32. PART 15 갱신 요약
---

[출처: 마스터스펙\MASTER_SPEC_v3.0_BASELINE_ (2)\MASTER_SPEC_v3.0_BASELINE_\MASTER_SPEC_v3.0_BASELINE_13_16_STEP08_20_갱신본.txt | 기준일: 2026-06-18 | 수정시각: 2026-06-18 16:44:08 | 분류: 갱신문서]
PART 15는 주문 생명주기를 정책적으로 정의하고 있었으며, STEP08~STEP20 구현을 통해 해당 생명주기의 Mock 검증 흐름이 확인되었다.
실제 SendOrder와 실제 체결통보는 아직 미구현이다.
END OF PART 15
MASTER_SPEC_v3.0_BASELINE
제4권
PART 16. Position Policy 및 매수정책
문서등급 : 최상위 기준 문서
작성일 : 2026-06
본 문서는 Position Policy, Price Policy, 회차 정책 및 매수정책을 정의한다.
---
1. 목적
---
신호와 실제 진입을 분리한다.
---
2. 기본 철학
---
BUY 신호는 진입 허가가 아니다.
---
3. Position Policy 정의
---
진입 가능 여부를 결정하는 계층.
---
4. 위치
---
루틴
↓
Position Policy
↓
Price Policy
↓
주문
---
5. Position Policy 역할
---
진입 허용 여부 판단.
---
6. Price Policy 정의
---
가격 조건 판단 계층.
---
7. Price Policy 역할
---
진입 가격 검증.
---
8. BUY 신호 의미
---
매수 후보.
---
9. BUY 신호
---
주문 의미 아님.
---
10. SELL 신호 의미
---
청산 완료 의미 아님.
---
11. 회차 정의
---
실제 체결 기준 단계.
---
12. 핵심 원칙
---
BUY 신호 수
≠
회차 수
---
13. 회차 증가 조건
---
실제 체결.
---
14. 체결 실패
---
회차 증가 안 함.
---
15. 추가진입 정의
---
기존 보유 상태에서 추가 매수.
---
16. 추가진입 조건
---
Position Policy 통과.
---
17. 추가진입 조건
---
Price Policy 통과.
---
18. 추가진입 조건
---
주문 체결.
---
19. 금액 방식
---
고정금액 가능.
---
20. 금액 방식
---
비율금액 가능.
---
21. 마틴 방식
---
X2 지원.
---
22. 마틴 방식
---
X3 지원.
---
23. 목표체결율
---
지원 가능.
---
24. 재매수
---
정책 기반 수행.
---
25. Position Policy 핵심 철학
---
신호는 후보이다.
체결이 실제 진입이다.
---
26. Price Policy 핵심 철학
---
가격 조건은 신호보다 우선할 수 있다.
---
27. PART 16 핵심 요약
---
BUY 신호는 진입 허가가 아니다.
회차는 체결 기준으로 증가한다.
Position Policy와 Price Policy가 진입을 결정한다.
---
28. STEP08~STEP20 구현 검증 반영 Position Policy
---
Position Policy는 루틴 신호와 실제 주문 사이의 중간 계층으로 검증되었다.
BUY 신호는 곧바로 주문이 아니며, 주문후보 생성 및 승인 과정을 거친다.
SELL 신호도 곧바로 청산이 아니며, 보유수량 검증 및 주문후보 생성 과정을 거친다.
---
29. BUY 수량 산정 검증
---
entry_amount와 현재가를 이용한 수량 산정이 검증되었다.
예시:
entry_amount = 100000
현재가 = 50000
결과 수량 = 2주
---
30. SELL 수량 산정 검증
---
SELL 수량은 보유수량 기준으로 산정한다.
Mock 검증 환경에서는 mock_position.mock_holding_qty를 참조할 수 있다.
실계좌 연동 단계에서는 실계좌 보유수량을 최우선으로 한다.
---
31. Mock Position 검증 결과
---
Mock 체결 이벤트 기반으로 mock_position이 생성되었다.
검증 항목은 다음과 같다.
mock_holding_qty
mock_avg_price
mock_total_cost
mock_realized_pnl
---
32. 부분매도 검증
---
2주 보유 상태에서 1주 매도 검증을 수행하였다.
결과:
잔여수량 1주
평단 유지
총원가 감소
실현손익 +5000
---
33. 전량매도 검증
---
잔여 1주 전량매도 검증을 수행하였다.
결과:
mock_holding_qty = 0
mock_avg_price = 0
mock_total_cost = 0
mock_realized_pnl 유지
포지션 종료 판정 성공
---
34. PART 16 갱신 요약
---
Position Policy는 신호를 주문후보로 전환하는 계층임이 구현 검증되었다.
회차 및 보유수량은 신호가 아니라 체결과 포지션 반영 결과를 기준으로 판단한다.
실제 계좌 연동 전까지 Mock Position은 구현 검증용으로만 사용한다.
END OF PART 16

[출처: 새 폴더\MASTER_SPEC_v3.0_BASELINE_21_24.txt | 기준일: 2026-06-17 | 수정시각: 2026-06-17 19:22:04 | 분류: MASTER_SPEC]
MASTER_SPEC_v3.0_BASELINE
제6권
PART 21. GUI 정책
문서등급 : 최상위 기준 문서
작성일 : 2026-06
본 문서는 GUI 구성 원칙, 표시 정책, 사용자 인터페이스 철학을 정의한다.
---
1. 목적
---
GUI는 기능보다 운영 판단 지원을 우선한다.
---
2. 기본 철학
---
직관성 우선.
단순성 우선.
상태 가시성 우선.
---
3. GUI 역할
---
정보 표시.
설정 입력.
운영 제어.
---
4. GUI 금지사항
---
직접 주문 실행 로직 보유 금지.
---
5. GUI 금지사항
---
상태 판정 로직 보유 금지.
---
6. GUI 금지사항
---
운영 정책 결정 금지.
---
7. 메인화면 목적
---
현재 운영 상태 확인.
---
8. 관제창 목적
---
예산 및 위험도 관리.
---
9. 검토관리창 목적
---
문제 종목 관리.
---
10. 종목창 목적
---
종목 상태 관리.
---
11. 상태 표시 원칙
---
실제 상태만 표시.
---
12. 추정 상태 표시 금지
---
허용 안 함.
---
13. 현황 컬럼
---
공식 명칭 사용.
---
14. 색상 체계
---
PART 13 기준 사용.
---
---
15. 내부 상태코드 표시 금지
---
사용자 화면에 내부 상태코드를 직접 표시하지 않는다.
---
16. 표시 금지 예시
---
READY
RUNNING
EXITING
RESETTING
READY_AFTER_RESET
REVIEW_REQUIRED
---
17. 표시 원칙
---
사용자는 정책 용어만 본다.
---
18. 색상 단독 의존 금지
---
색상만으로 상태를 판단하게 하지 않는다.
---
19. 색상 보조 원칙
---
색상은 보조 수단이다.
상태 텍스트를 함께 표시한다.
---
20. GUI 핵심 철학 추가
---
사용자는 내부 구현을 볼 필요가 없다.
GUI는 운영 판단에 필요한 정보만 제공한다.
---
21. PART 21 핵심 요약
---
GUI는 표시 계층이다.
정책과 실행은 GUI 외부에서 처리한다.
END OF PART 21
MASTER_SPEC_v3.0_BASELINE
제6권
PART 22. 로그 및 기록 정책
문서등급 : 최상위 기준 문서
작성일 : 2026-06
본 문서는 로그, 운영기록, 보고서 및 문서관리 정책을 정의한다.
---
1. 목적
---
모든 중요한 이벤트를 추적 가능하게 한다.
---
2. 기본 철학
---
삭제보다 기록.
---
3. 로그 정의
---
운영 이벤트 기록.
---
4. 로그 대상
---
주문.
---
5. 로그 대상
---
체결.
---
6. 로그 대상
---
상태 변경.
---
7. 로그 대상
---
검토관리 진입.
---
8. 로그 대상
---
복귀.
---
9. 로그 목적
---
원인 추적.
---
10. 보고서 정의
---
운영 결과 기록.
---
11. 보고서 종류
---
운영 보고서.
---
12. 보고서 종류
---
오류 보고서.
---
13. 보고서 종류
---
검토관리 보고서.
---
14. 문서 정의
---
정책 기록.
---
15. MASTER_SPEC 역할
---
최상위 기준 문서.
---
16. 작업재개요약서 역할
---
대화 및 작업 연결.
---
17. 문서 갱신 원칙
---
정책 변경 후 갱신.
---
18. 로그 핵심 철학
---
기록은 남긴다.
삭제는 최소화한다.
---
19. PART 22 핵심 요약
---
중요 이벤트는 기록한다.
MASTER_SPEC는 최상위 기준 문서이다.
END OF PART 22
MASTER_SPEC_v3.0_BASELINE
제6권
PART 23. 테스트 및 배포 정책
문서등급 : 최상위 기준 문서
작성일 : 2026-06
본 문서는 테스트, 검증, 패치 및 배포 정책을 정의한다.
---
1. 목적
---
안전한 변경을 보장한다.
---
2. 기본 철학
---
패치보다 검증.
---
3. 정책 우선 원칙
---
정책 검토
↓
구현
↓
테스트
↓
배포
---
---
4. 작업 진행 원칙
---
증상 확인
↓
원인 분석
↓
관련 코드 확인
↓
정책 충돌 검토
↓
수정 범위 확정
↓
사용자 승인
↓
패치 생성
---
5. 패치 선작성 금지
---
원인 분석 없이 패치를 먼저 작성하지 않는다.
---
6. 임의 수정 금지
---
사용자 승인 없는 기능 변경 금지.
---
7. 임의 삭제 금지
---
사용자 승인 없는 기능 삭제 금지.
---
8. 정책 우선 원칙 강화
---
정책이 확정되지 않은 상태에서 구현을 진행하지 않는다.
---
9. 작업 검증 원칙
---
패치 생성 전 영향 범위를 확인한다.
---
10. 유지보수 원칙
---
부분 수정 시 연관 기능 영향 여부를 함께 검토한다.
---
11. 배포 전 조건
---
테스트 통과.
---
12. 배포 전 조건
---
문서 검토.
---
13. 배포 원칙
---
단계적 적용.
---
14. 롤백 원칙
---
복구 가능 상태 유지.
---
15. 패치 핵심 철학
---
정책이 패치를 만든다.
패치가 정책을 만들지 않는다.
---
16. PART 23 핵심 요약
---
정책 검토 후 구현한다.
검증 후 배포한다.
임시 패치를 금지한다.
END OF PART 23
MASTER_SPEC_v3.0_BASELINE
제6권
PART 24. 로드맵 및 향후 계획
문서등급 : 최상위 기준 문서
작성일 : 2026-06
본 문서는 향후 개발 방향과 확장 계획을 정의한다.
---
1. 목적
---
프로젝트의 향후 발전 방향 기록.
---
2. 기본 철학
---
구조 안정 후 기능 확장.
---
3. 현재 완료 영역
---
구조개선.
---
4. 현재 완료 영역
---
상태체계.
---
5. 현재 완료 영역
---
검토관리.
---
6. 현재 완료 영역
---
재시작 정책.
---
7. 현재 완료 영역
---
마감정책.
---
8. 현재 완료 영역
---
예산정책.
---
9. 현재 완료 영역
---
Position Policy 설계.
---
10. 현재 완료 영역
---
저장구조 설계.
---
11. 향후 과제
---
MACD 루틴 구현.
---
12. 향후 과제
---
OpenAPI 실연동 검증.
---
13. 향후 과제
---
실체결 검증.
---
14. 향후 과제
---
부분체결 검증.
---
15. 향후 과제
---
정정주문 검증.
---
16. 향후 과제
---
취소주문 검증.
---
17. 향후 과제
---
완충영역 실전 검증.
---
18. 향후 과제
---
Position Policy 실전 검증.
---
19. 향후 과제
---
Price Policy 실전 검증.
---
20. 향후 과제
---
관제창 확장.
---
21. 향후 과제
---
루틴 생태계 확장.
---
22. 향후 과제
---
자동매매 엔진 고도화.
---
23. 문서 갱신 계획
---
정책 변경 시 MASTER_SPEC 갱신.
---
24. Baseline 정의
---
본 문서는 완성본이 아니다.
현재 시점의 기준선이다.
---
25. 향후 버전 정책
---
v3.x 지속 개정.
---
26. 프로젝트 최종 철학
---
안전성 우선.
실계좌 우선.
검토관리 우선.
정책 우선.
---
27. PART 24 핵심 요약
---
현재 문서는 Baseline이다.
실전 검증 후 지속 개정한다.
프로젝트는 구조 안정성과 안전성을 우선한다.
END OF PART 24

[출처: 새 폴더\MASTER_SPEC_v3.0_BASELINE_13_16.txt | 기준일: 2026-06-17 | 수정시각: 2026-06-17 19:21:58 | 분류: MASTER_SPEC]
MASTER_SPEC_v3.0_BASELINE
제4권
PART 13. 현황 및 표시 정책
문서등급 : 최상위 기준 문서
작성일 : 2026-06
본 문서는 프로젝트의 상태 표시, 현황 표시, 색상 정책 및 사용자 표시 체계를 정의한다.
---
1. 목적
---
본 프로젝트는 단순 정보 표시를 사용하지 않는다.
표시 체계는 운영 상태를 직관적으로 전달해야 한다.
---
2. 기본 철학
---
사용자는 현재 상태를 즉시 이해할 수 있어야 한다.
표시는 직관성을 우선한다.
---
3. 현황 정의
---
종목의 현재 운영 가능 상태를 나타낸다.
---
4. 용어 변경
---
기존 "시작" 컬럼 사용 금지.
---
5. 공식 명칭
---
현황
---
6. 현황 역할
---
운영 가능 여부 표시.
---
7. 현황 색상 체계
---
녹색
주황
회색
적색
---
8. 녹색 정의
---
정상 운영 가능.
---
9. 녹색 의미
---
감시 가능.
운영 가능.
---
10. 주황 정의
---
정상 상태.
---
11. 주황 의미
---
다음 진행 대상 없음.
---
12. 주황 예시
---
조기마감 완료.
---
13. 주황 예시
---
자동마감 완료.
---
14. 주황 예시
---
청산 완료.
---
15. 회색 정의
---
비활성 상태.
---
16. 회색 의미
---
운영 불가.
---
17. 적색 정의
---
신뢰 불가 상태.
---
18. 적색 의미
---
운영 금지.
---
19. 적색 예시
---
데이터 불일치.
---
20. 적색 예시
---
서버 정보 불일치.
---
21. 적색 예시
---
판정 실패.
---
22. 적색 처리
---
즉시 운영 중단.
---
23. 적색 처리
---
안정성검사 수행.
---
24. 적색 처리
---
필요 시 검토관리.
---
25. 사용자 상태 표시
---
감시/대기
매수/매도
조기마감
자동마감
청산
검토관리
---
26. 상태 추가 금지 원칙
---
상태 무분별 추가 금지.
---
27. 상태 목적
---
직관성 유지.
---
28. 운영방식 표시
---
수동
시간
ATS
---
29. 수동 색상
---
보라색.
---
30. 전역 설정 표시
---
검정색.
---
31. 개별 설정 표시
---
파란색.
---
32. ATS 표시
---
주황색.
---
33. 상태 표시 원칙
---
현재 실제 상태 표시.
---
34. 추정 상태 표시 금지
---
예상 상태 표시 금지.
---
35. 상태 우선순위
---
검토관리 우선.
---
36. TROUBLE 우선순위
---
최상위 표시 대상.
---
37. 표시 정책 핵심 철학
---
표시는 운영 판단을 돕기 위한 수단이다.
적색은 위험을 의미한다.
주황은 정상 상태일 수 있다.
---
38. PART 13 핵심 요약
---
현황 컬럼을 사용한다.
녹색=정상
주황=진행대상 없음
회색=비활성
적색=신뢰불가
표시는 직관성을 우선한다.
END OF PART 13
MASTER_SPEC_v3.0_BASELINE
제4권
PART 14. 예산 및 완충영역 정책
문서등급 : 최상위 기준 문서
작성일 : 2026-06
본 문서는 자금관리, 예산관리 및 완충영역 정책을 정의한다.
---
1. 목적
---
예산은 프로젝트 전체 위험도를 제어한다.
---
2. 기본 철학
---
예산은 제한(Limit) 개념으로 사용한다.
---
3. 예산 구조
---
전체예산
↓
루틴예산
↓
종목예산
---
4. 전체예산 정의
---
프로젝트 전체 사용 가능 자금.
---
5. 전체예산 역할
---
최상위 제한.
---
6. 루틴예산 정의
---
루틴별 사용 제한.
---
7. 루틴예산 특징
---
선택 적용.
---
8. 종목예산 정의
---
종목별 사용 제한.
---
9. 종목예산 특징
---
선택 적용.
---
10. 예산 우선순위
---
전체
↓
루틴
↓
종목
---
11. 예산 표시
---
금액 표시.
---
12. 예산 표시
---
비율 표시.
---
13. 경고 단계
---
70%
80%
90%
---
14. 70%
---
주의.
---
15. 80%
---
경계.
---
16. 90%
---
위험.
---
17. 완충영역 정의
---
자동 위험감축 영역.
---
18. 완충영역 철학
---
경고 기능이 아니다.
---
---
19. 완충영역 오해 금지
---
완충영역은 추가 예산이 아니다.
---
20. 완충영역 위치
---
전체예산 내부에 존재하는 비상 대응 영역이다.
---
21. 완충영역 목적
---
위험 노출 감소.
운영자 부재 상황 대응.
---
22. 완충영역 사용 원칙
---
예산 한도 초과를 허용하지 않는다.
---
23. 완충영역 핵심 철학
---
완충영역은 추가 자금이 아니다.
전체예산 내부의 위험관리 구간이다.
.
---
24. 개입 조건
---
완충영역 진입 상태.
---
25. 개입 조건
---
신규 체결 발생.
---
26. 대상 선정 기준
---
수익률 최저 종목.
---
27. 대상 범위
---
조기마감 미진입 종목.
---
28. 제외 대상
---
조기마감 진행 중.
---
29. 제외 대상
---
자동마감 진행 중.
---
30. 제외 대상
---
청산 진행 중.
---
31. 제외 대상
---
검토관리.
---
32. 위험감축 방법
---
조기마감 진입.
---
33. 위험감축 절차
---
조기마감
↓
청산
↓
Reset Complete
---
34. 반복 원칙
---
신규 체결마다 재판정.
---
35. 완충 해제
---
사용률 감소.
---
36. 완충 해제 효과
---
자동 개입 중단.
---
37. 진행 중 절차
---
취소 안 함.
---
38. ATS 연계
---
조기마감 사용 안 함.
---
39. ATS 대응
---
현재가 또는 시장가 정리.
---
40. 예산 정책 핵심 철학
---
예산은 위험관리 수단이다.
완충영역은 자동 위험감축 엔진이다.
---
41. PART 14 핵심 요약
---
전체→루틴→종목 예산 구조 사용.
완충영역은 자동 위험감축 기능이다.
신규 체결 발생 시 수익률 최저 종목을 정리한다.
END OF PART 14
MASTER_SPEC_v3.0_BASELINE
제4권
PART 15. 주문 생명주기 정책
문서등급 : 최상위 기준 문서
작성일 : 2026-06
본 문서는 주문 생성부터 종료까지의 전체 생명주기를 정의한다.
---
1. 목적
---
주문 상태를 명확히 추적한다.
---
2. 기본 철학
---
신호와 주문은 다르다.
주문과 체결은 다르다.
---
3. 주문 흐름
---
신호
↓
주문 생성
↓
주문 접수
↓
체결
↓
종료
---
4. 주문 생성
---
메인엔진 담당.
---
5. 주문 접수
---
증권사 수신 완료 상태.
---
6. 체결 정의
---
실제 거래 성립.
---
7. 부분체결 정의
---
일부만 체결.
---
8. 미체결 정의
---
체결 안 됨.
---
9. 정정 정의
---
기존 주문 수정.
---
10. 취소 정의
---
기존 주문 취소.
---
11. 주문번호
---
고유 식별자.
---
12. 원주문번호
---
정정/취소 기준.
---
13. 종료 주문 원칙
---
매도신호
=
종료 아님.
---
14. 핵심 원칙
---
매도신호
↓
주문 접수 성공
↓
EXITING
---
15. 주문 추적
---
orders.json 기록.
---
16. 체결 우선순위
---
실체결 우선.
---
17. 데이터 우선순위
---
실계좌
↓
체결통보
↓
orders
---
18. 주문 실패
---
재시도 정책 적용 가능.
---
19. 주문 동기화
---
실계좌 기준.
---
20. 주문 생명주기 핵심 철학
---
신호는 주문이 아니다.
주문은 체결이 아니다.
실계좌 정보가 최우선이다.
---
21. PART 15 핵심 요약
---
주문은 생성→접수→체결 순서로 진행된다.
매도신호만으로 종료되지 않는다.
주문 접수 성공 후 EXITING 상태 진입한다.
END OF PART 15
MASTER_SPEC_v3.0_BASELINE
제4권
PART 16. Position Policy 및 매수정책
문서등급 : 최상위 기준 문서
작성일 : 2026-06
본 문서는 Position Policy, Price Policy, 회차 정책 및 매수정책을 정의한다.
---
1. 목적
---
신호와 실제 진입을 분리한다.
---
2. 기본 철학
---
BUY 신호는 진입 허가가 아니다.
---
3. Position Policy 정의
---
진입 가능 여부를 결정하는 계층.
---
4. 위치
---
루틴
↓
Position Policy
↓
Price Policy
↓
주문
---
5. Position Policy 역할
---
진입 허용 여부 판단.
---
6. Price Policy 정의
---
가격 조건 판단 계층.
---
7. Price Policy 역할
---
진입 가격 검증.
---
8. BUY 신호 의미
---
매수 후보.
---
9. BUY 신호
---
주문 의미 아님.
---
10. SELL 신호 의미
---
청산 완료 의미 아님.
---
11. 회차 정의
---
실제 체결 기준 단계.
---
12. 핵심 원칙
---
BUY 신호 수
≠
회차 수
---
13. 회차 증가 조건
---
실제 체결.
---
14. 체결 실패
---
회차 증가 안 함.
---
15. 추가진입 정의
---
기존 보유 상태에서 추가 매수.
---
16. 추가진입 조건
---
Position Policy 통과.
---
17. 추가진입 조건
---
Price Policy 통과.
---
18. 추가진입 조건
---
주문 체결.
---
19. 금액 방식
---
고정금액 가능.
---
20. 금액 방식
---
비율금액 가능.
---
21. 마틴 방식
---
X2 지원.
---
22. 마틴 방식
---
X3 지원.
---
23. 목표체결율
---
지원 가능.
---
24. 재매수
---
정책 기반 수행.
---
25. Position Policy 핵심 철학
---
신호는 후보이다.
체결이 실제 진입이다.
---
26. Price Policy 핵심 철학
---
가격 조건은 신호보다 우선할 수 있다.
---
27. PART 16 핵심 요약
---
BUY 신호는 진입 허가가 아니다.
회차는 체결 기준으로 증가한다.
Position Policy와 Price Policy가 진입을 결정한다.
END OF PART 16

[출처: 새 폴더\MASTER_SPEC_v3.0_BASELINE_17_20.txt | 기준일: 2026-06-17 | 수정시각: 2026-06-17 19:00:54 | 분류: MASTER_SPEC]
본 문서는 안정성검사, 상태 검증, Reset Complete 및 READY_AFTER_RESET 정책을 정의한다.
---
1. 목적
---
본 프로젝트는 상태 신뢰성을 최우선으로 한다.
---
2. 기본 철학
---
확신할 수 없는 상태는 운영하지 않는다.
---
3. 안정성검사 정의
---
상태 신뢰성 검증 절차.
---
4. 안정성검사 목적
---
운영 가능 여부 판정.
---
5. 검사 대상
---
보유.
---
6. 검사 대상
---
주문.
---
7. 검사 대상
---
체결.
---
8. 검사 대상
---
파일 상태.
---
9. 검사 대상
---
Cycle State.
---
10. 검사 대상
---
운영 상태.
---
11. 검사 결과
---
정상.
비정상.
---
12. 정상 결과
---
운영 가능.
---
13. 비정상 결과
---
검토관리.
---
14. Reset Complete 정의
---
새로운 운영 사이클 시작 가능 상태.
---
15. 핵심 원칙
---
매도완료
=
Reset Complete
아님.
---
16. 핵심 원칙
---
청산완료
=
Reset Complete
아님.
---
17. Reset Complete 조건
---
보유 없음.
---
18. Reset Complete 조건
---
종료 주문 정리 완료.
---
19. Reset Complete 조건
---
상태 정리 완료.
---
20. Reset Complete 조건
---
안정성검사 통과.
---
21. Reset Complete 조건
---
재판정 완료.
---
22. 상태 흐름
---
EXITING
↓
RESETTING
↓
READY_AFTER_RESET
---
23. READY_AFTER_RESET 정의
---
재운영 가능 상태.
---
24. READY_AFTER_RESET 의미
---
새 사이클 시작 가능.
---
25. 문제 발견
---
TROUBLE.
---
26. TROUBLE 처리
---
검토관리.
---
27. 재시작 관계
---
안정성검사 필수.
---
28. 긴급정지 해제 관계
---
안정성검사 필수.
---
29. Reset Complete 핵심 철학
---
종료와 복귀는 다르다.
Reset Complete 이후에만 새 운영을 시작할 수 있다.
---
30. PART 18 핵심 요약
---
매도완료는 Reset Complete가 아니다.
안정성검사와 재판정을 통과해야 READY_AFTER_RESET 상태가 된다.
END OF PART 18
MASTER_SPEC_v3.0_BASELINE
제5권
PART 19. OpenAPI 연동 정책
문서등급 : 최상위 기준 문서
작성일 : 2026-06
본 문서는 키움 OpenAPI 연동 원칙과 데이터 우선순위를 정의한다.
---
1. 목적
---
실계좌 정보를 최우선 기준으로 사용한다.
---
2. 기본 철학
---
추정보다 실계좌.
---
3. OpenAPI 역할
---
최상위 외부 데이터 원천.
---
4. 계좌조회
---
계좌 상태 확인.
---
5. 잔고조회
---
보유 상태 확인.
---
6. 미체결조회
---
주문 상태 확인.
---
7. 실시간 체결
---
체결 상태 확인.
---
8. 우선순위
---
실계좌
↓
현재 조회 결과
↓
state
↓
config
↓
orders
---
9. 데이터 충돌
---
실계좌 우선.
---
10. 재시작 관계
---
실계좌 기준 재판정.
---
11. 긴급정지 해제 관계
---
실계좌 기준 재판정.
---
12. OpenAPI 핵심 철학
---
실계좌 정보가 모든 내부 데이터보다 우선한다.
---
13. PART 19 핵심 요약
---
OpenAPI는 최상위 데이터 원천이다.
모든 재판정은 실계좌 기준으로 수행한다.
END OF PART 19
MASTER_SPEC_v3.0_BASELINE
제5권
PART 20. 폐기정책 및 역사구조
문서등급 : 최상위 기준 문서
작성일 : 2026-06
본 문서는 폐기된 정책, 역사적 구조 및 호환성 원칙을 정의한다.
---
1. 목적
---
과거 구조와 현재 구조를 구분한다.
---
2. 기본 철학
---
역사는 보존한다.
정책은 최신 기준을 사용한다.
---
3. 폐기 구조 정의
---
현재 사용하지 않는 구조.
---
4. 대표 폐기 사례
---
상태 복원 기반 재시작.
---
5. 대표 폐기 사례
---
루틴 중심 종목 구조.
---
6. 대표 폐기 사례
---
자동 복귀 구조.
---
7. 현재 기준
---
재판정 기반 운영.
---
8. 현재 기준
---
종목 중심 구조.
---
9. 현재 기준
---
검토관리 우선 구조.
---
10. 역사 기록 목적
---
정책 변화 추적.
---
11. 호환성 원칙
---
기존 데이터를 무조건 유지하지 않는다.
---
12. 호환성 기준
---
안전성 우선.
---
13. 폐기정책 핵심 철학
---
과거는 참고자료이다.
현재 정책이 우선한다.
---
14. PART 20 핵심 요약
---
상태 복원 구조는 폐기되었다.
종목 중심 구조가 현재 기준이다.
검토관리 우선 철학을 사용한다.
END OF PART 20

[출처: 새 폴더\MASTER_SPEC_v3.0_BASELINE_1_4.txt | 기준일: 2026-06-17 | 수정시각: 2026-06-17 18:46:46 | 분류: MASTER_SPEC]
MASTER_SPEC_v3.0_BASELINE
제1권
PART 01. 프로젝트 철학 및 설계 원칙
문서등급 : 최상위 기준 문서
작성일 : 2026-06
---
1. 문서 목적
---
본 문서는 키움 OpenAPI 기반 자동매매 프로젝트의 최상위 기준 문서이다.
본 문서는 프로그램의 기능 설명서가 아니다.

[출처: 새 폴더\MASTER_SPEC_v3.0_BASELINE_1_4.txt | 기준일: 2026-06-17 | 수정시각: 2026-06-17 18:46:46 | 분류: MASTER_SPEC]
본 문서는 현재 시점까지 확정된 프로젝트 철학, 구조, 운영원칙, 상태체계, 정책체계를 기록하는 기준 문서이다.
모든 구현은 본 문서를 기준으로 수행한다.
---
2. Baseline 문서 정의
---
본 문서는 최종 완성 문서가 아니다.
본 문서는 현재까지 검증된 정책과 구조를 기록한 Baseline 문서이다.
실제 구현 과정,
실계좌 연동 과정,
실전 운영 과정에서 발견되는 문제점과 개선사항은 향후 MASTER_SPEC 차기 버전에 반영될 수 있다.
문서의 목적은 변경을 금지하는 것이 아니라 변경의 기준점을 제공하는 것이다.
---
3. 프로젝트 최종 목표
---
본 프로젝트의 목표는 단순 자동매매 프로그램 제작이 아니다.
본 프로젝트의 목표는 다음과 같다.
1. 종목 중심 자동매매 플랫폼 구축
2. 안정적 운영 체계 구축
3. 실계좌 기준 자동매매 엔진 구축
4. 검토관리 기반 안전 운영 체계 구축
5. 루틴 확장형 자동매매 플랫폼 구축
---
4. 구현 우선순위 원칙
---
본 프로젝트는 다음 우선순위를 따른다.
정책
↓
구조
↓
구현
↓
최적화
정책이 확정되지 않은 기능은 구현하지 않는다.
---
5. 정책 우선 원칙
---
패치가 정책을 만들지 않는다.
정책이 패치를 만든다.
문제 발생 시 먼저 정책을 검토한다.
정책이 불명확한 상태에서 임시 패치를 수행하지 않는다.
---
6. 구조 우선 원칙
---
기능 추가보다 구조 안정성을 우선한다.
구조가 불안정한 상태에서 기능을 계속 추가하지 않는다.
장기 유지보수가 가능한 구조를 우선한다.
---
7. 안전성 우선 원칙
---
수익보다 안전성을 우선한다.
자동매매보다 안정적 운영을 우선한다.
운영 불확실성이 존재하는 경우 자동매매를 중단할 수 있다.
---
8. 실계좌 우선 원칙
---
실계좌 정보는 모든 내부 정보보다 우선한다.
우선순위는 다음과 같다.
실계좌 정보
↓
현재 조회 결과
↓
state 정보
↓
설정 파일
↓
과거 기록
내부 데이터가 실계좌와 충돌할 경우 실계좌 정보를 기준으로 한다.
---
9. 상태 복원 금지 원칙
---
프로그램 재시작 시 이전 상태를 복원하지 않는다.
프로그램은 현재 상태를 조회하고 재판정한다.
과거 상태를 추정 복원하는 구조를 사용하지 않는다.
---
10. 재판정 원칙
---
프로그램 시작
↓
계좌조회
↓
잔고조회
↓
미체결조회
↓
안정성검사
↓
상태 재판정
↓
정상
감시/대기
↓
이상
검토관리
---
11. 검토관리 우선 원칙
---
확신할 수 없는 상태는 운영하지 않는다.
판단이 불가능한 상태는 검토관리로 이동한다.
자동매매보다 검토관리를 우선한다.
---
12. 자동 복귀 금지 원칙
---
문제가 발생한 종목은 자동 복귀하지 않는다.
복귀 전 반드시 다음 절차를 수행한다.
안정성검사
↓
문제 해결
↓
상태 재판정
↓
복귀 승인
---
13. 긴급정지 원칙
---
긴급정지는 운영 중단 기능이다.
긴급정지 해제는 프로그램 재시작과 동일 수준으로 취급한다.
해제 후 반드시 안정성검사를 수행한다.
---
14. 루틴 철학
---
루틴은 신호 생성기이다.
루틴은 전략을 표현한다.
루틴은 주문을 실행하지 않는다.
루틴은 상태를 변경하지 않는다.
루틴은 예산을 판단하지 않는다.
---
15. 메인엔진 철학
---
메인엔진은 다음을 담당한다.
주문
상태
예산
검토관리
안정성검사
루틴은 판단을 제공하고,
메인엔진은 실행을 담당한다.
---
16. Position Policy 철학
---
BUY 신호는 진입 허가가 아니다.
루틴의 BUY 신호는 Position Policy를 통과해야 한다.
Position Policy는 실제 진입 가능 여부를 결정한다.
---
17. Price Policy 철학
---
가격 조건은 신호보다 우선할 수 있다.
BUY 신호가 발생하더라도 가격 조건을 충족하지 못하면 주문하지 않는다.
---
18. 회차 철학
---
BUY 신호 수와 실제 회차 수는 다를 수 있다.
회차는 체결 결과를 기준으로 증가한다.
회차는 신호 발생 횟수가 아니다.
---
19. 검토관리 철학
---
검토관리는 오류 목록이 아니다.
검토관리는 독립 운영 체계이다.
검토관리는 안전장치이다.
---
20. 종료 철학
---
매도완료와 종료완료는 다르다.
종료완료와 복귀는 다르다.
Reset Complete 이후에만 새로운 운영을 시작할 수 있다.
---
21. 문서 관리 원칙
---
MASTER_SPEC는 프로젝트의 기준 문서이다.
모든 정책 변경은 MASTER_SPEC 갱신을 원칙으로 한다.
정책이 변경되면 구현도 함께 검토한다.
---
22. PART 01 핵심 요약
---
본 프로젝트는 정책 중심 구조를 사용한다.
실계좌 정보는 모든 내부 정보보다 우선한다.
과거 상태 복원을 사용하지 않는다.
확신할 수 없는 상태는 검토관리로 이동한다.
루틴은 신호 생성기이며 주문을 수행하지 않는다.
Position Policy와 Price Policy는 루틴과 주문 사이의 판단 계층이다.
안전성은 수익보다 우선한다.
MASTER_SPEC는 현재 시점의 Baseline 문서이다.
END OF PART 01
MASTER_SPEC_v3.0_BASELINE
제1권
PART 02. 용어 정의
문서등급 : 최상위 기준 문서
작성일 : 2026-06
본 문서는 프로젝트 전 영역에서 사용되는 용어를 정의한다.
본 문서에 정의된 용어는 모든 정책 문서, 구현 문서, 테스트 문서, 운영 문서보다 우선한다.
---
1. 용어 정의 목적
---
본 프로젝트는 장기간 개발 및 운영을 전제로 한다.
동일 개념을 여러 용어로 표현하면 정책 충돌이 발생할 수 있다.
따라서 본 문서는 프로젝트 내 용어를 표준화한다.
---
2. 종목
---
자동매매 대상으로 등록된 개별 주식.
종목은 프로젝트의 기본 관리 단위이다.
---
3. 종목코드
---
키움 OpenAPI 기준 종목 식별자.
종목명보다 우선한다.
종목명 변경 시에도 종목코드는 유지된다.
---
4. 종목명
---
사용자 표시용 명칭.
식별 기준으로 사용하지 않는다.
---
5. 루틴
---
매매 신호를 생성하는 전략 단위.
루틴은 주문을 실행하지 않는다.
---
6. 루틴 패키지
---
자동 인식 가능한 루틴 폴더 구조.
예시
MACD매매루틴
routine.json
rules.json
version.txt
readme.md
samples
---
7. 신호
---
루틴이 생성하는 판단 결과.
예시
BUY
SELL
---
8. BUY 신호
---
매수 후보 발생 신호.
주문을 의미하지 않는다.
---
9. SELL 신호
---
매도 후보 발생 신호.
주문을 의미하지 않는다.
---
10. 주문
---
메인엔진이 생성한 실제 주문 요청.
---
11. 체결
---
실제 시장에서 주문이 성립된 상태.
---
12. 부분체결
---
주문 수량의 일부만 체결된 상태.
---
13. 미체결
---
주문이 체결되지 않은 상태.
---
14. 미수
---
정상 결제가 완료되지 않은 비정상 상태.
청산 대상이 아니다.
검토관리 대상이다.
---
15. 미도
---
매도 관련 비정상 상태.
정상 운영 대상이 아니다.
검토관리 대상이다.
---
16. 보유
---
현재 계좌가 보유 중인 주식 상태.
---
17. 감시/대기
---
정상 운영 가능 상태.
신호 감시 상태.
---
18. 매수/매도
---
정상 운영 중 상태.
---
19. 조기마감
---
운영자가 지정하거나 정책에 의해 시작되는 종료 절차.
최종 매도신호 전까지 매수 가능.
---
20. 자동마감
---
시간 정책에 의해 자동 시작되는 종료 절차.
최종 매도신호 전까지 매수 가능.
---
21. 청산
---
보유를 제거하는 절차.
마감과 동일 개념이 아니다.
---
22. 이월
---
당일 종료하지 않고 다음 운영일로 넘기는 정책.
---
23. 검토관리
---
독립 운영 체계.
문제 종목을 관리하는 영역.
---
24. 안정성검사
---
현재 상태의 신뢰성을 확인하는 절차.
---
25. 긴급정지
---
전체 운영을 즉시 중단하는 기능.
---
26. 긴급정지 해제
---
프로그램 재시작과 동일 수준의 재판정 절차.
---
27. 재시작
---
프로그램 재실행.
과거 상태 복원을 의미하지 않는다.
---
28. 재판정
---
현재 실계좌 기준 상태를 다시 결정하는 절차.
---
29. Reset Complete
---
새로운 사이클 시작이 가능한 상태.
매도완료와 동일 개념이 아니다.
---
30. 사용자 상태
---
사용자에게 표시되는 상태.
감시/대기
매수/매도
조기마감
자동마감
청산
검토관리
---
31. Cycle State
---
내부 운영 상태.
READY
RUNNING
EXITING
RESETTING
READY_AFTER_RESET
TROUBLE
---
32. READY
---
운영 준비 상태.
---
33. RUNNING
---
정상 운영 상태.
---
34. EXITING
---
종료 절차 진행 상태.
---
35. RESETTING
---
종료 후 정리 상태.
---
36. READY_AFTER_RESET
---
Reset Complete 이후 재운영 가능 상태.
---
37. TROUBLE
---
운영 불가 상태.
자동 복귀하지 않는다.
---
38. Position Policy
---
신호와 주문 사이의 판단 계층.
실제 진입 가능 여부를 결정한다.
---
39. Price Policy
---
가격 조건 판단 정책.
추가진입 여부를 결정한다.
---
40. 회차
---
실제 체결 기준 매수 단계.
신호 발생 횟수와 다를 수 있다.
---
41. 추가진입
---
기존 보유 상태에서 추가 매수하는 행위.
---
42. 완충영역
---
자동 위험감축 영역.
단순 경고 기능이 아니다.
---
43. 위험감축
---
위험 노출을 줄이는 자동 절차.
---
44. 전체예산
---
프로그램 전체 사용 가능 자금.
---
45. 루틴예산
---
루틴별 사용 제한 자금.
---
46. 종목예산
---
종목별 사용 제한 자금.
---
47. ATS
---
정규장 외 추가 거래 시간대 운영 정책.
수동운영 전용.
---
48. OpenAPI
---
키움 OpenAPI 시스템.
프로젝트의 최상위 외부 데이터 원천.
---
49. 실계좌 정보
---
실제 계좌 조회 결과.
모든 내부 정보보다 우선한다.
---
50. Baseline
---
현재 시점까지 검증된 기준 문서.
최종 완성 문서를 의미하지 않는다.
---
51. 용어 사용 원칙
---
본 문서에서 정의된 용어를 우선 사용한다.
유사 용어를 혼용하지 않는다.
정책 문서와 구현 문서의 용어를 일치시킨다.
---
52. PART 02 핵심 요약
---
용어 충돌은 정책 충돌로 이어질 수 있다.
본 문서의 정의를 프로젝트 표준 용어로 사용한다.
동일 개념에 복수 용어 사용을 금지한다.
END OF PART 02
MASTER_SPEC_v3.0_BASELINE
제1권
PART 02. 용어 정의
문서등급 : 최상위 기준 문서
작성일 : 2026-06
본 문서는 프로젝트 전 영역에서 사용되는 용어를 정의한다.
본 문서에 정의된 용어는 모든 정책 문서, 구현 문서, 테스트 문서, 운영 문서보다 우선한다.
---
1. 용어 정의 목적
---
본 프로젝트는 장기간 개발 및 운영을 전제로 한다.
동일 개념을 여러 용어로 표현하면 정책 충돌이 발생할 수 있다.
따라서 본 문서는 프로젝트 내 용어를 표준화한다.
---
2. 종목
---
자동매매 대상으로 등록된 개별 주식.
종목은 프로젝트의 기본 관리 단위이다.
---
3. 종목코드
---
키움 OpenAPI 기준 종목 식별자.
종목명보다 우선한다.
종목명 변경 시에도 종목코드는 유지된다.
---
4. 종목명
---
사용자 표시용 명칭.
식별 기준으로 사용하지 않는다.
---
5. 루틴
---
매매 신호를 생성하는 전략 단위.
루틴은 주문을 실행하지 않는다.
---
6. 루틴 패키지
---
자동 인식 가능한 루틴 폴더 구조.
예시
MACD매매루틴
routine.json
rules.json
version.txt
readme.md
samples
---
7. 신호
---
루틴이 생성하는 판단 결과.
예시
BUY
SELL
---
8. BUY 신호
---
매수 후보 발생 신호.
주문을 의미하지 않는다.
---
9. SELL 신호
---
매도 후보 발생 신호.
주문을 의미하지 않는다.
---
10. 주문
---
메인엔진이 생성한 실제 주문 요청.
---
11. 체결
---
실제 시장에서 주문이 성립된 상태.
---
12. 부분체결
---
주문 수량의 일부만 체결된 상태.
---
13. 미체결
---
주문이 체결되지 않은 상태.
---
14. 미수
---
정상 결제가 완료되지 않은 비정상 상태.
청산 대상이 아니다.
검토관리 대상이다.
---
15. 미도
---
매도 관련 비정상 상태.
정상 운영 대상이 아니다.
검토관리 대상이다.
---
16. 보유
---
현재 계좌가 보유 중인 주식 상태.
---
17. 감시/대기
---
정상 운영 가능 상태.
신호 감시 상태.
---
18. 매수/매도
---
정상 운영 중 상태.
---
19. 조기마감
---
운영자가 지정하거나 정책에 의해 시작되는 종료 절차.
최종 매도신호 전까지 매수 가능.
---
20. 자동마감
---
시간 정책에 의해 자동 시작되는 종료 절차.
최종 매도신호 전까지 매수 가능.
---
21. 청산
---
보유를 제거하는 절차.
마감과 동일 개념이 아니다.
---
22. 이월
---
당일 종료하지 않고 다음 운영일로 넘기는 정책.
---
23. 검토관리
---
독립 운영 체계.
문제 종목을 관리하는 영역.
---
24. 안정성검사
---
현재 상태의 신뢰성을 확인하는 절차.
---
25. 긴급정지
---
전체 운영을 즉시 중단하는 기능.
---
26. 긴급정지 해제
---
프로그램 재시작과 동일 수준의 재판정 절차.
---
27. 재시작
---
프로그램 재실행.
과거 상태 복원을 의미하지 않는다.
---
28. 재판정
---
현재 실계좌 기준 상태를 다시 결정하는 절차.
---
29. Reset Complete
---
새로운 사이클 시작이 가능한 상태.
매도완료와 동일 개념이 아니다.
---
30. 사용자 상태
---
사용자에게 표시되는 상태.
감시/대기
매수/매도
조기마감
자동마감
청산
검토관리
---
31. Cycle State
---
내부 운영 상태.
READY
RUNNING
EXITING
RESETTING
READY_AFTER_RESET
TROUBLE
---
32. READY
---
운영 준비 상태.
---
33. RUNNING
---
정상 운영 상태.
---
34. EXITING
---
종료 절차 진행 상태.
---
35. RESETTING
---
종료 후 정리 상태.
---
36. READY_AFTER_RESET
---
Reset Complete 이후 재운영 가능 상태.
---
37. TROUBLE
---
운영 불가 상태.
자동 복귀하지 않는다.
---
38. Position Policy
---
신호와 주문 사이의 판단 계층.
실제 진입 가능 여부를 결정한다.
---
39. Price Policy
---
가격 조건 판단 정책.
추가진입 여부를 결정한다.
---
40. 회차
---
실제 체결 기준 매수 단계.
신호 발생 횟수와 다를 수 있다.
---
41. 추가진입
---
기존 보유 상태에서 추가 매수하는 행위.
---
42. 완충영역
---
자동 위험감축 영역.
단순 경고 기능이 아니다.
---
43. 위험감축
---
위험 노출을 줄이는 자동 절차.
---
44. 전체예산
---
프로그램 전체 사용 가능 자금.
---
45. 루틴예산
---
루틴별 사용 제한 자금.
---
46. 종목예산
---
종목별 사용 제한 자금.
---
47. ATS
---
정규장 외 추가 거래 시간대 운영 정책.
수동운영 전용.
---
48. OpenAPI
---
키움 OpenAPI 시스템.
프로젝트의 최상위 외부 데이터 원천.
---
49. 실계좌 정보
---
실제 계좌 조회 결과.
모든 내부 정보보다 우선한다.
---
50. Baseline
---
현재 시점까지 검증된 기준 문서.
최종 완성 문서를 의미하지 않는다.
---
51. 용어 사용 원칙
---
본 문서에서 정의된 용어를 우선 사용한다.
유사 용어를 혼용하지 않는다.
정책 문서와 구현 문서의 용어를 일치시킨다.
---
52. PART 02 핵심 요약
---
용어 충돌은 정책 충돌로 이어질 수 있다.
본 문서의 정의를 프로젝트 표준 용어로 사용한다.
동일 개념에 복수 용어 사용을 금지한다.
END OF PART 02
MASTER_SPEC_v3.0_BASELINE
제1권
PART 03. 프로젝트 구조 및 모듈 책임체계
문서등급 : 최상위 기준 문서
작성일 : 2026-06
본 문서는 프로젝트의 구조, 모듈 분리 원칙, 책임 범위 및 유지보수 기준을 정의한다.
---
1. 목적
---
본 프로젝트는 장기 운영 및 지속적인 기능 확장을 전제로 한다.
프로젝트 규모가 증가함에 따라 단일 파일 중심 구조는 유지보수 위험을 증가시킨다.
따라서 본 문서는 모듈 분리 원칙과 책임 범위를 정의한다.
---
2. 기본 철학
---
기능보다 구조를 우선한다.
구조보다 정책을 우선한다.
정책이 구조를 결정하고,
구조가 구현을 결정한다.
---
3. 구조 분리 목적
---
유지보수성 확보
기능 확장성 확보
오류 추적성 확보
패치 안정성 확보
책임 명확화
---
4. 책임 분리 원칙
---
하나의 모듈은 하나의 주 책임을 가진다.
서로 다른 책임을 하나의 모듈에 혼합하지 않는다.
---
5. 프로젝트 최상위 구조
---
프로젝트는 다음 계층으로 구성한다.
GUI 계층
↓
운영정책 계층
↓
상태관리 계층
↓
주문관리 계층
↓
데이터 저장 계층
↓
OpenAPI 계층
---
6. GUI 계층
---
사용자 인터페이스 담당.
데이터 저장 책임 없음.
주문 실행 책임 없음.
---
7. GUI 계층 역할
---
상태 표시
설정 입력
이벤트 전달
운영 정보 표시
---
8. GUI 계층 금지사항
---
직접 주문 실행 금지
직접 상태 판정 금지
직접 데이터 저장 금지
---
9. 운영정책 계층
---
운영 규칙을 담당한다.
---
10. 운영정책 계층 역할
---
시간 정책
마감 정책
청산 정책
완충 정책
검토관리 정책
---
11. 상태관리 계층
---
현재 상태를 관리한다.
---
12. 상태관리 계층 역할
---
상태 전이
Cycle State
Reset 상태
검토관리 상태
---
13. 주문관리 계층
---
주문 생명주기를 담당한다.
---
14. 주문관리 계층 역할
---
주문 생성
주문 접수
주문 추적
정정
취소
체결 관리
---
15. 데이터 저장 계층
---
설정 및 기록 저장 담당.
---
16. OpenAPI 계층
---
외부 시스템 연동 담당.
---
17. OpenAPI 계층 원칙
---
실계좌 정보가 최상위 기준이다.
---
18. 종목 중심 구조
---
본 프로젝트는 종목 중심 구조를 사용한다.
---
19. 루틴 중심 구조 폐기
---
루틴이 종목을 소유하지 않는다.
---
20. 현재 구조
---
종목이 루틴을 참조한다.
---
21. 중앙 종목 관리
---
모든 종목은 stocks 구조에서 관리한다.
---
22. 종목 독립성 원칙
---
각 종목은 독립 운영 단위이다.
---
23. 종목 데이터 독립성
---
종목 데이터는 종목 폴더 내에서 관리한다.
---
24. 루틴 구조 목적
---
루틴은 전략을 제공한다.
---
25. 루틴 책임
---
신호 생성
조건 판단
필터 적용
---
26. 루틴 금지사항
---
주문 실행 금지
예산 계산 금지
상태 변경 금지
검토관리 지정 금지
---
27. 메인엔진 역할
---
실제 운영 담당.
---
28. 메인엔진 책임
---
주문
상태
예산
검토관리
안정성검사
---
29. 루틴과 메인엔진 관계
---
루틴
↓
신호 생성
↓
메인엔진
↓
실행
---
30. Position Policy 위치
---
루틴과 주문 사이에 존재한다.
---
31. 구조
---
루틴
↓
Position Policy
↓
Price Policy
↓
주문관리
---
32. BUY 신호 의미
---
진입 허가가 아니다.
---
33. SELL 신호 의미
---
청산 허가가 아니다.
---
34. Position Policy 역할
---
진입 가능 여부 판단.
---
35. Price Policy 역할
---
가격 조건 판단.
---
36. 상태체계 구조
---
사용자 상태
*
Cycle State
2중 구조 사용.
---
37. 사용자 상태
---
감시/대기
매수/매도
조기마감
자동마감
청산
검토관리
---
38. 내부 상태
---
READY
RUNNING
EXITING
RESETTING
READY_AFTER_RESET
TROUBLE
---
39. 검토관리 구조
---
검토관리는 독립 운영체계이다.
---
40. 검토관리 책임
---
문제 종목 관리
원인 확인
복귀 관리
---
41. 검토관리 자동복귀 금지
---
문제 해결 전 자동 복귀 금지.
---
42. 재시작 구조
---
복원 구조 사용 안 함.
---
43. 재시작 절차
---
조회
↓
검사
↓
재판정
---
44. 긴급정지 구조
---
긴급정지 해제는 재시작과 동일 절차 사용.
---
45. 구조개선 원칙
---
기능 추가보다 구조 안정성을 우선한다.
---
46. 신규 기능 추가 원칙
---
기존 책임체계를 침범하지 않는다.
---
47. 모듈 분리 원칙
---
파일 크기보다 책임 분리를 우선한다.
---
48. 패치 원칙
---
패치는 정책 검토 후 수행한다.
---
49. 임시 패치 금지
---
정책 없는 임시 수정 금지.
---
50. 구조개선 종료 조건
---
책임이 명확히 분리되었을 때 종료한다.
---
51. 장기 유지보수 원칙
---
현재 구현보다 미래 수정 비용을 우선 고려한다.
---
52. PART 03 핵심 요약
---
프로젝트는 정책 중심 구조를 사용한다.
루틴은 신호 생성기이다.
메인엔진은 실행 담당이다.
종목 중심 구조를 사용한다.
검토관리는 독립 운영체계이다.
재시작은 복원이 아니라 재판정이다.
모든 구조는 장기 유지보수를 기준으로 설계한다.
END OF PART 03
MASTER_SPEC_v3.0_BASELINE
제1권
PART 04. 데이터 저장구조 및 파일 정책
문서등급 : 최상위 기준 문서
작성일 : 2026-06
본 문서는 프로젝트의 데이터 저장구조, 파일 역할, 저장 우선순위 및 데이터 관리 원칙을 정의한다.
---
1. 목적
---
본 프로젝트는 장기간 운영을 전제로 한다.
저장구조는 단순 데이터 보관소가 아니다.
저장구조는 운영 안정성, 복구 판단, 검토관리, 상태 판정의 기반이 된다.
본 문서는 프로젝트 전체 저장체계의 기준을 정의한다.
---
2. 기본 철학
---
설정과 상태를 분리한다.
상태와 주문을 분리한다.
기록과 현재 상태를 분리한다.
모든 데이터는 역할별로 분리 저장한다.
---
3. 저장구조 최상위 원칙
---
저장파일은 실계좌 정보를 대체하지 않는다.
저장파일은 운영 보조수단이다.
실계좌 정보가 최상위 기준이다.
---
4. 데이터 계층
---
설정 계층
↓
상태 계층
↓
주문 계층
↓
기록 계층
↓
보고서 계층
---
5. 최상위 폴더 구조
---
프로젝트는 다음 구조를 사용한다.
stocks/
routines/
logs/
reports/
runtime/
docs/
---
6. stocks 역할
---
등록 종목 저장소.
프로젝트의 핵심 데이터 영역.
---
7. 중앙 종목 구조
---
모든 종목은 stocks 하위에서 관리한다.
루틴별 종목 구조는 사용하지 않는다.
---
8. 종목 독립성 원칙
---
각 종목은 독립 운영 단위이다.
---
9. 종목 폴더 구조
---
예시
stocks/
└ 005930_삼성전자/
```
config.json
state.json
orders.json
```
---
10. 종목 식별 기준
---
종목코드 우선.
---
11. 종목명 기준 금지
---
종목명은 표시용이다.
식별 기준으로 사용하지 않는다.
---
12. config.json 정의
---
종목별 설정 파일.
---
13. config.json 목적
---
운영 설정 저장.
---
14. config.json 저장 대상
---
종목코드
종목명
연결 루틴
개별 시간정책
개별 ATS 정책
개별 청산정책
Position Policy 설정
Price Policy 설정
사용자 설정
---
15. config.json 특징
---
설정 정보만 저장한다.
---
16. config.json 금지사항
---
현재 상태 저장 금지.
---
17. state.json 정의
---
종목 현재 상태 파일.
---
18. state.json 목적
---
운영 상태 기록.
---
19. state.json 저장 대상
---
현재 상태
Cycle State
검토관리 여부
보유 여부
미수 여부
미도 여부
마지막 판정 결과
Reset 필요 여부
TROUBLE 여부
---
20. state.json 특징
---
현재 상태 중심 구조.
---
21. state.json 금지사항
---
실계좌 정보 대체 금지.
---
22. orders.json 정의
---
주문 및 체결 기록 파일.
---
23. orders.json 목적
---
주문 생명주기 추적.
---
24. orders.json 저장 대상
---
주문번호
원주문번호
주문유형
주문수량
주문가격
체결수량
미체결수량
정정주문
취소주문
체결이력
---
25. orders.json 특징
---
삭제보다 보존을 우선한다.
---
26. review.json 정책
---
현재 정본 기준 필수 파일이 아니다.
---
27. 검토관리 저장 원칙
---
검토관리 상태는 기본적으로 state.json에서 관리한다.
---
28. runtime.json 정책
---
현재 정본 기준 필수 종목 파일이 아니다.
---
29. runtime 계층 역할
---
실행 중 보조 데이터 저장.
---
30. runtime 우선 금지
---
실계좌 정보보다 우선할 수 없다.
---
31. stock_library.json 정의
---
전체 등록 종목 관리 파일.
---
32. stock_library.json 역할
---
등록 종목 목록
중복 확인
종목코드 관리
종목명 변경 대응
---
33. operation_policy.json 정의
---
전역 운영정책 저장 파일.
---
34. operation_policy.json 저장 대상
---
정규장 시간
동시호가 정책
ATS 정책
기본 수동정책
기본 시간정책
기본 조기마감 정책
기본 자동마감 정책
기본 청산정책
---
35. routines 구조
---
루틴 패키지 저장소.
---
36. 루틴 폴더 예시
---
routines/
└ MACD매매루틴/
```
routine.json
rules.json
version.txt
readme.md
samples/
```
---
37. logs 역할
---
운영 로그 저장.
---
38. reports 역할
---
보고서 저장.
---
39. docs 역할
---
문서 저장.
---
40. 저장 우선순위
---
실계좌 정보
↓
현재 조회 결과
↓
state.json
↓
config.json
↓
orders.json
↓
과거 로그
---
41. 충돌 발생 시 처리
---
실계좌 정보를 기준으로 한다.
---
42. 재시작 원칙
---
state.json을 그대로 복원하지 않는다.
---
43. 재시작 절차
---
계좌조회
↓
잔고조회
↓
미체결조회
↓
안정성검사
↓
재판정
---
44. 상태 복원 금지
---
과거 상태 추정 복원 금지.
---
45. 파일 손상 정책
---
config.json 손상
↓
안정성검사 대상
---
46. 파일 손상 정책
---
state.json 손상
↓
안정성검사 대상
---
47. 파일 손상 정책
---
orders.json 손상
↓
안정성검사 대상
---
48. 저장구조 확장 원칙
---
신규 파일 추가 가능.
---
49. 저장구조 확장 조건
---
기존 책임 침범 금지.
---
50. 데이터 관리 핵심 철학
---
config.json은 설정이다.
state.json은 상태이다.
orders.json은 주문이다.
설정과 상태를 분리한다.
상태와 주문을 분리한다.
실계좌 정보는 모든 저장파일보다 우선한다.
저장파일은 복원 수단이 아니다.
프로그램은 현재 상태를 재판정한다.
---
51. PART 04 핵심 요약
---
프로젝트는 종목 중심 저장구조를 사용한다.
config.json
state.json
orders.json
구조를 기본 구조로 사용한다.
실계좌 정보가 최상위 기준이다.
저장파일은 운영 보조수단이다.
재시작 시 상태 복원을 수행하지 않는다.
END OF PART 04

[출처: 마스터스펙\MASTER_SPEC_v2.5_REBUILD_WORKSPACE\MASTER_SPEC_v2.5_REBUILD_WORKSPACE\00_INDEX_v2.5_DRAFT_2026-06-17.txt | 기준일: 2026-06-17 | 수정시각: 2026-06-17 16:56:46 | 분류: MASTER_SPEC]
00_INDEX_v2.5_DRAFT_2026-06-17
MASTER_SPEC v2.5 DRAFT 문서 인덱스
--------------------------------------------------
01_프로젝트핵심철학
프로젝트 최상위 철학
--------------------------------------------------
02_시스템구조
폴더 구조
모듈 구조
루틴 구조
--------------------------------------------------
03_종목관리정책
종목 등록
루틴 지정
안정성검사
종목 상태 관리
--------------------------------------------------
04_시간운영정책
정규장
ATS
조기마감
자동마감
청산
긴급정지
재시작
--------------------------------------------------
05_예산정책
전체예산
루틴예산
종목예산
완충영역
--------------------------------------------------
06_검토관리정책
검토관리
복귀
미지정
삭제
데이터 불일치
--------------------------------------------------
07_포지션구축철학
BUY=매수모드
SELL=포지션종료
매수회차
지속매수
평단 중심
--------------------------------------------------
08_MACD루틴정책

[출처: 마스터스펙\MASTER_SPEC_v2.5_REBUILD_WORKSPACE\MASTER_SPEC_v2.5_REBUILD_WORKSPACE\10_폐기정책_v2.5_DRAFT_2026-06-17.txt | 기준일: 2026-06-17 | 수정시각: 2026-06-17 16:55:36 | 분류: 운영정책]
10_폐기정책_v2.5_DRAFT_2026-06-17
제10부 폐기정책
본 문서는 정책 폐기 및 이관 원칙을 정의한다.
--------------------------------------------------
1. 기본 원칙
확정 정책은 임의 삭제하지 않는다.
정책 변경 시 기존 정책을 제거하지 않는다.
--------------------------------------------------
2. 폐기 절차
기존 정책
↓
검토
↓
대체 정책 확정
↓
폐기정책 이동
--------------------------------------------------
3. 기록 보존
폐기된 정책도 기록을 유지한다.
프로젝트 이력 보존 목적.
--------------------------------------------------
4. 폐기 사유
구조적 문제
운영상 문제
정책 충돌
상위 철학 위반
--------------------------------------------------
5. 정책 충돌
정책 충돌 발생 시 상위 문서를 우선 적용.
01 프로젝트핵심철학
↓
07 포지션구축철학
↓
08 MACD루틴정책
순으로 적용.
--------------------------------------------------
6. 용어 폐기 사례
무결성검사
→ 안정성검사
시작 컬럼
→ 현황 컬럼
--------------------------------------------------
7. 연구정책과 폐기정책
연구정책은 폐기정책이 아니다.
연구정책은 보류 상태로 관리.
--------------------------------------------------
8. 최종 원칙
삭제보다 이관을 우선한다.
기존 결정사항의 추적 가능성을 유지한다.

[출처: 마스터스펙\MASTER_SPEC_v2.5_REBUILD_WORKSPACE\MASTER_SPEC_v2.5_REBUILD_WORKSPACE\09_연구정책_v2.5_DRAFT_2026-06-17.txt | 기준일: 2026-06-17 | 수정시각: 2026-06-17 16:55:00 | 분류: 운영정책]
09_연구정책_v2.5_DRAFT_2026-06-17
제9부 연구정책
본 문서는 확정 정책으로 승격되지 않은 연구 정책을 정의한다.
연구정책은 폐기정책이 아니다.
실전 검증과 구현 검증을 통해 정식 정책으로 승격될 수 있다.
--------------------------------------------------
1. 기본 원칙
연구정책은 프로젝트의 발전 가능성을 보존하기 위한 영역이다.
확정 정책과 분리하여 관리한다.
--------------------------------------------------
2. 승격 원칙
연구정책
↓
구현
↓
테스트
↓
실전 검증
↓
정식 정책 승격
--------------------------------------------------
3. 능동매수 엔진
연구 진행 대상.
기존 수동적 신호 대응을 보완하기 위한 정책.
--------------------------------------------------
4. 평단괴리 보정
현재가와 평단의 괴리를 분석.
포지션 구축 효율 개선 목적.
--------------------------------------------------
5. 포지션구축 보정
포지션 구축 과정의 비효율 개선.
평단 중심 철학과 연계.
--------------------------------------------------
6. 시장상황 보정
시장 상태에 따른 정책 조정 연구.
--------------------------------------------------
7. 다중매수 확장
다중호가매수
다중지점매수
가중배분
사용자지정배분
확장 연구 가능.
--------------------------------------------------
8. 주문 최적화
목표체결율 개선.
미체결 감소.
부분체결 대응 개선.
--------------------------------------------------
9. 자금관리 확장
루틴예산
종목예산
완충영역
확장 연구 가능.
--------------------------------------------------
10. 연구정책 관리
연구정책은 삭제하지 않는다.
보류 또는 승격으로 관리한다.
--------------------------------------------------
11. 최종 원칙
연구정책은 미래 확장을 위한 자산이다.
충분한 검증 없이 확정 정책으로 승격하지 않는다.

[출처: 마스터스펙\MASTER_SPEC_v2.5_REBUILD_WORKSPACE\MASTER_SPEC_v2.5_REBUILD_WORKSPACE\02_시스템구조_v2.5_DRAFT_2026-06-17.txt | 기준일: 2026-06-17 | 수정시각: 2026-06-17 16:52:14 | 분류: MASTER_SPEC]
02_시스템구조_v2.5_DRAFT_2026-06-17
제2부 시스템 구조
본 문서는 프로젝트의 시스템 구조를 정의한다.
--------------------------------------------------
1. 구조 분리 원칙
프로젝트는 기능별 모듈 분리를 원칙으로 한다.
하나의 거대한 파일보다 역할별 모듈 분리를 우선한다.
유지보수성과 안정성을 최우선으로 고려한다.
--------------------------------------------------
2. 최상위 구조
프로젝트는 다음 구조를 기본으로 한다.
stocks
routines
runtime
logs
--------------------------------------------------
3. stocks
종목 데이터 저장 영역.
중앙 종목폴더 정책 적용.
모든 종목 관련 정보는 stocks 기준으로 관리.
--------------------------------------------------
4. 중앙 종목폴더 정책
단일 원본 구조 적용.
종목 데이터 중복 저장 금지.
종목 정보는 중앙 종목폴더 기준으로 관리.
--------------------------------------------------
5. routines
루틴 패키지 저장 영역.
루틴은 독립 패키지 단위로 관리.
--------------------------------------------------
6. 루틴 패키지 구조
예시
루틴명/
routine.json
rules.json
readme.md
version.txt
--------------------------------------------------
7. routine.json
루틴 기본 정보 저장.
루틴 이름.
루틴 버전.
루틴 설명.
기본 설정.
--------------------------------------------------
8. rules.json
매매 규칙 저장.
매수 조건.
매도 조건.
필터 조건.
운영 옵션.
--------------------------------------------------
9. readme.md
루틴 설명 문서.
--------------------------------------------------
10. version.txt
루틴 버전 관리.
--------------------------------------------------
11. 루틴 자동 인식
루틴 패키지 배치 시 자동 인식.
별도 설치 절차 없음.
별도 복원 절차 없음.
--------------------------------------------------
12. 루틴 등록
파일 배치만으로 등록 가능.
--------------------------------------------------
13. 루틴 복원
파일 복사만으로 복원 가능.
--------------------------------------------------
14. 루틴 삭제
루틴 삭제 시 연결 종목 보호 정책 적용.
필요 시 검토관리 연계.
--------------------------------------------------
15. runtime
실행 중 생성 데이터 저장.
임시 데이터 관리.
--------------------------------------------------
16. logs
로그 저장 영역.
운영 기록.
오류 기록.
진단 기록.
--------------------------------------------------
17. GUI 구조
기능별 GUI 분리 원칙 적용.
--------------------------------------------------
18. 주요 GUI 모듈
gui_main.py
AutoTradeSettingWindow
StockRegisterWindow
RoutineAssignWindow
기타 기능 창
--------------------------------------------------
19. 구조개선 원칙
대형 파일 집중 구조 지양.
기능별 모듈 분리 우선.
--------------------------------------------------
20. 루틴과 메인 분리
루틴
= 전략
메인
= 실행
구조 유지.
--------------------------------------------------
21. 주문 계층
루틴
↓
신호
↓
메인
↓
주문
↓
체결
--------------------------------------------------
22. 자금 계층
전체예산
↓
루틴예산
↓
종목예산
--------------------------------------------------
23. 운영 계층
시간운영
↓
마감
↓
청산
↓
검토관리
--------------------------------------------------
24. 안정성 원칙
단일 모듈 오류가 전체 시스템 오류로 확장되지 않아야 한다.
--------------------------------------------------
25. 최종 원칙
구조는 단순해야 한다.
기능은 분리되어야 한다.
루틴은 교체 가능해야 한다.
종목 데이터는 보호되어야 한다.

[출처: 마스터스펙\MASTER_SPEC_v2.5_REBUILD_WORKSPACE\MASTER_SPEC_v2.5_REBUILD_WORKSPACE\03_종목관리정책_v2.5_DRAFT_2026-06-17.txt | 기준일: 2026-06-17 | 수정시각: 2026-06-17 16:51:24 | 분류: 운영정책]
03_종목관리정책_v2.5_DRAFT_2026-06-17
제3부 종목관리 정책
본 문서는 종목관리 정책을 정의한다.
종목관리는 프로젝트의 기본 운영 단위이다.
--------------------------------------------------
1. 기본 원칙
모든 종목은 독립적으로 관리한다.
한 종목의 문제는 다른 종목에 영향을 주지 않아야 한다.
--------------------------------------------------
2. 종목 등록
종목 등록은 종목관리의 시작 단계이다.
등록 전 기본 검증을 수행한다.
--------------------------------------------------
3. 중복 등록
동일 종목 중복 등록 금지.
이미 등록된 종목은 재등록 불가.
--------------------------------------------------
4. 오류 종목
오류 종목은 등록 불가.
종목 정보 검증 실패 시 등록 거부.
--------------------------------------------------
5. 종목 폴더 정책
중앙 종목폴더 단일 원본 정책 적용.
모든 종목 데이터는 stocks 폴더 기준으로 관리.
--------------------------------------------------
6. 종목 데이터
종목별 데이터는 독립 관리.
종목 삭제 시 해당 데이터 처리 정책 적용.
--------------------------------------------------
7. 루틴 지정
종목은 루틴과 연결 가능.
하나의 종목은 지정된 루틴 정책을 따른다.
--------------------------------------------------
8. 루틴 해제
루틴 연결 제거 가능.
해제 후 미지정 상태로 전환 가능.
--------------------------------------------------
9. 루틴 변경
기존 루틴 해제 후 신규 루틴 지정 가능.
--------------------------------------------------
10. 루틴 패키지 구조
루틴은 패키지 단위로 관리.
예시
routine.json
rules.json
readme.md
version.txt
--------------------------------------------------
11. 루틴 자동 인식
루틴 파일 배치 시 자동 인식 가능.
별도 설치 절차를 요구하지 않는다.
--------------------------------------------------
12. 루틴 복원
루틴 패키지 복원 시 자동 등록 가능.
--------------------------------------------------
13. 루틴 삭제
루틴 삭제 시 연결 종목 보호 정책 적용.
문제 발생 시 검토관리 연계 가능.
--------------------------------------------------
14. 종목 위치
종목은 다음 위치 중 하나에 존재한다.
운영중
감시/대기
검토관리
미지정
--------------------------------------------------
15. 검토관리 이동
정책에 따라 자동 또는 수동 이동 가능.
--------------------------------------------------
16. 복귀
검토관리에서 원래 위치 복귀 가능.
--------------------------------------------------
17. 미지정
루틴 연결 없이 종목 보관 가능.
--------------------------------------------------
18. 삭제
종목 제거 가능.
삭제 정책은 검토관리 삭제와 구분한다.
--------------------------------------------------
19. 안정성검사
정식 명칭
안정성검사
사용.
무결성검사 명칭 사용 금지.
--------------------------------------------------
20. 안정성검사 목적
종목 상태 점검.
파일 상태 점검.
루틴 연결 상태 점검.
운영 가능 여부 점검.
--------------------------------------------------
21. 안정성검사 결과
정상
문제 발견
검토 필요
상태 반환 가능.
--------------------------------------------------
22. 재시작 연계
프로그램 재시작 후 종목 재검사 수행.
문제 종목은 검토관리 이동 가능.
--------------------------------------------------
23. 긴급정지 연계
긴급정지 해제 후 안정성검사 수행.
문제 종목은 검토관리 이동 가능.
--------------------------------------------------
24. 종목 상태 표시
감시/대기
매수
매도
조기마감
자동마감
청산
검토관리
--------------------------------------------------
25. 최종 원칙
종목은 프로젝트의 기본 관리 단위이다.
종목 정보의 독립성 및 안정성을 최우선으로 한다.

[출처: 마스터스펙\MASTER_SPEC_v2.5_REBUILD_WORKSPACE\MASTER_SPEC_v2.5_REBUILD_WORKSPACE\05_예산정책_v2.5_DRAFT_2026-06-17.txt | 기준일: 2026-06-17 | 수정시각: 2026-06-17 16:49:50 | 분류: 운영정책]
05_예산정책_v2.5_DRAFT_2026-06-17
제5부 예산 정책
본 문서는 프로젝트의 예산 관리 정책을 정의한다.
예산 정책은 루틴보다 상위 정책이다.
--------------------------------------------------
1. 기본 원칙
루틴은 매수 의사를 표현한다.
예산은 메인 시스템이 관리한다.
예산 부족은 루틴 실패가 아니다.
예산 부족은 운영 정책 영역이다.
--------------------------------------------------
2. 예산 계층 구조
전체예산
↓
루틴예산
↓
종목예산
구조를 사용한다.
--------------------------------------------------
3. 전체예산
프로젝트 전체가 사용할 수 있는 최대 예산.
최상위 제한.
필수 항목.
--------------------------------------------------
4. 루틴예산
특정 루틴에 할당되는 예산.
선택 항목.
설정되지 않은 루틴은 전체예산 범위 내에서 사용 가능.
--------------------------------------------------
5. 종목예산
특정 종목에 할당되는 예산.
선택 항목.
설정 시 해당 종목의 최대 사용 가능 금액을 제한한다.
--------------------------------------------------
6. 예산 우선순위
전체예산 초과 불가.
루틴예산 초과 불가.
종목예산 초과 불가.
가장 작은 제한값을 우선 적용한다.
--------------------------------------------------
7. 예산 부족
예산 부족은 루틴 실패가 아니다.
BUY_SIGNAL 발생
↓
예산 부족
↓
주문 미수행
가능.
이는 루틴 실패로 기록하지 않는다.
--------------------------------------------------
8. 예산 표시 정책
현재 예산 사용 현황 표시.
현재 사용 금액.
현재 사용 비율.
가용 예산.
잔여 예산.
--------------------------------------------------
9. 경고 정책
70% 사용
경고 가능.
80% 사용
강한 경고 가능.
90% 사용
최우선 경고 가능.
--------------------------------------------------
10. 완충영역
예산 보호를 위한 정책.
운영자가 개입하지 못하는 상황을 대비한다.
--------------------------------------------------
11. 완충영역 진입
설정된 예산 비율 초과 시 진입.
예시
80%
90%
95%
사용자 설정 가능.
--------------------------------------------------
12. 완충영역 동작
완충영역 진입 후
신규 매수 발생 시
자동 대응 정책 수행 가능.
--------------------------------------------------
13. 자동 대응
기본 방향
조기마감 미진입 종목 중
수익률 최저 종목 우선.
--------------------------------------------------
14. 자동조기마감
완충영역 정책에 의해 자동 시작 가능.
정규장 내에서만 적용.
--------------------------------------------------
15. 청산 연계
자동조기마감 후
청산 정책과 연계 가능.
--------------------------------------------------
16. 이월 정책
완충영역 자동대응 시
이월 정책 제한 가능.
--------------------------------------------------
17. 예산과 포지션 구축
루틴은 포지션 구축을 시도한다.
실제 사용 가능한 예산 범위는 메인이 결정한다.
--------------------------------------------------
18. 예산과 루틴 책임 분리
루틴
- 전략
- 신호
- 포지션 구축
메인
- 예산
- 주문
- 청산
- 검토관리
--------------------------------------------------
19. 예산 상태 표시
정상
경고
위험
구간 지원 가능.
--------------------------------------------------
20. 최종 원칙
예산은 메인 시스템 책임 영역이다.
루틴은 예산 부족의 책임을 지지 않는다.
예산 정책은 루틴보다 우선 적용된다.

[출처: 마스터스펙\MASTER_SPEC_v2.5_REBUILD_WORKSPACE\MASTER_SPEC_v2.5_REBUILD_WORKSPACE\04_시간운영정책_v2.5_DRAFT_2026-06-17.txt | 기준일: 2026-06-17 | 수정시각: 2026-06-17 16:49:14 | 분류: 운영정책]
04_시간운영정책_v2.5_DRAFT_2026-06-17
제4부 시간운영 정책
본 문서는 프로젝트의 시간운영 정책을 정의한다.
--------------------------------------------------
1. 기본 원칙
시간운영 정책은 종목별 매매 가능 시간과 운영 상태를 결정한다.
시간정책은 루틴보다 상위 정책이다.
시간정책에 의해 차단된 경우 루틴 신호가 발생해도 주문을 수행하지 않는다.
--------------------------------------------------
2. 정규장
기본 정규장 시간
09:00 ~ 15:20
정규장 시간에는 정상 매매가 가능하다.
--------------------------------------------------
3. 동시호가
15:20 ~ 15:30
동시호가 구간은 일반 실시간 체결 구간으로 취급하지 않는다.
정규장 종료 절차와 연계된다.
--------------------------------------------------
4. 수동운영
수동운영은 운영자가 직접 매매 가능 상태를 지정한다.
표시색상
보라색
수동운영은 ATS 사용 가능.
--------------------------------------------------
5. 시간운영
시간운영은 시간 조건에 따라 자동으로 운영 상태를 결정한다.
전역 시간운영
개별 시간운영
지원.
전역 = 검정
개별 = 파랑
--------------------------------------------------
6. ATS 정책
ATS는 수동운영 전용 정책이다.
시간운영과 ATS를 동시에 사용하지 않는다.
예시
장전프리
08:00 ~ 08:50
마감후NTX
15:40 ~ 19:50
ATS 활성 시 청산정책은 별도 제약을 적용한다.
--------------------------------------------------
7. 운영 상태
감시/대기
매수
매도
조기마감
자동마감
청산
검토관리
상태를 사용한다.
--------------------------------------------------
8. 조기마감 정책
조기마감은 운영자가 직접 시작한다.
조기마감 시작 후
새로운 포지션 구축은 중단 방향을 따른다.
기존 포지션 정리 절차를 진행한다.
조기마감은 청산과 동일 개념이 아니다.
--------------------------------------------------
9. 자동마감 정책
자동마감은 시간 조건에 의해 시작된다.
자동마감 후 포지션 정리 절차를 진행한다.
자동마감은 청산과 동일 개념이 아니다.
--------------------------------------------------
10. 청산 정책
청산은 보유를 제거하는 절차이다.
마감은 운영 종료 절차이다.
마감과 청산은 구분한다.
청산 시
시장가
현재가
이월
등의 정책을 적용할 수 있다.
--------------------------------------------------
11. 이월 정책
이월 선택 시 포지션을 다음 거래일로 넘긴다.
청산 정책과 연계하여 동작한다.
--------------------------------------------------
12. 긴급정지
긴급정지는 최상위 정지 정책이다.
긴급정지 발생 시
모든 자동 운영 중단.
--------------------------------------------------
13. 정지해제
정지해제 시 안정성검사를 수행한다.
문제가 없는 종목
→ 감시/대기
문제가 있는 종목
→ 검토관리
--------------------------------------------------
14. 프로그램 재시작
프로그램 재시작은 긴급정지와 유사한 수준으로 취급한다.
재시작 후 모든 종목 재검사.
보유
미수
미도
불일치
존재 시 검토관리 이동.
--------------------------------------------------
15. 안정성검사
무결성검사 명칭 사용 금지.
정식 명칭
안정성검사
사용.
--------------------------------------------------
16. 현황 색상 정책
녹색
정상 운영 가능
주황
정상 상태이나 다음 절차 대상 없음
회색
비활성
빨강
데이터 불일치 또는 신뢰 불가
--------------------------------------------------
17. 최종 원칙
시간정책은 루틴보다 우선한다.
긴급정지 및 재시작은 최상위 정책으로 취급한다.
마감과 청산은 반드시 구분한다.

[출처: 마스터스펙\MASTER_SPEC_v2.5_REBUILD_WORKSPACE\MASTER_SPEC_v2.5_REBUILD_WORKSPACE\08_MACD루틴정책_v2.5_DRAFT_2026-06-17.txt | 기준일: 2026-06-17 | 수정시각: 2026-06-17 16:47:58 | 분류: 운영정책]
08_MACD루틴정책_v2.5_DRAFT_2026-06-17
제8부 MACD 루틴 정책
본 문서는 MACD 기반 자동매매 루틴의 정책을 정의한다.
본 문서는 01_프로젝트핵심철학 및 07_포지션구축철학의 하위 정책 문서이다.
--------------------------------------------------
1. MACD 루틴의 역할
MACD 루틴은 진입 타이밍을 판단한다.
MACD는 미래를 예측하지 않는다.
MACD는 현재 시점에서 매수 또는 매도 신호를 생성한다.
MACD는 언제 살 것인가를 판단한다.
얼마나 살 것인가는 포지션 구축 정책 및 자금 정책의 영역이다.
--------------------------------------------------
2. 신호 체계
본 루틴은 다음 신호를 사용한다.
BUY_SIGNAL
SELL_SIGNAL
CANCEL_SIGNAL
--------------------------------------------------
3. BUY_SIGNAL
BUY_SIGNAL은 매수 의사 표현이다.
BUY_SIGNAL은 주문 실행을 의미하지 않는다.
BUY_SIGNAL은 루틴이 매수 의사를 메인 시스템에 전달하는 신호이다.
메인 시스템은 예산, 주문 가능 여부, 운영 상태를 검토 후 실제 주문을 수행한다.
--------------------------------------------------
4. SELL_SIGNAL
SELL_SIGNAL은 매도 의사 표현이다.
SELL_SIGNAL 발생 시 포지션 종료 절차를 시작할 수 있다.
--------------------------------------------------
5. CANCEL_SIGNAL
CANCEL_SIGNAL은 기존 주문 또는 계획을 취소하기 위한 신호이다.
세부 구현은 메인 시스템 정책을 따른다.
--------------------------------------------------
6. 기준봉 정책
0봉 지원
1봉 지원
기본값은 1봉 기준.
보유가 없는 상태에서만 변경 허용.
--------------------------------------------------
7. 매수 주신호
MACD 오실레이터 하락 종료
↓
상승 전환
↓
BUY_SIGNAL 발생
기본 철학
최저점 확정 후 진입.
--------------------------------------------------
8. 매수 보조필터
선택 적용.
RSI
이동평균선
가격비교
MACD선 위치
Signal선 위치
--------------------------------------------------
9. RSI 필터
예시
RSI <= 50
RSI <= 40
RSI <= 사용자 지정값
--------------------------------------------------
10. 이동평균선 필터
예시
5일선 방향
10일선 방향
20일선 방향
다중 이평선 정렬
--------------------------------------------------
11. 가격 비교 필터
예시
현재가 > n봉 전 가격
현재가 < n봉 전 가격
--------------------------------------------------
12. 조건 결합
AND 지원
OR 지원
NOT 지원 예정
--------------------------------------------------
13. 매도 주신호
방법 1
MACD 오실레이터 상승 종료
↓
하락 전환
↓
SELL_SIGNAL
방법 2
목표 수익률 도달
↓
SELL_SIGNAL
--------------------------------------------------
14. 매도 보조필터
RSI
이동평균선
가격비교
--------------------------------------------------
15. 단일매수 정책
BUY_SIGNAL 발생
↓
단일 매수계획 생성
↓
목표금액 또는 목표수량 체결 시도
--------------------------------------------------
16. 다중매수 정책
BUY_SIGNAL 발생
↓
복수 진입지점 생성
↓
복수 매수계획 생성
--------------------------------------------------
17. 다중호가매수
예시
-1호가
-2호가
-3호가
-4호가
-5호가
사용자 설정 지원 예정.
--------------------------------------------------
18. 다중지점매수
예시
-1%
-2%
-3%
-4%
-5%
사용자 설정 지원 예정.
--------------------------------------------------
19. 자금 배분 방식
균등배분
가중배분
사용자지정배분
--------------------------------------------------
20. 매수회차
BUY_SIGNAL 재발생
↓
매수회차 증가
예시
1회차
2회차
3회차
4회차
SELL 발생 시 초기화.
--------------------------------------------------
21. 목표체결율
루틴은 목표체결율 개념을 사용한다.
예시
목표 100만원
체결 60만원
목표체결율 60%
--------------------------------------------------
22. 체결 정책
미체결 ≠ 실패
부분체결 ≠ 실패
매수 미완성 ≠ 실패
--------------------------------------------------
23. 주문 생명주기
BUY_SIGNAL
↓
매수계획 생성
↓
주문 생성
↓
체결 진행
↓
목표체결 완료
또는
매수 미완성
또는
매수 실패
--------------------------------------------------
24. 향후 확장 예정
능동매수 엔진
평단괴리보정
포지션구축보정
시장상황보정
본 항목은 연구정책과 연계된다.

[출처: 마스터스펙\MASTER_SPEC_v2.5_REBUILD_WORKSPACE\MASTER_SPEC_v2.5_REBUILD_WORKSPACE\07_포지션구축철학_v2.5_DRAFT_2026-06-17.txt | 기준일: 2026-06-17 | 수정시각: 2026-06-17 16:46:32 | 분류: MASTER_SPEC]
07_포지션구축철학_v2.5_DRAFT_2026-06-17
제7부 포지션 구축 철학
본 문서는 프로젝트의 포지션 구축 철학을 정의한다.
본 문서는 루틴 구현 정책보다 상위에 위치한다.
MACD 루틴을 포함한 모든 루틴은 본 문서의 철학을 우선 적용한다.
--------------------------------------------------
1. 포지션 구축 철학
본 프로젝트는 주문 성공 중심 시스템이 아니다.
본 프로젝트는 포지션 구축 중심 시스템이다.
주문은 수단이다.
평단은 관리 대상이다.
포지션은 최종 관리 대상이다.
본 프로젝트의 목표는 다음과 같다.
유리한 평단 구축
↓
유리한 포지션 구축
↓
포지션 유지
↓
포지션 종료
--------------------------------------------------
2. BUY 의미 재정의
기존 개념
BUY = 매수
신규 개념
BUY = 포지션 구축 시작
BUY = 매수모드 진입
BUY 발생은 단순 주문을 의미하지 않는다.
BUY 발생은 포지션 구축 절차의 시작을 의미한다.
--------------------------------------------------
3. SELL 의미 재정의
SELL = 포지션 종료
SELL 발생 전까지 포지션 구축은 종료되지 않는다.
SELL 발생 시 해당 포지션 구축 절차는 종료된다.
--------------------------------------------------
4. 매수회차 개념
보유 상태에서 BUY 신호가 재발생할 수 있다.
이 경우 신규 포지션을 생성하지 않는다.
기본 처리 원칙
보유중 BUY 발생
=
매수회차 증가
예시
1회차 매수
↓
2회차 매수
↓
3회차 매수
↓
SELL
↓
포지션 종료
↓
회차 초기화
--------------------------------------------------
5. 지속매수 철학
본 프로젝트는 단일 진입 중심 시스템이 아니다.
포지션 구축 과정에서 다수의 매수회차가 발생할 수 있다.
루틴은 다음을 허용한다.
BUY
→ BUY
→ BUY
→ BUY
→ SELL
SELL 전까지 BUY 재발생은 정상 동작으로 취급한다.
--------------------------------------------------
6. 평단 중심 철학
본 프로젝트는 신호 중심 시스템이 아니다.
본 프로젝트는 평단 중심 시스템이다.
핵심 관리 대상
- 현재가
- 평단
- 보유수량
- 누적투입금액
루틴은 평단을 지속적으로 평가한다.
--------------------------------------------------
7. 평단 구축
평단 구축은 포지션 구축의 핵심 절차이다.
루틴은 단순 체결 성공보다 평단 구축 효율을 우선 고려한다.
--------------------------------------------------
8. 평단 관리
평단은 체결 결과가 아니다.
평단은 관리 대상이다.
현재가와 평단의 관계는 루틴 판단의 핵심 기준이 된다.
--------------------------------------------------
9. 매수 미완성
매수 미완성은 실패가 아니다.
예시
목표금액 100만원
현재 체결 40만원
남은 체결 60만원
위 상태는 실패가 아니다.
매수 미완성 상태이다.
--------------------------------------------------
10. 매수 실패
매수 실패는 매수 미완성과 구분한다.
매수 실패는 정책상 더 이상 포지션 구축을 진행할 수 없는 상태를 의미한다.
--------------------------------------------------
11. 체결 상태 원칙
미체결 ≠ 실패
부분체결 ≠ 실패
매수 미완성 ≠ 실패
본 프로젝트는 체결 결과와 실패를 동일하게 취급하지 않는다.
--------------------------------------------------
12. 포지션 구축과 예산
루틴은 BUY 의사를 표현한다.
예산 부족은 루틴 실패가 아니다.
예산 부족은 메인 시스템 책임 영역이다.
--------------------------------------------------
13. MACD와 포지션 구축
MACD는 진입 타이밍을 제공한다.
MACD는 언제 살 것인가를 판단한다.
평단은 얼마나 살 것인가를 판단한다.
포지션 구축 철학은 MACD보다 상위 개념이다.
--------------------------------------------------
14. 향후 확장
본 문서는 다음 연구정책의 상위 철학으로 사용된다.
- 능동매수 엔진
- 평단괴리보정
- 포지션구축보정
- 시장상황보정
향후 연구정책은 본 철학을 위반할 수 없다.

[출처: 마스터스펙\MASTER_SPEC_v2.5_REBUILD_WORKSPACE\MASTER_SPEC_v2.5_REBUILD_WORKSPACE\01_프로젝트핵심철학_v2.5_DRAFT_2026-06-17.txt | 기준일: 2026-06-17 | 수정시각: 2026-06-17 16:45:50 | 분류: MASTER_SPEC]
01_프로젝트핵심철학_v2.5_DRAFT_2026-06-17
제1부 프로젝트 핵심 철학

[출처: 마스터스펙\MASTER_SPEC_v2.5_REBUILD_WORKSPACE\MASTER_SPEC_v2.5_REBUILD_WORKSPACE\01_프로젝트핵심철학_v2.5_DRAFT_2026-06-17.txt | 기준일: 2026-06-17 | 수정시각: 2026-06-17 16:45:50 | 분류: MASTER_SPEC]
1. 문서 목적
본 문서는 프로젝트의 최상위 철학을 정의한다.
본 문서의 내용은 개별 루틴보다 상위에 위치한다.
본 문서의 내용은 특정 루틴 구현 방식에 종속되지 않는다.

[출처: 마스터스펙\MASTER_SPEC_v2.5_REBUILD_WORKSPACE\MASTER_SPEC_v2.5_REBUILD_WORKSPACE\01_프로젝트핵심철학_v2.5_DRAFT_2026-06-17.txt | 기준일: 2026-06-17 | 수정시각: 2026-06-17 16:45:50 | 분류: MASTER_SPEC]
2. 프로젝트 목적
본 프로젝트는 키움 OpenAPI 기반 자동매매 플랫폼이다.
본 프로젝트는 단순 자동주문 프로그램이 아니다.
본 프로젝트는 유리한 평단과 유리한 포지션을 구축하고 안정적으로 관리하는 것을 목표로 한다.

[출처: 마스터스펙\MASTER_SPEC_v2.5_REBUILD_WORKSPACE\MASTER_SPEC_v2.5_REBUILD_WORKSPACE\01_프로젝트핵심철학_v2.5_DRAFT_2026-06-17.txt | 기준일: 2026-06-17 | 수정시각: 2026-06-17 16:45:50 | 분류: MASTER_SPEC]
3. 미래예측 배제 원칙
본 프로젝트는 미래 가격 예측을 목표로 하지 않는다.
본 프로젝트는 현재 시점에서 확인 가능한 정보만을 사용한다.
판단 정보
- 현재가
- 평단
- 보유수량
- 누적투입금액
- 체결상태
- 운영상태
4. 전략과 실행 분리 원칙
루틴 = 전략 판단 엔진
역할
- 시장 해석
- 신호 생성
- 포지션 구축 판단
- 매수조건 판단
- 매도조건 판단

[출처: 마스터스펙\MASTER_SPEC_v2.5_REBUILD_WORKSPACE\MASTER_SPEC_v2.5_REBUILD_WORKSPACE\01_프로젝트핵심철학_v2.5_DRAFT_2026-06-17.txt | 기준일: 2026-06-17 | 수정시각: 2026-06-17 16:45:50 | 분류: MASTER_SPEC]
루틴은 주문을 직접 수행하지 않는다.
루틴은 예산을 직접 관리하지 않는다.
루틴은 청산을 직접 수행하지 않는다.
메인 = 실행 엔진
역할
- 주문 실행
- 체결 관리
- 예산 관리
- 청산 처리
- 검토관리
- 긴급정지
- 재시작 처리
5. 포지션 구축 원칙
본 프로젝트는 주문 성공 중심 시스템이 아니다.
본 프로젝트는 포지션 구축 중심 시스템이다.
핵심 관리 대상
- 현재가
- 평단
- 보유수량
- 누적투입금액
6. 평단 중심 원칙
평단은 단순 결과값이 아니다.
평단은 핵심 관리 대상이다.
루틴은 평단을 지속적으로 평가한다.
7. 지속매수 원칙

[출처: 마스터스펙\MASTER_SPEC_v2.5_REBUILD_WORKSPACE\MASTER_SPEC_v2.5_REBUILD_WORKSPACE\01_프로젝트핵심철학_v2.5_DRAFT_2026-06-17.txt | 기준일: 2026-06-17 | 수정시각: 2026-06-17 16:45:50 | 분류: MASTER_SPEC]
포지션 구축은 단일 주문으로 종료되지 않는다.
포지션 구축은 다수의 매수회차를 포함할 수 있다.
루틴은 포지션 구축 과정을 중요하게 취급한다.
8. 예산 책임 분리 원칙

[출처: 마스터스펙\MASTER_SPEC_v2.5_REBUILD_WORKSPACE\MASTER_SPEC_v2.5_REBUILD_WORKSPACE\01_프로젝트핵심철학_v2.5_DRAFT_2026-06-17.txt | 기준일: 2026-06-17 | 수정시각: 2026-06-17 16:45:50 | 분류: MASTER_SPEC]
예산 부족은 루틴 실패가 아니다.
예산 부족은 운영 정책 문제이다.
예산 부족은 메인 시스템 책임 영역이다.
9. 연구정책 관리 원칙
연구정책은 폐기정책이 아니다.
실전 검증 후 정식 정책으로 승격될 수 있다.
현재 연구정책
- 능동매수
- 평단괴리보정
- 포지션구축보정
- 시장상황보정
10. 문서 계층 구조
01 프로젝트핵심철학
↓
07 포지션구축철학
↓
08 MACD루틴정책
↓
개별 루틴 구현

[출처: routine_policy_draft_v4\루틴실행정책_개념정리_v4.txt | 기준일: 2026-06-17 | 수정시각: 2026-06-17 00:28:46 | 분류: 운영정책]
# 루틴 실행정책 개념정리 v4

[출처: 마스터스펙_갱신자료_STEP44\작업진행상황대화히스토리_5.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-18 17:43:02 | 분류: 대화히스토리]
[DRY-RUN 안내]
- 실제 삭제/이동은 수행하지 않았습니다.
- 위 목록 확인 후 문제가 없을 때만 --apply 옵션으로 실행하세요.

[출처: 마스터스펙_갱신자료_STEP44\작업진행상황대화히스토리_5.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-18 17:43:02 | 분류: 대화히스토리]
통합 상태 구조
BUY_PLAN_CREATED
BUY_IN_PROGRESS
BUY_PARTIAL_FILLED
BUY_COMPLETED
BUY_INCOMPLETE
BUY_FAILED
REVIEW_REQUIRED
중요한 구분:
BUY_INCOMPLETE
= 전략상 목표 미달

[출처: 마스터스펙_갱신자료_STEP44\작업진행상황대화히스토리_5.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-18 17:43:02 | 분류: 대화히스토리]
여기서 내가 말안한 개념이 있는데 우리 자동매매루틴의 핵심은 추매의 기술이다. 즉 주가가 올라가면 땡큐, 내려가면 신호에 따른 추매로 평단을 낯춰 손실율 최소화 하는게 핵심으로 이 루틴을 기계적으로 매수 회차수에 따른 고정산식을 넣어 매수를 더하는 방식인데 사실 능동매수의 개념을 넣으면 이 루틴이 어떻게 유효할지도 궁금하다.. 매수 실패판정을 난발하기 보다는 현재 주가 포지션과 평단을 맞춰가는 자동 매수 로직도 한번 생각해볼만하다.
이건 꽤 중요한 이야기다.
지금까지 우리는 무의식적으로:
BUY 신호
↓
목표금액 체결
↓
완료
라는 일반적인 자동매매 관점으로 보고 있었다.
그런데 네 루틴의 원래 철학은 다르다.
일반 자동매매
신호
↓
진입
↓
익절/손절
↓
종료
네 MACD 루틴
핵심은
신호
↓
진입
↓
하락
↓
추매
↓
평단관리
↓
반등
↓
청산
이다.
즉
최초 매수
가 중요하지 않고
최종 평균단가
가 중요하다.
그래서 방금 이야기한
매수완성률 90%
같은 개념이 갑자기 애매해진다.
왜냐하면.
예를 들어.
1차 20만원
만 체결.
원래 계획
5차
100만원
이었다.
그런데
주가 상승
해버림.
그러면?
20만원만 체결
인데.
이건
실패
인가?
아니다.
오히려
수익
이 발생할 수도 있다.
그래서 내가 방금 생각이 바뀌었다.
현재 구조
매수완성
이라는 개념보다.
포지션 완성
개념이 맞다.
예.
현재 평단
현재 보유량
현재 주가
를 본다.
그리고 루틴이
추매 필요
를 판단.
또는
추매 불필요
를 판단.
즉
1차 체결 실패
가 아니라.
현재 포지션이
루틴 의도와 얼마나 차이나는가
를 보는 것.
여기서 능동매수
이 개념이 나온다.
현재까지는
신호 발생
↓
예약된 가격대
만 생각했다.
그런데 능동매수를 넣으면.
예:
MACD BUY
1차 체결.
하락.
RSI 과매도.
거래량 감소.
그러면.
원래 예정된 3차 매수
가 아니라.
추가 능동매수
를 넣을 수도 있다.
이건 상당히 강력한 개념이다.
하지만 동시에 위험하다.
왜냐하면.
예정된 매수
는 검증 가능.
능동매수
는 루틴이 시장을 해석해야 한다.
그래서 내 생각은.
V1
고정 다중매수
V2
능동추매
가 맞다.
하지만 철학적으로는 매우 중요한 발견이다.
왜냐하면.
지금까지 우리는:
매수 실패
를 고민했는데.
실제로는.
매수 실패를 줄이는 것
보다.
현재 포지션을
루틴 의도에 맞게 유지하는 것
이 네 프로젝트의 본질에 더 가깝다.
그래서 나는 지금 시점에서:
매수완성률
개념은 보류.
대신
포지션 완성도
라는 개념을 따로 검토해볼 가치가 있다고 본다.
이건 네가 말한 "추매의 기술"과 훨씬 잘 맞는다.
대충 이 개념은 위에서 말한 매수 실패가 됐을 경우의 후속 조치로써의 기능을 고려해볼만 하다고 생각한다.
맞다. 그 위치가 가장 적절하다.
나는 아까 능동매수를 V2 기능처럼 생각했는데, 지금 다시 보니까 네 구조에서는:
능동매수
=
기본 진입전략
이 아니라
매수계획 실패 후 후속대응정책
으로 넣는 게 훨씬 자연스럽다.
예를 들어.
정상 상황
MACD BUY
↓
다중매수 계획
20%
20%
20%
20%
20%
↓
계획대로 체결
↓
종료
문제 상황
MACD BUY
↓
다중매수 계획
20%
20%
20%
20%
20%
↓
1차만 체결
나머지 미체결
↓
유효봉 종료
↓
매수 실패
여기서 후속정책.
정책 A
종료
정책 B
검토관리
정책 C
시장가 잔량매수
정책 D
능동매수 모드 진입
이때 능동매수는.
현재 평단
현재 주가
현재 보유비중
추가예산
을 보고.
추매가 유리한가?
를 판단.
이건 완전히 다르다.
왜냐하면.
원래 계획
을 실행하는 게 아니라.
현재 상태
를 보고 대응하는 거니까.
그래서 지금 정리하면.
BUY_POLICY
1차
신호 발생
↓
매수계획 생성
2차
매수계획 수행
3차
완료
또는
실패
4차
실패 후속정책
여기서
능동매수
등장.
이 구조가 좋은 이유는.
능동매수
가 실패했어도.
원래 매수계획
은 건드리지 않는다.
즉.
매수계획
과
실패대응
을 분리할 수 있다.
그래서 지금 내가 보기에는 다음에 정해야 할 건:
매수 실패 후속정책 목록
이다.
현재까지 후보.
1. 종료
2. 검토관리
3. 시장가 잔량매수
4. 능동매수
5. 신규 BUY 신호 대기
이 정도로 보인다.
그리고 이 단계부터는 매도 실패 후속정책도 거의 같은 틀로 갈 수 있을 것 같다.
다음은 어떤 개념을 ?
지금까지 흐름을 보면 다음 개념은 의외로 매수 실패 후속정책이 아니다.
그건 이미 큰 틀은 나왔다.
실패
↓
종료
검토관리
시장가전환
능동매수
신규신호대기
정도.
내가 보기엔 이제 가장 위험한 미정의 영역은 이것이다.
보유상태에서 BUY 신호 발생
예.
MACD BUY
↓
매수
↓
보유중
그런데.
MACD BUY
또 발생.
이때.
A
무시
B
추매
C
조건부 추매
D
새 매수계획 생성
이게 정해져야 한다.
왜냐하면 네 루틴의 본질이
추매의 기술
이기 때문이다.
예를 들어.
1차 BUY
↓
100만원
매수.
주가 하락.
MACD BUY 재발생.
그러면.
추매 기회
인가?
아니면.
이미 보유중이므로 무시
인가?
이건 루틴 철학에 직접 연결된다.
그리고 이건 매도보다 먼저 정해야 한다.
왜냐하면.
보유중 BUY
에 대한 정책이 정해지면.
능동매수
추매
다중매수
매수실패후속정책
전부 연결된다.
그래서 내가 다음으로 제안하는 논의는:
보유중 BUY 신호 발생시
1. 무시
2. 자동 추매
3. 조건부 추매
4. 신규 매수계획 생성
5. 사용자 선택
중 어떤 구조로 갈 것인가.
내 기억상 네 프로젝트 철학은:
조건부 추매
쪽에 훨씬 가까워 보인다.
왜냐하면 처음부터 네가 강조한 게:
평단관리
추매의 기술
이었기 때문이다.
그래서 다음 개념은 "보유중 BUY 신호 처리" 가 가장 우선순위가 높아 보인다.
지속 매수를 해야한다고 본다.
나도 지금까지 정리된 철학을 보면 지속 매수가 맞다고 본다.
근데 여기서 중요한 건:
지속 매수
≠
무조건 추매
이다.
예를 들어.
잘못된 지속 매수
BUY
↓
매수
BUY
↓
추매
BUY
↓
추매
BUY
↓
추매
무한 반복.
이러면
예산 소진
문제가 생긴다.
그래서 네 루틴의 지속 매수는
추매 가능 상태
를 유지하는 개념에 가깝다.
예.
총 예산 100만원
현재
20만원 보유
MACD BUY 재발생.
그러면
잔여 예산 80만원
범위 내에서
추가 매수 가능
상태.
즉.
BUY
신호는
진입
이 아니라.
포지션 확대 허가
에 가까워진다.
이렇게 되면 구조가 바뀐다.

[출처: 마스터스펙_갱신자료_STEP44\작업진행상황대화히스토리_5.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-18 17:43:02 | 분류: 대화히스토리]
"평단과 현재가의 괴리가 커질수록 매수량을 늘릴 것인가, 아니면 회차(1차, 2차, 3차...)를 기준으로 늘릴 것인가?"
이다.
나는 지금까지 나온 철학을 보면 회차보다 평단괴리를 우선하는 방향으로 조금씩 이동하고 있는 것처럼 보인다.

[출처: 마스터스펙_갱신자료_STEP44\작업진행상황대화히스토리_5.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-18 17:43:02 | 분류: 대화히스토리]
4. 실패/미완성 대응
- 재시도
- 시장가 전환
- 능동매수 전환
- 검토관리
UI는 처음부터 전부 완성하지 말고, 탭 또는 섹션만 먼저 만들어서 옵션을 끼워 넣는 구조가 맞다.
다음 단계는 코드가 아니라 MACD 루틴 설정창 초안 설계가 맞겠다.
루틴 설정창 진입은 루팅을 클릭?
내가 보기엔 지금까지 정한 프로젝트 철학으로는
루틴 클릭
↓
루틴 설정창 진입
이 가장 자연스럽다.
왜냐하면 네 프로젝트는 결국
종목
↓
루틴
↓
설정
구조이기 때문이다.
예를 들어:
MACD매매루틴
을 등록.
관제창 또는 루틴관리창에:
[MACD매매루틴]
이 표시됨.
더블클릭 또는 설정버튼.
↓
MACD매매루틴 설정
창 오픈.
근데 여기서 중요한 게 하나 있다.
우리가 지금까지 논의한 걸 보면
루틴 설정
과
루틴 인스턴스 설정
을 분리해야 할 수도 있다.
예:
MACD매매루틴
원본.
설정.
MACD 12,26,9
매수신호
매도신호
그런데 종목 A.
삼성전자
종목 B.
SK하이닉스
둘 다 같은 루틴을 쓰지만.
예산
매수횟수
매도정책
은 다를 수 있다.
그래서 지금 생각나는 구조는:
루틴관리
MACD매매루틴
클릭
↓
루틴 자체 설정
종목관리
삼성전자
클릭
↓
종목-루틴 연결 설정
이렇게 2단계.
왜냐하면 만약
MACD매매루틴
설정에서
매수횟수 6회
를 바꾸면.
삼성전자
SK하이닉스
LG에너지솔루션
전부 동시에 바뀌는 문제가 생긴다.
그래서 내가 지금 제안하는 건:
루틴 클릭
루틴 구조 설정
예:
MACD 설정
매수신호
매도신호
능동매수 사용 여부
추매엔진 종류
종목 클릭
종목별 운용설정
예:
예산
최대보유금액
최대매수횟수
종목별 예외설정
이렇게 분리하는 게 나중에 훨씬 안 꼬일 것 같다.
다만 여기서 결정해야 할 게 있다.
다중매수 횟수
능동매수 ON/OFF
매도정책
이게
루틴 고유 설정
인지,
아니면

[출처: 마스터스펙_갱신자료_STEP44\작업진행상황대화히스토리_5.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-18 17:43:02 | 분류: 대화히스토리]
현재까지 나온 철학을 기준으로 보면 이 구조가 가장 단순하고 확장성도 좋다. 다음 단계에서는 MACD 루틴 설정창에 어떤 항목들을 배치할지를 정리하면 될 것 같다.
다음 고고
좋다.
지금까지 정리된 철학으로 보면 다음은 자연스럽게
MACD 루틴 설정창 설계
로 넘어가야 한다.
근데 여기서 중요한 건.
지금까지 나온 이야기를 기준으로 하면 설정창은
신호설정
매수설정
매도설정
이 아니라
진입
포지션구축
청산
으로 가는 게 더 맞아 보인다.
1. 진입설정
MACD 루틴의 시작점.
[매수신호]
MACD OSC 상승전환
0봉 / 1봉
보조필터 사용
RSI
거래량
이평선
기타
2. 포지션구축
여기가 이 루틴 핵심.
[포지션 구축]
매수방식
( ) 단일매수
( ) 다중매수
다중매수
횟수
가격기준
- %
- 호가
추매정책
( ) 고정회차
( ) 평단보정
( ) 혼합형
능동매수
사용
미사용
평단보정
평단괴리 기준
0.3%
0.5%
1.0%
3. 매수실패 대응
유효봉
유효시간
미완성 정책
재매수
시장가
능동매수
종료
검토관리
4. 청산설정
여기가 사실 앞으로 가장 복잡해질 가능성이 높음.
MACD 매도
수익률 매도
분할매도
추세매도
손절
그리고 지금 보니까.
다음에 진짜 정해야 할 건
루틴이 무엇을 기억할 것인가
이다.
예를 들어.
현재 루틴은 매수할 때마다:
현재 평단
현재 보유수량
매수회차
최근 신호 발생시각
이번 세트 시작가격
같은 내부 상태를 계속 기억해야 한다.
특히 네 철학이면.
매수회차
보다
현재 평단
현재가
누적투입금액
이 훨씬 중요하다.
그래서 다음 논의 주제는:
루틴이 종목별로 어떤 상태값들을 유지해야 하는가
이다.
이게 정리되면 나중에 루틴 파일(routine.py) 구조도 거의 자동으로 나온다.
청산은 메인파트에서 진행..여기는 아니다
맞다.
이건 내가 방금 잘못 메인과 루틴을 다시 섞었다.
현재까지 네 프로젝트 철학을 기준으로 하면:
루틴 = 신호
메인 = 실행
이 대원칙은 아직 안 깨졌다.
그러면 청산은?
청산은 사실:
주문 실행
보유수량 확인
미체결 확인
잔량처리
시장가 전환
청산 완료 확인
등이 들어간다.
이건 명백히
메인파트
영역이다.
루틴은
SELL 신호
만 발생.
예를 들어.
MACD 하락전환
↓
SELL
또는
수익률 +5%
↓
SELL
또는
이평선 하락전환
↓
SELL
여기까지만 루틴.
그 후
몇 주 팔지
전량 팔지
분할 팔지
시장가로 팔지
현재가로 팔지
잔량 어떻게 할지
는 메인.
그래서 지금 MACD 루틴 설정창은 사실
1. 진입신호
2. 포지션구축
까지만 존재하면 된다.
그리고 방금 말한 것 때문에 또 하나 정리가 된다.
MACD 루틴 설정창
[진입신호]
[포지션구축]
[매도신호]
까지만.
청산정책 탭 없음.
왜냐하면
매도신호
≠
청산
이기 때문.
그러면 다음으로 남는 건 사실 하나다.
매도신호부
우리가 매수는 거의 철학이 정리됐다.
MACD 필수
평단 중심
지속 매수
추매
그런데 매도는 아직.
MACD 매도
수익률 매도
이평선 매도
복합매도
가 뒤섞여 있다.
그래서 현재 루틴 설계 기준으로 다음 논의는:
매도신호는
단일신호 구조인가
복합신호 구조인가
이다.
내 기억으로는 네 생각은 이미
매수 = MACD 필수
매도 = MACD 비필수
쪽으로 기울어져 있었다.
그래서 다음은 매도신호 엔진 구조를 정리하는 단계가 맞다.
오키
좋다.
그럼 이제 매도신호 엔진으로 넘어가자.
여기서 중요한 건 이미 하나 확정된 상태다.
매수 = MACD 필수
매도 = MACD 비필수
즉.
매수 엔진
MACD BUY
+
보조필터
구조.

[출처: 마스터스펙_갱신자료_STEP44\작업진행상황대화히스토리_5.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-18 17:43:02 | 분류: 대화히스토리]
현재 20이평값 > 5봉전 20이평값 = 이평선 상승
현재 20이평값 < 5봉전 20이평값 = 이평선 하락
필요 데이터:
종가 배열
이평 기간
비교 봉수
예:
MA 기간 = 20
비교 봉수 = 5
계산:

[출처: 마스터스펙_갱신자료_STEP44\작업진행상황대화히스토리_5.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-18 17:43:02 | 분류: 대화히스토리]
필요 봉수 = MA 기간 + 비교 봉수
예를 들어 20MA를 5봉전과 비교하려면 최소 25개 이상 봉이 필요하다.
UI 설정은 이렇게 두면 된다.
사용 여부
이평 기간: 20
비교 봉수: 5
조건: 상승 / 하락
매수 기본 예:
20MA 상승중일 때만 매수
매도 기본 예:
20MA 하락중일 때만 매도
9시 시작시 거래에서는 어떻게 구현?
9시 시작 직후에는 현재 장중 봉이 아직 부족해서 그대로 계산하면 안 된다.
예를 들어 20이평 + 5봉전 비교라면:

[출처: 마스터스펙_갱신자료_STEP44\작업진행상황대화히스토리_5.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-18 17:43:02 | 분류: 대화히스토리]
필요 봉수 = 20 + 5 = 최소 25봉
1분봉 기준이면 9:00 시작 후 25분 정도는 당일 데이터만으로는 판정 불가다.
그래서 구현은 이렇게 가는 게 맞다.

[출처: 마스터스펙_갱신자료_STEP44\작업진행상황대화히스토리_5.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-18 17:43:02 | 분류: 대화히스토리]
1. 전일/이전 캔들 데이터 포함해서 계산
2. 당일 9시 첫 봉부터 이전 봉 데이터와 이어서 MA 계산
3. 그래도 데이터 부족하면 필터 판정불가
판정불가 처리:

[출처: 마스터스펙_갱신자료_STEP44\작업진행상황대화히스토리_5.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-18 17:43:02 | 분류: 대화히스토리]
1회차: 0% 기준 → 10,000원 이하
2회차: -10% 기준 → 9,000원 이하
3회차: -20% 기준 → 8,000원 이하
중요한 점:

[출처: 마스터스펙_갱신자료_STEP44\작업진행상황대화히스토리_5.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-18 17:43:02 | 분류: 대화히스토리]
routine_policy_draft_v7 (2).zip
ZIP 아카이브
그러면 이제 새로운 대화창으로 넘어가자 중요참조 문서 재 작성해줘

[출처: 마스터스펙_갱신자료_STEP44\작업진행상황대화히스토리_5.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-18 17:43:02 | 분류: 대화히스토리]
MASTER_SPEC_v3.0_BASELINE_5_8.txt
MASTER_SPEC_v3.0_BASELINE_13_16.txt
이 두 파일만 올려주면 된다.
특히 PART08을 먼저 열어봐야 한다.

[출처: 마스터스펙_갱신자료_STEP44\작업진행상황대화히스토리_5.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-18 17:43:02 | 분류: 대화히스토리]
확정 문서 검증 없이
AI가 일반론으로 추론
↓
문서에 없는 개념 삽입
↓
코드 생성
↓
프로젝트 오염
↓
복구 작업 발생
사례였기 때문이다.
그리고 이건 앞으로도 충분히 반복될 수 있다.
아래 내용 정도면 충분하다.

[출처: routine_policy_draft_v3\루틴실행정책_개념정리_v3.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-16 23:45:08 | 분류: 운영정책]
# 루틴 실행정책 개념정리 v3

[출처: routine_policy_draft_v2\루틴실행정책_개념정리_v2.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-16 23:31:32 | 분류: 운영정책]
# 루틴 실행정책 개념정리 v2

[출처: routine_policy_draft_v2\루틴실행정책_개념정리_v2.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-16 23:31:32 | 분류: 운영정책]
가능 조합:
- 단일가격 + 단일지점
- 단일가격 + 다중지점
- 다중호가 + 단일지점
- 다중호가 + 다중지점
4. 다중호가 개념

[출처: routine_policy_draft_v1\루틴실행정책_개념정리_v1.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-16 23:19:00 | 분류: 운영정책]
# 루틴 실행정책 개념정리 v1

[출처: 04_프로젝트현재상태보고서_v2026-06-16_종목폴더통합_검토관리_최신갱신.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-16 17:45:10 | 분류: 갱신문서]
# 2026-06-15 최신 갱신본
# 원본 파일명: 04_프로젝트현재상태보고서_v2026-06-13_갱신(2).txt
# 작성 방식: 원문 전체 보존 + 2026-06-15 종목폴더 통합/검토관리 최신 갱신 섹션 추가

[출처: 04_프로젝트현재상태보고서_v2026-06-16_종목폴더통합_검토관리_최신갱신.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-16 17:45:10 | 분류: 갱신문서]
================================================================================
[이하 원문 전체 보존]
================================================================================
# 프로젝트현재상태보고서_v2026-06-13_갱신

[출처: 04_프로젝트현재상태보고서_v2026-06-16_종목폴더통합_검토관리_최신갱신.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-16 17:45:10 | 분류: 갱신문서]
============================================================
4. 최근 실행 확인
============================================================

[출처: 04_프로젝트현재상태보고서_v2026-06-16_종목폴더통합_검토관리_최신갱신.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-16 17:45:10 | 분류: 갱신문서]
============================================================
8. 다음 권장 작업
============================================================
다음 작업은 다음 순서가 합리적이다.

[출처: 03_작업재개요약서_v2026-06-16_종목폴더통합_검토관리_최신갱신\03_작업재개요약서_v2026-06-16_종목폴더통합_검토관리_최신갱신.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-16 17:45:02 | 분류: 작업재개요약]
현재 프로젝트는 구조개선 때문에 막히는 단계는 끝났다.
대형 파일 분리와 기능별 모듈화가 대부분 완료되었다.

[출처: 마스터스펙\02_MASTER_ADDENDUM_v2026-06-16_종목폴더통합_검토관리_최신확정.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-16 17:44:52 | 분류: 갱신문서]
============================================================
[2026-06-15 ADDENDUM 추가 확정] 중앙 stocks 통합 후 검토관리 원칙
============================================================

[출처: 마스터스펙\02_MASTER_ADDENDUM_v2026-06-16_종목폴더통합_검토관리_최신확정.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-16 17:44:52 | 분류: 갱신문서]
============================================================
2. 작업 원칙 재확정
============================================================

[출처: 마스터스펙\02_MASTER_ADDENDUM_v2026-06-16_종목폴더통합_검토관리_최신확정.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-16 17:44:52 | 분류: 갱신문서]
============================================================
9. 관제창 최신 철학
============================================================
관제창은 계좌/자금/성과/위험 관제센터이다.
자동매매설정창은 종목 운영 설정센터이다.

[출처: 마스터스펙\01_MASTER_SPEC_v2.3_2026-06-16_종목폴더통합_검토관리_최신갱신.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-16 17:44:44 | 분류: 갱신문서]
본 문서는 키움 OpenAPI 기반 자동매매 GUI 프로젝트의 최신 기준 문서이다.
기존 MASTER_SPEC v1.1, v1.2, v1.3, v1.4, v1.5, v2.0, v2.1, 각종 Addendum, 구조개선 문서, 작업재개요약서는 모두 참조용으로 보존한다.
다만 정책 충돌이 있을 경우 본 문서 v2.2를 최우선으로 적용한다.

[출처: 마스터스펙\01_MASTER_SPEC_v2.3_2026-06-16_종목폴더통합_검토관리_최신갱신.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-16 17:44:44 | 분류: 갱신문서]
적용 우선순위:
1. MASTER_SPEC_v2.2_2026-06-13
2. MASTER_ADDENDUM_v2026-06-13_자금관제_마감정책_최신확정
3. 작업재개요약서_v2026-06-13_자금관제_마감정책_갱신
4. 프로젝트현재상태보고서_v2026-06-13_갱신
5. 운영정책_테스트체크리스트_v2026-06-13_갱신
6. MASTER_SPEC_v2.1_2026-06-13
7. 기존 MASTER_SPEC v2.0 통합본
8. 기존 MASTER_SPEC v1.5 및 이전 문서

[출처: 마스터스펙\01_MASTER_SPEC_v2.3_2026-06-16_종목폴더통합_검토관리_최신갱신.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-16 17:44:44 | 분류: 갱신문서]
============================================================
2. 프로젝트 최상위 철학
============================================================

[출처: 마스터스펙\01_MASTER_SPEC_v2.3_2026-06-16_종목폴더통합_검토관리_최신갱신.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-16 17:44:44 | 분류: 갱신문서]
============================================================
3. 현재 프로젝트 단계
============================================================
현재 프로젝트 단계는 다음과 같이 판정한다.

[출처: 마스터스펙\01_MASTER_SPEC_v2.3_2026-06-16_종목폴더통합_검토관리_최신갱신.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-16 17:44:44 | 분류: 갱신문서]
복귀 원칙:
- 자동복귀 금지.
- 새로고침 또는 안정성검사로 현재 상태를 다시 확인한다.
- 복귀/미지정은 문제 해소 후 운영자가 최종 처리하는 버튼이다.
- 복귀 자체가 판정 버튼처럼 동작하면 안 된다.
- 복귀 시 현재 조건 재판정 필요.
- 복귀 후 곧바로 매수/매도 상태가 되는지 여부는 현재 시간/운영방식/안정성검사 결과에 따라 달라진다.

[출처: 마스터스펙\01_MASTER_SPEC_v2.3_2026-06-16_종목폴더통합_검토관리_최신갱신.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-16 17:44:44 | 분류: 갱신문서]
============================================================
22. 정렬/화면순서 정책
============================================================
자동매매설정창 하단 종목표는 헤더 정렬 후 사용자가 개별 종목 설정을 변경해도 행이 튀면 안 된다.

[출처: README_적용내용(27).txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 19:41:08 | 분류: 기타문서/자료]
적용 파일:
- gui_review_required_window.py
- gui_global_review_required_window.py

[출처: routine_folder_recreation_analysis_report.txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 18:19:20 | 분류: 기타문서/자료]
루틴폴더 내부 종목폴더 재생성 원인 분석 보고서
================================================================================
분석 ZIP: kiwoom_auto (34).zip
프로젝트 루트: /mnt/data/routine_folder_recreation_analysis/extract/kiwoom_auto

[출처: routine_folder_recreation_analysis_report.txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 18:19:20 | 분류: 기타문서/자료]
최종 중앙화 원칙:
 - 기존 _루틴명/종목 폴더를 fallback으로 사용하지 않는다.
 - 요청 루틴명과 config의 현재 루틴명이 다르면 None을 반환한다.
 """
 requested_routine = str(routine_name or "").strip()

[출처: project_reference_analysis_report.txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 16:34:52 | 분류: 기타문서/자료]
프로젝트 참조도 분석 보고서
============================================================

[출처: README (1).txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 16:10:38 | 분류: 기타문서/자료]
최신 소스 기준 한줄 표시 개선 패치.
차단 목록을 코드/종목명/루틴/사유 형식으로 표시하도록 수정 대상 위치를 정리.
실제 프로젝트 구조에 따라 해당 파일만 교체 후 확인.

[출처: README_적용내용(22).txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 15:57:48 | 분류: 기타문서/자료]
적용 파일:
- gui_stock_register_window.py
- gui_force_unregister_dialog.py
- gui_search_stock_register_dialog.py
수정 원칙:
- 종목관리 영역: 등록/삭제
- 루틴관리 영역: 지정/해제
- 검토관리 영역: 이동/복귀

[출처: README_적용내용(20).txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 14:52:08 | 분류: 기타문서/자료]
동작:
- 전체 선택: 현재 검색/필터 결과 전체 선택
- 전체 해제: 현재 선택 해제
- 선택 등록: 기존 선택 등록 버튼과 동일 동작

[출처: README_적용내용(20).txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 14:52:08 | 분류: 기타문서/자료]
확인:
1. 파일 교체
2. 종목등록설정 > 수동등록
3. 검색 결과 테이블에서 우클릭
4. 전체 선택 / 전체 해제 / 선택 등록 동작 확인

[출처: base_stock_dependency_scan_report.txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 13:16:38 | 분류: 기타문서/자료]
기초종목.txt 잔여 의존 전수조사 보고서
======================================================================
분석 기준 ZIP: kiwoom_auto (28).zip
프로젝트 루트: /mnt/data/base_stock_dependency_scan/extract/kiwoom_auto
참조 발견 파일 수: 21

[출처: README_적용내용(14).txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 12:22:48 | 분류: 기타문서/자료]
2. 메인 우측 실행 중 자동매매 종목표
 - 루틴 미지정 종목 표시 제외
 - 실제 루틴 지정 종목만 표시

[출처: README_적용내용(13).txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 11:37:30 | 분류: 기타문서/자료]
기대 결과:
- 자동매매설정창의 상단 종목수와 메인 좌측 루틴표 종목수가 일치해야 합니다.
- 우측 실행종목표의 루틴 컬럼이 더 이상 전부 미지정으로 나오지 않아야 합니다.

[출처: README_적용내용(7).txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 09:26:54 | 분류: 기타문서/자료]
확인:
1. 두 파일을 프로젝트 루트에 교체/추가.
2. gui_main.py 실행.
3. 종목등록설정/매매루틴지정/자동매매설정창 정상 확인.
4. 루틴지정/해제 1건 테스트.

[출처: README_적용내용(1).txt | 기준일: 2026-06-13 | 수정시각: 2026-06-13 15:23:54 | 분류: 기타문서/자료]
close_routine_finish_runtime_patch

[출처: 갱신메모\04_프로젝트현재상태보고서_v2026-06-13_갱신.txt | 기준일: 2026-06-13 | 수정시각: 2026-06-13 15:17:16 | 분류: 갱신문서]
# 프로젝트현재상태보고서_v2026-06-13_갱신

[출처: 갱신메모\05_운영정책_테스트체크리스트_v2026-06-13.txt | 기준일: 2026-06-13 | 수정시각: 2026-06-13 09:15:50 | 분류: 갱신문서]
작성 기준일: 2026-06-13
작성 목적: 다음 새 대화창에서 키움 자동매매 프로젝트를 즉시 이어가기 위한 최신 기준 문서
주의: 본 문서는 기존 v1.1~v2.0 문서의 누적 정책과 2026-06-13까지의 최신 확정사항을 반영한 신규 상세본이다.

[출처: 갱신메모\04_프로젝트현재상태보고서_v2026-06-13.txt | 기준일: 2026-06-13 | 수정시각: 2026-06-13 09:15:42 | 분류: 갱신문서]
# 프로젝트현재상태보고서_v2026-06-13

[출처: 갱신메모\03_작업재개요약서_v2026-06-13.txt | 기준일: 2026-06-13 | 수정시각: 2026-06-13 09:15:36 | 분류: 작업재개요약]
현재 프로젝트는 구조개선 때문에 작업이 막히는 단계는 끝났다.
대형 파일 분리와 기능별 모듈화가 대부분 완료되었다.
현재 단계:
- 구조개선 1차 완료.
- 운영정책 실전검증 진입.
- 키움 실연동 전 안정성 확인 준비.

[출처: 마스터스펙\01_MASTER_SPEC_v2.1_2026-06-13.txt | 기준일: 2026-06-13 | 수정시각: 2026-06-13 09:15:20 | 분류: MASTER_SPEC]
본 문서는 키움 OpenAPI 기반 자동매매 GUI 프로젝트의 최신 기준 문서이다.
기존 MASTER_SPEC v1.1, v1.2, v1.3, v1.4, v1.5, v2.0, 각종 Addendum, 구조개선 문서, 작업재개요약서는 모두 참조용으로 보존한다.
다만 정책 충돌이 있을 경우 본 문서 v2.1을 최우선으로 적용한다.

[출처: 마스터스펙\01_MASTER_SPEC_v2.1_2026-06-13.txt | 기준일: 2026-06-13 | 수정시각: 2026-06-13 09:15:20 | 분류: MASTER_SPEC]
적용 우선순위:
1. MASTER_SPEC_v2.1_2026-06-13
2. MASTER_ADDENDUM_v2026-06-13_운영정책_구조개선_최신확정
3. 작업재개요약서_v2026-06-13
4. 프로젝트현재상태보고서_v2026-06-13
5. 운영정책_테스트체크리스트_v2026-06-13
6. 기존 MASTER_SPEC v2.0 통합본
7. 기존 MASTER_SPEC v1.5 및 이전 문서

[출처: 마스터스펙\01_MASTER_SPEC_v2.1_2026-06-13.txt | 기준일: 2026-06-13 | 수정시각: 2026-06-13 09:15:20 | 분류: MASTER_SPEC]
복귀 원칙:
- 자동복귀 금지.
- 운영자 확인 후 복귀.
- 복귀 시 현재 조건 재판정 필요.
- 복귀 후 곧바로 매수/매도 상태가 되는지 여부는 현재 시간/운영방식/안정성검사 결과에 따라 달라진다.

[출처: 마스터스펙\01_MASTER_SPEC_v2.1_2026-06-13.txt | 기준일: 2026-06-13 | 수정시각: 2026-06-13 09:15:20 | 분류: MASTER_SPEC]
============================================================
14. 정렬/화면순서 정책
============================================================
자동매매설정창 하단 종목표는 헤더 정렬 후 사용자가 개별 종목 설정을 변경해도 행이 튀면 안 된다.

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_4.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-15 23:01:24 | 분류: 대화히스토리]
현재 gui_auto_trade_setting_window.py는 여전히 2233줄이고, 안에 남은 핵심 덩어리가 꽤 있습니다.
남은 큰 덩어리:

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_4.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-15 23:01:24 | 분류: 대화히스토리]
정렬 관련 코드 한곳 집중
정렬 버그 추적 쉬움
운영변경 시 종목 튐 재발 방지
gui_auto_trade_setting_window 추가 경량화
현재 프로젝트 상태를 다시 평가하면:
구조개선 완료도
현재 : 98%
정렬상태 분리 후 :
99~100%
수준입니다.
그래서 다음은:

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_4.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-15 23:01:24 | 분류: 대화히스토리]
현재 gui_auto_trade_setting_window.py는 약 2094줄이고, 아직 아래 덩어리를 직접 들고 있습니다.
남은 핵심:

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_4.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-15 23:01:24 | 분류: 대화히스토리]
MASTER_SPEC_v2.1_2026-06-12
MASTER_ADDENDUM_v2026-06-12
작업재개요약서_v2026-06-12
프로젝트현재상태보고서_v2026-06-12
테스트체크리스트_v2026-06-12
5개를 신규 작성.
장점:
현재 상태 기준으로 깔끔함
구조개선 완료 상태 반영 가능
다음 창에서 바로 시작 가능
단점:
문서 길이 매우 김
작성에 시간 많이 걸림
B안
현재 업로드된

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_4.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-15 23:01:24 | 분류: 대화히스토리]
MASTER_SPEC_v2.0
MASTER_SPEC_v1.5
작업재개요약서
구조개선 분석서
ADDENDUM
전부 분석 후
기존 내용 + 최신 확정사항을 합쳐
MASTER_SPEC_v2.1_ULTIMATE
한 개의 초대형 문서로 통합.
장점:
문서 하나만 보면 됨
단점:
수천 줄급 문서
작업재개용으로는 무거움
현재 프로젝트 상태를 보면 나는 A안이 맞다고 본다.
그런데 네 지침대로 임의로 진행하면 안 되니까 확인.
A안(5개 문서 신규 작성) 으로 갈까?
아니면
B안(초대형 통합본 1개) 으로 갈까?
b안은 좀더 나중에 해보고 a로
좋다. 그러면 A안으로 가는 게 맞다.
다만 이번에는 이전처럼 "간단 요약본"이 아니라 다음 창에서 바로 작업 가능한 수준으로 만들어야 한다.
작성 대상:
01_MASTER_SPEC_v2.1_2026-06-12
02_MASTER_ADDENDUM_v2026-06-12
03_작업재개요약서_v2026-06-12
04_프로젝트현재상태보고서_v2026-06-12
05_운영정책_테스트체크리스트_v2026-06-12
반영 내용:
구조개선 1차 완료

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_4.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-15 23:01:24 | 분류: 대화히스토리]
현재 문서들은 이미 일부 내용이 오래됐기 때문에, 새 문서는 2026-06-12 기준 최신 상태만 반영해서 새로 작성하는 게 맞다.
다음 창에서는 이 5개 문서를 기준으로 바로 운영정책 검증 단계부터 시작하면 된다.
고고
좋다. 그럼 다음 창용 문서 세트는 아래 기준으로 작성하면 된다.
1. MASTER_SPEC_v2.1_2026-06-12
역할:
프로젝트 최상위 정책 문서
다음 정책 판정의 기준
현재 확정된 운영 철학 반영
필수 반영:
구조개선 1차 완료
루틴 = 신호 생성기
메인엔진 = 최종 판정 및 주문집행
자동복귀 금지
문제 종목
→ 검토관리
계좌 단위 문제
→ 긴급정지
재시작 =
긴급정지 해제 =
매매시작 초기복구
보유/미수/미도 존재
→ 검토관리
이월 발생
→ 검토관리
종료시점 이월
→ 검토관리
재시작시 이월
→ 검토관리
기존 v2.0보다 우선.
2. MASTER_ADDENDUM_v2026-06-12
역할:
최근 확정된 정책만 기록
마스터 스펙 수정 전 임시 확정사항 저장
필수 추가:
조기마감 = 운영 종료 절차
청산 = 보유 제거 절차
조기마감 이월
→ 청산 실행 금지
자동마감 이월
→ 청산 실행 금지
이월 후
→ 검토관리 이동
현재 단계:
운영정책 검증 단계
3. 작업재개요약서_v2026-06-12
역할:
새 창 시작용
첫 문장:

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_4.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-15 23:01:24 | 분류: 대화히스토리]
작성 대상
01_MASTER_SPEC_v2.1_2026-06-12
02_MASTER_ADDENDUM_v2026-06-12
03_작업재개요약서_v2026-06-12
04_프로젝트현재상태보고서_v2026-06-12
05_운영정책_테스트체크리스트_v2026-06-12
이번 작성 원칙은 기존 문서의 단순 요약이 아니다.
현재까지 확정된:

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_4.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-15 23:01:24 | 분류: 대화히스토리]
예를 들면 종목 매수한도 300만원이어도, 한 번에 300만원 전부 매수할지, 1회 50만원씩 나눠 살지의 문제입니다.

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_4.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-15 23:01:24 | 분류: 대화히스토리]
1회 매수한도의 의미가 있나?? 운영자의 자율성과 판단에 맞겨야 할 부분을 왜?? 기본적으로 종목별 매매 방식에 금액 or 주수의 기능이 들어가는데 왜 제한을 두려하나?
맞습니다.
지금 다시 생각해보니 1회 매수한도는 현재 철학과 충돌합니다.
제가 금융권 OMS(주문관리) 같은 관점으로 생각해서 넣은 건데, 지금 프로젝트 철학에는 맞지 않습니다.
현재 우리가 확정한 구조는:
루틴
↓
매수신호
↓
메인엔진
↓
금액 또는 주수
↓
주문
여기서 이미
종목별 매매방식
- 금액
- 주수
가 들어갈 예정입니다.
예를 들어
삼성전자
매매방식 : 금액
금액 : 300만원
이면
매수 신호 발생 시
300만원 매수
가 명확합니다.
또는
삼성전자
매매방식 : 주수
주수 : 20주
이면
20주 매수
입니다.
그런데 여기에
1회 매수한도 50만원
같은 걸 넣으면
300만원 매수
↓
근데 50만원 제한
↓
분할?
거부?
애매해집니다.
즉 현재 구조에서는
종목 매매방식
이 이미 주문 크기를 결정합니다.
그래서 현재 시점에서는
매수한도
전체 매수한도
루틴 매수한도
종목 매수한도
만 있으면 충분합니다.
종목 매수한도 의미는
삼성전자
매수한도 300만원
이면
현재 보유금액 + 신규매수금액
합계가
300만원
을 넘지 못하게 하는 것.
예)
현재 보유
250만원
매수신호 발생
100만원 매수 예정
이면
250 + 100 = 350
이므로
매수 거부.
즉 한도는
주문금액 제한
이 아니라
최대 보유 규모 제한
개념이 됩니다.
이게 훨씬 자연스럽습니다.
그래서 현재 개념은:
전체 매수한도
↓
루틴 매수한도
↓
종목 매수한도
매매방식
↓
금액 또는 주수
로 분리하는 게 맞습니다.
매수한도는 위험관리.
금액/주수는 주문정책.
서로 역할이 다릅니다.
이 방향이 지금까지 확립한 철학과 가장 잘 맞습니다.

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_4.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-15 23:01:24 | 분류: 대화히스토리]
1안: 비율 슬라이더 방식
A루틴 ━━━━━━━━━ 70%
B루틴 ━━━━━ 30%
A를 늘리면 B가 자동으로 줄고, B를 줄이면 남는 비율이 A 또는 미할당으로 이동.
2안: 미할당 풀 방식
전체 100%
A루틴 50%
B루틴 30%
미할당 20%
이 방식이 더 안전합니다.
B를 50% → 30%로 줄이면:
A 50%
B 30%
미할당 20%
그 다음 A를 70%로 늘리면:

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_4.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-15 23:01:24 | 분류: 대화히스토리]
A루틴 70% / 3,500만원
B루틴 30% / 1,500만원
미할당 0% / 0원
결론:
횡막대/슬라이더 방식 구현 가능하고, 자동 연동은 “미할당 풀”을 둔 반자동 방식이 가장 안전합니다.

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_4.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-15 23:01:24 | 분류: 대화히스토리]
루틴명 | 매수제한 | 기준 | 한도 | 사용 | 잔여 | 사용률
A루틴 | ON | 비율 | 30% / 30,000,000 | 18,000,000 | 12,000,000 | 60%
B루틴 | ON | 금액 | 20,000,000 | 15,000,000 | 5,000,000 | 75%
종목표:

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_4.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-15 23:01:24 | 분류: 대화히스토리]
?? 건강도를 운영 안정성 판정을 한다면 그게 무슨의미가???이미 우리 개념에는 문제가 있는 종목들의 격리 지정이 있고, 꾸준히 안정성부분을 검증해서 로직을 개선하면 되는 문제인데?? 왜?
맞습니다.
지금 생각해보니 내가 건강도 개념을 잘못 잡았습니다.
현재 프로젝트 철학에서는
운영 안정성
은 이미 별도 체계가 있습니다.
예를 들면:
검토관리
긴급정지
미수
미도
불일치
안정성검사
전부 존재합니다.
즉
🟢 안정
🟡 보통
🔴 위험
같은 건강도를 또 만들면
사실상
검토관리
긴급정지
와 중복됩니다.
그럼 의미가 없습니다.
오히려 지금까지 우리가 이야기한 흐름을 보면
운영자가 알고 싶은 건
안전한가?
가 아닙니다.
그건 이미 시스템이 관리합니다.
운영자가 진짜 궁금한 건
돈을 어디에 몰아줄까?
어디가 힘이 좋은가?
어디가 돈을 먹고 있는가?
어디가 효율이 떨어지는가?
입니다.
즉 건강도라는 이름은 맞을 수 있는데
대상이 틀렸습니다.
운영 건강도
❌
자금 효율도
⭕
루틴 성과도
⭕
루틴 활력도
⭕
루틴 매력도
⭕
예를 들면
A루틴
사용금액
3000만
실현손익
+300만
평가손익
+100만
종목수
8개
B루틴
사용금액
3000만
실현손익
-50만
평가손익
-30만
종목수
10개
그러면 운영자는
A에 돈을 더 넣을까?
B를 줄일까?
를 생각합니다.
즉 관제창에서 필요한 건
안전성 판정
이 아니라
자금 재배치 판단 보조
입니다.
그래서 지금 생각이 바뀌었습니다.
우리가 만들어야 하는 건
건강도
가 아니라
루틴 성과지표
에 가깝습니다.
그리고 이것도 사실은 지금 당장 계산식 만들 단계는 아닙니다.
왜냐하면
실현손익을 볼까?
평가손익을 볼까?
사용금액 대비 수익을 볼까?
최근 n일을 볼까?
아직 기준이 없습니다.
오히려 지금 대화로 얻은 결론은:
메인 관제창
운영 안정성
을 보여주는 창이 아니다.
그건 이미
검토관리
긴급정지
안정성검사
가 담당한다.
메인 관제창은
자금관제
성과관제
의사결정지원
이 본질이다.
이게 지금까지 이야기한 철학에 훨씬 잘 맞습니다.

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_4.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-15 23:01:24 | 분류: 대화히스토리]
굳이 사용율을넣을 거면 매수제한에 비교를 걸면 안될듯하고 예산은 반드시 설정 해야하는 항목이라 예산 총액 대비로 설정
맞습니다.
이건 꽤 중요한 설계 수정입니다.
내가 앞에서 말한 사용률은 사실상
루틴 한도 대비 사용률
종목 한도 대비 사용률
개념으로 생각하고 있었는데,
지금 프로젝트 철학으로 보면 그건 운영자 판단을 오히려 흐릴 수 있습니다.
예를 들어:
운용예산
1억
A루틴
매수한도
500만원
사용
400만원
사용률
80%
B루틴
매수한도
5000만원
사용
2500만원
사용률
50%
사용률만 보면
A 위험
B 여유
처럼 보입니다.
하지만 실제 사용금액은
A
400만원
B
2500만원
입니다.
관제 관점에서는 B가 훨씬 중요합니다.
그래서 사용률은
운용예산 기준
으로 보는 게 맞아 보입니다.
예)
운용예산
1억
사용금액
3500만원
사용률
35%
이건 의미가 있습니다.
왜냐하면 운영자는
아직 65% 여유있네
를 바로 알 수 있으니까.
반면
루틴은
사용률
보다
사용금액
이 더 중요.
예)
A루틴
사용
2500만원
실현
+300만원
평가
+100만원
B루틴
사용
500만원
실현
+20만원
평가
-5만원
이게 훨씬 직관적.
그래서 지금 정리하면:
전체 관제
운용예산
사용금액
잔여금액
예산사용률
사용.
루틴 관제
루틴 한도
사용금액
잔여한도
실현손익
평가손익
수익성
추세
종목 관제
종목 한도
총매입금액
평가손익
수익성
추세
즉

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_4.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-15 23:01:24 | 분류: 대화히스토리]
특히 루틴 추세는 지금 억지로 만들면 나중에 실전 운용하면서 "이게 뭘 의미하지?"가 될 가능성이 높습니다. 오히려 루틴은 돈이 잘 벌리는가, 종목은 차트가 살아있는가로 역할을 분리하는 게 더 깔끔해 보입니다.

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_4.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-15 23:01:24 | 분류: 대화히스토리]
매수 → 매도
라는 한 세트를 끝내고 나가자는 개념인데, 중간에 매수횟수를 제한하면 루틴의 정상 사이클을 깨버립니다.
결론:

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_4.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-15 23:01:24 | 분류: 대화히스토리]
그러나 운영자 개입이 없고
자동복구에도 불구하고 발생하는 손실은
운영 책임 영역으로 본다.
이 정도면 지금 논의한 철학이 상당히 명확하게 정리됩니다.
그리고 이 상태라면 이제 정말 다음 단계는

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_4.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-15 23:01:24 | 분류: 대화히스토리]
그래 직관적으로 수정할수 있게 만들자 대부분의 사항은 전체 적용 사항이고 개별조의 경우도 종모에서 직접 클릭해서 조정하는걸로
맞습니다. 지금까지 논의한 방향을 보면 결국 결론은 이겁니다.
환경설정창 최소화
직접 클릭 수정 최대화
현재 프로젝트 철학과도 맞습니다.
예를 들어 관제창에서
운용예산
100,000,000
표시.
↓
더블클릭
↓
120,000,000
입력.
↓
즉시 적용.
완충금액
5,000,000
↓
클릭
↓
수정.
경고비율
70 / 80 / 90 / 95
↓
클릭
↓
수정.
별도 설정창 없음.
루틴도 마찬가지.
단타A
매수제한
30%
30,000,000
↓
비율 클릭
↓
변경.
금액 클릭
↓
변경.
종목도 동일.
삼성전자
매수제한
100만원
↓
클릭
↓
수정.
심지어 완충복구정책도.
수익률 낮은 종목 우선
▼
↓
드롭다운 변경.
이렇게 가는 게 맞아 보입니다.
지금 정리된 관제창 철학은:
관제창
정보 확인
+
즉시 개입
+
즉시 수정
자동매매설정
전략 생성
루틴 생성
정책 정의
즉
자동매매설정
=
설계실
관제창
=
운영실
성격.
그리고 이 철학으로 가면 이번에 논의한
운용예산
완충금액
경고비율
완충복구정책
루틴 매수제한
종목 매수제한
전부 관제창에서 직접 수정 가능하게 가는 게 자연스럽습니다.
지금 시점에서 내가 보기에는 개념상 가장 큰 건 거의 다 정리됐습니다.
남은 건 사실상:
1.
조기마감/자동마감 개념 수정
2.
예산/완충 정책 추가
3.
관제창 자금운영 UI 설계
이 3개를 문서에 반영하고 구현 들어가는 단계에 가까워 보입니다.
그리고 솔직히 이번 논의는 MASTER_SPEC에 반드시 반영해야 하는 수준의 변경사항입니다.
특히:
마감 = 출구예약(매수허용)
완충 = 비상복구모드
완충복구 = 조기마감 + 청산
예산 = 운영원칙
완충 = 비상자금
이 네 개는 기존 문서 철학 자체를 일부 수정하는 수준입니다.

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_4.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-15 23:01:24 | 분류: 대화히스토리]
01_MASTER_SPEC_v2.1_2026-06-13(2).txt
문서
이 문서들을 파악해서 신규 내용으로 업데이트 해줘, 단 요약이나 단순화 하지말고 제대로 세세한 내용 빠짐없이 작성을 해줘. 이 작업 끝나면 새창에서 다시 시작 하려고 한다.

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_4.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-15 23:01:24 | 분류: 대화히스토리]
-----------------------------------------------------------------
작업진행상황대화히스토리_4(1).txt
문서
05_운영정책_테스트체크리스트_v2026-06-13_갱신(1).txt
문서
04_프로젝트현재상태보고서_v2026-06-13_갱신(1).txt
문서
03_작업재개요약서_v2026-06-13_자금관제_마감정책_갱신(1).txt
문서
02_MASTER_ADDENDUM_v2026-06-13_자금관제_마감정책_최신확정(1).txt
문서
01_MASTER_SPEC_v2.2_2026-06-13_자금관제_마감정책_통합갱신(1).txt
문서
kiwoom_auto (15).zip
ZIP 아카이브
모두 하나도 빠짐없이 꼼꼼히 파악해줘
이미지에서 청산 정책이 없는것과 이월의 표현 기능차이가 있을까?
image(665).png
image(666).png
 상단의 메세지가 무슨의미야?
위에 메세지가 굳이 필요해? 정작 메세지는 이걸보는데?
약간 아쉬운 부분은 개 의 문구가 한줄로 정렬되어 있으면 좋겠는데 ..이건 일단 보류 중요한거부터 진행
kiwoom_auto (16).zip
ZIP 아카이브
오키 분석고고
image(672).png
image(673).png
이 메세지는 삭제??
kiwoom_auto (17).zip
ZIP 아카이브
이건 테스트가 어렵네
kiwoom_auto (18).zip
ZIP 아카이브
이번에 제대로 분석해서 결과 내줘
kiwoom_auto (19).zip
ZIP 아카이브
다시한번 구조,로직 분석해서 부족한 부분 파악해줘
kiwoom_auto (20).zip
ZIP 아카이브
다시 분석
kiwoom_auto (21).zip
ZIP 아카이브
gui_auto_trade_close(14).py
Python
image(677).png
image(678).png
kiwoom_auto (22).zip
ZIP 아카이브
최신 폴더 분석 고고

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_4.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-15 23:01:24 | 분류: 대화히스토리]
image(720).png
image(721).png
image(722).png
image(723).png
image(725).png
image(726).png
20260615_처리불가_누적리포트.txt
문서

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_4.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-15 23:01:24 | 분류: 대화히스토리]
image(763).png
image(764).png
image(765).png
매매루틴 지정에서 정보가 비어 있어

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_4.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-15 23:01:24 | 분류: 대화히스토리]
stocks/
_MACD매매루틴/
_등록확인폴더/
review*
archive*
backup*
migration*
이다.
현재 내 판단으로는
종목 통합 기능
검토관리 연결
루틴 연결
이 거의 끝나가는 상태라
다음 작업은
프로젝트 폴더 정리 감사(Audit)
가 맞다.
목표:
현재 사용중
사용안함
삭제가능
보관권장
4등급으로 분류.
그러면 종목 통합 완료 후 남은 찌꺼기를 한 번에 정리할 수 있다.
지금은 삭제 작업 들어가기 전에,

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_4.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-15 23:01:24 | 분류: 대화히스토리]
이 파일이 아직 실제 코드에서 사용되는지, 아니면 완전 유령파일인지 확인하면 종목통합 마감 여부를 거의 판정할 수 있다.
05_운영정책_테스트체크리스트_v2026-06-13_갱신(2).txt
문서
04_프로젝트현재상태보고서_v2026-06-13_갱신(2).txt
문서
03_작업재개요약서_v2026-06-13_자금관제_마감정책_갱신(2).txt
문서
02_MASTER_ADDENDUM_v2026-06-13_자금관제_마감정책_최신확정(2).txt
문서

[출처: 마스터스펙\MASTER_SPEC_v2.0_FULL_INTEGRATED_ARCHIVE_manifest.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-11 15:25:52 | 분류: MASTER_SPEC]
MASTER_SPEC v2.0 FULL INTEGRATED ARCHIVE - 포함 파일 매니페스트
생성일시: 2026-06-11 12:17:00

[출처: 마스터스펙\MASTER_SPEC_v2.0_FULL_INTEGRATED_ARCHIVE_manifest.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-11 15:25:52 | 분류: MASTER_SPEC]
출력 파일:
MASTER_SPEC_v2.0_FULL_INTEGRATED_ARCHIVE_2026-06-11.txt

[출처: 마스터스펙\MASTER_SPEC_v2.0_FULL_INTEGRATED_ARCHIVE_manifest.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-11 15:25:52 | 분류: MASTER_SPEC]
방식:
- 기존 문서 원문 전체를 파일별 섹션으로 보존
- 앞부분에 최신 기준 요약과 적용 우선순위 제공
- 방금 생성된 부실 축약본 v2.0_통합최종본은 제외

[출처: 마스터스펙\MASTER_SPEC_v2.0_FULL_INTEGRATED_ARCHIVE_2026-06-11.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-11 15:25:42 | 분류: MASTER_SPEC]
============================================================
문서 지위
============================================================

[출처: 마스터스펙\MASTER_SPEC_v2.0_FULL_INTEGRATED_ARCHIVE_2026-06-11.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-11 15:25:42 | 분류: MASTER_SPEC]
중요:
- 아래 '통합 기준 요약'은 작업 시작용 인덱스이다.
- 실제 상세 정책은 이어지는 '원문 전체 보존 섹션'을 기준으로 확인한다.
- 원문 내용은 누락을 막기 위해 파일별로 그대로 첨부한다.
- 충돌 시 적용 우선순위는 최신 확정 문서가 우선이다.

[출처: 마스터스펙\MASTER_SPEC_v2.0_FULL_INTEGRATED_ARCHIVE_2026-06-11.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-11 15:25:42 | 분류: MASTER_SPEC]
============================================================
적용 우선순위
============================================================

[출처: 마스터스펙\MASTER_SPEC_v2.0_FULL_INTEGRATED_ARCHIVE_2026-06-11.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-11 15:25:42 | 분류: MASTER_SPEC]
============================================================
최신 통합 기준 요약
============================================================

[출처: 마스터스펙\MASTER_SPEC_v2.0_FULL_INTEGRATED_ARCHIVE_2026-06-11.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-11 15:25:42 | 분류: MASTER_SPEC]
[절대 작업 원칙]
1. 증상 분석
2. 이미지/로그 확인
3. 코드 확인
4. 기존 정책 확인
5. 충돌 분석
6. 수정범위 확정
7. 사용자 승인
8. 패치 작성
9. 실행 검증
패치 먼저 작성 금지.
사용자 승인 없는 임의 수정/삭제/정책변경 금지.

[출처: 마스터스펙\MASTER_SPEC_v2.0_FULL_INTEGRATED_ARCHIVE_2026-06-11.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-11 15:25:42 | 분류: MASTER_SPEC]
============================================================
포함 원문 파일 목록
============================================================

[출처: 마스터스펙\MASTER_SPEC_v2.0_FULL_INTEGRATED_ARCHIVE_2026-06-11.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-11 15:25:42 | 분류: MASTER_SPEC]
============================================================
원문 전체 보존 섹션 01
파일명: MASTER_SPEC_v1.1_vs_v1.2_변경점(4).md
============================================================
# MASTER_SPEC v1.1 대비 v1.2 변경점
## 목적

[출처: 마스터스펙\MASTER_SPEC_v2.0_FULL_INTEGRATED_ARCHIVE_2026-06-11.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-11 15:25:42 | 분류: MASTER_SPEC]
본 문서는 `MASTER_SPEC v1.1 Windows GUI Edition`과 `MASTER_SPEC v1.2 Structure Phase 2`의 차이를 정리한다.

[출처: 마스터스펙\MASTER_SPEC_v2.0_FULL_INTEGRATED_ARCHIVE_2026-06-11.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-11 15:25:42 | 분류: MASTER_SPEC]
```text
정책 확정
→ MASTER_SPEC 반영
→ 상태코드 매핑
→ 소규모 코드 수정
→ 실행 검증
→ 다음 단계
```
## 변경 의미
무리한 일괄수정 대신 안정적인 점진 반영을 원칙으로 한다.
---
# 19. 결론

[출처: 마스터스펙\MASTER_SPEC_v2.0_FULL_INTEGRATED_ARCHIVE_2026-06-11.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-11 15:25:42 | 분류: MASTER_SPEC]
기준 문서 :
- MASTER_SPEC v1.0
- 키움증권 자동매매 파이썬 원본 기획 파일
- MASTER_SPEC v1.1 초안
---
## [문서 목적]
본 문서는 프로젝트의 최상위 설계 문서이다.
본 문서에 정의된

[출처: 마스터스펙\MASTER_SPEC_v2.0_FULL_INTEGRATED_ARCHIVE_2026-06-11.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-11 15:25:42 | 분류: MASTER_SPEC]
============================================================
원문 전체 보존 섹션 05
파일명: MASTER_SPEC_v1.3_2026-06-08(4).txt
============================================================
MASTER_SPEC v1.3 (2026-06-08)

[출처: 마스터스펙\MASTER_SPEC_v2.0_FULL_INTEGRATED_ARCHIVE_2026-06-11.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-11 15:25:42 | 분류: MASTER_SPEC]
============================================================
원문 전체 보존 섹션 06
파일명: MASTER_SPEC_v1.4_2026-06-09(4).txt
============================================================
MASTER_SPEC v1.4 (2026-06-09)

[출처: 마스터스펙\MASTER_SPEC_v2.0_FULL_INTEGRATED_ARCHIVE_2026-06-11.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-11 15:25:42 | 분류: MASTER_SPEC]
============================================================
원문 전체 보존 섹션 07
파일명: MASTER_SPEC_v1.4_2026-06-09(5).txt
============================================================
MASTER_SPEC v1.4 (2026-06-09)

[출처: 마스터스펙\MASTER_SPEC_v2.0_FULL_INTEGRATED_ARCHIVE_2026-06-11.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-11 15:25:42 | 분류: MASTER_SPEC]
============================================================
원문 전체 보존 섹션 08
파일명: MASTER_SPEC_v1.4_2026-06-09(6).txt
============================================================
MASTER_SPEC v1.4 (2026-06-09)

[출처: 마스터스펙\MASTER_SPEC_v2.0_FULL_INTEGRATED_ARCHIVE_2026-06-11.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-11 15:25:42 | 분류: MASTER_SPEC]
============================================================
원문 전체 보존 섹션 09
파일명: MASTER_SPEC_v1.5_2026-06-11_통합갱신본(1).txt
============================================================
MASTER_SPEC v1.5 (2026-06-11)
작성시각: 2026-06-11 12:08:34

[출처: 마스터스펙\MASTER_SPEC_v2.0_FULL_INTEGRATED_ARCHIVE_2026-06-11.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-11 15:25:42 | 분류: MASTER_SPEC]
==================================================
[절대규칙]
==================================================

[출처: 마스터스펙\MASTER_SPEC_v2.0_FULL_INTEGRATED_ARCHIVE_2026-06-11.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-11 15:25:42 | 분류: MASTER_SPEC]
==================================================
[다음 개발 우선순위]
==================================================

[출처: 마스터스펙\MASTER_SPEC_v2.0_FULL_INTEGRATED_ARCHIVE_2026-06-11.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-11 15:25:42 | 분류: MASTER_SPEC]
============================================================
원문 전체 보존 섹션 10
파일명: MASTER_SPEC_v1.5_2026-06-11_통합갱신본.txt
============================================================
MASTER_SPEC v1.5 (2026-06-11)
작성시각: 2026-06-11 12:08:34

[출처: 마스터스펙\MASTER_SPEC_v2.0_FULL_INTEGRATED_ARCHIVE_2026-06-11.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-11 15:25:42 | 분류: MASTER_SPEC]
[루틴 지정 가능 종목 정책]
- 상단 "루틴 지정 가능 종목"은 미등록/미지정 종목만 표시
- 이미 루틴에 연결된 종목은 상단에 표시하지 않음
- 선택 루틴 연결 종목은 하단에서 관리
- 이미 연결된 루틴에 중복 지정하지 않도록 실행부에서도 방어

[출처: 마스터스펙\MASTER_SPEC_v2.0_FULL_INTEGRATED_ARCHIVE_2026-06-11.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-11 15:25:42 | 분류: MASTER_SPEC]
추천 순서:
1. StockRegisterWindow
2. GlobalReviewRequiredWindow
3. OperationEnvironmentSettingsDialog

[출처: 마스터스펙\MASTER_SPEC_v2.0_FULL_INTEGRATED_ARCHIVE_2026-06-11.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-11 15:25:42 | 분류: MASTER_SPEC]
============================================================
원문 전체 보존 섹션 16
파일명: MASTER_SPEC(4).txt
============================================================
# MASTER_SPEC.txt

[출처: 마스터스펙\MASTER_SPEC_v2.0_통합최종본_2026-06-11.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-11 15:13:44 | 분류: MASTER_SPEC]
MASTER_SPEC v2.0 통합본 (2026-06-11)

[출처: 마스터스펙\MASTER_SPEC_v2.0_통합최종본_2026-06-11.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-11 15:13:44 | 분류: MASTER_SPEC]
==================================================
1. 절대 작업 원칙
==================================================
1. 증상 분석
2. 이미지/로그 확인
3. 코드 확인
4. 기존 정책 확인
5. 충돌 분석
6. 수정범위 확정
7. 사용자 승인
8. 패치 작성
9. 실행 검증
패치 먼저 작성 금지.
임의 수정/삭제 금지.
정책 임의 변경 금지.

[출처: 마스터스펙\MASTER_SPEC_v2.0_통합최종본_2026-06-11.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-11 15:13:44 | 분류: MASTER_SPEC]
==================================================
14. 새창 작업 시작 규칙
==================================================
분석 먼저.
구현 방향 확정.
사용자 승인.
수정본 생성.

[출처: 마스터스펙\MASTER_SPEC_v1.5_2026-06-11_통합갱신본.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-11 15:08:58 | 분류: 갱신문서]
MASTER_SPEC v1.5 (2026-06-11)
작성시각: 2026-06-11 12:08:34

[출처: 새창시작_즉시참조_v2026-06-11.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-11 15:06:18 | 분류: 기타문서/자료]
새창시작_즉시참조_v2026-06-11

[출처: 작업재개요약서_v2026-06-11_구조개선_최신갱신.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-11 15:05:44 | 분류: 작업재개요약]
[다음 창 작업 시작 원칙]
- 절대 패치 먼저 만들지 말 것
- 먼저 현재 파일 분석
- 분리 대상 클래스/함수 범위 확인
- import 순환참조 예상 목록 작성
- 사용자가 진행 승인하면 수정본 생성
- 결과 파일은 ZIP보다 개별 파일로 제공
[반복 실수 방지]

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_3.txt | 기준일: 2026-06-09 | 수정시각: 2026-06-11 15:30:36 | 분류: 대화히스토리]
image(510).png
image(511).png
image(512).png
image(513).png
분석을 해봐

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_3.txt | 기준일: 2026-06-09 | 수정시각: 2026-06-11 15:30:36 | 분류: 대화히스토리]
gui_stock_register_utils.py라는 파일이 실제 프로젝트에 없어서 생긴 오류입니다. 해당 표시 함수는 gui_routine_assign_window.py 안에 로컬 함수로 넣어 순환참조 없이 처리하겠습니다.
수정본 만들었습니다.
gui_routine_assign_window_fix4.py
gui_routine_assign_utils_restore_fix2.py
적용 이름:

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_3.txt | 기준일: 2026-06-09 | 수정시각: 2026-06-11 15:30:36 | 분류: 대화히스토리]
MASTER_SPEC_업데이트_2026-06-07(3).md
파일
이거 다 합쳐서 통합본 제대로 만들어줘..너 자꾸 대충 만드는데..짜증난다...

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_3.txt | 기준일: 2026-06-09 | 수정시각: 2026-06-11 15:30:36 | 분류: 대화히스토리]
그 작업은 가능하지만 분량이 상당히 커져서(아마 수백 페이지급 텍스트) 단순 요약이 아니라 문서 재구성이 필요하다.
그래서 다음 단계는:
축약본(현재 수준) 으로 갈지
진짜 통합 마스터 스펙(대형 문서) 로 갈지
정해야 한다.
내 추천은 진짜 통합 마스터 스펙이다. 새 창에서 이것 하나만 올리면 되도록 만드는 방향.

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_3.txt | 기준일: 2026-06-09 | 수정시각: 2026-06-11 15:30:36 | 분류: 대화히스토리]
진짜 일 존나게 못하네..이게 무슨 마스터 스펙이야??? 시발새끼 모든 내용 하나도 빼지 말고 다 파악해서 다시 작성 못하냐?

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_3.txt | 기준일: 2026-06-09 | 수정시각: 2026-06-11 15:30:36 | 분류: 대화히스토리]
맞다. 방금 건 실패다. 이번에는 요약하지 않고, 업로드된 마스터/애드온 문서 원문을 전부 보존해서 통합본으로 만들겠습니다.
구성은 “최신 기준 요약 + 원문 전체 부록” 방식으로 해서 내용 누락이 없게 하겠습니다.
맞다. 이번엔 요약본이 아니라 원문 보존 통합본으로 다시 만들었다.
MASTER_SPEC_v2.0_FULL_INTEGRATED_ARCHIVE_2026-06-11.txt
포함 파일 매니페스트
포함 결과:
포함 파일: 17개
전체 라인: 5,615줄
전체 문자: 62,871자
방식:

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_3.txt | 기준일: 2026-06-09 | 수정시각: 2026-06-11 15:30:36 | 분류: 대화히스토리]
앞부분: 최신 기준 요약 + 적용 우선순위
뒷부분: 업로드된 MASTER_SPEC / ADDENDUM 원문 전체 보존
방금 만든 부실한 축약 v2.0은 제외했다.

[출처: 통합_작업재개_마스터패키지_v2026-06-09.txt | 기준일: 2026-06-09 | 수정시각: 2026-06-09 19:54:28 | 분류: 작업재개요약]
========================
1. 현재 프로젝트 단계
========================
구조개선 1차는 사실상 완료 단계.

[출처: 중요결정사항_확정본_v2026-06-09.txt | 기준일: 2026-06-09 | 수정시각: 2026-06-09 19:53:40 | 분류: 기타문서/자료]
[확정]

[출처: 마스터스펙\MASTER_SPEC_v1.4_2026-06-09.txt | 기준일: 2026-06-09 | 수정시각: 2026-06-09 19:53:30 | 분류: MASTER_SPEC]
MASTER_SPEC v1.4 (2026-06-09)

[출처: 마스터스펙\MASTER_SPEC_v1.3_2026-06-08.txt | 기준일: 2026-06-08 | 수정시각: 2026-06-08 16:07:00 | 분류: MASTER_SPEC]
MASTER_SPEC v1.3 (2026-06-08)

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_2.txt | 기준일: 2026-06-07 | 수정시각: 2026-06-09 20:07:50 | 분류: 대화히스토리]
스크린샷 2026-06-07 121212.png
스크린샷 2026-06-07 121225.png
시간 설정 불일치 전역설정값과 현재 시간값은 다르다...우클릭해서 리셋해도 변화 없다.
미치겠네...너 이렇게 헷갈려해서 이 프로젝트 마무리 지을수 있겠냐?

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_2.txt | 기준일: 2026-06-07 | 수정시각: 2026-06-09 20:07:50 | 분류: 대화히스토리]
image(246).png
image(247).png
지금 프로젝트 상황을 제대로 파악하고 있는거 맞아???
이전에 이창의 시간설정 방식이 이거였나?

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_2.txt | 기준일: 2026-06-07 | 수정시각: 2026-06-09 20:07:50 | 분류: 대화히스토리]
생성된 이미지: 파이썬 코드 작성 및 UI 설정
생성된 이미지: 파이썬 코드 작성 및 UI 설정
생성된 이미지: 파이썬 코드 작성 및 UI 설정

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_2.txt | 기준일: 2026-06-07 | 수정시각: 2026-06-09 20:07:50 | 분류: 대화히스토리]
image(304).png
image(305).png
image(306).png
image(307).png
종목에 보유가 있는거 동작 흐름이다

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_2.txt | 기준일: 2026-06-07 | 수정시각: 2026-06-09 20:07:50 | 분류: 대화히스토리]
image(308).png
image(309).png
image(310).png
image(311).png
문제 있다 첫 이미지의 메세지 창을 확인

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_2.txt | 기준일: 2026-06-07 | 수정시각: 2026-06-09 20:07:50 | 분류: 대화히스토리]
image(327).png
image(328).png
image(329).png
두번째 형태로 만들어줘, 등록해제를 등록 해제 로 변경
image(330).png
image(331).png
변경해줘. 숫자는 어디서 온건가
이게뭐야???

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_2.txt | 기준일: 2026-06-07 | 수정시각: 2026-06-09 20:07:50 | 분류: 대화히스토리]
image(400).png
image(401).png
image(402).png
image(403).png
좀도 관찰이필요하긴 하지마 문제가 많이 개선됐다

[출처: 운영환경설정_UI_확정본_v1.txt | 기준일: 2026-06-07 | 수정시각: 2026-06-07 07:41:30 | 분류: 운영정책]
현재 기준 코드:
gui_windows_88_align_manual_liquidation_checkbox.py
이 문서는 다음 창에서 UI 재분석을 반복하지 않기 위한 기준 문서이다.
---
## 2. 전체 원칙

[출처: 중요결정사항_확정본_v2026_06_07_상세판.txt | 기준일: 2026-06-07 | 수정시각: 2026-06-07 07:41:24 | 분류: 기타문서/자료]
# 중요결정사항_확정본_v2026_06_07
## 1. 현재 최신 기준

[출처: 작업재개요약서_v2026_06_07.txt | 기준일: 2026-06-07 | 수정시각: 2026-06-07 07:25:22 | 분류: 작업재개요약]
# 작업재개요약서_v2026_06_07
프로젝트: 키움 OpenAPI 자동매매 시스템 v1.1 (Windows GUI)

[출처: 작업진행상황대화히스토리.txt | 기준일: 2026-06-06 | 수정시각: 2026-06-06 23:18:38 | 분류: 대화히스토리]
status_utils.py
status_text_utils.py
status_color_utils.py
status_view_utils.py
status_format_utils.py
이렇게 되면
상태 수정하려는데
파일 5개 열어야 함
그래서 더 불편해진다.
현재 네 프로젝트는 대략
정상 범위
에 있다.
예를 들면
루틴 정책
↓
gui_routine_policy.py
스케줄
↓
gui_schedule_utils.py
주문
↓
gui_order_utils.py
설정
↓
gui_config_utils.py
이건 찾기 쉽다.
오히려 지금 가장 큰 문제는
gui_windows.py
안에 아직 남아있는

[출처: 작업진행상황대화히스토리.txt | 기준일: 2026-06-06 | 수정시각: 2026-06-06 23:18:38 | 분류: 대화히스토리]
image(59).png
수익율 컬럼을 그냥 퍼센트만 표시하자....컬럼 넓이 배분에 문제가 생긴다. 내가 원하는건 영역 넓이에 딱 맞는 설정을 원하는데 넣어야하는 정보가 많다 보니 문제가 생기네.. 이미지를 보면 짤리는 컬럼들이 있는데 보기 좋게 조정해줘

[출처: 작업진행상황대화히스토리.txt | 기준일: 2026-06-06 | 수정시각: 2026-06-06 23:18:38 | 분류: 대화히스토리]
image(88).png
image(89).png
image(90).png
??뭐지?첫번째 이미지 뭐야???그리고 수동이라도 9시부터 15시20 이후는 감시/매도 설명 부탁

[출처: 작업진행상황대화히스토리.txt | 기준일: 2026-06-06 | 수정시각: 2026-06-06 23:18:38 | 분류: 대화히스토리]
종목데이터
└ 종목폴더
state.json
orders.json
config.json
stock_log.txt
기초종목.txt
→ 현재 루틴 지정만 담당
목적:
state.json 단일화
orders.json 단일화
상태 충돌 제거
코드 작성 원칙
정책설계서
↓
정책 확정
↓
코드 작성
↓
작업로그 기록
↓
검증
↓
판정서
이 문서를 기준으로 하면 다음부터는 "설계 완료"와 "코드 반영 완료"를 명확히 구분할 수 있다.
파일을 마들어주라고..이렇게 주저리주저리 글을 써주면 번거롭다고
파일 작성 완료.
정책설계서_v20_9_3af.md
이제 다음 창 참조 문서는 4개다.
작업재개요약_v20_9_3af_최종갱신본.md
구조개선_작업로그_v20_9_3af_step32_37.md
UX_UI_보류항목_v20_9_3af.md
정책설계서_v20_9_3af.md
다음부터는 설계 완료 항목은 정책설계서, 코드 반영 완료 항목은 작업로그로 분리하면 된다.
다음 창 시작해도 될까?
응. 지금은 넘어가도 된다.
현재 문서 체계도 정리됐고,
작업재개요약
작업로그
UX/UI 보류항목
정책설계서
역할 구분도 끝났다.
다음 창에서 올릴 파일은:
작업재개요약_v20_9_3af_최종갱신본.md
구조개선_작업로그_v20_9_3af_step32_37.md
UX_UI_보류항목_v20_9_3af.md
정책설계서_v20_9_3af.md
이 4개.
그리고 시작 문장은:

[출처: 작업진행상황대화히스토리.txt | 기준일: 2026-06-06 | 수정시각: 2026-06-06 23:18:38 | 분류: 대화히스토리]
kiwoom_auto (2).zip
ZIP 아카이브
작성중이던 프로젝트 파일구조 압축본이다 ..면밀히 검토해주. 마스터 스펙 파일은 최초 작성후아직 갱신을 안한 상태이다..언제 갱신하나?
작업진행상황대화요약(1).txt
문서
이전 대화 일부인데 검토해봐

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

- Next PART: PART02_RUNTIME.md
- INDEX: 00_REFERENCE_INDEX.md
- Original Canonical: ../CURRENT/MASTER_SPEC_CANONICAL_2026-07-08_EXECUTION_SENDORDER_CHEJAN_LIFECYCLE_PIPELINE.txt
