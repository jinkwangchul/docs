# PART08_OPERATION_POLICY

Reference Edition

Original Canonical: MASTER_SPEC_CANONICAL_2026-07-08_EXECUTION_SENDORDER_CHEJAN_LIFECYCLE_PIPELINE.txt

생성일: 2026-07-08

주의: 본 문서는 AI 참조용 분할본이며 공식 원본은 CURRENT의 Canonical이다.

Part Summary: Includes 29.8 Execution SendOrder Chejan Lifecycle Pipeline, including Queue Commit, SendOrder, Recorder, Chejan, Lifecycle Preview, and AI Development Tools.

Original Body Marker: START
29.8 Execution SendOrder Chejan Lifecycle Pipeline

본 섹션은 `UPDATE_20260707_EXECUTION_SENDORDER_CHEJAN_LIFECYCLE_PIPELINE.txt`를 기준으로,
Rule Apply Preview Execution Preview Controller 이후의 실행 후보 계층을 Canonical에 추가 병합한 것이다.

반영 기준:

- 기준 UPDATE: `10_UPDATE/INBOX/UPDATE_20260707_EXECUTION_SENDORDER_CHEJAN_LIFECYCLE_PIPELINE.txt`
- 기준 GitHub 저장소: `jinkwangchul/kiwoom_auto`
- 기준 최신 commit: `197e4deba9f7dce4903064ecedf13ec89a83503a`
- 기준 commit 범위: 최신 commit부터 부모 방향 6개 commit
- 문서 성격: 기존 Canonical 직접 수정이 아닌 신규 Canonical 병합본

반영 commit:

1. `197e4de` / 2026-07-08T04:50:34Z / Add AI development tools
2. `01c93fc` / 2026-07-08T04:46:48Z / Add lifecycle preview pipeline and architecture audit
3. `af75168` / 2026-07-08T04:36:03Z / Add chejan event pipeline
4. `0abde3a` / 2026-07-08T04:27:54Z / Add send order recorder and chejan entry bridge
5. `1ec3388` / 2026-07-08T04:21:22Z / Add canonical send order pipeline
6. `ec0dc74` / 2026-07-08T04:04:15Z / Add execution queue commit pipeline

병합 원칙:

- Preview First, Approval First, Policy First, Commit Isolation, Review Separation 원칙을 유지한다.
- Queue Commit, SendOrder, Recorder, Chejan, Lifecycle 전환은 각각 분리된 계층으로 기록한다.
- Preview, Approval, Contract, Dry-run, Executor, Review의 경계를 유지한다.
- 기존 Canonical의 preview-only 금지선과 충돌할 수 있는 실제 write, SendOrder, Kiwoom, GUI 연결은 자동 연결로 확정하지 않는다.
- commit message만으로 구현 세부 정책을 확정하지 않는다.

검토 필요:

- 실제 구현 파일의 세부 계약은 GitHub 최신 코드 기준으로 별도 재검토가 필요하다.
- 전체 unittest discovery 결과는 이 Canonical 병합 작업에서 새로 확정하지 않는다.
- runtime, rules.json, order queue runtime 파일, real Kiwoom/SendOrder 연결부 보호 상태는 별도 확인이 필요하다.

29.8.1 Execution Queue Commit Pipeline

Execution Queue Commit Pipeline은 Execution Preview 이후 Queue Commit 가능 여부를 판단하고,
실제 commit 계층으로 넘어가기 전 검증, 승인, dry-run, 실행, 결과 검토를 분리하는 계층이다.

기준 commit:

- `ec0dc74` Add execution queue commit pipeline

주요 파일:

- `execution_approval_gate.py`
- `execution_queue_commit_contract_preview.py`
- `execution_queue_commit_dry_run.py`
- `execution_queue_commit_executor.py`
- `execution_queue_commit_result_review.py`
- `execution_readiness_validator.py`
- `rule_apply_preview_execution_order_adapter.py`
- `rule_apply_preview_execution_preview_controller.py`

테스트 파일:

- `tests/test_execution_approval_gate.py`
- `tests/test_execution_pipeline_preview_only_e2e_contract.py`
- `tests/test_execution_queue_commit_contract_preview.py`
- `tests/test_execution_queue_commit_dry_run.py`
- `tests/test_execution_queue_commit_executor.py`
- `tests/test_execution_queue_commit_result_review.py`
- `tests/test_execution_readiness_validator.py`
- `tests/test_rule_apply_preview_execution_order_adapter.py`
- `tests/test_rule_apply_preview_execution_order_adapter_e2e_contract.py`
- `tests/test_rule_apply_preview_execution_preview_bridge_contract.py`
- `tests/test_rule_apply_preview_execution_preview_controller.py`

