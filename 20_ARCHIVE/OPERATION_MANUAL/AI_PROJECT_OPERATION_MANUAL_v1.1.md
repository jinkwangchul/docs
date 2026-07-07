# AI Project Operation Manual v1.1

## 1. 문서 목적

이 문서는 AI 협업과 프로젝트 운영 절차를 정의하는 실제 운영 매뉴얼이다.

새 대화를 시작할 때 ChatGPT와 Codex는 이 문서를 기준으로 역할을 나누고, 작업 순서와 금지사항을 확인하고, 결과를 보고한다.

### MASTER_SPEC와 역할 차이

MASTER_SPEC는 프로젝트의 기능, 구조, 정책, 구현 기준을 정의하는 Canonical 문서이다.

이 운영 매뉴얼은 작업을 어떻게 시작하고, 누가 어떤 역할을 맡고, 어떤 순서로 구현과 검증과 GitHub 동기화를 진행할지 정의한다.

구분은 다음과 같다.

- MASTER_SPEC: 무엇을 만들어야 하는가
- AI_PROJECT_OPERATION_MANUAL: 어떻게 협업하고 운영해야 하는가

이 문서는 MASTER_SPEC의 구현 내용을 반복하지 않는다.

### 운영 문서의 목적

- docs 프로젝트와 kiwoom_auto 프로젝트를 혼동하지 않게 한다.
- ChatGPT와 Codex의 책임 경계를 고정한다.
- GitHub를 기준으로 공식 구현 상태를 판단한다.
- 새 대화에서도 동일한 방식으로 작업을 재개할 수 있게 한다.
- Preview, Approval, Policy, Commit, Review, Execution, SendOrder 단계 분리를 유지한다.

### 적용 범위

이 문서는 다음 작업에 적용한다.

- 문서 작성
- MASTER_SPEC 갱신
- 작업재개요약 작성
- Codex 구현 작업 지시
- Python 구현 작업
- 테스트 및 검증
- Git commit/push
- GitHub 기준 리뷰
- 새 대화 시작

## 2. 프로젝트 구성

현재 운영 대상은 두 Project로 분리한다.

### docs 프로젝트

docs 프로젝트는 문서 관리 전용 프로젝트이다.

역할:

- MASTER_SPEC Canonical 관리
- CHANGELOG 관리
- 작업재개요약 관리
- 운영 매뉴얼 관리
- Codex 작업 결과 보고서 관리
- ChatGPT와 Codex 사이의 문서 기준 보관

작업 범위:

- Markdown, txt 등 문서 생성
- 기존 Canonical을 보존한 새 버전 생성
- 문서 병합
- 문서 검증

금지:

- Python 코드 수정
- runtime 수정
- rules.json 수정
- 실제 구현 파일 수정
- Git 작업 자동 수행

### kiwoom_auto 프로젝트

kiwoom_auto 프로젝트는 실제 Python 프로젝트이다.

역할:

- Python 소스 코드 관리
- 테스트 코드 관리
- runtime 파일 관리
- rules.json 관리
- GUI 구현 관리
- Execution, Queue, SendOrder, Chejan 등 실제 구현 관리

작업 범위:

- 명시된 코드 수정
- 테스트 실행
- 결과 검증
- Git commit/push

금지:

- 요청 범위 밖 리팩토링
- 명시 없는 runtime write
- 명시 없는 rules.json 변경
- 명시 없는 GUI 연결
- 명시 없는 SendOrder 연결

## 3. ChatGPT 역할

ChatGPT는 설계와 판단의 중심이다.

### 수행 역할

- 요구사항 해석
- 설계
- 구조 검토
- 정책 정리
- 위험 범위 분리
- 작업 순서 결정
- Codex 작업 지시 생성
- Codex 결과 리뷰
- GitHub 구조 분석
- GitHub 기준 다음 작업 결정
- MASTER_SPEC 반영 후보 정리
- 작업재개요약 작성

### ChatGPT가 할 수 있는 판단

- 이번 작업이 문서 작업인지 구현 작업인지 구분
- docs 프로젝트 작업인지 kiwoom_auto 프로젝트 작업인지 구분
- 구현 전 설계가 충분한지 판단
- Codex에게 넘길 최소 수정 범위 결정
- 테스트 범위 제안
- GitHub push 이후 코드 상태 분석

### ChatGPT가 절대 하지 않는 작업

- 실제 로컬 파일을 수정했다고 주장하지 않는다.
- GitHub에 Push되지 않은 구현을 공식 구현으로 확정하지 않는다.
- 테스트를 실행하지 않고 통과했다고 단정하지 않는다.
- 구현되지 않은 기능을 완료로 표현하지 않는다.
- SendOrder, Execution, runtime write를 암묵적으로 허용하지 않는다.

