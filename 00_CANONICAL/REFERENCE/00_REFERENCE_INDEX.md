# MASTER_SPEC AI Reference Edition Index

Reference Edition

Original Canonical: MASTER_SPEC_CANONICAL_2026-07-08_EXECUTION_SENDORDER_CHEJAN_LIFECYCLE_PIPELINE.txt

생성일: 2026-07-08

주의: 본 문서는 AI 참조용 분할본이며 공식 원본은 CURRENT의 Canonical이다.

## Reference 구조

이 디렉터리는 최신 MASTER_SPEC Canonical을 AI 참조용으로 분할한 Reference Edition이다. 기존 Canonical은 수정하지 않았으며 공식 Source of Truth는 00_CANONICAL/CURRENT/MASTER_SPEC_CANONICAL_2026-07-08_EXECUTION_SENDORDER_CHEJAN_LIFECYCLE_PIPELINE.txt 이다.

원본 순서 보존 방식:

- PART01부터 PART08까지 Original Body Marker 사이의 본문을 순서대로 이어 붙이면 원본 Canonical 본문과 일치한다.
- PART01부터 PART05는 Legacy large part / Full part로 유지한다.
- PART01부터 PART05의 하위 SUBPART는 AI 우선 참조 대상으로 사용한다.
- PART08은 29.8 Execution SendOrder Chejan Lifecycle Pipeline을 포함한다.
- PART09는 요청된 Reference 구조를 유지하기 위한 예약 PART이며, 원본 Canonical은 29.8 섹션에서 종료되어 원본 본문 배정이 없다.
- 각 PART와 SUBPART의 header/footer는 Reference Edition 안내와 탐색 링크이며 원본 Canonical 본문이 아니다.

## PART 목록

| PART | 포함 섹션 | 파일 크기 |
|---|---|---:|
| PART01_SYSTEM_FOUNDATION.md | Legacy large part / Full part: Original start to first split boundary | 1006999 bytes |
| PART02_RUNTIME.md | Legacy large part / Full part: Sequential original body after PART01 | 1018763 bytes |
| PART03_GUI.md | Legacy large part / Full part: Sequential original body after PART02 | 1095844 bytes |
| PART04_ROUTINE.md | Legacy large part / Full part: Sequential original body after PART03 | 982636 bytes |
| PART05_RULE_APPROVAL.md | Legacy large part / Full part: Sequential original body before 29.6 | 1027123 bytes |
| PART06_EXECUTION_PREVIEW.md | 29.6 Execution Preview Pipeline Complete | 13405 bytes |
| PART07_EXECUTION_CONTROLLER.md | 29.7 Rule Apply Preview Execution Preview Controller; 2249 tests OK | 13495 bytes |
| PART08_OPERATION_POLICY.md | 29.8 Execution SendOrder Chejan Lifecycle Pipeline | 18145 bytes |
| PART09_APPENDIX.md | Reserved; no original body assigned | 649 bytes |

## SUBPART 목록

