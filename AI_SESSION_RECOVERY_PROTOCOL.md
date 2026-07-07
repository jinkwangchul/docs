# AI Session Recovery Protocol

## 1. 목적

이 문서는 AI가 변경되거나, 새 대화가 시작되거나, 긴 작업이 중단된 경우 동일한 프로젝트 상태를 복원하기 위한 공식 절차를 정의한다.

목표:

- 이전 세션의 프로젝트 상태를 복원한다.
- 최신 docs Source of Truth를 기준으로 현재 상태를 재확인한다.
- MASTER_SPEC, UPDATE, CHANGELOG, 운영 매뉴얼의 기준을 다시 맞춘다.
- 현재 구현 위치와 금지선을 명확히 확인한 뒤 작업을 재개한다.

이 문서는 구현 문서가 아니다. Python 코드, kiwoom_auto, runtime, rules.json을 수정하지 않는다.

## 2. Recovery 대상

Recovery Protocol은 다음 상황에서 적용한다.

- 새 ChatGPT 대화
- Codex 작업 재개
- AI 모델 변경
- Context 초기화
- 장시간 작업 중단 후 재개

적용 원칙:

- 새 세션은 이전 세션 기억에만 의존하지 않는다.
- 공식 문서와 GitHub docs Repository를 기준으로 상태를 복원한다.
- 추측으로 MASTER_SPEC나 구현 상태를 확정하지 않는다.

## 3. Recovery 순서

표준 Recovery 순서는 다음과 같다.

```text
GitHub docs Repository
↓
README
↓
AI_PROJECT_OPERATION_MANUAL_RELEASE
↓
AI_SESSION_START_PROTOCOL
↓
MASTER_SPEC CURRENT
↓
UPDATE INBOX
↓
CHANGELOG
↓
현재 구현 위치 확인
↓
현재 금지선 확인
↓
작업 범위 확인
↓
구현 시작
```

## 4. 단계별 확인 기준

### 1. GitHub docs Repository

GitHub docs Repository가 최신 Source of Truth인지 확인한다.

확인 항목:

- GitHub docs 최신 상태
- 로컬 미반영 변경 존재 여부
- Push되지 않은 docs 변경 존재 여부
- 공식 기준으로 사용할 commit 또는 문서 상태

### 2. README

`README.md`를 확인하여 docs Repository의 목적과 운영 구조를 복원한다.

확인 항목:

- 프로젝트 목적
- MASTER_SPEC 운영 방식
- CURRENT 사용법
- UPDATE 사용법
- CHANGELOG 정책
- ARCHIVE 정책
- 새 대화 시작 참조 순서

### 3. AI_PROJECT_OPERATION_MANUAL_RELEASE

최신 `AI_PROJECT_OPERATION_MANUAL_RELEASE` 계열 문서를 확인한다.

확인 항목:

- ChatGPT 역할
- Codex 역할
- GitHub Source of Truth 원칙
- 문서 작업과 구현 작업 분리
- 금지사항
- 보고 형식

### 4. AI_SESSION_START_PROTOCOL

`AI_SESSION_START_PROTOCOL.md`를 확인하여 새 세션 시작 절차와 Recovery 이후 작업 시작 절차를 맞춘다.

확인 항목:

- GitHub docs 확인 절차
- README 확인 절차
- MASTER_SPEC CURRENT 확인 절차
- UPDATE/INBOX 확인 절차
- CHANGELOG 확인 절차
- 작업 범위 결정 절차

### 5. MASTER_SPEC CURRENT

`00_CANONICAL/CURRENT`의 최신 `MASTER_SPEC_CANONICAL_*.txt`를 확인한다.

확인 항목:

- MASTER_SPEC 최신 날짜
- 최신 Canonical 파일명
- 현재 구현 단계
- 현재 미연결 계층
- 테스트 기준
- 금지선

MASTER_SPEC는 추측하지 않는다.

### 6. UPDATE INBOX

`10_UPDATE/INBOX`의 미병합 UPDATE 문서를 확인한다.

확인 항목:

- UPDATE 존재 여부
- 미병합 MASTER_SPEC 반영 후보
- 현재 작업과 충돌하는 후보
- 병합 완료 여부

