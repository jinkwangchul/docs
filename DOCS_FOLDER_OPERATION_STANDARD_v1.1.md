# DOCS Folder Operation Standard v1.1

## 1. 문서 목적

이 문서는 `C:\Users\JIN KWANG CHUL\Documents\docs` 폴더를 장기 운영 가능한 문서 저장소로 유지하기 위한 운영 기준이다.

v1.1은 `DOCS_FOLDER_OPERATION_STANDARD_v1.0.md`를 기준으로 다음 내용을 보강한다.

- CURRENT 폴더에 남길 문서 기준
- ARCHIVE 분류 기준
- 90_TEMP 검토 기준
- 삭제보다 ARCHIVE 이동을 우선하는 정책
- 폴더 점검 주기
- 새 대화 시작 참조 우선순위
- Cleanup Candidate 보고서 운영 기준

이 문서는 docs 프로젝트 운영 문서이다. Python 코드, kiwoom_auto 프로젝트, runtime, rules.json, Git 작업에는 적용하지 않는다.

## 2. 최상위 폴더 역할

### 00_CANONICAL

`00_CANONICAL`은 docs 프로젝트의 기준 산출물을 보관하는 최상위 폴더이다.

역할:

- MASTER_SPEC Canonical 보관
- 기준 CHANGELOG 보관
- Canonical 생성 과정의 TRACE 보관
- OPEN_ISSUES 및 CONFLICTS 보관

운영 규칙:

- 이 폴더의 파일은 삭제 금지 대상으로 본다.
- 기존 Canonical 파일은 덮어쓰지 않는다.
- MASTER_SPEC 갱신은 새 파일 생성 방식으로 수행한다.
- 과거 Canonical도 기준 이력으로 보존한다.

### 00_CANONICAL/CURRENT

`CURRENT`는 현재 프로젝트를 바로 재개하는 데 필요한 문서만 두는 폴더이다.

역할:

- 최신 MASTER_SPEC Canonical 보관
- 최신 작업재개 기준 문서 보관
- 최신 AI 운영 매뉴얼 참조 기준 보관
- 최신 docs 운영 표준 참조 기준 보관
- Canonical 사용 안내 보관

CURRENT 보관 원칙:

- CURRENT에는 동일 계열 최신본만 둔다.
- MASTER_SPEC Canonical 최신본은 1개만 유지하는 것을 목표로 한다.
- 작업재개요약 최신본은 1개만 유지하는 것을 목표로 한다.
- AI 운영 매뉴얼 최신본은 1개만 유지하는 것을 목표로 한다.
- DOCS 운영 표준 최신본은 1개만 유지하는 것을 목표로 한다.
- 오래된 CURRENT 파일은 삭제가 아니라 ARCHIVE 이동 후보로 분류한다.
- CURRENT 정리는 사용자 승인 후 이동 보고서를 작성한 뒤 수행한다.

MASTER_SPEC 최신본 판정:

- `MASTER_SPEC_CANONICAL_YYYY-MM-DD_주제.txt` 형식의 날짜와 주제를 우선한다.
- 파일명 날짜가 가장 최신인 문서를 우선한다.
- 같은 날짜 문서가 여러 개이면 주제 범위가 더 최신 작업을 포함하는 문서를 우선한다.
- LastWriteTime은 보조 기준으로만 사용한다.
- readable 파일은 사람이 읽기 위한 보조본이며 MASTER_SPEC 정본 판정에서는 기본 Canonical보다 우선하지 않는다.

### 00_CANONICAL/CHANGELOG

`CHANGELOG`는 MASTER_SPEC 변경 이력을 보관한다.

역할:

- MASTER_SPEC_CHANGELOG 보관
- MASTER_SPEC_READABLE_CHANGELOG 보관
- 날짜별 변경 요약 보관

운영 규칙:

- 기존 CHANGELOG를 수정하지 않는다.
- 새 변경이 발생하면 새 날짜 또는 새 주제 파일을 생성한다.
- 변경 위치, 추가된 섹션, 추가 정책, 테스트 현황, 금지선 유지 여부를 기록한다.
- CHANGELOG는 삭제 금지 대상이다.

### 10_UPDATE

`10_UPDATE`는 앞으로 생성되는 변경 요청과 병합 대기 문서를 관리한다.

역할:

- ChatGPT 또는 사용자가 생성하는 UPDATE 문서 수신
- Canonical 병합 전 INBOX 관리
- 병합 완료 후 MERGED 관리
- UPDATE 작성 TEMPLATE 보관

