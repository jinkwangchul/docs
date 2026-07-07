# DOCS Folder Operation Standard v1.0

## 1. 문서 목적

이 문서는 `C:\Users\JIN KWANG CHUL\Documents\docs` 폴더를 장기 운영 가능한 문서 저장소로 유지하기 위한 폴더 운영 기준이다.

적용 범위:

- docs 프로젝트의 문서 보관 구조
- MASTER_SPEC Canonical 판정
- CHANGELOG 생성
- 작업재개요약 보관
- 중복 파일 처리
- 삭제 후보 판단
- 삭제 전 승인 절차
- 새 대화 시작 시 참조 순서

이 문서는 구현 문서가 아니다. Python 코드, kiwoom_auto 프로젝트, runtime, rules.json, Git 작업에는 적용하지 않는다.

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

`CURRENT`는 현재 기준으로 사용할 MASTER_SPEC와 Canonical 사용 안내를 보관한다.

역할:

- 최신 MASTER_SPEC Canonical 보관
- readable Canonical 보관
- Canonical 사용 안내 보관
- 최신 작업재개 기준 문서 보관

운영 규칙:

- 최신 MASTER_SPEC는 이 폴더 안에서 판정한다.
- `MASTER_SPEC_CANONICAL_YYYY-MM-DD_주제.txt` 형식의 날짜와 주제를 우선한다.
- 같은 날짜 문서가 여러 개이면 생성 시각과 주제의 범위를 함께 확인한다.
- 최신본 하나만 남기기 위해 과거본을 삭제하지 않는다.
- 과거본은 삭제가 아니라 Canonical 이력으로 보존한다.

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

`20_ARCHIVE`는 기존 모든 문서를 보존하는 장기 보관 영역이다.

역할:

- 과거 MASTER_SPEC 원본 보관
- 작업재개요약 보관
- 대화히스토리 보관
- 구현로그 보관
- 운영정책 보관
- legacy 문서 보관
- 압축 원본 보관

운영 규칙:

- 이 폴더의 파일은 삭제 대상이 아니라 보관 대상이다.
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

운영 규칙:

- 보고서는 삭제 금지 대상으로 본다.
- 새 관리 보고서는 가능한 한 `30_REPORTS`에 둔다.
- 루트에 생성된 보고서는 이후 승인된 정리 작업에서 `30_REPORTS`로 이동할 수 있다.

### 90_TEMP

`90_TEMP`는 자동분류 실패, 임시 병합 결과, 과거 draft, 확인 필요한 파일을 임시 보관하는 영역이다.

역할:

- 자동분류 실패 파일 보관
- 병합 전 임시 파일 보관
- draft 문서 보관
- 중복 의심 파일 확인 대기

운영 규칙:

- `90_TEMP` 파일은 우선 검토 후보이다.
- `90_TEMP` 파일도 즉시 삭제하지 않는다.
- 최신 Canonical에 반영되었는지, 20_ARCHIVE에 원본이 있는지, 해시가 동일한지 확인한 뒤 삭제 가능 후보로 승격할 수 있다.

## 3. MASTER_SPEC 최신본 판정 규칙

최신 MASTER_SPEC Canonical은 다음 순서로 판정한다.

1. `00_CANONICAL/CURRENT` 안의 `MASTER_SPEC_CANONICAL_*.txt`만 대상으로 한다.
2. 파일명 날짜가 가장 최신인 문서를 우선한다.
3. 같은 날짜가 여러 개이면 파일명 주제의 범위가 더 최신 작업을 포함하는 문서를 우선한다.
4. LastWriteTime은 보조 기준으로만 사용한다.
5. readable 파일은 사람이 읽기 위한 보조본이며 MASTER_SPEC 정본 판정에서는 기본 Canonical보다 우선하지 않는다.
6. `_CANONICAL_OUTPUT` 안의 과거 생성물은 원본 보존용이며 현재 기준은 `00_CANONICAL/CURRENT`를 우선한다.

현재 운영 기준:

- 최신 Canonical은 `00_CANONICAL/CURRENT`에서 확인한다.
- 기존 Canonical은 삭제하지 않는다.
- 새 갱신은 기존 파일 수정이 아니라 새 Canonical 파일 생성으로 수행한다.

