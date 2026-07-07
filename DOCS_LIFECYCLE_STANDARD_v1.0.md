# DOCS Lifecycle Standard v1.0

## 1. 문서 목적

이 문서는 docs 프로젝트 문서의 생성부터 장기보관과 삭제 검토까지의 생명주기를 정의한다.

적용 범위:

- MASTER_SPEC Canonical
- CHANGELOG
- 작업재개요약
- AI 운영 매뉴얼
- DOCS 운영 표준
- Cleanup Candidate Report
- UPDATE 문서
- TEMP 문서
- Reports

이 문서는 docs 프로젝트 전용 문서이다. docs 작업 중 kiwoom_auto, Python 코드, runtime, rules.json은 수정하지 않는다.

## 2. 문서 생명주기 개요

표준 생명주기는 다음과 같다.

```text
생성
↓
검토
↓
CURRENT 반영
↓
MASTER_SPEC/CHANGELOG/Resume 갱신
↓
ARCHIVE 이동 후보
↓
장기보관
↓
삭제 검토
```

기본 원칙:

- 문서 생성은 목적과 위치를 명확히 한다.
- 검토 전 문서는 기준 문서로 사용하지 않는다.
- CURRENT는 현재 작업 재개에 필요한 최신 기준만 둔다.
- 오래된 기준 문서는 삭제하지 않고 ARCHIVE 이동 후보로 분류한다.
- 삭제는 최후 수단이며 별도 승인 절차가 필요하다.

## 3. 문서 유형별 생명주기

### MASTER_SPEC Canonical

생성:

- 구현 완료 또는 정책 확정 후 새 Canonical 파일로 생성한다.
- 기존 Canonical을 덮어쓰지 않는다.

검토:

- 기존 구조와 번호 체계를 유지했는지 확인한다.
- 기존 내용을 삭제하거나 축약하지 않았는지 확인한다.
- 실제 구현된 내용만 반영했는지 확인한다.

CURRENT 반영:

- 최신 MASTER_SPEC Canonical 1개를 CURRENT 기준으로 둔다.
- 이전 Canonical은 삭제하지 않고 ARCHIVE 이동 후보 또는 Canonical 이력으로 보존한다.

장기보관:

- 과거 Canonical은 이력 보존 대상이다.
- 삭제 금지 파일로 본다.

### CHANGELOG

생성:

- MASTER_SPEC Canonical 신규 생성 또는 주요 정책 변경 시 생성한다.
- 기존 CHANGELOG를 수정하지 않는다.

검토:

- 추가된 섹션, 병합 위치, 테스트 현황, 금지선 유지 여부를 기록했는지 확인한다.

CURRENT 반영:

- 최신 CHANGELOG를 새 대화 참조 후보로 둔다.
- CHANGELOG는 삭제 금지 대상이다.

장기보관:

- 날짜별 이력으로 보존한다.

### 작업재개요약

생성:

- 새 작업을 바로 이어가기 위해 필요한 경우에만 생성한다.
- 앞으로는 가능한 한 UPDATE 문서로 대체한다.

검토:

- 완료 범위, 미연결 범위, 다음 작업 기준이 분리되어 있는지 확인한다.

CURRENT 반영:

- 최신 작업재개요약 1개만 CURRENT 기준으로 둔다.
- 이전 작업재개요약은 삭제하지 않고 ARCHIVE 이동 후보로 둔다.

장기보관:

- `20_ARCHIVE/RESUME` 또는 기존 WORK_RESUME 구조에 보관한다.

### AI 운영 매뉴얼

생성:

- 협업 방식이 변경될 때 새 버전 또는 새 RELEASE로 생성한다.
- 기존 버전을 수정하거나 삭제하지 않는다.

검토:

- ChatGPT 역할, Codex 역할, GitHub Source of Truth, 금지사항, 보고 형식이 포함되었는지 확인한다.

CURRENT 반영:

- 최신 RELEASE 계열 1개를 기준으로 사용한다.
- 이전 버전은 ARCHIVE 이동 후보 또는 운영 이력으로 보존한다.

장기보관:

- `20_ARCHIVE/OPERATION_MANUAL` 보관 후보이다.

