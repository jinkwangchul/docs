# MASTER_SPEC AI Reference Edition Index

Reference Edition

Original Canonical: MASTER_SPEC_CANONICAL_2026-07-08_RUNTIME_LAYER_PHASE1_RUNTIME_PROJECTION_MERGED.txt

생성일: 2026-07-09

주의: 본 문서는 AI 참조용 분할본이며 공식 원본은 CURRENT의 Canonical이다.

## Reference 구조

이 디렉터리는 Runtime Layer Phase1 MASTER_SPEC Canonical을 AI 참조용으로 분할한 Reference Edition이다. 기존 Canonical은 수정하지 않았으며 공식 Source of Truth는 00_CANONICAL/CURRENT/MASTER_SPEC_CANONICAL_2026-07-08_RUNTIME_LAYER_PHASE1_RUNTIME_PROJECTION_MERGED.txt 이다.

원본 순서 보존 방식:

- PART01부터 PART09까지 Original Body Marker 사이의 본문을 순서대로 이어 붙이면 원본 Canonical 본문과 일치한다.
- PART02_RUNTIME.md는 Runtime 상세 규격 우선 참조 위치이다.
- PART08_OPERATION_POLICY.md는 29.x Execution 요약 및 교차참조 위치이다.
- PART01부터 PART05의 하위 SUBPART는 기존 SUBPART 체계를 유지하기 위한 AI 우선 참조 파일이다.
- 원본 Canonical에 본문이 없는 예약 PART/SUBPART는 Original Body Marker 사이가 비어 있다.
- 각 PART와 SUBPART의 header/footer는 Reference Edition 안내와 탐색 링크이며 원본 Canonical 본문이 아니다.

## PART 목록

| PART | 포함 섹션 | 파일 크기 |
|---|---|---:|
| PART01_SYSTEM_FOUNDATION.md | Canonical preface and Runtime Layer Phase1 integration summary | 1900 bytes |
| PART02_RUNTIME.md | 02_Runtime_Data_Model: Runtime Projection / Persistence Preview / Recovery Preview / Reconciliation Preview / Preview Safety | 7002 bytes |
| PART03_GUI.md | Reserved; no original body assigned | 680 bytes |
| PART04_ROUTINE.md | Reserved; no original body assigned | 686 bytes |
| PART05_RULE_APPROVAL.md | Reserved; no original body assigned | 700 bytes |
| PART06_EXECUTION_PREVIEW.md | Reserved; no original body assigned | 713 bytes |
| PART07_EXECUTION_CONTROLLER.md | Reserved; no original body assigned | 716 bytes |
| PART08_OPERATION_POLICY.md | 29.x Execution: Runtime Layer Phase1 summary and cross-reference | 3055 bytes |
| PART09_APPENDIX.md | Appendix: implementation commits, tests, cautions | 1862 bytes |

## SUBPART 목록

