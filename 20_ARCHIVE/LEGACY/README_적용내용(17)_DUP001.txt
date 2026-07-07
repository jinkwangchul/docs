# 기초종목.txt fallback 제거 1차 패치 v2

적용 파일:
- gui_stock_data.py
- gui_base_stock_service.py
- gui_stock_register_window.py

v2 수정:
- gui_search_stock_register_dialog.py가 import하는 `append_base_stock()` 누락을 복구했습니다.
- `append_base_stock()`는 더 이상 기초종목.txt를 쓰지 않고 중앙 stocks/종목폴더를 생성합니다.
- `remove_base_stock()`도 호환용으로 추가했지만 종목 폴더 삭제는 하지 않고 루틴 연결만 비우는 안전 동작입니다.

확인:
1. 세 파일 교체
2. python gui_main.py 실행
3. 수동등록창 열기 확인
4. 종목등록설정창 확인