## 4. 작업재개요약 보관 규칙

작업재개요약은 다음 기준으로 관리한다.

보존 기준:

- 최신 작업 시작 기준 1~2개는 즉시 참조 가능 위치에 둔다.
- 오래된 작업재개요약은 삭제가 아니라 `20_ARCHIVE/WORK_RESUME` 보관 후보로 본다.
- 같은 날짜와 같은 주제의 중복 파일은 해시 비교 전 삭제하지 않는다.

운영 기준:

- 앞으로는 별도 작업재개요약을 계속 만들지 않고 UPDATE 문서로 관리한다.
- 새 작업 정보는 `10_UPDATE/INBOX`의 UPDATE 문서에 기록한다.
- Canonical 반영 후 UPDATE는 `10_UPDATE/MERGED`로 이동한다.

## 5. CHANGELOG 생성 규칙

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

## 6. 중복 파일 처리 규칙

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

## 7. 삭제 금지 파일

다음 파일은 삭제 금지 대상으로 본다.

- 최신 MASTER_SPEC Canonical
- 모든 `00_CANONICAL` 하위 파일
- 모든 CHANGELOG 파일
- 운영 매뉴얼 v1.0, v1.1, RELEASE, RELEASE_v1.1, RELEASE_v1.2 계열
- `10_UPDATE/TEMPLATE/UPDATE_TEMPLATE.txt`
- `30_REPORTS` 하위 보고서
- `마스터스펙정리/_CANONICAL_OUTPUT` 하위 원본 Canonical 산출물
- 압축 원본 중 아직 정리 승인되지 않은 파일
- 작업재개 최신 기준 문서

## 8. 삭제 가능 후보 조건

파일은 다음 조건을 모두 만족할 때만 삭제 가능 후보가 될 수 있다.

1. 최신 Canonical 또는 CHANGELOG가 아니다.
2. 운영 매뉴얼이 아니다.
3. 30_REPORTS의 관리 보고서가 아니다.
4. 원본 보존 가치가 낮다.
5. 같은 내용의 보존본이 다른 위치에 존재한다.
6. 해시 비교로 동일성이 확인되었다.
7. 최신 MASTER_SPEC 또는 UPDATE에 반영되었음이 확인되었다.
8. 사용자에게 파일 경로와 삭제 사유를 보고했다.
9. 사용자가 삭제를 명시 승인했다.

현재 단계에서는 실제 삭제를 수행하지 않는다.

## 9. 삭제 전 승인 절차

삭제 전 절차:

```text
파일 목록 작성
↓
삭제 금지 여부 확인
↓
중복 의심 여부 확인
↓
해시 비교
↓
보존본 위치 확인
↓
삭제 후보 보고서 작성
↓
사용자 승인
↓
백업 정책 확인
↓
삭제 수행
↓
삭제 결과 보고
```

승인 없이 삭제하지 않는다.

삭제 승인 요청에는 다음을 포함한다.

- 파일 경로
- 파일 크기
- LastWriteTime
- 보존본 경로
- 해시 비교 결과
- 삭제 사유
- 되돌릴 수 있는지 여부

## 10. 새 대화 시작 시 참조 문서 순서

새 대화에서 docs 기준 작업을 시작할 때 참조 순서는 다음과 같다.

1. `AI_PROJECT_OPERATION_MANUAL_RELEASE_v1.2.md`
2. `DOCS_FOLDER_OPERATION_STANDARD_v1.0.md`
3. `00_CANONICAL/CURRENT`의 최신 `MASTER_SPEC_CANONICAL_*.txt`
4. `00_CANONICAL/CHANGELOG`의 최신 CHANGELOG
5. `10_UPDATE/INBOX`의 미병합 UPDATE 문서
6. 필요한 경우 `30_REPORTS`의 최근 관리 보고서
7. 필요한 경우 `20_ARCHIVE`의 과거 원본
8. 필요한 경우 `90_TEMP`의 확인 후보

## 11. 이번 문서 작성 범위

이번 작업에서 수행한 일:

- 폴더 운영 규칙 문서 신규 생성
- 삭제 후보 보고서 신규 생성

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
