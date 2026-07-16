# Docs Repository

This repository is the official documentation source of truth
for the Kiwoom Auto Trading Project.

Every implementation session begins with
AI_SESSION_START_PROTOCOL.md.

이 저장소는 `kiwoom_auto` 프로젝트의 문서 Source of Truth를 장기 운영하기 위한 docs 전용 저장소이다.

이 저장소는 구현 코드 저장소가 아니다. Python 코드, runtime, rules.json, 실제 주문 실행 파일은 이 저장소에서 수정하지 않는다.

## 목적

- MASTER_SPEC Canonical을 기준 문서로 관리한다.
- CHANGELOG로 Canonical 변경 이력을 보존한다.
- UPDATE 문서로 신규 변경 후보를 수집한다.
- 운영 매뉴얼과 docs 운영 표준으로 ChatGPT / Codex / 일반 코드 모델 3모델 협업 절차를 고정한다.
- ARCHIVE와 REPORTS를 통해 과거 문서와 관리 보고서를 보존한다.

## 기본 구조

```text
docs/
  00_CANONICAL/
    CURRENT/
    CHANGELOG/
    TRACE/
    OPEN_ISSUES/
  10_UPDATE/
    INBOX/
    MERGED/
    TEMPLATE/
  20_ARCHIVE/
  30_REPORTS/
  90_TEMP/
```

## MASTER_SPEC 운영 방식

MASTER_SPEC는 `00_CANONICAL/CURRENT`의 최신 `MASTER_SPEC_CANONICAL_*.txt`를 기준으로 한다.

운영 원칙:

- 기존 Canonical은 덮어쓰지 않는다.
- Domain별 최신 Canonical을 Living Contract로 유지한다.
- Historical 문서는 과거 설계 근거이며 현재 계약을 다시 정의하지 않는다.
- 기존 내용을 임의 삭제하거나 축약하지 않는다.
- 실제 구현된 내용만 Canonical에 반영한다.
- CHANGELOG를 통해 변경 이력을 남긴다.

## AI Reference Edition

최신 MASTER_SPEC Canonical은 크기가 커서 GitHub Web과 일부 AI Connector에서 전체 내용을 한 번에 읽기 어렵다. 이를 위해 `00_CANONICAL/REFERENCE`에 AI 참조용 분할본을 둔다.

Reference Edition 원칙:

- 공식 원본은 `00_CANONICAL/CURRENT`의 최신 Canonical이다.
- Reference Edition은 AI 참조 편의를 위한 분할본이다.
- SUBPART는 AI가 우선 참조하는 작은 단위 분할본이다.
- 기존 PART01~PART05는 Legacy large part / Full part로 유지한다.
- Reference Edition은 원문을 요약하거나 생략하지 않는다.
- Reference Edition은 원본 순서를 유지한다.

새 AI 세션에서는 다음 순서로 참조한다.

```text
README.md
↓
AI_PROJECT_OPERATION_MANUAL_RELEASE_v1.2.md
↓
AI_SESSION_START_PROTOCOL.md
↓
00_CANONICAL/REFERENCE/00_REFERENCE_INDEX.md
↓
필요한 SUBPART
↓
필요한 경우 Legacy PART
↓
필요한 경우 00_CANONICAL/CURRENT 최신 Canonical
↓
UPDATE/INBOX
↓
CHANGELOG
↓
ARCHIVE
```

## CURRENT 사용법

`00_CANONICAL/CURRENT`는 현재 프로젝트를 바로 재개하는 데 필요한 최신 기준 문서만 두는 영역이다.

CURRENT 기준:

- 최신 MASTER_SPEC Canonical
- 최신 작업재개요약
- 최신 운영 기준 문서
- Canonical 사용 안내

오래된 CURRENT 문서는 삭제하지 않고 ARCHIVE 이동 후보로 분류한다.

## UPDATE 사용법

신규 변경 후보는 `10_UPDATE/INBOX`에 둔다.

권장 파일명:

```text
UPDATE_YYYYMMDD_주제.txt
```

운영 흐름:

```text
UPDATE 생성
↓
10_UPDATE/INBOX 저장
↓
사용자 지시에 따라 지정된 문서 작업 에이전트가 Canonical 갱신
↓
역할과 Git 절차는 AGENT_WORKFLOW_REFERENCE Workflow v2를 따름
↓
Domain별 최신 MASTER_SPEC Canonical 갱신
↓
병합 완료 UPDATE는 MERGED 이동 후보
```

## CHANGELOG 정책

CHANGELOG는 `00_CANONICAL/CHANGELOG`에 보관한다.

정책:

- 기존 CHANGELOG를 수정하지 않는다.
- 새 변경은 새 날짜 또는 새 주제 CHANGELOG로 작성한다.
- 추가 섹션, 병합 위치, 테스트 현황, 금지선 유지 여부를 기록한다.

## ARCHIVE 정책

`20_ARCHIVE`는 기존 문서를 보존하는 장기 보관 영역이다.

정책:

- 삭제보다 ARCHIVE 이동을 우선한다.
- 중복 의심 파일도 해시 비교와 사용자 승인 전에는 삭제하지 않는다.
- 압축 원본은 Git 포함보다 로컬 보관 또는 별도 release/storage 사용을 권장한다.

## 새 대화 시작 시 참조 순서

1. `README.md`
2. `AI_PROJECT_OPERATION_MANUAL_RELEASE_v1.2.md`
3. `AI_SESSION_START_PROTOCOL.md`
4. `00_CANONICAL/REFERENCE/00_REFERENCE_INDEX.md`
5. 필요한 SUBPART
6. 필요한 경우 Legacy PART
7. 필요한 경우 `00_CANONICAL/CURRENT` 최신 Canonical
8. `10_UPDATE/INBOX`
9. `00_CANONICAL/CHANGELOG`
10. `20_ARCHIVE`

## GitHub 운영 원칙

- GitHub 최신 docs 저장소를 문서 Source of Truth로 사용한다.
- docs 저장소는 PR 의무 없음.
- commit/push는 사용자 승인 후 수행한다.
- commit/push 전 diff와 Stage 대상 확인은 필수이다.
- 백업 zip, TEMP, 로컬 캐시는 Git 포함을 피한다.
- 문서 변경과 구현 코드 변경은 분리한다.
