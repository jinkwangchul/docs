# PART02 02 RUNTIME

Reference Edition Subpart

Original Canonical: MASTER_SPEC_CANONICAL_2026-07-08_EXECUTION_SENDORDER_CHEJAN_LIFECYCLE_PIPELINE.txt

Source Full Part: PART02_RUNTIME.md

생성일: 2026-07-08

주의: 본 문서는 AI 참조용 하위 분할본이며 공식 원본은 CURRENT의 Canonical이다.

Original Body Marker: START
 "text": "OUT_DIR.mkdir(exist_ok=True)"
 },
 {
 "file": "registry_migratio/stock_registry_step1_analyzer.py",
 "line": 282,
 "text": "output_dir.mkdir(parents=True, exist_ok=True)"
 },
 {
 "file": "registry_migratio/stock_repository.py",
 "line": 91,
 "text": "path.parent.mkdir(parents=True, exist_ok=True)"
 },
 {
 "file": "registry_migratio/stock_repository.py",
 "line": 286,
 "text": "path.mkdir(parents=True, exist_ok=True)"
 },
 {
 "file": "registry_migratio/stock_repository.py",
 "line": 287,
 "text": "(path / \"logs\").mkdir(exist_ok=True)"
 },
 {
 "file": "registry_migratio/stock_repository.py",
 "line": 342,
 "text": "기존 stock_runtime_dir_for_routine() 대체 후보 함수."
 },
 {
 "file": "stock_migration_to_central_stocks.py",
 "line": 54,
 "text": "path.parent.mkdir(parents=True, exist_ok=True)"
 },
 {
 "file": "stock_migration_to_central_stocks.py",
 "line": 211,
 "text": "dst.parent.mkdir(parents=True, exist_ok=True)"
 },
 {
 "file": "stock_migration_to_central_stocks.py",
 "line": 229,
 "text": "target_file.parent.mkdir(parents=True, exist_ok=True)"
 },
 {
 "file": "stock_migration_to_central_stocks.py",
 "line": 285,
 "text": "item.target_dir.mkdir(parents=True, exist_ok=True)"
 },
 {
 "file": "stock_migration_to_central_stocks.py",
 "line": 286,
 "text": "(item.target_dir / \"logs\").mkdir(exist_ok=True)"
 },
 {
 "file": "stock_migration_to_central_stocks.py",
 "line": 299,
 "text": "STOCKS_DIR.mkdir(exist_ok=True)"
 },
 {
 "file": "stock_repository.py",
 "line": 74,
 "text": "path.parent.mkdir(parents=True, exist_ok=True)"
 },
 {
 "file": "stock_repository.py",
 "line": 245,
 "text": "path.mkdir(parents=True, exist_ok=True)"
 },
 {
 "file": "stock_repository.py",
 "line": 246,
 "text": "(path / \"logs\").mkdir(exist_ok=True)"
 }
]

[출처: routine_folder_recreation_analysis_report.txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 18:19:20 | 분류: 기타문서/자료]
================================================================================
3. ensure_stock_runtime_files 호출 지점
- docs/gui_windows(160).py:L116 ensure_stock_runtime_files,
- docs/gui_windows(160).py:L3400 stock_dir = ensure_stock_runtime_files(selected_routine_dir, code, name)
- gui_auto_trade_setting_window.py:L102 ensure_stock_runtime_files,
- gui_config_utils.py:L87 def ensure_stock_runtime_files(routine_dir: Path, code: str, name: str) -> Path:
- gui_routine_assign_window.py:L43 from gui_config_utils import default_config, ensure_stock_runtime_files
- gui_routine_assign_window.py:L1226 stock_dir = ensure_stock_runtime_files(selected_routine_dir, code, name)
- gui_schedule_window.py:L110 ensure_stock_runtime_files,
- gui_schedule_window.py:L2308 stock_dir = ensure_stock_runtime_files(selected_routine_dir, code, name)
- gui_stock_register_window.py:L118 ensure_stock_runtime_files,
- gui_windows_149_manual_ats_status_policy_fix.py:L116 ensure_stock_runtime_files,
- gui_windows_149_manual_ats_status_policy_fix.py:L3217 stock_dir = ensure_stock_runtime_files(selected_routine_dir, code, name)

[출처: kiwoom32_cleanup_analysis_report.txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 16:32:54 | 분류: 기타문서/자료]
## gui_windows.py
- L71: BASE_STOCK_PATH = PROJECT_ROOT / "기초종목.txt"
- L76: 기초종목.txt 에 종목 1개를 추가한다.
- L78: existing_text = BASE_STOCK_PATH.read_text(encoding="utf-8") if BASE_STOCK_PATH.exists() else ""
- L81: with BASE_STOCK_PATH.open("a", encoding="utf-8") as file:

