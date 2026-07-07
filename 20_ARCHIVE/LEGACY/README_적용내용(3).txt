메인 주문판정 연결 훅 적용 내용

대상 파일:
- order_manager.py

추가 내용:
- handle_routine_signal_for_stock_dir()

역할:
- 루틴이 만든 BUY/SELL 신호를 메인 주문판정 계층에서 받는 연결 지점.
- 실제 키움 주문 실행은 하지 않음.
- 주문 실행기는 order_executor 콜백으로 나중에 연결.
- 조기/자동마감 루틴 방식에서 첫 SELL 신호가 실제 주문 접수된 경우에만 close_routine_final_sell_ordered 메타 저장.
- 주문 미접수/실패 시에는 마지막 매도 메타를 저장하지 않음.

건드리지 않은 것:
- 조기/자동마감 옵션
- 청산 정책
- 이월 정책
- 검토관리 정책
- 실제 키움 주문 전송

확인:
- python 문법검사 통과.
