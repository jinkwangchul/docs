# 종목구조 개편 3차: 중앙 stocks/ 마이그레이션 도구

파일:
- stock_migration_to_central_stocks.py

저장 위치:
- 프로젝트 루트 `kiwoom_auto/` 안에 넣습니다.

기본 실행:
python stock_migration_to_central_stocks.py

기본은 dry-run입니다.
- 파일 복사 없음
- stocks/ 생성 없음
- stock_migration_apply_report.txt 생성
- stock_migration_manifest.json 생성

실제 적용:
python stock_migration_to_central_stocks.py --apply

적용 시:
- stocks/종목코드_종목명/ 생성
- primary 폴더의 state/config/orders 복사
- 모든 source logs를 루틴명_기존파일명 형태로 병합
- 기존 루틴폴더 삭제 안 함
- 기초종목.txt 삭제 안 함

다음 확인:
1. 먼저 dry-run 실행.
2. report에서 primary가 이상한 종목 확인.
3. 이상 없으면 --apply 실행.
