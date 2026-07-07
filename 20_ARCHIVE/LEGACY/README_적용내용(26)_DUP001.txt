# 매매루틴지정창 하단 정보 중앙 stocks 기준 표시 패치

적용 파일:
- gui_routine_assign_window.py

문제:
- 루틴 지정 후 구형 루틴폴더 종목폴더 재생성은 해결됐지만,
  매매루틴지정창 하단 '선택 루틴 연결 종목' 정보가 '-'로 표시됨.
- 원인: 하단 정보 조회가 아직 routine_dir/종목폴더 기준을 사용함.

수정:
1. runtime_assigned_stock_summary()
   - `_MACD매매루틴/종목폴더`를 보지 않음
   - 중앙 `stocks/종목폴더/state.json`, `config.json`, `orders.json` 기준으로 표시

2. active_stock_register_status_display()
   - 좌측 운영상태도 중앙 `stocks/종목폴더/state.json` 기준으로 표시

3. 이전 패치 유지
   - 루틴 지정 시 구형 루틴폴더 내부 종목폴더를 생성하지 않음

확인:
1. 파일 교체
2. 프로그램 실행
3. 매매루틴지정창에서 MACD 선택
4. 하단 연결 종목의 운영/상태/보유/평단 등이 '-'가 아니라 중앙 stocks 기준으로 표시되는지 확인
5. `_MACD매매루틴` 폴더에 새 종목폴더가 생성되지 않는지 확인
