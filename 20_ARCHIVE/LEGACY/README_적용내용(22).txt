# 용어 정리 1차 패치

적용 파일:
- gui_stock_register_window.py
- gui_force_unregister_dialog.py
- gui_search_stock_register_dialog.py

수정 원칙:
- 종목관리 영역: 등록/삭제
- 루틴관리 영역: 지정/해제
- 검토관리 영역: 이동/복귀

수정 내용:
1. 종목관리 창에서 `등록해제` 표현을 `종목 삭제/삭제` 표현으로 변경
2. 확인창 문구:
   - 즉시 등록해제 가능 → 즉시 삭제 가능
   - 등록해제 불가 → 삭제 불가
   - 등록해제 실행 → 삭제 실행
   - 등록해제 완료 → 삭제 완료
3. 컬럼명:
   - 등록 루틴 → 연결 루틴
4. 수동등록창 changelog 문구 일부 정리

주의:
- gui_routine_assign_window.py의 `루틴 해제`는 의미가 정확하므로 수정하지 않았습니다.
- gui_auto_trade_unregister.py의 `자동매매 등록해제`는 별도 의미일 수 있어 이번 패치에서 보류했습니다.
- 검토관리 계열 용어는 다음 단계에서 별도 정리합니다.

문법검사 통과:
gui_stock_register_window.py, gui_force_unregister_dialog.py, gui_search_stock_register_dialog.py
