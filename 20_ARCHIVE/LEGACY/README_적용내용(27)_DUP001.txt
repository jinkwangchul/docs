# 검토관리창 중앙 stocks 기준 조회 패치

적용 파일:
- gui_review_required_window.py
- gui_global_review_required_window.py

문제:
- 프로그램 시작 검사에서 state.json은 REVIEW_REQUIRED로 바뀌지만 검토관리창에는 0건으로 표시됨.
- 원인: 검토관리창 수집 로직이 구형 루틴폴더 내부 종목폴더를 조회함.
- 종목폴더 통합 후 구형 루틴폴더 종목폴더가 제거되어 검토관리창이 대상을 찾지 못함.

수정:
- collect_global_review_required_rows()를 중앙 stocks/ 기준으로 변경
- stocks/전체 종목의 state.json에서 REVIEW_REQUIRED 또는 review_required=True인 종목을 수집
- 구형 루틴폴더 내부 종목폴더는 더 이상 조회하지 않음

확인:
1. 파일 교체
2. SK하이닉스 등 임의 종목 state.json에 보유/평단 또는 review_required 상태 생성
3. 프로그램 실행
4. 검토관리 버튼 클릭
5. 검토종목이 0건이 아니라 표시되는지 확인
