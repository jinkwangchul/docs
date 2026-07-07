# 기초종목.txt fallback 제거 1차 패치

적용 파일:
- gui_base_stock_service.py
- gui_stock_data.py
- gui_stock_register_window.py

수정 목적:
- 운영 기준에서 기초종목.txt fallback을 제거합니다.
- 종목 목록/루틴 연결/runtime 경로는 중앙 stocks/ 구조만 사용합니다.
- stock_library.json은 검색/수동등록용 라이브러리이므로 유지합니다.

핵심 변경:
1. gui_base_stock_service.read_base_stocks()
   - 중앙 stocks/ 기준만 사용
   - 중앙 구조가 없으면 빈 목록 반환

2. gui_base_stock_service.update_base_stock_routines()
   - 중앙 stocks/config.json만 갱신
   - 중앙 구조가 없으면 False 반환

3. gui_stock_data.read_base_stocks()
   - 중앙 stocks/ 기준만 사용
   - 기초종목.txt fallback 제거

4. gui_stock_data.base_stock_routines_for_stock()
   - 중앙 stocks/config.json 기준만 사용

5. gui_stock_data.stock_runtime_dir_for_routine()
   - 중앙 stocks/종목폴더만 반환
   - 기존 _루틴명/종목폴더 fallback 제거

주의:
- 기초종목.txt 파일 자체는 아직 삭제하지 마세요.
- 먼저 실행 확인 후, 참조 잔여를 다시 스캔한 뒤 최종 삭제 여부를 결정합니다.

확인:
1. 세 파일 교체
2. python gui_main.py 실행
3. 메인창 루틴 수/우측 목록 확인
4. 종목등록설정창 확인
5. 매매루틴지정창에서 루틴 지정/해제 1회 확인
6. 자동매매설정창 확인
