# 전체 종목 상태 리셋 도구

파일:
- reset_all_stock_state.py

목적:
- 종목 통합 과정에서 꼬인 루틴 연결/검토관리/평단/수량/주문 상태를 전체 초기화합니다.
- stocks/ 종목폴더 자체는 삭제하지 않습니다.

초기화 범위:
- config.json: routine/routine_name/assigned_routine/active_routine/routines 초기화
- state.json: 보유수량, 평단, 매매상태, 검토상태, 주문 관련 상태 초기화
- orders.json: orders 빈 목록으로 초기화
- review_required 계열 폴더: archive_candidate로 이동

사용:
1. 프로젝트 루트에 저장
2. 먼저 dry-run

python reset_all_stock_state.py

3. 보고서 확인
4. 실제 적용

python reset_all_stock_state.py --apply

주의:
- 적용 시 backup_before_full_stock_reset/ 아래에 기존 config/state/orders 백업을 남깁니다.
- 종목 자체는 유지됩니다.
- 적용 후 모든 종목은 루틴 미연결/보유 0/평단 0/검토 아님 상태가 됩니다.