운영 규칙:

- 새로운 작업재개요약, 마스터스펙 갱신자료, 임시 참조문서를 계속 늘리지 않는다.
- 모든 신규 변경은 가능한 한 `UPDATE_YYYYMMDD_XXXX.txt` 형식으로 작성한다.
- 병합 전 문서는 `10_UPDATE/INBOX`에 둔다.
- Canonical 반영이 끝난 UPDATE는 `10_UPDATE/MERGED`로 이동하는 것을 원칙으로 한다.
- 템플릿은 `10_UPDATE/TEMPLATE`에서 관리한다.

### 20_ARCHIVE

`20_ARCHIVE`는 기존 문서를 장기 보관하는 영역이다. 앞으로는 무작정 누적하지 않고 문서 유형과 시점 기준으로 분류한다.

기본 역할:

- 과거 MASTER_SPEC 원본 보관
- 작업재개요약 보관
- 대화히스토리 보관
- 구현로그 보관
- 운영정책 보관
- legacy 문서 보관
- 압축 원본 보관
- CURRENT에서 내려온 이전 기준 문서 보관

권장 구조:

```text
20_ARCHIVE/
  MASTER_SPEC/
  CHANGELOG/
  RESUME/
  REPORTS/
  OPERATION_MANUAL/
  TEMP_REVIEWED/
  LEGACY/
```

기존 구조와 충돌하지 않는 범위에서는 연도/월 하위 분류를 병행할 수 있다.

```text
20_ARCHIVE/
  MASTER_SPEC/
    2026/
      07/
  RESUME/
    2026/
      07/
```

운영 규칙:

- 이 폴더의 파일은 기본적으로 삭제 대상이 아니라 보관 대상이다.
- ARCHIVE 이동은 사용자 승인 후 수행한다.
- 이동 전 후보 보고서를 작성한다.
- 이동 후 이동 보고서를 작성한다.
- 중복처럼 보이는 파일도 해시 비교와 사용자 승인 전에는 삭제하지 않는다.
- `_DUP001` 형식 파일은 중복 의심 파일로 표시하되 곧바로 삭제하지 않는다.
- 압축파일은 열거나 재압축하지 않고 원본 보존한다.

### 30_REPORTS

`30_REPORTS`는 docs 관리 보고서를 보관한다.

역할:

- 재정리 계획 보고서
- 재정리 결과 보고서
- 병합 보고서
- OPEN ISSUE 검토 보고서
- Canonical 사용 안내 보고서
- cleanup candidate 보고서
- 이동 보고서
- 삭제 승인 보고서
- 삭제 결과 보고서

운영 규칙:

- 보고서는 삭제 금지 대상으로 본다.
- 새 관리 보고서는 가능한 한 `30_REPORTS`에 둔다.
- 루트에 생성된 보고서는 이후 승인된 정리 작업에서 `30_REPORTS`로 이동할 수 있다.

### 90_TEMP

`90_TEMP`는 자동분류 실패, 임시 검토, 이름 깨짐, 위치 불명 파일을 두는 영역이다.

역할:

- 자동분류 실패 파일 보관
- 임시 검토 파일 보관
- 이름 깨짐 의심 파일 보관
- 위치 불명 파일 보관
- draft 문서 보관
- 중복 의심 파일 확인 대기

운영 규칙:

- TEMP 파일은 삭제 대상이 아니라 우선 검토 대상이다.
- TEMP에서 바로 삭제하지 않는다.
- 30일 이상 남은 TEMP는 cleanup candidate 보고서에 포함한다.
- 분류 후 ARCHIVE 또는 적절한 폴더로 이동 후보 처리한다.
- 최신 Canonical에 반영되었는지, 20_ARCHIVE에 원본이 있는지, 해시가 동일한지 확인한 뒤에만 삭제 가능 후보로 승격할 수 있다.

## 3. CURRENT 폴더 규칙

CURRENT는 현재 프로젝트를 바로 재개하기 위한 문서 집합이다.

CURRENT에 둘 수 있는 문서:

- 최신 MASTER_SPEC Canonical 1개
- 최신 작업재개요약 1개
- 최신 AI 운영 매뉴얼 1개
- 최신 DOCS 운영 표준 1개
- Canonical 사용 안내

CURRENT에 오래된 동일 계열 문서가 있을 때:

