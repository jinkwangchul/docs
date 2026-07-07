# 등록해제 중앙 종목관리 연결 수정

적용 파일:
- gui_auto_trade_unregister.py

수정 내용:
1. 이 파일 내부의 구버전 update_base_stock_routines()가 더 이상 기초종목.txt를 직접 수정하지 않습니다.
2. gui_base_stock_service.update_base_stock_routines()로 위임합니다.
3. 따라서 stocks/ 중앙 종목폴더가 있으면 stocks/종목/config.json의 루틴 연결을 갱신합니다.
4. stocks/가 없는 경우에는 기존 기초종목.txt fallback 흐름을 유지합니다.
5. state.json/orders.json 초기화 실패 경고의 self 참조 오류 가능성도 window로 수정했습니다.

확인 방법:
1. 파일 교체
2. gui_main.py 실행
3. 자동매매설정창에서 MACD 루틴 종목 등록해제
4. 창을 닫았다 다시 열었을 때 MACD 종목수/하단 목록이 줄어드는지 확인
5. 종목등록설정창의 등록 루틴도 같이 갱신되는지 확인
