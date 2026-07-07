# gui_stock_register_window.py 중앙 stocks 정리 패치

적용 파일:
- gui_stock_register_window.py

수정 내용:
1. 파일 상단에 남아 있던 잘못된 `BASE_STOCK_PATH = PROJECT_ROOT / "중앙 종목관리"` 상수를 제거했습니다.
2. 선택 종목 삭제는 중앙 stocks/종목폴더 기준으로 처리합니다.
3. 삭제 대상은 완전 삭제하지 않고 `archived_stocks/`로 이동합니다.
4. 삭제 전 루틴 연결 필드는 비웁니다.
5. 처리불가 종목은 기존처럼 리포트에 남깁니다.
6. 창 제목/문구는 중앙 종목관리 기준을 유지합니다.

확인:
1. 파일 교체
2. python gui_main.py 실행
3. 종목등록설정창 열기
4. 안전한 미등록 종목 1개를 선택해 삭제 테스트
5. 목록에서 사라지고 archived_stocks/ 아래로 이동되는지 확인
