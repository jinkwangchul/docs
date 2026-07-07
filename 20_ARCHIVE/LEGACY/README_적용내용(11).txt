# 중앙 stocks 기준 조회 일원화 패치

적용 파일:
- gui_stock_data.py
- stock_repository.py

핵심 수정:
1. gui_stock_data.base_stock_routines_for_stock()
   - 중앙 stocks/가 있으면 stocks/종목/config.json 기준으로 루틴을 읽습니다.
   - 중앙 구조가 없을 때만 기존 기초종목.txt를 fallback으로 읽습니다.

2. gui_stock_data.active_routine_for_stock()
   - base_stock_routines_for_stock() 기준으로 통일했습니다.

3. gui_stock_data.stock_runtime_dir_for_routine()
   - 중앙 stocks/가 있으면 stocks/종목 폴더를 반환합니다.
   - 요청 루틴명과 config의 현재 루틴명이 다르면 None을 반환합니다.
   - 중앙 구조가 없을 때만 기존 _루틴명/종목폴더를 fallback으로 사용합니다.

4. stock_repository.update_stock_routine()
   - routine, routine_name, assigned_routine, active_routine, routines를 모두 갱신/정리합니다.
   - 해제 시 모든 루틴 연결 필드가 비워집니다.

기대 효과:
- 루틴 해제 가능/불가 판정이 더 이상 기초종목.txt/기존 루틴폴더를 섞어 보지 않습니다.
- 종목등록설정창, 매매루틴지정창, 자동매매설정창의 루틴 기준이 중앙 stocks/ 기준으로 맞춰집니다.

확인:
1. 두 파일 교체
2. gui_main.py 실행
3. 종목등록설정창에서 등록 루틴 표시 확인
4. 매매루틴지정창에서 루틴 해제 재확인
5. 자동매매설정창에서 상단 종목수와 하단 목록 일치 확인