| SUBPART | Source Full Part | 순서 | 파일 크기 | 참조 기준 |
|---|---|---:|---:|---|
| PART01_01_SYSTEM_FOUNDATION.md | PART01_SYSTEM_FOUNDATION.md | 1/4 | 220544 bytes | AI 우선 참조 |
| PART01_02_SYSTEM_FOUNDATION.md | PART01_SYSTEM_FOUNDATION.md | 2/4 | 282181 bytes | AI 우선 참조 |
| PART01_03_SYSTEM_FOUNDATION.md | PART01_SYSTEM_FOUNDATION.md | 3/4 | 261495 bytes | AI 우선 참조 |
| PART01_04_SYSTEM_FOUNDATION.md | PART01_SYSTEM_FOUNDATION.md | 4/4 | 244948 bytes | AI 우선 참조 |
| PART02_01_RUNTIME.md | PART02_RUNTIME.md | 1/4 | 248849 bytes | AI 우선 참조 |
| PART02_02_RUNTIME.md | PART02_RUNTIME.md | 2/4 | 222689 bytes | AI 우선 참조 |
| PART02_03_RUNTIME.md | PART02_RUNTIME.md | 3/4 | 257765 bytes | AI 우선 참조 |
| PART02_04_RUNTIME.md | PART02_RUNTIME.md | 4/4 | 291408 bytes | AI 우선 참조 |
| PART03_01_GUI.md | PART03_GUI.md | 1/5 | 252420 bytes | AI 우선 참조 |
| PART03_02_GUI.md | PART03_GUI.md | 2/5 | 237426 bytes | AI 우선 참조 |
| PART03_03_GUI.md | PART03_GUI.md | 3/5 | 186252 bytes | AI 우선 참조 |
| PART03_04_GUI.md | PART03_GUI.md | 4/5 | 204756 bytes | AI 우선 참조 |
| PART03_05_GUI.md | PART03_GUI.md | 5/5 | 217516 bytes | AI 우선 참조 |
| PART04_01_ROUTINE.md | PART04_ROUTINE.md | 1/4 | 262983 bytes | AI 우선 참조 |
| PART04_02_ROUTINE.md | PART04_ROUTINE.md | 2/4 | 249197 bytes | AI 우선 참조 |
| PART04_03_ROUTINE.md | PART04_ROUTINE.md | 3/4 | 250195 bytes | AI 우선 참조 |
| PART04_04_ROUTINE.md | PART04_ROUTINE.md | 4/4 | 222213 bytes | AI 우선 참조 |
| PART05_01_RULE_APPROVAL.md | PART05_RULE_APPROVAL.md | 1/4 | 244634 bytes | AI 우선 참조 |
| PART05_02_RULE_APPROVAL.md | PART05_RULE_APPROVAL.md | 2/4 | 284406 bytes | AI 우선 참조 |
| PART05_03_RULE_APPROVAL.md | PART05_RULE_APPROVAL.md | 3/4 | 253193 bytes | AI 우선 참조 |
| PART05_04_RULE_APPROVAL.md | PART05_RULE_APPROVAL.md | 4/4 | 246943 bytes | AI 우선 참조 |

## 주요 위치

- 29.6 Execution Preview Pipeline Complete: PART06_EXECUTION_PREVIEW.md
- 29.7 Rule Apply Preview Execution Preview Controller: PART07_EXECUTION_CONTROLLER.md
- 29.8 Execution SendOrder Chejan Lifecycle Pipeline: PART08_OPERATION_POLICY.md
- Execution Queue Commit Pipeline: PART08_OPERATION_POLICY.md
- Canonical SendOrder Path: PART08_OPERATION_POLICY.md
- SendOrder Recorder: PART08_OPERATION_POLICY.md
- Chejan Entry/Event Pipeline: PART08_OPERATION_POLICY.md
- Lifecycle Transition Preview: PART08_OPERATION_POLICY.md
- AI Development Tools / Local Analyzer 운영 도구: PART08_OPERATION_POLICY.md
- 2249 tests OK: PART07_EXECUTION_CONTROLLER.md
- 29.8 Test Coverage / Verification Status: PART08_OPERATION_POLICY.md

## AI 세션 참조 순서

1. README.md
2. AI_PROJECT_OPERATION_MANUAL_RELEASE_v1.2.md
3. AI_SESSION_START_PROTOCOL.md
4. 00_CANONICAL/REFERENCE/00_REFERENCE_INDEX.md
5. 필요한 SUBPART
6. 필요한 경우 Legacy PART
7. 필요한 경우 00_CANONICAL/CURRENT/MASTER_SPEC_CANONICAL_2026-07-08_EXECUTION_SENDORDER_CHEJAN_LIFECYCLE_PIPELINE.txt
8. 10_UPDATE/INBOX
9. 10_UPDATE/MERGED
10. 00_CANONICAL/CHANGELOG
11. 20_ARCHIVE

## 검증 기준

- 원본 Canonical 수정 금지
- 원본 Canonical 삭제 금지
- 기존 PART 삭제 금지
- Reference Edition 본문 요약 금지
- Reference Edition 본문 생략 금지
- Reference Edition 본문 순서 변경 금지
- Reference Edition 본문 문장 수정 금지
- SUBPART 재조립 시 기존 PART01~PART05와 내용 일치
- 전체 Reference 재조립 시 원본 Canonical과 문자 수 차이 0

## 재생성 검증 결과

- Canonical 문자 수: 3309502
- PART01~PART08 Original Body 재조립 문자 수: 3309502
- 문자 수 차이: 0
- 재조립 본문 일치: OK