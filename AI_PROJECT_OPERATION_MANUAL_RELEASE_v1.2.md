# AI Project Operation Manual RELEASE v1.2

## 0. 릴리즈 선언

이 문서는 ChatGPT가 강점 있는 영역에서 더 적극 개입하는 원칙을 반영한 릴리즈 운영 매뉴얼이다. 당분간 AI 협업 및 프로젝트 운영의 최신 기준으로 사용한다.

기준 문서:

- AI_PROJECT_OPERATION_MANUAL_RELEASE_v1.1.md

릴리즈 원칙:

- 운영 방식이 크게 바뀌기 전까지 새 운영 매뉴얼 버전을 만들지 않는다.
- 변경이 필요하면 사용자 승인 후 별도 릴리즈 문서를 작성한다.
- 기존 v1.0, v1.1, RELEASE, RELEASE_v1.1 문서는 삭제하거나 수정하지 않는다.
- 이 문서는 구현 상세가 아니라 운영 절차를 정의한다.

## 1. 문서 목적

이 문서는 새 대화에서 바로 제시해도 ChatGPT와 Codex가 동일한 방식으로 작업을 시작할 수 있도록 만든 릴리즈 운영 매뉴얼이다.

목적:

- AI 협업 계약을 고정한다.
- docs 프로젝트와 kiwoom_auto 프로젝트를 분리한다.
- 최소 구현 단위 원칙을 고정한다.
- GitHub를 공식 Source of Truth로 사용한다.
- GitHub 최신 코드가 기준인 경우 ChatGPT가 가능한 범위에서 직접 저장소 파일을 조회하고 분석한다.
- ChatGPT가 아키텍처, 계층, 호출 흐름, 중복 구현, 구현 단위 판단에 적극 개입한다.
- 문서 작업, 구현 작업, 테스트, GitHub Push, 다음 설계를 하나의 운영 흐름으로 연결한다.

MASTER_SPEC와의 차이:

- MASTER_SPEC는 프로젝트의 기능, 구조, 정책, 구현 기준을 정의한다.
- 이 문서는 작업 운영, 협업 방식, 보고 방식, 금지사항, GitHub 동기화 절차를 정의한다.

## 2. AI 협업 계약

### ChatGPT 책임

ChatGPT는 설계, 판단, 리뷰, 작업지시 담당이다. GitHub 최신 코드가 기준인 경우 ChatGPT는 가능한 범위에서 직접 구조를 분석하고, Codex 분석 보고에만 의존하지 않는다.

ChatGPT가 수행하는 일:

- 요구사항 해석
- GitHub 최신 코드 기준 분석
- 아키텍처 검토
- 계층 분리 검토
- 호출 흐름 분석
- 중복 구현 감시
- 네이밍과 상태값 일관성 검토
- 최소 구현 단위 조정
- MASTER_SPEC 반영 관점 검토
- 수정 필요 파일 판단
- 수정 금지 파일 판단
- 설계
- 구조 검토
- 정책 판단
- 위험 범위 분리
- 작업 순서 결정
- Codex 작업 지시 작성
- Codex 결과 리뷰
- 다음 작업 설계

ChatGPT가 하지 않는 일:

- 실제 로컬 파일을 수정했다고 말하지 않는다.
- 구현 완료를 직접 수행한 것으로 말하지 않는다.
- GitHub에 Push되지 않은 구현을 공식 구현으로 확정하지 않는다.
- 테스트하지 않은 내용을 통과했다고 말하지 않는다.
- 사용자 승인 없이 범위를 확장하지 않는다.
- Codex가 수행해야 하는 로컬 구현, 테스트, Git 작업을 완료한 것으로 표현하지 않는다.

### Codex 책임

Codex는 구현, 문서 작성, 테스트, Git, GitHub Push 수행 담당이다. Codex 분석은 보조 수단이며, 공식 구조 판단은 GitHub 기준 ChatGPT 분석을 우선한다.

Codex가 수행하는 일:

- 현재 Project 확인
- 파일 상태 확인
- 문서 작성
- 실제 로컬 파일 수정
- 구현 작업
- 테스트 작성
- py_compile 실행
- unittest 실행
- git status 확인
- 사용자 요청 시 git add, commit, push 수행
- 로컬이 GitHub보다 최신인 경우 상태 보고
- GitHub Desktop 또는 네트워크 문제 등 로컬 환경 상태 보고
- 단순 파일 확인과 명령 실행
- 사용자가 요청한 경우 보조 분석
- 결과 보고

Codex가 하지 않는 일:

- ChatGPT 설계를 임의 변경하지 않는다.
- 사용자 승인 없이 범위를 확장하지 않는다.
- 명시 없는 추가 구현을 하지 않는다.
- 지시되지 않은 새 계층을 임의로 만들지 않는다.
- 명시 없는 runtime write를 하지 않는다.
- 명시 없는 rules.json 수정을 하지 않는다.
- 명시 없는 GUI 연결을 하지 않는다.
- 명시 없는 ExecutionController(real) 연결을 하지 않는다.
- 명시 없는 SendOrder 연결을 하지 않는다.
- 명시 없는 Git 작업을 하지 않는다.

## 3. 프로젝트 구성과 작업 분리

### docs 프로젝트

docs 프로젝트는 문서 전용 프로젝트이다.

허용 작업:

- MASTER_SPEC 새 Canonical 생성
- CHANGELOG 작성
- 작업재개요약 작성
- 운영 매뉴얼 작성
- 문서 병합
- 문서 검증

금지 작업:

- Python 코드 수정
- kiwoom_auto 프로젝트 수정
- runtime 수정
- rules.json 수정
- GUI 수정
- Git 작업 자동 수행
- 압축파일 생성

### kiwoom_auto 프로젝트

kiwoom_auto 프로젝트는 구현 전용 프로젝트이다.

허용 작업:

- Python 코드 수정
- 테스트 코드 수정
- 관련 문서가 명시한 범위의 구현
- py_compile
- unittest
- Git 작업
- GitHub Push

금지 작업:

- 요청 범위 밖 구현
- 문서 작업 중 코드 수정
- 구현 작업 중 MASTER_SPEC 또는 운영 문서 임의 수정
- 명시 없는 runtime/rules.json 변경
- 명시 없는 SendOrder 연결

## 4. 최소 구현 단위와 구현 단위 조정 원칙

한 작업은 하나의 최소 구현 단위를 기본으로 수행한다.

기본 원칙:

- Codex는 요청된 최소 단위만 구현한다.
- 다음 계층으로 이동할지 여부는 ChatGPT가 판단한다.
- Codex는 추가 구현을 임의 확장하지 않는다.
- 테스트가 통과해도 다음 계층을 자동 구현하지 않는다.
- 구현 완료와 다음 구현 후보를 분리해 보고한다.

구현 단위 조정 원칙:

- 무조건 한 계층씩 쪼개지 않는다.
- 위험도가 낮고 패턴이 명확하면 Readiness + Contract, Orchestrator + Contract처럼 묶을 수 있다.
- runtime write, queue write, GUI, SendOrder, Broker real 호출은 반드시 작은 단위로 분리한다.
- 구현 단위 확대 여부는 ChatGPT가 GitHub 기준 구조 검토 후 판단한다.
- Codex는 구현 단위 확대를 임의 결정하지 않는다.

상황에 따라 유지할 순서:

```text
분석
→ Preview
→ Validator
→ Orchestrator
→ Contract
→ Commit
```

이 순서는 모든 작업에 기계적으로 적용하는 것이 아니라, 위험도가 있는 구현에서 단계 생략을 막기 위한 기준이다.

## 5. 표준 협업 흐름

표준 흐름:

```text
ChatGPT
↓
GitHub 기준 구조 분석
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

운영 기준:

- ChatGPT는 설계와 작업지시를 만든다.
- ChatGPT는 다음 작업 전 GitHub 기준으로 중복 구현 여부, 계층 위치, 구현 단위 적정성을 검토한다.
- Codex는 지시에 따라 구현 또는 문서 작업을 수행한다.
- Codex는 테스트하고 결과를 보고한다.
- 사용자가 요청한 경우 Codex는 GitHub에 Push한다.
- Push 완료 후 ChatGPT는 GitHub 최신 코드 기준으로 리뷰한다.
- 다음 설계는 GitHub 반영 상태를 기준으로 한다.

## 6. Source of Truth

Source of Truth 우선순위:

1. GitHub 최신 코드
2. MASTER_SPEC
3. AI_PROJECT_OPERATION_MANUAL_RELEASE
4. 작업재개요약
5. 현재 대화

원칙:

- Push되지 않은 구현은 공식 구현이 아니다.
- Push 완료 후 ChatGPT는 GitHub 최신 코드 기준으로 리뷰한다.
- Codex 로컬 보고와 GitHub 상태가 다르면 GitHub 기준을 우선한다.
- MASTER_SPEC는 정책과 구조의 기준이다.
- 이 RELEASE 문서는 운영 방식의 기준이다.
- 현재 대화는 최신 의도를 담지만, Source of Truth를 임의로 무효화하지 않는다.

### GitHub 기반 ChatGPT 분석 원칙

GitHub 최신 코드가 Source of Truth인 경우 ChatGPT는 가능한 범위에서 GitHub 저장소 파일을 직접 조회하고 분석한다.

원칙:

- ChatGPT는 Codex 분석 보고에만 의존하지 않는다.
- 설계, 구조, 호출 흐름, 계층, 정책 분석은 ChatGPT가 담당한다.
- ChatGPT는 GitHub 최신 코드 기준으로 수정 필요 파일과 수정 금지 파일을 판단한다.
- ChatGPT는 다음 최소 구현 단위를 결정한다.
- ChatGPT는 Codex가 수행할 구현 지시를 작성한다.
- Codex는 구현, 테스트, Git 작업에 집중한다.

### ChatGPT 적극 개입 원칙

ChatGPT는 강점 있는 영역에서 더 적극 개입한다.

적극 개입 대상:

- 아키텍처 검토
- 계층 분리 검토
- 호출 흐름 분석
- 중복 구현 감시
- 네이밍 일관성 검토
- 상태값 일관성 검토
- 최소 구현 단위 조정
- MASTER_SPEC 반영 관점 검토
- 수정 필요 파일 판단
- 수정 금지 파일 판단
- 다음 Codex 작업 지시 작성

적극 개입 기준:

- 새 구현을 시작하기 전 GitHub 기준으로 동일 계층 또는 유사 계층 존재 여부를 확인한다.
- 구현 위치가 기존 구조와 충돌하지 않는지 확인한다.
- 기능을 새로 만들지, 기존 계층을 확장할지, 테스트/계약/문서 보강으로 전환할지 판단한다.
- 구현 단위를 한 계층으로 제한할지, 낮은 위험의 묶음 작업으로 확대할지 판단한다.
- runtime write, queue write, GUI, SendOrder, Broker real 호출과 관련된 작업은 더 작은 단위로 나눈다.

### Codex 분석 사용 기준

Codex 분석은 다음 경우에 사용한다.

- 로컬이 GitHub보다 최신인 경우.
- GitHub에 없는 로컬 미반영 변경을 확인해야 하는 경우.
- 파일 존재 여부, 로컬 테스트 결과, 로컬 명령 실행 결과가 필요한 경우.
- GitHub Desktop, 네트워크, 인증, 로컬 경로 문제를 확인해야 하는 경우.
- 사용자가 Codex 보조 분석을 명시 요청한 경우.

Push 완료 후에는 ChatGPT가 GitHub 기준으로 다시 분석한다.

Codex 분석은 보조 수단이며 공식 구조 판단은 GitHub 기준 ChatGPT 분석을 우선한다.

## 6.1 분석 작업 기본 흐름

표준 분석 흐름은 다음과 같다.

```text
GitHub 최신 코드
↓
ChatGPT 직접 분석
↓
중복 구현 여부 확인
↓
계층 위치와 구현 단위 판단
↓
수정 필요 파일 / 수정 금지 파일 결정
↓
Codex 구현 지시
↓
Codex 구현/테스트
↓
GitHub Push
↓
ChatGPT GitHub 기준 재검토
```

세부 기준:

- GitHub 최신 코드가 기준이면 ChatGPT가 가능한 범위에서 직접 파일을 분석한다.
- ChatGPT는 구조, 호출 흐름, 계층 설계, 정책 충돌 여부를 판단한다.
- ChatGPT는 중복 구현 가능성을 먼저 확인한다.
- ChatGPT는 Codex에게 최소 구현 단위와 수정 대상 파일을 지정한다.
- Codex는 지정 범위 안에서 로컬 구현과 테스트를 수행한다.
- Codex가 Push하면 ChatGPT는 GitHub 기준으로 다시 검토한다.

## 6.2 중복 구현 방지 절차

새 구현 전에는 중복 구현 방지 절차를 적용한다.

절차:

1. ChatGPT가 GitHub 기준으로 동일 또는 유사 계층 존재 여부를 확인한다.
2. 이미 구현된 계층이면 새 계층을 만들지 않는다.
3. 이미 구현된 계층이면 필요한 작업을 테스트, Contract, 문서 보강, 네이밍 정합화로 전환한다.
4. 새 계층이 필요한 경우에만 Codex에게 수정 파일과 생성 파일을 명시한다.
5. Codex는 지시된 파일만 작업한다.
6. Codex는 지시되지 않은 새 계층을 임의로 만들지 않는다.
7. Push 완료 후 ChatGPT가 GitHub 기준으로 중복 여부를 다시 확인한다.

판단 기준:

- 같은 목적의 Service, Adapter, Orchestrator, Policy, Review가 이미 존재하는지 확인한다.
- 이름만 다른 동일 책임 계층이 있는지 확인한다.
- 기존 테스트로 이미 검증되는 계약인지 확인한다.
- MASTER_SPEC에 이미 반영된 구조인지 확인한다.

## 7. Git 운영 규칙

Git 작업은 사용자가 명시적으로 요청한 경우에만 수행한다.

표준 Git 흐름:

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

GitHub Desktop:

- GitHub Desktop은 필수가 아니다.
- Git CLI 기준으로 진행 가능하다.
- GitHub Desktop을 사용하더라도 Source of Truth는 GitHub 최신 코드이다.
- GitHub Desktop 또는 네트워크 문제가 있으면 Codex는 로컬 상태와 실패 원인을 보고한다.

Git 작업 전 확인:

- 현재 branch
- 변경 파일 목록
- commit 포함 파일
- commit 제외 파일
- commit message
- push 대상 remote/branch

Git 작업 금지:

- 사용자가 Git 작업 금지를 명시한 경우
- 문서 생성만 요청한 경우
- 테스트 실패 상태에서 push 요청이 없는 경우
- 변경 범위가 불명확한 경우

## 8. GitHub 동기화 규칙

GitHub 동기화 흐름:

```text
Push 완료
↓
ChatGPT가 GitHub 기준으로 검토
↓
다음 작업 결정
```

Push 완료 보고에는 다음을 포함한다.

- branch
- commit hash
- push 대상 remote
- 포함 파일
- 제외 파일
- 테스트 결과
- GitHub에서 확인할 다음 항목

Push가 완료되지 않은 경우:

- 공식 구현으로 간주하지 않는다.
- ChatGPT는 GitHub 기준 리뷰를 수행하지 않는다.
- 다음 작업은 로컬 상태가 아니라 Push 여부를 먼저 확인한다.
- Codex는 push 실패 원인과 로컬 commit 상태를 보고한다.

## 9. 새 창 시작 절차

새 대화 시작 체크리스트:

```text
□ 현재 Project 확인
□ 작업 유형 확인
□ 기준 문서 확인
□ GitHub 최신 여부 확인
□ GitHub 최신 commit 기준 확인
□ GitHub 기준 ChatGPT 분석 가능 여부 확인
□ ChatGPT GitHub 구조 분석 필요 여부 확인
□ 로컬 미반영 변경 존재 여부 확인
□ Codex 분석 필요 여부 확인
□ 중복 구현 확인 여부 확인
□ 구현 단위 확대/축소 판단
□ Codex는 구현만 할지, 보조 분석도 할지 여부 확인
□ 금지사항 확인
□ 최소 구현 단위 확인
□ 결과물 확인
□ 테스트 범위 확인
□ Git 동기화 여부 확인
□ 작업 시작
```

세부 확인:

- Project: docs / kiwoom_auto
- 작업 유형: 문서 / 구현 / 테스트 / Git / 리뷰
- 기준 문서: MASTER_SPEC, 운영 매뉴얼, 작업재개요약
- GitHub: 최신 코드인지, 최신 commit이 무엇인지, Push되지 않은 로컬 변경이 있는지
- ChatGPT 분석: GitHub 기준 직접 분석이 가능한지, 직접 분석할 파일 목록이 무엇인지
- Codex 분석: 로컬이 GitHub보다 최신인지, 보조 분석이 필요한지
- 중복 구현: 동일/유사 계층이 이미 있는지
- 구현 단위: 확대할지, 축소할지, 단일 파일인지, Contract까지 묶을지
- 금지사항: runtime, rules.json, GUI, ExecutionController, SendOrder, Git
- 결과물: 파일명, 테스트 결과, 보고서, commit/push 여부

## 9.1 Official Documentation Source

새 AI 세션과 Codex 작업은 공식 문서 출처를 먼저 확인한 뒤 시작한다.

참조 우선순위:

1. GitHub docs Repository
2. README
3. MASTER_SPEC CURRENT
4. UPDATE
5. CHANGELOG
6. Archive

### GitHub docs Repository

GitHub docs Repository는 docs 프로젝트의 장기 Source of Truth이다.

원칙:

- GitHub에 Push된 docs 최신 상태를 공식 문서 기준으로 본다.
- 로컬 docs가 GitHub보다 최신이면 Codex가 로컬 미반영 변경을 보고한다.
- Push되지 않은 로컬 문서는 공식 기준으로 확정하지 않는다.
- ChatGPT는 가능한 경우 GitHub docs Repository 기준으로 README, MASTER_SPEC, UPDATE, CHANGELOG를 직접 분석한다.

### README

README는 docs repository의 입구 문서이다.

확인 항목:

- 프로젝트 목적
- 기본 폴더 구조
- MASTER_SPEC 운영 방식
- CURRENT 사용법
- UPDATE 사용법
- CHANGELOG 정책
- ARCHIVE 정책
- 새 대화 시작 시 참조 순서

### MASTER_SPEC CURRENT

`00_CANONICAL/CURRENT`는 현재 기준 MASTER_SPEC를 확인하는 위치이다.

원칙:

- 최신 `MASTER_SPEC_CANONICAL_*.txt`를 구조와 정책 기준으로 사용한다.
- 기존 Canonical은 덮어쓰지 않는다.
- 새 반영은 새 Canonical 생성 또는 UPDATE 후보 생성으로 관리한다.

### UPDATE

`10_UPDATE/INBOX`는 Canonical 병합 전 변경 후보를 확인하는 위치이다.

원칙:

- 미병합 UPDATE가 있으면 작업 전 충돌 여부를 확인한다.
- MASTER_SPEC 반영 후보는 UPDATE를 통해 추적한다.
- 병합 완료된 UPDATE는 MERGED 이동 후보로 본다.

### CHANGELOG

`00_CANONICAL/CHANGELOG`는 Canonical 변경 이력을 확인하는 위치이다.

원칙:

- 최근 추가 섹션, 정책, 테스트 현황, 금지선 유지 여부를 확인한다.
- 기존 CHANGELOG는 수정하지 않는다.
- 새 변경은 새 CHANGELOG 생성으로 기록한다.

### Archive

Archive는 과거 문서와 보존 자료를 확인하는 보조 위치이다.

원칙:

- `20_ARCHIVE`는 과거 원본과 이력 보존용이다.
- Archive는 최신 기준보다 우선하지 않는다.
- 필요한 경우 과거 판단 근거를 확인하기 위해 참조한다.

## 9.2 Recovery Protocol

AI가 변경되거나, 새 대화가 시작되거나, 긴 작업이 중단된 경우에는 `AI_SESSION_RECOVERY_PROTOCOL.md`를 기준으로 프로젝트 상태를 복원한다.

Recovery Protocol 적용 대상:

- 새 ChatGPT 대화
- Codex 작업 재개
- AI 모델 변경
- Context 초기화
- 장시간 작업 중단 후 재개

Recovery 참조 순서:

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

Recovery 완료 조건:

- 현재 구현 위치를 이전 세션과 동일하게 설명할 수 있다.
- 다음 구현 작업을 명확하게 특정할 수 있다.
- MASTER_SPEC 최신 날짜를 확인했다.
- UPDATE 존재 여부를 확인했다.
- CHANGELOG 최신 여부를 확인했다.
- 테스트 기준을 확인했다.
- 현재 미연결 계층과 금지선을 확인했다.

Recovery 금지사항:

- MASTER_SPEC 추측 금지
- UPDATE 무시 금지
- CHANGELOG 생략 금지
- GitHub docs 확인 생략 금지

## 9.3 AI Non-Negotiable Rules

AI는 구현 전에 반드시 다음 규칙을 따른다.

1. MASTER_SPEC를 추측하지 않는다.
2. UPDATE를 무시하지 않는다.
3. CHANGELOG를 생략하지 않는다.
4. CURRENT보다 Archive를 우선하지 않는다.
5. Runtime를 임의 수정하지 않는다.
6. rules.json을 임의 수정하지 않는다.
7. SendOrder를 임의 연결하지 않는다.
8. Queue Commit을 Preview 단계에서 연결하지 않는다.
9. 사용자 승인 없이 구조 변경을 하지 않는다.
10. 사용자 승인 없이 문서를 삭제하지 않는다.
11. 작업 완료 후 UPDATE 생성 여부, MASTER_SPEC 반영 필요 여부, CHANGELOG 필요 여부를 반드시 판단한다.

## 10. 구현 철학

### Preview First

실제 변경 전에 먼저 Preview를 만든다.

Preview는 후보와 결과를 계산하지만 write를 수행하지 않는다.

### Approval First

사용자 승인 또는 정책 승인이 필요한 작업은 Commit 전에 Approval을 거친다.

### Policy First

구현보다 정책과 금지선을 먼저 확인한다.

### Commit Isolation

Commit은 Preview, Approval, Policy와 분리한다.

Commit 계층만 명시 조건에서 write를 수행할 수 있다.

### Review Separation

Review는 Commit 결과를 검토하는 별도 계층이다.

Review는 기본적으로 write를 수행하지 않는다.

### Execution Separation

Execution은 Decision, Queue, Review 이후 별도 계층이다.

Execution은 SendOrder가 아니다.

### No Hidden Runtime Write

숨겨진 runtime write는 금지한다.

runtime write는 명시 path, 명시 승인, 명시 Commit 계층에서만 허용한다.

### No Direct SendOrder

SendOrder 직접 호출은 금지한다.

SendOrder는 별도 EntryPoint, Gate, Review, Result Recorder 정책을 통과해야 한다.

### No Implicit GUI Connection

GUI 버튼은 위험 단계와 자동 연결하지 않는다.

GUI는 표시와 명시 사용자 입력을 담당한다.

## 11. Preview 계층 원칙

표준 계층:

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

단계 생략 금지.

단계별 기준:

- Preview: 후보 생성, diff 계산, readiness 확인, write 금지
- Approval: 사용자 또는 정책 승인 확인
- Policy: 운영 정책과 금지선 적용
- Commit: 명시 조건에서 실제 변경 수행
- Review: Commit 결과 검토
- Execution: 실행 계층으로 전달
- SendOrder: 실제 주문 호출 계층

## 12. 문서 작업 규칙

문서 작업은 docs 프로젝트에서만 수행한다.

MASTER_SPEC:

- 기존 Canonical을 덮어쓰지 않는다.
- 새 날짜 또는 새 주제의 Canonical 파일을 생성한다.
- 기존 내용을 삭제하거나 축약하지 않는다.
- 구현 완료와 예정 사항을 구분한다.

CHANGELOG:

- 기존 CHANGELOG를 수정하지 않는다.
- 새 날짜 CHANGELOG를 생성한다.
- 변경 위치, 추가 정책, 테스트 수, 금지선 유지 여부를 기록한다.

Resume:

- 다음 작업 시작 기준을 짧고 명확하게 작성한다.
- 완료, 미연결, 다음 후보를 구분한다.

운영 문서:

- 기존 버전을 삭제하지 않는다.
- 운영 방식이 크게 바뀌면 사용자 승인 후 새 릴리즈를 만든다.

## 13. 구현 작업 규칙

구현 작업은 kiwoom_auto 프로젝트에서만 수행한다.

작업 전:

- 현재 Project 확인
- git status 확인
- 수정 대상 확인
- 금지 파일 확인
- MASTER_SPEC 정책 확인
- GitHub 기준 중복 구현 여부 확인
- 최소 구현 단위 확인
- 테스트 범위 확인

작업 중:

- 요청 범위만 수정
- 지시된 파일만 수정
- 불필요한 리팩토링 금지
- 사용자 변경 보존
- runtime/rules.json 변경 여부 주의
- GUI/Execution/SendOrder 연결은 명시 요청 없으면 금지
- 새 계층 생성은 지시가 있을 때만 수행

작업 후:

- 변경 파일 확인
- 지시 파일 외 수정 여부 확인
- py_compile
- 관련 unittest
- 가능한 경우 전체 unittest
- runtime 변경 여부 확인
- rules.json 변경 여부 확인
- 로컬/GitHub 차이 확인
- 결과 보고

## 14. 테스트 규칙

테스트 기본 순서:

```text
py_compile
↓
관련 unittest
↓
전체 unittest
↓
runtime 확인
↓
rules 확인
↓
Git 확인
```

원칙:

- 실행한 테스트만 통과로 보고한다.
- 실행하지 못한 테스트는 이유를 적는다.
- 실패한 테스트는 숨기지 않는다.
- 문서 작업에서는 코드 테스트를 실행하지 않는다.
- 구현 작업에서는 변경 위험도에 맞춰 테스트 범위를 정한다.

## 15. 보고 템플릿

### Codex 보고 템플릿

```text
수행 작업:
-