[출처: terminology_scan_report.txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 15:56:08 | 분류: 기타문서/자료]
## gui_main_table_loader.py (12건)
- L8: - 좌측 루틴표 정렬/로딩
- L12: - MainWindow UI 생성/버튼 연결/긴급정지/검토관리 로직은 포함하지 않는다.
- L49: """메인 관제창 좌측 루틴표 헤더 정렬."""
- L97: read_base_stocks() 표준 반환값에서 종목의 루틴명 목록을 추출한다.
- L99: 중앙 stocks/ 구조에서는 일반적으로 1종목 1루틴이지만,
- L112: 메인 좌측 루틴표의 종목수를 중앙 종목관리 기준으로 계산한다.
- L115: - 루틴 미지정 종목 제외
- L116: - 검토관리/검토종목 상태 제외
- L144: """budget.json이 있는 루틴 폴더를 메인 좌측 루틴표에 표시한다.
- L146: 종목수는 더 이상 루틴폴더 안의 물리 종목폴더 개수로 계산하지 않는다.
- L214: # 루틴 미지정 종목은 표시하지 않는다.
- L246: "routine": routine_name or "미지정",

[출처: kiwoom29_dependency_analysis_report.txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 14:58:42 | 분류: 기타문서/자료]
### gui_windows.py
발견: 기초종목.txt:2, BASE_STOCK_PATH:4, append_base_stock:1, get_routine_dirs:3
L61: get_routine_dirs,
L71: BASE_STOCK_PATH = PROJECT_ROOT / "기초종목.txt"
L74: def append_base_stock(code: str, name: str) -> None:
L76: 기초종목.txt 에 종목 1개를 추가한다.
L78: existing_text = BASE_STOCK_PATH.read_text(encoding="utf-8") if BASE_STOCK_PATH.exists() else ""
L81: with BASE_STOCK_PATH.open("a", encoding="utf-8") as file:
L89: return {routine_display_name(path): path for path in get_routine_dirs()}
L336: for routine_dir in get_routine_dirs():

[출처: README_적용내용(16).txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 13:29:16 | 분류: 기타문서/자료]
확인:
1. 세 파일 교체
2. python gui_main.py 실행
3. 메인창 루틴 수/우측 목록 확인
4. 종목등록설정창 확인
5. 매매루틴지정창에서 루틴 지정/해제 1회 확인
6. 자동매매설정창 확인

[출처: README_적용내용(14).txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 12:22:48 | 분류: 기타문서/자료]
# 메인 관제창 중앙 stocks 기준 표시 패치 v2
적용 파일:
- gui_main_table_loader.py

[출처: README_적용내용(13).txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 11:37:30 | 분류: 기타문서/자료]
# 메인 관제창 중앙 stocks 기준 표시 패치
적용 파일:
- gui_main_table_loader.py

[출처: README_적용내용(13).txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 11:37:30 | 분류: 기타문서/자료]
확인:
1. 파일 교체
2. python gui_main.py 실행
3. 메인 좌측 MACD/등록확인 종목수 확인
4. 우측 실행종목표 루틴 컬럼 확인

[출처: README_적용내용(12).txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 11:12:32 | 분류: 기타문서/자료]
확인:
1. 두 파일 교체
2. `python gui_main.py` 실행
3. 메인창 정상 실행 확인
4. 종목등록설정/매매루틴지정/자동매매설정창 확인

[출처: README_적용내용(11).txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 11:03:14 | 분류: 기타문서/자료]
확인:
1. 두 파일 교체
2. gui_main.py 실행
3. 종목등록설정창에서 등록 루틴 표시 확인
4. 매매루틴지정창에서 루틴 해제 재확인
5. 자동매매설정창에서 상단 종목수와 하단 목록 일치 확인

[출처: README_적용내용(4).txt | 기준일: 2026-06-14 | 수정시각: 2026-06-14 12:56:42 | 분류: 기타문서/자료]
main_order_executor_dryrun_patch 적용 내용

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_4.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-15 23:01:24 | 분류: 대화히스토리]
auto_trade_setting_remaining_methods_report(2).txt
문서
작업진행상황대화히스토리_3(2).txt
문서
MASTER_SPEC_v2.0_FULL_INTEGRATED_ARCHIVE_manifest(1).txt
문서

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_4.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-15 23:01:24 | 분류: 대화히스토리]
메인창(gui_windows)
검토관리창
Runtime 공통함수
State 저장
기초종목 서비스
ATS 서비스
현황 표시등
컨텍스트 메뉴
타이머
정책 함수
그리고 최근 며칠간 실제로 확인한 것:

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_4.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-15 23:01:24 | 분류: 대화히스토리]
그리고 지금 ZIP 기준으로 보면, 더 쪼개는 건 얻는 것보다 잃는 것이 많아질 가능성이 높습니다. 이제는 실제 테스트하면서 정책 버그를 잡는 단계로 넘어가는 게 가장 효율적입니다.
auto_trade_setting_remaining_methods_report(3).txt
문서
MASTER_SPEC_v2.0_FULL_INTEGRATED_ARCHIVE_manifest(2).txt
문서

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_4.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-15 23:01:24 | 분류: 대화히스토리]
현재 흐름상 제일 먼저 할 건 메인 관제창 기능 설계 정리입니다.
코드 수정 전에 “메인창에 어떤 영역을 추가할지”부터 정해야 합니다.

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_4.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-15 23:01:24 | 분류: 대화히스토리]
즉 루틴은 “살까?” 를 판단하고,
메인 프로그램은 “얼마나 살 수 있고 실제로 주문할까?” 를 판단합니다.
그래서 금액/주수 선택 기능은:

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_4.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-15 23:01:24 | 분류: 대화히스토리]
메인 관제창 / 자금운영 설정
↓
종목별 주문수량 산정 정책
↓
최종 주문 실행부
여기에 들어가는 게 맞습니다.
추천 구조:

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_4.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-15 23:01:24 | 분류: 대화히스토리]
루틴: 살까 말까 신호
자동매매설정창: 이 종목을 어떻게 운영할지
메인 관제창: 돈을 얼마나 쓰고 위험을 감당할지
메인 엔진: 최종 주문 실행 여부 판단
자금운영 개념은 이렇게 시작하면 됩니다.

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_4.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-15 23:01:24 | 분류: 대화히스토리]
계좌
 │
 ├─ 운용예산(선택)
 │
 ├─ 전체 매수한도(선택)
 │
 └─ 루틴
 │
 ├─ 루틴 매수한도(선택)
 │
 └─ 종목
 │
 ├─ 종목 매수한도(선택)
 │
 └─ 주문방식
 ├ 금액
 └ 주수
메인 관제창 초안 수정
상단:
계좌자산
운용예산
주문가능금액
실현손익
평가손익
중앙:
루틴명
운용종목수
사용금액
평가금액
실현손익
루틴 매수한도
상태
하단:
전체 매수한도
운용예산
긴급정지
검토관리
여기서 다음으로 확정해야 하는 것은 하나입니다.
운용예산도 계층형으로 갈 것인가?
예를 들면
전체 운용예산
3천만원
루틴A
1천만원
루틴B
2천만원
처럼 예산도 루틴별 배분 기능을 가질지
아니면
운용예산은 전체만 존재
배분은 매수한도로 처리
할지입니다.

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_4.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-15 23:01:24 | 분류: 대화히스토리]
자금운영의 기준은 평가금액이 아니라 예수금과 총매입금액이다.
이걸 기준으로 메인 관제창 자금운영 설계를 진행하는 게 맞아 보입니다.

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_4.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-15 23:01:24 | 분류: 대화히스토리]
100% 도달 시
신규매수 차단 여부
선택 가능
특히 "운영자가 자리에 없을 때 대응시간을 주기 위한 기능" 이라는 목적은 매우 타당하고, 메인 관제창의 핵심 기능 중 하나로 들어갈 가치가 충분해 보입니다.
다음 고고
좋습니다.
지금까지 나온 내용을 보면 메인 관제창은 단순히 자금 숫자만 보여주는 창이 아니라,
자금 관제
↓
위험 관제
↓
운영 의사결정 지원
까지 가야 합니다.
그래서 다음 개념은 자금 상태 등급화입니다.
현재까지
운용예산
5,000만원
사용금액
3,500만원
사용률
70%
이건 숫자만 보여줍니다.
그런데 관제는
지금 안전한가?
주의해야 하나?
위험한가?
를 보여줘야 합니다.
자금 상태 신호등
예)
0 ~ 60%
녹색
60 ~ 80%
주황
80 ~ 95%
적색
95% 이상
진한 적색
또는
사용자가 직접 설정.
예)
자금상태
● 정상
사용률
52%
잔여
2,400만원
● 주의
사용률
82%
잔여
900만원
● 위험
사용률
97%
잔여
150만원
중요한 부분
이건 예산기준뿐 아니라
전체 매수한도
루틴 매수한도
종목 매수한도
에도 적용 가능.
예)
단타A
매수한도
1,000만원
사용
930만원
상태
위험
다음으로 연결
이제 자금이 보이기 시작하면
운영자는 다음 생각을 합니다.
어디가 돈을 많이 쓰고 있지?
즉
루틴 자금 사용률
이 필요해집니다.
예)
루틴명
배당주
사용 12%
단타A
사용 92%
스윙B
사용 35%
테마C
사용 8%
이게 중요한 이유는
예산 부족 상황에서
어느 루틴이 돈을 먹고 있는가
를 즉시 확인 가능.
그래서 현재 메인 관제창 자금운영 영역은
1단계
운용예산
사용금액
잔여금액
사용률
상태등급
2단계
전체 매수한도 상태
루틴 매수한도 상태
3단계
루틴별 자금 사용률
까지 들어가는 게 자연스럽습니다.
여기서 다음 핵심은:
운용예산의 사용금액을 무엇으로 계산할 것인가?
현재까지 논의상 가장 유력한 기준은
총매입금액
+
매수 미체결 대기금액
입니다.
이 부분을 확정하면 자금관제 계산식의 뼈대가 완성됩니다.

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_4.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-15 23:01:24 | 분류: 대화히스토리]
슬라이더 방식을 사용한다면 5% or 2% 단위로 자동 설정되게 해야 설정편의가 올라갈듯하고 매수제한을 사용하고 안하고에따른 표시나. 비율로 설정할건지 금액으로 설정할건지 표시는 둘다 해야 하는 상황이고,,,,기타등등 표시가 복잡해질듯해
맞습니다. 그래서 처음부터 슬라이더를 메인 기능으로 넣으면 화면이 복잡해질 가능성이 큽니다.
현실적인 설계는 이렇게 가는 게 좋아 보입니다.
1차 기본 구조
메인 관제창에는 간단 표시만 둡니다.

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_4.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-15 23:01:24 | 분류: 대화히스토리]
A루틴 50% = 2,500만
B루틴 30% = 1,500만
미할당 20% = 1,000만
슬라이더는 미할당 풀 방식이 안전합니다.
B를 50% → 30%로 줄임
미할당 20% 증가
A는 자동 증가하지 않음
운영자가 A를 70%로 직접 올림
중요한 결론
메인창에 다 넣으면 복잡해집니다.
그래서:
메인 관제창 = 표시/간단 수정
자금설정창 = 상세 설정/슬라이더/비율조정
이 구조가 맞습니다.
처음 구현은 슬라이더 말고 표 기반 금액/비율 설정부터 가는 게 안전합니다.

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_4.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-15 23:01:24 | 분류: 대화히스토리]
예산 확대
같은 판단을 할 수 있게 됩니다. 지금까지 논의 흐름상 이게 메인 관제창의 진짜 핵심 기능에 가까워 보입니다.
건강도개념도 좋다..몇단계로 만드나?
이건 너무 많이 만들면 의미가 없어지고, 너무 적게 만들면 정보력이 떨어집니다.
내 생각에는 4단계가 가장 적절합니다.
🟢 우수
🟡 보통
🟠 주의
🔴 위험
왜 4단계냐?
3단계
좋음
보통
나쁨
은 너무 뭉뚱그려집니다.
5단계
매우우수
우수
보통
주의
위험
은 운영자가 구분 잘 안합니다.
실전에서는
좋냐?
관찰해야 하냐?
문제냐?
가 중요합니다.
내가 보는 건강도 개념은
🟢 우수
수익 양호
매수한도 활용 양호
검토종목 없음
운영 안정
운영자가
한도 확대 고려
할 수 있는 상태.
🟡 보통
수익 보합
약간의 손실
일반적 상태
신경 안 써도 됨.
🟠 주의
손실 증가
검토종목 발생
미체결 증가
자금 활용 비효율
관찰 필요.
🔴 위험
큰 손실
검토종목 다수
운영중단 검토
조기마감 검토
즉시 확인 필요.
그런데 여기서 더 중요한 게 있습니다.
건강도는 자동 판정값이 아니라
여러 요소를 섞은 관제지표여야 합니다.
예를 들면:
실현손익
평가손익
검토종목 수
미체결 수
사용률
운영시간
등을 종합해서 계산.
그리고 나는 한 가지를 더 넣고 싶습니다.
건강도 + 추세
예)
🟢 ↑ 우수
🟢 → 우수
🟡 ↓ 보통
이게 중요한 이유는
현재 우수
보다
좋아지고 있는가?
나빠지고 있는가?
가 운영 판단에 훨씬 중요하기 때문입니다.
예)
🟡 ↑
이면
좋아지는 중.
🟢 ↓
이면
현재는 좋지만 꺾이는 중.
그래서 최종적으로는
건강도 4단계
🟢 우수
🟡 보통
🟠 주의
🔴 위험
+
상승
유지
하락
조합이 상당히 강력한 관제지표가 될 것 같습니다.
다만 이건 지금 당장 계산식을 만들 단계는 아닙니다.
먼저 건강도에 반영할 요소가 무엇인지를 정해야 합니다.
내 생각에 후보는:
실현손익
평가손익
검토종목 수
미체결 수
자금 사용률
최근 성과 추세
정도입니다.
여기서 무엇을 넣고 무엇을 빼야 할지 먼저 정하는 게 좋겠습니다.
가능하겠어? 추세는 뭘보고 판단하나?
바로 그 부분 때문에 제가 아직 "건강도"를 기능으로 확정하지는 못하겠다고 생각했습니다.
현재 단계에서
🟢 우수
🟡 보통
🟠 주의
🔴 위험
은 가능해 보이는데,
↑
→
↓
추세는 생각보다 어려운 문제입니다.
예를 들어
A루틴
실현손익
+100만원
평가손익
-20만원
이면
좋아지는 건가?
나빠지는 건가?
애매합니다.
또
A루틴
09:30
+50만원
10:00
+70만원
10:30
+30만원
이면
추세 하락?
아니면
여전히 수익중?
그리고 더 큰 문제.
루틴A
사용률
95%
인데
수익률
+20%
이면
좋은건지
위험한건지
판정이 충돌합니다.
그래서 지금은
건강도
가능
추세
보류
가 맞습니다.
오히려 지금 생각나는 더 현실적인 건
건강도 = 운영상태
입니다.
예를 들면
🟢 우수
검토종목 없음
미수 없음
미도 없음
서버정상
운영상태 정상
🟡 보통
검토종목 1~2개
경미한 경고
🟠 주의
검토종목 증가
미체결 증가
운영자 확인 필요
🔴 위험
미수
미도
불일치
긴급정지 후보
즉
이건
수익 건강도
가 아니라
운영 건강도
입니다.
그리고 수익은 별도.
예를 들면
A루틴
건강도
🟢
실현손익
+150만원
평가손익
-20만원
이게 더 명확합니다.
왜냐하면
수익이 좋아도
운영은 위험할 수 있음
반대로
손실중이어도
운영상태는 정상일 수 있음
이니까요.
그래서 지금 시점의 제 판단은:
❌ 건강도 = 수익판정
❌ 건강도 = 추세판정
⭕ 건강도 = 운영안정성 지표
이게 훨씬 현실적입니다.
그리고 이건 현재 우리가 확립한 검토관리, 긴급정지, 미수, 미도, 불일치 철학과도 잘 맞습니다.

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_4.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-15 23:01:24 | 분류: 대화히스토리]
우리가 생각할 문제는 수익이 있는지 없는, 가령 구현시 좀더 다듬어야 하겠지만 손익률에서 - 면 무조건 빨간표시, +이긴하지만 세금을 포함한 각종거래비용을 추당하지 못하면 황색(현재가 일괄판매기준), 확연한 이익구간이면 녹색, 추가로 추세는 5이평이나 10이평, 20이평등을 대조해서 상승이면 녹색, 횡보면 황색, 하락이면 적색 등을 표시 하는거
오... 이건 건강도보다 훨씬 현실적이네요.
지금까지 내가 계속 건강도, 성과도 같은 추상적인 이야기를 했는데,
네가 말한 건 사실상
수익성
+
추세
를 분리해서 보여주는 겁니다.
이건 관제창에서 상당히 쓸만할 것 같습니다.
1. 수익성 신호등
기준:
현재가 일괄매도 기준
즉
보유수량 전량 매도
+
수수료
+
세금
+
기타 비용
모두 반영.
🔴 적색
실제 손실
현재 전량 매도 시
마이너스
🟡 황색
수익은 있음
하지만
세금
수수료
기타비용
반영 시
실질 수익 거의 없음
즉
손익분기점 근처
🟢 녹색
실질 순이익 확보
이건 상당히 직관적입니다.
운영자는
아직 빨강
노란불
이제 초록
만 봐도 됨.
2. 추세 신호등
이건 완전 별도.
예)
추세
컬럼.
판정
현재가
5이평
10이평
20이평
기준.
예)
🟢 상승
5 > 10 > 20
또는
현재가 > 5 > 10 > 20
🟡 횡보
이평 밀집
방향성 없음
🔴 하락
20 > 10 > 5
또는
현재가 < 5 < 10 < 20
중요한 점
이건 종목 기준.
루틴은?
나는 루틴도 가능하다고 봅니다.
예)
루틴 수익성
🟢
루틴 추세
🟡
계산은
소속 종목 평균
또는
자금가중 평균
오히려 이게 관제답다
예)
A루틴
수익성
🟢
추세
🟢
사용률
92%
보면
돈 더 넣어도 되겠는데?
생각 가능.
B루틴
수익성
🔴
추세
🔴
사용률
80%
보면
축소 검토
생각 가능.
그래서 현재 시점에서는
❌ 건강도
⭕ 수익성 신호등
⭕ 추세 신호등
이게 훨씬 현실적입니다.
특히 수익성 신호등은 현재가 전량매도 기준 순이익 여부를 사용한다는 점이 아주 좋습니다.
왜냐하면 운영자가 실제로 궁금한 건
지금 팔면 돈 버는가?
이거니까요.
이 개념은 메인 관제창뿐 아니라 나중에 루틴관리, 종목관리에도 재사용할 가치가 있어 보입니다.
사용률이란 뭐지?
좋은 지적입니다.

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_4.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-15 23:01:24 | 분류: 대화히스토리]
이 방향이 관제창의 본질인 "어디에 돈이 들어가 있고, 어디가 돈을 벌고 있는가"를 보여주는 데 더 적합해 보입니다.
루틴의 추세는 어떻게 계산 해넣을지..
이건 솔직히 아직 확정하면 안 됩니다.
왜냐하면 루틴은 종목이 아닙니다.
종목은:
현재가
5이평
10이평
20이평
이 있으니까
상승
횡보
하락
을 계산할 수 있습니다.
그런데 루틴은?
삼성전자
SK하이닉스
NAVER
효성중공업
같이 여러 종목 묶음입니다.
예를 들어
루틴A
삼성전자
🟢
SK하이닉스
🟢
NAVER
🔴
효성중공업
🔴
그럼 루틴은
상승?
하락?
횡보?
판정이 애매합니다.
그리고 더 큰 문제.
삼성전자
100만원
효성중공업
5000만원
이면
같은 1종목이라도 영향력이 완전히 다릅니다.
그래서 내가 보기엔
방법1
종목 추세 평균
종목 10개
상승 7
횡보 2
하락 1
↓
루틴 상승
가능은 함.
하지만
100만원 종목
7개
5000만원 종목
1개
상황에서 왜곡 발생.
방법2
투입금액 가중
투입금액 비중
반영.
예)
삼성전자
500만원
🟢
효성중공업
5000만원
🔴
↓
루틴은
🔴
가 더 가까움.
이게 현실적.
그런데 나는 아예 다른 생각이 있습니다.
루틴 추세를 만들 필요가 있을까?
이미 우리는
실현손익
평가손익
수익성 신호등
을 넣으려 합니다.
그러면
A루틴
실현 +300
평가 +100
수익성 🟢
B루틴
실현 -100
평가 -50
수익성 🔴
이 정보가 있는데
굳이
루틴 추세
를 또 계산해야 할까?
오히려 나는 지금 생각이 바뀌었습니다.
종목
수익성
추세
필요.
루틴
실현손익
평가손익
수익성
만 있으면 충분.
왜냐하면 운영자는
이 루틴이 돈을 벌고 있냐?
를 궁금해하지
이 루틴의 5이평이 어떠냐?
를 궁금해하진 않거든요.
그래서 현재 시점의 내 의견은:
❌ 루틴 추세 계산
보류
⭕ 종목 추세만 표시
⭕ 루틴은 손익과 수익성 위주
이게 더 현실적입니다.

[출처: 갱신메모\auto_trade_setting_remaining_methods_report.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-11 17:27:58 | 분류: 갱신문서]
# AutoTradeSettingWindow 남은 메서드 점검

[출처: 갱신메모\auto_trade_setting_remaining_methods_report.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-11 17:27:58 | 분류: 갱신문서]
- 파일: gui_auto_trade_setting_window(5).py
- 전체 라인 수: 2,961
- AutoTradeSettingWindow 메서드 수: 86
## 큰 메서드 TOP 20

[출처: 갱신메모\auto_trade_setting_remaining_methods_report.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-11 17:27:58 | 분류: 갱신문서]
- __init__: 53줄 (1093-1145)
- _setup_ui: 51줄 (1147-1197)
- _setup_routine_table: 24줄 (1199-1222)
- _setup_stock_table: 42줄 (1224-1265)
- _apply_stock_table_column_widths: 26줄 (1267-1292)
- _connect_events: 17줄 (1294-1310)
- sort_routine_table_by_column: 19줄 (1312-1330)
- sort_stock_table_by_column: 30줄 (1332-1361)
- apply_auto_trade_table_sorts: 6줄 (1363-1368)
- refresh_all: 20줄 (1370-1389)
- current_time_policy_minute_key: 2줄 (1391-1392)
- current_runtime_file_signature: 2줄 (1394-1395)
- on_runtime_file_timer_tick: 2줄 (1397-1398)
- on_time_policy_timer_tick: 2줄 (1400-1401)
- closeEvent: 11줄 (1403-1413)
- capture_stock_table_view_state: 17줄 (1415-1431)
- restore_stock_table_view_state: 17줄 (1433-1449)
- reset_runtime_statuses_on_window_start: 3줄 (1451-1453)
- selected_stock_rows: 2줄 (1455-1456)
- has_selected_stock: 2줄 (1458-1459)
- has_single_selected_stock: 2줄 (1461-1462)
- update_action_buttons: 12줄 (1464-1475)
- on_stock_selection_changed: 2줄 (1477-1478)
- operation_stock_dir_from_row: 11줄 (1480-1490)
- on_stock_table_item_double_clicked: 24줄 (1492-1515)
- ensure_context_row_selected: 2줄 (1517-1518)
- select_all_current_routine_stocks: 2줄 (1520-1521)
- clear_current_routine_stock_selection: 2줄 (1523-1524)
- on_stock_table_context_menu: 2줄 (1526-1527)
- open_selected_individual_liquidation_settings: 2줄 (1529-1530)
- individual_liquidation_status_text: 8줄 (1532-1539)
- save_selected_individual_liquidation_settings: 2줄 (1541-1542)
- selected_manual_ats_state: 21줄 (1544-1564)
- save_selected_manual_ats_state: 59줄 (1566-1624)
- open_selected_manual_ats_settings_dialog: 44줄 (1626-1669)
- set_selected_manual_ats_flag: 6줄 (1671-1676)
- show_selected_ats_immediate_sell_placeholder: 30줄 (1678-1707)
- selected_operation_mode_set: 13줄 (1709-1721)
- toggle_selected_manual_override_flag: 51줄 (1723-1773)
- reset_selected_manual_override: 42줄 (1775-1816)
- load_routine_table: 32줄 (1818-1849)
- current_selected_routine_name: 11줄 (1851-1861)
- current_selected_routine_dir: 19줄 (1863-1881)
- restore_routine_selection: 6줄 (1883-1888)
- on_routine_selection_changed: 2줄 (1890-1891)
- load_selected_routine_stocks: 431줄 (1893-2323)
- selected_stock_dir: 2줄 (2325-2326)
- selected_stock_info: 2줄 (2328-2329)
- selected_stock_infos: 2줄 (2331-2332)
- int_state_value: 5줄 (2334-2338)
- resume_status_after_pause: 2줄 (2340-2341)
- pre_start_review_check: 25줄 (2343-2367)
- mark_review_required: 34줄 (2369-2402)
- update_stock_status: 18줄 (2404-2421)
- operation_policy_protected_status: 2줄 (2423-2424)
- recalculate_stock_status_by_operation_policy: 18줄 (2426-2443)
- recalculate_all_status_by_operation_policy: 12줄 (2444-2455)
- update_stock_operation_mode: 16줄 (2456-2471)
- unregister_selected_auto_trade_stocks: 2줄 (2473-2474)
- statusBar_message: 8줄 (2476-2483)
- open_operation_environment_settings: 6줄 (2486-2491)
- open_selected_stock_policy_settings: 10줄 (2493-2502)
- set_global_schedule_time: 3줄 (2504-2506)
- open_schedule_trade_management_window: 4줄 (2508-2511)
- set_selected_individual_schedule_time: 23줄 (2513-2535)
- reset_selected_schedule_to_global: 14줄 (2537-2550)
- set_selected_schedule_operation_mode: 2줄 (2552-2553)
- set_selected_operation_mode: 6줄 (2555-2560)
- set_selected_stocks_buy_end: 2줄 (2562-2563)
- run_current_routine_stability_check: 2줄 (2565-2566)
- split_start_targets: 37줄 (2568-2604)
- split_stop_targets: 32줄 (2606-2637)
- stop_risk_parts: 12줄 (2639-2650)
- stop_warning_items: 10줄 (2652-2661)
- confirm_stop_targets_once: 65줄 (2663-2727)
- show_auto_trade_result_dialog: 34줄 (2729-2762)
- start_selected_auto_trades: 2줄 (2764-2765)
- apply_selected_early_close_default: 2줄 (2768-2769)
- apply_selected_early_close_profit_loss: 2줄 (2771-2772)
- apply_selected_early_close: 19줄 (2774-2792)
- stop_selected_auto_trades: 2줄 (2793-2794)
- open_review_required_window: 2줄 (2796-2797)
- statusBarMessage: 14줄 (2799-2812)
- open_order_status_window: 2줄 (2814-2815)
- open_log_view_window: 2줄 (2817-2818)
- show_deferred_message: 2줄 (2820-2821)
## 후보 그룹 요약

[출처: 마스터스펙\MASTER_SPEC_v2.0_FULL_INTEGRATED_ARCHIVE_2026-06-11.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-11 15:25:42 | 분류: MASTER_SPEC]
[루틴 지정창 최신 확정]
- RoutineAssignWindow는 gui_routine_assign_window.py로 분리 완료
- RoutineUnassignConfirmDialog도 gui_routine_assign_window.py에 위치
- gui_windows.py는 두 클래스를 import해야 함
- gui_routine_assign_utils.py는 결과 메시지 생성 함수만 보유
- gui_centered_checkbox_delegate.py는 공용 체크박스 델리게이트 보유
- 상단 "루틴 지정 가능 종목"은 미등록/미지정 종목만 표시
- 이미 루틴에 연결된 종목은 상단에 표시하지 않음
- 선택 루틴 연결 종목은 하단에서 관리
- 이미 연결된 루틴에 중복 지정하지 않도록 실행부에서도 방어

[출처: 마스터스펙\MASTER_SPEC_v2.0_FULL_INTEGRATED_ARCHIVE_2026-06-11.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-11 15:25:42 | 분류: MASTER_SPEC]
1. MainWindow
2. StockRegisterWindow
3. AutoTradeSettingWindow
4. RoutineDetailWindow
5. MacdConfigWindow
6. IntegrityCheckWindow
7. RealAccountConfirmWindow
---
### gui_dialogs.py
역할 :
공통 팝업, 확인창, 입력창을 관리한다.
포함 기능 :

[출처: 마스터스펙\MASTER_SPEC_v2.0_FULL_INTEGRATED_ARCHIVE_2026-06-11.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-11 15:25:42 | 분류: MASTER_SPEC]
```text
kiwoom_auto/
├─ gui_main.py
├─ gui_windows.py
├─ state_policy.py
├─ runtime_io.py
├─ gui_order_utils.py
├─ gui_schedule_utils.py
├─ gui_config_utils.py
├─ gui_routine_policy.py
├─ gui_routine_service.py
├─ gui_routine_guard.py
├─ gui_review_utils.py
├─ data/
│ └─ stocks/
│ └─ 005930_삼성전자/
│ ├─ state.json
│ ├─ orders.json
│ ├─ config.json
│ └─ stock_log.txt
├─ routines/
│ └─ 루틴명/
│ ├─ routine_config.json
│ └─ routine_logic.py
├─ logs/
│ ├─ operation.log
│ ├─ policy.log
│ ├─ order.log
│ └─ exception.log
└─ docs/
 ├─ spec_archive/
 │ └─ MASTER_SPEC_v1.1_윈도우창버전_키움자동매매.txt
 └─ MASTER_SPEC_v1.2_structure_phase2.md
```
원칙:

[출처: 마스터스펙\MASTER_SPEC_v2.0_FULL_INTEGRATED_ARCHIVE_2026-06-11.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-11 15:25:42 | 분류: MASTER_SPEC]
이번 세션 최신 코드:
gui_windows_88_align_manual_liquidation_checkbox.py
중간 패치:
gui_windows_83~87은 시행착오 버전으로 보존만 한다.
---
## 4. 다음 코드 반영 순서

[출처: 마스터스펙\MASTER_SPEC_v2.0_FULL_INTEGRATED_ARCHIVE_2026-06-11.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-11 15:25:42 | 분류: MASTER_SPEC]
[다음 개발]
1. 관제창 완성
2. 자동매매설정 미구현 기능 점검
3. 2차 구조개선
4. gui_main/gui_windows/state_policy 분리
5. 종목폴더 통합 구조 설계

[출처: 마스터스펙\MASTER_SPEC_v2.0_FULL_INTEGRATED_ARCHIVE_2026-06-11.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-11 15:25:42 | 분류: MASTER_SPEC]
==================================================
[관제창]
==================================================
검토종목 제거.
검토관리종목 버튼으로 분리.
검토관리 건수 표시.

[출처: 마스터스펙\MASTER_SPEC_v2.0_FULL_INTEGRATED_ARCHIVE_2026-06-11.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-11 15:25:42 | 분류: MASTER_SPEC]
- AutoTradeSettingWindow 기능 분리
- gui_auto_trade_status_ops.py
- gui_auto_trade_table_loader.py
- gui_auto_trade_close.py
- gui_auto_trade_review_ops.py
- gui_auto_trade_run_control.py
- gui_auto_trade_timer.py

[출처: 마스터스펙\MASTER_SPEC_v2.0_FULL_INTEGRATED_ARCHIVE_2026-06-11.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-11 15:25:42 | 분류: MASTER_SPEC]
1. StockRegisterWindow 분리
2. GlobalReviewRequiredWindow 분리
3. OperationEnvironmentSettingsDialog 분리
4. 자동매매설정 미구현 기능 점검
5. 관제창 최종 마무리
6. 2차 구조개선
7. gui_main / gui_windows / state_policy 추가 분리

[출처: 마스터스펙\MASTER_SPEC_v2.0_FULL_INTEGRATED_ARCHIVE_2026-06-11.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-11 15:25:42 | 분류: MASTER_SPEC]
[루틴 지정창 최신 확정]
- RoutineAssignWindow는 gui_routine_assign_window.py로 분리 완료
- RoutineUnassignConfirmDialog도 gui_routine_assign_window.py에 위치
- gui_windows.py는 두 클래스를 import해야 함
- gui_routine_assign_utils.py는 결과 메시지 생성 함수만 보유
- gui_centered_checkbox_delegate.py는 공용 체크박스 델리게이트 보유

[출처: 마스터스펙\MASTER_SPEC_v2.0_통합최종본_2026-06-11.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-11 15:13:44 | 분류: MASTER_SPEC]
==================================================
11. 관제창 정책
==================================================
검토종목 제거.
검토관리 버튼 분리.
검토관리 건수 표시.

[출처: 새창시작_즉시참조_v2026-06-11.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-11 15:06:18 | 분류: 기타문서/자료]
다음 작업:
1. 최신 gui_windows.py 분석
2. StockRegisterWindow 클래스 범위/의존성 확인
3. gui_stock_register_window.py 분리 가능성 판단
4. 사용자 승인 후 수정본 생성

[출처: 구조개선_남은작업_분석서_v2026-06-11.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-11 15:06:00 | 분류: 기타문서/자료]
클래스 현황:
- MainWindow: 660줄 / 메서드 31개 / 350-1009
- GlobalReviewRequiredWindow: 442줄 / 메서드 16개 / 1205-1646
- TimeComboWidget: 33줄 / 메서드 3개 / 1663-1695
- OperationEnvironmentSettingsDialog: 660줄 / 메서드 20개 / 1697-2356
- StockRegisterWindow: 830줄 / 메서드 23개 / 2664-3493

[출처: 구조개선_남은작업_분석서_v2026-06-11.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-11 15:06:00 | 분류: 기타문서/자료]
2. GlobalReviewRequiredWindow
 - 검토관리 종목 통합 관리창
 - 복귀/미지정/삭제 기능 포함
 - MainWindow의 검토관리 버튼과 연결

[출처: 구조개선_남은작업_분석서_v2026-06-11.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-11 15:06:00 | 분류: 기타문서/자료]
[분리 시 주의]
- gui_windows.py에는 MainWindow와 최소 공용 함수만 남기는 방향
- 프로젝트 경로 상수는 중복 정의보다 별도 공용 설정 모듈로 이동 검토 가능
- 하지만 지금은 과도한 공용화보다 창 단위 분리가 안전

[출처: 구조개선_남은작업_분석서_v2026-06-11.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-11 15:06:00 | 분류: 기타문서/자료]
[다음 작업 추천]
StockRegisterWindow 분리부터 진행.
단, 먼저 현재 gui_windows.py에서 StockRegisterWindow 클래스 시작/끝 라인, 의존 함수, 외부 호출 지점을 분석한 뒤 진행.

[출처: 작업재개요약서_v2026-06-11_구조개선_최신갱신.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-11 15:05:44 | 분류: 작업재개요약]
2. RoutineAssignWindow 분리 완료
 - gui_routine_assign_window.py 분리
 - gui_routine_assign_utils.py 복구
 - gui_centered_checkbox_delegate.py 분리
 - gui_windows.py에서 RoutineAssignWindow / RoutineUnassignConfirmDialog import 보강
 - 루틴 지정창 생성, 데이터 로딩, 루틴 해제, 루틴 지정 정상 확인

[출처: 작업재개요약서_v2026-06-11_구조개선_최신갱신.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-11 15:05:44 | 분류: 작업재개요약]
2순위 추천:
 - StockRegisterWindow 분리 우선
 - 이유: 종목 등록/삭제/루틴지정 진입부가 아직 gui_windows.py에 크게 남아 있음
 - delete_selected_stock() 등 대형 메서드가 남아 있을 가능성이 높음

[출처: 작업재개요약서_v2026-06-11_구조개선_최신갱신.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-11 15:05:44 | 분류: 작업재개요약]
[현재 최신 gui_windows.py 분석]
파일: gui_windows(170).py
전체 라인 수: 3,494

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_3.txt | 기준일: 2026-06-09 | 수정시각: 2026-06-11 15:30:36 | 분류: 대화히스토리]
전체 4,785줄
MainWindow: 660줄
RoutineAssignWindow: 1,192줄
StockRegisterWindow: 830줄
분리 우선순위:

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_3.txt | 기준일: 2026-06-09 | 수정시각: 2026-06-11 15:30:36 | 분류: 대화히스토리]
1순위: RoutineAssignWindow
2순위: StockRegisterWindow
3순위: MainWindow
특히 RoutineAssignWindow는 1,192줄이라 너무 큽니다.
다음 작업은 RoutineAssignWindow를 별도 파일로 분리하는 게 맞습니다.
추천 파일명:
gui_routine_assign_window.py
먼저 이 방식으로 갈까요?
오키...고고
이번 건은 내가 방금 분리한 RoutineAssignWindow 때문이 아니라 다른 문제다.
에러를 보면:
File "gui_routine_assign_utils.py", line 49

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_3.txt | 기준일: 2026-06-09 | 수정시각: 2026-06-11 15:30:36 | 분류: 대화히스토리]
어느 쪽으로 갈지 결정하고 진행하는 게 좋다. 현재는 "버그 수정 단계"가 아니라 "구조개선 계속할지, 기능 개발로 복귀할지" 선택 지점이다.
좀더 구조개선을 하자.. 몇개정도 남았나?
gui_windows(170).py
Python
분석해봐
auto_trade_setting_remaining_methods_report(1).txt
문서
gui_windows(160)(1).py
Python
작업진행상황대화히스토리_3(1).txt
문서
MASTER_ADDENDUM_v2026-06-10_ATS정책(2).txt
문서

[출처: 작업재개_상세판_v2026-06-09.txt | 기준일: 2026-06-09 | 수정시각: 2026-06-09 19:54:00 | 분류: 작업재개요약]
2차 구조개선 범위
- gui_main.py 경량화
- gui_windows.py 분리
- state_policy.py 분리
- 검토관리 모듈 분리
- 종목폴더 구조 통합
다음 창 시작 문구
현재는 관제창 구현 단계.
구조개선은 관제창 완료 후 착수.

[출처: 작업재개요약서_2026_06_09_관제창이후 (1).md | 기준일: 2026-06-09 | 수정시각: 2026-06-09 15:33:24 | 분류: 작업재개요약]
### 2차 구조개선
- gui_main.py
- gui_windows.py 분리
- 종목폴더 통합 구조
- 모듈 재배치
현재는 기능 안정화 우선
구조개선은 이후 진행

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_2.txt | 기준일: 2026-06-07 | 수정시각: 2026-06-09 20:07:50 | 분류: 대화히스토리]
image(439).png
image(440).png
image(441).png
image(442).png
image(443).png
메세지 손봐야겠다
이거만 수정하자
gui_windows(119).py
Python
이거 분석해서 패치 방향을 잡아봐
image(445).png
image(446).png
일단 두개만
이게 정상 작동인가?
아직 판정은 안된다...빨간색 어디?
gui_windows(120).py
Python
직전 패치로 복원했다 다시 검토, 분석해서 패치 줘
된거 같은데 kb금융은 뭐가 문제일까? 왜 빨간색?
판정 근거
image(453).png
image(454).png
image(455).png
된건가?
image(456).png
검토종목은 빼서 검토관리창으로 확인하게 ...메인창에 검토관리종목 버튼 설치
image(457).png
image(458).png
헤더 정렬기능넣어줘
작업진행상황대화히스토리_2(2).txt
문서
작업재개_상세판_v2026-06-08(2).txt
문서
중요결정사항_확정본_v2026-06-08(2).txt
문서
작업재개요약서_v2026-06-08(2).txt
문서

[출처: 작업재개요약서_v2026_06_07_UI최종반영판.txt | 기준일: 2026-06-07 | 수정시각: 2026-06-07 07:41:20 | 분류: 작업재개요약]
현재 최신 기준 코드:
gui_windows_88_align_manual_liquidation_checkbox.py

[출처: 작업진행상황대화히스토리.txt | 기준일: 2026-06-06 | 수정시각: 2026-06-06 23:18:38 | 분류: 대화히스토리]
MainWindow
StockRegisterWindow
RoutineAssignWindow
AutoTradeSettingWindow
같은 대형 클래스들이다.
이건 파일이 아니라
창 단위
로 나눠야 한다.
예:

[출처: 작업진행상황대화히스토리.txt | 기준일: 2026-06-06 | 수정시각: 2026-06-06 23:18:38 | 분류: 대화히스토리]
gui_main_window.py
gui_stock_register_window.py
gui_routine_assign_window.py
gui_auto_trade_window.py
그래서 현재 판정은
파편화 과다 ❌
유지보수성 향상 ✅
수정 위치 추적 가능 ✅
구조개선 방향 정상 ✅
이다.
오히려 지금은 예전보다
"어디를 수정해야 하지?"
라는 문제가 훨씬 줄어든 상태다.
그렇다면 gui_windows.py 파일의 클래스는 더 나눠야 하나?\
응. 나누는 게 맞다.
다만 지금 바로 전부 나누는 건 아니고, 순서는 이렇게가 안전하다.
1. gui_main_window.py
 MainWindow
2. gui_routine_assign_window.py
 RoutineAssignWindow
3. gui_auto_trade_window.py
 AutoTradeSettingWindow
4. gui_stock_register_window.py
 StockRegisterWindow
우선순위는:

[출처: 작업진행상황대화히스토리.txt | 기준일: 2026-06-06 | 수정시각: 2026-06-06 23:18:38 | 분류: 대화히스토리]
1순위 AutoTradeSettingWindow
2순위 RoutineAssignWindow
3순위 StockRegisterWindow
4순위 MainWindow
이유:
AutoTradeSettingWindow
= 아직 가장 크고 기능이 많음
RoutineAssignWindow
= 루틴 지정/해제 핵심창
StockRegisterWindow
= 종목등록 핵심창
MainWindow
= 비교적 단순하니 마지막
현재 결론:
구조개선 1차 = 완료
구조개선 2차 = 창 클래스 분리
그래서 지금 당장 계속한다면 다음 단계는:
구조개선 2차 준비
AutoTradeSettingWindow 분리 가능성 분석
이게 맞다.

[출처: 작업진행상황대화히스토리.txt | 기준일: 2026-06-06 | 수정시각: 2026-06-06 23:18:38 | 분류: 대화히스토리]
관제창 UI 정책 = 설계 확정
세부 디자인 = 구현 단계 재조정
다음은 이 내용을 문서에 반영하면 됩니다.

[출처: 작업진행상황대화히스토리.txt | 기준일: 2026-06-06 | 수정시각: 2026-06-06 23:18:38 | 분류: 대화히스토리]
reset_runtime_statuses_on_window_start()가 AutoTradeSettingWindow가 아니라 RoutineAssignWindow 쪽 생성자에 들어가 있다.
즉 자동매매설정 창 시작 시 초기화가 아니라, 매매루틴지정 창 쪽에 잘못 들어갔다.
그래서 지금 네 말이 맞다.
최신 파일이 맞긴 한데
패치 위치가 틀렸다.
다음 수정은 1개다.

[출처: 작업진행상황대화히스토리.txt | 기준일: 2026-06-06 | 수정시각: 2026-06-06 23:18:38 | 분류: 대화히스토리]
reset_runtime_statuses_on_window_start()
호출 위치를 AutoTradeSettingWindow.__init__ 으로 이동
그리고 load_selected_routine_stocks() 마지막에 복원 호출을 확실히 넣어야 한다.
다음
진행합니다. 이번엔 패치 위치 오류 수정입니다.
시작상태 초기화 호출을 AutoTradeSettingWindow로 이동
자동매매설정 종목표 스크롤 복원 호출을 확실히 추가
15s 동안 생각함
수정 완료.
파일:
gui_windows_autotrade_init_scroll_fix_v2.py
state_policy_autotrade_init_scroll_fix_v2.py
참조:
autotrade_init_scroll_fix_v2_result.md
작업재개참조_autotrade_init_scroll_fix_v2.md
적용:

[출처: 작업진행상황대화히스토리.txt | 기준일: 2026-06-06 | 수정시각: 2026-06-06 23:18:38 | 분류: 대화히스토리]
gui_windows_autotrade_init_scroll_fix_v2.py → gui_windows.py

[출처: 작업진행상황대화히스토리.txt | 기준일: 2026-06-06 | 수정시각: 2026-06-06 23:18:38 | 분류: 대화히스토리]
state_policy_autotrade_init_scroll_fix_v2.py → state_policy.py
image(162).png
종목 창이 자동으로 정렬되네??? 상태 시간좀 확인
스크린샷 기준으로 보이는 현상은 2개야.
1. 종목창 자동 정렬
현재 순서가
6 카카오게임즈 (수동)
7 현대모비스
8 LG화학
9 신한지주
10 LG전자
11 셀트리온
12 SK이노베이션
이렇게 되어 있음.
원래 종목등록 순서가 아니라면,
어딘가에서 load_selected_routine_stocks() 실행 시 다시 정렬하고 있는 것 같아.
즉 현재는

[출처: 작업진행상황대화히스토리.txt | 기준일: 2026-06-06 | 수정시각: 2026-06-06 23:18:38 | 분류: 대화히스토리]
gui_windows(50).py 안의 load_selected_routine_stocks() 함수 전체를 확인해야 함.
그 함수 안에서 정렬이 발생하는지 봐야 현재 "맨 위로 이동" 문제의 원인이 정확히 잡힌다.
gui_windows(51).py
Python
마지막 패치 . 다시 분석
56s 동안 생각함
최신 gui_windows(51).py 확인했다.
결론:
마지막 패치 위치는 이번엔 맞음
AutoTradeSettingWindow.__init__ 안에 시작 초기화 들어감.
reset_runtime_statuses_on_window_start() 호출 위치 정상.
종목창 자동정렬 원인 찾음
load_selected_routine_stocks() 끝에서 아직 이 코드가 실행됨.

[출처: 작업진행상황대화히스토리.txt | 기준일: 2026-06-06 | 수정시각: 2026-06-06 23:18:38 | 분류: 대화히스토리]
현재 동작
프로그램 시작
↓
감시대기
↓
끝
정상 동작
프로그램 시작
↓
감시대기 초기화
↓
time_policy 재판정
↓
화면 갱신
지금까지 캡처로 판단하면
✅ 개별시간 적용
✅ 수동 적용
✅ 스크롤 유지
✅ 정렬 유지
❌ 시작 직후 시간정책 재판정 1회 누락
남은 버그는 사실상 이것 하나다.
이 부분은 AutoTradeSettingWindow.__init__() 마지막 또는 초기 로딩 루틴 끝에서

[출처: 작업진행상황대화히스토리.txt | 기준일: 2026-06-06 | 수정시각: 2026-06-06 23:18:38 | 분류: 대화히스토리]
업로드한 gui_windows(59).py 기준으로 다시 패치 만듭니다.
이번은 요청한 위치 이동만 적용합니다.
11s 동안 생각함
패치 만들었습니다.
gui_windows_87_requested_checkbox_alignment.py
수정:
3번 청산정책 적용 앞에 / 추가
3번 청산정책 적용, 4/5번 이월 후방 열로 이동
6번 시장가 = 5번 현재가 열
6번 현재가 = 5번 익절/손절 열
6번 이월 = 그 다음 동일 간격 열
문법 검사 통과

[출처: 작업진행상황대화히스토리.txt | 기준일: 2026-06-06 | 수정시각: 2026-06-06 23:18:38 | 분류: 대화히스토리]
image(237).png
거의 다온거 같다 아주 잘했는데 청산정책적용 체크박스를 아래 이월체크박스에 맞춰서위치해줘, 이월체크박스는 가만히두고 위에 청산정책적용 체크박스를 움직여서 맞춰줘
청산정책 적용만 움직입니다.
아래 이월 체크박스는 그대로 둡니다.
8s 동안 생각함
패치 만들었습니다.
gui_windows_88_align_manual_liquidation_checkbox.py
수정:
3번 청산정책 적용 체크박스를 4/5번 이월 체크박스 열에 맞춤
/는 앞쪽에 따로 배치
이월 체크박스 위치는 그대로 유지
문법 검사 통과

[출처: 작업진행상황대화히스토리.txt | 기준일: 2026-06-06 | 수정시각: 2026-06-06 23:18:38 | 분류: 대화히스토리]
gui_windows_88_align_manual_liquidation_checkbox.py
이걸 기준으로 이어가면 된다.
오늘 고생 많았다. 😄

[출처: 시간정책_코드수정계획_v1.md | 기준일: 2026-06-05 | 수정시각: 2026-06-06 06:47:04 | 분류: 운영정책]
작성일: 2026-06-05
기준 파일: gui_windows(47).py, state_policy(5).py
---
## 1. 현재 코드 판정
현재 파일은 최근 실패한 QTimer/자동전환 패치가 들어가기 전 상태에 가깝다.
따라서 복구 기준으로 사용할 수 있다.
문제는 다음이다.
```text
상태 표시명
상태 저장값
시간판정
감시시작 버튼 판정
감시종료 버튼 판정
```
이 서로 완전히 분리되어 있지 않다.
---
## 2. 바로 코드 수정하면 안 되는 항목
아래는 당분간 금지한다.

[출처: 시간정책_코드수정계획_v1.md | 기준일: 2026-06-05 | 수정시각: 2026-06-06 06:47:04 | 분류: 운영정책]
```text
매수시작~매수종료 → RUNNING
매수종료~정규장 실시간 종료 → SELL_ONLY
정규장 실시간 종료 이후 → MONITORING
```
추가시장 시간운영은 별도 정책 확정 전까지 보류.
---
## 6. gui_windows.py 연결 지점
### 1차 연결 대상
```text
감시시작 함수 1곳
감시종료 함수 1곳
```
### 감시시작
기존:
```text
상태를 직접 MONITORING/RUNNING 등으로 저장
```
변경:

[출처: 운영시간정책_확정안_v1.md | 기준일: 2026-06-05 | 수정시각: 2026-06-06 06:46:58 | 분류: 운영정책]
1. 이 문서를 기준으로 `time_policy.py` 신규 작성
2. `state_policy.py`는 상태 표시/색상만 담당
3. `gui_windows.py`는 감시시작/감시종료 버튼에서 `time_policy.py`를 호출만 함
4. 자동갱신 QTimer는 당분간 금지
5. 수동 테스트 통과 후 자동갱신 재검토
---
## 9. 현재 코드 수정 가능 여부
가능하다.
단, 기존처럼 `gui_windows.py`에 시간정책을 직접 덧붙이면 다시 꼬일 가능성이 높다.
수정 방식은 아래가 안전하다.

[출처: 중요문서1\구조개선_설계의사결정기록_ADR_v1 .md | 기준일: 2026-06-05 | 수정시각: 2026-06-05 12:02:06 | 분류: 기타문서/자료]
--------------------------------------------------
ADR-010
루틴과 메인엔진 분리
--------------------------------------------------
루틴
- 신호 생성
메인엔진
- 상태관리
- 무결성 검사
- 주문집행
결론
완전 분리

[출처: routine_folder_liveness_report.txt | 기준일: 2026-06-02 | 수정시각: 2026-06-15 16:49:58 | 분류: 기타문서/자료]
## get_routine_dirs
- 참조 수: 66
 - docs/gui_windows(160).py:L231 def get_routine_dirs() -> list[Path]:
 - docs/gui_windows(160).py:L607 return {routine_display_name(path): path for path in get_routine_dirs()}
 - docs/gui_windows(160).py:L917 for routine_dir in get_routine_dirs():
 - docs/gui_windows(160).py:L1273 routine_dirs = get_routine_dirs()
 - docs/gui_windows(160).py:L1428 for routine_dir in get_routine_dirs():
 - docs/gui_windows(160).py:L2796 routine_dirs = get_routine_dirs()
 - docs/gui_windows(160).py:L3064 routine_dir_by_name = {routine_display_name(path): path for path in get_routine_dirs()}
 - docs/gui_windows(160).py:L3099 routine_dir_by_name = {routine_display_name(path): path for path in get_routine_dirs()}
 - docs/gui_windows(160).py:L4471 for routine_dir in get_routine_dirs():
 - docs/gui_windows(160).py:L4946 for routine_dir in get_routine_dirs():
 - docs/gui_windows(160).py:L6798 routine_dirs = get_routine_dirs()
 - docs/gui_windows(160).py:L7641 for routine_dir in get_routine_dirs():
 - docs/gui_windows(160).py:L8939 for routine_dir in get_routine_dirs():
 - docs/gui_windows(160).py:L9014 for routine_dir in get_routine_dirs():
 - gui_auto_trade_setting_window.py:L324 def get_routine_dirs() -> list[Path]:
 - gui_auto_trade_setting_window.py:L425 for routine_dir in get_routine_dirs():
 - gui_auto_trade_setting_window.py:L1314 routine_dirs = get_routine_dirs()
 - gui_auto_trade_status_ops.py:L76 def get_routine_dirs() -> list[Path]:
 - gui_auto_trade_status_ops.py:L327 for routine_dir in get_routine_dirs():
 - gui_global_review_required_window.py:L40 get_routine_dirs,
 - gui_global_review_required_window.py:L66 for routine_dir in get_routine_dirs():
 - gui_global_review_required_window.py:L541 for routine_dir in get_routine_dirs():
 - gui_main_table_loader.py:L41 get_routine_dirs,
 - gui_main_table_loader.py:L149 routine_dirs = get_routine_dirs()
 - gui_review_required_window.py:L56 def get_routine_dirs() -> list[Path]:
 - gui_review_required_window.py:L402 for routine_dir in get_routine_dirs():
 - gui_review_required_window.py:L872 for routine_dir in get_routine_dirs():
 - gui_routine_assign_window.py:L79 get_routine_dirs,
 - gui_routine_assign_window.py:L93 for path in get_routine_dirs():
 - gui_routine_assign_window.py:L612 routine_dirs = get_routine_dirs()
 - gui_routine_assign_window.py:L880 routine_dir_by_name = {routine_display_name(path): path for path in get_routine_dirs()}
 - gui_routine_assign_window.py:L915 routine_dir_by_name = {routine_display_name(path): path for path in get_routine_dirs()}
 - gui_schedule_window.py:L225 def get_routine_dirs() -> list[Path]:
 - gui_schedule_window.py:L554 return {routine_display_name(path): path for path in get_routine_dirs()}
 - gui_schedule_window.py:L822 routine_dirs = get_routine_dirs()
 - gui_schedule_window.py:L877 for routine_dir in get_routine_dirs():
 - gui_schedule_window.py:L1704 routine_dirs = get_routine_dirs()
 - gui_schedule_window.py:L1972 routine_dir_by_name = {routine_display_name(path): path for path in get_routine_dirs()}
 - gui_schedule_window.py:L2007 routine_dir_by_name = {routine_display_name(path): path for path in get_routine_dirs()}
 - gui_schedule_window.py:L2535 for routine_dir in get_routine_dirs():
 - gui_schedule_window.py:L3695 for routine_dir in get_routine_dirs():
 - gui_schedule_window.py:L3847 routine_dirs = get_routine_dirs()
 - gui_schedule_window.py:L4316 for routine_dir in get_routine_dirs():
 - gui_schedule_window.py:L5167 for routine_dir in get_routine_dirs():
 - gui_schedule_window.py:L5239 for routine_dir in get_routine_dirs():
 - gui_stock_register_window.py:L243 get_routine_dirs,
 - gui_stock_register_window.py:L353 for routine_dir in get_routine_dirs():
 - gui_windows.py:L61 get_routine_dirs,
 - gui_windows.py:L89 return {routine_display_name(path): path for path in get_routine_dirs()}
 - gui_windows.py:L336 for routine_dir in get_routine_dirs():
 - gui_windows_149_manual_ats_status_policy_fix.py:L231 def get_routine_dirs() -> list[Path]:
 - gui_windows_149_manual_ats_status_policy_fix.py:L607 return {routine_display_name(path): path for path in get_routine_dirs()}
 - gui_windows_149_manual_ats_status_policy_fix.py:L917 for routine_dir in get_routine_dirs():
 - gui_windows_149_manual_ats_status_policy_fix.py:L1273 routine_dirs = get_routine_dirs()
 - gui_windows_149_manual_ats_status_policy_fix.py:L1428 for routine_dir in get_routine_dirs():
 - gui_windows_149_manual_ats_status_policy_fix.py:L2613 routine_dirs = get_routine_dirs()
 - gui_windows_149_manual_ats_status_policy_fix.py:L2881 routine_dir_by_name = {routine_display_name(path): path for path in get_routine_dirs()}
 - gui_windows_149_manual_ats_status_policy_fix.py:L2916 routine_dir_by_name = {routine_display_name(path): path for path in get_routine_dirs()}
 - gui_windows_149_manual_ats_status_policy_fix.py:L4288 for routine_dir in get_routine_dirs():
 - gui_windows_149_manual_ats_status_policy_fix.py:L4763 for routine_dir in get_routine_dirs():
 - ... 외 6건

[출처: routine_folder_liveness_report.txt | 기준일: 2026-06-02 | 수정시각: 2026-06-15 16:49:58 | 분류: 기타문서/자료]
## routine_display_name
- 참조 수: 63
 - docs/gui_windows(160).py:L254 def routine_display_name(routine_dir: Path) -> str:
 - docs/gui_windows(160).py:L607 return {routine_display_name(path): path for path in get_routine_dirs()}
 - docs/gui_windows(160).py:L918 routine_name = routine_display_name(routine_dir)
 - docs/gui_windows(160).py:L1278 routine_name = routine_display_name(routine_dir)
 - docs/gui_windows(160).py:L1440 return routine_display_name(stock_dir.parent)
 - docs/gui_windows(160).py:L2806 display_name = routine_display_name(routine_dir)
 - docs/gui_windows(160).py:L3064 routine_dir_by_name = {routine_display_name(path): path for path in get_routine_dirs()}
 - docs/gui_windows(160).py:L3099 routine_dir_by_name = {routine_display_name(path): path for path in get_routine_dirs()}
 - docs/gui_windows(160).py:L4472 routine_name = routine_display_name(routine_dir)
 - docs/gui_windows(160).py:L6803 routine_name = routine_display_name(routine_dir)
 - docs/gui_windows(160).py:L8940 routine_name = routine_display_name(routine_dir)
 - docs/gui_windows(160).py:L8990 routine_name = routine_display_name(routine_dir)
 - docs/gui_windows(160).py:L9015 routine_name = routine_display_name(routine_dir)
 - gui_auto_trade_runtime.py:L64 def _routine_display_name_from_dir(routine_dir: Path) -> str:
 - gui_auto_trade_runtime.py:L162 routine_name = _routine_display_name_from_dir(routine_dir)
 - gui_auto_trade_setting_window.py:L347 def routine_display_name(routine_dir: Path) -> str:
 - gui_auto_trade_setting_window.py:L426 routine_name = routine_display_name(routine_dir)
 - gui_auto_trade_setting_window.py:L1319 routine_name = routine_display_name(routine_dir)
 - gui_auto_trade_setting_window.py:L1930 routine_name = routine_display_name(routine_dir)
 - gui_global_review_required_window.py:L45 routine_display_name,
 - gui_global_review_required_window.py:L67 routine_name = routine_display_name(routine_dir)
 - gui_main_table_loader.py:L43 routine_display_name,
 - gui_main_table_loader.py:L155 routine_name = routine_display_name(routine_dir)
 - gui_review_required_window.py:L79 def routine_display_name(routine_dir: Path) -> str:
 - gui_review_required_window.py:L403 routine_name = routine_display_name(routine_dir)
 - gui_routine_assign_window.py:L83 routine_display_name,
 - gui_routine_assign_window.py:L94 if routine_display_name(path) == routine_name:
 - gui_routine_assign_window.py:L622 display_name = routine_display_name(routine_dir)
 - gui_routine_assign_window.py:L880 routine_dir_by_name = {routine_display_name(path): path for path in get_routine_dirs()}
 - gui_routine_assign_window.py:L915 routine_dir_by_name = {routine_display_name(path): path for path in get_routine_dirs()}
 - gui_schedule_window.py:L248 def routine_display_name(routine_dir: Path) -> str:
 - gui_schedule_window.py:L554 return {routine_display_name(path): path for path in get_routine_dirs()}
 - gui_schedule_window.py:L827 routine_name = routine_display_name(routine_dir)
 - gui_schedule_window.py:L889 return routine_display_name(stock_dir.parent)
 - gui_schedule_window.py:L1714 display_name = routine_display_name(routine_dir)
 - gui_schedule_window.py:L1972 routine_dir_by_name = {routine_display_name(path): path for path in get_routine_dirs()}
 - gui_schedule_window.py:L2007 routine_dir_by_name = {routine_display_name(path): path for path in get_routine_dirs()}
 - gui_schedule_window.py:L2536 routine_name = routine_display_name(routine_dir)
 - gui_schedule_window.py:L3852 routine_name = routine_display_name(routine_dir)
 - gui_schedule_window.py:L5168 routine_name = routine_display_name(routine_dir)
 - gui_schedule_window.py:L5218 routine_name = routine_display_name(routine_dir)
 - gui_schedule_window.py:L5240 routine_name = routine_display_name(routine_dir)
 - gui_stock_register_window.py:L262 routine_display_name,
 - gui_stock_register_window.py:L354 routine_name = routine_display_name(routine_dir)
 - gui_windows.py:L66 routine_display_name,
 - gui_windows.py:L89 return {routine_display_name(path): path for path in get_routine_dirs()}
 - gui_windows.py:L348 return routine_display_name(stock_dir.parent)
 - gui_windows_149_manual_ats_status_policy_fix.py:L254 def routine_display_name(routine_dir: Path) -> str:
 - gui_windows_149_manual_ats_status_policy_fix.py:L607 return {routine_display_name(path): path for path in get_routine_dirs()}
 - gui_windows_149_manual_ats_status_policy_fix.py:L918 routine_name = routine_display_name(routine_dir)
 - gui_windows_149_manual_ats_status_policy_fix.py:L1278 routine_name = routine_display_name(routine_dir)
 - gui_windows_149_manual_ats_status_policy_fix.py:L1440 return routine_display_name(stock_dir.parent)
 - gui_windows_149_manual_ats_status_policy_fix.py:L2623 display_name = routine_display_name(routine_dir)
 - gui_windows_149_manual_ats_status_policy_fix.py:L2881 routine_dir_by_name = {routine_display_name(path): path for path in get_routine_dirs()}
 - gui_windows_149_manual_ats_status_policy_fix.py:L2916 routine_dir_by_name = {routine_display_name(path): path for path in get_routine_dirs()}
 - gui_windows_149_manual_ats_status_policy_fix.py:L4289 routine_name = routine_display_name(routine_dir)
 - gui_windows_149_manual_ats_status_policy_fix.py:L6620 routine_name = routine_display_name(routine_dir)
 - gui_windows_149_manual_ats_status_policy_fix.py:L8749 routine_name = routine_display_name(routine_dir)
 - gui_windows_149_manual_ats_status_policy_fix.py:L8799 routine_name = routine_display_name(routine_dir)
 - gui_windows_149_manual_ats_status_policy_fix.py:L8824 routine_name = routine_display_name(routine_dir)
 - ... 외 3건

[출처: routine_folder_liveness_report.txt | 기준일: 2026-06-02 | 수정시각: 2026-06-15 16:49:58 | 분류: 기타문서/자료]
## budget.json
- 참조 수: 35
 - docs/gui_windows(160).py:L13 - budget.json 이 있는 폴더만 루틴으로 인정
 - docs/gui_windows(160).py:L239 - budget.json 이 있는 폴더만 루틴으로 인정
 - docs/gui_windows(160).py:L247 and (path / "budget.json").exists()
 - docs/gui_windows(160).py:L1271 _ 로 시작하고 budget.json 이 있는 폴더만 루틴으로 인정한다.
 - docs/gui_windows(160).py:L1280 budget_path = routine_dir / "budget.json"
 - docs/gui_windows(160).py:L6804 budget = read_json_dict(routine_dir / "budget.json")
 - gui_auto_trade_setting_window.py:L332 - budget.json 이 있는 폴더만 루틴으로 인정
 - gui_auto_trade_setting_window.py:L340 and (path / "budget.json").exists()
 - gui_auto_trade_setting_window.py:L1320 budget = read_json_dict(routine_dir / "budget.json")
 - gui_integrity_check_window.py:L80 ("budget_json", "budget.json 검증"),
 - gui_main_table_loader.py:L144 """budget.json이 있는 루틴 폴더를 메인 좌측 루틴표에 표시한다.
 - gui_main_table_loader.py:L157 budget_path = routine_dir / "budget.json"
 - gui_review_required_window.py:L64 - budget.json 이 있는 폴더만 루틴으로 인정
 - gui_review_required_window.py:L72 and (path / "budget.json").exists()
 - gui_schedule_window.py:L13 - budget.json 이 있는 폴더만 루틴으로 인정
 - gui_schedule_window.py:L233 - budget.json 이 있는 폴더만 루틴으로 인정
 - gui_schedule_window.py:L241 and (path / "budget.json").exists()
 - gui_schedule_window.py:L820 _ 로 시작하고 budget.json 이 있는 폴더만 루틴으로 인정한다.
 - gui_schedule_window.py:L829 budget_path = routine_dir / "budget.json"
 - gui_schedule_window.py:L3853 budget = read_json_dict(routine_dir / "budget.json")
 - gui_stock_register_window.py:L13 - budget.json 이 있는 폴더만 루틴으로 인정
 - gui_windows.py:L13 - budget.json 이 있는 폴더만 루틴으로 인정
 - gui_windows_149_manual_ats_status_policy_fix.py:L13 - budget.json 이 있는 폴더만 루틴으로 인정
 - gui_windows_149_manual_ats_status_policy_fix.py:L239 - budget.json 이 있는 폴더만 루틴으로 인정
 - gui_windows_149_manual_ats_status_policy_fix.py:L247 and (path / "budget.json").exists()
 - gui_windows_149_manual_ats_status_policy_fix.py:L1271 _ 로 시작하고 budget.json 이 있는 폴더만 루틴으로 인정한다.
 - gui_windows_149_manual_ats_status_policy_fix.py:L1280 budget_path = routine_dir / "budget.json"
 - gui_windows_149_manual_ats_status_policy_fix.py:L6621 budget = read_json_dict(routine_dir / "budget.json")
 - integrity_checker.py:L115 and (path / "budget.json").exists()
 - integrity_checker.py:L276 f"_{routine_name}/budget.json 확인",
 - integrity_checker.py:L291 budget_path = routine_dir / "budget.json"
 - integrity_checker.py:L298 "budget.json 오류",
 - registry_migratio/stock_registry_step1_analyzer.py:L74 # 현재 프로젝트는 budget.json이 없는 등록확인폴더도 사실상 루틴/분류 폴더로 쓰인다.
 - stock_migration_to_central_stocks.py:L66 # budget.json이 있는 폴더를 루틴 폴더로 본다.
 - stock_migration_to_central_stocks.py:L67 return (path / "budget.json").exists()