정책:

- Queue Commit은 Preview 결과만으로 바로 수행하지 않는다.
- Queue Commit 진입 전 Approval Gate와 Readiness Validator를 통과해야 한다.
- `execution_readiness_validator.py`는 READY/BLOCKED/INVALID 판정 계층으로 기록한다.
- Dry-run은 실제 queue write 이전의 검토 계층이다.
- Queue Commit 실제 수행은 별도 executor 계층으로 분리한다.
- Result Review는 Commit 이후 검토 계층이다.

검토 필요:

- Execution Readiness Validator와 Queue Commit Executor 사이의 최종 입력/출력 계약은 실제 코드 기준으로 재검토한다.
- Queue Commit이 어떤 runtime 또는 queue 파일을 쓰는지는 보호 파일 기준으로 별도 확인한다.

29.8.2 Canonical SendOrder Path

Canonical SendOrder Path는 Queue Commit 이후 SendOrder, Recorder, Chejan, Lifecycle Preview까지 이어지는
명시적 후보 흐름이다. 이 흐름은 자동 연결이 아니라 계층 분리와 검토 경계를 Canonical에 기록하기 위한 기준이다.

상위 흐름:

```text
Execution Queue Commit Pipeline
↓
Canonical SendOrder Pipeline
↓
SendOrder Recorder Pipeline
↓
Chejan Entry Pipeline
↓
Chejan Event Pipeline
↓
Lifecycle Preview Pipeline
```

세부 흐름:

```text
Readiness Validator
↓
Approval Gate
↓
Queue Commit Contract Preview
↓
Queue Commit Dry-run
↓
Queue Commit Executor
↓
Queue Commit Result Review
↓
Execution Order Dispatch Builder
↓
Kiwoom SendOrder Safety Gate
↓
Kiwoom SendOrder Call Preview
↓
Kiwoom SendOrder Executor
↓
Kiwoom SendOrder Executor Result Review
↓
SendOrder Result Recorder
↓
SendOrder Result Recorder Review
↓
Chejan Entry Adapter
↓
Chejan Entry Open Policy
↓
Chejan Raw Event Contract
↓
Chejan Event Classification Preview
↓
Chejan Event Evidence Builder
↓
Chejan Event Evidence Review
↓
Chejan to Lifecycle Transition Preview
↓
Lifecycle Transition Approval Gate
↓
Lifecycle Commit Contract Preview
↓
Lifecycle Commit Dry-run
```

정책:

- SendOrder 호출은 Queue Commit 이후에도 직접 연결하지 않고 별도 계층으로 분리한다.
- SendOrder 호출 전 Dispatch Builder, Safety Gate, Call Preview를 거친다.
- Call Preview는 실제 SendOrder 호출이 아니다.
- Executor는 Canonical SendOrder Path의 명시 계층으로만 취급한다.
- Result Review는 SendOrder 결과 처리와 분리한다.

검토 필요:

- 이 흐름은 commit 파일명과 UPDATE 문서 기준의 Canonical 병합이며, 실제 구현 세부 계약은 각 파일 내용 기준으로 재검토한다.
- 기존 Canonical의 "SendOrder는 KiwoomOrderExecutor만 호출 가능" 정책과 새 `kiwoom_send_order_executor.py` 계층의 명칭/책임 관계를 확인한다.

29.8.3 Canonical SendOrder Pipeline

Canonical SendOrder Pipeline은 order dispatch를 broker/Kiwoom 호출 전 단계로 분리하고,
Safety Gate, Call Preview, Executor, Result Review를 명시하는 실행 경계이다.

기준 commit:

- `1ec3388` Add canonical send order pipeline

주요 파일:

- `broker_dispatch_preview.py`
- `execution_order_dispatch_builder.py`
- `kiwoom_send_order_adapter_contract.py`
- `kiwoom_send_order_call_preview.py`
- `kiwoom_send_order_executor.py`
- `kiwoom_send_order_executor_result_review.py`
- `kiwoom_send_order_safety_gate.py`

테스트 파일:

- `tests/test_broker_dispatch_preview.py`
- `tests/test_canonical_sendorder_path_e2e_contract.py`
- `tests/test_execution_order_dispatch_builder.py`
- `tests/test_execution_pipeline_e2e_contract_audit.py`
- `tests/test_kiwoom_send_order_adapter_contract.py`
- `tests/test_kiwoom_send_order_call_preview.py`
- `tests/test_kiwoom_send_order_executor.py`
- `tests/test_kiwoom_send_order_executor_result_review.py`
- `tests/test_kiwoom_send_order_safety_gate.py`

정책:

- Broker Dispatch Preview는 실제 broker/Kiwoom 호출 전 preview 계층이다.
- SendOrder 호출 계약은 `kiwoom_send_order_adapter_contract.py`를 기준으로 별도 검증 대상이 된다.
- SendOrder 호출 전 Safety Gate를 통과해야 한다.
- Kiwoom 직접 호출은 금지선으로 유지한다.

검토 필요:

- `kiwoom_send_order_executor.py`가 실제 SendOrder 호출을 수행하는 계층인지, 호출 전 preview/contract 계층인지 코드 기준 검토가 필요하다.
- 기존 preview-only controller의 `send_order_called=False` 정책과 실제 executor 계층의 연결 시점은 분리해서 판단한다.

29.8.4 SendOrder Recorder

SendOrder Recorder는 SendOrder 결과를 lifecycle 전환으로 직접 넘기지 않고,
계약 기반 기록, 기록 검토, Chejan Entry Adapter 변환으로 분리하는 계층이다.

기준 commit:

- `0abde3a` Add send order recorder and chejan entry bridge

주요 파일:

- `send_order_record_review_to_chejan_entry_adapter.py`
- `send_order_result_recorder_contract.py`
- `send_order_result_recorder_review.py`
- `send_order_result_recorder_v1.py`

테스트 파일:

- `tests/test_send_order_record_review_to_chejan_entry_adapter.py`
- `tests/test_send_order_result_recorder_contract.py`
- `tests/test_send_order_result_recorder_review.py`
- `tests/test_send_order_result_recorder_v1.py`

정책:

- SendOrder 결과 기록은 직접 lifecycle 전환으로 이어지지 않는다.
- Recorder 본체, Recorder Contract, Recorder Review를 분리한다.
- 기록 결과는 Review를 거친 뒤 Chejan Entry Bridge로 전달한다.
- Chejan Entry로 넘기는 데이터는 adapter를 통해 명시 변환한다.

검토 필요:

- SendOrder Recorder Review와 Chejan Entry Adapter 간 데이터 계약은 실제 코드 기준으로 재검토한다.
- recorder가 쓰는 저장 대상과 runtime write 여부는 보호 파일 기준으로 별도 확인한다.

29.8.5 Chejan Entry Pipeline

Chejan Entry Pipeline은 SendOrder Recorder Review 이후 Chejan raw event 처리로 진입하기 전,
open policy와 raw event contract를 통해 진입 가능성과 입력 구조를 검증하는 계층이다.

기준 commit:

- `0abde3a` Add send order recorder and chejan entry bridge
- `af75168` Add chejan event pipeline

주요 파일:

- `send_order_record_review_to_chejan_entry_adapter.py`
- `chejan_entry_open_policy.py`
- `chejan_raw_event_contract.py`

테스트 파일:

- `tests/test_send_order_record_review_to_chejan_entry_adapter.py`
- `tests/test_chejan_entry_open_policy.py`
- `tests/test_chejan_raw_event_contract.py`

정책:

- Chejan Entry는 SendOrder 결과에서 자동 연결되는 숨은 호출이 아니다.
- Chejan Entry 진입은 Open Policy와 Contract를 기준으로 한다.
- Raw Event는 분류, 증거, 리뷰 계층으로 넘기기 전 계약 검증 대상이다.
- Chejan은 주문 판단을 하지 않는다는 기존 Canonical 정책을 유지한다.
- Chejan은 새로운 Order를 생성하지 않는다는 기존 Canonical 정책을 유지한다.

검토 필요:

- Chejan Entry Open Policy의 진입 조건과 기존 Chejan/Fill 정책의 충돌 여부를 확인한다.
- Chejan Raw Event Contract의 필수 필드와 Classification Preview 입력 검증 강화 여부를 확인한다.

29.8.6 Chejan Event Pipeline

