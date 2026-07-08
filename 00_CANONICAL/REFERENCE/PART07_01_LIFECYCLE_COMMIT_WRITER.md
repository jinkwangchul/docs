# PART07_01_LIFECYCLE_COMMIT_WRITER

Reference Edition

Original Canonical: 00_CANONICAL/CURRENT/MASTER_SPEC_CANONICAL_2026-07-08_LIFECYCLE_COMMIT_WRITER_SERVICE.txt

생성일: 2026-07-08

주의: 본 문서는 AI 참조용 분할본이며 공식 원본은 CURRENT의 Canonical이다.

MASTER_SPEC CANONICAL — Lifecycle Commit Writer Service
작성일: 2026-07-08
기준 프로젝트: kiwoom_auto
기준 커밋: cdd74a2
커밋 메시지: Add lifecycle commit writer service

요약:
본 문서는 kiwoom_auto 프로젝트에서 추가된 'Lifecycle Commit Writer' 계층의 실제 구현 내용을 MASTER_SPEC 반영 후보로 정리한 문서입니다. 구현의 목적, 저장소 구조, 주요 함수(prepare/finalize), 상태 전이, 중복 방지 전략, 증거/감사(journal) 및 복구(recovery)를 포함합니다.

1. 구현 개요
- 목적: 라이프사이클(생명주기) 단위의 변경을 원자적으로 기록하고, prepare/finalize 패턴을 통해 외부 실행(executor)과의 동기화를 보장하며, 감사(journal) 및 복구(recovery)를 지원한다.
- 구성: Writer (쓰는 계층) + Service (오케스트레이션)로 분리. Writer는 SQLite 기반의 영속 저장소에 트랜잭션 단위로 기록하고, Service는 prepare → executor → finalize 흐름을 관리한다.

2. GitHub 반영 정보
- Repository: https://github.com/jinkwangchul/kiwoom_auto
- Branch: main (확인 필요)
- Commit Hash: cdd74a2
- Commit Message: Add lifecycle commit writer service

3. 구현 파일
- lifecycle_commit_writer.py
  - SQLite 저장소 정의, 테이블 스키마, prepare_commit / finalize_commit 구현, 중복 방지 로직, 트랜잭션 처리 및 감사 저널 기록 기능을 포함.
- lifecycle_commit_service.py
  - commit_lifecycle API 제공. Writer를 이용해 prepare, executor 호출, finalize/abort 처리의 제어를 담당.
- tests/test_lifecycle_commit_writer_service.py
  - Writer와 Service의 주요 시나리오(정상 커밋, 중복 증거(evidence) 처리, executor 실패에 의한 abort 등)를 검증하는 단위 테스트.

4. Lifecycle Commit Writer
- SQLite 저장소 구조 (개요)
  - transitions 테이블: 라이프사이클 단위의 상태 전이를 저장. 주요 컬럼 예:
    - id INTEGER PRIMARY KEY AUTOINCREMENT
    - evidence_id TEXT UNIQUE NOT NULL      -- 외부에서 제공되는 증거 ID (중복 방지 키)
    - order_id TEXT                         -- 도메인 주문 식별자
    - event TEXT                            -- 이벤트 타입 또는 식별자
    - payload BLOB / JSON                   -- 커밋에 포함된 데이터
    - state TEXT                            -- 'prepared' | 'committed' | 'aborted'
    - created_at TIMESTAMP
    - finalized_at TIMESTAMP
    - UNIQUE(order_id, event)               -- order_id + event 중복 방지
  - journal 테이블: 감사/로그 목적의 기록을 순차적으로 남김.
    - id, transition_id, action('prepare','finalize','abort'), detail(TEXT), ts
  - metadata 테이블: 키-값 형태의 메타데이터 저장 (예: 마지막 처리된 시퀀스 등)

- transitions / journal / metadata
  - transitions는 상태 전이에 대한 소스 오브 트루스로 동작한다. prepare 시점에 'prepared'로 추가되며, finalize 시 committed 또는 aborted로 상태가 변경된다.
  - journal은 각 단계(prepare/finalize/abort)의 상세 정보(예외 스택, executor 결과 등)를 보관하여 감사와 복구 시나리오에서 근거로 사용한다.
  - metadata는 스키마 버전, 마지막 커밋 위치 등 운영 정보를 보관한다.

