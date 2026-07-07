# 루틴폴더 내부 과거 종목폴더 archive 도구

파일:
- archive_legacy_routine_stock_dirs.py

목적:
- 중앙 stocks/ 구조 전환 후 남은 `_MACD매매루틴/005930_삼성전자` 같은 과거 종목폴더를 archive로 이동합니다.
- `_MACD매매루틴`, `_등록확인폴더` 루틴폴더 자체는 유지합니다.
- `budget.json`도 유지합니다.

사용:
1. 프로젝트 루트 `kiwoom_auto/`에 저장
2. 먼저 dry-run 실행

python archive_legacy_routine_stock_dirs.py

3. 보고서 확인
4. 이상 없으면 실제 적용

python archive_legacy_routine_stock_dirs.py --apply

적용 후 확인:
- `_MACD매매루틴/` 안에는 budget.json 등 루틴 파일만 남는지
- `_등록확인폴더/` 안에도 종목폴더가 사라졌는지
- `archive_candidate/legacy_routine_stock_dirs/` 아래로 이동됐는지
- 프로그램 실행/메인창/자동매매설정창 정상 여부