Chejan Event Pipeline은 raw event contract 이후 classification preview, evidence builder,
evidence review로 이어지는 event 처리 후보 계층이다.

기준 commit:

- `af75168` Add chejan event pipeline

주요 파일:

- `chejan_event_classification_preview.py`
- `chejan_event_evidence_builder.py`
- `chejan_event_evidence_review.py`
- `chejan_raw_event_contract.py`
- `chejan_entry_open_policy.py`

테스트 파일:

- `tests/test_chejan_event_classification_preview.py`
- `tests/test_chejan_event_evidence_builder.py`
- `tests/test_chejan_event_evidence_review.py`
- `tests/test_chejan_raw_event_contract.py`
- `tests/test_chejan_entry_open_policy.py`

정책:

- Chejan event는 자동 runtime write로 이어지지 않는다.
- Classification Preview는 event 의미를 분류하지만 실제 runtime 반영을 수행하지 않는 계층이다.
- Evidence Builder는 event 처리 근거를 구성한다.
- Evidence Review는 event evidence의 적합성을 검토한다.
- Evidence Review를 통과한 결과만 후속 lifecycle 후보가 된다.

검토 필요:

- Chejan Evidence Review 이후 Lifecycle Transition Preview 진입 조건은 실제 코드 기준으로 재검토한다.
- Chejan event 처리 결과가 어떤 lifecycle 후보로 변환되는지는 별도 계약 확인이 필요하다.

29.8.7 Lifecycle Transition Preview

Lifecycle Transition Preview는 Chejan Review 이후 lifecycle 전환을 자동 commit하지 않고,
preview, approval, contract preview, dry-run으로 나누어 검토하는 계층이다.

기준 commit:

- `01c93fc` Add lifecycle preview pipeline and architecture audit

주요 파일:

- `chejan_to_lifecycle_transition_preview.py`
- `lifecycle_commit_contract_preview.py`
- `lifecycle_commit_dry_run.py`
- `lifecycle_transition_approval_gate.py`

감사/검토 문서:

- `CANONICAL_SENDORDER_PATH_2026-07-07.txt`
- `EXECUTION_PIPELINE_CONCEPT_AUDIT_2026-07-07.txt`
- `EXECUTION_QUEUE_COMMIT_SAFETY_BOUNDARY_REVIEW_2026-07-07.txt`
- `EXECUTION_SENDORDER_CHEJAN_LIFECYCLE_STRUCTURAL_AUDIT_2026-07-07.txt`
- `POST_SEND_ORDER_BOUNDARY_AUDIT_2026-07-07.txt`
- `SEND_ORDER_EXECUTOR_SAFETY_BOUNDARY_REVIEW_2026-07-07.txt`

테스트 파일:

- `tests/test_chejan_to_lifecycle_transition_preview.py`
- `tests/test_lifecycle_commit_contract_preview.py`
- `tests/test_lifecycle_commit_dry_run.py`
- `tests/test_lifecycle_transition_approval_gate.py`

정책:

- Lifecycle Commit은 Chejan event 처리 직후 자동 수행되지 않는다.
- Lifecycle 전환은 Chejan evidence만으로 자동 commit되지 않는다.
- Approval Gate와 Contract Preview를 통과해야 한다.
- Dry-run은 lifecycle commit 이전 검토 계층이다.
- SendOrder 성공만으로 Position을 변경하지 않는 기존 Canonical 정책을 유지한다.
- SendOrder 성공만으로 청산 완료로 보지 않는 기존 Canonical 정책을 유지한다.

검토 필요:

- Lifecycle Commit Dry-run 이후 실제 commit 계층 필요 여부는 별도 판단한다.
- 구조 감사 문서의 결론과 실제 구현 파일의 책임 경계가 일치하는지 확인한다.

29.8.8 AI Development Tools / Local Analyzer 운영 도구

AI Development Tools / Local Analyzer 운영 도구는 실행 pipeline 자체가 아니라
프로젝트 분석, 구현 요청, 영향 분석, 호출 흐름 분석을 보조하는 개발/운영 도구 계층이다.

기준 commit:

- `197e4de` Add AI development tools

주요 파일:

- `.ai/ANALYST.md`
- `.ai/IMPLEMENTER.md`
- `.ai/MASTER_SPEC_RULE.md`
- `.ai/NON_NEGOTIABLE_RULES.md`
- `.ai/PROJECT_STRUCTURE.md`
- `.ai/REVIEWER.md`
- `.ai/SYSTEM.md`
- `.ai/PROMPTS/bug_analysis.md`
- `.ai/PROMPTS/call_flow.md`
- `.ai/PROMPTS/dependency.md`
- `.ai/PROMPTS/impact_analysis.md`
- `.ai/PROMPTS/implementation_request.md`
- `AI_ANALYZE.bat`
- `tools/ai_analyzer/README.md`
- `tools/ai_analyzer/ai_analyze.py`
- `tools/ai_analyzer/prompts/call_flow.md`
- `tools/ai_analyzer/prompts/dependency.md`
- `tools/ai_analyzer/prompts/impact_analysis.md`
- `tools/ai_analyzer/prompts/system_readonly.md`

정책:

- AI Development Tools는 구현 pipeline 자체가 아니라 개발/분석 보조 도구이다.
- `.ai` 디렉터리는 역할별 AI 운영 지침을 담는 구조로 기록한다.
- `tools/ai_analyzer`는 read-only 분석 보조 도구 성격으로 기록한다.
- 기능 구현 계층과 운영/도구 계층은 분리해서 기록한다.

검토 필요:

- AI Development Tools의 read-only 보장 여부는 실제 도구 동작 기준으로 확인한다.
- Local Analyzer가 runtime, rules.json, queue 파일을 쓰지 않는지 별도 검증한다.

29.8.9 Test Coverage / Verification Status

UPDATE 기준 테스트 추가 현황:

- Execution Queue Commit Pipeline 관련 테스트 추가
- Canonical SendOrder Pipeline 관련 테스트 추가
- SendOrder Recorder Pipeline 관련 테스트 추가
- Chejan Entry/Event Pipeline 관련 테스트 추가
- Lifecycle Preview Pipeline 관련 테스트 추가

검토 필요:

- 이번 Canonical 병합 작업에서는 `kiwoom_auto` 로컬 프로젝트를 열지 않았고 Python 테스트를 실행하지 않았다.
- 전체 unittest 통과 개수는 이 섹션에서 새로 확정하지 않는다.
- GitHub 기준 최신 코드의 전체 unittest discovery 결과를 별도 확보해야 한다.
- Queue Commit, Canonical SendOrder, SendOrder Recorder, Chejan, Lifecycle Preview 관련 테스트 결과를 별도 확인해야 한다.

29.8.10 Maintained Safety Boundaries

이번 병합에서 유지하는 금지선:

- Preview 단계에서 runtime write 금지
- Preview 단계에서 queue write 금지
- Queue Commit은 명시 계층에서만 수행
- SendOrder 직접 호출 금지
- Kiwoom 직접 호출 금지
- Chejan 자동 연결 금지
- Lifecycle 자동 commit 금지
- GUI 자동 연결 금지
- rules.json 임의 수정 금지
- runtime 파일 임의 수정 금지
- MASTER_SPEC 직접 덮어쓰기 금지
- 기존 Canonical 수정 금지

docs 작업 보호 기록:

- `docs` 프로젝트에서만 문서 생성
- `kiwoom_auto` 로컬 프로젝트 미오픈
- Python 코드 미수정
- runtime 미수정
- rules.json 미수정
- order_queue 미수정
- Reference 미수정
- CHANGELOG 미생성
- Git commit 미수행
- Git push 미수행

중복 병합 처리:

- 29.7의 preview-only controller 정책은 기존 내용으로 유지한다.
- 29.8은 29.7 이후의 실행 후보 계층을 추가하되, 29.7의 Queue Commit, SendOrder, Kiwoom, GUI, runtime write 금지 상태를 자동 해제하지 않는다.
- SendOrder, Chejan, Lifecycle 관련 기존 정책은 삭제하지 않고 신규 계층별 검토 사항으로 연결했다.
- UPDATE의 후보 표현은 Canonical 반영 문맥으로 정리했으며, 확정 근거가 부족한 항목은 `검토 필요`로 분리했다.

Original Body Marker: END

---

Reference Navigation

- Previous PART: PART07_EXECUTION_CONTROLLER.md
- Next PART: PART09_APPENDIX.md
- INDEX: 00_REFERENCE_INDEX.md
- Original Canonical: ../CURRENT/MASTER_SPEC_CANONICAL_2026-07-08_EXECUTION_SENDORDER_CHEJAN_LIFECYCLE_PIPELINE.txt