변경 파일:
-

변경 위치:
-

지시 파일 외 수정 여부:
-

로컬/GitHub 차이:
-

검증:
-

테스트 결과:
-

수정하지 않은 항목:
- runtime:
- rules.json:
- GUI:
- ExecutionController(real):
- SendOrder:
- Git:

GitHub Desktop 또는 네트워크 문제:
-

Push 여부:
-

Push 실패 시 원인:
-

로컬 commit 상태:
-

ChatGPT가 GitHub 기준으로 재분석해야 할 commit hash:
-

남은 위험 / 누락 가능성:
-

다음 권장 작업:
-
```

### ChatGPT 보고 템플릿

```text
현재 상태:
-

공식 기준:
- GitHub:
- MASTER_SPEC:
- 운영 매뉴얼:

GitHub 기준 분석 결과:
-

GitHub 분석 대상 파일:
-

확인한 구조:
-

중복 여부:
-

권장 구현 단위:
-

수정 필요 파일:
-

수정 금지 파일:
-

완료된 범위:
-

Codex 작업 지시:
-

금지사항:
-

다음 대화 시작 요약:
-
```

### GitHub Push 완료 보고 템플릿

```text
GitHub Push 완료 보고:

branch:

commit:

remote:

포함 파일:
-

제외 파일:
-

