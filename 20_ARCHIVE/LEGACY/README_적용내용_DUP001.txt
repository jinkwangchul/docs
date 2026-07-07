조기/자동마감 루틴 1세트 마무리 정책 훅 패치

적용 파일:
- gui_auto_trade_policy.py

반영 범위:
- 조기/자동마감 옵션 및 청산 연동 기능은 수정하지 않음.
- 지정가/시장가/현재가/익절/손절/이월 정책은 수정하지 않음.
- 실제 키움 주문 실행 로직은 아직 없으므로 연결하지 않음.
- 향후 루틴/주문 엔진이 붙을 때 호출할 정책 훅만 추가.

추가된 내부 정책 훅:
1. auto_trade_setting_close_routine_active()
   - 조기/자동마감이 루틴 옵션으로 진행 중인지 판정.

2. auto_trade_setting_close_routine_signal_allowed()
   - 마지막 매도신호 처리 전까지 매수/매도 신호 허용.
   - 마지막 매도신호 처리 후에는 매수/매도 주문 차단 판정.

3. auto_trade_setting_mark_close_routine_final_sell_triggered()
   - 향후 주문 엔진이 루틴 매도주문을 낸 직후 호출할 함수.
   - close_routine_final_sell_triggered=True 기록.
   - buy_enabled=False, sell_enabled=False 고정.

4. clear_close_routine_final_sell_metadata()
   - 조기/자동마감 메타 정리 시 마지막 매도신호 메타도 함께 제거.

현재 한계:
- 실제 루틴 매수/매도 신호 엔진이 아직 구현되어 있지 않아 자동 호출되지는 않음.
- 키움 실연동 전에는 실제 주문 차단/허용 최종 검증 불가.