| SUBPART | Source Full Part | 순서 | 파일 크기 | 참조 기준 |
|---|---|---:|---:|---|
| PART01_01_SYSTEM_FOUNDATION.md | PART01_SYSTEM_FOUNDATION.md | 1/4 | 870 bytes | AI 우선 참조 |
| PART01_02_SYSTEM_FOUNDATION.md | PART01_SYSTEM_FOUNDATION.md | 2/4 | 968 bytes | AI 우선 참조 |
| PART01_03_SYSTEM_FOUNDATION.md | PART01_SYSTEM_FOUNDATION.md | 3/4 | 1118 bytes | AI 우선 참조 |
| PART01_04_SYSTEM_FOUNDATION.md | PART01_SYSTEM_FOUNDATION.md | 4/4 | 1125 bytes | AI 우선 참조 |
| PART02_01_RUNTIME.md | PART02_RUNTIME.md | 1/4 | 1930 bytes | AI 우선 참조 |
| PART02_02_RUNTIME.md | PART02_RUNTIME.md | 2/4 | 2506 bytes | AI 우선 참조 |
| PART02_03_RUNTIME.md | PART02_RUNTIME.md | 3/4 | 2271 bytes | AI 우선 참조 |
| PART02_04_RUNTIME.md | PART02_RUNTIME.md | 4/4 | 2192 bytes | AI 우선 참조 |
| PART03_01_GUI.md | PART03_GUI.md | 1/5 | 616 bytes | AI 우선 참조 |
| PART03_02_GUI.md | PART03_GUI.md | 2/5 | 646 bytes | AI 우선 참조 |
| PART03_03_GUI.md | PART03_GUI.md | 3/5 | 646 bytes | AI 우선 참조 |
| PART03_04_GUI.md | PART03_GUI.md | 4/5 | 646 bytes | AI 우선 참조 |
| PART03_05_GUI.md | PART03_GUI.md | 5/5 | 643 bytes | AI 우선 참조 |
| PART04_01_ROUTINE.md | PART04_ROUTINE.md | 1/4 | 632 bytes | AI 우선 참조 |
| PART04_02_ROUTINE.md | PART04_ROUTINE.md | 2/4 | 666 bytes | AI 우선 참조 |
| PART04_03_ROUTINE.md | PART04_ROUTINE.md | 3/4 | 666 bytes | AI 우선 참조 |
| PART04_04_ROUTINE.md | PART04_ROUTINE.md | 4/4 | 663 bytes | AI 우선 참조 |
| PART05_01_RULE_APPROVAL.md | PART05_RULE_APPROVAL.md | 1/4 | 656 bytes | AI 우선 참조 |
| PART05_02_RULE_APPROVAL.md | PART05_RULE_APPROVAL.md | 2/4 | 696 bytes | AI 우선 참조 |
| PART05_03_RULE_APPROVAL.md | PART05_RULE_APPROVAL.md | 3/4 | 696 bytes | AI 우선 참조 |
| PART05_04_RULE_APPROVAL.md | PART05_RULE_APPROVAL.md | 4/4 | 693 bytes | AI 우선 참조 |

## 주요 위치

- Runtime Layer Phase1 병합 요약: PART01_SYSTEM_FOUNDATION.md
- 02.10 Runtime Projection 상세 규격: PART02_RUNTIME.md
- 02.11 Runtime Persistence Preview: PART02_RUNTIME.md
- 02.12 Runtime Recovery Preview: PART02_RUNTIME.md
- 02.13 Runtime Reconciliation Preview: PART02_RUNTIME.md
- 02.14 Preview Safety: PART02_RUNTIME.md
- 29.x Execution 요약 및 교차참조: PART08_OPERATION_POLICY.md
- 구현 커밋/테스트 권장/주의 사항 부록: PART09_APPENDIX.md

## AI 세션 참조 순서

1. README.md
2. AI_PROJECT_OPERATION_MANUAL_RELEASE_v1.2.md
3. AI_SESSION_START_PROTOCOL.md
4. 00_CANONICAL/REFERENCE/00_REFERENCE_INDEX.md
5. Runtime 상세 규격 확인 시 PART02_RUNTIME.md 또는 PART02 SUBPART
6. Execution 교차참조 확인 시 PART08_OPERATION_POLICY.md
7. 필요한 경우 00_CANONICAL/CURRENT/MASTER_SPEC_CANONICAL_2026-07-08_RUNTIME_LAYER_PHASE1_RUNTIME_PROJECTION_MERGED.txt
8. 10_UPDATE/MERGED
9. 00_CANONICAL/CHANGELOG
10. 20_ARCHIVE

## 검증 기준

- 원본 Canonical 수정 금지
- 원본 Canonical 삭제 금지
- Reference Edition 본문 요약 금지
- Reference Edition 본문 생략 금지
- Reference Edition 본문 순서 변경 금지
- Reference Edition 본문 문장 수정 금지
- 전체 Reference 재조립 시 원본 Canonical과 문자 수 차이 0

## 재생성 검증 결과

- Canonical 문자 수: 8240
- PART01~PART09 Original Body 재조립 문자 수: 8240
- 문자 수 차이: 0
- 재조립 본문 일치: OK