1. 삭제하지 않는다.
2. ARCHIVE 이동 후보로 분류한다.
3. 이동 후보 보고서에 파일 경로와 사유를 기록한다.
4. 사용자 승인 후 이동한다.
5. 이동 후 이동 보고서를 작성한다.

CURRENT 금지:

- 같은 계열의 과거본을 계속 누적하지 않는다.
- 임시 파일을 두지 않는다.
- 미검토 UPDATE 문서를 두지 않는다.
- 삭제로 CURRENT를 정리하지 않는다.

## 4. ARCHIVE 분류 규칙

20_ARCHIVE는 장기보관 영역이지만 무제한 임시창고가 아니다.

분류 기준:

- MASTER_SPEC 계열은 `MASTER_SPEC`
- CHANGELOG 계열은 `CHANGELOG`
- 작업재개요약과 resume reference는 `RESUME`
- 관리 보고서는 `REPORTS`
- AI 운영 매뉴얼과 docs 운영 표준 과거본은 `OPERATION_MANUAL`
- TEMP 검토 후 보존 결정된 파일은 `TEMP_REVIEWED`
- 분류가 어렵지만 보존해야 하는 과거 자료는 `LEGACY`

이동 기준:

- 이동 전 후보 보고서 작성
- 기존 위치와 이동 대상 위치 기록
- 같은 이름 충돌 시 덮어쓰기 금지
- 충돌 시 `_DUP001`, `_DUP002` 방식으로 보존
- 사용자 승인 후 이동
- 이동 후 결과 보고서 작성

## 5. 90_TEMP 운영 규칙

90_TEMP는 삭제 대기 폴더가 아니다.

TEMP 분류 대상:

- 자동분류 실패 파일
- 임시 검토 파일
- 이름 깨짐 의심 파일
- 위치 불명 파일
- 기존 구조와 맞지 않는 파일
- 중복 여부 확인이 필요한 파일

TEMP 점검 기준:

- 30일 이상 남은 TEMP는 cleanup candidate 보고서에 포함한다.
- 반영 여부를 확인한다.
- 보존본 위치를 확인한다.
- 해시 비교가 필요한 파일은 확인 후보로 유지한다.
- 분류가 끝나면 ARCHIVE 또는 적절한 폴더로 이동 후보 처리한다.

TEMP 금지:

- TEMP에서 직접 삭제 금지
- TEMP 파일을 압축파일로 대체 금지
- 이름만 보고 삭제 후보 확정 금지
- 최신 Canonical 반영 여부 확인 전 삭제 금지

## 6. 삭제 정책

기본 정책은 삭제가 아니라 ARCHIVE 이동이다.

삭제 가능 후보는 매우 제한적으로만 지정한다.

삭제 금지:

- 최신 Canonical
- 모든 CHANGELOG
- 운영 매뉴얼
- docs 운영 표준
- 작업재개요약 최신본
- cleanup report
- 30_REPORTS 관리 보고서
- 10_UPDATE 템플릿
- TEMP 직접 삭제

삭제 가능 후보 조건:

1. 삭제 금지 파일이 아니다.
2. 동일 내용 보존본이 확인되었다.
3. 해시 비교로 동일성이 확인되었다.
4. 최신 Canonical 또는 UPDATE에 반영되었음이 확인되었다.
5. 별도 삭제 승인 보고서를 작성했다.
6. 사용자가 삭제를 명시 승인했다.

삭제 운영 원칙:

- 삭제 후보 보고서와 실제 삭제 작업은 분리한다.
- 삭제 가능 후보가 0이어도 정상이다.
- 삭제 후보 수를 억지로 만들지 않는다.
- 판단 사유를 파일별로 기록한다.

## 7. Cleanup Candidate 보고서 운영

Cleanup Candidate 보고서는 삭제 실행 문서가 아니다.

보고서 분류:

- 삭제 금지 파일
- 보관 후보
- 확인 후보
- 삭제 가능 후보
- 위치 이동 후보
- 이름 확인 후보

운영 규칙:

- 삭제 후보와 보관 후보를 분리한다.
- 확인 후보를 별도 유지한다.
- 삭제 가능 후보가 0이어도 정상이다.
- 삭제 후보 수를 억지로 만들지 않는다.
- 판단 사유를 파일별로 기록한다.
- 보고서 작성 후에도 사용자 승인 전에는 삭제/이동하지 않는다.

## 8. 폴더 점검 주기