### DOCS 운영 표준

생성:

- docs 폴더 운영 방식이 바뀔 때 새 버전으로 생성한다.
- 기존 표준 문서는 수정하지 않는다.

검토:

- CURRENT, ARCHIVE, TEMP, 삭제 정책, 점검 주기, 참조 우선순위가 포함되었는지 확인한다.

CURRENT 반영:

- 최신 DOCS 운영 표준 1개를 기준으로 사용한다.
- 이전 버전은 ARCHIVE 이동 후보이다.

장기보관:

- `20_ARCHIVE/OPERATION_MANUAL` 또는 `30_REPORTS` 관련 보관 후보이다.

### Cleanup Candidate Report

생성:

- 삭제 또는 이동 전 검토가 필요할 때 생성한다.
- 삭제 후보 수가 0이어도 정상이다.

검토:

- 삭제 금지, 보관 후보, 확인 후보, 삭제 가능 후보를 분리했는지 확인한다.
- 파일별 판단 사유를 기록했는지 확인한다.

CURRENT 반영:

- 기준 문서가 아니라 관리 보고서이다.
- CURRENT에 계속 둘 필요는 없다.

장기보관:

- `30_REPORTS` 보관 대상이다.

### UPDATE 문서

생성:

- 신규 변경 요청, 작업 갱신, Canonical 반영 후보를 기록할 때 생성한다.
- 파일명은 가능한 한 `UPDATE_YYYYMMDD_XXXX.txt` 형식을 사용한다.

검토:

- 작업명, 수정 파일, 변경 이유, 정책, MASTER_SPEC 반영 내용, 검증 내용, 다음 작업이 포함되었는지 확인한다.

CURRENT 반영:

- UPDATE는 CURRENT 기준 문서가 아니다.
- 병합 전에는 `10_UPDATE/INBOX`에 둔다.

장기보관:

- Canonical 반영 후 `10_UPDATE/MERGED` 또는 ARCHIVE로 이동 후보가 된다.

### TEMP 문서

생성:

- 자동분류 실패, 임시 검토, 이름 깨짐, 위치 불명, 중복 확인 대기 문서로 발생한다.

검토:

- 30일 이상 남으면 cleanup candidate 보고서에 포함한다.
- Canonical 반영 여부와 ARCHIVE 보존본 존재 여부를 확인한다.

CURRENT 반영:

- TEMP 문서는 CURRENT에 두지 않는다.

장기보관:

- 검토 후 `20_ARCHIVE/TEMP_REVIEWED` 또는 적절한 폴더로 이동 후보가 된다.

삭제 검토:

- TEMP에서 바로 삭제하지 않는다.

### Reports

생성:

- 문서 정리, 병합, cleanup, 이동, 삭제 승인, 삭제 결과를 기록할 때 생성한다.

검토:

- 작업 전/후 상태, 판단 사유, 변경 여부, 미수행 항목이 기록되었는지 확인한다.

CURRENT 반영:

- 보고서는 CURRENT 기준 문서가 아니다.

장기보관:

- `30_REPORTS`에 보관한다.
- 보고서는 삭제 금지 대상으로 본다.

## 4. CURRENT 반영 규칙

CURRENT는 작업 재개용 문서 집합이다.

CURRENT 반영 기준:

- 최신 기준 문서만 CURRENT에 남긴다.
- 이전 CURRENT는 삭제하지 않고 ARCHIVE 후보로 분류한다.
- CURRENT에는 임시 파일을 두지 않는다.
- CURRENT에는 미병합 UPDATE를 두지 않는다.
- CURRENT에는 오래된 동일 계열 문서를 누적하지 않는다.

CURRENT 기준 문서:

- 최신 MASTER_SPEC Canonical
- 최신 작업재개요약
- 최신 AI 운영 매뉴얼
- 최신 DOCS 운영 표준
- Canonical 사용 안내

CURRENT 정리 절차:

```text
CURRENT 파일 목록 작성
↓
동일 계열 최신본 판정
↓
이전본 ARCHIVE 이동 후보 보고
↓
사용자 승인
↓
이동 수행
↓
이동 결과 보고
```

## 5. ARCHIVE 이동 규칙

