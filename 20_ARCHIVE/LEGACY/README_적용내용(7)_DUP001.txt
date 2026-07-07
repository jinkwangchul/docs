# 종목구조 개편 2차 적용 파일

적용 파일:
- stock_repository.py
- gui_base_stock_service.py

변경 내용:
1. gui_base_stock_service.read_base_stocks()
   - 중앙 stocks/ 폴더가 있으면 stock_repository 기준으로 종목 목록을 읽습니다.
   - 아직 stocks/가 없으면 기존 기초종목.txt를 그대로 사용합니다.

2. gui_base_stock_service.update_base_stock_routines()
   - 중앙 stocks/ 폴더가 있으면 종목 config.json의 routine 값을 갱신합니다.
   - 아직 stocks/가 없으면 기존 기초종목.txt를 그대로 갱신합니다.

3. stock_repository.py
   - update_stock_routine() 추가.
   - state.json은 건드리지 않고 config.json의 routine 관련 필드만 갱신합니다.

주의:
- 기존 기초종목.txt 삭제 없음.
- 기존 루틴폴더 이동 없음.
- 기존 종목폴더 이동 없음.
- 중앙 stocks/가 없으면 기존 동작과 거의 동일해야 합니다.

확인:
1. 두 파일을 프로젝트 루트에 교체/추가.
2. gui_main.py 실행.
3. 종목등록설정/매매루틴지정/자동매매설정창 정상 확인.
4. 루틴지정/해제 1건 테스트.