## 4. Codex 역할

Codex는 실제 워크스페이스에서 파일 작업을 수행하는 실행 담당이다.

### 수행 역할

- 현재 작업 프로젝트 확인
- 파일 목록 확인
- 문서 작성
- MASTER_SPEC 새 버전 생성
- Python 구현
- 테스트 실행
- Git status 확인
- 사용자가 요청한 경우 git add, commit, push 수행
- 결과 보고

### Codex 구현 원칙

- 요청 범위 안에서만 수정한다.
- 기존 파일을 임의 삭제하지 않는다.
- 기존 Canonical을 덮어쓰지 않는다.
- runtime, rules.json, GUI, SendOrder 관련 작업은 명시 요청이 있을 때만 수행한다.
- 테스트 결과와 실패 내용을 숨기지 않는다.

### Codex가 절대 하지 않는 작업

- docs 프로젝트에서 Python 프로젝트 코드를 수정하지 않는다.
- 명시 없는 Git 작업을 하지 않는다.
- 명시 없는 runtime write를 하지 않는다.
- 명시 없는 rules.json 변경을 하지 않는다.
- 명시 없는 GUI 연결을 하지 않는다.
- 명시 없는 ExecutionController real 연결을 하지 않는다.
- 명시 없는 SendOrder 연결을 하지 않는다.
- 압축파일을 생성하지 않는다.

## 5. 협업 방식

표준 협업 흐름은 다음과 같이 고정한다.

```text
ChatGPT
↓
설계
↓
Codex 구현
↓
테스트
↓
GitHub Push
↓
ChatGPT GitHub 분석
↓
다음 설계
```

### 단계별 의미

ChatGPT 설계:

- 작업 목적 정리
- 범위와 금지사항 정의
- 구현 순서 결정
- Codex에게 넘길 지시 작성

Codex 구현:

- 워크스페이스 확인
- 파일 수정
- 테스트 실행
- 변경 내역 보고

GitHub Push:

- Codex가 사용자의 명시 요청을 받은 경우에만 수행
- commit 메시지와 push branch를 보고

ChatGPT GitHub 분석:

- GitHub 최신 코드를 기준으로 구조 분석
- 다음 작업 설계
- MASTER_SPEC 갱신 필요성 판단

이 흐름을 건너뛰지 않는다.

## 6. Source of Truth

Source of Truth 우선순위는 다음과 같다.

1. GitHub 최신 코드
2. MASTER_SPEC
3. AI_PROJECT_OPERATION_MANUAL
4. 작업재개요약
5. 현재 대화

### 원칙

- GitHub에 Push되지 않은 구현은 공식 구현으로 간주하지 않는다.
- 로컬 변경은 검증 중인 작업 상태이다.
- MASTER_SPEC는 정책과 구조의 기준이지만, 실제 코드 반영 여부는 GitHub 최신 코드로 확인한다.
- 운영 방식은 AI_PROJECT_OPERATION_MANUAL을 따른다.
- 작업재개요약은 새 대화 시작을 돕는 보조 문서이다.
- 현재 대화는 가장 최신 의도를 담을 수 있지만, 기존 Source of Truth를 임의로 무효화하지 않는다.

## 7. Git 운영 규칙

Git 작업은 사용자가 명시적으로 요청한 경우에만 수행한다.

표준 흐름:

```text
git status
↓
git add
↓
git commit
↓
git push
↓
ChatGPT GitHub 검토
```

### GitHub Desktop

GitHub Desktop은 필수가 아니다.

GitHub Desktop을 사용하지 않아도 Codex는 CLI로 Git 상태 확인, commit, push를 수행할 수 있다.

단, Git 작업은 반드시 사용자가 요청했을 때만 수행한다.

### Git 작업 전 확인

- 현재 branch
- 변경 파일 목록
- 포함할 파일
- 제외할 파일
- commit 메시지
- push 대상 remote/branch

### Git 작업 금지 상황

- 문서 작성만 요청된 경우
- 사용자가 Git 금지를 명시한 경우
- 작업 범위가 불명확한 경우
- 테스트가 실패했는데 사용자가 push를 요청하지 않은 경우

## 8. 새 대화 시작 절차

새 대화를 시작할 때는 아래 체크리스트를 사용한다.

```text
□ 현재 Project 확인
□ docs / kiwoom_auto 확인
□ MASTER_SPEC 기준 파일 확인
□ AI_PROJECT_OPERATION_MANUAL 기준 파일 확인
□ 작업재개요약 확인
□ GitHub 최신 여부 확인
□ 작업 범위 확인
□ 금지사항 확인
□ 결과물 확인
```