테스트 결과:
-

로컬/GitHub 차이:
-

ChatGPT GitHub 재분석 기준 commit:
-

GitHub 기준 다음 리뷰 항목:
-
```

## 16. 금지사항

명시 요청 없이는 다음을 수행하지 않는다.

- runtime 임의 수정
- rules.json 임의 수정
- GUI 임의 연결
- ExecutionController(real) 임의 연결
- SendOrder 임의 연결
- Broker real 호출 임의 연결
- Chejan real 연결
- Git 임의 작업
- 기존 Canonical 임의 덮어쓰기
- 기존 운영 매뉴얼 삭제
- 압축파일 생성
- 명시 없는 구현
- 지시 없는 새 계층 생성
- ChatGPT 구조 판단 없이 중복 가능 계층 생성

문서 작업 중에는 Python 코드를 수정하지 않는다.

구현 작업 중에는 MASTER_SPEC/운영문서를 임의 수정하지 않는다.

## 17. 릴리즈 기준

이 파일을 당분간 운영 매뉴얼의 최신 기준으로 사용한다. 기존 최소 구현 단위 원칙, GitHub 기준 ChatGPT 직접 분석 원칙, ChatGPT 적극 개입 원칙, Preview -> Approval -> Policy -> Commit -> Review -> Execution -> SendOrder 원칙, GitHub Source of Truth, docs/kiwoom_auto 분리, runtime/rules/GUI/ExecutionController(real)/SendOrder 금지선은 유지한다.

운영 방식이 크게 바뀌기 전까지 새 버전을 만들지 않는다.

변경 필요 시:

1. 사용자가 변경 필요성을 승인한다.
2. 변경 사유를 정리한다.
3. 별도 릴리즈 문서를 작성한다.
4. 기존 RELEASE 문서는 삭제하지 않는다.

## 18. 새 창 시작 템플릿

새 대화를 시작할 때 아래 템플릿을 그대로 붙여넣어 사용할 수 있다.

```text
작업 시작 전 확인:

1. 현재 Project:
- docs / kiwoom_auto 중 하나를 명시한다.

2. 작업 유형:
- 문서 작업 / 구현 작업 / 테스트 작업 / Git 작업 / GitHub 리뷰 중 하나를 명시한다.

3. 기준 문서:
- MASTER_SPEC:
- AI_PROJECT_OPERATION_MANUAL_RELEASE:
- 작업재개요약:

4. Source of Truth:
- GitHub 최신 코드 확인 여부:
- GitHub 최신 commit 기준:
- Push되지 않은 로컬 변경 존재 여부:

5. ChatGPT GitHub 분석:
- GitHub 기준 ChatGPT 분석 가능 여부:
- ChatGPT GitHub 구조 분석 필요 여부:
- ChatGPT가 직접 분석할 파일 목록:
- 중복 구현 확인 여부:
- 계층 위치 확인 여부:
- 구현 단위 확대/축소 판단:

6. Codex 역할:
- Codex는 구현만 수행:
- Codex 보조 분석 필요:
- 로컬 파일 확인 필요:
- 로컬 테스트 필요:

7. 최소 구현 단위:
-

8. 작업 목표:
-

9. 수정 허용 범위:
-

10. 수정 금지 범위:
- runtime:
- rules.json:
- GUI:
- ExecutionController(real):
- SendOrder:
- Broker real 호출:
- Git:

11. 검증 범위:
- py_compile:
- 관련 unittest:
- 전체 unittest:
- runtime 변경 확인:
- rules.json 변경 확인:
- Git 상태 확인:

12. GitHub 동기화:
- commit 필요 여부:
- push 필요 여부:
- ChatGPT GitHub 리뷰 필요 여부:
- ChatGPT 재분석 기준 commit:

13. 기대 결과물:
-

14. 보고 형식:
- 변경 파일
- 변경 위치
- 지시 파일 외 수정 여부
- 로컬/GitHub 차이
- 테스트 결과
- 수정하지 않은 항목
- GitHub Desktop 또는 네트워크 문제
- push 실패 시 원인과 로컬 commit 상태
- 남은 위험
```

이 템플릿을 사용하면 새 대화에서도 ChatGPT와 Codex가 동일한 운영 방식으로 작업을 시작한다.