docs 폴더 점검은 다음 시점에 수행한다.

- 큰 구현 단계 완료 후 1회
- MASTER_SPEC 갱신 후 1회
- 새 운영 매뉴얼 생성 후 1회
- 새 대화 시작 전 필요 시 1회
- 90_TEMP에 30일 이상 남은 파일이 있을 때
- CURRENT에 동일 계열 과거본이 누적되었을 때

점검 결과는 보고서로 남긴다.

## 9. 새 대화 시작 시 참조 우선순위

새 대화에서 docs 기준 작업을 시작할 때 참조 순서는 다음과 같다.

1. `00_CANONICAL/CURRENT` 최신 MASTER_SPEC
2. `AI_PROJECT_OPERATION_MANUAL_RELEASE` 최신본
3. `DOCS_FOLDER_OPERATION_STANDARD` 최신본
4. 최신 작업재개요약
5. 최신 CHANGELOG
6. UPDATE 문서
7. ARCHIVE
8. TEMP

참조 원칙:

- 최신 MASTER_SPEC로 현재 구현/정책 기준을 확인한다.
- AI 운영 매뉴얼로 ChatGPT/Codex 협업 방식을 확인한다.
- DOCS 운영 표준으로 문서 위치와 정리 방식을 확인한다.
- 작업재개요약으로 즉시 이어갈 작업을 확인한다.
- CHANGELOG로 최근 변경 이력을 확인한다.
- UPDATE 문서로 미병합 변경을 확인한다.
- ARCHIVE와 TEMP는 필요한 경우에만 확인한다.

## 10. 작업재개요약 보관 규칙

작업재개요약은 다음 기준으로 관리한다.

보존 기준:

- 최신 작업 시작 기준 1개를 즉시 참조 가능 위치에 둔다.
- 오래된 작업재개요약은 삭제가 아니라 ARCHIVE 이동 후보로 본다.
- 같은 날짜와 같은 주제의 중복 파일은 해시 비교 전 삭제하지 않는다.

운영 기준:

- 앞으로는 별도 작업재개요약을 계속 만들지 않고 UPDATE 문서로 관리한다.
- 새 작업 정보는 `10_UPDATE/INBOX`의 UPDATE 문서에 기록한다.
- Canonical 반영 후 UPDATE는 `10_UPDATE/MERGED`로 이동한다.

## 11. CHANGELOG 생성 규칙

CHANGELOG는 다음 경우 생성한다.

- MASTER_SPEC Canonical 신규 생성
- Canonical 정책 추가
- 테스트 기준 변경
- 금지선 변경 또는 유지 확인
- 큰 구조 병합

파일명 규칙:

- `MASTER_SPEC_CHANGELOG_YYYY-MM-DD_주제.txt`
- `MASTER_SPEC_READABLE_CHANGELOG_YYYY-MM-DD_주제.txt`

작성 규칙:

- 기존 CHANGELOG 수정 금지
- 새 날짜 또는 새 주제 파일 생성
- 추가된 섹션 기록
- 병합 위치 기록
- 테스트 현황 기록
- 금지선 유지 여부 기록

## 12. 중복 파일 처리 규칙

중복 의심 파일 기준:

- 파일명에 `_DUP001`, `_DUP002` 등이 포함된 파일
- 파일명에 `(1)`, `(2)` 등이 포함된 복사본
- 동일한 파일명 계열이 여러 폴더에 존재하는 파일
- 크기와 날짜가 유사한 같은 주제 파일

처리 규칙:

1. 중복 의심 파일은 삭제 후보가 아니라 확인 후보로 분류한다.
2. 삭제 전 반드시 해시 비교를 수행한다.
3. 해시가 같아도 사용자 승인 전 삭제하지 않는다.
4. 이름만 같고 내용이 다르면 둘 다 보존한다.
5. 이름이 깨졌거나 잘못된 파일은 삭제 후보가 아니라 확인 후보로 분류한다.

## 13. 이번 문서 작성 범위

이번 작업에서 수행한 일:

- `DOCS_FOLDER_OPERATION_STANDARD_v1.1.md` 신규 생성
- `DOCS_LIFECYCLE_STANDARD_v1.0.md` 신규 생성

이번 작업에서 수행하지 않은 일:

- 파일 삭제
- 파일 이동
- 기존 문서 수정
- Python 코드 수정
- kiwoom_auto 수정
- runtime 수정
- rules.json 수정
- Git 작업
- 압축파일 생성