### 새 대화에서 반드시 확인할 것

- 이번 작업은 문서 작업인가, 구현 작업인가
- 작업 대상은 docs인가, kiwoom_auto인가
- 기존 Canonical을 수정하는가, 새 Canonical을 생성하는가
- runtime 또는 rules.json 수정이 허용되는가
- Git 작업이 허용되는가
- 테스트 범위는 어디까지인가

## 9. 구현 철학

프로젝트 구현 철학은 다음 원칙을 따른다.

### Preview First

실제 변경 전에 먼저 Preview를 만든다.

Preview는 후보와 결과를 계산하지만 write를 수행하지 않는다.

### Approval First

사용자 승인 또는 정책 승인이 필요한 작업은 Commit 전에 Approval을 거친다.

### Policy First

구현보다 정책을 먼저 확인한다.

금지선, 상태 전이, runtime write 조건, SendOrder 조건을 먼저 고정한다.

### Commit Isolation

Commit은 Preview, Approval, Policy와 분리한다.

Commit 계층만 명시 조건에서 write를 수행한다.

### Review Separation

Commit 결과 검토는 별도 Review 계층에서 수행한다.

Review 계층은 기본적으로 write를 수행하지 않는다.

### Execution Separation

Execution은 Decision, Queue, Review 이후 별도 계층으로 분리한다.

Execution은 곧 SendOrder가 아니다.

### No Hidden Runtime Write

숨겨진 runtime write는 금지한다.

runtime write는 명시 path, 명시 승인, 명시 Commit 계층에서만 허용한다.

### No Direct SendOrder

SendOrder 직접 호출은 금지한다.

SendOrder는 별도 EntryPoint, Gate, Review, Result Recorder 정책을 통과해야 한다.

### No Implicit GUI Connection

GUI 버튼은 다른 위험 단계와 자동 연결하지 않는다.

GUI는 표시와 명시 사용자 입력을 담당한다.

## 10. Preview 계층 원칙

표준 계층은 다음 순서이다.

```text
Preview
↓
Approval
↓
Policy
↓
Commit
↓
Review
↓
Execution
↓
SendOrder
```

단계 생략은 금지한다.

### 단계별 기준

Preview:

- 후보 생성
- diff 계산
- readiness 확인
- write 금지

Approval:

- 사용자 또는 정책 승인 확인
- 승인 상태 검증
- 승인과 실제 변경 분리

Policy:

- 운영 정책 적용
- 금지선 적용
- 충돌 여부 확인

Commit:

- 실제 변경 수행
- 명시 path 필수
- backup, stale snapshot, atomic write 원칙 적용

Review:

- Commit 결과 검토
- 후속 단계 진입 가능성 확인

Execution:

- 실행 후보를 실제 실행 계층으로 전달
- runtime과 queue 정책을 따름

SendOrder:

- 실제 주문 호출 계층
- 가장 높은 위험 단계
- 자동 연결 금지

## 11. 문서 작업 규칙

문서 작업은 docs 프로젝트에서 수행한다.

### MASTER_SPEC

- 기존 Canonical은 덮어쓰지 않는다.
- 새 날짜 또는 새 주제의 Canonical 파일을 생성한다.
- 기존 내용을 삭제하거나 축약하지 않는다.
- 중복은 의미 단위로 정리하되 세부 의미는 보존한다.
- 구현 완료와 설계 예정은 구분한다.

### CHANGELOG

- 기존 CHANGELOG를 수정하지 않는다.
- 새 날짜 CHANGELOG를 생성한다.
- 변경 위치, 추가 정책, 테스트 수, 금지선 유지 여부를 기록한다.

### Resume

- 다음 작업 시작 기준을 짧고 명확하게 작성한다.
- 완료된 작업, 미연결 상태, 다음 작업 후보를 구분한다.

### 운영 문서

- 기존 버전을 삭제하지 않는다.
- 운영 방식이 바뀌면 새 버전을 생성한다.
- 구현 내용이 아니라 운영 절차를 기록한다.

## 12. 구현 작업 규칙

구현 작업은 kiwoom_auto 프로젝트에서 수행한다.

### 작업 전

- 현재 branch 확인
- git status 확인
- 수정 대상 파일 확인
- 금지 파일 확인
- MASTER_SPEC 관련 정책 확인
- 테스트 범위 확인

### 작업 중

- 요청 범위만 수정
- 불필요한 리팩토링 금지
- 기존 사용자 변경 보존
- runtime/rules.json 변경 여부 주의
- GUI/Execution/SendOrder 연결은 명시 요청 없으면 금지

### 작업 후

