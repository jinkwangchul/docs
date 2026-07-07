# AI Session Start Protocol

## 1. 목적

이 문서는 새 AI 세션을 시작할 때 ChatGPT와 Codex가 동일한 기준으로 현재 상태를 확인하고 작업을 시작하기 위한 표준 절차이다.

적용 범위:

- docs 프로젝트 문서 작업
- kiwoom_auto 구현 작업을 시작하기 전 문서 기준 확인
- MASTER_SPEC Canonical 확인
- UPDATE/INBOX 확인
- CHANGELOG 확인
- 작업 범위 결정

이 문서는 구현 문서가 아니다. Python 코드, kiwoom_auto, runtime, rules.json을 수정하지 않는다.

## 2. 새 AI 세션 시작 표준 절차

### 1. GitHub docs 최신 상태 확인

새 세션의 첫 기준은 GitHub docs repository 최신 상태이다.

확인 항목:

- GitHub docs repository가 최신 Source of Truth인지 확인한다.
- 로컬 docs가 GitHub보다 최신인지 확인한다.
- Push되지 않은 로컬 변경이 있으면 공식 기준으로 확정하지 않는다.
- GitHub 기준 분석이 필요한 파일 목록을 정한다.

### 2. README 확인

`README.md`를 확인하여 docs repository의 목적과 기본 운영 방식을 파악한다.

확인 항목:

- 프로젝트 목적
- 기본 폴더 구조
- MASTER_SPEC 운영 방식
- CURRENT 사용법
- UPDATE 사용법
- CHANGELOG 정책
- ARCHIVE 정책
- 새 대화 시작 시 참조 순서

### 3. AI_PROJECT_OPERATION_MANUAL_RELEASE 최신 확인

최신 `AI_PROJECT_OPERATION_MANUAL_RELEASE` 계열 문서를 확인한다.

확인 기준:

- 파일명 버전이 가장 최신인 RELEASE 문서를 우선한다.
- 최신 운영 매뉴얼의 ChatGPT/Codex 역할 분리 기준을 따른다.
- GitHub Source of Truth 원칙을 확인한다.
- 금지사항과 보고 형식을 확인한다.

### 4. CURRENT 최신 MASTER_SPEC 확인

`00_CANONICAL/CURRENT`의 최신 `MASTER_SPEC_CANONICAL_*.txt`를 확인한다.

확인 기준:

- 파일명 날짜가 가장 최신인 문서를 우선한다.
- 같은 날짜가 여러 개이면 주제 범위와 LastWriteTime을 보조 기준으로 확인한다.
- 최신 MASTER_SPEC를 현재 정책과 구조의 기준으로 사용한다.

### 5. UPDATE/INBOX 확인

`10_UPDATE/INBOX`를 확인하여 미병합 UPDATE 문서가 있는지 확인한다.

확인 항목:

- 미병합 UPDATE 목록
- MASTER_SPEC 반영 후보
- 병합 완료 여부
- 이번 작업과 충돌하는 UPDATE 존재 여부

### 6. CHANGELOG 확인

`00_CANONICAL/CHANGELOG`의 최신 CHANGELOG를 확인한다.

확인 항목:

- 최근 MASTER_SPEC 변경 이력
- 추가된 섹션
- 추가된 정책
- 테스트 현황
- 금지선 유지 여부

### 7. 현재 구현 위치 확인

구현 작업을 시작해야 하는 경우 현재 구현 위치를 확인한다.

확인 항목:

- 현재 작업 대상 프로젝트가 docs인지 kiwoom_auto인지 확인한다.
- docs 작업이면 Python 코드와 runtime을 수정하지 않는다.
- kiwoom_auto 작업이면 GitHub 최신 코드와 MASTER_SPEC 기준을 비교한다.
- 현재 구현 계층, 미연결 계층, 금지 계층을 확인한다.

### 8. 이번 작업 범위 결정

작업 범위를 시작 전에 고정한다.

결정 항목:

- 문서 작업인지 구현 작업인지 구분한다.
- 수정 허용 파일을 정한다.
- 수정 금지 파일을 정한다.
- 최소 작업 단위를 정한다.
- 테스트 범위를 정한다.
- Git 작업 여부를 사용자 승인 기준으로 분리한다.

### 9. 구현 시작

구현 또는 문서 작업은 범위가 확정된 뒤 시작한다.

원칙:

- Codex는 지시된 파일만 수정한다.
- ChatGPT 설계를 임의 변경하지 않는다.
- runtime, rules.json, GUI, ExecutionController(real), SendOrder는 명시 지시 없이는 수정하지 않는다.
- 문서 작업 중에는 kiwoom_auto를 수정하지 않는다.

### 10. 작업 종료 후 UPDATE 생성 여부 확인

작업 종료 후 UPDATE 생성이 필요한지 확인한다.

UPDATE 생성 기준:

- MASTER_SPEC에 반영할 신규 구조가 생긴 경우
- Canonical 병합 후보가 필요한 경우
- 다음 작업 시작 기준이 필요한 경우
- CHANGELOG가 필요한 변경이 발생한 경우

UPDATE가 필요하면 `10_UPDATE/INBOX`에 신규 UPDATE 문서를 생성한다.

## 3. 세션 시작 체크리스트

```text
□ GitHub docs 최신 상태 확인
□ README 확인
□ AI_PROJECT_OPERATION_MANUAL_RELEASE 최신 확인
□ CURRENT 최신 MASTER_SPEC 확인
□ UPDATE/INBOX 확인
□ CHANGELOG 확인
□ 현재 구현 위치 확인
□ 이번 작업 범위 결정
□ 구현 또는 문서 작업 시작
□ 작업 종료 후 UPDATE 생성 여부 확인
```

## 4. 금지사항

새 세션 시작 절차 중 금지사항:

- Python 코드 수정 금지
- kiwoom_auto 수정 금지
- runtime 수정 금지
- rules.json 수정 금지
- Git commit 금지
- Git push 금지
- 파일 삭제 금지
- 압축파일 생성 금지

