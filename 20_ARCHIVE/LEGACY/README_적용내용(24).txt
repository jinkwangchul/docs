# 루틴 지정 시 구형 루틴폴더 종목폴더 재생성 방지 패치

적용 파일:
- gui_routine_assign_window.py

문제:
- 루틴 지정 시 `ensure_stock_runtime_files(selected_routine_dir, code, name)` 호출 때문에
  `_MACD매매루틴/105560_KB금융` 같은 구형 종목폴더가 다시 생성됨.

수정:
- `ensure_stock_runtime_files` import/호출 제거
- 루틴 지정 후 필요한 runtime 파일 준비는 중앙 `stocks/종목폴더` 기준으로 수행
- `stock_repository.repository().ensure_stock_folder(code, name, routine=...)` 사용

기대 결과:
- 루틴 지정 후 `_MACD매매루틴/종목폴더`가 다시 생성되지 않아야 함.
- 중앙 `stocks/` 내부 config/state/orders만 사용됨.

확인:
1. 파일 교체
2. `_MACD매매루틴` 내부에 남은 종목폴더를 archive 이동 또는 삭제
3. 프로그램 실행
4. 미등록 종목 1개를 MACD매매루틴에 지정
5. `_MACD매매루틴` 폴더 안에 새 종목폴더가 생기지 않는지 확인
6. `stocks/해당종목/config.json`의 routine 값이 갱신됐는지 확인