- 변경 파일 확인
- py_compile 실행
- 관련 unittest 실행
- 가능한 경우 전체 unittest 실행
- runtime 변경 여부 확인
- rules.json 변경 여부 확인
- 결과 보고

## 13. 테스트 규칙

테스트는 작업 위험도에 따라 단계적으로 수행한다.

### 기본 테스트

- py_compile
- 관련 unittest
- 변경 파일 import 확인

### 확장 테스트

- 전체 unittest discovery
- pytest가 있는 경우 관련 pytest
- GUI 관련 작업이면 offscreen 또는 가능한 범위의 GUI 테스트

### 상태 확인

- runtime 변경 여부 확인
- rules.json 변경 여부 확인
- Git 변경 파일 확인

### 보고 원칙

- 실행한 테스트만 통과했다고 보고한다.
- 실행하지 못한 테스트는 이유를 쓴다.
- 실패한 테스트는 숨기지 않는다.

## 14. GitHub 동기화 규칙

GitHub 동기화는 다음 흐름을 따른다.

```text
Push 완료
↓
ChatGPT가 GitHub 기준으로 검토
↓
다음 작업 결정
```

### 원칙

- Push 완료 전 로컬 구현은 공식 구현이 아니다.
- Push 후 ChatGPT는 GitHub 최신 코드 기준으로 분석한다.
- Codex 로컬 보고와 GitHub 상태가 다르면 GitHub를 우선한다.
- 다음 설계는 GitHub 반영 상태를 기준으로 한다.

## 15. 보고 형식

### Codex 보고 템플릿

```text
수행 작업:
- 

변경 파일:
- 

검증:
- 

테스트 결과:
- 

수정하지 않은 항목:
- runtime:
- rules.json:
- GUI:
- Git:

남은 위험 / 누락 가능성:
- 

다음 권장 작업:
- 
```

### ChatGPT 보고 템플릿

```text
현재 상태:
- 

완료된 범위:
- 

공식 기준:
- GitHub:
- MASTER_SPEC:
- 운영 매뉴얼:

다음 Codex 작업 지시:
- 

금지사항:
- 

다음 대화 시작 요약:
- 
```

## 16. 수정 금지 규칙

명시 요청 없이는 다음을 수정하지 않는다.

- runtime
- rules.json
- GUI
- ExecutionController real 연결
- SendOrder
- Chejan real 연결
- Git history
- 기존 Canonical
- 압축파일

### 명시 없는 구현 금지

사용자가 문서 작업을 요청한 경우 구현하지 않는다.

사용자가 구현 작업을 요청한 경우에도 요청 범위 밖 기능은 구현하지 않는다.

SendOrder, ExecutionController real 연결, GUI 자동 연결은 별도 명시 요청과 별도 정책 확인이 필요하다.

## 17. 버전 관리 규칙

운영 방식이 변경되면 새 버전을 생성한다.

예:

```text
AI_PROJECT_OPERATION_MANUAL_v1.2.md
AI_PROJECT_OPERATION_MANUAL_v1.3.md
AI_PROJECT_OPERATION_MANUAL_v1.4.md
```

기존 버전은 삭제하지 않는다.

버전 변경 시 포함할 내용:

- 변경 이유
- 변경된 절차
- 추가된 금지사항
- 기존 버전과의 차이
- 적용 시작 기준

## 18. 다음 창 시작 템플릿

새 대화를 시작할 때 아래 템플릿을 그대로 붙여넣어 사용할 수 있다.

```text
작업 시작 전 확인:

1. 현재 Project:
- docs / kiwoom_auto 중 하나를 명시한다.

2. 작업 유형:
- 문서 작업 / 구현 작업 / 테스트 작업 / Git 작업 중 하나를 명시한다.

3. 기준 문서:
- MASTER_SPEC:
- AI_PROJECT_OPERATION_MANUAL:
- 작업재개요약:

4. Source of Truth:
- GitHub 최신 코드 확인 여부:
- Push되지 않은 로컬 변경 존재 여부:

5. 작업 목표:
-

6. 수정 허용 범위:
-

7. 수정 금지 범위:
- runtime:
- rules.json:
- GUI:
- ExecutionController:
- SendOrder:
- Git:

8. 검증 범위:
- py_compile:
- 관련 unittest:
- 전체 unittest:
- runtime 변경 확인:
- rules.json 변경 확인:

9. 기대 결과물:
-

10. 보고 형식:
- 변경 파일
- 변경 위치
- 테스트 결과
- 수정하지 않은 항목
- 남은 위험
```

이 템플릿을 사용하면 ChatGPT와 Codex는 같은 운영 방식으로 작업을 시작한다.