5. 중앙 종목 폴더 구조
==================
[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
1. gui_auto_trade_timer.auto_trade_signal_probe_only_active(window)가 false로 나왔습니다. 
 즉, 중앙 stocks/003550_LG/state.json은 signal_probe_only=true였지만 timer 쪽 감지 로직은 이를 못 봅니다.

[출처: 05_운영정책_테스트체크리스트_v2026-06-16_종목폴더통합_검토관리_최신갱신.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-16 17:45:20 | 분류: 갱신문서]
종목관리 용어:
- 종목 등록: 중앙 stocks/ 종목관리 라이브러리에 종목을 추가한다.
- 종목 삭제: 중앙 stocks/ 종목관리 라이브러리에서 종목을 제거하거나 archive로 이동한다.
- “등록해제”라는 표현은 종목관리 문맥에서 사용하지 않는다.

[출처: 05_운영정책_테스트체크리스트_v2026-06-16_종목폴더통합_검토관리_최신갱신.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-16 17:45:20 | 분류: 갱신문서]
이번 창에서 생성/적용된 주요 패치 파일:
- gui_search_stock_register_dialog.py
 - 수동등록창 헤더 정렬
 - 우클릭 메뉴
- gui_stock_register_window.py
 - 중앙 stocks 기준 종목 삭제/용어 정리
- gui_force_unregister_dialog.py
 - 종목 삭제 표현 및 한 줄 사유 표시
- gui_routine_assign_window.py
 - 루틴 지정 시 구형 루틴폴더 종목폴더 생성 방지
 - 선택 루틴 연결 종목 하단 표시를 중앙 stocks 기준으로 변경
- gui_review_required_window.py
 - 검토관리창 중앙 stocks 기준 표시
 - load_review_items 직접 중앙 수집
- gui_global_review_required_window.py
 - 검토관리창 중앙 stocks 기준 표시
 - load_review_items 직접 중앙 수집
- archive_legacy_routine_stock_dirs.py
 - 루틴폴더 내부 과거 종목폴더 archive 이동 도구
- reset_all_stock_state.py
 - 전체 종목 상태 리셋 도구
10. 다음 창 우선순위
다음 창에서 바로 할 일:

[출처: 05_운영정책_테스트체크리스트_v2026-06-16_종목폴더통합_검토관리_최신갱신.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-16 17:45:20 | 분류: 갱신문서]
[STK-04] 종목 삭제 차단 사유 한 줄 표시
조건:
- 검토종목 또는 루틴 연결 종목 삭제 시도.
예상:
- 코드 / 종목명 / 루틴명 / 차단사유 형식으로 표시.
- “사유 포함” 같은 중복 헤더는 사용하지 않음.

[출처: 04_프로젝트현재상태보고서_v2026-06-16_종목폴더통합_검토관리_최신갱신.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-16 17:45:10 | 분류: 갱신문서]
- gui_base_stock_service.py
 기초종목/라이브러리/종목코드 검증/루틴 연결 기초 함수.

[출처: README_적용내용(27).txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 19:41:08 | 분류: 기타문서/자료]
# 검토관리창 중앙 stocks 기준 조회 패치

[출처: README_적용내용(27).txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 19:41:08 | 분류: 기타문서/자료]
확인:
1. 파일 교체
2. SK하이닉스 등 임의 종목 state.json에 보유/평단 또는 review_required 상태 생성
3. 프로그램 실행
4. 검토관리 버튼 클릭
5. 검토종목이 0건이 아니라 표시되는지 확인

[출처: README_적용내용(26).txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 19:20:46 | 분류: 기타문서/자료]
# 매매루틴지정창 하단 정보 중앙 stocks 기준 표시 패치
적용 파일:
- gui_routine_assign_window.py

[출처: routine_folder_recreation_analysis_report.txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 18:19:20 | 분류: 기타문서/자료]
중앙 stocks/ 구조에서는 종목당 현재 활성 루틴 1개와 중앙 stocks/종목 폴더만 반환한다.
 중앙 구조가 없을 때만 기존 기초종목.txt + 루틴폴더 방식을 fallback으로 사용한다.
 """
 found, routines = base_stock_routines_for_stock(code, name)
 if not found:
 return []

[출처: kiwoom32_cleanup_analysis_report.txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 16:32:54 | 분류: 기타문서/자료]
D. 유지 필요
- stocks/
- archived_stocks/
- stock_repository.py
- stock_library.json
- global_schedule.json
- operation_policy.json
- review_required.json
- screen_registry.json
- reports/
- PROJECT_CHANGELOG.txt
4. 코드 잔여 참조 분석
- 구 구조 관련 문자열 발견 파일 수: 25개

[출처: kiwoom32_cleanup_analysis_report.txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 16:32:54 | 분류: 기타문서/자료]
## gui_auto_trade_setting_window.py
- L146: read_base_stocks,
- L350: 예: _MACD매매루틴 -> MACD매매루틴
- L1894: 기초종목.txt 기준 종목-루틴 연결 정보를 반환한다.
- L1897: 기초종목.txt 에 실제 연결된 종목만 표시한다.
- L1900: for stock in read_base_stocks():
- L1917: 기초종목.txt 기준으로 종목이 해당 루틴에 연결되어 있는지 확인한다.
- L1927: 루틴 폴더 안에 물리 폴더가 남아 있어도 기초종목.txt 에 연결 정보가 없으면

[출처: kiwoom32_cleanup_analysis_report.txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 16:32:54 | 분류: 기타문서/자료]
## gui_auto_trade_unregister.py
- L45: BASE_STOCK_PATH = PROJECT_ROOT / "기초종목.txt"
- L82: 중앙 종목관리 개편 이후 이 파일 안에서 기초종목.txt를 직접 수정하지 않는다.
- L85: - 아직 stocks/가 없으면 기존 기초종목.txt fallback
- L309: - 기초종목.txt의 루틴 연결만 제거한다. 종목 자체는 기초종목에 남긴다.
- L400: QMessageBox.information(window, "등록해제 없음", "기초종목.txt에서 등록해제할 종목을 찾지 못했습니다.")

[출처: kiwoom32_cleanup_analysis_report.txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 16:32:54 | 분류: 기타문서/자료]
## gui_base_stock_service.py
- L29: BASE_STOCK_PATH = PROJECT_ROOT / "기초종목.txt"
- L113: 기초종목.txt 에 이미 저장된 종목 1행의 표시용 검증 상태를 반환한다.
- L149: 기초종목.txt 활성 루틴은 종목당 1개만 허용한다.
- L152: 활성 연결은 기초종목.txt의 첫 번째 유효 루틴 1개만 사용한다.
- L166: 과거 기초종목.txt 단일 루틴 보정 함수.
- L178: 1차 안전장치: stocks/ 종목폴더가 없으면 기존 기초종목.txt 로직을 유지한다.
- L188: def _read_base_stocks_from_central_repository_if_available() -> list[dict[str, object]] | None:
- L195: return stock_repository_factory().read_base_stocks_compatible()
- L210: - None: 중앙 repository 미사용, 기존 기초종목.txt fallback 필요
- L220: def read_base_stocks() -> list[dict[str, object]]:
- L225: - 기초종목.txt를 운영 기준으로 사용하지 않는다.
- L228: central_stocks = _read_base_stocks_from_central_repository_if_available()
- L238: 기초종목.txt에 연결된 각 종목마다 실주문 루틴이 최대 1개가 되도록 정리한다.
- L240: for stock in read_base_stocks():
- L252: - 기초종목.txt를 갱신하지 않는다.

[출처: kiwoom32_cleanup_analysis_report.txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 16:32:54 | 분류: 기타문서/자료]
## gui_global_review_required_window.py
- L51: BASE_STOCK_PATH = PROJECT_ROOT / "기초종목.txt"
- L480: append_changelog("UPDATE", "기초종목.txt/state.json", f"검토관리 미지정 전환: {changed}개")
- L524: if BASE_STOCK_PATH.exists():
- L526: for raw_line in BASE_STOCK_PATH.read_text(encoding="utf-8").splitlines():
- L532: BASE_STOCK_PATH.write_text(
- L554: append_changelog("DELETE", "기초종목.txt/runtime", f"검토관리 종목 삭제: {deleted}개")

[출처: kiwoom32_cleanup_analysis_report.txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 16:32:54 | 분류: 기타문서/자료]
## gui_integrity_check_window.py
- L38: BASE_STOCK_PATH = PROJECT_ROOT / "기초종목.txt"
- L72: ("base_duplicate", "기초종목.txt 중복 검증"),
- L193: BASE_STOCK_PATH,

[출처: kiwoom32_cleanup_analysis_report.txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 16:32:54 | 분류: 기타문서/자료]
## gui_main_table_loader.py
- L45: from gui_base_stock_service import read_base_stocks
- L97: read_base_stocks() 표준 반환값에서 종목의 루틴명 목록을 추출한다.
- L110: def _routine_stock_counts_from_base_stocks() -> dict[str, int]:
- L120: for stock in read_base_stocks():
- L147: 중앙 종목관리(read_base_stocks -> stocks/config.json) 기준으로 계산한다.
- L150: routine_counts = _routine_stock_counts_from_base_stocks()
- L204: for stock in read_base_stocks():

[출처: kiwoom32_cleanup_analysis_report.txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 16:32:54 | 분류: 기타문서/자료]
## gui_routine_assign_window.py
- L82: read_base_stocks,
- L202: - 기초종목.txt 등록 종목 중 루틴 변경이 가능한 종목만 좌측에 표시한다.
- L508: stocks = read_base_stocks()
- L656: stocks = read_base_stocks()
- L940: stocks = read_base_stocks()
- L1223: skipped_items.append(f"{code} {name}: 기초종목.txt 갱신 실패")
- L1251: "기초종목.txt",
- L1318: for stock in read_base_stocks()
- L1328: skipped_items.append(f"{code} {name}: 기초종목.txt에서 종목을 찾지 못했습니다.")
- L1368: skipped_items.append(f"{code} {name}: 기초종목.txt에서 종목을 찾지 못했습니다.")
- L1379: skipped_items.append(f"{code} {name}: 기초종목.txt 갱신 실패")
- L1390: "기초종목.txt",

[출처: kiwoom32_cleanup_analysis_report.txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 16:32:54 | 분류: 기타문서/자료]
## gui_search_stock_register_dialog.py
- L35: read_base_stocks,
- L180: base_stocks = read_base_stocks()
- L181: existing_codes = {str(stock.get("code", "")).strip() for stock in base_stocks}
- L182: existing_names = {str(stock.get("name", "")).strip() for stock in base_stocks}
- L266: base_stocks = read_base_stocks()
- L269: for stock in base_stocks
- L274: for stock in base_stocks

[출처: kiwoom32_cleanup_analysis_report.txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 16:32:54 | 분류: 기타문서/자료]
## gui_stock_data.py
- L26: BASE_STOCK_PATH = PROJECT_ROOT / "기초종목.txt"
- L99: 기초종목.txt 활성 루틴은 종목당 1개만 허용한다.
- L119: 기초종목.txt 에 저장된 종목 1행의 표시용 검증 상태를 반환한다.
- L150: def _read_base_stocks_from_central_repository_if_available() -> list[dict[str, object]] | None:
- L156: - 그러면 기존 기초종목.txt 로직이 그대로 동작한다.
- L166: return repo.read_base_stocks_compatible()
- L195: - None: 중앙 repository 미사용, 기존 기초종목.txt fallback 필요
- L219: - 과거에는 기초종목.txt에 종목을 추가했다.
- L266: def read_base_stocks() -> list[dict[str, object]]:
- L271: - 기초종목.txt를 운영 기준으로 사용하지 않는다.
- L274: central_stocks = _read_base_stocks_from_central_repository_if_available()
- L282: """기초종목.txt 한 줄에서 첫 번째 활성 루틴명을 반환한다."""
- L357: 중앙 구조가 없을 때만 기존 기초종목.txt + 루틴폴더 방식을 fallback으로 사용한다.

[출처: kiwoom32_cleanup_analysis_report.txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 16:32:54 | 분류: 기타문서/자료]
## gui_stock_register_window.py
- L256: read_base_stocks,
- L726: selected_count = len(self.selected_registered_stocks())
- L768: selected_stocks = self.selected_registered_stocks()
- L887: selected_stocks = self.selected_registered_stocks()
- L1209: def selected_registered_stocks(self) -> list[tuple[str, str]]:
- L1234: stocks = read_base_stocks()
- L1384: selected_stocks = self.selected_registered_stocks()
- L1425: stocks = read_base_stocks()

[출처: kiwoom32_cleanup_analysis_report.txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 16:32:54 | 분류: 기타문서/자료]
## integrity_checker.py
- L66: def read_base_stocks_for_check(base_stock_path: Path) -> list[dict[str, object]]:
- L176: base_stocks = read_base_stocks_for_check(base_stock_path)
- L185: for stock in base_stocks:
- L195: f"기초종목.txt {line_no}행",
- L207: f"기초종목.txt {line_no}행",
- L219: f"기초종목.txt {line_no}행",
- L231: f"기초종목.txt {line_no}행",
- L242: f"기초종목.txt {line_no}행",
- L253: f"기초종목.txt {line_no}행",
- L262: f"기초종목.txt {line_no}행",
- L274: f"기초종목.txt {line_no}행",
- L282: for stock in base_stocks

[출처: kiwoom32_cleanup_analysis_report.txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 16:32:54 | 분류: 기타문서/자료]
## stock_migration_to_central_stocks.py
- L16: - 기존 기초종목.txt도 삭제하지 않는다.
- L272: lines.append("기초종목.txt 삭제: 안 함")

[출처: kiwoom32_cleanup_analysis_report.txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 16:32:54 | 분류: 기타문서/자료]
## stock_repository.py
- L8: - 기초종목.txt 제거와 stocks/ 중앙 종목폴더 일원화를 위한 단일 접근 레이어.
- L9: - 1차 적용에서는 기존 기능을 깨지 않기 위해 gui_stock_data.read_base_stocks()가
- L179: def read_base_stocks_compatible(self) -> list[dict[str, Any]]:
- L291: def read_base_stocks_from_repository() -> list[dict[str, Any]]:
- L292: return repository().read_base_stocks_compatible()

[출처: kiwoom32_cleanup_analysis_report.txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 16:32:54 | 분류: 기타문서/자료]
## registry_migratio/stock_repository.py
- L8: - 기초종목.txt 의존을 줄이고, 최종적으로 stocks/ 중앙 종목폴더 구조로 이동하기 위한
- L45: BASE_STOCK_PATH = PROJECT_ROOT / "기초종목.txt"
- L115: 기존 read_base_stocks() 사용처와 호환되는 형태.
- L135: - 아직 마이그레이션 전이면 기초종목.txt를 fallback으로 읽을 수 있게 한다.
- L142: self.base_stock_path = self.project_root / "기초종목.txt"
- L206: 기존 기초종목.txt fallback reader.
- L248: 중앙 stocks/ 우선, 없으면 기존 기초종목.txt fallback.
- L255: def read_base_stocks_compatible(self) -> list[dict[str, Any]]:
- L257: 기존 read_base_stocks() 대체용 호환 반환.
- L332: def read_base_stocks_from_repository() -> list[dict[str, Any]]:
- L334: 기존 read_base_stocks() 교체 후보 함수.
- L337: return repository().read_base_stocks_compatible()

[출처: terminology_scan_report.txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 15:56:08 | 분류: 기타문서/자료]
확정 용어
- 종목 등록: 중앙 종목관리(stocks)에 종목을 추가
- 종목 삭제: 중앙 종목관리(stocks)에서 제거/archive 이동
- 루틴 지정: 종목과 매매루틴을 연결
- 루틴 해제: 종목과 매매루틴 연결을 제거
- 검토관리 이동/복귀: 상태관리 영역

[출처: terminology_scan_report.txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 15:56:08 | 분류: 기타문서/자료]
1차 패치 대상
- gui_stock_register_window.py: 종목관리 창의 등록해제 표현 → 종목 삭제 표현
- gui_force_unregister_dialog.py: 종목 삭제 확인창의 등록해제 표현 → 삭제 표현
- gui_search_stock_register_dialog.py: changelog 문구 중앙 종목관리 유지 확인

[출처: 용어정리_분석보고서.txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 15:23:34 | 분류: 구현로그/검증보고]
용어 정리 분석 결과
현재 문제
---------
'등록해제'라는 단어가 서로 다른 의미로 사용되고 있음.
1. 종목관리(stocks)
- 종목 등록
- 종목 삭제(archive 이동)
2. 루틴관리
- 루틴 지정
- 루틴 해제

[출처: README_적용내용(21).txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 15:13:20 | 분류: 기타문서/자료]
# gui_stock_register_window.py 중앙 stocks 정리 패치
적용 파일:
- gui_stock_register_window.py

[출처: README_적용내용(21).txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 15:13:20 | 분류: 기타문서/자료]
수정 내용:
1. 파일 상단에 남아 있던 잘못된 `BASE_STOCK_PATH = PROJECT_ROOT / "중앙 종목관리"` 상수를 제거했습니다.
2. 선택 종목 삭제는 중앙 stocks/종목폴더 기준으로 처리합니다.
3. 삭제 대상은 완전 삭제하지 않고 `archived_stocks/`로 이동합니다.
4. 삭제 전 루틴 연결 필드는 비웁니다.
5. 처리불가 종목은 기존처럼 리포트에 남깁니다.
6. 창 제목/문구는 중앙 종목관리 기준을 유지합니다.

[출처: kiwoom29_dependency_analysis_report.txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 14:58:42 | 분류: 기타문서/자료]
## 즉시 수정 우선
- gui_stock_register_window.py: BASE_STOCK_PATH:1, read_base_stocks:3, update_base_stock_routines:2, stock_runtime_dir_for_routine:3, assigned_runtime_dirs_for_stock:2, get_routine_dirs:2
- gui_review_required_window.py: 기초종목.txt:4, BASE_STOCK_PATH:7, update_base_stock_routines:2, get_routine_dirs:3, iterdir():2
- gui_global_review_required_window.py: 기초종목.txt:3, BASE_STOCK_PATH:4, update_base_stock_routines:2, get_routine_dirs:3
- gui_integrity_check_window.py: 기초종목.txt:2, BASE_STOCK_PATH:2
- gui_auto_trade_unregister.py: 기초종목.txt:5, BASE_STOCK_PATH:1, update_base_stock_routines:6
- gui_routine_policy.py: 기초종목.txt:2, stock_runtime_dir_for_routine:2
- gui_windows.py: 기초종목.txt:2, BASE_STOCK_PATH:4, append_base_stock:1, get_routine_dirs:3

[출처: kiwoom29_dependency_analysis_report.txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 14:58:42 | 분류: 기타문서/자료]
## 중앙화 완료/문구정리 중심
- gui_base_stock_service.py: 기초종목.txt:10, BASE_STOCK_PATH:1, read_base_stocks:5, update_base_stock_routines:3
- gui_stock_data.py: 기초종목.txt:9, BASE_STOCK_PATH:1, append_base_stock:1, remove_base_stock:1, read_base_stocks:4, stock_runtime_dir_for_routine:2, assigned_runtime_dirs_for_stock:1
- stock_repository.py: 기초종목.txt:1, read_base_stocks:4, update_base_stock_routines:2, iterdir():2
- gui_main_table_loader.py: read_base_stocks:5, stock_runtime_dir_for_routine:3, get_routine_dirs:2
- gui_search_stock_register_dialog.py: append_base_stock:2, read_base_stocks:3
- gui_routine_assign_window.py: 기초종목.txt:7, read_base_stocks:5, update_base_stock_routines:3, get_routine_dirs:5
- gui_auto_trade_setting_window.py: 기초종목.txt:4, read_base_stocks:2, update_base_stock_routines:1, stock_runtime_dir_for_routine:1, get_routine_dirs:3, iterdir():1

[출처: kiwoom29_dependency_analysis_report.txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 14:58:42 | 분류: 기타문서/자료]
## 실행 경로 확인 후 보류
- gui_schedule_window.py: 기초종목.txt:36, BASE_STOCK_PATH:13, append_base_stock:1, read_base_stocks:9, update_base_stock_routines:5, stock_runtime_dir_for_routine:3, get_routine_dirs:13, iterdir():3
- gui_windows_149_manual_ats_status_policy_fix.py: 기초종목.txt:38, BASE_STOCK_PATH:16, append_base_stock:1, read_base_stocks:10, update_base_stock_routines:6, stock_runtime_dir_for_routine:4, get_routine_dirs:14, iterdir():3
- docs/gui_windows(160).py: 기초종목.txt:38, BASE_STOCK_PATH:16, append_base_stock:1, read_base_stocks:10, update_base_stock_routines:6, stock_runtime_dir_for_routine:4, get_routine_dirs:14, iterdir():3
- registry_migratio/stock_repository.py: 기초종목.txt:6, BASE_STOCK_PATH:1, read_base_stocks:6, stock_runtime_dir_for_routine:1, iterdir():2
- registry_migratio/stock_migration_dry_run.py: iterdir():2
- registry_migratio/stock_registry_step1_analyzer.py: 기초종목.txt:3, read_base_stocks:2, iterdir():3

[출처: kiwoom29_dependency_analysis_report.txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 14:58:42 | 분류: 기타문서/자료]
### docs/gui_windows(160).py
발견: 기초종목.txt:38, BASE_STOCK_PATH:16, append_base_stock:1, read_base_stocks:10, update_base_stock_routines:6, stock_runtime_dir_for_routine:4, get_routine_dirs:14, iterdir():3
L74: stock_runtime_dir_for_routine,
L176: BASE_STOCK_PATH = PROJECT_ROOT / "기초종목.txt"
L231: def get_routine_dirs() -> list[Path]:
L242: path for path in PROJECT_ROOT.iterdir()
L440: 기초종목.txt 에 이미 저장된 종목 1행의 표시용 검증 상태를 반환한다.
L477: 기초종목.txt 활성 루틴은 종목당 1개만 허용한다.
L480: 활성 연결은 기초종목.txt의 첫 번째 유효 루틴 1개만 사용한다.
L494: 기존 기초종목.txt에 루틴이 여러 개 저장되어 있으면 첫 번째 루틴만 남긴다.
L499: - 자동매매설정 창은 기초종목.txt의 단일 루틴 연결만 표시한다.
L501: if not BASE_STOCK_PATH.exists():
...외 80개

[출처: kiwoom29_dependency_analysis_report.txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 14:58:42 | 분류: 기타문서/자료]
### gui_auto_trade_setting_window.py
발견: 기초종목.txt:4, read_base_stocks:2, update_base_stock_routines:1, stock_runtime_dir_for_routine:1, get_routine_dirs:3, iterdir():1
L61: from gui_stock_data import active_routine_for_stock, stock_runtime_dir_for_routine
L146: read_base_stocks,
L148: update_base_stock_routines,
L324: def get_routine_dirs() -> list[Path]:
L335: path for path in PROJECT_ROOT.iterdir()
L425: for routine_dir in get_routine_dirs():
L1314: routine_dirs = get_routine_dirs()
L1894: 기초종목.txt 기준 종목-루틴 연결 정보를 반환한다.
L1897: 기초종목.txt 에 실제 연결된 종목만 표시한다.
L1900: for stock in read_base_stocks():
...외 2개

[출처: kiwoom29_dependency_analysis_report.txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 14:58:42 | 분류: 기타문서/자료]
### gui_auto_trade_unregister.py
발견: 기초종목.txt:5, BASE_STOCK_PATH:1, update_base_stock_routines:6
L42: from gui_base_stock_service import update_base_stock_routines as update_base_stock_routines_from_service
L45: BASE_STOCK_PATH = PROJECT_ROOT / "기초종목.txt"
L78: def update_base_stock_routines(code: str, name: str, routines: list[str]) -> bool:
L82: 중앙 종목관리 개편 이후 이 파일 안에서 기초종목.txt를 직접 수정하지 않는다.
L83: gui_base_stock_service.update_base_stock_routines()로 위임하여
L85: - 아직 stocks/가 없으면 기존 기초종목.txt fallback
L88: return bool(update_base_stock_routines_from_service(code, name, routines))
L309: - 기초종목.txt의 루틴 연결만 제거한다. 종목 자체는 기초종목에 남긴다.
L383: if update_base_stock_routines(code, name, []):
L400: QMessageBox.information(window, "등록해제 없음", "기초종목.txt에서 등록해제할 종목을 찾지 못했습니다.")

[출처: kiwoom29_dependency_analysis_report.txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 14:58:42 | 분류: 기타문서/자료]
### gui_base_stock_service.py
발견: 기초종목.txt:10, BASE_STOCK_PATH:1, read_base_stocks:5, update_base_stock_routines:3
L29: BASE_STOCK_PATH = PROJECT_ROOT / "기초종목.txt"
L113: 기초종목.txt 에 이미 저장된 종목 1행의 표시용 검증 상태를 반환한다.
L149: 기초종목.txt 활성 루틴은 종목당 1개만 허용한다.
L152: 활성 연결은 기초종목.txt의 첫 번째 유효 루틴 1개만 사용한다.
L166: 과거 기초종목.txt 단일 루틴 보정 함수.
L178: 1차 안전장치: stocks/ 종목폴더가 없으면 기존 기초종목.txt 로직을 유지한다.
L188: def _read_base_stocks_from_central_repository_if_available() -> list[dict[str, object]] | None:
L195: return stock_repository_factory().read_base_stocks_compatible()
L200: def _update_base_stock_routines_in_central_repository_if_available(
L210: - None: 중앙 repository 미사용, 기존 기초종목.txt fallback 필요
...외 8개

[출처: kiwoom29_dependency_analysis_report.txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 14:58:42 | 분류: 기타문서/자료]
### gui_global_review_required_window.py
발견: 기초종목.txt:3, BASE_STOCK_PATH:4, update_base_stock_routines:2, get_routine_dirs:3
L40: get_routine_dirs,
L46: update_base_stock_routines,
L51: BASE_STOCK_PATH = PROJECT_ROOT / "기초종목.txt"
L66: for routine_dir in get_routine_dirs():
L469: update_base_stock_routines(code, name, [])
L480: append_changelog("UPDATE", "기초종목.txt/state.json", f"검토관리 미지정 전환: {changed}개")
L524: if BASE_STOCK_PATH.exists():
L526: for raw_line in BASE_STOCK_PATH.read_text(encoding="utf-8").splitlines():
L532: BASE_STOCK_PATH.write_text(
L541: for routine_dir in get_routine_dirs():
...외 1개

[출처: kiwoom29_dependency_analysis_report.txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 14:58:42 | 분류: 기타문서/자료]
### gui_integrity_check_window.py
발견: 기초종목.txt:2, BASE_STOCK_PATH:2
L38: BASE_STOCK_PATH = PROJECT_ROOT / "기초종목.txt"
L72: ("base_duplicate", "기초종목.txt 중복 검증"),
L193: BASE_STOCK_PATH,

[출처: kiwoom29_dependency_analysis_report.txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 14:58:42 | 분류: 기타문서/자료]
### gui_main_table_loader.py
발견: read_base_stocks:5, stock_runtime_dir_for_routine:3, get_routine_dirs:2
L24: from gui_stock_data import stock_runtime_dir_for_routine
L41: get_routine_dirs,
L45: from gui_base_stock_service import read_base_stocks
L97: read_base_stocks() 표준 반환값에서 종목의 루틴명 목록을 추출한다.
L120: for stock in read_base_stocks():
L130: stock_dir = stock_runtime_dir_for_routine(routine_name, code, name)
L147: 중앙 종목관리(read_base_stocks -> stocks/config.json) 기준으로 계산한다.
L149: routine_dirs = get_routine_dirs()
L204: for stock in read_base_stocks():
L218: stock_dir = stock_runtime_dir_for_routine(routine_name, code, name)

[출처: kiwoom29_dependency_analysis_report.txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 14:58:42 | 분류: 기타문서/자료]
### gui_review_required_window.py
발견: 기초종목.txt:4, BASE_STOCK_PATH:7, update_base_stock_routines:2, get_routine_dirs:3, iterdir():2
L52: BASE_STOCK_PATH = PROJECT_ROOT / "기초종목.txt"
L56: def get_routine_dirs() -> list[Path]:
L67: path for path in PROJECT_ROOT.iterdir()
L177: def update_base_stock_routines(code: str, name: str, routines: list[str]) -> bool:
L179: 기초종목.txt 의 특정 종목 행에 루틴 목록을 반영한다.
L181: if not BASE_STOCK_PATH.exists():
L184: lines = BASE_STOCK_PATH.read_text(encoding="utf-8").splitlines()
L206: BASE_STOCK_PATH.write_text(
L229: child for child in routine_dir.iterdir()
L402: for routine_dir in get_routine_dirs():
...외 7개

[출처: kiwoom29_dependency_analysis_report.txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 14:58:42 | 분류: 기타문서/자료]
### gui_routine_assign_window.py
발견: 기초종목.txt:7, read_base_stocks:5, update_base_stock_routines:3, get_routine_dirs:5
L79: get_routine_dirs,
L82: read_base_stocks,
L84: update_base_stock_routines,
L93: for path in get_routine_dirs():
L202: - 기초종목.txt 등록 종목 중 루틴 변경이 가능한 종목만 좌측에 표시한다.
L508: stocks = read_base_stocks()
L612: routine_dirs = get_routine_dirs()
L656: stocks = read_base_stocks()
L880: routine_dir_by_name = {routine_display_name(path): path for path in get_routine_dirs()}
L915: routine_dir_by_name = {routine_display_name(path): path for path in get_routine_dirs()}
...외 10개

[출처: kiwoom29_dependency_analysis_report.txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 14:58:42 | 분류: 기타문서/자료]
### gui_routine_policy.py
발견: 기초종목.txt:2, stock_runtime_dir_for_routine:2
L12: from gui_stock_data import base_stock_routines_for_stock, stock_runtime_dir_for_routine
L98: 루틴 해제는 종목 자체는 유지하고 기초종목.txt의 루틴명만 제거한다.
L103: return False, "", ["기초종목.txt에서 종목을 찾지 못했습니다."]
L109: stock_dir = stock_runtime_dir_for_routine(routine_name, code, name)

[출처: kiwoom29_dependency_analysis_report.txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 14:58:42 | 분류: 기타문서/자료]
### gui_schedule_window.py
발견: 기초종목.txt:36, BASE_STOCK_PATH:13, append_base_stock:1, read_base_stocks:9, update_base_stock_routines:5, stock_runtime_dir_for_routine:3, get_routine_dirs:13, iterdir():3
L72: stock_runtime_dir_for_routine,
L171: BASE_STOCK_PATH = PROJECT_ROOT / "기초종목.txt"
L225: def get_routine_dirs() -> list[Path]:
L236: path for path in PROJECT_ROOT.iterdir()
L387: 기초종목.txt 에 이미 저장된 종목 1행의 표시용 검증 상태를 반환한다.
L424: 기초종목.txt 활성 루틴은 종목당 1개만 허용한다.
L427: 활성 연결은 기초종목.txt의 첫 번째 유효 루틴 1개만 사용한다.
L441: 기존 기초종목.txt에 루틴이 여러 개 저장되어 있으면 첫 번째 루틴만 남긴다.
L446: - 자동매매설정 창은 기초종목.txt의 단일 루틴 연결만 표시한다.
L448: if not BASE_STOCK_PATH.exists():
...외 71개

[출처: kiwoom29_dependency_analysis_report.txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 14:58:42 | 분류: 기타문서/자료]
### gui_search_stock_register_dialog.py
발견: append_base_stock:2, read_base_stocks:3
L31: append_base_stock,
L35: read_base_stocks,
L180: base_stocks = read_base_stocks()
L266: base_stocks = read_base_stocks()
L312: append_base_stock(code, name)

[출처: kiwoom29_dependency_analysis_report.txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 14:58:42 | 분류: 기타문서/자료]
### gui_stock_data.py
발견: 기초종목.txt:9, BASE_STOCK_PATH:1, append_base_stock:1, remove_base_stock:1, read_base_stocks:4, stock_runtime_dir_for_routine:2, assigned_runtime_dirs_for_stock:1
L26: BASE_STOCK_PATH = PROJECT_ROOT / "기초종목.txt"
L99: 기초종목.txt 활성 루틴은 종목당 1개만 허용한다.
L119: 기초종목.txt 에 저장된 종목 1행의 표시용 검증 상태를 반환한다.
L150: def _read_base_stocks_from_central_repository_if_available() -> list[dict[str, object]] | None:
L156: - 그러면 기존 기초종목.txt 로직이 그대로 동작한다.
L166: return repo.read_base_stocks_compatible()
L195: - None: 중앙 repository 미사용, 기존 기초종목.txt fallback 필요
L214: def append_base_stock(code: str, name: str) -> bool:
L219: - 과거에는 기초종목.txt에 종목을 추가했다.
L240: def remove_base_stock(code: str, name: str) -> bool:
...외 8개

[출처: kiwoom29_dependency_analysis_report.txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 14:58:42 | 분류: 기타문서/자료]
### gui_stock_register_window.py
발견: BASE_STOCK_PATH:1, read_base_stocks:3, update_base_stock_routines:2, stock_runtime_dir_for_routine:3, assigned_runtime_dirs_for_stock:2, get_routine_dirs:2
L75: assigned_runtime_dirs_for_stock,
L76: stock_runtime_dir_for_routine,
L243: get_routine_dirs,
L256: read_base_stocks,
L266: update_base_stock_routines,
L273: BASE_STOCK_PATH = PROJECT_ROOT / "중앙 종목관리"
L324: stock_dir = stock_runtime_dir_for_routine(routine_name, code, name)
L353: for routine_dir in get_routine_dirs():
L376: return assigned_runtime_dirs_for_stock(code, name)
L576: stock_dir = stock_runtime_dir_for_routine(routine_name, code, name)
...외 3개

[출처: kiwoom29_dependency_analysis_report.txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 14:58:42 | 분류: 기타문서/자료]
### gui_windows_149_manual_ats_status_policy_fix.py
발견: 기초종목.txt:38, BASE_STOCK_PATH:16, append_base_stock:1, read_base_stocks:10, update_base_stock_routines:6, stock_runtime_dir_for_routine:4, get_routine_dirs:14, iterdir():3
L74: stock_runtime_dir_for_routine,
L176: BASE_STOCK_PATH = PROJECT_ROOT / "기초종목.txt"
L231: def get_routine_dirs() -> list[Path]:
L242: path for path in PROJECT_ROOT.iterdir()
L440: 기초종목.txt 에 이미 저장된 종목 1행의 표시용 검증 상태를 반환한다.
L477: 기초종목.txt 활성 루틴은 종목당 1개만 허용한다.
L480: 활성 연결은 기초종목.txt의 첫 번째 유효 루틴 1개만 사용한다.
L494: 기존 기초종목.txt에 루틴이 여러 개 저장되어 있으면 첫 번째 루틴만 남긴다.
L499: - 자동매매설정 창은 기초종목.txt의 단일 루틴 연결만 표시한다.
L501: if not BASE_STOCK_PATH.exists():
...외 80개

[출처: kiwoom29_dependency_analysis_report.txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 14:58:42 | 분류: 기타문서/자료]
### integrity_checker.py
발견: 기초종목.txt:8, read_base_stocks:2, get_routine_dirs:2, iterdir():2
L66: def read_base_stocks_for_check(base_stock_path: Path) -> list[dict[str, object]]:
L108: def get_routine_dirs(project_root: Path) -> list[Path]:
L110: path for path in project_root.iterdir()
L176: base_stocks = read_base_stocks_for_check(base_stock_path)
L179: routine_dirs = get_routine_dirs(project_root)
L195: f"기초종목.txt {line_no}행",
L207: f"기초종목.txt {line_no}행",
L219: f"기초종목.txt {line_no}행",
L231: f"기초종목.txt {line_no}행",
L242: f"기초종목.txt {line_no}행",
...외 4개

[출처: kiwoom29_dependency_analysis_report.txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 14:58:42 | 분류: 기타문서/자료]
### registry_migratio/stock_registry_step1_analyzer.py
발견: 기초종목.txt:3, read_base_stocks:2, iterdir():3
L7: - 기초종목.txt, 루틴폴더의 종목폴더, state/config/orders/logs 존재 여부를 수집한다.
L28: BASE_STOCK_FILENAMES = ["기초종목.txt", "기초종목등록.txt"]
L76: return any(child.is_dir() and STOCK_DIR_PATTERN.match(child.name) for child in path.iterdir())
L94: def read_base_stocks(root: Path) -> dict[str, dict[str, str]]:
L126: for routine_dir in sorted([p for p in root.iterdir() if is_routine_folder(p)]):
L128: for stock_dir in sorted([p for p in routine_dir.iterdir() if p.is_dir()]):
L176: base_stocks = read_base_stocks(root)
L269: lines.append("4. 아직 종목폴더 이동 또는 기초종목.txt 삭제는 하지 않는다.")

[출처: kiwoom29_dependency_analysis_report.txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 14:58:42 | 분류: 기타문서/자료]
### registry_migratio/stock_repository.py
발견: 기초종목.txt:6, BASE_STOCK_PATH:1, read_base_stocks:6, stock_runtime_dir_for_routine:1, iterdir():2
L8: - 기초종목.txt 의존을 줄이고, 최종적으로 stocks/ 중앙 종목폴더 구조로 이동하기 위한
L45: BASE_STOCK_PATH = PROJECT_ROOT / "기초종목.txt"
L115: 기존 read_base_stocks() 사용처와 호환되는 형태.
L135: - 아직 마이그레이션 전이면 기초종목.txt를 fallback으로 읽을 수 있게 한다.
L142: self.base_stock_path = self.project_root / "기초종목.txt"
L145: return self.stocks_dir.exists() and any(self.stocks_dir.iterdir())
L151: [path for path in self.stocks_dir.iterdir() if path.is_dir()],
L206: 기존 기초종목.txt fallback reader.
L248: 중앙 stocks/ 우선, 없으면 기존 기초종목.txt fallback.
L255: def read_base_stocks_compatible(self) -> list[dict[str, Any]]:
...외 5개

[출처: kiwoom29_dependency_analysis_report.txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 14:58:42 | 분류: 기타문서/자료]
### stock_migration_to_central_stocks.py
발견: 기초종목.txt:2, iterdir():2
L16: - 기존 기초종목.txt도 삭제하지 않는다.
L166: for routine_dir in sorted(project_root.iterdir(), key=lambda p: p.name):
L170: for child in sorted(routine_dir.iterdir(), key=lambda p: p.name):
L272: lines.append("기초종목.txt 삭제: 안 함")

[출처: kiwoom29_dependency_analysis_report.txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 14:58:42 | 분류: 기타문서/자료]
### stock_repository.py
발견: 기초종목.txt:1, read_base_stocks:4, update_base_stock_routines:2, iterdir():2
L8: - 기초종목.txt 제거와 stocks/ 중앙 종목폴더 일원화를 위한 단일 접근 레이어.
L9: - 1차 적용에서는 기존 기능을 깨지 않기 위해 gui_stock_data.read_base_stocks()가
L121: return any(path.is_dir() for path in self.stocks_dir.iterdir())
L127: [path for path in self.stocks_dir.iterdir() if path.is_dir()],
L179: def read_base_stocks_compatible(self) -> list[dict[str, Any]]:
L291: def read_base_stocks_from_repository() -> list[dict[str, Any]]:
L292: return repository().read_base_stocks_compatible()
L296: def update_base_stock_routines_in_repository(code: str, name: str, routines: list[str]) -> bool:
L298: 기존 update_base_stock_routines() 교체 후보 함수.

[출처: kiwoom29_dependency_analysis_report.txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 14:58:42 | 분류: 기타문서/자료]
## 권장 순서
1. gui_stock_register_window.py의 선택 종목 삭제/BASE_STOCK_PATH 잔재 정리
2. gui_review_required_window.py / gui_global_review_required_window.py 검토관리 이동·복귀·삭제 경로 중앙 stocks 기준화
3. gui_integrity_check_window.py와 integrity_checker.py를 중앙 stocks 검증 기준으로 재작성
4. gui_auto_trade_unregister.py, gui_routine_policy.py의 문구와 fallback 잔재 정리
5. gui_windows.py 내 append_base_stock/BASE_STOCK_PATH 잔재 제거 또는 stock_repository 위임
6. docs/registry_migratio/샘플 스크립트는 실행 경로가 아니면 보류 또는 archive

[출처: README_적용내용(19).txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 14:39:18 | 분류: 기타문서/자료]
수정 내용:
1. 수동등록창 검색 결과 테이블에 헤더 클릭 정렬 기능을 추가했습니다.
2. 검색 결과를 다시 채울 때 정렬을 잠시 끄고 채운 뒤 다시 켜도록 했습니다.
3. 코드/종목명/시장/등록상태 컬럼 모두 헤더 클릭으로 정렬됩니다.
4. changelog의 기초종목.txt 문구를 중앙 종목관리로 정리했습니다.
확인:
1. 파일 교체
2. 종목등록설정 > 수동등록
3. 코드/종목명/시장/등록상태 헤더 클릭 정렬 확인

[출처: README_적용내용(18).txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 14:21:26 | 분류: 기타문서/자료]
# 선택 종목 삭제 중앙 stocks 기준 패치
적용 파일:
- gui_stock_register_window.py

[출처: README_적용내용(18).txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 14:21:26 | 분류: 기타문서/자료]
확인:
1. 파일 교체
2. python gui_main.py 실행
3. 종목등록설정창에서 미등록/안전 종목 1개 선택
4. 선택 종목 삭제 실행
5. 중앙 종목관리 목록에서 사라지는지 확인
6. archived_stocks/ 아래로 이동됐는지 확인

[출처: README_적용내용(17).txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 13:39:42 | 분류: 기타문서/자료]
적용 파일:
- gui_stock_data.py
- gui_base_stock_service.py
- gui_stock_register_window.py

[출처: README_적용내용(17).txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 13:39:42 | 분류: 기타문서/자료]
v2 수정:
- gui_search_stock_register_dialog.py가 import하는 `append_base_stock()` 누락을 복구했습니다.
- `append_base_stock()`는 더 이상 기초종목.txt를 쓰지 않고 중앙 stocks/종목폴더를 생성합니다.
- `remove_base_stock()`도 호환용으로 추가했지만 종목 폴더 삭제는 하지 않고 루틴 연결만 비우는 안전 동작입니다.

[출처: README_적용내용(16).txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 13:29:16 | 분류: 기타문서/자료]
적용 파일:
- gui_base_stock_service.py
- gui_stock_data.py
- gui_stock_register_window.py

[출처: README_적용내용(16).txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 13:29:16 | 분류: 기타문서/자료]
핵심 변경:
1. gui_base_stock_service.read_base_stocks()
 - 중앙 stocks/ 기준만 사용
 - 중앙 구조가 없으면 빈 목록 반환

[출처: README_적용내용(16).txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 13:29:16 | 분류: 기타문서/자료]
2. gui_base_stock_service.update_base_stock_routines()
 - 중앙 stocks/config.json만 갱신
 - 중앙 구조가 없으면 False 반환

[출처: README_적용내용(16).txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 13:29:16 | 분류: 기타문서/자료]
3. gui_stock_data.read_base_stocks()
 - 중앙 stocks/ 기준만 사용
 - 기초종목.txt fallback 제거

[출처: README_적용내용(16).txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 13:29:16 | 분류: 기타문서/자료]
4. gui_stock_data.base_stock_routines_for_stock()
 - 중앙 stocks/config.json 기준만 사용

[출처: base_stock_dependency_scan.json | 기준일: 2026-06-15 | 수정시각: 2026-06-15 13:16:48 | 분류: 기타문서/자료]
[
 {
 "file": "docs/gui_windows(160).py",
 "hits": [
 [
 "기초종목.txt",
 38
 ],
 [
 "BASE_STOCK_PATH",
 16
 ],
 [
 "read_base_stocks",
 10
 ],
 [
 "update_base_stock_routines",
 6
 ],
 [
 "normalize_base_stock_single_routine_file",
 3
 ]
 ],
 "snippets": [
 {
 "line": 176,
 "text": "BASE_STOCK_PATH = PROJECT_ROOT / \"기초종목.txt\""
 },
 {
 "line": 440,
 "text": "기초종목.txt 에 이미 저장된 종목 1행의 표시용 검증 상태를 반환한다."
 },
 {
 "line": 477,
 "text": "기초종목.txt 활성 루틴은 종목당 1개만 허용한다."
 },
 {
 "line": 480,
 "text": "활성 연결은 기초종목.txt의 첫 번째 유효 루틴 1개만 사용한다."
 },
 {
 "line": 492,
 "text": "def normalize_base_stock_single_routine_file() -> bool:"
 },
 {
 "line": 494,
 "text": "기존 기초종목.txt에 루틴이 여러 개 저장되어 있으면 첫 번째 루틴만 남긴다."
 },
 {
 "line": 499,
 "text": "- 자동매매설정 창은 기초종목.txt의 단일 루틴 연결만 표시한다."
 },
 {
 "line": 501,
 "text": "if not BASE_STOCK_PATH.exists():"
 },
 {
 "line": 504,
 "text": "lines = BASE_STOCK_PATH.read_text(encoding=\"utf-8\").splitlines()"
 },
 {
 "line": 527,
 "text": "BASE_STOCK_PATH.write_text("
 },
 {
 "line": 535,
 "text": "def read_base_stocks() -> list[dict[str, object]]:"
 },
 {
 "line": 537,
 "text": "기초종목.txt 를 읽어 종목 목록으로 변환한다."
 },
 {
 "line": 542,
 "text": "현재 기초종목.txt 에 등록일시 필드는 사용하지 않는다."
 },
 {
 "line": 544,
 "text": "if not BASE_STOCK_PATH.exists():"
 },
 {
 "line": 545,
 "text": "BASE_STOCK_PATH.write_text(\"\", encoding=\"utf-8\")"
 },
 {
 "line": 551,
 "text": "for line_no, raw_line in enumerate(BASE_STOCK_PATH.read_text(encoding=\"utf-8\").splitlines(), start=1):"
 },
 {
 "line": 594,
 "text": "기초종목.txt 에 종목 1개를 추가한다."
 },
 {
 "line": 596,
 "text": "existing_text = BASE_STOCK_PATH.read_text(encoding=\"utf-8\") if BASE_STOCK_PATH.exists() else \"\""
 },
 {
 "line": 599,
 "text": "with BASE_STOCK_PATH.open(\"a\", encoding=\"utf-8\") as file:"
 },
 {
 "line": 613,
 "text": "기초종목.txt에 연결된 각 종목마다 실주문 루틴이 최대 1개가 되도록 정리한다."
 },
 {
 "line": 615,
 "text": "for stock in read_base_stocks():"
 },
 {
 "line": 622,
 "text": "def update_base_stock_routines(code: str, name: str, routines: list[str]) -> bool:"
 },
 {
 "line": 624,
 "text": "기초종목.txt 의 특정 종목 행에 루틴 목록을 반영한다."
 },
 {
 "line": 626,
 "text": "if not BASE_STOCK_PATH.exists():"
 },
 {
 "line": 629,
 "text": "lines = BASE_STOCK_PATH.read_text(encoding=\"utf-8\").splitlines()"
 },
 {
 "line": 651,
 "text": "BASE_STOCK_PATH.write_text("
 },
 {
 "line": 1041,
 "text": "normalize_base_stock_single_routine_file()"
 },
 {
 "line": 1332,
 "text": "for stock in read_base_stocks():"
 },
 {
 "line": 2400,
 "text": "- 기초종목.txt 등록 종목 중 루틴 변경이 가능한 종목만 좌측에 표시한다."
 },
 {
 "line": 2704,
 "text": "stocks = read_base_stocks()"
 }
 ],
 "total_snippets": 71
 },
 {
 "file": "gui_auto_trade_setting_window.py",
 "hits": [
 [
 "기초종목.txt",
 4
 ],
 [
 "read_base_stocks",
 2
 ],
 [
 "update_base_stock_routines",
 1
 ],
 [
 "normalize_base_stock_single_routine_file",
 2
 ]
 ],
 "snippets": [
 {
 "line": 144,
 "text": "normalize_base_stock_single_routine_file,"
 },
 {
 "line": 146,
 "text": "read_base_stocks,"
 },
 {
 "line": 148,
 "text": "update_base_stock_routines,"
 },
 {
 "line": 1008,
 "text": "normalize_base_stock_single_routine_file()"
 },
 {
 "line": 1894,
 "text": "기초종목.txt 기준 종목-루틴 연결 정보를 반환한다."
 },
 {
 "line": 1897,
 "text": "기초종목.txt 에 실제 연결된 종목만 표시한다."
 },
 {
 "line": 1900,
 "text": "for stock in read_base_stocks():"
 },
 {
 "line": 1917,
 "text": "기초종목.txt 기준으로 종목이 해당 루틴에 연결되어 있는지 확인한다."
 },
 {
 "line": 1927,
 "text": "루틴 폴더 안에 물리 폴더가 남아 있어도 기초종목.txt 에 연결 정보가 없으면"
 }
 ],
 "total_snippets": 9
 },
 {
 "file": "gui_auto_trade_unregister.py",
 "hits": [
 [
 "기초종목.txt",
 5
 ],
 [
 "BASE_STOCK_PATH",
 1
 ],
 [
 "update_base_stock_routines",
 6
 ]
 ],
 "snippets": [
 {
 "line": 42,
 "text": "from gui_base_stock_service import update_base_stock_routines as update_base_stock_routines_from_service"
 },
 {
 "line": 45,
 "text": "BASE_STOCK_PATH = PROJECT_ROOT / \"기초종목.txt\""
 },
 {
 "line": 78,
 "text": "def update_base_stock_routines(code: str, name: str, routines: list[str]) -> bool:"
 },
 {
 "line": 82,
 "text": "중앙 종목관리 개편 이후 이 파일 안에서 기초종목.txt를 직접 수정하지 않는다."
 },
 {
 "line": 83,
 "text": "gui_base_stock_service.update_base_stock_routines()로 위임하여"
 },
 {
 "line": 85,
 "text": "- 아직 stocks/가 없으면 기존 기초종목.txt fallback"
 },
 {
 "line": 88,
 "text": "return bool(update_base_stock_routines_from_service(code, name, routines))"
 },
 {
 "line": 309,
 "text": "- 기초종목.txt의 루틴 연결만 제거한다. 종목 자체는 기초종목에 남긴다."
 },
 {
 "line": 383,
 "text": "if update_base_stock_routines(code, name, []):"
 },
 {
 "line": 400,
 "text": "QMessageBox.information(window, \"등록해제 없음\", \"기초종목.txt에서 등록해제할 종목을 찾지 못했습니다.\")"
 }
 ],
 "total_snippets": 10
 },
 {
 "file": "gui_base_stock_service.py",
 "hits": [
 [
 "기초종목.txt",
 12
 ],
 [
 "BASE_STOCK_PATH",
 10
 ],
 [
 "read_base_stocks",
 5
 ],
 [
 "update_base_stock_routines",
 3
 ],
 [
 "normalize_base_stock_single_routine_file",
 1
 ]
 ],
 "snippets": [
 {
 "line": 5,
 "text": "기초종목.txt / stock_library.json 관련 순수 서비스 헬퍼."
 },
 {
 "line": 29,
 "text": "BASE_STOCK_PATH = PROJECT_ROOT / \"기초종목.txt\""
 },
 {
 "line": 113,
 "text": "기초종목.txt 에 이미 저장된 종목 1행의 표시용 검증 상태를 반환한다."
 },
 {
 "line": 149,
 "text": "기초종목.txt 활성 루틴은 종목당 1개만 허용한다."
 },
 {
 "line": 152,
 "text": "활성 연결은 기초종목.txt의 첫 번째 유효 루틴 1개만 사용한다."
 },
 {
 "line": 164,
 "text": "def normalize_base_stock_single_routine_file() -> bool:"
 },
 {
 "line": 166,
 "text": "기존 기초종목.txt에 루틴이 여러 개 저장되어 있으면 첫 번째 루틴만 남긴다."
 },
 {
 "line": 171,
 "text": "- 자동매매설정 창은 기초종목.txt의 단일 루틴 연결만 표시한다."
 },
 {
 "line": 173,
 "text": "if not BASE_STOCK_PATH.exists():"
 },
 {
 "line": 176,
 "text": "lines = BASE_STOCK_PATH.read_text(encoding=\"utf-8\").splitlines()"
 },
 {
 "line": 199,
 "text": "BASE_STOCK_PATH.write_text("
 },
 {
 "line": 211,
 "text": "1차 안전장치: stocks/ 종목폴더가 없으면 기존 기초종목.txt 로직을 유지한다."
 },
 {
 "line": 221,
 "text": "def _read_base_stocks_from_central_repository_if_available() -> list[dict[str, object]] | None:"
 },
 {
 "line": 228,
 "text": "return stock_repository_factory().read_base_stocks_compatible()"
 },
 {
 "line": 233,
 "text": "def _update_base_stock_routines_in_central_repository_if_available("
 },
 {
 "line": 243,
 "text": "- None: 중앙 repository 미사용, 기존 기초종목.txt fallback 필요"
 },
 {
 "line": 253,
 "text": "def read_base_stocks() -> list[dict[str, object]]:"
 },
 {
 "line": 259,
 "text": "- 아직 중앙 stocks/ 구조가 없으면 기존 기초종목.txt 로직을 그대로 사용한다."
 },
 {
 "line": 261,
 "text": "central_stocks = _read_base_stocks_from_central_repository_if_available()"
 },
 {
 "line": 265,
 "text": "if not BASE_STOCK_PATH.exists():"
 },
 {
 "line": 266,
 "text": "BASE_STOCK_PATH.write_text(\"\", encoding=\"utf-8\")"
 },
 {
 "line": 272,
 "text": "for line_no, raw_line in enumerate(BASE_STOCK_PATH.read_text(encoding=\"utf-8\").splitlines(), start=1):"
 },
 {
 "line": 316,
 "text": "기초종목.txt에 연결된 각 종목마다 실주문 루틴이 최대 1개가 되도록 정리한다."
 },
 {
 "line": 318,
 "text": "for stock in read_base_stocks():"
 },
 {
 "line": 325,
 "text": "def update_base_stock_routines(code: str, name: str, routines: list[str]) -> bool:"
 },
 {
 "line": 331,
 "text": "- 아직 중앙 stocks/ 구조가 없으면 기존 기초종목.txt 로직을 그대로 사용한다."
 },
 {
 "line": 333,
 "text": "central_updated = _update_base_stock_routines_in_central_repository_if_available(code, name, routines)"
 },
 {
 "line": 337,
 "text": "if not BASE_STOCK_PATH.exists():"
 },
 {
 "line": 340,
 "text": "lines = BASE_STOCK_PATH.read_text(encoding=\"utf-8\").splitlines()"
 },
 {
 "line": 362,
 "text": "BASE_STOCK_PATH.write_text("
 }
 ],
 "total_snippets": 30
 },
 {
 "file": "gui_global_review_required_window.py",
 "hits": [
 [
 "기초종목.txt",
 3
 ],
 [
 "BASE_STOCK_PATH",
 4
 ],
 [
 "update_base_stock_routines",
 2
 ]
 ],
 "snippets": [
 {
 "line": 46,
 "text": "update_base_stock_routines,"
 },
 {
 "line": 51,
 "text": "BASE_STOCK_PATH = PROJECT_ROOT / \"기초종목.txt\""
 },
 {
 "line": 469,
 "text": "update_base_stock_routines(code, name, [])"
 },
 {
 "line": 480,
 "text": "append_changelog(\"UPDATE\", \"기초종목.txt/state.json\", f\"검토관리 미지정 전환: {changed}개\")"
 },
 {
 "line": 524,
 "text": "if BASE_STOCK_PATH.exists():"
 },
 {
 "line": 526,
 "text": "for raw_line in BASE_STOCK_PATH.read_text(encoding=\"utf-8\").splitlines():"
 },
 {
 "line": 532,
 "text": "BASE_STOCK_PATH.write_text("
 },
 {
 "line": 554,
 "text": "append_changelog(\"DELETE\", \"기초종목.txt/runtime\", f\"검토관리 종목 삭제: {deleted}개\")"
 }
 ],
 "total_snippets": 8
 },
 {
 "file": "gui_integrity_check_window.py",
 "hits": [
 [
 "기초종목.txt",
 2
 ],
 [
 "BASE_STOCK_PATH",
 2
 ]
 ],
 "snippets": [
 {
 "line": 38,
 "text": "BASE_STOCK_PATH = PROJECT_ROOT / \"기초종목.txt\""
 },
 {
 "line": 72,
 "text": "(\"base_duplicate\", \"기초종목.txt 중복 검증\"),"
 },
 {
 "line": 193,
 "text": "BASE_STOCK_PATH,"
 }
 ],
 "total_snippets": 3
 },
 {
 "file": "gui_main_table_loader.py",
 "hits": [
 [
 "read_base_stocks",
 5
 ]
 ],
 "snippets": [
 {
 "line": 45,
 "text": "from gui_base_stock_service import read_base_stocks"
 },
 {
 "line": 97,
 "text": "read_base_stocks() 표준 반환값에서 종목의 루틴명 목록을 추출한다."
 },
 {
 "line": 120,
 "text": "for stock in read_base_stocks():"
 },
 {
 "line": 147,
 "text": "중앙 종목관리(read_base_stocks -> stocks/config.json) 기준으로 계산한다."
 },
 {
 "line": 204,
 "text": "for stock in read_base_stocks():"
 }
 ],
 "total_snippets": 5
 },
 {
 "file": "gui_review_required_window.py",
 "hits": [
 [
 "기초종목.txt",
 4
 ],
 [
 "BASE_STOCK_PATH",
 7
 ],
 [
 "update_base_stock_routines",
 2
 ]
 ],
 "snippets": [
 {
 "line": 52,
 "text": "BASE_STOCK_PATH = PROJECT_ROOT / \"기초종목.txt\""
 },
 {
 "line": 177,
 "text": "def update_base_stock_routines(code: str, name: str, routines: list[str]) -> bool:"
 },
 {
 "line": 179,
 "text": "기초종목.txt 의 특정 종목 행에 루틴 목록을 반영한다."
 },
 {
 "line": 181,
 "text": "if not BASE_STOCK_PATH.exists():"
 },
 {
 "line": 184,
 "text": "lines = BASE_STOCK_PATH.read_text(encoding=\"utf-8\").splitlines()"
 },
 {
 "line": 206,
 "text": "BASE_STOCK_PATH.write_text("
 },
 {
 "line": 801,
 "text": "update_base_stock_routines(code, name, [])"
 },
 {
 "line": 811,
 "text": "append_changelog(\"UPDATE\", \"기초종목.txt/state.json\", f\"검토관리 미지정 전환: {changed}개\")"
 },
 {
 "line": 855,
 "text": "if BASE_STOCK_PATH.exists():"
 },
 {
 "line": 857,
 "text": "for raw_line in BASE_STOCK_PATH.read_text(encoding=\"utf-8\").splitlines():"
 },
 {
 "line": 863,
 "text": "BASE_STOCK_PATH.write_text("
 },
 {
 "line": 885,
 "text": "append_changelog(\"DELETE\", \"기초종목.txt/runtime\", f\"검토관리 종목 삭제: {deleted}개\")"
 }
 ],
 "total_snippets": 12
 },
 {
 "file": "gui_routine_assign_window.py",
 "hits": [
 [
 "기초종목.txt",
 7
 ],
 [
 "read_base_stocks",
 5
 ],
 [
 "update_base_stock_routines",
 3
 ]
 ],
 "snippets": [
 {
 "line": 82,
 "text": "read_base_stocks,"
 },
 {
 "line": 84,
 "text": "update_base_stock_routines,"
 },
 {
 "line": 202,
 "text": "- 기초종목.txt 등록 종목 중 루틴 변경이 가능한 종목만 좌측에 표시한다."
 },
 {
 "line": 508,
 "text": "stocks = read_base_stocks()"
 },
 {
 "line": 656,
 "text": "stocks = read_base_stocks()"
 },
 {
 "line": 940,
 "text": "stocks = read_base_stocks()"
 },
 {
 "line": 1222,
 "text": "if not update_base_stock_routines(code, name, final_routines):"
 },
 {
 "line": 1223,
 "text": "skipped_items.append(f\"{code} {name}: 기초종목.txt 갱신 실패\")"
 },
 {
 "line": 1251,
 "text": "\"기초종목.txt\","
 },
 {
 "line": 1318,
 "text": "for stock in read_base_stocks()"
 },
 {
 "line": 1328,
 "text": "skipped_items.append(f\"{code} {name}: 기초종목.txt에서 종목을 찾지 못했습니다.\")"
 },
 {
 "line": 1368,
 "text": "skipped_items.append(f\"{code} {name}: 기초종목.txt에서 종목을 찾지 못했습니다.\")"
 },
 {
 "line": 1375,
 "text": "if update_base_stock_routines(code, name, new_routines):"
 },
 {
 "line": 1379,
 "text": "skipped_items.append(f\"{code} {name}: 기초종목.txt 갱신 실패\")"
 },
 {
 "line": 1390,
 "text": "\"기초종목.txt\","
 }
 ],
 "total_snippets": 15
 },
 {
 "file": "gui_routine_policy.py",
 "hits": [
 [
 "기초종목.txt",
 2
 ]
 ],
 "snippets": [
 {
 "line": 98,
 "text": "루틴 해제는 종목 자체는 유지하고 기초종목.txt의 루틴명만 제거한다."
 },
 {
 "line": 103,
 "text": "return False, \"\", [\"기초종목.txt에서 종목을 찾지 못했습니다.\"]"
 }
 ],
 "total_snippets": 2
 },
 {
 "file": "gui_schedule_window.py",
 "hits": [
 [
 "기초종목.txt",
 36
 ],
 [
 "BASE_STOCK_PATH",
 13
 ],
 [
 "read_base_stocks",
 9
 ],
 [
 "update_base_stock_routines",
 5
 ],
 [
 "normalize_base_stock_single_routine_file",
 3
 ]
 ],
 "snippets": [
 {
 "line": 171,
 "text": "BASE_STOCK_PATH = PROJECT_ROOT / \"기초종목.txt\""
 },
 {
 "line": 387,
 "text": "기초종목.txt 에 이미 저장된 종목 1행의 표시용 검증 상태를 반환한다."
 },
 {
 "line": 424,
 "text": "기초종목.txt 활성 루틴은 종목당 1개만 허용한다."
 },
 {
 "line": 427,
 "text": "활성 연결은 기초종목.txt의 첫 번째 유효 루틴 1개만 사용한다."
 },
 {
 "line": 439,
 "text": "def normalize_base_stock_single_routine_file() -> bool:"
 },
 {
 "line": 441,
 "text": "기존 기초종목.txt에 루틴이 여러 개 저장되어 있으면 첫 번째 루틴만 남긴다."
 },
 {
 "line": 446,
 "text": "- 자동매매설정 창은 기초종목.txt의 단일 루틴 연결만 표시한다."
 },
 {
 "line": 448,
 "text": "if not BASE_STOCK_PATH.exists():"
 },
 {
 "line": 451,
 "text": "lines = BASE_STOCK_PATH.read_text(encoding=\"utf-8\").splitlines()"
 },
 {
 "line": 474,
 "text": "BASE_STOCK_PATH.write_text("
 },
 {
 "line": 482,
 "text": "def read_base_stocks() -> list[dict[str, object]]:"
 },
 {
 "line": 484,
 "text": "기초종목.txt 를 읽어 종목 목록으로 변환한다."
 },
 {
 "line": 489,
 "text": "현재 기초종목.txt 에 등록일시 필드는 사용하지 않는다."
 },
 {
 "line": 491,
 "text": "if not BASE_STOCK_PATH.exists():"
 },
 {
 "line": 492,
 "text": "BASE_STOCK_PATH.write_text(\"\", encoding=\"utf-8\")"
 },
 {
 "line": 498,
 "text": "for line_no, raw_line in enumerate(BASE_STOCK_PATH.read_text(encoding=\"utf-8\").splitlines(), start=1):"
 },
 {
 "line": 541,
 "text": "기초종목.txt 에 종목 1개를 추가한다."
 },
 {
 "line": 543,
 "text": "existing_text = BASE_STOCK_PATH.read_text(encoding=\"utf-8\") if BASE_STOCK_PATH.exists() else \"\""
 },
 {
 "line": 546,
 "text": "with BASE_STOCK_PATH.open(\"a\", encoding=\"utf-8\") as file:"
 },
 {
 "line": 560,
 "text": "기초종목.txt에 연결된 각 종목마다 실주문 루틴이 최대 1개가 되도록 정리한다."
 },
 {
 "line": 562,
 "text": "for stock in read_base_stocks():"
 },
 {
 "line": 569,
 "text": "def update_base_stock_routines(code: str, name: str, routines: list[str]) -> bool:"
 },
 {
 "line": 571,
 "text": "기초종목.txt 의 특정 종목 행에 루틴 목록을 반영한다."
 },
 {
 "line": 573,
 "text": "if not BASE_STOCK_PATH.exists():"
 },
 {
 "line": 576,
 "text": "lines = BASE_STOCK_PATH.read_text(encoding=\"utf-8\").splitlines()"
 },
 {
 "line": 598,
 "text": "BASE_STOCK_PATH.write_text("
 },
 {
 "line": 675,
 "text": "normalize_base_stock_single_routine_file()"
 },
 {
 "line": 1311,
 "text": "- 기초종목.txt 등록 종목 중 루틴 변경이 가능한 종목만 좌측에 표시한다."
 },
 {
 "line": 1612,
 "text": "stocks = read_base_stocks()"
 },
 {
 "line": 1614,
 "text": "# 이 창은 기초종목.txt 등록 종목 중 루틴 변경 가능한 종목만 표시한다."
 }
 ],
 "total_snippets": 64
 },
 {
 "file": "gui_search_stock_register_dialog.py",
 "hits": [
 [
 "기초종목.txt",
 2
 ],
 [
 "read_base_stocks",
 3
 ]
 ],
 "snippets": [
 {
 "line": 34,
 "text": "read_base_stocks,"
 },
 {
 "line": 137,
 "text": "base_stocks = read_base_stocks()"
 },
 {
 "line": 218,
 "text": "# 등록 시점의 기초종목.txt를 직접 다시 읽어 1차 방어한다."
 },
 {
 "line": 220,
 "text": "base_stocks = read_base_stocks()"
 },
 {
 "line": 275,
 "text": "\"기초종목.txt\","
 }
 ],
 "total_snippets": 5
 },
 {
 "file": "gui_stock_data.py",
 "hits": [
 [
 "기초종목.txt",
 11
 ],
 [
 "BASE_STOCK_PATH",
 9
 ],
 [
 "read_base_stocks",
 4
 ]
 ],
 "snippets": [
 {
 "line": 26,
 "text": "BASE_STOCK_PATH = PROJECT_ROOT / \"기초종목.txt\""
 },
 {
 "line": 99,
 "text": "기초종목.txt 활성 루틴은 종목당 1개만 허용한다."
 },
 {
 "line": 119,
 "text": "기초종목.txt 에 저장된 종목 1행의 표시용 검증 상태를 반환한다."
 },
 {
 "line": 150,
 "text": "def _read_base_stocks_from_central_repository_if_available() -> list[dict[str, object]] | None:"
 },
 {
 "line": 156,
 "text": "- 그러면 기존 기초종목.txt 로직이 그대로 동작한다."
 },
 {
 "line": 166,
 "text": "return repo.read_base_stocks_compatible()"
 },
 {
 "line": 195,
 "text": "- None: 중앙 repository 미사용, 기존 기초종목.txt fallback 필요"
 },
 {
 "line": 213,
 "text": "def read_base_stocks() -> list[dict[str, object]]:"
 },
 {
 "line": 219,
 "text": "- 아직 중앙 stocks/ 구조가 없으면 기존 기초종목.txt 로직을 그대로 사용한다."
 },
 {
 "line": 221,
 "text": "central_stocks = _read_base_stocks_from_central_repository_if_available()"
 },
 {
 "line": 225,
 "text": "if not BASE_STOCK_PATH.exists():"
 },
 {
 "line": 226,
 "text": "BASE_STOCK_PATH.write_text(\"\", encoding=\"utf-8\")"
 },
 {
 "line": 232,
 "text": "for line_no, raw_line in enumerate(BASE_STOCK_PATH.read_text(encoding=\"utf-8\").splitlines(), start=1):"
 },
 {
 "line": 275,
 "text": "기초종목.txt 에 종목 1개를 추가한다."
 },
 {
 "line": 277,
 "text": "existing_text = BASE_STOCK_PATH.read_text(encoding=\"utf-8\") if BASE_STOCK_PATH.exists() else \"\""
 },
 {
 "line": 280,
 "text": "with BASE_STOCK_PATH.open(\"a\", encoding=\"utf-8\") as file:"
 },
 {
 "line": 285,
 "text": "\"\"\"기초종목.txt 한 줄에서 첫 번째 활성 루틴명을 반환한다.\"\"\""
 },
 {
 "line": 300,
 "text": "중앙 구조가 없을 때만 기존 기초종목.txt를 fallback으로 읽는다."
 },
 {
 "line": 314,
 "text": "if not BASE_STOCK_PATH.exists():"
 },
 {
 "line": 317,
 "text": "for raw_line in BASE_STOCK_PATH.read_text(encoding=\"utf-8\").splitlines():"
 },
 {
 "line": 348,
 "text": "중앙 구조가 없을 때만 기존 기초종목.txt를 fallback으로 읽는다."
 },
 {
 "line": 399,
 "text": "중앙 구조가 없을 때만 기존 기초종목.txt + 루틴폴더 방식을 fallback으로 사용한다."
 }
 ],
 "total_snippets": 22
 },
 {
 "file": "gui_stock_register_window.py",
 "hits": [
 [
 "기초종목.txt",
 11
 ],
 [
 "BASE_STOCK_PATH",
 1
 ],
 [
 "read_base_stocks",
 3
 ],
 [
 "update_base_stock_routines",
 2
 ],
 [
 "normalize_base_stock_single_routine_file",
 1
 ]
 ],
 "snippets": [
 {
 "line": 249,
 "text": "normalize_base_stock_single_routine_file,"
 },
 {
 "line": 254,
 "text": "read_base_stocks,"
 },
 {
 "line": 264,
 "text": "update_base_stock_routines,"
 },
 {
 "line": 271,
 "text": "BASE_STOCK_PATH = PROJECT_ROOT / \"기초종목.txt\""
 },
 {
 "line": 345,
 "text": "기초종목.txt 에는 현재 루틴 등록이 없지만,"
 },
 {
 "line": 372,
 "text": "기초종목.txt에 기록된 현재 활성 루틴의 runtime 폴더만 반환한다."
 },
 {
 "line": 659,
 "text": "header_layout.addWidget(QLabel(\"기초종목.txt 등록 종목 관리\"))"
 },
 {
 "line": 944,
 "text": "if update_base_stock_routines(code, name, []):"
 },
 {
 "line": 953,
 "text": "\"기초종목.txt\","
 },
 {
 "line": 1091,
 "text": "stock_path = PROJECT_ROOT / \"기초종목.txt\""
 },
 {
 "line": 1097,
 "text": "\"기초종목.txt 파일이 없습니다.\","
 },
 {
 "line": 1126,
 "text": "\"기초종목.txt에서 선택한 종목을 찾지 못했습니다.\","
 },
 {
 "line": 1152,
 "text": "\"기초종목.txt 등록해제는 아직 저장하지 않았습니다.\\n\\n\""
 },
 {
 "line": 1168,
 "text": "append_changelog(\"UPDATE\", \"기초종목.txt\", message)"
 },
 {
 "line": 1225,
 "text": "stocks = read_base_stocks()"
 },
 {
 "line": 1285,
 "text": "# 등록 루틴 컬럼은 기초종목.txt에 실제 연결된 활성 루틴만 표시한다."
 },
 {
 "line": 1416,
 "text": "stocks = read_base_stocks()"
 }
 ],
 "total_snippets": 17
 },
 {
 "file": "gui_windows.py",
 "hits": [
 [
 "기초종목.txt",
 2
 ],
 [
 "BASE_STOCK_PATH",
 4
 ],
 [
 "normalize_base_stock_single_routine_file",
 2
 ]
 ],
 "snippets": [
 {
 "line": 64,
 "text": "normalize_base_stock_single_routine_file,"
 },
 {
 "line": 71,
 "text": "BASE_STOCK_PATH = PROJECT_ROOT / \"기초종목.txt\""
 },
 {
 "line": 76,
 "text": "기초종목.txt 에 종목 1개를 추가한다."
 },
 {
 "line": 78,
 "text": "existing_text = BASE_STOCK_PATH.read_text(encoding=\"utf-8\") if BASE_STOCK_PATH.exists() else \"\""
 },
 {
 "line": 81,
 "text": "with BASE_STOCK_PATH.open(\"a\", encoding=\"utf-8\") as file:"
 },
 {
 "line": 128,
 "text": "normalize_base_stock_single_routine_file()"
 }
 ],
 "total_snippets": 6
 },
 {
 "file": "gui_windows_149_manual_ats_status_policy_fix.py",
 "hits": [
 [
 "기초종목.txt",
 38
 ],
 [
 "BASE_STOCK_PATH",
 16
 ],
 [
 "read_base_stocks",
 10
 ],
 [
 "update_base_stock_routines",
 6
 ],
 [
 "normalize_base_stock_single_routine_file",
 3
 ]
 ],
 "snippets": [
 {
 "line": 176,
 "text": "BASE_STOCK_PATH = PROJECT_ROOT / \"기초종목.txt\""
 },
 {
 "line": 440,
 "text": "기초종목.txt 에 이미 저장된 종목 1행의 표시용 검증 상태를 반환한다."
 },
 {
 "line": 477,
 "text": "기초종목.txt 활성 루틴은 종목당 1개만 허용한다."
 },
 {
 "line": 480,
 "text": "활성 연결은 기초종목.txt의 첫 번째 유효 루틴 1개만 사용한다."
 },
 {
 "line": 492,
 "text": "def normalize_base_stock_single_routine_file() -> bool:"
 },
 {
 "line": 494,
 "text": "기존 기초종목.txt에 루틴이 여러 개 저장되어 있으면 첫 번째 루틴만 남긴다."
 },
 {
 "line": 499,
 "text": "- 자동매매설정 창은 기초종목.txt의 단일 루틴 연결만 표시한다."
 },
 {
 "line": 501,
 "text": "if not BASE_STOCK_PATH.exists():"
 },
 {
 "line": 504,
 "text": "lines = BASE_STOCK_PATH.read_text(encoding=\"utf-8\").splitlines()"
 },
 {
 "line": 527,
 "text": "BASE_STOCK_PATH.write_text("
 },
 {
 "line": 535,
 "text": "def read_base_stocks() -> list[dict[str, object]]:"
 },
 {
 "line": 537,
 "text": "기초종목.txt 를 읽어 종목 목록으로 변환한다."
 },
 {
 "line": 542,
 "text": "현재 기초종목.txt 에 등록일시 필드는 사용하지 않는다."
 },
 {
 "line": 544,
 "text": "if not BASE_STOCK_PATH.exists():"
 },
 {
 "line": 545,
 "text": "BASE_STOCK_PATH.write_text(\"\", encoding=\"utf-8\")"
 },
 {
 "line": 551,
 "text": "for line_no, raw_line in enumerate(BASE_STOCK_PATH.read_text(encoding=\"utf-8\").splitlines(), start=1):"
 },
 {
 "line": 594,
 "text": "기초종목.txt 에 종목 1개를 추가한다."
 },
 {
 "line": 596,
 "text": "existing_text = BASE_STOCK_PATH.read_text(encoding=\"utf-8\") if BASE_STOCK_PATH.exists() else \"\""
 },
 {
 "line": 599,
 "text": "with BASE_STOCK_PATH.open(\"a\", encoding=\"utf-8\") as file:"
 },
 {
 "line": 613,
 "text": "기초종목.txt에 연결된 각 종목마다 실주문 루틴이 최대 1개가 되도록 정리한다."
 },
 {
 "line": 615,
 "text": "for stock in read_base_stocks():"
 },
 {
 "line": 622,
 "text": "def update_base_stock_routines(code: str, name: str, routines: list[str]) -> bool:"
 },
 {
 "line": 624,
 "text": "기초종목.txt 의 특정 종목 행에 루틴 목록을 반영한다."
 },
 {
 "line": 626,
 "text": "if not BASE_STOCK_PATH.exists():"
 },
 {
 "line": 629,
 "text": "lines = BASE_STOCK_PATH.read_text(encoding=\"utf-8\").splitlines()"
 },
 {
 "line": 651,
 "text": "BASE_STOCK_PATH.write_text("
 },
 {
 "line": 1041,
 "text": "normalize_base_stock_single_routine_file()"
 },
 {
 "line": 1332,
 "text": "for stock in read_base_stocks():"
 },
 {
 "line": 2217,
 "text": "- 기초종목.txt 등록 종목 중 루틴 변경이 가능한 종목만 좌측에 표시한다."
 },
 {
 "line": 2521,
 "text": "stocks = read_base_stocks()"
 }
 ],
 "total_snippets": 71
 },
 {
 "file": "integrity_checker.py",
 "hits": [
 [
 "기초종목.txt",
 8
 ],
 [
 "read_base_stocks",
 2
 ]
 ],
 "snippets": [
 {
 "line": 66,
 "text": "def read_base_stocks_for_check(base_stock_path: Path) -> list[dict[str, object]]:"
 },
 {
 "line": 176,
 "text": "base_stocks = read_base_stocks_for_check(base_stock_path)"
 },
 {
 "line": 195,
 "text": "f\"기초종목.txt {line_no}행\","
 },
 {
 "line": 207,
 "text": "f\"기초종목.txt {line_no}행\","
 },
 {
 "line": 219,
 "text": "f\"기초종목.txt {line_no}행\","
 },
 {
 "line": 231,
 "text": "f\"기초종목.txt {line_no}행\","
 },
 {
 "line": 242,
 "text": "f\"기초종목.txt {line_no}행\","
 },
 {
 "line": 253,
 "text": "f\"기초종목.txt {line_no}행\","
 },
 {
 "line": 262,
 "text": "f\"기초종목.txt {line_no}행\","
 },
 {
 "line": 274,
 "text": "f\"기초종목.txt {line_no}행\","
 }
 ],
 "total_snippets": 10
 },
 {
 "file": "registry_migratio/stock_registry_step1_analyzer.py",
 "hits": [
 [
 "기초종목.txt",
 3
 ],
 [
 "read_base_stocks",
 2
 ]
 ],
 "snippets": [
 {
 "line": 7,
 "text": "- 기초종목.txt, 루틴폴더의 종목폴더, state/config/orders/logs 존재 여부를 수집한다."
 },
 {
 "line": 28,
 "text": "BASE_STOCK_FILENAMES = [\"기초종목.txt\", \"기초종목등록.txt\"]"
 },
 {
 "line": 94,
 "text": "def read_base_stocks(root: Path) -> dict[str, dict[str, str]]:"
 },
 {
 "line": 176,
 "text": "base_stocks = read_base_stocks(root)"
 },
 {
 "line": 269,
 "text": "lines.append(\"4. 아직 종목폴더 이동 또는 기초종목.txt 삭제는 하지 않는다.\")"
 }
 ],
 "total_snippets": 5
 },
 {
 "file": "registry_migratio/stock_repository.py",
 "hits": [
 [
 "기초종목.txt",
 6
 ],
 [
 "BASE_STOCK_PATH",
 1
 ],
 [
 "read_base_stocks",
 6
 ]
 ],
 "snippets": [
 {
 "line": 8,
 "text": "- 기초종목.txt 의존을 줄이고, 최종적으로 stocks/ 중앙 종목폴더 구조로 이동하기 위한"
 },
 {
 "line": 45,
 "text": "BASE_STOCK_PATH = PROJECT_ROOT / \"기초종목.txt\""
 },
 {
 "line": 115,
 "text": "기존 read_base_stocks() 사용처와 호환되는 형태."
 },
 {
 "line": 135,
 "text": "- 아직 마이그레이션 전이면 기초종목.txt를 fallback으로 읽을 수 있게 한다."
 },
 {
 "line": 142,
 "text": "self.base_stock_path = self.project_root / \"기초종목.txt\""
 },
 {
 "line": 206,
 "text": "기존 기초종목.txt fallback reader."
 },
 {
 "line": 248,
 "text": "중앙 stocks/ 우선, 없으면 기존 기초종목.txt fallback."
 },
 {
 "line": 255,
 "text": "def read_base_stocks_compatible(self) -> list[dict[str, Any]]:"
 },
 {
 "line": 257,
 "text": "기존 read_base_stocks() 대체용 호환 반환."
 },
 {
 "line": 332,
 "text": "def read_base_stocks_from_repository() -> list[dict[str, Any]]:"
 },
 {
 "line": 334,
 "text": "기존 read_base_stocks() 교체 후보 함수."
 },
 {
 "line": 337,
 "text": "return repository().read_base_stocks_compatible()"
 }
 ],
 "total_snippets": 12
 },
 {
 "file": "stock_migration_to_central_stocks.py",
 "hits": [
 [
 "기초종목.txt",
 2
 ]
 ],
 "snippets": [
 {
 "line": 16,
 "text": "- 기존 기초종목.txt도 삭제하지 않는다."
 },
 {
 "line": 272,
 "text": "lines.append(\"기초종목.txt 삭제: 안 함\")"
 }
 ],
 "total_snippets": 2
 },
 {
 "file": "stock_repository.py",
 "hits": [
 [
 "기초종목.txt",
 1
 ],
 [
 "read_base_stocks",
 4
 ],
 [
 "update_base_stock_routines",
 2
 ]
 ],
 "snippets": [
 {
 "line": 8,
 "text": "- 기초종목.txt 제거와 stocks/ 중앙 종목폴더 일원화를 위한 단일 접근 레이어."
 },
 {
 "line": 9,
 "text": "- 1차 적용에서는 기존 기능을 깨지 않기 위해 gui_stock_data.read_base_stocks()가"
 },
 {
 "line": 179,
 "text": "def read_base_stocks_compatible(self) -> list[dict[str, Any]]:"
 },
 {
 "line": 291,
 "text": "def read_base_stocks_from_repository() -> list[dict[str, Any]]:"
 },
 {
 "line": 292,
 "text": "return repository().read_base_stocks_compatible()"
 },
 {
 "line": 296,
 "text": "def update_base_stock_routines_in_repository(code: str, name: str, routines: list[str]) -> bool:"
 },
 {
 "line": 298,
 "text": "기존 update_base_stock_routines() 교체 후보 함수."
 }
 ],
 "total_snippets": 7
 }
]

[출처: base_stock_dependency_scan_report.txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 13:16:38 | 분류: 기타문서/자료]
## docs/gui_windows(160).py
- 분류: 실행 경로 검토 필요
- 발견:
 - 기초종목.txt: 38회
 - BASE_STOCK_PATH: 16회
 - read_base_stocks: 10회
 - update_base_stock_routines: 6회
 - normalize_base_stock_single_routine_file: 3회
- 주요 위치:
 - L176: BASE_STOCK_PATH = PROJECT_ROOT / "기초종목.txt"
 - L440: 기초종목.txt 에 이미 저장된 종목 1행의 표시용 검증 상태를 반환한다.
 - L477: 기초종목.txt 활성 루틴은 종목당 1개만 허용한다.
 - L480: 활성 연결은 기초종목.txt의 첫 번째 유효 루틴 1개만 사용한다.
 - L492: def normalize_base_stock_single_routine_file() -> bool:
 - L494: 기존 기초종목.txt에 루틴이 여러 개 저장되어 있으면 첫 번째 루틴만 남긴다.
 - L499: - 자동매매설정 창은 기초종목.txt의 단일 루틴 연결만 표시한다.
 - L501: if not BASE_STOCK_PATH.exists():
 - L504: lines = BASE_STOCK_PATH.read_text(encoding="utf-8").splitlines()
 - L527: BASE_STOCK_PATH.write_text(
 - L535: def read_base_stocks() -> list[dict[str, object]]:
 - L537: 기초종목.txt 를 읽어 종목 목록으로 변환한다.
 - ... 외 59개

[출처: base_stock_dependency_scan_report.txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 13:16:38 | 분류: 기타문서/자료]
## gui_auto_trade_setting_window.py
- 분류: 실행 경로 검토 필요
- 발견:
 - 기초종목.txt: 4회
 - read_base_stocks: 2회
 - update_base_stock_routines: 1회
 - normalize_base_stock_single_routine_file: 2회
- 주요 위치:
 - L144: normalize_base_stock_single_routine_file,
 - L146: read_base_stocks,
 - L148: update_base_stock_routines,
 - L1008: normalize_base_stock_single_routine_file()
 - L1894: 기초종목.txt 기준 종목-루틴 연결 정보를 반환한다.
 - L1897: 기초종목.txt 에 실제 연결된 종목만 표시한다.
 - L1900: for stock in read_base_stocks():
 - L1917: 기초종목.txt 기준으로 종목이 해당 루틴에 연결되어 있는지 확인한다.
 - L1927: 루틴 폴더 안에 물리 폴더가 남아 있어도 기초종목.txt 에 연결 정보가 없으면

[출처: base_stock_dependency_scan_report.txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 13:16:38 | 분류: 기타문서/자료]
## gui_auto_trade_unregister.py
- 분류: 실행 경로 검토 필요
- 발견:
 - 기초종목.txt: 5회
 - BASE_STOCK_PATH: 1회
 - update_base_stock_routines: 6회
- 주요 위치:
 - L42: from gui_base_stock_service import update_base_stock_routines as update_base_stock_routines_from_service
 - L45: BASE_STOCK_PATH = PROJECT_ROOT / "기초종목.txt"
 - L78: def update_base_stock_routines(code: str, name: str, routines: list[str]) -> bool:
 - L82: 중앙 종목관리 개편 이후 이 파일 안에서 기초종목.txt를 직접 수정하지 않는다.
 - L83: gui_base_stock_service.update_base_stock_routines()로 위임하여
 - L85: - 아직 stocks/가 없으면 기존 기초종목.txt fallback
 - L88: return bool(update_base_stock_routines_from_service(code, name, routines))
 - L309: - 기초종목.txt의 루틴 연결만 제거한다. 종목 자체는 기초종목에 남긴다.
 - L383: if update_base_stock_routines(code, name, []):
 - L400: QMessageBox.information(window, "등록해제 없음", "기초종목.txt에서 등록해제할 종목을 찾지 못했습니다.")

[출처: base_stock_dependency_scan_report.txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 13:16:38 | 분류: 기타문서/자료]
## gui_base_stock_service.py
- 분류: 핵심 호환/전환 계층
- 발견:
 - 기초종목.txt: 12회
 - BASE_STOCK_PATH: 10회
 - read_base_stocks: 5회
 - update_base_stock_routines: 3회
 - normalize_base_stock_single_routine_file: 1회
- 주요 위치:
 - L5: 기초종목.txt / stock_library.json 관련 순수 서비스 헬퍼.
 - L29: BASE_STOCK_PATH = PROJECT_ROOT / "기초종목.txt"
 - L113: 기초종목.txt 에 이미 저장된 종목 1행의 표시용 검증 상태를 반환한다.
 - L149: 기초종목.txt 활성 루틴은 종목당 1개만 허용한다.
 - L152: 활성 연결은 기초종목.txt의 첫 번째 유효 루틴 1개만 사용한다.
 - L164: def normalize_base_stock_single_routine_file() -> bool:
 - L166: 기존 기초종목.txt에 루틴이 여러 개 저장되어 있으면 첫 번째 루틴만 남긴다.
 - L171: - 자동매매설정 창은 기초종목.txt의 단일 루틴 연결만 표시한다.
 - L173: if not BASE_STOCK_PATH.exists():
 - L176: lines = BASE_STOCK_PATH.read_text(encoding="utf-8").splitlines()
 - L199: BASE_STOCK_PATH.write_text(
 - L211: 1차 안전장치: stocks/ 종목폴더가 없으면 기존 기초종목.txt 로직을 유지한다.
 - ... 외 18개

[출처: base_stock_dependency_scan_report.txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 13:16:38 | 분류: 기타문서/자료]
## gui_main_table_loader.py
- 분류: 실행 경로 검토 필요
- 발견:
 - read_base_stocks: 5회
- 주요 위치:
 - L45: from gui_base_stock_service import read_base_stocks
 - L97: read_base_stocks() 표준 반환값에서 종목의 루틴명 목록을 추출한다.
 - L120: for stock in read_base_stocks():
 - L147: 중앙 종목관리(read_base_stocks -> stocks/config.json) 기준으로 계산한다.
 - L204: for stock in read_base_stocks():

[출처: base_stock_dependency_scan_report.txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 13:16:38 | 분류: 기타문서/자료]
## gui_routine_assign_window.py
- 분류: 실행 경로 검토 필요
- 발견:
 - 기초종목.txt: 7회
 - read_base_stocks: 5회
 - update_base_stock_routines: 3회
- 주요 위치:
 - L82: read_base_stocks,
 - L84: update_base_stock_routines,
 - L202: - 기초종목.txt 등록 종목 중 루틴 변경이 가능한 종목만 좌측에 표시한다.
 - L508: stocks = read_base_stocks()
 - L656: stocks = read_base_stocks()
 - L940: stocks = read_base_stocks()
 - L1222: if not update_base_stock_routines(code, name, final_routines):
 - L1223: skipped_items.append(f"{code} {name}: 기초종목.txt 갱신 실패")
 - L1251: "기초종목.txt",
 - L1318: for stock in read_base_stocks()
 - L1328: skipped_items.append(f"{code} {name}: 기초종목.txt에서 종목을 찾지 못했습니다.")
 - L1368: skipped_items.append(f"{code} {name}: 기초종목.txt에서 종목을 찾지 못했습니다.")
 - ... 외 3개

[출처: base_stock_dependency_scan_report.txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 13:16:38 | 분류: 기타문서/자료]
## gui_schedule_window.py
- 분류: 구버전/백업성 가능성
- 발견:
 - 기초종목.txt: 36회
 - BASE_STOCK_PATH: 13회
 - read_base_stocks: 9회
 - update_base_stock_routines: 5회
 - normalize_base_stock_single_routine_file: 3회
- 주요 위치:
 - L171: BASE_STOCK_PATH = PROJECT_ROOT / "기초종목.txt"
 - L387: 기초종목.txt 에 이미 저장된 종목 1행의 표시용 검증 상태를 반환한다.
 - L424: 기초종목.txt 활성 루틴은 종목당 1개만 허용한다.
 - L427: 활성 연결은 기초종목.txt의 첫 번째 유효 루틴 1개만 사용한다.
 - L439: def normalize_base_stock_single_routine_file() -> bool:
 - L441: 기존 기초종목.txt에 루틴이 여러 개 저장되어 있으면 첫 번째 루틴만 남긴다.
 - L446: - 자동매매설정 창은 기초종목.txt의 단일 루틴 연결만 표시한다.
 - L448: if not BASE_STOCK_PATH.exists():
 - L451: lines = BASE_STOCK_PATH.read_text(encoding="utf-8").splitlines()
 - L474: BASE_STOCK_PATH.write_text(
 - L482: def read_base_stocks() -> list[dict[str, object]]:
 - L484: 기초종목.txt 를 읽어 종목 목록으로 변환한다.
 - ... 외 52개

[출처: base_stock_dependency_scan_report.txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 13:16:38 | 분류: 기타문서/자료]
## gui_search_stock_register_dialog.py
- 분류: 실행 경로 검토 필요
- 발견:
 - 기초종목.txt: 2회
 - read_base_stocks: 3회
- 주요 위치:
 - L34: read_base_stocks,
 - L137: base_stocks = read_base_stocks()
 - L218: # 등록 시점의 기초종목.txt를 직접 다시 읽어 1차 방어한다.
 - L220: base_stocks = read_base_stocks()
 - L275: "기초종목.txt",

[출처: base_stock_dependency_scan_report.txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 13:16:38 | 분류: 기타문서/자료]
## gui_stock_data.py
- 분류: 핵심 호환/전환 계층
- 발견:
 - 기초종목.txt: 11회
 - BASE_STOCK_PATH: 9회
 - read_base_stocks: 4회
- 주요 위치:
 - L26: BASE_STOCK_PATH = PROJECT_ROOT / "기초종목.txt"
 - L99: 기초종목.txt 활성 루틴은 종목당 1개만 허용한다.
 - L119: 기초종목.txt 에 저장된 종목 1행의 표시용 검증 상태를 반환한다.
 - L150: def _read_base_stocks_from_central_repository_if_available() -> list[dict[str, object]] | None:
 - L156: - 그러면 기존 기초종목.txt 로직이 그대로 동작한다.
 - L166: return repo.read_base_stocks_compatible()
 - L195: - None: 중앙 repository 미사용, 기존 기초종목.txt fallback 필요
 - L213: def read_base_stocks() -> list[dict[str, object]]:
 - L219: - 아직 중앙 stocks/ 구조가 없으면 기존 기초종목.txt 로직을 그대로 사용한다.
 - L221: central_stocks = _read_base_stocks_from_central_repository_if_available()
 - L225: if not BASE_STOCK_PATH.exists():
 - L226: BASE_STOCK_PATH.write_text("", encoding="utf-8")
 - ... 외 10개

[출처: base_stock_dependency_scan_report.txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 13:16:38 | 분류: 기타문서/자료]
## gui_stock_register_window.py
- 분류: 실행 경로 검토 필요
- 발견:
 - 기초종목.txt: 11회
 - BASE_STOCK_PATH: 1회
 - read_base_stocks: 3회
 - update_base_stock_routines: 2회
 - normalize_base_stock_single_routine_file: 1회
- 주요 위치:
 - L249: normalize_base_stock_single_routine_file,
 - L254: read_base_stocks,
 - L264: update_base_stock_routines,
 - L271: BASE_STOCK_PATH = PROJECT_ROOT / "기초종목.txt"
 - L345: 기초종목.txt 에는 현재 루틴 등록이 없지만,
 - L372: 기초종목.txt에 기록된 현재 활성 루틴의 runtime 폴더만 반환한다.
 - L659: header_layout.addWidget(QLabel("기초종목.txt 등록 종목 관리"))
 - L944: if update_base_stock_routines(code, name, []):
 - L953: "기초종목.txt",
 - L1091: stock_path = PROJECT_ROOT / "기초종목.txt"
 - L1097: "기초종목.txt 파일이 없습니다.",
 - L1126: "기초종목.txt에서 선택한 종목을 찾지 못했습니다.",
 - ... 외 5개

[출처: base_stock_dependency_scan_report.txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 13:16:38 | 분류: 기타문서/자료]
## gui_windows_149_manual_ats_status_policy_fix.py
- 분류: 구버전/백업성 가능성
- 발견:
 - 기초종목.txt: 38회
 - BASE_STOCK_PATH: 16회
 - read_base_stocks: 10회
 - update_base_stock_routines: 6회
 - normalize_base_stock_single_routine_file: 3회
- 주요 위치:
 - L176: BASE_STOCK_PATH = PROJECT_ROOT / "기초종목.txt"
 - L440: 기초종목.txt 에 이미 저장된 종목 1행의 표시용 검증 상태를 반환한다.
 - L477: 기초종목.txt 활성 루틴은 종목당 1개만 허용한다.
 - L480: 활성 연결은 기초종목.txt의 첫 번째 유효 루틴 1개만 사용한다.
 - L492: def normalize_base_stock_single_routine_file() -> bool:
 - L494: 기존 기초종목.txt에 루틴이 여러 개 저장되어 있으면 첫 번째 루틴만 남긴다.
 - L499: - 자동매매설정 창은 기초종목.txt의 단일 루틴 연결만 표시한다.
 - L501: if not BASE_STOCK_PATH.exists():
 - L504: lines = BASE_STOCK_PATH.read_text(encoding="utf-8").splitlines()
 - L527: BASE_STOCK_PATH.write_text(
 - L535: def read_base_stocks() -> list[dict[str, object]]:
 - L537: 기초종목.txt 를 읽어 종목 목록으로 변환한다.
 - ... 외 59개

[출처: base_stock_dependency_scan_report.txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 13:16:38 | 분류: 기타문서/자료]
## integrity_checker.py
- 분류: 실행 경로 검토 필요
- 발견:
 - 기초종목.txt: 8회
 - read_base_stocks: 2회
- 주요 위치:
 - L66: def read_base_stocks_for_check(base_stock_path: Path) -> list[dict[str, object]]:
 - L176: base_stocks = read_base_stocks_for_check(base_stock_path)
 - L195: f"기초종목.txt {line_no}행",
 - L207: f"기초종목.txt {line_no}행",
 - L219: f"기초종목.txt {line_no}행",
 - L231: f"기초종목.txt {line_no}행",
 - L242: f"기초종목.txt {line_no}행",
 - L253: f"기초종목.txt {line_no}행",
 - L262: f"기초종목.txt {line_no}행",
 - L274: f"기초종목.txt {line_no}행",

[출처: base_stock_dependency_scan_report.txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 13:16:38 | 분류: 기타문서/자료]
## stock_migration_to_central_stocks.py
- 분류: 실행 경로 검토 필요
- 발견:
 - 기초종목.txt: 2회
- 주요 위치:
 - L16: - 기존 기초종목.txt도 삭제하지 않는다.
 - L272: lines.append("기초종목.txt 삭제: 안 함")

[출처: base_stock_dependency_scan_report.txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 13:16:38 | 분류: 기타문서/자료]
## stock_repository.py
- 분류: 핵심 호환/전환 계층
- 발견:
 - 기초종목.txt: 1회
 - read_base_stocks: 4회
 - update_base_stock_routines: 2회
- 주요 위치:
 - L8: - 기초종목.txt 제거와 stocks/ 중앙 종목폴더 일원화를 위한 단일 접근 레이어.
 - L9: - 1차 적용에서는 기존 기능을 깨지 않기 위해 gui_stock_data.read_base_stocks()가
 - L179: def read_base_stocks_compatible(self) -> list[dict[str, Any]]:
 - L291: def read_base_stocks_from_repository() -> list[dict[str, Any]]:
 - L292: return repository().read_base_stocks_compatible()
 - L296: def update_base_stock_routines_in_repository(code: str, name: str, routines: list[str]) -> bool:
 - L298: 기존 update_base_stock_routines() 교체 후보 함수.

[출처: base_stock_dependency_scan_report.txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 13:16:38 | 분류: 기타문서/자료]
======================================================================
판정
- read_base_stocks/update_base_stock_routines 핵심 흐름은 이미 중앙 stocks 우선 구조로 전환된 상태로 보임.
- 남은 기초종목.txt 참조는 크게 3종류로 분류됨:
 1) 중앙 stocks가 없을 때 쓰는 fallback
 2) 화면 문구/리포트 문구에 남은 구형 표현
 3) 구버전/백업성 파일 또는 실제 실행 경로가 불명확한 파일

[출처: README_적용내용(15).txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 12:52:32 | 분류: 기타문서/자료]
# 종목등록설정창 중앙 종목관리 1차 정리 패치
적용 파일:
- gui_stock_register_window.py
수정 내용:
1. 창 제목 표시
 - "기초종목.txt 등록 종목 관리" -> "중앙 종목 관리"

[출처: README_적용내용(15).txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 12:52:32 | 분류: 기타문서/자료]
3. 문구 정리
 - 화면/리포트/체인지로그의 "기초종목.txt" 표현을 "중앙 종목관리" 중심으로 일부 정리했습니다.

[출처: README_적용내용(14).txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 12:22:48 | 분류: 기타문서/자료]
수정 내용:
1. 메인 좌측 루틴 종목수
 - 중앙 stocks/config.json 기준
 - 루틴 미지정 종목 제외
 - 검토관리/검토종목 상태 제외
 - 자동매매설정창 하단 목록 기준과 맞춤

[출처: README_적용내용(13).txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 11:37:30 | 분류: 기타문서/자료]
수정 내용:
1. 메인 좌측 루틴표의 종목수를 더 이상 _MACD매매루틴 폴더 안의 물리 종목폴더 수로 계산하지 않습니다.
2. read_base_stocks() 기준, 즉 중앙 stocks/종목/config.json 기준으로 루틴별 종목수를 계산합니다.
3. 메인 우측 실행종목표의 루틴명도 같은 read_base_stocks() 기준으로 표시합니다.
4. 기존 루틴폴더 잔재 때문에 MACD=20, 등록확인=18처럼 보이던 표시 문제를 수정합니다.

[출처: README_적용내용(12).txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 11:12:32 | 분류: 기타문서/자료]
수정 내용:
- gui_stock_data.py에서 호출하던 `_central_repository_if_available()` 함수 정의 누락을 보정했습니다.
- `_base_stock_routines_from_central_repository_if_available()` 함수도 함께 보정했습니다.
- 기존 의도대로 `stocks/`가 있으면 중앙 종목폴더 기준, 없으면 기존 fallback 기준으로 동작합니다.
- 이번 수정은 NameError 해결 및 중앙 조회 helper 보정 범위입니다.

[출처: README_적용내용(11).txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 11:03:14 | 분류: 기타문서/자료]
# 중앙 stocks 기준 조회 일원화 패치
적용 파일:
- gui_stock_data.py
- stock_repository.py

[출처: README_적용내용(11).txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 11:03:14 | 분류: 기타문서/자료]
핵심 수정:
1. gui_stock_data.base_stock_routines_for_stock()
 - 중앙 stocks/가 있으면 stocks/종목/config.json 기준으로 루틴을 읽습니다.
 - 중앙 구조가 없을 때만 기존 기초종목.txt를 fallback으로 읽습니다.

[출처: README_적용내용(11).txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 11:03:14 | 분류: 기타문서/자료]
2. gui_stock_data.active_routine_for_stock()
 - base_stock_routines_for_stock() 기준으로 통일했습니다.

[출처: README_적용내용(10).txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 10:38:10 | 분류: 기타문서/자료]
# 등록해제 중앙 종목관리 연결 수정
적용 파일:
- gui_auto_trade_unregister.py

[출처: README_적용내용(10).txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 10:38:10 | 분류: 기타문서/자료]
수정 내용:
1. 이 파일 내부의 구버전 update_base_stock_routines()가 더 이상 기초종목.txt를 직접 수정하지 않습니다.
2. gui_base_stock_service.update_base_stock_routines()로 위임합니다.
3. 따라서 stocks/ 중앙 종목폴더가 있으면 stocks/종목/config.json의 루틴 연결을 갱신합니다.
4. stocks/가 없는 경우에는 기존 기초종목.txt fallback 흐름을 유지합니다.
5. state.json/orders.json 초기화 실패 경고의 self 참조 오류 가능성도 window로 수정했습니다.

[출처: README_적용내용(9).txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 10:16:02 | 분류: 기타문서/자료]
# 중앙 stocks 기준 루틴 종목목록 수정
적용 파일:
- gui_auto_trade_runtime.py

[출처: README_적용내용(7).txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 09:26:54 | 분류: 기타문서/자료]
변경 내용:
1. gui_base_stock_service.read_base_stocks()
 - 중앙 stocks/ 폴더가 있으면 stock_repository 기준으로 종목 목록을 읽습니다.
 - 아직 stocks/가 없으면 기존 기초종목.txt를 그대로 사용합니다.

[출처: README_적용내용(7).txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 09:26:54 | 분류: 기타문서/자료]
2. gui_base_stock_service.update_base_stock_routines()
 - 중앙 stocks/ 폴더가 있으면 종목 config.json의 routine 값을 갱신합니다.
 - 아직 stocks/가 없으면 기존 기초종목.txt를 그대로 갱신합니다.

[출처: README_적용내용(5).txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 08:57:30 | 분류: 기타문서/자료]
목적:
- 기초종목.txt 제거와 stocks/ 중앙 종목폴더 일원화를 위한 중간 계층입니다.
- 아직 기존 GUI 코드에 연결하지 않습니다.
- 기존 파일 이동/삭제도 하지 않습니다.

[출처: README_적용내용(5).txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 08:57:30 | 분류: 기타문서/자료]
현재 역할:
1. 중앙 stocks/ 폴더가 있으면 그 기준으로 종목 목록을 읽습니다.
2. 아직 stocks/가 없으면 기존 기초종목.txt를 fallback으로 읽습니다.
3. 기존 read_base_stocks()와 비슷한 형태로 반환하는 호환 함수가 있습니다.
4. 향후 stock_runtime_dir_for_routine()를 대체할 중앙 stocks/ 경로 함수가 있습니다.

[출처: README_적용내용(5).txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 08:57:30 | 분류: 기타문서/자료]
다음 단계:
- 이 파일을 프로젝트 루트에 넣은 뒤 import 오류 없이 로딩되는지 확인.
- 이후 read_base_stocks() 일부 호출부를 repository 호환 함수로 1개씩 바꿔 테스트.

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_4.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-15 23:01:24 | 분류: 대화히스토리]
정렬 상태 관련 함수 전수 조사
↓
gui_auto_trade_sort_state.py 생성
↓
호출부만 교체
순서가 가장 적절합니다.
고고
진행 방향은 맞는데, 여기서부터는 바로 수정본 생성보다 정밀 분석이 먼저입니다.
이유:
지금까지 분리했던
runtime
base_stock
ATS
검토관리
는 독립 함수들이라 비교적 안전했습니다.
그런데 정렬은:

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_4.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-15 23:01:24 | 분류: 대화히스토리]
QTableWidget
선택행
스크롤 위치
현재 정렬컬럼
현재 정렬방향
reload_stock_table()
load_selected_routine_stocks()
전부 연결돼 있습니다.
실제로 최근에 잡은 버그도
정렬
→ 운영변경
→ 종목 원래 자리로 튐
이었고,
그 원인이
capture
restore
reload
selection
흐름 때문이었습니다.
그래서 지금은:

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_4.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-15 23:01:24 | 분류: 대화히스토리]
1. capture_stock_visual_order
2. restore_stock_visual_order
3. capture_stock_table_view_state
4. restore_stock_table_view_state
5. sort_stock_table_by_column
이 함수들이 정확히 어디 있는지,
그리고
load_selected_routine_stocks()
안에서 몇 번 호출되는지부터 파악해야 합니다.
판정:
runtime 분리
base_stock 분리
ATS 분리
처럼 바로 파일 만드는 단계는 아님.
다음 단계는
정렬 관련 함수 전수조사
↓
호출 관계도 작성
↓
분리 가능 여부 판정
이 맞습니다.
지금은 구조개선이 98% 이상 진행된 상태라, 마지막 2%를 성급하게 건드리는 게 오히려 위험합니다.
오키 고고
kiwoom_auto (13).zip
ZIP 아카이브
꼼꼼히 분석해봐
30s 동안 생각함
다시 분석해보니, 아직 쪼갤 대상은 남아 있습니다.

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_4.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-15 23:01:24 | 분류: 대화히스토리]
주요 분리 파일: runtime, table_loader, status_ops, close, policy, timer, run_control, review_ops, context_menu, selection, ats_ops, situation, base_stock 등

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_4.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-15 23:01:24 | 분류: 대화히스토리]
image(767).png
image(768).png
하이닉스에 임의로 자료 넣고 시작해서 검토관리 메세지는 나왔는데 검토관리 창에는 없어
image(769).png
image(770).png
검토관리 버튼의 숫자는 카운트 되는데 안에는 없다
지금 단계에서는 네가 삭제한 건 오히려 잘한 것일 수도 있다.
왜냐하면 방금 확인한 검토종목은
보유 122120
평단 21220
를 테스트용으로 강제로 넣은 상태였고,
실제 복귀 정책 검증 전에 삭제해버렸으니까.
그리고 지금 질문한 "종목 폴더 정리하면서 찌꺼기"가 더 중요하다.
현재까지 종목 통합하면서 남았을 가능성이 있는 찌꺼기는:

[출처: 갱신메모\auto_trade_setting_remaining_methods_report.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-11 17:27:58 | 분류: 갱신문서]
- load_selected_routine_stocks: 431줄 (1893-2323)
- confirm_stop_targets_once: 65줄 (2663-2727)
- save_selected_manual_ats_state: 59줄 (1566-1624)
- __init__: 53줄 (1093-1145)
- _setup_ui: 51줄 (1147-1197)
- toggle_selected_manual_override_flag: 51줄 (1723-1773)
- open_selected_manual_ats_settings_dialog: 44줄 (1626-1669)
- _setup_stock_table: 42줄 (1224-1265)
- reset_selected_manual_override: 42줄 (1775-1816)
- split_start_targets: 37줄 (2568-2604)
- mark_review_required: 34줄 (2369-2402)
- show_auto_trade_result_dialog: 34줄 (2729-2762)
- load_routine_table: 32줄 (1818-1849)
- split_stop_targets: 32줄 (2606-2637)
- sort_stock_table_by_column: 30줄 (1332-1361)
- show_selected_ats_immediate_sell_placeholder: 30줄 (1678-1707)
- _apply_stock_table_column_widths: 26줄 (1267-1292)
- pre_start_review_check: 25줄 (2343-2367)
- _setup_routine_table: 24줄 (1199-1222)
- on_stock_table_item_double_clicked: 24줄 (1492-1515)
## 전체 메서드 목록

[출처: 갱신메모\auto_trade_setting_remaining_methods_report.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-11 17:27:58 | 분류: 갱신문서]
- 테이블/목록 로딩: 18개 / 약 721줄
 - load_selected_routine_stocks: 431줄
 - _setup_stock_table: 42줄
 - load_routine_table: 32줄
 - sort_stock_table_by_column: 30줄
 - _apply_stock_table_column_widths: 26줄
 - _setup_routine_table: 24줄
 - on_stock_table_item_double_clicked: 24줄
 - refresh_all: 20줄
- 수동/ATS/운영설정: 22개 / 약 386줄
 - save_selected_manual_ats_state: 59줄
 - toggle_selected_manual_override_flag: 51줄
 - open_selected_manual_ats_settings_dialog: 44줄
 - reset_selected_manual_override: 42줄
 - show_selected_ats_immediate_sell_placeholder: 30줄
 - set_selected_individual_schedule_time: 23줄
 - selected_manual_ats_state: 21줄
 - recalculate_stock_status_by_operation_policy: 18줄
- 종목등록/루틴: 15개 / 약 72줄
 - current_selected_routine_dir: 19줄
 - update_stock_status: 18줄
 - current_selected_routine_name: 11줄
 - has_selected_stock: 2줄
 - has_single_selected_stock: 2줄
 - on_stock_selection_changed: 2줄
 - select_all_current_routine_stocks: 2줄
 - clear_current_routine_stock_selection: 2줄
- 검토/안정성/상태: 9개 / 약 98줄
 - mark_review_required: 34줄
 - pre_start_review_check: 25줄
 - statusBarMessage: 14줄
 - individual_liquidation_status_text: 8줄
 - statusBar_message: 8줄
 - reset_runtime_statuses_on_window_start: 3줄
 - resume_status_after_pause: 2줄
 - open_review_required_window: 2줄
- 주문/로그/청산: 8개 / 약 74줄
 - show_auto_trade_result_dialog: 34줄
 - apply_selected_early_close: 19줄
 - closeEvent: 11줄
 - open_selected_individual_liquidation_settings: 2줄
 - save_selected_individual_liquidation_settings: 2줄
 - apply_selected_early_close_default: 2줄
 - apply_selected_early_close_profit_loss: 2줄
 - open_log_view_window: 2줄
- 기타 UI: 14개 / 약 294줄
 - confirm_stop_targets_once: 65줄
 - __init__: 53줄
 - _setup_ui: 51줄
 - split_start_targets: 37줄
 - split_stop_targets: 32줄
 - _connect_events: 17줄
 - update_action_buttons: 12줄
 - stop_risk_parts: 12줄

[출처: 마스터스펙\MASTER_SPEC_v2.0_FULL_INTEGRATED_ARCHIVE_2026-06-11.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-11 15:25:42 | 분류: MASTER_SPEC]
- 전량 정리 완료 → 감시/대기
- 익일이월 → 검토종목
- 청산실패 → 검토종목
- 잔량발생 → 검토종목
- 계좌 단위 문제 → 긴급정지
---
## 4.5 긴급정지
계좌 단위 문제, 시스템 이상, API 이상, 운영자 강제중단 시 사용하는 비상 상태이다.
진입 예:

[출처: 마스터스펙\MASTER_SPEC_v2.0_FULL_INTEGRATED_ARCHIVE_2026-06-11.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-11 15:25:42 | 분류: MASTER_SPEC]
- 루틴 유지 + 시간조건 제거 + 즉시평가
- 현재가 청산
- 시장가 청산
- 지정가 청산
- 익절 N% 이상 청산
- 손절 N% 이하 청산
- 익일이월
청산 실패:
```text
청산실패
→ 검토종목
```
잔량 발생:
```text
잔량발생
→ 검토종목
```
익일이월:
```text
익일이월
→ 검토종목
```
---
# 12. 검토종목 정책
## 12.1 목적

[출처: 마스터스펙\MASTER_SPEC_v2.0_FULL_INTEGRATED_ARCHIVE_2026-06-11.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-11 15:25:42 | 분류: MASTER_SPEC]
검토종목은 자동매매 신뢰성이 훼손되었거나 운영자 확인이 필요한 종목을 자동운영에서 분리하여 관리하는 격리 영역이다.
---
## 12.2 검토위치와 상세원인
v1.2에서는 `진입사유`라는 단일 표현을 사용하지 않는다.
대신 아래 두 값을 분리한다.
```text
검토위치 = 문제 유형
상세원인 = 발생 원인
```
검토위치 예:

[출처: 마스터스펙\MASTER_SPEC_v2.0_FULL_INTEGRATED_ARCHIVE_2026-06-11.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-11 15:25:42 | 분류: MASTER_SPEC]
- HTS 수동매도
- HTS 수동매수
- HTS 수동취소
- API 조회 실패
- 프로그램 재시작
- 파일 누락
- JSON 손상
- 루틴 폴더 삭제
- 종목 폴더명 변경
HTS 수동개입은 검토위치가 아니라 상세원인으로 기록하는 것을 기본으로 한다.
예:
```text
검토위치: 수량불일치
상세원인: HTS 수동매도
```
```text
검토위치: 주문불일치
상세원인: HTS 수동취소
```
---
## 12.3 검토종목 필수 기록값

[출처: 마스터스펙\MASTER_SPEC_v2.0_FULL_INTEGRATED_ARCHIVE_2026-06-11.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-11 15:25:42 | 분류: MASTER_SPEC]
- 자동 무결성 검사 통과
- 전체 무결성 검사 통과 권장
- 긴급정지 아님
- 검토종목 아님
- 주문 가능 상태 확인
- 현재가 조회 가능
- 계좌 조회 가능
---
# 23. 코드 반영 순서
v1.2 기준 코드 반영은 아래 순서로 진행한다.

[출처: 작업재개요약서_2026_06_09_관제창이후 (1).md | 기준일: 2026-06-09 | 수정시각: 2026-06-09 15:33:24 | 분류: 작업재개요약]
### 검토관리
- 검토종목은 일반 목록에서 관리하지 않는다.
- 검토관리창에서만 관리한다.
- 검토관리 버튼으로 접근한다.

[출처: 구조개선_작업재개_상세판_v2026-06-07.md | 기준일: 2026-06-07 | 수정시각: 2026-06-07 19:04:42 | 분류: 작업재개요약]
--------------------------------------------------
# 2. 현재 확정된 상태 체계
--------------------------------------------------
실사용 상태
1. 감시/대기
2. 매수/매도
3. 자동마감
4. 긴급정지
5. 검토종목
검토종목은 정상 운영 상태가 아님.

[출처: 구조개선_작업재개_상세판_v2026-06-07.md | 기준일: 2026-06-07 | 수정시각: 2026-06-07 19:04:42 | 분류: 작업재개요약]
--------------------------------------------------
# 13. 검토종목 정책
--------------------------------------------------
중요
최근 확정 방향
검토종목은
자동매매설정 창에서 제거
검토관리 창에서만 관리

[출처: 구조개선_작업재개_상세판_v2026-06-07.md | 기준일: 2026-06-07 | 수정시각: 2026-06-07 19:04:42 | 분류: 작업재개요약]
--------------------------------------------------
# 15. 돌려보내기 버튼
--------------------------------------------------
임시 기능
검토관리 창 내부
동작
검토종목
→ 감시/대기
복귀
→ 자동매매설정 목록 복귀

[출처: 구조개선_작업재개_상세판_v2026-06-07.md | 기준일: 2026-06-07 | 수정시각: 2026-06-07 19:04:42 | 분류: 작업재개요약]
--------------------------------------------------
# 17. 다음 창 최우선 작업
--------------------------------------------------
1순위
검토종목 완전 분리
--------------------------------------------------
2순위
검토관리 돌려보내기 검증
--------------------------------------------------
3순위
감시종료
→ 수동정지
최종 확정
--------------------------------------------------
4순위
시작 컬럼 최종 UI
--------------------------------------------------
5순위
개별종목 추가시간 옵션 설계

[출처: 구조개선_작업재개_상세판_v2026-06-07.md | 기준일: 2026-06-07 | 수정시각: 2026-06-07 19:04:42 | 분류: 작업재개요약]
--------------------------------------------------
# 18. 절대 잊으면 안 되는 정책
--------------------------------------------------
검토종목은
자동매매설정 창 관리 대상 아님
검토관리 창 전용
반복적으로 논의됨
현재 최우선 정책

[출처: 작업재개요약서_2026-06-07.md | 기준일: 2026-06-07 | 수정시각: 2026-06-07 19:04:30 | 분류: 작업재개요약]
1. 검토종목 완전 분리 마무리
2. 검토관리 돌려보내기 검증
3. 매매시작 / 수동정지 개념 확정
4. 시작 컬럼 표시 최종 정리
5. 개별종목 추가시간 옵션 설계

[출처: 작업진행상황대화히스토리.txt | 기준일: 2026-06-06 | 수정시각: 2026-06-06 23:18:38 | 분류: 대화히스토리]
종목 검토위치
삼성전자 익일이월
NAVER HTS수동개입
LG전자 청산실패
현대차 무결성실패
이렇게 보이면 운영자가 바로 이해합니다.
더 나아가면
검토종목 테이블
종목
검토위치
진입시간
현재상태
조치
예)

[출처: 작업진행상황대화히스토리.txt | 기준일: 2026-06-06 | 수정시각: 2026-06-06 23:18:38 | 분류: 대화히스토리]
나쁜 예
상태 : REVIEW_REQUIRED
사유 : CARRY_OVER
좋은 예
검토종목
(익일이월)
또는

[출처: 작업진행상황대화히스토리.txt | 기준일: 2026-06-06 | 수정시각: 2026-06-06 23:18:38 | 분류: 대화히스토리]
종목 설정 변경
↓
refresh_all()
↓
load_selected_routine_stocks()
↓
종목목록 재구성
↓
정렬 적용
↓
스크롤 위치도 변함
이 흐름일 가능성이 높음.
그래서 "스크롤 복원" 문제가 아니라
종목목록 자체를 다시 정렬해서 새로 만들고 있는 문제일 수 있음.
2. 상태 / 시간 확인
현재 화면 시간
오전 11:01
종목 상태
수동 → 매수/매도
시간운영 → 감시/매도
보이는 결과만 보면
운영 상태
수동 매수/매도
09:30~10:20 감시/매도
이건 정상.
왜냐면
11:01
은
09:30~10:20
밖이라
감시/매도
가 맞음.
하지만 하나 이상한게 있음.
현재 화면에서
카카오게임즈
상태 = 매수/매도
운영 = 수동
인데
수동 종목이 전부 매수/매도 상태로 보임.
즉 현재는
수동
=
정규장 시간 내
=
매수/매도
로 판단중.
이건 네가 정의한 정책과는 맞음.
지금 제일 의심되는 건 이것.
종목창 자동 정렬
문제가 아니라
refresh_all()
↓
load_selected_routine_stocks()
가 호출될 때
stocks.sort(...)
또는
sorted(...)
가 들어가 있는지.
다음 단계는

[출처: 작업진행상황대화히스토리.txt | 기준일: 2026-06-06 | 수정시각: 2026-06-06 23:18:38 | 분류: 대화히스토리]
apply_time_policy_to_all_stocks()
refresh_stock_table()
계열 호출이 빠져 있을 가능성이 가장 높다.
이거 잡으면 시간정책 파트는 거의 마무리 단계다.
쉽게 말하면 지금 동작이 이렇게 된 거야.
지금 상태
프로그램을 다시 켬.
1. 이전 상태 삭제
 매수/매도 → 감시/대기
 감시/매도 → 감시/대기
2. 여기서 멈춤
그래서 화면이 전부 감시/대기로 보임.
원래 원하는 상태
프로그램을 다시 켬.
1. 이전 상태 삭제
 전부 감시/대기
2. 현재 시간 확인

[출처: 관제창_UI_정책확정안_v1.md | 기준일: 2026-06-05 | 수정시각: 2026-06-05 14:27:14 | 분류: 운영정책]
- 검토종목(익일이월)
- 검토종목(수량불일치)
- 검토종목(주문불일치)
- 검토종목(청산실패)
- 검토종목(잔량발생)
- 검토종목(무결성실패)

[출처: 중요문서1\검토종목_관리정책_확정안_v1.md | 기준일: 2026-06-05 | 수정시각: 2026-06-05 13:32:52 | 분류: 운영정책]
# 검토종목 관리정책 확정안 v1
## 1. 목적

[출처: 중요문서1\검토종목_관리정책_확정안_v1.md | 기준일: 2026-06-05 | 수정시각: 2026-06-05 13:32:52 | 분류: 운영정책]
- 검토종목은 자동매매 대상에서 제외한다.
- 검토종목은 운영자 확인 전 자동복귀 금지.
- 검토종목 복귀는 수동 무결성 검사 후 현재조건 재판정으로만 가능.
- 종목 단위 문제는 해당 종목만 검토종목으로 이동한다.
- 계좌 단위 문제는 검토종목이 아니라 긴급정지로 처리한다.
---
## 3. 표시 기준
관제센터 및 관리창에서는 `진입사유`보다 `검토위치`를 우선 표시한다.
이유:

[출처: 중요문서1\검토종목_관리정책_확정안_v1.md | 기준일: 2026-06-05 | 수정시각: 2026-06-05 13:32:52 | 분류: 운영정책]
```text
검토종목
↓
운영자 확인
↓
문제 해결
↓
수동 무결성 검사
↓
통과
↓
현재조건 재판정
↓
감시/대기 또는 매수/매도 또는 감시/매도
```
무결성 검사 실패 시 검토종목 유지.
---
## 8. 익일이월 처리 확정
익일이월은 검토종목으로 이동한다.
```text
장마감
↓
익일이월 선택 또는 잔량 이월
↓
검토종목
```
익일 자동재개 금지.
---
## 9. UI 표시안
검토종목 관리창 기본 컬럼:

[출처: 중요문서1\구조개선_설계의사결정기록_ADR_v1 .md | 기준일: 2026-06-05 | 수정시각: 2026-06-05 12:02:06 | 분류: 기타문서/자료]
--------------------------------------------------
ADR-003
검토종목 개념 채택
--------------------------------------------------
문제
자동매매 신뢰성이 훼손된 종목을
즉시 정상운영에 복귀시키는 것은 위험
결론
검토종목 도입
자동매매 격리구역으로 사용

[출처: 중요문서1\구조개선_설계의사결정기록_ADR_v1 .md | 기준일: 2026-06-05 | 수정시각: 2026-06-05 12:02:06 | 분류: 기타문서/자료]
--------------------------------------------------
ADR-004
검토종목 자동복귀 금지
--------------------------------------------------
문제
원인 확인 없이 복귀 시
동일 문제 반복 가능
결론
운영자 확인
수동 무결성 검사
후 복귀

[출처: 중요문서1\구조개선_설계의사결정기록_ADR_v1 .md | 기준일: 2026-06-05 | 수정시각: 2026-06-05 12:02:06 | 분류: 기타문서/자료]
--------------------------------------------------
ADR-007
HTS 수동개입 처리
--------------------------------------------------
문제
프로그램과 실제 계좌 상태 불일치
결론
즉시 검토종목

[출처: 중요문서1\구조개선_설계의사결정기록_ADR_v1 .md | 기준일: 2026-06-05 | 수정시각: 2026-06-05 12:02:06 | 분류: 기타문서/자료]
--------------------------------------------------
ADR-011
매도 타이밍 유실
--------------------------------------------------
문제
자동매매 핵심 타이밍 상실
결론
검토종목 이동

[출처: 중요문서1\구조개선_설계의사결정기록_ADR_v1 .md | 기준일: 2026-06-05 | 수정시각: 2026-06-05 12:02:06 | 분류: 기타문서/자료]
--------------------------------------------------
ADR-015
상태 우선순위
--------------------------------------------------
현재 후보
1. 검토종목
2. 긴급정지
3. 계좌 무결성
4. 종목 무결성
5. 청산정책
6. 운영방식
7. 루틴신호

[출처: 중요문서1\구조개선_정책설계_상세기준서_v1.md | 기준일: 2026-06-05 | 수정시각: 2026-06-05 12:01:06 | 분류: 운영정책]
- 신규 매수 금지
- 신규 매도 금지
- 자동판단 중지
- 자동청산 중지
- 실시간 감시 유지
- 계좌조회 유지
해제
- 자동복귀 금지
- 종목별 무결성 검사 수행
무결성 통과
- 현재조건 재판정 후 운영 복귀
무결성 실패
- 검토종목 이동
# 4. 검토종목
정의
자동매매 신뢰성이 훼손된 종목 격리구역
자동복귀
- 금지
복귀 방법
- 운영자 문제 해결
- 수동 무결성 검사
- 통과 시 현재조건 재판정
검토종목 이동 조건

6. 루틴 패키지 구조
================
[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
**제거/개선한 하드코딩**
- "지표추종매매만 지원" 계열 제한 제거
- routine_name ==/!= "지표추종매매" 분기 제거
- routines/지표추종매매/rules.json 직접 참조 제거
- 설정창 호출 시 routine_record에서 routine_path, rules_path, routine_name, settings_ui를 받아 사용하도록 변경
- Registry가 routine.json에서 name/path/rules_path/engine/settings_ui 역할 정보를 제공하도록 확장
- 전용 설정창이 없는 루틴은 깨지지 않고 “설정창 미연결” 안내로 처리

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
**남은 루틴명 문자열**
- routines/지표추종매매/routine.json
 - "name": "지표추종매매": 루틴 메타데이터라 유지
 - "legacy_dir": "_지표추종매매": 기존 폴더 호환 메타데이터라 유지
코드 파일 쪽 지표추종매매 직접 문자열은 0건입니다.

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
판정: 이제 신규 루틴을 routines/새루틴명/routine.json 형태로 추가하면 코드 수정 없이 Registry에 등록됩니다. 전용 설정창이 없으면 프로그램이 깨지지 않고 안내만 표시됩니다.
체크 부분들의 구체적인 기능을 고민해야해
??
배치 조정안 검토 이해가능?
내 요구 사항과 다른 배치
kiwoom_auto (16)(1).zip
ZIP 아카이브
이전으로 복원했다...하나씩 가자
순환마감설정도 삭제
변경 사항이 없다.
kiwoom_auto (17)(1).zip
ZIP 아카이브
다시 분석해. 그리고 내 요청사항을 다 확인해줘
반복매수설정은 이미지 확인
이게 의도한건가?
조금만 더 수정하면 될듯. 소제과 그 설정들을 다시 배치 해줘봐
각 공간에 배치는 됐지만 정렬이나 공백등이 정리가 안되어 있다..
gui_macd_buy_controls(4).py
Python
gui_macd_buy_method_controls(14).py
Python
gui_macd_control_tab(1).py
Python
파악부터 해라
왜 이렇게 됐을까?
gui_macd_control_tab(2).py
Python
분석해봐
gui_macd_buy_controls(5).py
Python
gui_macd_buy_method_controls(15).py
Python

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
engines/indicator_engine.py
engines/condition_engine.py
gui_indicator_follow_sell_controls.py 일부
routine_condition_engine.py
예:

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\AutoTrading_System_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:16:58 | 분류: MASTER_SPEC]
3.4 Routine Loading
- 루틴 패키지 자동 인식
- routine.json 기반 루틴 등록
- 설정창/엔진 연결 정보 확인

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
결과: - STEP1 통과 - STEP2 통과 - STEP3 probe 통과 - signal=None 비신호
처리 정상 - execution_enabled=False 유지
검색: - findstr /S /I “HOLD” engines*.py routines*.py *.py
결과: - 실사용 코드 HOLD 검출 없음
5.2 로그 정리

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_01.txt | 기준일: 2026-06-30 | 수정시각: 2026-07-01 08:03:04 | 분류: MASTER_SPEC]
결과: - STEP1 통과 - STEP2 통과 - STEP3 probe 통과 - signal=None 비신호
처리 정상 - execution_enabled=False 유지
검색: - findstr /S /I “HOLD” engines.py routines.py *.py
결과: - 실사용 코드 HOLD 검출 없음
5.2 로그 정리
기존 runtime/routine_signal_probe.log에는 과거 HOLD

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_138_파일시스템_Storage관리체계_신규.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:52:34 | 분류: MASTER_SPEC]
2. 관리 대상
- 설정 파일
- Runtime 파일
- 로그 파일
- 루틴 패키지
- 종목 데이터
- 백업 파일
- 테스트 데이터
- 문서

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_통합갱신자료_2026-06-30.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:21:22 | 분류: 갱신문서]
결과:
- STEP1 통과
- STEP2 통과
- STEP3 probe 통과
- signal=None 비신호 처리 정상
- execution_enabled=False 유지
검색:
- findstr /S /I "HOLD" engines\*.py routines\*.py *.py
결과:
- 실사용 코드 HOLD 검출 없음
5.2 로그 정리

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART27_1차본_27.1-27.10.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:28:49 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
27.4 routine.json 역할
routine.json은 루틴의 기본 정보와 메타데이터를 관리한다.

[출처: kiwoom_auto_43_분석보고_v2026-06-19.txt | 기준일: 2026-06-19 | 수정시각: 2026-06-19 08:14:11 | 분류: 구현로그/검증보고]
주요 확인 파일:
- engines/macd_signal_engine.py
- routines/MACD매매루틴/routine.py
- routines/MACD매매루틴/rules.json
- gui_macd_routine_settings_dialog.py
- gui_macd_routine_settings_dialog_STEP29.py
- gui_routine_assign_window.py
- gui_routine_assign_window_STEP31_add_macd_settings_button.py
- test_macd_settings_dialog_step30.py
- test_routine_assign_window_step32.py
- test_sell_profit_rate_signal_logic_step23.py

[출처: kiwoom_auto_43_분석보고_v2026-06-19.txt | 기준일: 2026-06-19 | 수정시각: 2026-06-19 08:14:11 | 분류: 구현로그/검증보고]
정적 검증:
- python -m py_compile 기준:
 - engines/macd_signal_engine.py
 - routines/MACD매매루틴/routine.py
 - gui_routine_assign_window.py
 - gui_routine_assign_window_STEP31_add_macd_settings_button.py
 - gui_macd_routine_settings_dialog.py
 - test_macd_settings_dialog_step30.py
 - test_routine_assign_window_step32.py
 문법 컴파일 통과.
판정:
- 문법 오류는 현재 확인되지 않음.
- GUI 런타임 검증은 사용자 PC 필요.

[출처: STEP36_최신프로젝트_GUI구조재검증_STEP29_STEP35_적용가능성판정_v2026-06-19.txt | 기준일: 2026-06-19 | 수정시각: 2026-06-19 07:59:56 | 분류: 구현로그/검증보고]
검증한 실제 파일:
- gui_routine_assign_window.py
- gui_auto_trade_setting_window.py
- gui_routine_registry.py
- gui_routine_service.py
- gui_routine_policy.py
- routines/MACD매매루틴/routine.json
- routines/MACD매매루틴/rules.json

[출처: STEP36_최신프로젝트_GUI구조재검증_STEP29_STEP35_적용가능성판정_v2026-06-19.txt | 기준일: 2026-06-19 | 수정시각: 2026-06-19 07:59:56 | 분류: 구현로그/검증보고]
------------------------------------------------------------
4. routine_display_name / routine.json 확인
------------------------------------------------------------

[출처: STEP36_최신프로젝트_GUI구조재검증_STEP29_STEP35_적용가능성판정_v2026-06-19.txt | 기준일: 2026-06-19 | 수정시각: 2026-06-19 07:59:56 | 분류: 구현로그/검증보고]
실제 gui_routine_registry.py 확인:
- routine_display_name(path)는 routine.json 패키지 record.name을 우선 사용한다.

[출처: STEP28_GUI파일구조확인_MACD설정UI_부착위치판정_v2026-06-19.txt | 기준일: 2026-06-19 | 수정시각: 2026-06-19 07:33:10 | 분류: 구현로그/검증보고]
확인 대상 주요 파일:
- gui_routine_assign_window.py
- gui_auto_trade_setting_window.py
- gui_routine_condition_engine.py
- gui_routine_registry.py
- gui_routine_service.py
- gui_routine_policy.py
- routines/MACD매매루틴/routine.py
- routines/MACD매매루틴/rules.json
- engines/macd_signal_engine.py

[출처: STEP27_MACD설정UI_초안설계_B안_확장형_v2026-06-19.txt | 기준일: 2026-06-19 | 수정시각: 2026-06-19 07:26:36 | 분류: 구현로그/검증보고]
실제 UI 구현 전 확인 대상:
- gui_routine_condition_engine.py
- gui_routine_assign_window.py
- gui_auto_trade_setting_window.py
- routines/MACD매매루틴/routine.py
- routines/MACD매매루틴/rules.json
- engines/macd_signal_engine.py

[출처: STEP23_profit_rate_sell_signal_logic_검증보고.txt | 기준일: 2026-06-19 | 수정시각: 2026-06-19 06:59:00 | 분류: 구현로그/검증보고]
적용 대상:
- engines/macd_signal_engine.py
- routines/MACD매매루틴/routine.py
- test_sell_profit_rate_signal_logic_step23.py 신규

[출처: 마스터스펙\STEP30_MACD설정다이얼로그_독립검증파일_생성보고_v2026-06-19\AI오염복구기록_v2026-06-18_HOLD오염_Cancel혼선_rules구조.txt | 기준일: 2026-06-19 | 수정시각: 2026-06-19 06:18:22 | 분류: 구현로그/검증보고]
오염 확인:
- engines/signal_result.py
- engines/macd_signal_engine.py
- routines/MACD매매루틴/routine.py
- routines/MACD매매루틴/routine_macd_engine.py
- routines/MACD매매루틴/routine_condition_engine.py
- gui_routine_condition_engine.py
- create_test_candles_step5.py
- test_macd_routine_step1.py
- test_macd_routine_step2.py
- STEP13_실제주문_안전요구사항 원본 일부 문장

[출처: 마스터스펙\STEP30_MACD설정다이얼로그_독립검증파일_생성보고_v2026-06-19\작업재개요약서_v2026-06-18_MACD루틴_HOLD오염복구_rules구조_STEP22완료.txt | 기준일: 2026-06-19 | 수정시각: 2026-06-19 06:18:18 | 분류: 작업재개요약]
수정 완료 파일:
- engines/signal_result.py
- engines/macd_signal_engine.py
- routines/MACD매매루틴/routine.py
- routines/MACD매매루틴/routine_macd_engine.py
- routines/MACD매매루틴/routine_condition_engine.py
- gui_routine_condition_engine.py
- create_test_candles_step5.py
- test_macd_routine_step1.py
- test_macd_routine_step2.py

[출처: 추가_HOLD_오염제거_패치검증보고.txt | 기준일: 2026-06-18 | 수정시각: 2026-06-18 18:36:43 | 분류: 갱신문서]
routine_condition_engine.py: syntax=OK, HOLD occurrences=0, RoutineSignal_HOLD=0
gui_routine_condition_engine.py: syntax=OK, HOLD occurrences=0, RoutineSignal_HOLD=0
create_test_candles_step5.py: syntax=OK, HOLD occurrences=0, RoutineSignal_HOLD=0

[출처: 마스터스펙\01_MASTER_SPEC_v2.3_2026-06-16_종목폴더통합_검토관리_최신갱신.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-16 17:44:44 | 분류: 갱신문서]
config.json 기준:
- routine
- routine_name
- assigned_routine
- active_routine
- routines
는 루틴 연결 상태를 표현한다.
종목당 활성 루틴은 현재 정책상 1개를 기준으로 한다.

[출처: README_적용내용(11).txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 11:03:14 | 분류: 기타문서/자료]
4. stock_repository.update_stock_routine()
 - routine, routine_name, assigned_routine, active_routine, routines를 모두 갱신/정리합니다.
 - 해제 시 모든 루틴 연결 필드가 비워집니다.

7. 자동매매 상태/현황 정책
====================
[출처: 마스터스펙\MASTER_SPEC_최신정리본_2026-07-03.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:40:50 | 분류: MASTER_SPEC]
5. 01_Order_Pipeline_merged.txt
 - 주문 상태 전이, preview 범위, 실주문 금지선, SendOrder 조건을 확인한다.

[출처: 마스터스펙\MASTER_SPEC_최신정리본_2026-07-03.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:40:50 | 분류: MASTER_SPEC]
==================================================
4. 최신 핵심 결론
==================================================
주문 파이프라인은 현재 Preview 단계까지만 구현 기준으로 본다.
최신 상태 전이 기준:
PENDING
 -> APPROVED
 -> BLOCKED
APPROVED
 -> EXECUTABLE
 -> BLOCKED_POLICY
EXECUTABLE
 -> REAL_READY
 -> BLOCKED_REAL
REAL_READY
 -> Adapter Request Preview
ORDER_QUEUED
 -> SendOrder 결과 이후 DONE 또는 ERROR

[출처: 마스터스펙\MASTER_SPEC_최신정리본_2026-07-03.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:40:50 | 분류: MASTER_SPEC]
최신 판단:
- Adapter Request Preview는 메모리 dict 반환만 의미한다.
- Adapter Request Preview는 order_queue.json status를 변경하지 않는다.
- ADAPTER_READY는 공식 주문 상태로 사용하지 않는다.
- REAL_READY -> ADAPTER_READY 자동 전이는 금지한다.
- REAL_READY -> ORDER_QUEUED 자동 전이는 금지한다.
- ORDER_QUEUED는 실제 SendOrder 직전 또는 SendOrder 요청 등록 상태로만 사용한다.
- SendOrder는 현재 단계에서 구현하지 않는다.
- execution_enabled는 기본 false이며 자동 true 전환을 금지한다.

[출처: 마스터스펙\MASTER_SPEC_최신정리본_2026-07-03.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:40:50 | 분류: MASTER_SPEC]
2. Approval 단계
- PENDING -> APPROVED
- PENDING -> BLOCKED
- APPROVED 외 상태 변경 없음

[출처: 마스터스펙\MASTER_SPEC_최신정리본_2026-07-03.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:40:50 | 분류: MASTER_SPEC]
4. Preflight 단계
- EXECUTABLE -> REAL_READY
- EXECUTABLE -> BLOCKED_REAL
- guard 검증
- 상태 외 부작용 없음

[출처: 마스터스펙\MASTER_SPEC_최신정리본_2026-07-03.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:40:50 | 분류: MASTER_SPEC]
11. 최종 검증
- 중복주문 방지
- 재시작 복구
- 상태 전이 검증
- Audit Log 검증
- 검토관리 검증

[출처: 마스터스펙\MASTER_SPEC_최신정리본_2026-07-03.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:40:50 | 분류: MASTER_SPEC]
"2026-07-03 현재, MASTER_SPEC 작업의 최신 정본 기준은
MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED 이며,
실주문/SendOrder는 아직 구현 금지 상태이고,
주문 파이프라인은 Adapter Request Preview까지를 공식 구현 범위로 한다."

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\90_Misc_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
목적
- 본 문서는 주문 파이프라인 전체의 상태 전이와 주요 의사결정을 추적하기 위한 Audit Log 기준을 정의한다.
- Audit Log는 실행 로직이 아니라 추적·복구·검토관리·디버깅을 위한 기록 계층이다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\90_Misc_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
4. 각 단계 완료 조건
==================================================
ExecutionController
- SendOrder 없음
- 상태 전이 없음
- 인터페이스만 검증
Final Guard
- 모든 차단 조건 검증
- ORDER_QUEUED 생성 없음
Lock
- 중복 검증
- Runtime 저장 없음
Execution Request
- 데이터 생성
- SendOrder 없음
Boundary
- Preview와 실제 요청 일치 검증
- SendOrder는 별도 단계

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\90_Misc_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
- 설계 일치 여부
- MASTER SPEC 일치 여부
- 기존 정책 위반 여부
- 상태 전이 오류
- 책임 분리 오류
- 신규 개념 생성 여부
- 구현 범위 초과 여부
- 다음 단계 적합성

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\90_Misc_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
Codex - 독자적 설계 변경 금지 - 신규 정책 생성 금지 - 신규 상태값 생성
금지 - 사용자 승인 없는 구조 변경 금지

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\06_Glossary_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
6. Adapter Request Preview
==================================================
SendOrder 요청 형식을 메모리에서만 생성하는 미리보기.
파일과 상태를 변경하지 않는다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\06_Glossary_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
10. Position
==================================================
실제 보유 상태.
Order가 아니라 Fill의 결과이다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\06_Glossary_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
15. Audit Log
==================================================
상태 전이와 주요 이벤트를 기록하는 감사 계층.
실행 판단은 하지 않는다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\06_Glossary_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
16. Runtime
==================================================
프로그램 실행 중 유지되는 상태 데이터(JSON/JSONL).

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\06_Glossary_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
운영 용어
==================================================
Review
- 수동 검토가 필요한 항목.
Recovery
- 재시작 또는 장애 이후 상태 복구.
Audit
- 운영 이력 및 추적 기록.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\05_Operations_Policy_Governance_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
3. Runtime 인수
==================================================
□ Runtime 규격 준수
□ ID 무결성 유지
□ 상태 전이 검증
□ Recovery 절차 확인

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\05_Operations_Policy_Governance_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
2. 운영 시작 조건
==================================================
□ Runtime 무결성 확인
□ Guard 상태 확인
□ 계좌 선택 확인
□ 로그인 확인
□ Review 미처리 항목 확인
□ Recovery 완료 확인

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\05_Operations_Policy_Governance_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
5. 장애 대응
==================================================
- Runtime 손상 → Recovery 절차
- 상태 불일치 → Review Management
- 계좌/로그인 이상 → 실주문 차단
- 원인 불명 → 운영 중단 후 분석

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\05_Operations_Policy_Governance_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
6. 운영 기록
==================================================
기록 대상
- 운영 시작
- 운영 종료
- 주요 상태 전이
- Review 발생
- Recovery 수행
- 장애 발생

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\05_Operations_Policy_Governance_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
1. 위험 분류
① 아키텍처 위험
② Runtime 데이터 위험
③ 상태 전이 위험
④ 실주문 위험
⑤ 복구 위험
⑥ 운영자 실수 위험
2. 주요 위험과 대응

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\05_Operations_Policy_Governance_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
[상태 전이 위험]
- 원인: State Machine 우회
- 대응:
 - Controller만 상태 변경
 - 허용 전이만 사용

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\05_Operations_Policy_Governance_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
4. 호환성
- Runtime 포맷 변경은 최소화한다.
- 상태값 변경은 State Machine 검토 후 적용한다.
- ID 체계는 유지한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\05_Operations_Policy_Governance_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
6. 품질 지표
- 테스트 성공 여부
- 회귀 실패 여부
- Runtime 오류 여부
- 상태 전이 오류 여부
- 검토관리 발생 건수

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\05_Operations_Policy_Governance_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
7. 품질 저하로 판단하는 사례
- 테스트 없이 병합
- Runtime 직접 수정
- Preview에서 상태 변경
- Controller 우회
- 책임 혼합

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
2. Approval 단계
==================================================
[ ] PENDING → APPROVED
[ ] PENDING → BLOCKED
[ ] APPROVED 외 상태 변경 없음

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
4. Preflight 단계
==================================================
[ ] EXECUTABLE → REAL_READY
[ ] EXECUTABLE → BLOCKED_REAL
[ ] guard 검증
[ ] 상태 외 부작용 없음

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
11. 최종 검증
==================================================
[ ] 중복주문 방지
[ ] 재시작 복구
[ ] 상태 전이 검증
[ ] Audit Log 검증
[ ] 검토관리 검증

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
1. 책임 규칙
==================================================
Engine
- 판단만 수행
- 파일 저장 금지
- GUI 접근 금지
Controller
- 호출 순서만 관리
- 판단 최소화
- 상태 전이만 조정
Boundary
- OpenAPI 통신만 담당
- 전략 판단 금지
Runtime
- 데이터 저장/조회만 담당

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
2. 함수 규칙
==================================================
- 함수는 하나의 책임만 가진다.
- Preview 함수는 상태를 변경하지 않는다.
- apply_* 함수만 Runtime 변경 가능.
- evaluate_* 함수는 메모리 결과만 반환한다.
- build_* 함수는 객체 생성만 담당한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
3. 상태 변경 규칙
==================================================
- 상태 변경은 단일 함수에서만 수행한다.
- 상태 변경 후 즉시 검증 가능해야 한다.
- 우회 변경 금지.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
검증 영역
==================================================
[아키텍처]
□ 책임 분리
□ 단방향 의존성
□ State Machine 준수
[Runtime]
□ JSON 규격 준수
□ ID 참조 무결성
□ 상태 일관성

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
검증 결과 상태
==================================================
NOT_STARTED
IN_PROGRESS
VERIFIED
BLOCKED
DEFERRED

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
2. 상태 전이
- State Machine 우회 금지
- Controller 외 상태 변경 금지
- execution_enabled 자동 true 금지
- operator_confirmed 자동 true 금지

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
목적
- 각 구현 단계 사이에 반드시 통과해야 하는 Gate를 정의하여
 미완성 상태에서 다음 단계로 진행되는 것을 방지한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
MASTER_SPEC_추가갱신_프로젝트_구현추적표_Implementation_Trace_Register_2026-07-03
목적
- 구현 단위별 진행 현황과 산출물, 검증 상태를 일관된 형식으로 기록하기 위한 기준 문서이다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
필수 항목
- 구현 ID
- 기능명
- 관련 MASTER_SPEC
- 관련 ADR
- 관련 Runtime
- 관련 테스트
- 관련 문서
- 현재 상태

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
권장 상태
==================================================

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
상태 변경 규칙
==================================================

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
6. Runtime
==================================================
□ Runtime 무결성
□ ID 참조 무결성
□ 상태 전이 일관성

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
1. 의존성은 위에서 아래로만 흐른다.
2. 하위 모듈은 상위 모듈을 호출하지 않는다.
3. 판단 모듈은 실행 모듈을 호출하지 않는다.
4. Preview 모듈은 파일 상태를 변경하지 않는다.
5. Adapter Preview는 SendOrder를 호출하지 않는다.
6. Engine은 GUI를 알면 안 된다.
7. GUI/Timer는 장기적으로 Controller만 호출한다.
8. Controller는 판단 로직을 직접 구현하지 않고, 기존 Engine/Policy/Preflight 모듈을 호출한다.
9. 실주문은 ExecutionController 이후에만 가능하다.
10. SendOrder는 KiwoomOrderExecutor만 호출할 수 있다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
허용:
- 사용자의 명시 행동 수신.
- Timer Tick 발생.
- Controller 호출.
- 상태 요약 표시.
- Runtime reader를 통한 읽기 전용 표시.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
Controller 공통 금지:
- 판단 로직 직접 재구현.
- 하위 모듈의 책임을 침범.
- SendOrder 직접 호출, ExecutionController 제외.
- 새 상태값 임의 생성.
- Runtime schema 임의 변경.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
routine_signal_queue 허용:
- signal_record 생성/저장.
- PENDING/BLOCKED/PREVIEWED 등 signal queue 상태 관리, 기존 정책 범위.
- signal id 발급.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
금지:
- guard 자동 true 설정.
- execution_enabled true 설정.
- Adapter 호출.
- Executor 호출.
- SendOrder 호출.
- ORDER_QUEUED 생성.
- REAL_READY 이후 상태 전이.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
real_order_executor_stub.py:
- SendOrder는 호출하지 않지만 REAL_READY -> ADAPTER_READY로 queue 파일 변경 가능.
- ADAPTER_READY는 공식 상태로 사용하지 않으므로 자동 연결 금지.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
허용:
- 각 모듈은 자기 책임 파일만 최소 접근.
- reader는 읽기 전용 summary 제공.
- writer는 명확한 상태 전이 책임을 가진 모듈만 수행.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
금지:
- 여러 모듈이 같은 status를 임의 변경.
- 하위 모듈이 상위 상태를 변경.
- preview 함수가 파일 저장.
- unrelated 파일 동시 변경.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
권장:
- 상태 전이마다 from_status/to_status 기록.
- 향후 audit_log 도입.
- order_id/source_signal_id/execution_id 관계 보존.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
현재 상태:
- 각 모듈의 단건 함수/검증 함수는 많이 정리되었다.
- 하지만 “누가 다음 단계를 호출하는가”라는 호출 책임이 아직 명확히 고정되지 않았다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
책임:
- EXECUTABLE order에 대해 Real Preflight 단건 검사를 호출한다.
- real_trade_guard와 order 상태를 확인한 뒤 REAL_READY/BLOCKED_REAL 전이를 반영한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
책임:
- REAL_READY order를 실제 실행 파이프라인에 올릴지 최종 판단하는 계층.
- ORDER_QUEUED 생성의 유일한 주체가 되어야 한다.
- 중복주문 lock, execution_enabled, operator_confirmed, guard, hoga/order_type을 모두 확인한다.
현재 상태:
- 설계만 존재.
- 구현 금지.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
현재 단계에서 금지:
- Controller 코드 신설
- 기존 Timer 대규모 변경
- SendOrder 연결
- ExecutionController 구현
- FillEventController 구현
- CancelModifyController 구현
- RecoveryController 구현
- ORDER_QUEUED 자동 생성
- execution_enabled=true 자동 전환
- operator_confirmed=true 자동 설정
- ADAPTER_READY 부활
- 새 상태값 코드 반영

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
1. 변경 전 확인
==================================================
□ 변경 목적이 명확한가
□ 기존 구조로 해결 가능한가
□ 새 상태값이 정말 필요한가
□ 새 Runtime 파일이 필요한가

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
2. 책임 검토
==================================================
□ 책임이 기존 계층과 충돌하지 않는가
□ Engine/Controller/Boundary 역할을 침범하지 않는가
□ Preview가 상태를 변경하지 않는가

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
4. 상태 검토
==================================================
□ State Machine 규칙을 지키는가
□ 허용되지 않은 상태 전이가 없는가
□ execution_enabled 정책을 위반하지 않는가

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
3. 상태 전이
==================================================
- 상태는 State Machine 규칙만 따른다.
- 임의 변경 금지.
- 모든 상태 전이는 담당 Controller만 수행한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
8. 금지
==================================================
- 역할 혼합
- Controller 우회
- Runtime 직접 조작
- Preview에서 상태 변경
- Fill 없이 Position 변경
- 서버 확인 없는 자동 복구
==================================================
최종 원칙

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
Source documents
==================================================
- MASTER_SPEC_전체_Runtime_파일규격_최종정의_초안_2026-07-03.txt
- MASTER_SPEC_추가갱신_Runtime_Data_Model_Entity_Relationship_2026-07-03.txt
- MASTER_SPEC_추가갱신_프로젝트_Runtime_카탈로그_Runtime_Catalog_2026-07-03.txt
- MASTER_SPEC_추가갱신_프로젝트_구성요소의존성맵_Component_Dependency_Map_2026-07-03.txt
- MASTER_SPEC_추가갱신_프로젝트_데이터계약카탈로그_Data_Contract_Catalog_2026-07-03.txt
- MASTER_SPEC_추가갱신_프로젝트_모듈카탈로그_Module_Catalog_2026-07-03.txt
- MASTER_SPEC_추가갱신_프로젝트_상태전이카탈로그_State_Transition_Catalog_2026-07-03.txt
- MASTER_SPEC_추가갱신_프로젝트_이벤트카탈로그_Event_Catalog_2026-07-03.txt
- MASTER_SPEC_추가갱신_프로젝트_인터페이스카탈로그_Interface_Catalog_2026-07-03.txt

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
1. Runtime 파일은 현재 실행 상태와 운영 상태를 보존하기 위한 파일이다.
2. Runtime 파일은 MASTER SPEC에 정의된 생성 주체와 수정 주체만 변경할 수 있다.
3. Preview 함수는 Runtime 파일을 변경하지 않는다.
4. 상태 전이는 반드시 담당 Controller/Engine/Gate를 통해서만 반영한다.
5. Runtime 파일 변경은 향후 Audit Log 기록 대상이다.
6. Runtime 파일 손상/불일치/관계 끊김은 자동 정상 처리하지 않고 Recovery 또는 검토관리 대상이다.
7. Runtime 파일의 ID 관계는 보존되어야 한다.
8. 실주문 관련 Runtime 파일은 SendOrder 연결 전까지 구현 금지 상태를 유지한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
수정 주체
- routine_signal_queue
- routine_signal_consumer, 기존 처리 상태 반영 범위
- 향후 SignalController

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
역할
- 실주문 전역 guard 상태를 저장한다.
- Real Preflight와 Final Execution Guard의 필수 입력이다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
11. runtime/review_items.json, 향후

Original Body Marker: END

---

Reference Navigation

- Previous: PART02_01_RUNTIME.md
- Next: PART02_03_RUNTIME.md
- Full PART: PART02_RUNTIME.md
- INDEX: 00_REFERENCE_INDEX.md
- Original Canonical: ../CURRENT/MASTER_SPEC_CANONICAL_2026-07-08_EXECUTION_SENDORDER_CHEJAN_LIFECYCLE_PIPELINE.txt
