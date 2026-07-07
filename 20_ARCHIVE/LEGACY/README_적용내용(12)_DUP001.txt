# gui_stock_data.py NameError 보정 패치

적용 파일:
- gui_stock_data.py
- stock_repository.py

수정 내용:
- gui_stock_data.py에서 호출하던 `_central_repository_if_available()` 함수 정의 누락을 보정했습니다.
- `_base_stock_routines_from_central_repository_if_available()` 함수도 함께 보정했습니다.
- 기존 의도대로 `stocks/`가 있으면 중앙 종목폴더 기준, 없으면 기존 fallback 기준으로 동작합니다.
- 이번 수정은 NameError 해결 및 중앙 조회 helper 보정 범위입니다.

확인:
1. 두 파일 교체
2. `python gui_main.py` 실행
3. 메인창 정상 실행 확인
4. 종목등록설정/매매루틴지정/자동매매설정창 확인
