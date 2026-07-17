# PART02_06_RUNTIME_FILTER_ENGINE

Reference Edition Subpart

Original Canonical: MASTER_SPEC_CANONICAL_2026-07-10_RUNTIME_COMMIT_AND_FIRST_FILTER_COMPLETION.txt

Source Full Part: PART02_RUNTIME.md

생성일: 2026-07-10

주의: 본 문서는 AI 참조용 하위 분할본이며 공식 원본은 CURRENT의 Canonical이다.

Original Body Marker: START
==================================================
02.29 ~ 02.30 Runtime Commit Filter Engine
==================================================

02.29 Runtime Commit Architecture 최종 구조 (M6 Complete)

Layer 순서
- Runtime Commit Boundary (preview_only)
- Runtime Commit Transaction Contract
- Runtime Commit Transaction Persistence
- Runtime Commit Guard (안전 게이트)
- Runtime Commit Approval Token Store
- Runtime Commit Real Executor
- Runtime Commit Recovery Journal
- Runtime Commit Verify
- Runtime Commit Rollback

02.29.1 Runtime Commit Transaction Contract
- Atomic Apply Plan 포함 (target_runtime_files, changed_fields_candidate, apply_order, atomic)
- Verification Plan 포함
- Rollback Plan 포함
- 계약 위반 시 커밋 진입 차단

02.29.2 Runtime Commit Transaction Persistence
- 커밋 상태 영속화 담당
- Runtime Commit Boundary preview_only 상태와 분리하여 실제 상태 기록

02.29.3 Runtime Commit Guard
- 실행 전 안전 게이트
- Real Executor 진입 여부 결정
- 금지선/보호 파일 위반 시 차단

02.29.4 Runtime Commit Approval Token Store
- 승인 토큰 발급/검증 담당
- 커밋 승인 무결성 보장

02.29.5 Runtime Commit Real Executor
- 실제 Runtime Commit 수행
- Guard/Approval/Persistence/Recovery Journal 연동

02.29.6 Runtime Commit Recovery Journal
- 커밋 복구 이력 기록
- 장애 발생 시 복구 기준 제공

==================================================
Lifecycle Integration
==================================================

Lifecycle Evidence Review
↓
Runtime Commit Boundary Eligibility 평가
↓
Runtime Commit Transaction Contract 구성
↓
Runtime Commit Guard 통과
↓
Runtime Commit Approval Token 발급
↓
Runtime Commit Real Executor 실행
↓
Runtime Commit Recovery Journal 기록

==================================================
Runtime Commit Source-of-Truth
==================================================

Source-of-Truth 위치
- runtime/positions.json
- runtime/fills.json
- runtime/order_executions.json
- runtime/order_queue.json
- routines/*/rules.json

==================================================
Runtime Commit Single Write Owner 정책
==================================================

Single Write Owner 원칙
- Runtime Commit Real Executor는 단일 쓰기 소유자
- 하나의 트랜잭션에 하나의 쓰기 소유자만 허용
- 중복 쓰기 시도 시 충돌 검출 및 차단

==================================================
Approval / Pending Candidate 정책
==================================================

Approval 정책
- 모든 Runtime Commit은 Approval Token 없이 실행 불가
- Token은 Runtime Commit Approval Token Store에서 발급

Pending Candidate 정책
- Pending Candidate는 Commit 전 상태 후보
- 검증 실패 시 Pending Candidate 폐기

==================================================
Builder Contract
==================================================

Builder Contract
- Atomic Apply Plan: target_runtime_files, changed_fields_candidate, apply_order, atomic=True

==================================================
Adapter Contract
==================================================

Adapter Contract
- Recovery Journal과 Persistence 연동
- Source-of-Truth 동기화

==================================================
End-to-End Contract
==================================================

E2E Contract
- Lifecycle Evidence Review ~ Real Executor 전체 흐름
- safety flags 일관성 유지
- preview_only=True 유지 (실제 실행은 Real Executor에서만)

==================================================
RSI Buy Filter 구현
==================================================

완료 범위
- RSI Buy Filter

실제 호출 위치
- routines/지표추종매매/rules.json: rsi_buy 필드

공식 실행 Rule
- RSI(14) < 30: 매수 신호 생성

Pending Candidate
- rsi_buy_signal: { code, rsi_value, timestamp }

기준봉
- 현재 봉(1분 차트) 기준 RSI 계산

오류 정책
- RSI 값 없음: 필터 패스
- RSI 계산 오류: 로그 기록, 필터 패스

==================================================
Filter 구현 순서
==================================================

완료
- RSI + Moving_average Buy Filter 완료

미구현
- MACD선 필터
- Signal선 필터
- 가격비교 BUY 필터
- OCR 필터
- Composite Filter

==================================================
향후 계획
==================================================

예정
- 가격비교 BUY 필터

Lifecycle Integration 흐름이 Service → Builder → Adapter → Real Executor로 통일됨

현재 RSI와 이동평균 필터 완료 단계임

MACD 위치 필터는 구현 후 제거됨

필수적으로 rules.json 수정 금지 경로에 예외를 명확히 표기함

참고: 00_CANONICAL/REFERENCE/PART08_OPERATION_POLICY.md

참고: 00_CANONICAL/REFERENCE/00_REFERENCE_INDEX.md

참고: 20_ARCHIVE/RESUME/PROJECT_RESUME_2026-07-10_M7_LIFECYCLE_RUNTIME_COMMIT_RSI_BUY_FILTER.txt

Original Body Marker: END

---

Reference Navigation

- Previous: PART02_05_RUNTIME.md
- Next: PART03_01_GUI.md
- INDEX: 00_REFERENCE_INDEX.md
- Original Canonical: ../CURRENT/MASTER_SPEC_CANONICAL_2026-07-10_RUNTIME_COMMIT_AND_FIRST_FILTER_COMPLETION.txt



---

Reference Navigation

- Previous: PART02_05_RUNTIME.md
- Next: PART03_01_GUI.md
- INDEX: 00_REFERENCE_INDEX.md
- Original Canonical: ../CURRENT/MASTER_SPEC_CANONICAL_2026-07-10_RUNTIME_COMMIT_AND_FIRST_FILTER_COMPLETION.txt