- prepare_commit
  - 동작: evidence_id, order_id, event, payload를 받아 트랜잭션 내에서 transitions에 'prepared' 엔트리를 삽입하고 관련 journal 항목을 추가함.
  - 보장: 삽입은 SQLite 트랜잭션으로 둘러싸이며, evidence_id 또는 (order_id,event) 중복이 발견되면 IntegrityError를 잡아 적절히 처리(중복일 경우 기존 레코드를 반환하거나 에러 응답).
  - 반환값: prepared_id 또는 준비 상태를 나타내는 메타 정보(증거(evidence_id), transitions 레코드 식별자 등).

- finalize_commit
  - 동작: prepare로 생성된 레코드의 상태를 'committed' 또는 'aborted'로 전환. committed인 경우 finalized_at 타임스탬프를 기록하고 필요 시 audit/journal를 추가.
  - idempotency: 기본적으로 finalize는 이미 committed 상태이면 무해한(no-op) 동작으로 처리하여 중복 호출에 대해 안전하게 설계. 다만 finalize의 idempotency를 더욱 강화하는 작업은 다음 단계 과제로 남김.
  - 실패 처리: finalize 중 예외 발생 시 트랜잭션을 롤백하고 journal에 실패 정보를 남김. 실행기(executor) 실패에 대한 처리는 Service 레이어에서 abort/cleanup을 결정.

- prepared / committed / aborted
  - prepared: 실행 준비 완료. 외부 executor가 작업을 수행할 수 있도록 보장된 기록 상태.
  - committed: executor가 성공적으로 실행되어 변경이 영속화된 상태(최종 상태).
  - aborted: 실행 실패 등으로 작업이 취소된 상태. 로그와 함께 복구/재시도 정책에 따라 추가 처리 가능.

- evidence_id 중복 방지
  - evidence_id에 UNIQUE 제약을 둠으로써 동일 증거의 중복 기록을 DB 수준에서 방지.
  - 동시성 상황에서 삽입 충돌이 발생하면 IntegrityError를 잡아 중복 처리 로직(기존 레코드 조회 후 no-op 반환 또는 오류 반환)로 분기.

- order_id + event 중복 방지
  - (order_id, event) 복합 UNIQUE 인덱스를 통해 동일 주문에 동일 이벤트가 중복 적용되는 것을 방지.
  - 중복시 기존 레코드의 상태(예: 이미 committed면 무시) 판단 로직을 수행.

- read_store_snapshot
  - Writer는 prepare 단계나 executor 실행 전 필요한 경우 읽기 전용 스냅샷을 조회하여현재 스토어 상태(예: 최신 주문 상태)를 확인. SQLite의 일관된 읽기를 활용.
  - 검증 실패 시 prepare 실패 또는 executor 실행 중단으로 처리.

- transaction rollback
  - 모든 DB 변경(prepare/ finalize / journal 삽입)은 명확한 트랜잭션 경계 안에서 수행. 예외 시 rollback하여 불완전한 상태가 DB에 남지 않도록 설계.

- audit journal
  - journal 테이블에 prepare/finalize/abort 시 상세 레코드를 남겨 감사와 추적을 가능하게 함. 재구성(replay)이나 수동 복구 시 이 로그가 근거가 됨.

5. Lifecycle Commit Service
- commit_lifecycle
  - API 역할: 하나의 라이프사이클 커밋을 처리하는 상위 오케스트레이터. Writer의 prepare_commit을 호출하여 준비 상태를 DB에 기록한 뒤, executor(비즈니스 로직)를 호출하고 그 결과에 따라 finalize_commit을 호출한다.

- prepare → executor → finalize 흐름
  1) prepare_commit(evidence_id, order_id, event, payload) -> prepared 레코드 확보
  2) executor 실행(업스트림/외부 의존 작업; 동기/비동기 실행 모델에 따라 달라짐)
  3) executor 성공 시 finalize_commit(prepared_id, committed)
  4) executor 실패 시 finalize_commit(prepared_id, aborted) 및 journal에 실패 원인 기록

