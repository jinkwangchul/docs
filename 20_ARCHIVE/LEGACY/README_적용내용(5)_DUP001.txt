# stock_repository.py 1차 초안

목적:
- 기초종목.txt 제거와 stocks/ 중앙 종목폴더 일원화를 위한 중간 계층입니다.
- 아직 기존 GUI 코드에 연결하지 않습니다.
- 기존 파일 이동/삭제도 하지 않습니다.

현재 역할:
1. 중앙 stocks/ 폴더가 있으면 그 기준으로 종목 목록을 읽습니다.
2. 아직 stocks/가 없으면 기존 기초종목.txt를 fallback으로 읽습니다.
3. 기존 read_base_stocks()와 비슷한 형태로 반환하는 호환 함수가 있습니다.
4. 향후 stock_runtime_dir_for_routine()를 대체할 중앙 stocks/ 경로 함수가 있습니다.

다음 단계:
- 이 파일을 프로젝트 루트에 넣은 뒤 import 오류 없이 로딩되는지 확인.
- 이후 read_base_stocks() 일부 호출부를 repository 호환 함수로 1개씩 바꿔 테스트.