UPDATE는 무시하지 않는다.

### 7. CHANGELOG

`00_CANONICAL/CHANGELOG`의 최신 CHANGELOG를 확인한다.

확인 항목:

- CHANGELOG 최신 여부
- 최근 추가 섹션
- 최근 추가 정책
- 테스트 수 변경
- 금지선 유지 여부

CHANGELOG 확인은 생략하지 않는다.

### 8. 현재 구현 위치 확인

현재 구현 위치를 문서와 실제 프로젝트 기준으로 확인한다.

확인 항목:

- 현재 구현 단계
- 완료된 계층
- 미연결 계층
- preview-only 계층
- commit 가능 계층
- runtime write 가능 여부
- queue write 가능 여부
- SendOrder/Kiwoom/GUI 연결 여부

### 9. 현재 금지선 확인

작업 시작 전 금지선을 다시 확인한다.

확인 항목:

- runtime 수정 금지 여부
- rules.json 수정 금지 여부
- GUI 연결 금지 여부
- ExecutionController(real) 연결 금지 여부
- SendOrder 연결 금지 여부
- Kiwoom 호출 금지 여부
- Queue Commit 금지 여부
- Git commit/push 금지 여부

### 10. 작업 범위 확인

현재 작업 범위를 명확히 확정한다.

확인 항목:

- 문서 작업인지 구현 작업인지 구분
- 수정 허용 파일
- 수정 금지 파일
- 최소 구현 단위
- 테스트 범위
- UPDATE 생성 필요 여부
- CHANGELOG 생성 필요 여부

### 11. 구현 시작

Recovery가 완료된 뒤에만 구현 또는 문서 작업을 시작한다.

원칙:

- 상태 복원 전 구현하지 않는다.
- 금지선 확인 전 구현하지 않는다.
- UPDATE/CHANGELOG 확인 전 MASTER_SPEC 병합을 시작하지 않는다.
- GitHub docs 확인 전 공식 기준을 확정하지 않는다.

## 5. 반드시 확인할 항목

Recovery 시 반드시 확인한다.

- MASTER_SPEC 최신 날짜
- UPDATE 존재 여부
- CHANGELOG 최신 여부
- 테스트 기준
- 현재 구현 단계
- 현재 미연결 계층
- 금지선

## 6. Recovery 완료 조건

Recovery는 다음 조건을 만족할 때 완료된다.

완료 조건:

- 현재 구현 위치를 이전 세션과 동일하게 설명할 수 있다.
- 다음 구현 작업을 명확하게 특정할 수 있다.
- 최신 MASTER_SPEC 파일명을 말할 수 있다.
- 미병합 UPDATE 존재 여부를 말할 수 있다.
- 최신 CHANGELOG 확인 여부를 말할 수 있다.
- 현재 금지선을 말할 수 있다.
- 수정 허용 범위와 수정 금지 범위를 말할 수 있다.

Recovery가 완료되지 않았으면 구현을 시작하지 않는다.

## 7. 금지사항

Recovery 중 금지:

- MASTER_SPEC 추측 금지
- UPDATE 무시 금지
- CHANGELOG 생략 금지
- GitHub docs 확인 생략 금지
- 현재 구현 위치 추측 금지
- 금지선 확인 전 구현 시작 금지
- Python 코드 수정 금지
- kiwoom_auto 수정 금지
- runtime 수정 금지
- rules.json 수정 금지
- Git commit 금지
- Git push 금지
- 파일 삭제 금지

## 8. Recovery 체크리스트

```text
□ GitHub docs Repository 확인
□ README 확인
□ AI_PROJECT_OPERATION_MANUAL_RELEASE 최신본 확인
□ AI_SESSION_START_PROTOCOL 확인
□ MASTER_SPEC CURRENT 최신 날짜 확인
□ UPDATE INBOX 존재 여부 확인
□ CHANGELOG 최신 여부 확인
□ 테스트 기준 확인
□ 현재 구현 단계 확인
□ 현재 미연결 계층 확인
□ 금지선 확인
□ 작업 범위 확인
□ Recovery 완료 조건 충족 확인
□ 구현 또는 문서 작업 시작
```

