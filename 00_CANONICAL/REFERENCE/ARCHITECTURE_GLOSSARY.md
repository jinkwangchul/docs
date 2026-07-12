# ARCHITECTURE_GLOSSARY

문서 성격: 운영·해석 기준 Reference (MASTER_SPEC 아님)

생성일: 2026-07-12

분류: 00_CANONICAL/REFERENCE

주의: 본 문서는 운영·해석 기준만 기록한다. 기존 구현이나 구조를 변경하지 않는다.

- Canonical 충돌 시 최신 Canonical을 우선한다.
- 과거 Archive 문서와 충돌 시 이 Glossary 및 최신 Canonical을 우선한다.

==================================================
1. 공식 호출 순서
==================================================

Lifecycle Runtime Commit 공식 호출 순서:

Service
→ Builder
→ Adapter
→ Runtime Commit Real Executor

정의:

Service
- 유스케이스 진입점
- 입력 수신, 흐름 선택, 결과 반환 담당
- 실행용 내부 객체를 직접 조립하지 않음

Builder
- 검증된 입력을 Executor 계약에 필요한 요청 객체로 조립
- 비즈니스 흐름이나 실제 write를 수행하지 않음

Adapter
- Builder 결과를 하위 계층 인터페이스에 맞게 변환하고 호출
- 독립적인 정책이나 요청 구조를 새로 만들지 않음

Runtime Commit Real Executor
- 승인·Guard·Persistence·Recovery 계약을 통과한 Runtime Commit의
  실제 수행 능력을 가진 단일 쓰기 소유자
- 구현되어 있다는 사실과 Production 호출이 허용됐다는 사실은 별개

==================================================
2. Preview / Review / Approval / Verification
==================================================

Preview
- 실제 변경이나 외부 호출 없이 예상 결과와 실행 후보를 생성하는 처리 방식
- State가 아니라 Mode 또는 Stage

Review
- 운영자나 상위 판단 계층이 후보와 위험을 검토하는 과정

Approval
- 특정 후보·계획·해시에 대해 실행을 허가한 결정 또는 상태
- Review와 동일 의미가 아님

Verification
- 입력, 계약, 실행 결과 또는 저장 결과의 정합성을 검사하는 과정
- 운영자 승인 판단이 아님

Validation
- 다음 계층으로 전달되기 전에 입력과 계약 형식이 유효한지 검사

==================================================
3. State / Stage / Mode 분리
==================================================

State 예:
- READY
- BLOCKED
- INVALID
- APPROVED
- COMMITTED
- VERIFIED
- ABORTED
- ROLLED_BACK
- REVIEW_REQUIRED

Stage 예:
- Build
- Adapt
- Validate
- Review
- Commit
- Verify
- Recover

Mode 예:
- Preview
- Dry-run
- Production

PREVIEW를 READY, BLOCKED 같은 State와 같은 축으로 정의하지 않는다.

==================================================
4. Contract / Plan / Boundary / Gate
==================================================

Contract
- 계층 간 전달 데이터와 불변조건의 공식 약속

Plan
- 실행 전에 생성된 구체적인 작업 순서와 대상 목록

Boundary
- 계층 또는 기능이 허용하는 책임과 접근 범위

Gate
- 조건을 평가해 다음 단계 진입 허용 여부를 결정하는 지점

Policy
- Gate와 Service가 판단할 때 사용하는 규칙

Token
- 특정 승인 대상과 범위를 결합한 검증 가능한 허가 증표

Candidate
- 아직 최종 승인 또는 Commit되지 않은 변경·실행 후보

Pending
- Candidate가 승인 또는 거절 결정을 기다리는 상태

==================================================
5. Rollback / Recovery / Cleanup
==================================================

Cleanup
- 실패 또는 종료 후 lock, temp resource 등을 정리
- 이전 데이터 상태 복원이 아님

Lock Release
- Cleanup의 일부
- Rollback과 동일하지 않음

Rollback
- 이미 적용된 변경을 이전 검증 상태로 복원

Recovery
- 장애 이후 시스템을 일관된 운영 상태로 되돌리는 전체 절차
- Rollback, Journal, Verification을 포함할 수 있음

==================================================
6. Runtime / Lifecycle / Execution
==================================================

Lifecycle
- 종목 또는 운영 객체의 상태 전이 흐름

Runtime
- 프로그램 실행 중 유지·변경되는 운영 상태와 파일

Execution
- 승인된 신호나 계획을 주문·Commit 등 실제 수행 경로로 전달하는 처리

Lifecycle Runtime Commit
- Lifecycle 상태 변경을 Runtime Source of Truth에 반영하는 Commit 흐름

Execution Runtime Commit
- Execution 결과 또는 실행 상태를 Runtime Source of Truth에 반영하는 Commit 흐름

둘 다 Runtime Commit 기반 구조를 재사용할 수 있지만
업무 입력과 대상 Runtime 파일은 구분한다.

==================================================
7. 용어 사용 금지·주의
==================================================

- Preview Executor라는 신규 용어를 임의 생성하지 않는다.
- Real Executor를 실제 Production 연결 완료 의미로 해석하지 않는다.
- Review와 Approval을 동의어로 쓰지 않는다.
- Validation과 Verification을 동의어로 쓰지 않는다.
- Rollback과 Lock Release를 같은 작업으로 쓰지 않는다.
- Stage와 State를 같은 표에 혼합할 경우 열을 분리한다.
- 기존 코드 심볼명은 Glossary 정리를 이유로 변경하지 않는다.

==================================================
8. 기존 문서 처리
==================================================

수정하지 않을 대상:

- 00_CANONICAL/CURRENT 기존 Canonical
- 20_ARCHIVE 전체
- 10_UPDATE/MERGED 과거 문서
- 기존 CHANGELOG
- kiwoom_auto 전체

과거 문서에 다른 호출 순서가 있어도 삭제·수정하지 않고
최신 공식 기준이 무엇인지만 Glossary에 명시한다.

==================================================
9. 참조 연결
==================================================

본 Glossary는 다음 문서에서 세션 우선 참조 문서로 연결된다.

- 00_CANONICAL/REFERENCE/00_REFERENCE_INDEX.md
- 00_CANONICAL/REFERENCE/AGENT_WORKFLOW_REFERENCE.txt

권장 참조 순서:

1. README
2. AI_PROJECT_OPERATION_MANUAL_RELEASE
3. AI_SESSION_START_PROTOCOL
4. AGENT_WORKFLOW_REFERENCE
5. ARCHITECTURE_GLOSSARY
6. 00_REFERENCE_INDEX
7. 작업 관련 PART/SUBPART

==================================================
(End of ARCHITECTURE_GLOSSARY)
=================================================
