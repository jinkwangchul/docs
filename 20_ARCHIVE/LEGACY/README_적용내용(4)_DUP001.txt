main_order_executor_dryrun_patch 적용 내용

1. order_executor.py 신규 생성
- 실제 키움 주문 실행은 하지 않음.
- DryRunOrderExecutor 제공.
- dry_run_order_executor 함수 제공.
- KiwoomOrderExecutor 자리는 만들었지만 실제 주문은 NotImplementedError로 막아둠.

2. order_manager.py 보강
- handle_routine_signal_dry_run_for_stock_dir() 추가.
- 루틴 신호 BUY/SELL을 dry-run 주문 실행기까지 연결해 볼 수 있음.
- 실제 주문은 보내지 않음.
- dry-run 접수 성공으로 볼 경우 첫 SELL 이후 close_routine_final_sell_ordered 메타 저장 테스트 가능.

3. 건드리지 않은 것
- 조기/자동마감 옵션
- 청산 정책
- 이월 정책
- 검토관리 정책
- 키움 SendOrder 실제 호출

4. 사용 목적
- 루틴 구현 전, 메인프로그램 주문판정 계층과 주문 실행기 자리의 연결 구조를 확인하기 위한 골격.