- executor 성공
  - 성공 시에는 finalize_commit을 통해 committed 상태로 전환하고 audit을 남긴다. 호출자에게 성공을 반환.

- executor 실패
  - 실패 시에는 aborted 상태로 기록하고, 실패 원인(예외 메시지, 스택 등)을 journal에 남김. 호출자에게 실패를 반환하며 복구 수단(수동 혹은 자동 재시도)을 고려할 수 있도록 한다.

- aborted 처리
  - aborted 상태는 명시적으로 기록되며, 이후 복구/재처리 정책에 따라 재시도하거나 수동 개입 포인트로 활용한다. 현재 구현에서는 자동 재시도는 미구현.

- 감사/복구 가능 상태
  - Prepared 상태는 시스템 장애 이후에도 남아 있어 finalize를 재시도하거나 수동으로 상태를 정리할 수 있다. journal과 metadata를 활용해 복구 절차를 수행할 수 있도록 설계됨.

6. 테스트 결과
- py_compile: OK
- Writer/Service 관련 단위 테스트: 12 tests OK
- Lifecycle 관련 전체 테스트: 69 tests OK
- 전체 unittest: 2534 tests OK
  (상세: 테스트 환경은 기존 CI/로컬 테스트 스위트와 동일, 런타임/외부 의존 미연결 상태에서 실행)

7. 유지된 금지선
- 런타임 변경 없음 (Python runtime, 의존성 등 변경 금지)
- rules.json 변경 없음
- GUI 연결 없음
- SendOrder live 연결 없음
- Chejan live 연결 없음
- retry 미구현 (현재 버전에서 자동 재시도 없음)
- TTL / Reaper 미구현 (다음 과제로 분류)

8. MASTER_SPEC 반영 후보
- Lifecycle Commit Writer (구현 세부 규격화)
- Lifecycle Commit Service (오케스트레이션 규약)
- Lifecycle Commit Storage (transitions/journal/metadata 스키마)
- Lifecycle Commit Journal (감사 로깅 포맷 및 필드)
- Lifecycle Commit State Machine (prepared/committed/aborted 정의 및 전이 규칙)
- Executor Failure Handling (abort 규약, 실패 보고 포맷, 복구 지침)

9. 다음 구현 후보
- TTL / Reaper: 오래된 prepared 레코드 정리 정책 및 자동 수거기 구현
- finalize idempotency 강화: finalize 단계의 재시도/다중 호출에 대한 강건성 향상
- Backup / Recovery: DB 백업/복구 절차 및 장애 복구(runbook) 확립
- Monitoring: 상태 및 지연, 실패율에 대한 모니터링/경보 체계 추가

금지:
- MASTER_SPEC 직접 수정 금지
- CHANGELOG 생성 금지
- REFERENCE 수정 금지
- Python 코드 변경 금지
- Git commit / push 금지

보고:
- 생성 파일: PART07_01_LIFECYCLE_COMMIT_WRITER.md
- 저장 위치: 00_CANONICAL/REFERENCE/
- 주요 섹션:
  1) 구현 개요
  2) GitHub 반영 정보
  3) 구현 파일
  4) Lifecycle Commit Writer (저장소 구조, prepare/finalize 등)
  5) Lifecycle Commit Service (오케스트레이션)
  6) 테스트 결과
  7) 유지된 금지선
  8) MASTER_SPEC 반영 후보
  9) 다음 구현 후보
  10) 금지 항목
  11) 보고(생성 파일/저장 위치/주요 섹션/docs git status)

참고 및 주의:
- 본 문서는 MASTER_SPEC에 직접 반영하는 후보 문서로 작성되었습니다. MASTER_SPEC 자체를 수정하는 행위는 금지되어 있으니, 후보 검토 후 별도의 PR/프로세스를 통해 MASTER_SPEC에 반영하시기 바랍니다.
- 파일 생성과 내용은 문서화 목적이며, 실제 코드는 변경하지 않았습니다.

끝.