ARCHIVE 이동은 임의로 수행하지 않는다.

이동 전 절차:

1. 이동 후보 목록을 작성한다.
2. 현재 위치와 이동 대상 위치를 기록한다.
3. 이동 사유를 기록한다.
4. 이름 충돌 가능성을 확인한다.
5. 사용자 승인을 받는다.

이동 중 규칙:

- 덮어쓰기 금지
- 충돌 시 `_DUP001`, `_DUP002` 방식으로 보존
- 원본 내용 수정 금지
- 압축파일 생성 금지

이동 후 절차:

1. 이동 결과 보고서를 작성한다.
2. 이동 전/후 경로를 기록한다.
3. 실패 파일을 기록한다.
4. 이름 충돌 처리 내역을 기록한다.

권장 ARCHIVE 구조:

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

기존 구조와 충돌하지 않는 범위에서 연도/월 하위 분류를 병행할 수 있다.

## 6. 삭제 검토 규칙

삭제는 최후 수단이다.

바로 삭제하지 않는 대상:

- duplicate 의심 파일
- broken name 의심 파일
- temp 파일
- obsolete 문서
- 오래된 작업재개요약
- 오래된 운영 매뉴얼
- 오래된 Canonical
- 압축 원본

삭제 전 필수 조건:

1. 삭제 금지 파일이 아니다.
2. 동일 내용 보존본이 확인되었다.
3. 해시 비교로 동일성이 확인되었다.
4. 최신 Canonical 또는 UPDATE 반영 여부가 확인되었다.
5. 별도 삭제 승인 보고서가 작성되었다.
6. 사용자가 삭제를 명시 승인했다.

삭제 절차:

```text
삭제 후보 보고서
↓
해시 비교
↓
보존본 확인
↓
삭제 승인 보고서
↓
사용자 승인
↓
삭제 수행
↓
삭제 결과 보고서
```

삭제 후보 보고서와 실제 삭제 작업은 분리한다.

## 7. 새 대화 / 새 구현 단계와의 관계

새 대화 시작 전:

- CURRENT의 최신 MASTER_SPEC를 확인한다.
- 최신 AI 운영 매뉴얼을 확인한다.
- 최신 DOCS 운영 표준을 확인한다.
- 최신 작업재개요약을 확인한다.
- 최신 CHANGELOG를 확인한다.
- 미병합 UPDATE가 있는지 확인한다.

큰 구현 완료 후:

- MASTER_SPEC 갱신 여부를 판단한다.
- CHANGELOG 생성 여부를 판단한다.
- 작업재개요약 또는 UPDATE 생성 여부를 판단한다.
- docs lifecycle 점검을 수행한다.

MASTER_SPEC 갱신 후:

- CURRENT 기준 문서가 최신인지 확인한다.
- 이전 CURRENT 파일을 ARCHIVE 이동 후보로 분류한다.
- CHANGELOG가 생성되었는지 확인한다.
- Cleanup Candidate 보고서가 필요한지 판단한다.

GitHub 최신 코드와 MASTER_SPEC 간 불일치 확인:

- 구현 작업의 공식 기준은 GitHub 최신 코드이다.
- MASTER_SPEC는 구조와 정책의 기준이다.
- GitHub 최신 코드와 MASTER_SPEC가 다르면 ChatGPT가 GitHub 기준으로 분석하고 MASTER_SPEC 갱신 필요 여부를 판단한다.

## 8. 금지사항

금지:

- 기존 Canonical 덮어쓰기 금지
- 기존 운영 문서 삭제 금지
- 기존 CHANGELOG 삭제 금지
- TEMP 직접 삭제 금지
- 압축파일로 대체 금지
- docs 작업 중 kiwoom_auto 수정 금지
- Python 코드 수정 금지
- runtime 수정 금지
- rules.json 수정 금지
- Git 작업 금지
- 파일 삭제 금지
- 파일 이동 금지

사용자 승인 없이 수행하지 않는 작업:

- CURRENT 정리 이동
- ARCHIVE 이동
- TEMP 정리 이동
- 중복 파일 삭제
- 삭제 승인 보고서 이후 실제 삭제

## 9. 이번 문서 작성 범위

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
