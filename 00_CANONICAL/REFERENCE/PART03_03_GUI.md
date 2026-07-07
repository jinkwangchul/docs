# PART03_03 GUI

Reference Edition Subpart

Original Canonical: MASTER_SPEC_CANONICAL_2026-07-07_RULE_APPLY_PREVIEW_EXECUTION_PREVIEW_CONTROLLER.txt

Source Full Part: PART03_GUI.md

생성일: 2026-07-07

주의: 본 문서는 AI 참조용 하위 분할본이며 공식 원본은 CURRENT의 Canonical이다.

Original Body Marker: START
각 항목을 아래 기준으로 분류해라.
1. 유지 가능
- 지표명 MACD
- OSC 계산
- target: MACD
- 조건 설명상 MACD

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
2. 변경 후보
- routine_macd_engine.py
- evaluate_macd_routine
- DEFAULT_MACD_ROUTINE_CONFIG
- 공통/지표추종 구조인데 macd 명칭이 붙은 파일/클래스/함수

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
3. 변경 금지 또는 신중 검토
- rules.json key
- sell.signals.macd_sell
- 기존 테스트가 참조하는 key
- backward compatibility가 필요한 경로
4. 우선순위 낮음
- 문서 문자열
- 로그
- reports
- legacy 주석
산출:
- 파일별 발견 목록
- 분류
- 변경 후보
- 변경 금지 후보
- 영향 범위
- 추천 변경 순서

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
절대 금지:
- 파일 수정 금지
- 이름 변경 금지
- import 변경 금지
- rules.json 수정 금지
- 엔진 연결 변경 금지
정리하면, Rule Mapper Preview 마무리 작업은 끝났고, 이제 MACD 명칭 검토 단계로 넘어간 상태입니다.
코덱스가 생각중에서 멈췄는데?
그럴 가능성이 있습니다.

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
지금까지의 흐름을 보면 코덱스는 단순 코드 수정은 잘 수행했지만, 이번부터는 프로젝트 구조를 판단하는 분석 단계로 들어왔습니다.
특히 방금 지시는
프로젝트 전체 검색
macd 문자열 3,000여 건 분류
변경 가능/불가 판단
영향 범위 분석
처럼 검색 + 추론 + 설계를 동시에 요구하는 작업입니다.
이런 경우 코덱스가 오래 생각하거나 중간에 멈추는 경우가 있습니다.

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
지금은 어떻게 하는 것이 좋은가?
만약 "Thinking..."에서 오래 멈춘 상태라면 기다리기보다 중단하고 다시 요청하는 것이 좋습니다.
다만 같은 프롬프트를 그대로 다시 보내기보다는 범위를 줄여야 합니다.
예를 들어 이렇게 나누는 것이 좋습니다.
1단계
파일 수정 금지.
routine_macd_engine.py만 분석해라.

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
- 왜 macd라는 이름을 유지하고 있는지
- 실제 MACD 전용인지
- 지표추종 공통 로직인지
- 이름 변경 시 영향 파일
분석만.
2단계
파일 수정 금지.
sell.signals.macd_sell key만 분석해라.
- 왜 macd_sell인가
- 공통 key로 바꿀 수 있는가
- 바꾸면 영향받는 파일
3단계
파일 수정 금지.

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
evaluate_macd_routine / DEFAULT_MACD_ROUTINE_CONFIG만 분석해라.
이렇게 작게 쪼개면 코덱스가 훨씬 안정적으로 응답하는 경우가 많습니다.

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
전제:
현재 공식 루틴명은 “지표추종매매”이며, UI/공통 구조는 indicator_follow 계열로 정리 중이다.
하지만 MACD/OSC는 지표추종 루틴 안에서 사용하는 실제 지표명이므로 무조건 제거 대상이 아니다.
분석 기준:

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
1. 유지 대상
- 지표명 MACD
- OSC
- target: MACD
- target: OSC
- MACD선 / 시그널선
- MACD 계산 로직
- OSC TURN_UP / TURN_DOWN 조건
- 지표 조건 설명에 필요한 MACD 문구

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
2. 변경 후보
- routine_macd_engine.py
- evaluate_macd_routine
- DEFAULT_MACD_ROUTINE_CONFIG
- MacdRoutineSettingsDialog
- gui_macd_* 파일명 또는 클래스/함수명
- 공통 UI/공통 mapper/공통 설정 구조인데 macd 명칭이 붙은 것

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
분석 대상 우선순위:
1. routines/지표추종매매/routine_macd_engine.py
2. routines/지표추종매매/routine.py
3. routines/지표추종매매/routine_rule_mapper.py
4. routines/지표추종매매/rules.json
5. gui_indicator_follow_*.py
6. tests/*
7. 나머지 파일

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
산출물:
- 파일별 macd/MACD/Macd 발견 목록
- 각 항목의 분류: 유지 / 변경 후보 / 변경 금지 / 낮은 우선순위
- 변경 가능성이 큰 항목 TOP 10
- 절대 지금 바꾸면 안 되는 항목
- 변경 시 영향받는 import/test/rules 경로
- 추천 작업 순서

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
최종 결론에는 다음을 반드시 포함해라.
1. 지금 당장 바꿔도 되는 항목
2. alias/호환 계층이 필요한 항목
3. 유지해야 하는 지표명 MACD
4. 다음 실제 수정 단계에서 가장 먼저 처리할 파일
이건 코덱스가 검색·목록화만 하게 하고, 최종 변경 판단은 여기서 다시 검토하는 방식이 안전합니다.
이거도 멈춘듯
그럼 코덱스는 중단하는 게 맞습니다.
이번 macd 명칭 검토는 코덱스에게 맡기기엔 범위가 너무 넓고, 추론 비중이 큽니다.
다음은 이렇게 가는 게 낫습니다.

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
확인할 것:
1. 이 파일이 실제 MACD 전용 계산 엔진인지
2. 아니면 지표추종매매 루틴의 신호판단 로직인지
3. 파일명 routine_macd_engine.py를 바꾸면 영향받는 import 위치
4. evaluate_macd_routine 함수명 변경 시 영향받는 위치
5. DEFAULT_MACD_ROUTINE_CONFIG 변경 시 영향받는 위치
6. rules.json key macd_sell과의 관계
7. 지금 당장 변경 가능한 것과 보류해야 할 것

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
파일 수정 없이 분석만 했습니다. 현재 실행 코드 기준으로 gui_macd_*, MacdRoutineSettingsDialog, Macd*Mixin 계열은 사실상 정리된 상태이고, 남은 핵심은 routine_macd_engine.py와 macd_sell 호환 key입니다.
**파일별 발견 목록**

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
| 파일/영역 | 발견 항목 | 분류 | 판단 |
|---|---|---|---|
| routines/지표추종매매/routine_macd_engine.py | 파일명, DEFAULT_MACD_ROUTINE_CONFIG, evaluate_macd_routine, _macd_sell_section, macd_enabled, macd_passed | 변경 후보 + 일부 유지 | 엔진 파일/함수/상수명은 후보. 단 내부 MACD, OSC, macd_sell key는 신중 |
| routines/지표추종매매/routine.py | routine_macd_engine import, DEFAULT_MACD_ROUTINE_CONFIG, evaluate_macd_routine, _ENGINE_SOURCE | 변경 후보 | 지표추종 루틴 진입부인데 macd 엔진명에 의존 |
| routines/지표추종매매/routine_rule_mapper.py | _build_sell_macd_condition, condition_c_macd, target: MACD, ui_preview_condition_c_macd_sell, macd_sell | 혼합 | MACD 조건 mapper라 일부 유지. 공통 mapper라면 함수명은 후보. key/path는 신중 |
| routines/지표추종매매/rules.json | indicators.macd, sell.signals.macd_sell, macd_check, macd_kind_combo, MACD선 | 변경 금지/신중 | 현재 저장/로드/엔진 실행 key. 바로 변경 금지 |
| gui_indicator_follow_sell_controls.py | MACD선, 시그널선, macd_kind_combo, macd_value_line, sell_signal_condition_c_macd_*, MACD 반전 매도, macd_sell_* | 유지 + 신중 | UI 지표명은 유지. macd_sell_*는 rules 호환 key라 신중 |
| gui_indicator_follow_routine_settings_dialog.py | macd_sell, macd_sell_ collector prefix | 변경 금지/신중 | 기존 rules/UI state 복원 경로 |
| gui_indicator_follow_data_tabs.py | macd_sell_enabled, macd_sell_delay | 변경 금지/신중 | rules 표시/로드 연결 |
| gui_indicator_follow_buy_controls.py | 시그널/MACD | 유지 | UI 지표 비교 문구 |
| engines/indicator_engine.py | macd_series, macd_line, macd_cfg, "MACD" | 유지 | 실제 MACD/OSC 계산 로직 |
| engines/condition_engine.py | MACD 설명 | 유지 | 공통 조건 엔진의 지표명 |
| gui_routine_condition_engine.py, routine_condition_engine.py | target: MACD 예시 | 유지 | 조건 target 의미 |
| tests/test_indicator_follow_rule_mapper_preview.py | macd_sell, target: MACD, macd_* | 변경 금지/신중 | 기존 key 호환성 검증 |
| tools/create_routine_packages_from_legacy.py | macd_routine, MACD 기반 | 낮은 우선순위 | legacy 도구 |
| tools/cleanup_project_junk_v3.py | gui_macd_*, macd_signal_engine.py, routine_macd_engine.py | 낮은 우선순위 | 과거 정리 목록 |
| PROJECT_CHANGELOG.txt, reports/* | MACD매매루틴 다수 | 낮은 우선순위 | 과거 로그/문서 |
**변경 가능성이 큰 TOP 10**

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
1. routine_macd_engine.py 파일명 
2. routine.py의 routine_macd_engine import 
3. DEFAULT_MACD_ROUTINE_CONFIG 
4. evaluate_macd_routine 
5. _ENGINE_SOURCE = "routine_macd_engine" 
6. routine.py의 fallback 변수 DEFAULT_MACD_ROUTINE_CONFIG = None 
7. routine.py의 evaluate_macd_routine = None 
8. routine_macd_engine.py docstring의 “MACD 전용 신호발생 엔진” 
9. routine_rule_mapper.py의 _build_sell_macd_condition 함수명, 단 신중 
10. tools/create_routine_packages_from_legacy.py의 macd_routine, 낮은 우선순위
**절대 지금 바꾸면 안 되는 항목**

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
- rules.json의 indicators.macd
- rules.json의 sell.signals.macd_sell
- rules.json의 indicator_follow_ui_state 내부 macd_check, macd_kind_combo, macd_value_line
- target: "MACD"
- target: "OSC"
- MACD선, 시그널선, 시그널/MACD
- 테스트의 macd_sell 참조
- gui_indicator_follow_*의 macd_sell_* 저장/로드 위젯명
- 엔진의 _macd_sell_section() 내부 key 처리
**영향받는 경로**

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
- 엔진명 변경 시:
 - routines/지표추종매매/routine.py
 - routines/지표추종매매/routine_macd_engine.py
 - 관련 import/py_compile
- 함수/상수명 변경 시:
 - DEFAULT_MACD_ROUTINE_CONFIG
 - evaluate_macd_routine
 - routine.py fallback/import
- macd_sell key 변경 시:
 - rules.json
 - routine_macd_engine.py
 - gui_indicator_follow_data_tabs.py
 - gui_indicator_follow_routine_settings_dialog.py
 - gui_indicator_follow_sell_controls.py
 - tests/test_indicator_follow_rule_mapper_preview.py
 - 그래서 지금은 금지 수준입니다.
**추천 작업 순서**

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
1. routine_macd_engine.py에 새 일반명 alias를 먼저 추가 
 예: DEFAULT_INDICATOR_FOLLOW_CONFIG, evaluate_indicator_follow_routine

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
2. 기존 이름은 유지 
 예: DEFAULT_MACD_ROUTINE_CONFIG = DEFAULT_INDICATOR_FOLLOW_CONFIG, evaluate_macd_routine = evaluate_indicator_follow_routine
3. routine.py를 새 이름 우선 import로 변경 
 기존 이름 fallback은 한 단계 유지
4. 테스트 추가 
 새 이름/기존 alias 둘 다 import 가능해야 함

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
5. 그 다음 파일명 변경 검토 
 routine_macd_engine.py → routine_indicator_follow_engine.py는 alias 안정화 후 진행

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
6. macd_sell, rules.json, UI state key는 장기 보류 
 별도 migration 설계 없이는 변경 금지
**최종 결론**

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
2. alias/호환 계층이 필요한 항목:
 - routine_macd_engine.py
 - DEFAULT_MACD_ROUTINE_CONFIG
 - evaluate_macd_routine
 - routine.py import 경로

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
3. 유지해야 하는 지표명 MACD:
 - MACD선
 - 시그널선
 - target: MACD
 - target: OSC
 - MACD/OSC 계산
 - OSC TURN_UP / TURN_DOWN
 - 조건 설명의 MACD 문구

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
4. 다음 실제 수정 단계에서 가장 먼저 처리할 파일:
 - routines/지표추종매매/routine_macd_engine.py
 - 단, rename부터 하지 말고 새 일반명 alias 추가부터 시작하는 것이 안전합니다.
분석 결과는 타당합니다.
이제 방향은 거의 확정입니다.
결론
MACD 명칭 전면 변경은 아직 하면 안 됩니다.
지금 당장 안전하게 할 수 있는 건 이것뿐입니다.

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
routine_macd_engine.py 내부에
지표추종 이름의 alias를 추가한다.
즉 기존 이름은 유지하고, 새 이름을 병행합니다.

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
1차 수정 방향
DEFAULT_INDICATOR_FOLLOW_CONFIG = ...
evaluate_indicator_follow_routine = ...
그리고 기존 이름은 호환용으로 유지합니다.

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
DEFAULT_MACD_ROUTINE_CONFIG = DEFAULT_INDICATOR_FOLLOW_CONFIG
evaluate_macd_routine = evaluate_indicator_follow_routine
그 다음 routine.py에서 새 이름을 우선 사용하게 합니다.

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
아직 변경 금지
routine_macd_engine.py 파일명
sell.signals.macd_sell
rules.json key
UI state의 macd_* key
target: MACD / OSC
MACD선 / 시그널선
다음 코덱스 지시
파일 수정 최소.

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
대상:
1. routines/지표추종매매/routine_macd_engine.py
2. routines/지표추종매매/routine.py
3. 필요 시 최소 테스트
목표:
MACD 명칭을 바로 제거하지 말고, 지표추종 이름의 alias를 먼저 추가한다.

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
수정:
1. routine_macd_engine.py에서 기존 DEFAULT_MACD_ROUTINE_CONFIG의 실제 정의를
 DEFAULT_INDICATOR_FOLLOW_CONFIG로 일반명화한다.
2. 기존 DEFAULT_MACD_ROUTINE_CONFIG는 alias로 유지한다.
 DEFAULT_MACD_ROUTINE_CONFIG = DEFAULT_INDICATOR_FOLLOW_CONFIG

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
3. 기존 evaluate_macd_routine 함수는 새 함수 evaluate_indicator_follow_routine으로 일반명화한다.
4. 기존 evaluate_macd_routine은 alias wrapper 또는 직접 alias로 유지한다.
 evaluate_macd_routine = evaluate_indicator_follow_routine

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
금지:
- routine_macd_engine.py 파일명 변경 금지
- macd_sell key 변경 금지
- rules.json 수정 금지
- UI state key 변경 금지
- target MACD/OSC 변경 금지
- 엔진 로직 변경 금지

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
검증:
- py_compile
- 기존 evaluate_macd_routine import 가능 확인
- 새 evaluate_indicator_follow_routine import 가능 확인
- routine.py에서 새 이름 우선 사용 확인
- 기존 테스트 통과
이게 가장 안전한 1차 정리입니다.
완료했습니다.

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
변경 파일:
- C:\Users\JIN KWANG CHUL\Documents\kiwoom_auto\routines\지표추종매매\routine_macd_engine.py
- C:\Users\JIN KWANG CHUL\Documents\kiwoom_auto\routines\지표추종매매\routine.py

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
적용 내용:
- DEFAULT_INDICATOR_FOLLOW_CONFIG를 새 기본 설정명으로 추가
- DEFAULT_MACD_ROUTINE_CONFIG = DEFAULT_INDICATOR_FOLLOW_CONFIG alias 유지
- evaluate_indicator_follow_routine()을 새 평가 함수명으로 추가
- evaluate_macd_routine = evaluate_indicator_follow_routine alias 유지
- routine.py는 새 이름을 우선 import/use
- 기존 이름 fallback도 유지

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
검증:
- python -m py_compile routines/지표추종매매/routine.py routines/지표추종매매/routine_macd_engine.py 통과
- 기존 evaluate_macd_routine import 가능 확인
- 새 evaluate_indicator_follow_routine import 가능 확인
- 두 함수/설정 alias가 같은 객체를 가리키는 것 확인
- python -m unittest tests/test_indicator_follow_rule_mapper_preview.py 통과, 12 tests OK

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
Merge Candidate
Add Condition Candidate
Add Signal Candidate
입니다.
이것도 철학 변경입니다.
3. Preview Namespace 신설
indicator_follow_rule_preview
추가.
역할:
merge candidate
add condition candidate
add signal candidate
실행 Rule과 완전 분리.
4. Diff 정책
새 status 추가.
merge_candidate
add_signal_candidate
Risk 체계
low
medium
high
5. MACD 명칭 일반화 정책
이번에 가장 중요한 것 중 하나입니다.
확정된 정책은
지표명 MACD는 유지
루틴 구조는 indicator_follow 일반명 사용
입니다.
즉,
evaluate_indicator_follow_routine
가 공식명.
그리고
evaluate_macd_routine
은
호환 alias
입니다.
이건 이후 다른 지표추종 루틴을 만들 때도 기준이 됩니다.
6. Alias 정책
이번에 새로 생긴 철학입니다.
새 일반명 먼저 도입
↓
기존 이름은 alias 유지
↓
충분한 안정화 후 제거 검토
이 정책은 앞으로도 반복해서 사용할 가능성이 큽니다.
7. 현재 변경 금지 목록
MASTER_SPEC에 명시해야 합니다.
sell.signals.macd_sell
rules.json key
target: MACD
target: OSC
indicator_follow_ui_state macd_* key
기존 테스트 참조 key
제 판단
이번 MASTER_SPEC 갱신은 작성하는 것이 맞습니다.
이전처럼 "구현 몇 줄 추가" 수준이 아니라,
아키텍처와 운영 원칙이 확정된 작업이기 때문입니다.

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
오히려 이 내용을 반영하지 않으면, 몇 달 뒤에는 왜 Rule Mapper가 Preview/Diff 구조인지, 왜 evaluate_indicator_follow_routine과 evaluate_macd_routine이 함께 존재하는지를 이해하기 어려워질 가능성이 큽니다.
그래서 저는 이번 작업에 대한 별도의 MASTER_SPEC 갱신문서를 남기는 것을 권장합니다.
작성해줘 txt
작성했습니다.
다운로드:

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
📄 MASTER_SPEC_갱신자료_RuleMapper_MergeCandidate_MACD_2026-07-02.txt
이번 문서는 단순 작업 로그가 아니라 MASTER_SPEC 반영용으로 작성했으며 다음 내용을 포함했습니다.
Rule Mapper 계층 신설
Preview / Diff 아키텍처
Merge/Add Candidate 정책 확정
indicator_follow_rule_preview Namespace
Diff 상태(merge_candidate, add_signal_candidate) 및 Risk 체계
GUI Preview/Diff 정책
구현 금지 사항
MACD 명칭 일반화(Alias) 정책
변경 금지 대상
검증 결과
향후 구현 순서
이 문서는 이후 MASTER_SPEC 통합 시 이번 작업의 공식 변경 이력으로 반영하면 됩니다.

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
--------------------------------------------------------------------------------------------------------------------------------------------------
작업진행상황대화히스토리_9(2).txt
문서
작업재개참조문서_RuleMapper_MACD_정리_2026-07-02(1).txt
문서

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
MASTER_SPEC_갱신자료_RuleMapper_MergeCandidate_MACD_2026-07-02(1).txt
문서
작업재개요약_및_MASTER_SPEC_갱신자료_2026-07-02(2).txt
문서
MASTER_SPEC_갱신자료_상세판_UI프로토타입(3).txt
문서
MASTER_SPEC_단순통합_1차(6).txt
문서
MASTER_SPEC_누락보강(4).zip
ZIP 아카이브
kiwoom_auto (31)(1).zip
ZIP 아카이브
모든 파일내용을 빠짐없이 분석및 파악해
kiwoom_auto (32)(1).zip
ZIP 아카이브
표시한부분?
서버연결은 됐다고 나온다
candles.json
파일
좋습니다. 결론은 명확합니다.
다음 구현은 Timer 조건부 Consumer 연결입니다.
범위:

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02.zip
ZIP 아카이브

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\Development_Specification_구현규약_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:19:04 | 분류: MASTER_SPEC]
Development Specification (구현 규약)
작성일: 2026-07-02

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\Development_Specification_구현규약_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:19:04 | 분류: MASTER_SPEC]
==============================================================================
1. 기본 원칙
==============================================================================

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\Development_Specification_구현규약_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:19:04 | 분류: MASTER_SPEC]
1. 기능보다 구조 안정성을 우선한다.
2. 기존 동작을 깨는 변경은 단계적으로 수행한다.
3. 공통 계층과 지표 계층을 분리한다.
4. UI, Rule Mapper, Engine의 책임을 혼합하지 않는다.
5. 모든 실제 반영은 검증 후 수행한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\Development_Specification_구현규약_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:19:04 | 분류: MASTER_SPEC]
==============================================================================
2. 계층 책임
==============================================================================
UI
- 입력/표시
- UI State 저장
- Preview 요청

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\Development_Specification_구현규약_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:19:04 | 분류: MASTER_SPEC]
Rule Mapper
- Preview 생성
- Pending 생성
- Approval Simulation
- Approved 후보 생성

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\Development_Specification_구현규약_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:19:04 | 분류: MASTER_SPEC]
Engine
- Applied Rule만 사용
- UI State 직접 참조 금지
- Preview/Pending 참조 금지

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\Development_Specification_구현규약_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:19:04 | 분류: MASTER_SPEC]
==============================================================================
3. 상태 전이 규칙
==============================================================================
구현 순서:

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\Development_Specification_구현규약_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:19:04 | 분류: MASTER_SPEC]
UI State
→ Preview
→ Pending
→ Approval Simulation
→ Approved
→ Applied
→ Loaded
→ Running
중간 단계를 건너뛰는 구현 금지.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\Development_Specification_구현규약_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:19:04 | 분류: MASTER_SPEC]
==============================================================================
4. 저장 규칙
==============================================================================

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\Development_Specification_구현규약_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:19:04 | 분류: MASTER_SPEC]
==============================================================================
5. Engine 규칙
==============================================================================

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\Development_Specification_구현규약_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:19:04 | 분류: MASTER_SPEC]
- Engine은 Applied Rule만 읽는다.
- Running 중 Rule 변경 금지.
- 실제 지표명(MACD/OSC/RSI 등)은 유지한다.
- 공통 계층은 indicator_follow 명칭을 사용한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\Development_Specification_구현규약_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:19:04 | 분류: MASTER_SPEC]
==============================================================================
6. 네이밍 규칙
==============================================================================

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\Development_Specification_구현규약_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:19:04 | 분류: MASTER_SPEC]
허용:
- indicator_follow
- routine
- preview
- pending
- approved
- applied
실제 지표:
- MACD
- OSC
- RSI
- Bollinger
- MA
신규 전략 의미의 macd 명칭 추가 금지.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\Development_Specification_구현규약_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:19:04 | 분류: MASTER_SPEC]
==============================================================================
7. 변경 금지
==============================================================================
다음 항목은 별도 Migration 전까지 유지한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\Development_Specification_구현규약_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:19:04 | 분류: MASTER_SPEC]
- sell.signals.macd_sell
- indicator_follow_ui_state의 macd_* key
- self.macd_* 위젯명
- routine_macd_engine.py
- DEFAULT_MACD_ROUTINE_CONFIG
- evaluate_macd_routine

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\Development_Specification_구현규약_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:19:04 | 분류: MASTER_SPEC]
==============================================================================
8. 검증 규칙
==============================================================================
모든 단계에서 수행:

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\Development_Specification_구현규약_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:19:04 | 분류: MASTER_SPEC]
==============================================================================
9. 구현 순서
==============================================================================

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\Development_Specification_구현규약_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:19:04 | 분류: MASTER_SPEC]
1. 설계
2. Preview
3. Pending
4. Simulation
5. Approved
6. Applied
7. Loaded
8. Running
저장과 실행을 혼합하지 않는다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\AutoTrading_System_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:16:58 | 분류: MASTER_SPEC]
Auto Trading System Life Cycle / Top-Level State Machine
작성일: 2026-07-02
대상 프로젝트: 키움 자동매매 시스템 전체 운영 흐름

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\AutoTrading_System_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:16:58 | 분류: MASTER_SPEC]
================================================================================
1. 문서 목적
================================================================================

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\AutoTrading_System_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:16:58 | 분류: MASTER_SPEC]
================================================================================
2. 최상위 상태 흐름
================================================================================

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\AutoTrading_System_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:16:58 | 분류: MASTER_SPEC]
[Program Starting]
 ↓
[Environment Initializing]
 ↓
[Resource Loading]
 ↓
[Routine Loading]
 ↓
[Rule Loading]
 ↓
[Stock Loading]
 ↓
[System Validating]
 ↓
[Ready]
 ↓
[Monitoring]
 ↓
[Trading Running]
 ↓
[Paused / Emergency Stopped / Market Closing / Stopped]
 ↓
[Recovery / Review Required / Shutdown]

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\AutoTrading_System_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:16:58 | 분류: MASTER_SPEC]
================================================================================
3. 상태 정의
================================================================================

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\AutoTrading_System_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:16:58 | 분류: MASTER_SPEC]
-------------------------------------------------------------------------------

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\AutoTrading_System_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:16:58 | 분류: MASTER_SPEC]
3.2 Environment Initializing
- 운영환경 설정 로드
- 시간정책, 예산정책, 상태정책 초기화

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\AutoTrading_System_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:16:58 | 분류: MASTER_SPEC]
필수 작업:
- 운영환경 설정 읽기
- 시간 구간 판정 준비
- 계좌/예산 관련 기본값 준비
- 로그 폴더 준비
실행 불가:
- 이 단계에서는 루틴 실행 금지

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\AutoTrading_System_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:16:58 | 분류: MASTER_SPEC]
-------------------------------------------------------------------------------
3.3 Resource Loading
- 프로그램이 필요한 파일/리소스를 로드하는 단계

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\AutoTrading_System_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:16:58 | 분류: MASTER_SPEC]
대상:
- stocks
- routines
- runtime
- logs
- operation policy
- registered stock data
실패 시:
- Ready 진입 금지
- 오류 표시 또는 검토관리 이동

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\AutoTrading_System_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:16:58 | 분류: MASTER_SPEC]
3.5 Rule Loading
- rules.json 읽기
- indicator_follow_ui_state 확인
- applied rule 확인
- engine rule schema 확인

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\AutoTrading_System_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:16:58 | 분류: MASTER_SPEC]
Rule 상태:
- UI State
- Preview
- Pending
- Approved
- Applied
- Loaded

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\AutoTrading_System_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:16:58 | 분류: MASTER_SPEC]
주의:
- Pending/Approved만 존재하면 실행 불가
- 최소 실행 조건은 Applied + Loaded

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\AutoTrading_System_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:16:58 | 분류: MASTER_SPEC]
3.6 Stock Loading
- 등록 종목 로드
- 중앙 stocks 폴더 기준
- 루틴 지정 정보 확인
종목 상태:
- 등록
- 미등록
- 루틴 지정
- 검토관리
- 보유/미수/미도 존재
- 운영 가능
주의:
- 보유/미수/미도 존재 상태에서 재시작하면 검토관리 강제 기준 적용

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\AutoTrading_System_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:16:58 | 분류: MASTER_SPEC]
-------------------------------------------------------------------------------
3.7 System Validating
- 실행 전 안정성검사 단계

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\AutoTrading_System_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:16:58 | 분류: MASTER_SPEC]
검사 대상:
- 시간정책
- 종목 상태
- 루틴 상태
- Rule 상태
- 예산 상태
- 보유/미수/미도 상태
- 키움 서버 정보와 내부 정보 일치 여부
실패 시:
- Ready 진입 금지
- 필요 시 검토관리 이동
- 위험 상태는 운영정지

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\AutoTrading_System_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:16:58 | 분류: MASTER_SPEC]
Ready 조건:
- Program 초기화 완료
- Routine Ready
- Rule Applied/Loaded 가능
- Stock Assigned
- 운영정책 통과
- 시간정책 통과 또는 대기 가능
- 안정성검사 통과

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\AutoTrading_System_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:16:58 | 분류: MASTER_SPEC]
주의:
- Ready는 Running이 아니다.
- Ready 상태에서도 시간 구간이 아니면 Monitoring만 가능하다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\AutoTrading_System_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:16:58 | 분류: MASTER_SPEC]
3.9 Monitoring
- 실행 전 또는 실행 중 감시 상태
- 시간/종목/상태/신호를 관찰
- 실제 주문 발생은 조건 충족 시에만 가능
역할:
- 시간정책 감시
- 종목 상태 감시
- Rule/Routine 상태 감시
- 신호 검출 준비

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\AutoTrading_System_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:16:58 | 분류: MASTER_SPEC]
필수 조건:
- Routine Running
- Rule Running
- Stock 운영 가능
- 시간정책 통과
- 운영정책 통과
- 안정성검사 통과
- 엔진 로드 완료
- 계좌/예산 조건 통과

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\AutoTrading_System_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:16:58 | 분류: MASTER_SPEC]
-------------------------------------------------------------------------------
3.11 Paused
- 일시정지
- 신규 신호/주문 중단
- 상태는 유지
허용:
- 상태 확인
- 로그 확인
- 재개 가능
금지:
- 임의 rules 변경 후 즉시 재개
- 검증 없는 reload

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\AutoTrading_System_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:16:58 | 분류: MASTER_SPEC]
-------------------------------------------------------------------------------
3.14 Review Required
- 검토관리 필요 상태

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\AutoTrading_System_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:16:58 | 분류: MASTER_SPEC]
진입 조건:
- 키움 서버 정보와 내부 정보 불일치
- 보유/미수/미도 재시작 감지
- 데이터 신뢰 불가
- 운영정책 위반
- 안정성검사 실패
처리:
- 자동 복귀 금지
- 운영자 확인 후 복귀/미지정/삭제

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\AutoTrading_System_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:16:58 | 분류: MASTER_SPEC]
-------------------------------------------------------------------------------
3.15 Recovery
- 재시작/정지해제/오류 복구 상태

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\AutoTrading_System_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:16:58 | 분류: MASTER_SPEC]
-------------------------------------------------------------------------------
3.16 Shutdown
- 프로그램 종료 상태
필수:
- 상태 저장
- 로그 마감
- 미완료 작업 기록
- 다음 실행 시 복구 기준 남김

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\AutoTrading_System_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:16:58 | 분류: MASTER_SPEC]
================================================================================
4. 실행 가능 조건
================================================================================
자동매매 실행 가능 조건:

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\AutoTrading_System_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:16:58 | 분류: MASTER_SPEC]
1. System 상태 = Ready 또는 Monitoring
2. Routine 상태 = Running 가능
3. Rule 상태 = Loaded 이상
4. Stock 상태 = 운영 가능
5. Time Policy = 허용 구간
6. Operation Policy = 허용
7. 안정성검사 통과
8. 예산/주문 조건 통과
9. 검토관리 대상 아님
하나라도 실패하면 Trading Running 진입 금지.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\AutoTrading_System_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:16:58 | 분류: MASTER_SPEC]
================================================================================
5. Rule / Routine / System 상태 연결
================================================================================
실행 가능 조합:

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\AutoTrading_System_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:16:58 | 분류: MASTER_SPEC]
System Ready
+
Routine Ready or Assigned
+
Rule Applied
→ Loaded 준비 가능
System Monitoring
+
Routine Loaded
+
Rule Loaded
→ 신호 감시 가능

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\AutoTrading_System_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:16:58 | 분류: MASTER_SPEC]
System Trading Running
+
Routine Running
+
Rule Running
→ 실제 매매 판단 가능

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\AutoTrading_System_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:16:58 | 분류: MASTER_SPEC]
실행 금지 조합:
- Rule Pending + Routine Running
- Rule Approved + System Trading Running
- Routine Assigned + Rule Preview
- System Emergency Stopped + Rule Loaded
- Review Required 종목 + Routine Running

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\AutoTrading_System_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:16:58 | 분류: MASTER_SPEC]
================================================================================
6. 상태 표시 정책
================================================================================
상태 표시는 최소 3계층을 함께 보여야 한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\AutoTrading_System_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:16:58 | 분류: MASTER_SPEC]
1. System 상태
- Ready
- Monitoring
- Trading Running
- Paused
- Emergency Stopped
- Review Required

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\AutoTrading_System_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:16:58 | 분류: MASTER_SPEC]
2. Routine 상태
- Installed
- Configured
- Validated
- Ready
- Assigned
- Loaded
- Running

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\AutoTrading_System_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:16:58 | 분류: MASTER_SPEC]
3. Rule 상태
- UI State
- Preview
- Pending
- Approved
- Applied
- Loaded
- Running

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\AutoTrading_System_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:16:58 | 분류: MASTER_SPEC]
================================================================================
7. 위험 차단 원칙
================================================================================

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\AutoTrading_System_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:16:58 | 분류: MASTER_SPEC]
================================================================================
8. 다음 구현 순서
================================================================================

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\AutoTrading_System_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:16:58 | 분류: MASTER_SPEC]
System 상태, Routine 상태, Rule 상태, Stock 상태, Time Policy 상태가 모두
맞아야 실제 Running이 가능하다.
앞으로 구현은 다음 기준을 따른다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\AutoTrading_System_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:16:58 | 분류: MASTER_SPEC]
- Preview는 실행 아님
- Pending은 실행 아님
- Approved는 실행 아님
- Applied는 아직 실행 아님
- Loaded는 실행 준비
- Running만 실제 실행
이 구분을 유지해야 자동매매 시스템의 안전성과 추적 가능성이 확보된다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\Routine_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:15:24 | 분류: MASTER_SPEC]
Routine Life Cycle & Configuration State Machine
작성일: 2026-07-02
목적
-----
Rule의 상태와 Routine(루틴) 자체의 상태를 분리하여 관리한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\Routine_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:15:24 | 분류: MASTER_SPEC]
원칙
-----
Rule과 Routine은 독립된 State Machine이다.
Routine이 Running이어도 Rule이 Applied/Loaded가 아니면 실행되지 않는다.
Rule이 Approved라도 Routine이 Ready가 아니면 실행되지 않는다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\Routine_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:15:24 | 분류: MASTER_SPEC]
Routine State
-------------
1. Installed
- 루틴 패키지 등록 완료
- 실행 불가
2. Configured
- 기본 설정 완료
- UI State 저장 가능
3. Validated
- 설정 검증 완료
- Preview/Pending 확인 완료
4. Ready
- 실행 준비 완료
- 아직 종목 미할당 가능
5. Assigned
- 종목과 루틴 연결 완료
6. Loaded
- 엔진이 루틴과 Rule을 모두 읽음
7. Running
- 실제 자동매매 수행
8. Paused
- 일시정지
- 상태 유지, 신규 신호 중단
9. Stopped
- 종료
- 실행 중지
10. Archived
- 보관 상태
- 실행 대상 아님

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\Routine_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:15:24 | 분류: MASTER_SPEC]
Routine 실행 조건
----------------
Configured
+
Validated
+
Assigned
+
Rule Applied
+
Rule Loaded
+
운영정책 통과
+
시간정책 통과
=
Running 가능

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\Routine_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:15:24 | 분류: MASTER_SPEC]
실행 금지 예
------------
- Rule Pending + Routine Running
- Rule Preview + Routine Ready
- Rule Approved + Routine Installed
- Rule Applied + Routine Assigned(Loaded 아님)

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\Routine_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:15:24 | 분류: MASTER_SPEC]
권장 상태 표시
--------------
Routine:
Installed / Ready / Running / Paused / Stopped
Rule:
Preview / Pending / Approved / Applied / Loaded
두 상태를 항상 함께 표시한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\Routine_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:15:24 | 분류: MASTER_SPEC]
향후 구현 순서
--------------
1. Routine 상태 저장
2. Routine 상태 표시
3. Rule 상태와 교차 검증
4. Engine Load 상태 추가
5. Running 조건 최종 연결

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\Routine_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:15:24 | 분류: MASTER_SPEC]
결론
----
Routine과 Rule은 별도의 상태 머신으로 유지하며,
실행 조건은 두 상태가 모두 만족할 때만 성립한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\EngineRule_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:13:12 | 분류: MASTER_SPEC]
Engine Rule Life Cycle / State Machine 설계 문서
작성일: 2026-07-02
대상 프로젝트: 키움 자동매매 / 지표추종매매 루틴 / Rule Mapper → Engine Rules 연결 단계

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\EngineRule_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:13:12 | 분류: MASTER_SPEC]
본 문서는 지표추종매매 설정 UI에서 생성된 Rule 후보가 실제 엔진 실행 Rule로
반영되기까지의 전체 생명주기(State Machine)를 정의한다.
현재 프로젝트는 다음 단계까지 구현되어 있다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\EngineRule_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:13:12 | 분류: MASTER_SPEC]
UI State
→ Rule Mapper Preview
→ Rule Mapper Pending
→ Approval Simulation - Not Saved
→ Rule Mapper Diff

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\EngineRule_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:13:12 | 분류: MASTER_SPEC]
이후 단계인 Approved, Applied, Loaded, Running은 아직 구현하지 않는다.
본 문서는 향후 실제 승인/저장/엔진 연결 작업의 기준으로 사용한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\EngineRule_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:13:12 | 분류: MASTER_SPEC]
================================================================================
2. 핵심 원칙
================================================================================

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\EngineRule_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:13:12 | 분류: MASTER_SPEC]
중요:
Approved와 Applied는 다르다.
Applied와 Loaded도 다르다.
Loaded와 Running도 다르다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\EngineRule_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:13:12 | 분류: MASTER_SPEC]
================================================================================
3. 전체 상태 흐름
================================================================================

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\EngineRule_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:13:12 | 분류: MASTER_SPEC]
[UI State]
 ↓
[Preview]
 ↓
[Pending]
 ↓
[Approval Simulation]
 ↓
[Approved]
 ↓
[Applied]
 ↓
[Loaded]
 ↓
[Running]
각 상태는 반드시 명확한 책임과 전이 조건을 가진다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\EngineRule_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:13:12 | 분류: MASTER_SPEC]
================================================================================
4. 상태 정의
================================================================================
4.1 UI State

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\EngineRule_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:13:12 | 분류: MASTER_SPEC]
의미:
- 설정창의 현재 UI 값
- 화면 복원 및 재검증용 상태
- indicator_follow_ui_state namespace에 저장 가능
저장 여부:
- 저장 가능
- 현재 save_button은 이 상태만 저장한다.
실행 여부:
- 실행 아님

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\EngineRule_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:13:12 | 분류: MASTER_SPEC]
주요 함수:
- collect_indicator_follow_ui_state()
- apply_indicator_follow_ui_state()
- save_indicator_follow_ui_state_to_rules()

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\EngineRule_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:13:12 | 분류: MASTER_SPEC]
주의:
- UI State 저장은 Engine Rule 저장이 아니다.
- UI State가 저장되어도 실제 매매 조건은 변경되지 않는다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\EngineRule_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:13:12 | 분류: MASTER_SPEC]
-------------------------------------------------------------------------------
4.2 Preview

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\EngineRule_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:13:12 | 분류: MASTER_SPEC]
의미:
- UI State를 바탕으로 Rule Mapper가 생성한 실행 Rule 후보
- 기존 rules와 비교하기 전 또는 후보 구조 확인 단계
저장 여부:
- 저장하지 않음
실행 여부:
- 실행 아님
주요 함수:
- build_engine_rules_preview_from_ui_state()
주요 namespace:
- indicator_follow_rule_preview

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\EngineRule_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:13:12 | 분류: MASTER_SPEC]
특징:
- mode = merge_add_candidate
- 기존 buy/sell rules를 직접 대체하지 않음
- sell.signals.macd_sell 변경 금지
- buy 조건은 merge 후보로만 생성
- sell condition C는 add signal 후보로만 생성

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\EngineRule_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:13:12 | 분류: MASTER_SPEC]
-------------------------------------------------------------------------------
4.3 Pending

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\EngineRule_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:13:12 | 분류: MASTER_SPEC]
의미:
- Preview 후보를 운영자 검토용 구조로 정리한 상태
- 아직 승인되지 않음
- 향후 저장 가능성을 가질 수 있으나 실행 Rule은 아님

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\EngineRule_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:13:12 | 분류: MASTER_SPEC]
저장 여부:
- 현재는 저장하지 않음
- 향후 indicator_follow_rule_pending namespace 저장 검토 가능
실행 여부:
- 실행 아님
주요 함수:
- build_engine_rules_pending_from_ui_state()
주요 namespace:
- indicator_follow_rule_pending

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\EngineRule_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:13:12 | 분류: MASTER_SPEC]
역할:
- 검토 대상 후보 보관
- mapped_paths
- candidates
- warnings
- source UI state 추적

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\EngineRule_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:13:12 | 분류: MASTER_SPEC]
-------------------------------------------------------------------------------
4.4 Approval Simulation

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\EngineRule_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:13:12 | 분류: MASTER_SPEC]
의미:
- 운영자 승인 시 어떤 rules dict가 만들어질지 저장 없이 확인하는 단계
- 현재 GUI 검증 화면에 표시됨
저장 여부:
- 저장하지 않음
실행 여부:
- 실행 아님
주요 함수:
- approve_engine_rule_candidates()

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\EngineRule_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:13:12 | 분류: MASTER_SPEC]
주의:
- Approval Simulation은 실제 승인이 아니다.
- applied_paths가 표시되어도 파일 저장 또는 엔진 반영이 된 것이 아니다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\EngineRule_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:13:12 | 분류: MASTER_SPEC]
-------------------------------------------------------------------------------
4.5 Approved

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\EngineRule_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:13:12 | 분류: MASTER_SPEC]
저장 여부:
- 향후 저장 가능
- indicator_follow_rule_approved namespace 후보
실행 여부:
- 실행 아님
예상 namespace:
indicator_follow_rule_approved

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\EngineRule_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:13:12 | 분류: MASTER_SPEC]
예상 필드:
- version
- approved_at
- approved_by 또는 approved_source
- approved_paths
- source_preview_hash
- source_pending_hash
- applied_paths
- skipped_paths
- warnings
- notes

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\EngineRule_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:13:12 | 분류: MASTER_SPEC]
전이 조건:
- 운영자 명시 승인
- 승인 대상 path가 valid candidate여야 함
- approval simulation 결과가 정상이어야 함

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\EngineRule_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:13:12 | 분류: MASTER_SPEC]
확인 항목:
- loaded_rules_hash
- loaded_at
- loaded_by
- routine_name
- rule_version
- applied_version

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\EngineRule_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:13:12 | 분류: MASTER_SPEC]
-------------------------------------------------------------------------------
4.8 Running
의미:
- Loaded rules가 실제 매매 판단에 사용 중인 상태
저장 여부:
- 실행 상태 기록 필요
실행 여부:
- 실제 실행 중

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\EngineRule_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:13:12 | 분류: MASTER_SPEC]
확인 항목:
- running_since
- active_rule_hash
- last_evaluation_at
- last_signal
- last_rule_source

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\EngineRule_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:13:12 | 분류: MASTER_SPEC]
================================================================================
5. 상태 전이 조건
================================================================================
5.1 UI State → Preview

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\EngineRule_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:13:12 | 분류: MASTER_SPEC]
조건:
- UI state collect 성공
- current rules 로드 성공
- Rule Mapper preview 생성 성공

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\EngineRule_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:13:12 | 분류: MASTER_SPEC]
실패 시:
- validation warning 표시
- preview 생성 중단 또는 error dict 표시

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\EngineRule_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:13:12 | 분류: MASTER_SPEC]
-------------------------------------------------------------------------------
5.2 Preview → Pending

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\EngineRule_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:13:12 | 분류: MASTER_SPEC]
-------------------------------------------------------------------------------
5.3 Pending → Approval Simulation

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\EngineRule_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:13:12 | 분류: MASTER_SPEC]
-------------------------------------------------------------------------------
5.4 Approval Simulation → Approved

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\EngineRule_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:13:12 | 분류: MASTER_SPEC]
조건:
- 운영자 명시 승인
- 승인 UI 또는 명시적 command 필요
- simulation 결과 정상
- approval 대상 path 유효
- 승인 전 diff 재확인
현재 상태:
- 아직 구현하지 않음

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\EngineRule_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:13:12 | 분류: MASTER_SPEC]
-------------------------------------------------------------------------------
5.5 Approved → Applied

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\EngineRule_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:13:12 | 분류: MASTER_SPEC]
조건:
- approved namespace 존재
- 승인 path 재검증
- current rules 재읽기
- 승인 path 외 변경 없음 확인
- copy-on-write patch 성공
- JSON roundtrip 성공
- tmp replace 성공
- 재읽기 성공
현재 상태:
- 아직 구현하지 않음

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\EngineRule_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:13:12 | 분류: MASTER_SPEC]
-------------------------------------------------------------------------------
5.6 Applied → Loaded

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\EngineRule_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:13:12 | 분류: MASTER_SPEC]
조건:
- 엔진 reload 또는 루틴 로드 호출
- 새 rules hash 확인
- schema 검증 성공
- 평가기 초기화 성공
현재 상태:
- 아직 구현하지 않음

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\EngineRule_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:13:12 | 분류: MASTER_SPEC]
-------------------------------------------------------------------------------
5.7 Loaded → Running

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\EngineRule_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:13:12 | 분류: MASTER_SPEC]
================================================================================
6. 상태별 허용/금지 작업
================================================================================

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\EngineRule_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:13:12 | 분류: MASTER_SPEC]
상태: Preview
허용:
- 화면 표시
- diff 비교
- pending 생성
금지:
- 저장
- 실행

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\EngineRule_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:13:12 | 분류: MASTER_SPEC]
상태: Approved
허용:
- 승인 기록 저장
- actual apply 후보 생성
금지:
- 승인만으로 running 처리

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\EngineRule_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:13:12 | 분류: MASTER_SPEC]
상태: Running
허용:
- 실제 평가
- 신호 생성
- 로그 기록
금지:
- 무검증 rules 변경
- running 중 임의 migration

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\EngineRule_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:13:12 | 분류: MASTER_SPEC]
7.1 indicator_follow_rule_pending
- version
- created_at
- source_ui_state_hash
- source_rules_hash
- mode
- mapped_paths
- candidates
- warnings

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\EngineRule_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:13:12 | 분류: MASTER_SPEC]
7.2 indicator_follow_rule_approved
- version
- approved_at
- approved_paths
- source_pending_hash
- source_preview_hash
- approved_result_hash
- warnings
- notes

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\EngineRule_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:13:12 | 분류: MASTER_SPEC]
7.3 indicator_follow_rule_applied
- version
- applied_at
- applied_paths
- before_rules_hash
- after_rules_hash
- applied_by
- validation_result
- warnings

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\EngineRule_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:13:12 | 분류: MASTER_SPEC]
7.4 runtime loaded 상태
- loaded_at
- loaded_rules_hash
- routine_name
- engine_source
- schema_version

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\EngineRule_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:13:12 | 분류: MASTER_SPEC]
7.5 runtime running 상태
- running_since
- active_rules_hash
- last_evaluation_at
- last_signal
- last_signal_reason
- routine_active
- stock_code

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\EngineRule_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:13:12 | 분류: MASTER_SPEC]
================================================================================
8. GUI 표시 정책
================================================================================

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\EngineRule_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:13:12 | 분류: MASTER_SPEC]
현재 검증 화면:
- [Validation Summary]
- [Collected UI JSON]
- [Pending Rules Preview]
- [Rule Mapper Preview]
- [Rule Mapper Pending]
- [Rule Mapper Approval Simulation - Not Saved]
- [Rule Mapper Diff]

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\EngineRule_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:13:12 | 분류: MASTER_SPEC]
향후 추가 가능:
- [Rule Mapper Approved - Not Applied]
- [Rule Mapper Applied - Not Loaded]
- [Engine Loaded Status]
- [Engine Running Status]

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\EngineRule_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:13:12 | 분류: MASTER_SPEC]
주의:
- 각 섹션명에 상태 의미를 명확히 포함한다.
- Not Saved / Not Applied / Not Loaded / Not Running 표시를 명확히 한다.
- 사용자가 승인/저장/실행 상태를 혼동하지 않도록 한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\EngineRule_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:13:12 | 분류: MASTER_SPEC]
================================================================================
9. 저장 버튼 정책
================================================================================

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\EngineRule_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:13:12 | 분류: MASTER_SPEC]
현재 save_button:
- UI state 저장 전용
- indicator_follow_ui_state만 저장
향후 버튼 분리:
1. UI 상태 저장
- save_button 유지
- UI state만 저장
2. Pending 저장
- 별도 버튼 검토
- 예: save_pending_rule_button
3. Approved 저장
- 별도 버튼 검토
- 예: save_approved_rule_button

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\EngineRule_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:13:12 | 분류: MASTER_SPEC]
4. Actual Apply
- 별도 버튼 필수
- 예: apply_approved_engine_rules_button
5. Engine Reload
- 별도 단계
- 자동 reload 여부는 별도 정책 필요
금지:
- save_button 하나에 모든 저장/승인/반영 기능을 몰아넣지 않는다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\EngineRule_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:13:12 | 분류: MASTER_SPEC]
================================================================================
10. 위험 시나리오와 차단 기준
================================================================================
시나리오 1:
Preview만 생성됐는데 실제 매매에 반영됐다고 착각
차단:
- Preview 섹션에 Not Saved / Not Applied 표시
시나리오 2:
Approved 기록은 있는데 rules.json에 반영되지 않음
차단:
- Approved와 Applied 상태 분리
시나리오 3:
rules.json에 반영됐지만 엔진이 reload하지 않음
차단:
- Applied와 Loaded 상태 분리
시나리오 4:
엔진이 로드했지만 자동매매가 실행 중이 아님
차단:
- Loaded와 Running 상태 분리
시나리오 5:
Running 중 rules 변경
차단:
- running 중 apply 금지
- 또는 별도 stop/reload/start 절차 필요

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\EngineRule_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:13:12 | 분류: MASTER_SPEC]
시나리오 6:
sell.signals.macd_sell에 condition C를 병합하여 기존 매도 신호 의미 변경
차단:
- macd_sell 변경 금지
- condition C는 별도 signal 추가만 허용

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\EngineRule_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:13:12 | 분류: MASTER_SPEC]
================================================================================
11. 다음 구현 순서
================================================================================
현재 이후 권장 구현 순서:

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\EngineRule_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:13:12 | 분류: MASTER_SPEC]
1. Life Cycle 문서 확정
2. pending 저장 여부 검토
3. approved namespace 저장 설계
4. approved 저장 기능 구현
5. actual apply 메모리 함수 검증 강화
6. actual apply 저장 기능 구현
7. engine reload 설계
8. loaded 상태 표시
9. running 상태 연결
10. 실거래 전 모의 검증

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\EngineRule_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:13:12 | 분류: MASTER_SPEC]
================================================================================
12. 현재 결론
================================================================================

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\EngineRule_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:13:12 | 분류: MASTER_SPEC]
현재 프로젝트는 Preview/Pending/Approval Simulation까지 안전하게 구현되었다.
하지만 아직 Approved/Applied/Loaded/Running 단계는 구현하지 않았다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\EngineRule_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:13:12 | 분류: MASTER_SPEC]
따라서 다음 단계는 actual rules 반영이 아니라,
Life Cycle 기준에 따라 pending 저장 또는 approved 저장 구조를 먼저 설계하는 것이 맞다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\RuleMapper_승인구조_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:09:52 | 분류: MASTER_SPEC]
Rule Mapper 승인 구조 설계 문서
작성일: 2026-07-02
대상 프로젝트: 키움 자동매매 / 지표추종매매 루틴 / Rule Mapper Preview-Pending-Approval 구조

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\RuleMapper_승인구조_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:09:52 | 분류: MASTER_SPEC]
본 문서는 지표추종매매 설정 UI에서 수집된 UI State를 실제 Engine Rules로
전환하기 전, Preview/Pending/Approval Simulation/Approved/Actual Apply
단계를 어떻게 분리할지 정의하기 위한 설계 문서이다.
핵심 목적은 다음과 같다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\RuleMapper_승인구조_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:09:52 | 분류: MASTER_SPEC]
UI State
→ Rule Mapper Preview
→ Rule Mapper Pending
→ Approval Simulation - Not Saved
→ Rule Mapper Diff
완료 항목:

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\RuleMapper_승인구조_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:09:52 | 분류: MASTER_SPEC]
1. indicator_follow_ui_state 저장/복원
- UI 상태 저장 namespace
- 화면 복원용
- 기존 engine rules와 분리

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\RuleMapper_승인구조_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:09:52 | 분류: MASTER_SPEC]
2. Rule Mapper Preview
- build_engine_rules_preview_from_ui_state()
- 기존 rules를 직접 변경하지 않음
- preview 후보만 생성
- mode = merge_add_candidate

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\RuleMapper_승인구조_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:09:52 | 분류: MASTER_SPEC]
3. Rule Mapper Diff
- compare_engine_rules_preview()
- preview와 current rules의 차이 표시
- changed / same / added / missing / merge_candidate / add_signal_candidate
- risk 표시

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\RuleMapper_승인구조_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:09:52 | 분류: MASTER_SPEC]
4. Rule Mapper Pending
- build_engine_rules_pending_from_ui_state()
- indicator_follow_rule_pending namespace 생성
- 저장하지 않고 dict 반환
- current_rules 원본 불변

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\RuleMapper_승인구조_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:09:52 | 분류: MASTER_SPEC]
5. Approval Candidate 생성
- approve_engine_rule_candidates()
- 승인된 후보만 메모리 rules dict에 반영
- 파일 저장 없음
- current_rules 원본 불변

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\RuleMapper_승인구조_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:09:52 | 분류: MASTER_SPEC]
================================================================================
3. 현재 금지 상태
================================================================================
다음 작업은 현재 단계에서 금지한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\RuleMapper_승인구조_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:09:52 | 분류: MASTER_SPEC]
2. 엔진 연결 금지
- 새 sell signal을 실제 실행 엔진에 연결하지 않음
- Rule Mapper 후보를 실거래 판단에 사용하지 않음

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\RuleMapper_승인구조_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:09:52 | 분류: MASTER_SPEC]
3. 승인 UI 금지
- 승인 체크박스/승인 버튼 추가 금지
- 승인 저장 버튼 추가 금지
- save_button과 approval 기능 연결 금지

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\RuleMapper_승인구조_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:09:52 | 분류: MASTER_SPEC]
4. 기존 핵심 key 변경 금지
- sell.signals.macd_sell 변경 금지
- indicator_follow_ui_state 내부 macd_* key 변경 금지
- target: MACD / target: OSC 변경 금지
- routine_macd_engine.py 변경 금지
- DEFAULT_MACD_ROUTINE_CONFIG alias 삭제 금지
- evaluate_macd_routine alias 삭제 금지

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\RuleMapper_승인구조_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:09:52 | 분류: MASTER_SPEC]
5. 자동 반영 금지
- Preview 생성만으로 rules를 바꾸지 않음
- Pending 생성만으로 rules를 바꾸지 않음
- Approval Simulation 생성만으로 rules를 바꾸지 않음

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\RuleMapper_승인구조_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:09:52 | 분류: MASTER_SPEC]
================================================================================
4. 승인 단계 전체 구조
================================================================================
향후 실제 승인 기능은 다음 순서를 따라야 한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\RuleMapper_승인구조_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:09:52 | 분류: MASTER_SPEC]
1단계: UI State 수집
- collect_indicator_follow_ui_state()
- 현재 화면 상태 수집

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\RuleMapper_승인구조_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:09:52 | 분류: MASTER_SPEC]
2단계: Preview 생성
- build_engine_rules_preview_from_ui_state()
- UI State를 engine rules 후보로 변환
- current_rules 변경 없음

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\RuleMapper_승인구조_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:09:52 | 분류: MASTER_SPEC]
3단계: Pending 생성
- build_engine_rules_pending_from_ui_state()
- indicator_follow_rule_pending 구조 생성
- 사람이 검토할 후보 namespace
- 저장은 아직 선택 사항

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\RuleMapper_승인구조_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:09:52 | 분류: MASTER_SPEC]
4단계: Diff 확인
- compare_engine_rules_preview()
- current rules와 preview 후보 차이 확인

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\RuleMapper_승인구조_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:09:52 | 분류: MASTER_SPEC]
6단계: 운영자 승인
- 향후 별도 승인 UI 또는 명시적 승인 버튼 필요
- save_button과 분리해야 함

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\RuleMapper_승인구조_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:09:52 | 분류: MASTER_SPEC]
7단계: Approved 구조 생성
- indicator_follow_rule_approved namespace 생성
- approved_at
- approved_paths
- source_preview_hash
- applied_paths
- warnings
- notes 포함

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\RuleMapper_승인구조_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:09:52 | 분류: MASTER_SPEC]
8단계: 실제 Engine Rules 후보 생성
- build_rules_with_approved_engine_rules()
- 메모리 dict 반환
- 파일 저장 전 snapshot/diff 검증

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\RuleMapper_승인구조_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:09:52 | 분류: MASTER_SPEC]
10단계: 엔진 연결
- 실제 Engine이 신규 rules 구조를 평가할 수 있는지 확인 후 연결
- 이 단계는 가장 마지막

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\RuleMapper_승인구조_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:09:52 | 분류: MASTER_SPEC]
================================================================================
5. Namespace 설계
================================================================================
5.1 indicator_follow_rule_pending
역할:
- 운영자 검토용 후보
- 아직 승인되지 않음
- 실제 실행 아님
예상 구조:

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\RuleMapper_승인구조_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:09:52 | 분류: MASTER_SPEC]
{
 "indicator_follow_rule_pending": {
 "version": "0.1",
 "source": "indicator_follow_ui_state",
 "mode": "merge_add_candidate",
 "created_at": "...",
 "mapped_paths": [...],
 "candidates": {
 "buy": {...},
 "sell": {...}
 },
 "warnings": [...]
 }
}
저장 여부:
- 다음 단계에서 별도 검토
- 저장하더라도 engine rules에는 반영하지 않음
5.2 indicator_follow_rule_approved
역할:
- 운영자가 승인한 후보 기록
- 실제 rules 반영 전/후 추적용
- audit 용도
예상 구조:

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\RuleMapper_승인구조_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:09:52 | 분류: MASTER_SPEC]
{
 "indicator_follow_rule_approved": {
 "version": "0.1",
 "approved_at": "...",
 "approved_paths": [...],
 "applied_paths": [...],
 "skipped_paths": [...],
 "source_preview_hash": "...",
 "warnings": [...],
 "notes": [...]
 }
}

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\RuleMapper_승인구조_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:09:52 | 분류: MASTER_SPEC]
주의:
- approved namespace가 있다고 해서 반드시 engine에 반영된 것은 아님.
- engine 반영 여부는 별도 applied/committed 상태로 구분 가능하다.
5.3 실제 engine rules 반영 영역
현재 기준 최소 반영 후보:

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\RuleMapper_승인구조_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:09:52 | 분류: MASTER_SPEC]
SELL:
- sell.signals.macd_sell 변경 금지
- condition C 후보는 별도 signal로 추가
- 후보 signal: sell.signals.ui_condition_c_indicator_sell
- 기본 enabled = false

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\RuleMapper_승인구조_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:09:52 | 분류: MASTER_SPEC]
================================================================================
6. BUY 반영 원칙
================================================================================
BUY 후보는 merge 방식만 허용한다.
기존 구조:
- buy.groups[0].conditions
- OSC TURN_UP 조건 존재

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\RuleMapper_승인구조_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:09:52 | 분류: MASTER_SPEC]
승인 시 반영:
- 기존 조건 순서 유지
- 기존 group metadata 유지
- 기존 conditions_logic 유지
- OSC TURN_UP 중복 추가 금지
- threshold 후보만 뒤에 append

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\RuleMapper_승인구조_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:09:52 | 분류: MASTER_SPEC]
중복 판단 기준:
- target
- operator
- value
- reference 또는 source가 있다면 함께 고려

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\RuleMapper_승인구조_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:09:52 | 분류: MASTER_SPEC]
================================================================================
7. SELL 반영 원칙
================================================================================
SELL 후보는 기존 macd_sell에 병합하지 않는다.
기존 구조:
- sell.signals.macd_sell
- OSC TURN_DOWN 기반 핵심 매도 신호

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\RuleMapper_승인구조_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:09:52 | 분류: MASTER_SPEC]
금지:
- sell.signals.macd_sell 변경 금지
- macd_sell 내부 조건 병합 금지
- 기존 매도 신호 의미 변경 금지
승인 후보:
- sell.signals.ui_condition_c_indicator_sell

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\RuleMapper_승인구조_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:09:52 | 분류: MASTER_SPEC]
원칙:
- 별도 signal로 추가
- 기본 enabled = false
- preview_candidate/path 같은 preview 전용 meta 제거
- target: MACD는 실제 지표명이므로 유지
- 엔진이 해당 signal을 평가하지 못하면 저장만 해도 실행 반영 없음

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\RuleMapper_승인구조_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:09:52 | 분류: MASTER_SPEC]
================================================================================
8. 저장 정책
================================================================================
8.1 저장 단계 분리
저장은 세 단계로 분리한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\RuleMapper_승인구조_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:09:52 | 분류: MASTER_SPEC]
1. UI State 저장
- 현재 save_button 역할
- indicator_follow_ui_state만 저장
- 이미 구현됨

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\RuleMapper_승인구조_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:09:52 | 분류: MASTER_SPEC]
2. Pending/Approved 저장
- 향후 별도 버튼 또는 별도 함수 필요
- save_button과 연결 금지

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\RuleMapper_승인구조_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:09:52 | 분류: MASTER_SPEC]
3. 실제 Engine Rules 저장
- 최종 승인 후 별도 단계
- 가장 위험한 단계
- snapshot/diff 검증 필수
8.2 copy-on-write 원칙
실제 저장이 구현될 경우 반드시 다음 순서를 따른다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\RuleMapper_승인구조_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:09:52 | 분류: MASTER_SPEC]
================================================================================
9. GUI 설계 원칙
================================================================================

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\RuleMapper_승인구조_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:09:52 | 분류: MASTER_SPEC]
현재 검증 화면 표시 흐름:
- [Validation Summary]
- [Collected UI JSON]
- [Pending Rules Preview]
- [Rule Mapper Preview]
- [Rule Mapper Pending]
- [Rule Mapper Approval Simulation - Not Saved]
- [Rule Mapper Diff]

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\RuleMapper_승인구조_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:09:52 | 분류: MASTER_SPEC]
향후 승인 UI를 만든다면:
- save_button과 분리
- 별도 버튼 사용
- 예: engine_rule_approval_button
- 예: save_approved_engine_rules_button

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\RuleMapper_승인구조_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:09:52 | 분류: MASTER_SPEC]
버튼 역할:
- UI 상태 저장 버튼: indicator_follow_ui_state만 저장
- Rule approval 버튼: 승인 후보 생성/저장 전 검토
- Engine rules 저장 버튼: 최종 승인 후 실제 rules 반영
현재 단계에서는 승인 버튼을 만들지 않는다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\RuleMapper_승인구조_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:09:52 | 분류: MASTER_SPEC]
================================================================================
10. 테스트 설계
================================================================================

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\RuleMapper_승인구조_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:09:52 | 분류: MASTER_SPEC]
1. Pending 저장 테스트
- indicator_follow_rule_pending만 추가됨
- buy/sell 불변
- 저장 후 JSON roundtrip

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\RuleMapper_승인구조_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:09:52 | 분류: MASTER_SPEC]
2. Approved 저장 테스트
- indicator_follow_rule_approved만 추가됨
- engine rules 불변
- approved_paths 기록

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\RuleMapper_승인구조_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:09:52 | 분류: MASTER_SPEC]
4. GUI 테스트
- validate 버튼 클릭 시 Preview/Pending/Simulation/Diff 표시
- save_button 클릭 시 approval 관련 변경 없음
- approval 저장 버튼이 생긴다면 기존 save_button과 분리 확인

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\RuleMapper_승인구조_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:09:52 | 분류: MASTER_SPEC]
================================================================================
11. 다음 구현 순서
================================================================================
권장 구현 순서:
1. 현재 상태 문서화
- 본 문서
- 작업재개요약
- MASTER_SPEC 갱신자료

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\RuleMapper_승인구조_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:09:52 | 분류: MASTER_SPEC]
2. Pending 저장 여부 검토
- 저장할지 말지 결정
- 저장한다면 indicator_follow_rule_pending만 저장

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\RuleMapper_승인구조_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:09:52 | 분류: MASTER_SPEC]
3. Approved namespace 설계 확정
- approved_paths
- source_preview_hash
- applied_paths
- skipped_paths
- warnings
4. Approved 저장 기능 구현
- 아직 engine rules 반영 없음

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\RuleMapper_승인구조_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:09:52 | 분류: MASTER_SPEC]
현재 가장 중요한 원칙:
- Preview는 후보
- Pending은 검토 대상
- Approval Simulation은 저장 없는 시뮬레이션
- Approved는 향후 승인 기록
- Actual Apply는 가장 마지막

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_사용처_최종스캔표_kiwoom_auto_31_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:37:50 | 분류: MASTER_SPEC]
MACD 사용처 최종 스캔표
작성일: 2026-07-02
대상: kiwoom_auto (31)(1).zip 압축 해제본
범위: .git 및 __pycache__ 제외, py/json/txt/md/cfg 등 텍스트 파일 검색

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_사용처_최종스캔표_kiwoom_auto_31_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:37:50 | 분류: MASTER_SPEC]
================================================================================
1. 전체 요약
================================================================================
- MACD/macd 문자열 포함 파일 수: 65개
- 전체 관련 라인 수: 2446줄
- reports/PROJECT_CHANGELOG/tools 제외 실질 검토 파일 수: 17개
- 실질 검토 관련 라인 수: 177줄
- 파일명에 macd 포함: routines/지표추종매매/routine_macd_engine.py 1개

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_사용처_최종스캔표_kiwoom_auto_31_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:37:50 | 분류: MASTER_SPEC]
판정: 현재 공통 UI 파일명은 이미 gui_indicator_follow_* 계열로 정리되어 있으나, 내부 변수/호환 key/rules/test에는 macd 명칭이 남아 있다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_사용처_최종스캔표_kiwoom_auto_31_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:37:50 | 분류: MASTER_SPEC]
================================================================================
2. 분류별 파일 목록
================================================================================

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_사용처_최종스캔표_kiwoom_auto_31_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:37:50 | 분류: MASTER_SPEC]
[GUI 기타(문구/주석 보류)]
- gui_auto_trade_status_ops.py : 관련 라인 1줄 / macd 출현 1회
- gui_routine_condition_engine.py : 관련 라인 1줄 / macd 출현 1회
- gui_schedule_window.py : 관련 라인 1줄 / macd 출현 1회

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_사용처_최종스캔표_kiwoom_auto_31_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:37:50 | 분류: MASTER_SPEC]
[JSON/rules/runtime(대부분 변경금지)]
- _등록확인폴더/budget.json : 관련 라인 1줄 / macd 출현 1회
- _지표추종매매/budget.json : 관련 라인 1줄 / macd 출현 1회
- routines/지표추종매매/rules.json : 관련 라인 12줄 / macd 출현 13회

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_사용처_최종스캔표_kiwoom_auto_31_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:37:50 | 분류: MASTER_SPEC]
[MACD 지표 엔진(변경금지/최후순위)]
- routines/지표추종매매/routine_macd_engine.py : 관련 라인 25줄 / macd 출현 30회

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_사용처_최종스캔표_kiwoom_auto_31_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:37:50 | 분류: MASTER_SPEC]
[Rule Mapper(교체 후보 일부)]
- routines/지표추종매매/routine_rule_mapper.py : 관련 라인 28줄 / macd 출현 33회

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_사용처_최종스캔표_kiwoom_auto_31_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:37:50 | 분류: MASTER_SPEC]
[공통 UI(교체 후보 일부)]
- gui_indicator_follow_buy_controls.py : 관련 라인 1줄 / macd 출현 1회
- gui_indicator_follow_data_tabs.py : 관련 라인 7줄 / macd 출현 14회
- gui_indicator_follow_routine_settings_dialog.py : 관련 라인 11줄 / macd 출현 18회
- gui_indicator_follow_sell_controls.py : 관련 라인 29줄 / macd 출현 43회

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_사용처_최종스캔표_kiwoom_auto_31_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:37:50 | 분류: MASTER_SPEC]
[공통 지표 엔진(지표명 유지)]
- engines/condition_engine.py : 관련 라인 1줄 / macd 출현 1회
- engines/indicator_engine.py : 관련 라인 16줄 / macd 출현 21회

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_사용처_최종스캔표_kiwoom_auto_31_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:37:50 | 분류: MASTER_SPEC]
[기록/리포트(무시 가능)]
- PROJECT_CHANGELOG.txt : 관련 라인 1597줄 / macd 출현 2299회
- reports/blocked_actions/20260603_124134_종목_삭제_처리불가.txt : 관련 라인 18줄 / macd 출현 18회
- reports/blocked_actions/20260603_124145_루틴_지정_사전검사_처리불가.txt : 관련 라인 12줄 / macd 출현 12회
- reports/blocked_actions/20260603_124231_루틴_해제_처리불가.txt : 관련 라인 16줄 / macd 출현 16회
- reports/blocked_actions/20260603_124235_루틴_해제_처리불가.txt : 관련 라인 16줄 / macd 출현 16회
- reports/blocked_actions/20260603_130119_종목_삭제_처리불가.txt : 관련 라인 12줄 / macd 출현 12회
- reports/blocked_actions/20260603_130125_종목_삭제_처리불가.txt : 관련 라인 17줄 / macd 출현 17회
- reports/blocked_actions/20260603_130143_종목_삭제_처리불가.txt : 관련 라인 17줄 / macd 출현 17회
- reports/blocked_actions/20260603_130205_종목_삭제_처리불가.txt : 관련 라인 25줄 / macd 출현 25회
- reports/blocked_actions/20260603_130208_종목_삭제_처리불가.txt : 관련 라인 17줄 / macd 출현 17회
- reports/blocked_actions/20260603_130231_종목_삭제_처리불가.txt : 관련 라인 8줄 / macd 출현 8회
- reports/blocked_actions/20260603_131926_루틴_지정_사전검사_처리불가.txt : 관련 라인 12줄 / macd 출현 12회
- reports/blocked_actions/20260603_131928_루틴_지정_사전검사_처리불가.txt : 관련 라인 12줄 / macd 출현 12회
- reports/blocked_actions/20260603_131932_루틴_지정_사전검사_처리불가.txt : 관련 라인 3줄 / macd 출현 3회
- reports/blocked_actions/20260603_131939_루틴_지정_사전검사_처리불가.txt : 관련 라인 3줄 / macd 출현 3회
- reports/blocked_actions/20260603_131944_루틴_지정_사전검사_처리불가.txt : 관련 라인 3줄 / macd 출현 3회
- reports/blocked_actions/20260603_131946_루틴_지정_사전검사_처리불가.txt : 관련 라인 3줄 / macd 출현 3회
- reports/blocked_actions/20260603_131949_루틴_지정_사전검사_처리불가.txt : 관련 라인 3줄 / macd 출현 3회
- reports/blocked_actions/20260603_132519_루틴_해제_처리불가.txt : 관련 라인 25줄 / macd 출현 25회
- reports/blocked_actions/20260603_132521_루틴_해제_처리불가.txt : 관련 라인 25줄 / macd 출현 25회
- reports/blocked_actions/20260603_141035_루틴_지정_사전검사_처리불가.txt : 관련 라인 6줄 / macd 출현 6회
- reports/blocked_actions/20260603_141048_루틴_지정_사전검사_처리불가.txt : 관련 라인 6줄 / macd 출현 6회
- reports/blocked_actions/20260603_141120_루틴_해제_처리불가.txt : 관련 라인 6줄 / macd 출현 6회
- reports/blocked_actions/20260603_141130_루틴_지정_사전검사_처리불가.txt : 관련 라인 3줄 / macd 출현 3회
- reports/blocked_actions/20260603_141143_루틴_지정_사전검사_처리불가.txt : 관련 라인 3줄 / macd 출현 3회
- reports/blocked_actions/20260603_141200_종목_삭제_처리불가.txt : 관련 라인 4줄 / macd 출현 4회
- reports/blocked_actions/20260603_141233_종목_삭제_처리불가.txt : 관련 라인 4줄 / macd 출현 4회
- reports/blocked_actions/20260603_141240_종목_삭제_처리불가.txt : 관련 라인 8줄 / macd 출현 8회
- reports/blocked_actions/20260603_141328_루틴_지정_사전검사_처리불가.txt : 관련 라인 3줄 / macd 출현 3회
- reports/blocked_actions/20260603_141906_루틴_지정_사전검사_처리불가.txt : 관련 라인 3줄 / macd 출현 3회
- reports/blocked_actions/20260603_142959_루틴_지정_사전검사_처리불가.txt : 관련 라인 3줄 / macd 출현 3회
- reports/blocked_actions/20260604_063141_종목_삭제_처리불가.txt : 관련 라인 9줄 / macd 출현 9회
- reports/blocked_actions/20260604_065157_루틴_해제_처리불가.txt : 관련 라인 7줄 / macd 출현 7회
- reports/blocked_actions/20260604_092913_종목_삭제_처리불가.txt : 관련 라인 1줄 / macd 출현 1회
- reports/blocked_actions/20260604_092939_종목_삭제_처리불가.txt : 관련 라인 1줄 / macd 출현 1회
- reports/blocked_actions/20260604_093010_종목_삭제_처리불가.txt : 관련 라인 1줄 / macd 출현 1회
- reports/blocked_actions/20260604_150535_루틴_해제_처리불가.txt : 관련 라인 4줄 / macd 출현 4회
- reports/blocked_actions/20260604_150904_루틴_지정_사전검사_처리불가.txt : 관련 라인 3줄 / macd 출현 3회
- reports/blocked_actions/20260604_150913_루틴_해제_처리불가.txt : 관련 라인 4줄 / macd 출현 4회
- reports/blocked_actions/20260604_151403_루틴_해제_처리불가.txt : 관련 라인 4줄 / macd 출현 4회
- reports/blocked_actions/20260604_153026_루틴_지정_사전검사_처리불가.txt : 관련 라인 3줄 / macd 출현 3회
- reports/blocked_actions/20260604_처리불가_누적리포트.txt : 관련 라인 54줄 / macd 출현 54회
- reports/blocked_actions/20260605_처리불가_누적리포트.txt : 관련 라인 114줄 / macd 출현 114회
- reports/blocked_actions/20260606_처리불가_누적리포트.txt : 관련 라인 20줄 / macd 출현 20회
- reports/blocked_actions/20260611_처리불가_누적리포트.txt : 관련 라인 52줄 / macd 출현 52회
- reports/blocked_actions/20260615_처리불가_누적리포트.txt : 관련 라인 94줄 / macd 출현 94회

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_사용처_최종스캔표_kiwoom_auto_31_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:37:50 | 분류: MASTER_SPEC]
[기타]
- routines/지표추종매매/routine_condition_engine.py : 관련 라인 1줄 / macd 출현 1회

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_사용처_최종스캔표_kiwoom_auto_31_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:37:50 | 분류: MASTER_SPEC]
[도구/정리스크립트(보류)]
- tools/cleanup_project_junk_v3.py : 관련 라인 3줄 / macd 출현 3회
- tools/create_routine_packages_from_legacy.py : 관련 라인 2줄 / macd 출현 2회

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_사용처_최종스캔표_kiwoom_auto_31_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:37:50 | 분류: MASTER_SPEC]
[루틴 진입/alias(일부 유지)]
- routines/지표추종매매/routine.py : 관련 라인 24줄 / macd 출현 24회

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_사용처_최종스캔표_kiwoom_auto_31_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:37:50 | 분류: MASTER_SPEC]
[테스트(호환 검증 유지)]
- tests/test_indicator_follow_rule_mapper_preview.py : 관련 라인 17줄 / macd 출현 18회

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_사용처_최종스캔표_kiwoom_auto_31_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:37:50 | 분류: MASTER_SPEC]
================================================================================
3. 핵심 파일별 세부 스캔
================================================================================

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_사용처_최종스캔표_kiwoom_auto_31_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:37:50 | 분류: MASTER_SPEC]
## gui_indicator_follow_data_tabs.py
- 관련 라인: 7줄
- 분류: 공통 UI(교체 후보 일부)
- 판정: data tab이 기존 sell.signals.macd_sell 상태를 표시/카드화한다. rules 호환 표시라 즉시 변경 금지. 변수명은 장기 교체 후보.
 주요 라인 예시:
 - L126: macd_sell = signals.get("macd_sell", {}) if isinstance(signals.get("macd_sell", {}), dict) else {}
 - L127: macd_sell_enabled = bool(macd_sell.get("enabled", True))
 - L128: macd_sell_delay = macd_sell.get("delay_bar", sell.get("delay_bar", ""))
 - L156: self.macd_sell_enabled_check.setChecked(macd_sell_enabled)
 - L157: self.macd_sell_delay_line.setText(str(macd_sell_delay))
 - L158: self.macd_sell_status_line.setText("사용" if macd_sell_enabled else "비활성")
 - L202: "macd_sell": self.card_sell["status"].text(),

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_사용처_최종스캔표_kiwoom_auto_31_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:37:50 | 분류: MASTER_SPEC]
## gui_indicator_follow_routine_settings_dialog.py
- 관련 라인: 11줄
- 분류: 공통 UI(교체 후보 일부)
- 판정: 설정창 populate/상태표시에서 macd_sell을 읽는다. 기존 rules key 참조라 즉시 변경 금지. UI 변수명은 wrapper/alias 후 장기 교체 후보.
 주요 라인 예시:
 - L385: macd_sell = signals.get("macd_sell", {}) if isinstance(signals.get("macd_sell", {}), dict) else {}
 - L386: macd_sell_enabled = bool(macd_sell.get("enabled", True))
 - L387: macd_sell_delay = macd_sell.get("delay_bar", sell.get("delay_bar", ""))
 - L420: if hasattr(self, "macd_sell_enabled_check"):
 - L421: self.macd_sell_enabled_check.setChecked(macd_sell_enabled)
 - L422: if hasattr(self, "macd_sell_delay_line"):
 - L423: self.macd_sell_delay_line.setText(str(macd_sell_delay))
 - L424: if hasattr(self, "macd_sell_status_line"):
 - L425: self.macd_sell_status_line.setText("사용" if macd_sell_enabled else "비활성")
 - L486: "macd_sell": self.card_sell["status"].text(),

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_사용처_최종스캔표_kiwoom_auto_31_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:37:50 | 분류: MASTER_SPEC]
## gui_indicator_follow_sell_controls.py
- 관련 라인: 29줄
- 분류: 공통 UI(교체 후보 일부)
- 판정: MACD선/시그널선 표시명은 지표명이므로 유지. macd_kind_combo 등 내부 변수명은 저장 key와 분리 확인 후 교체 후보.
 주요 라인 예시:
 - L458: macd_kind_combo = make_combo(["MACD선", "시그널선"], "MACD선", 120)
 - L459: macd_sign_combo = make_combo(["-", "+"], "-", 60)
 - L460: macd_value_line = make_line("1.0", 60)
 - L461: macd_compare_combo = make_combo(["이하", "이상"], "이하", 76)
 - L463: def _sync_macd_sign_combo():
 - L464: value = macd_value_line.text().strip()
 - L469: macd_sign_combo.setEnabled(numeric_value is None or numeric_value != 0.0)
 - L471: macd_value_line.textChanged.connect(_sync_macd_sign_combo)
 - L472: _sync_macd_sign_combo()
 - L474: macd_check = add_filter_row([

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_사용처_최종스캔표_kiwoom_auto_31_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:37:50 | 분류: MASTER_SPEC]
## routines/지표추종매매/routine.py
- 관련 라인: 24줄
- 분류: 루틴 진입/alias(일부 유지)
- 판정: indicator_follow 일반명과 MACD alias가 공존한다. alias 유지 필요. 신규 호출은 indicator_follow만 사용해야 함.
 주요 라인 예시:
 - L7: - routine_macd_engine.py 사용.
 - L14: - 없으면 DEFAULT_MACD_ROUTINE_CONFIG를 사용한다.
 - L25: from routine_macd_engine import ( # type: ignore
 - L30: DEFAULT_MACD_ROUTINE_CONFIG = DEFAULT_INDICATOR_FOLLOW_CONFIG
 - L31: evaluate_macd_routine = evaluate_indicator_follow_routine
 - L32: _ENGINE_SOURCE = "routine_macd_engine"
 - L36: from .routine_macd_engine import ( # type: ignore
 - L41: DEFAULT_MACD_ROUTINE_CONFIG = DEFAULT_INDICATOR_FOLLOW_CONFIG
 - L42: evaluate_macd_routine = evaluate_indicator_follow_routine
 - L43: _ENGINE_SOURCE = "routine_macd_engine"

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_사용처_최종스캔표_kiwoom_auto_31_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:37:50 | 분류: MASTER_SPEC]
## routines/지표추종매매/routine_macd_engine.py
- 관련 라인: 25줄
- 분류: MACD 지표 엔진(변경금지/최후순위)
- 판정: 실제 MACD/OSC 엔진. MACD 명칭 유지. 파일명 변경은 최종 migration에서만 검토.
 주요 라인 예시:
 - L2: """MACD 전용 신호발생 엔진.
 - L5: - MACD 오실레이터 기반 BUY / SELL 판단.
 - L23: "routine_type": "MACD_OSC",
 - L26: "macd": {"fast": 12, "slow": 26, "signal": 9},
 - L63: DEFAULT_MACD_ROUTINE_CONFIG = DEFAULT_INDICATOR_FOLLOW_CONFIG
 - L77: def _macd_sell_section(sell_cfg: dict[str, Any]) -> dict[str, Any]:
 - L78: """SELL 설정에서 MACD SELL 섹션을 추출한다.
 - L81: 1. 신규 구조: sell.signals.macd_sell
 - L86: macd_sell = signals.get("macd_sell")
 - L87: if isinstance(macd_sell, dict):

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_사용처_최종스캔표_kiwoom_auto_31_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:37:50 | 분류: MASTER_SPEC]
## routines/지표추종매매/routine_rule_mapper.py
- 관련 라인: 28줄
- 분류: Rule Mapper(교체 후보 일부)
- 판정: Rule Mapper 공통 계층에 macd 후보명이 일부 남아 있다. preview key와 기존 sell.signals.macd_sell 보호 때문에 즉시 전체 치환 금지. 내부 helper부터 단계 교체 가능.
 주요 라인 예시:
 - L44: if path == "sell.signals.ui_preview_condition_c_macd_sell":
 - L46: if path == "sell.signals.macd_sell":
 - L59: "sell.signals.macd_sell": (
 - L60: "UI preview-only sell MACD condition candidate; does not replace existing rules."
 - L62: "sell.signals.ui_preview_condition_c_macd_sell": (
 - L63: "UI preview-only add signal candidate; existing sell.signals.macd_sell is unchanged."
 - L154: def _build_sell_macd_condition(condition_c: dict[str, Any], warnings: list[str]) -> dict[str, Any] | None:
 - L155: if condition_c.get("macd_check") is False:
 - L156: warnings.append("sell condition C MACD row is unchecked")
 - L160: "MACD\uc120": "MACD",

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_사용처_최종스캔표_kiwoom_auto_31_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:37:50 | 분류: MASTER_SPEC]
## routines/지표추종매매/rules.json
- 관련 라인: 12줄
- 분류: JSON/rules/runtime(대부분 변경금지)
- 판정: 실행 rules 및 UI state 저장 key. 즉시 변경 금지. migration 최후 단계 대상.
 주요 라인 예시:
 - L26: "macd": {
 - L54: "description": "MACD 오실레이터 하락 후 상승 전환"
 - L87: "note": "MACD SELL과 수익률 SELL은 같은 레벨의 독립 SELL 신호다. 둘 다 활성화된 경우 signal_logic 값으로 AND/OR 결합한다.",
 - L89: "macd_sell": {
 - L96: "name": "매도조건_MACD_OSC_TURN_DOWN",
 - L104: "description": "MACD 오실레이터 상승 후 하락 전환"
 - L369: "macd_check": true,
 - L370: "macd_compare_combo": "이하",
 - L371: "macd_kind_combo": "MACD선",
 - L372: "macd_logic_combo": "AND",

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_사용처_최종스캔표_kiwoom_auto_31_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:37:50 | 분류: MASTER_SPEC]
## tests/test_indicator_follow_rule_mapper_preview.py
- 관련 라인: 17줄
- 분류: 테스트(호환 검증 유지)
- 판정: 호환성 검증용 macd key가 포함되어 있다. 당장 유지. indicator_follow 신규 경로 테스트를 추가하는 방향이 안전.
 주요 라인 예시:
 - L38: "macd_check": True,
 - L39: "macd_compare_combo": "\uc774\ud558",
 - L40: "macd_kind_combo": "MACD\uc120",
 - L41: "macd_sign_combo": "-",
 - L42: "macd_value_line": "1.0",
 - L81: "macd_sell": {
 - L88: "name": "sell_macd_osc_turn_down",
 - L107: "macd": {"enabled": True},
 - L134: "sell.signals.ui_preview_condition_c_macd_sell",
 - L187: def test_sell_add_signal_candidate_does_not_replace_macd_sell(self):

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_사용처_최종스캔표_kiwoom_auto_31_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:37:50 | 분류: MASTER_SPEC]
## engines/indicator_engine.py
- 관련 라인: 16줄
- 분류: 공통 지표 엔진(지표명 유지)
- 판정: 공통 지표 계산 엔진. MACD는 실제 지표명이라 유지.
 주요 라인 예시:
 - L6: - EMA, 단순이평, RSI, MACD, OSC 계산.
 - L114: def macd_series(
 - L123: macd_line: list[float | None] = []
 - L126: macd_line.append(None)
 - L128: macd_line.append(fast_value - slow_value)
 - L130: signal_line = ema(macd_line, signal_period)
 - L133: for macd_value, signal_value in zip(macd_line, signal_line):
 - L134: if macd_value is None or signal_value is None:
 - L137: osc.append(macd_value - signal_value)
 - L139: return macd_line, signal_line, osc

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_사용처_최종스캔표_kiwoom_auto_31_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:37:50 | 분류: MASTER_SPEC]
================================================================================
4. 교체 우선순위
================================================================================

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_사용처_최종스캔표_kiwoom_auto_31_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:37:50 | 분류: MASTER_SPEC]
[P0 변경 금지]
- routines/지표추종매매/routine_macd_engine.py 전체 MACD/OSC 계산·판정 명칭
- routines/지표추종매매/rules.json 내부 macd, macd_sell, target: MACD/OSC
- sell.signals.macd_sell
- indicator_follow_ui_state 내부 기존 macd_* 저장 key
- DEFAULT_MACD_ROUTINE_CONFIG / evaluate_macd_routine alias
- 테스트가 기존 rules key 호환을 확인하는 macd 참조

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_사용처_최종스캔표_kiwoom_auto_31_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:37:50 | 분류: MASTER_SPEC]
[P1 즉시 신규 사용 금지]
- 신규 gui_macd_* 파일명
- 신규 macd_* 공통 UI 변수/함수
- 신규 DEFAULT_MACD_* / evaluate_macd_*
- 신규 Rule Mapper 공통 path에 전략 의미 macd 추가

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_사용처_최종스캔표_kiwoom_auto_31_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:37:50 | 분류: MASTER_SPEC]
[P2 안전 교체 후보]
- gui_indicator_follow_sell_controls.py 내부 변수명: macd_kind_combo, macd_sign_combo, macd_value_line, macd_compare_combo 등
- gui_indicator_follow_routine_settings_dialog.py 내부 표시 변수: macd_sell_enabled_check 등. 단, rules key와 분리 확인 후
- routine_rule_mapper.py 내부 helper명: _build_sell_macd_condition 등. 단, preview output key와 테스트 영향 확인 후

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_사용처_최종스캔표_kiwoom_auto_31_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:37:50 | 분류: MASTER_SPEC]
================================================================================
5. 다음 실제 작업 권장
================================================================================
1) 코드 수정 전 현재 스캔표를 기준선으로 저장한다.
2) P1 규칙을 먼저 프로젝트 운영 원칙으로 고정한다.
3) P2 중에서도 저장 key와 연결되지 않은 UI 내부 변수명부터 소량 변경한다.
4) 변경마다 py_compile + unittest + rules.json 변경 없음 확인을 수행한다.
5) Rule Mapper/Preview/Diff가 정상인 상태에서만 다음 교체로 넘어간다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\Migration_Master_List_MACD_일반화_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:35:00 | 분류: MASTER_SPEC]
프로젝트 Migration Master List
작성일: 2026-07-02

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\Migration_Master_List_MACD_일반화_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:35:00 | 분류: MASTER_SPEC]
목적
- MACD 명칭 일반화를 안전하게 수행하기 위한 최종 관리 목록.
- 실제 코드 수정은 본 목록의 우선순위를 따른다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\Migration_Master_List_MACD_일반화_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:35:00 | 분류: MASTER_SPEC]
==============================================================================
A. 절대 변경 금지
==============================================================================
- rules.json의 macd 관련 key
- sell.signals.macd_sell
- target: MACD
- target: OSC
- MACD 계산식
- OSC 계산식
- 기존 테스트 참조 key
- DEFAULT_MACD_ROUTINE_CONFIG (alias)
- evaluate_macd_routine() (alias)

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\Migration_Master_List_MACD_일반화_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:35:00 | 분류: MASTER_SPEC]
==============================================================================
B. 즉시 일반화 대상
==============================================================================
공통 UI
Collector
Apply
Save/Load
Rule Mapper
Preview
Diff
Registry
Routine Interface
규칙
- 신규 작성은 indicator_follow 사용
- 신규 macd 접두어 금지

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\Migration_Master_List_MACD_일반화_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:35:00 | 분류: MASTER_SPEC]
==============================================================================
C. 안전 교체 후보
==============================================================================
- UI 내부 변수명
- UI 내부 함수명
- Rule Mapper 내부 helper
- Preview 내부 임시 변수
조건
- 저장 key와 직접 연결되지 않을 것
- 테스트 영향이 없을 것

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\Migration_Master_List_MACD_일반화_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:35:00 | 분류: MASTER_SPEC]
==============================================================================
D. 보류
==============================================================================
- gui_macd_* 파일명
- 클래스명
- import 경로
사유
- 변경 범위가 넓음
- import 연쇄 영향

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\Migration_Master_List_MACD_일반화_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:35:00 | 분류: MASTER_SPEC]
==============================================================================
E. 최종 Migration
==============================================================================
1. 파일명
2. 클래스명
3. import
4. 테스트명
5. rules key
6. alias 제거

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\Migration_Master_List_MACD_일반화_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:35:00 | 분류: MASTER_SPEC]
==============================================================================
실행 체크리스트
==============================================================================
□ py_compile
□ Preview 정상
□ Diff 정상
□ UI 저장/복원 정상
□ 기존 테스트 통과
□ 신규 indicator_follow 경로 통과
□ rules.json 변경 없음

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\Migration_Master_List_MACD_일반화_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:35:00 | 분류: MASTER_SPEC]
==============================================================================
완료 기준
==============================================================================
공통 계층에는 전략 의미의 macd 명칭이 존재하지 않는다.
MACD는 오직 지표 엔진 및 실제 지표 표현에서만 사용된다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\프로젝트_일반화_로드맵_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:33:28 | 분류: MASTER_SPEC]
프로젝트 일반화 로드맵 (실행 순서)
작성일: 2026-07-02

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\프로젝트_일반화_로드맵_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:33:28 | 분류: MASTER_SPEC]
목적
- 프로젝트를 MACD 전용 구조에서 지표추종 공통 구조로 안전하게 일반화한다.
- 기존 동작과 호환성을 유지하면서 단계적으로 이전한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\프로젝트_일반화_로드맵_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:33:28 | 분류: MASTER_SPEC]
==============================================================================
Phase 1 (완료)
==============================================================================
- UI 프로토타입 완료
- indicator_follow_ui_state 저장/복원
- Rule Mapper Preview/Diff
- DEFAULT_INDICATOR_FOLLOW_CONFIG
- evaluate_indicator_follow_routine()
- MACD alias 유지

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\프로젝트_일반화_로드맵_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:33:28 | 분류: MASTER_SPEC]
==============================================================================
Phase 2 (현재 진행 권장)
==============================================================================
목표: 신규 MACD 확산 차단

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\프로젝트_일반화_로드맵_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:33:28 | 분류: MASTER_SPEC]
작업
1. 신규 코드에서 indicator_follow 명칭만 사용
2. MACD 사용처 유지/교체/금지 기준 적용
3. UI/Mapper 내부 신규 변수명 일반화
4. Alias 유지
완료 기준
- 신규 코드에 전략 의미의 macd 명칭 추가 0건

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\프로젝트_일반화_로드맵_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:33:28 | 분류: MASTER_SPEC]
==============================================================================
Phase 3
==============================================================================
공통 계층 일반화

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\프로젝트_일반화_로드맵_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:33:28 | 분류: MASTER_SPEC]
대상
- UI
- Collector
- Apply
- Save/Load
- Preview
- Diff
- Rule Mapper
- Registry
원칙
- 기능 변경 금지
- 명칭만 일반화
- py_compile
- 기존 테스트 통과

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\프로젝트_일반화_로드맵_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:33:28 | 분류: MASTER_SPEC]
==============================================================================
Phase 5
==============================================================================
Migration
대상
- gui_macd_* 파일명
- 클래스명
- import
- 테스트명
- rules key
주의
- Alias 제거는 마지막
- routine_macd_engine.py는 최종 단계 검토

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\프로젝트_일반화_로드맵_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:33:28 | 분류: MASTER_SPEC]
==============================================================================
체크리스트

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\루틴계층_지표계층_분리기준_MACD명칭확산방지_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:30:32 | 분류: MASTER_SPEC]
루틴 계층 / 지표 계층 분리 기준 문서
작성일: 2026-07-02
대상 프로젝트: 키움 자동매매 / 지표추종매매 루틴 일반화 작업

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\루틴계층_지표계층_분리기준_MACD명칭확산방지_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:30:32 | 분류: MASTER_SPEC]
본 문서는 기존 MACD 중심 명칭이 프로젝트 공통 영역과 지표 고유 영역에
혼재되어 발생할 수 있는 확장 리스크를 방지하기 위한 기준 문서이다.
핵심 목적은 다음과 같다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\루틴계층_지표계층_분리기준_MACD명칭확산방지_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:30:32 | 분류: MASTER_SPEC]
1. 루틴 계층과 지표 계층을 명확히 분리한다.
2. 앞으로 신규 코드에서 MACD 명칭이 공통 영역으로 확산되는 것을 금지한다.
3. 기존 MACD 호환 구조는 유지하되, 신규 구현은 indicator_follow 기준으로 진행한다.
4. 향후 RSI, 볼린저밴드, 이동평균 등 다른 지표 기반 루틴 확장 시 UI/Rule Mapper/저장 구조를 재사용할 수 있게 한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\루틴계층_지표계층_분리기준_MACD명칭확산방지_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:30:32 | 분류: MASTER_SPEC]
================================================================================
2. 현재 문제 정의
================================================================================
현재 프로젝트에는 MACD라는 명칭이 두 의미로 혼용되어 있다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\루틴계층_지표계층_분리기준_MACD명칭확산방지_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:30:32 | 분류: MASTER_SPEC]
1) 루틴/전략 의미
- MACD매매루틴
- MACD 설정창
- gui_macd_*
- macd routine
- macd settings

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\루틴계층_지표계층_분리기준_MACD명칭확산방지_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:30:32 | 분류: MASTER_SPEC]
2) 실제 지표 의미
- MACD선
- Signal선
- OSC
- MACD 계산
- MACD 기반 매수/매도 조건

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\루틴계층_지표계층_분리기준_MACD명칭확산방지_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:30:32 | 분류: MASTER_SPEC]
문제는 1번 루틴/전략 의미의 MACD가 실제로는 지표추종매매 공통 영역으로 확장될 수 있는 구조라는 점이다.
따라서 앞으로 공통 영역은 indicator_follow 명칭으로 정리하고,
MACD는 실제 지표 계산 및 지표 조건 영역에만 남겨야 한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\루틴계층_지표계층_분리기준_MACD명칭확산방지_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:30:32 | 분류: MASTER_SPEC]
================================================================================
3. 최종 계층 구조
================================================================================
전체 구조는 다음과 같이 분리한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\루틴계층_지표계층_분리기준_MACD명칭확산방지_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:30:32 | 분류: MASTER_SPEC]
[공통 루틴 계층]
- UI
- Collector
- Apply
- Save/Load
- Rule Mapper
- Preview
- Diff
- Validator
- Registry
- Routine Interface

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\루틴계층_지표계층_분리기준_MACD명칭확산방지_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:30:32 | 분류: MASTER_SPEC]
[지표 추종 루틴 계층]
- indicator_follow_ui_state
- indicator_follow_rule_preview
- evaluate_indicator_follow_routine()
- DEFAULT_INDICATOR_FOLLOW_CONFIG
- routine_rule_mapper.py

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\루틴계층_지표계층_분리기준_MACD명칭확산방지_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:30:32 | 분류: MASTER_SPEC]
[지표 엔진 계층]
- MACD
- OSC
- RSI
- Bollinger Band
- Moving Average
- 기타 지표 계산/판정 모듈

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\루틴계층_지표계층_분리기준_MACD명칭확산방지_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:30:32 | 분류: MASTER_SPEC]
즉, MACD는 지표 엔진 계층에만 남아야 하며,
UI/저장/Preview/Mapper/Registry 등 공통 계층에서는 신규 MACD 명칭 사용을 금지한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\루틴계층_지표계층_분리기준_MACD명칭확산방지_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:30:32 | 분류: MASTER_SPEC]
================================================================================
4. 공통 루틴 계층 명명 규칙
================================================================================
공통 루틴 계층에서는 다음 명칭을 사용한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\루틴계층_지표계층_분리기준_MACD명칭확산방지_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:30:32 | 분류: MASTER_SPEC]
권장 접두어:
- indicator_follow
- routine
- rule_mapper
- ui_state
- preview
- diff
- validator
- registry

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\루틴계층_지표계층_분리기준_MACD명칭확산방지_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:30:32 | 분류: MASTER_SPEC]
권장 함수명:
- collect_indicator_follow_ui_state()
- apply_indicator_follow_ui_state()
- save_indicator_follow_ui_state_to_rules()
- build_engine_rules_preview_from_ui_state()
- compare_engine_rules_preview()
- evaluate_indicator_follow_routine()

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\루틴계층_지표계층_분리기준_MACD명칭확산방지_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:30:32 | 분류: MASTER_SPEC]
권장 설정명:
- indicator_follow_ui_state
- indicator_follow_rule_preview
- DEFAULT_INDICATOR_FOLLOW_CONFIG

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\루틴계층_지표계층_분리기준_MACD명칭확산방지_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:30:32 | 분류: MASTER_SPEC]
금지:
- 신규 gui_macd_*
- 신규 macd_settings_*
- 신규 macd_ui_*
- 신규 macd_rule_mapper_*
- 신규 evaluate_macd_*
- 신규 DEFAULT_MACD_*

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\루틴계층_지표계층_분리기준_MACD명칭확산방지_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:30:32 | 분류: MASTER_SPEC]
================================================================================
5. 지표 엔진 계층 명명 규칙
================================================================================
지표 엔진 계층에서는 실제 지표명을 유지한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\루틴계층_지표계층_분리기준_MACD명칭확산방지_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:30:32 | 분류: MASTER_SPEC]
허용:
- MACD
- OSC
- macd
- macd_series
- signal_line
- histogram
- RSI
- Bollinger
- MA

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\루틴계층_지표계층_분리기준_MACD명칭확산방지_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:30:32 | 분류: MASTER_SPEC]
허용 예:
- routine_macd_engine.py
- calculate_macd()
- macd_series()
- target: MACD
- target: OSC
- MACD선
- 시그널선
- sell.signals.macd_sell

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\루틴계층_지표계층_분리기준_MACD명칭확산방지_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:30:32 | 분류: MASTER_SPEC]
주의:
이 계층의 MACD 명칭은 실제 지표 의미이므로 제거 대상이 아니다.
다만 공통 UI/Mapper/Registry로 새롭게 확산되면 안 된다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\루틴계층_지표계층_분리기준_MACD명칭확산방지_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:30:32 | 분류: MASTER_SPEC]
================================================================================
6. 변경 금지 대상
================================================================================
아래 항목은 현재 호환성과 기존 rules/test 안정성을 위해 즉시 변경하지 않는다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\루틴계층_지표계층_분리기준_MACD명칭확산방지_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:30:32 | 분류: MASTER_SPEC]
- routines/지표추종매매/routine_macd_engine.py
- rules.json 내부 macd 관련 key
- sell.signals.macd_sell
- indicator_follow_ui_state 내부 기존 macd_* key
- target: MACD
- target: OSC
- MACD선/시그널선 표시명
- 기존 테스트가 참조하는 macd key
- DEFAULT_MACD_ROUTINE_CONFIG alias
- evaluate_macd_routine alias

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\루틴계층_지표계층_분리기준_MACD명칭확산방지_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:30:32 | 분류: MASTER_SPEC]
위 항목은 신규 사용 금지와 별개로, 기존 호환 유지를 위해 남긴다.
삭제 또는 변경은 별도 migration 설계 후 진행한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\루틴계층_지표계층_분리기준_MACD명칭확산방지_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:30:32 | 분류: MASTER_SPEC]
================================================================================
7. 교체 후보 대상
================================================================================
아래 항목은 장기적으로 indicator_follow 계열로 교체할 수 있다.
1) UI 파일명
- gui_macd_* → gui_indicator_follow_*

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\루틴계층_지표계층_분리기준_MACD명칭확산방지_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:30:32 | 분류: MASTER_SPEC]
2) UI 클래스명
- MacdRoutineSettingsDialog → IndicatorFollowRoutineSettingsDialog

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\루틴계층_지표계층_분리기준_MACD명칭확산방지_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:30:32 | 분류: MASTER_SPEC]
3) UI 내부 변수명
- macd_sell_enabled_check
- macd_sell_delay_line
- macd_kind_combo
- sell_signal_condition_c_macd_*

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\루틴계층_지표계층_분리기준_MACD명칭확산방지_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:30:32 | 분류: MASTER_SPEC]
4) Rule Mapper 내부 후보명
- _build_sell_macd_condition
- UI_PREVIEW_SELL_MACD_CONDITION_C
- ui_preview_condition_c_macd_sell

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\루틴계층_지표계층_분리기준_MACD명칭확산방지_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:30:32 | 분류: MASTER_SPEC]
================================================================================
8. 신규 개발 금지선
================================================================================
앞으로 새로 작성하는 코드에서는 다음을 금지한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\루틴계층_지표계층_분리기준_MACD명칭확산방지_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:30:32 | 분류: MASTER_SPEC]
- 신규 파일명에 macd 사용
- 신규 공통 UI 함수명에 macd 사용
- 신규 공통 변수명에 macd 사용
- 신규 Rule Mapper 공통 함수명에 macd 사용
- 신규 Registry/Loader/Preview/Diff 계층에 macd 사용
- 신규 테스트명에 전략 의미의 macd 사용
예외:
실제 MACD 지표 계산, OSC 계산, MACD 조건 검증 테스트는 허용한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\루틴계층_지표계층_분리기준_MACD명칭확산방지_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:30:32 | 분류: MASTER_SPEC]
================================================================================
9. 향후 확장 시 적용 예
================================================================================
향후 RSI 추종 루틴을 추가할 경우:

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\루틴계층_지표계층_분리기준_MACD명칭확산방지_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:30:32 | 분류: MASTER_SPEC]
금지 방향:
- gui_rsi_routine_settings_dialog.py를 새로 복제
- rsi 전용 UI 저장 구조 생성
- rsi_rule_mapper를 별도 복제

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\루틴계층_지표계층_분리기준_MACD명칭확산방지_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:30:32 | 분류: MASTER_SPEC]
권장 방향:
- indicator_follow 공통 UI 사용
- indicator_follow_ui_state 사용
- Rule Mapper에서 target: RSI 조건 후보 생성
- 지표 엔진 계층에 RSI 계산/판정만 추가
향후 볼린저밴드 추종 루틴도 동일하다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\루틴계층_지표계층_분리기준_MACD명칭확산방지_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:30:32 | 분류: MASTER_SPEC]
공통 UI/Mapper/Preview는 indicator_follow 계층을 재사용하고,
지표별 차이는 엔진/조건 target 영역에만 둔다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\루틴계층_지표계층_분리기준_MACD명칭확산방지_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:30:32 | 분류: MASTER_SPEC]
================================================================================
10. 단계별 진행 순서
================================================================================

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\루틴계층_지표계층_분리기준_MACD명칭확산방지_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:30:32 | 분류: MASTER_SPEC]
1단계: 신규 MACD 명칭 확산 금지
- 신규 코드에서 indicator_follow 명칭 사용
- 기존 alias 유지
2단계: UI/Mapper 내부 교체 후보 분류
- 교체 가능 항목
- 보류 항목
- 변경 금지 항목 분리

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\루틴계층_지표계층_분리기준_MACD명칭확산방지_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:30:32 | 분류: MASTER_SPEC]
3단계: 공통 계층 우선 일반화
- UI
- Collector
- Apply
- Save/Load
- Preview/Diff
- Rule Mapper

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\루틴계층_지표계층_분리기준_MACD명칭확산방지_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:30:32 | 분류: MASTER_SPEC]
4단계: 테스트 보강
- 기존 macd alias 유지 검증
- indicator_follow 신규 경로 검증
- rules.json 무변경 검증

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\루틴계층_지표계층_분리기준_MACD명칭확산방지_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:30:32 | 분류: MASTER_SPEC]
================================================================================
11. 현재 결론
================================================================================
현재 MACD 명칭 문제는 완전히 해결된 상태가 아니라,
일반화 1단계가 완료된 상태이다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\루틴계층_지표계층_분리기준_MACD명칭확산방지_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:30:32 | 분류: MASTER_SPEC]
이미 완료된 것:
- DEFAULT_INDICATOR_FOLLOW_CONFIG 추가
- evaluate_indicator_follow_routine() 추가
- 기존 DEFAULT_MACD_ROUTINE_CONFIG alias 유지
- 기존 evaluate_macd_routine alias 유지
- Rule Mapper Preview/Diff는 indicator_follow 흐름으로 구성

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\루틴계층_지표계층_분리기준_MACD명칭확산방지_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:30:32 | 분류: MASTER_SPEC]
아직 남은 것:
- UI 내부 macd 변수명
- 일부 Rule Mapper 후보명
- gui_macd_* 계열 파일명
- routine_macd_engine.py 파일명
- rules.json macd key
- 테스트명 일부

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\루틴계층_지표계층_분리기준_MACD명칭확산방지_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:30:32 | 분류: MASTER_SPEC]
현재 시점에서 가장 중요한 원칙:
기존 호환 항목은 유지하되, 신규 구현에서는 MACD 명칭을 공통 영역에 절대 추가하지 않는다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\루틴계층_지표계층_분리기준_MACD명칭확산방지_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:30:32 | 분류: MASTER_SPEC]
================================================================================
12. 다음 작업 제안
================================================================================
다음 작업은 실제 코드 수정 전 아래 순서로 진행한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\루틴계층_지표계층_분리기준_MACD명칭확산방지_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:30:32 | 분류: MASTER_SPEC]
1. 교체 후보 중 안전한 항목만 선별
2. alias 유지 가능한 함수명부터 변경
3. UI 내부 변수명은 저장 key와 분리 여부 확인 후 변경
4. Rule Mapper 후보명은 preview key 안정성 확인 후 변경
5. 파일명 변경은 마지막 단계로 보류
이 문서는 다음 작업에서 MACD 명칭 일반화의 기준 문서로 사용한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_일반화_파일별_대상목록_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:26:50 | 분류: MASTER_SPEC]
MACD 명칭 일반화 파일별 대상 목록
작성일: 2026-07-02
대상 압축본: kiwoom_auto (31)(1).zip
작성 목적: 향후 프로젝트 확장 시 MACD 명칭이 신규 코드에 계속 확산되는 것을 막기 위해, 현재 파일별 사용처를 유지/교체/보류로 분류한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_일반화_파일별_대상목록_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:26:50 | 분류: MASTER_SPEC]
================================================================================
0. 결론 요약
================================================================================
현재 파일명 기준으로 macd가 남은 실제 소스 파일은 다음 1개뿐이다.
- routines/지표추종매매/routine_macd_engine.py

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_일반화_파일별_대상목록_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:26:50 | 분류: MASTER_SPEC]
따라서 과거 gui_macd_* 계열 파일명은 현재 압축본 기준으로 대부분 gui_indicator_follow_* 계열로 전환된 상태로 판단된다.
다만 코드 내부에는 macd_sell, macd_check, MACD선, MACD target, macd config 등이 남아 있다.
이 중 일부는 실제 지표/호환 key이므로 유지해야 하고, 일부는 앞으로 신규 확산을 막기 위해 일반명으로 교체해야 한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_일반화_파일별_대상목록_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:26:50 | 분류: MASTER_SPEC]
현재 전략:
- 파일명 전체 변경은 즉시 진행하지 않는다.
- 신규 코드에서는 macd 명칭을 금지한다.
- 기존 rules.json key와 테스트 호환 key는 유지한다.
- UI/Mapper 내부 변수명은 단계적으로 일반화한다.
- MACD 계산/OSC 계산/target: MACD는 유지한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_일반화_파일별_대상목록_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:26:50 | 분류: MASTER_SPEC]
================================================================================
1. 분류 기준
================================================================================

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_일반화_파일별_대상목록_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:26:50 | 분류: MASTER_SPEC]
[유지]
실제 지표명, 기존 rules 호환 key, 기존 테스트 기준, 엔진 고유 로직이다.
지금 변경하면 신호 판정, rules 호환성, 테스트 안정성이 깨질 수 있다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_일반화_파일별_대상목록_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:26:50 | 분류: MASTER_SPEC]
[교체 후보]
실제 지표 의미가 아니라 UI 위젯명, 함수명, preview 후보명, 내부 변수명에 MACD가 들어간 경우다.
향후 확장 시 지표추종 루틴 전체를 MACD 루틴처럼 보이게 만들 수 있으므로 단계적으로 교체한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_일반화_파일별_대상목록_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:26:50 | 분류: MASTER_SPEC]
[무시]
과거 로그, changelog, blocked_actions 리포트, cleanup 도구의 기록성 문자열이다.
실행 구조에 직접 영향을 주지 않는다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_일반화_파일별_대상목록_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:26:50 | 분류: MASTER_SPEC]
================================================================================
2. 파일명 조사 결과
================================================================================
실제 파일명에 macd가 포함된 항목:

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_일반화_파일별_대상목록_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:26:50 | 분류: MASTER_SPEC]
1) routines/지표추종매매/routine_macd_engine.py
- 분류: 보류/유지
- 이유: 현재 MACD/OSC 전용 계산 및 신호 평가 엔진이다.
- 즉시 변경 금지.
- 장기적으로 alias 안정화, 테스트 통과, rules migration 설계 이후에만 파일명 변경 검토.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_일반화_파일별_대상목록_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:26:50 | 분류: MASTER_SPEC]
2) routines/지표추종매매/__pycache__/routine_macd_engine.cpython-311.pyc
- 분류: 삭제 가능 캐시
- 이유: 실행 소스가 아니라 캐시 파일이다.
- 배포/정리 시 삭제 대상.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_일반화_파일별_대상목록_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:26:50 | 분류: MASTER_SPEC]
현재 압축본 기준 gui_macd_* 파일명은 실제 소스 파일명으로 남아 있지 않다.
이는 과거 작업에서 gui_indicator_follow_* 계열로 전환된 결과로 판단된다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_일반화_파일별_대상목록_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:26:50 | 분류: MASTER_SPEC]
================================================================================
3. 파일별 상세 분류
================================================================================

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_일반화_파일별_대상목록_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:26:50 | 분류: MASTER_SPEC]
--------------------------------------------------------------------------------
3-1. engines/condition_engine.py
--------------------------------------------------------------------------------
사용처:
- 주석/설명: RSI / 이평선 / MACD / OSC / 가격 / 거래량 등 공통 조건 평가
분류:
- 유지

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_일반화_파일별_대상목록_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:26:50 | 분류: MASTER_SPEC]
판정:
- 실제 지표 목록 설명이므로 변경 대상이 아니다.
- MACD를 지표명으로 언급하는 것은 허용한다.
조치:
- 수정 불필요.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_일반화_파일별_대상목록_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:26:50 | 분류: MASTER_SPEC]
--------------------------------------------------------------------------------
3-2. engines/indicator_engine.py
--------------------------------------------------------------------------------
사용처:
- docstring: EMA, 단순이평, RSI, MACD, OSC 계산
- def macd_series(...)
- macd_line 변수
- macd_cfg = cfg.get("macd", {})
- result map의 "MACD": macd_line
분류:
- 유지

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_일반화_파일별_대상목록_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:26:50 | 분류: MASTER_SPEC]
판정:
- 이 파일은 공통 지표 계산 엔진이며, MACD는 실제 지표명이다.
- macd_series, macd_line, cfg["macd"], "MACD" key는 계산 의미가 명확하다.
- 여기서 MACD 명칭을 일반명으로 바꾸면 오히려 의미가 흐려진다.
조치:
- 수정 금지.
- 단, 신규 지표 추가 시에는 실제 지표명 기준으로 별도 함수/키를 추가한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_일반화_파일별_대상목록_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:26:50 | 분류: MASTER_SPEC]
--------------------------------------------------------------------------------
3-3. gui_indicator_follow_buy_controls.py
--------------------------------------------------------------------------------
사용처:
- 표시 문자열: "시그널/MACD"
분류:
- 검토 후 유지 가능

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_일반화_파일별_대상목록_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:26:50 | 분류: MASTER_SPEC]
판정:
- UI 표시 문자열이 실제 지표 비교를 의미한다면 유지 가능하다.
- 단, "시그널/MACD"가 일반 지표추종 UI의 기본 문구로 고정되어 있다면 향후 다중지표 확장 시 어색해질 수 있다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_일반화_파일별_대상목록_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:26:50 | 분류: MASTER_SPEC]
조치:
- 지금 즉시 변경하지 않는다.
- 향후 UI 문구 체계 정리 시 다음 후보 검토:
 - "시그널/MACD" 유지: MACD 전용 필터일 때
 - "지표선/기준선" 변경: 공통 지표 비교 UI로 확장할 때

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_일반화_파일별_대상목록_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:26:50 | 분류: MASTER_SPEC]
--------------------------------------------------------------------------------
3-4. gui_indicator_follow_data_tabs.py
--------------------------------------------------------------------------------
사용처:
- macd_sell = signals.get("macd_sell", {})
- macd_sell_enabled
- macd_sell_delay
- self.macd_sell_enabled_check
- self.macd_sell_delay_line
- self.macd_sell_status_line
- 카드 출력 key "macd_sell"

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_일반화_파일별_대상목록_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:26:50 | 분류: MASTER_SPEC]
분류:
- 혼합
 - "macd_sell" rules key 접근: 유지
 - 위젯/변수명 macd_sell_*: 교체 후보

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_일반화_파일별_대상목록_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:26:50 | 분류: MASTER_SPEC]
판정:
- sell.signals.macd_sell은 기존 rules.json key이므로 유지해야 한다.
- 하지만 UI 위젯명까지 macd_sell_*로 계속 두면 지표추종 UI 내부가 MACD 전용처럼 굳어진다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_일반화_파일별_대상목록_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:26:50 | 분류: MASTER_SPEC]
권장 조치:
- 1차: rules key 접근은 그대로 둔다.
- 2차: 내부 변수/위젯명만 일반명으로 교체한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_일반화_파일별_대상목록_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:26:50 | 분류: MASTER_SPEC]
교체 후보:
- macd_sell_enabled_check -> primary_sell_signal_enabled_check 또는 sell_reversal_enabled_check
- macd_sell_delay_line -> primary_sell_signal_delay_line 또는 sell_reversal_delay_line
- macd_sell_status_line -> primary_sell_signal_status_line 또는 sell_reversal_status_line
- macd_sell_enabled -> primary_sell_signal_enabled
- macd_sell_delay -> primary_sell_signal_delay

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_일반화_파일별_대상목록_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:26:50 | 분류: MASTER_SPEC]
주의:
- 저장 key "macd_sell"은 변경 금지.
- 화면 표시 문자열이 "MACD 반전 매도"라면 실제 UI 정책 확정 후 별도 변경한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_일반화_파일별_대상목록_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:26:50 | 분류: MASTER_SPEC]
--------------------------------------------------------------------------------
3-5. gui_indicator_follow_routine_settings_dialog.py
--------------------------------------------------------------------------------
사용처:
- macd_sell = signals.get("macd_sell", {})
- macd_sell_enabled
- macd_sell_delay
- hasattr(self, "macd_sell_enabled_check")
- hasattr(self, "macd_sell_delay_line")
- hasattr(self, "macd_sell_status_line")
- 카드 출력 key "macd_sell"
- 상태 수집 prefix "macd_sell_"

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_일반화_파일별_대상목록_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:26:50 | 분류: MASTER_SPEC]
분류:
- 혼합
 - rules key "macd_sell": 유지
 - 내부 위젯/변수/prefix: 교체 후보

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_일반화_파일별_대상목록_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:26:50 | 분류: MASTER_SPEC]
판정:
- 이 파일은 설정창 중심 파일이므로 신규 코드 확산 가능성이 높다.
- 여기서 macd_sell_* 명칭을 계속 복제하면 향후 sell signal 일반화가 어려워진다.
권장 조치:
- 즉시 대규모 수정은 하지 않는다.
- 먼저 호환 wrapper 방식으로 정리한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_일반화_파일별_대상목록_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:26:50 | 분류: MASTER_SPEC]
예상 교체 방향:
- macd_sell 변수 -> existing_sell_signal_rule 또는 legacy_macd_sell_rule
- macd_sell_enabled -> primary_sell_signal_enabled
- macd_sell_delay -> primary_sell_signal_delay
- self.macd_sell_enabled_check -> self.primary_sell_signal_enabled_check
- self.macd_sell_delay_line -> self.primary_sell_signal_delay_line
- self.macd_sell_status_line -> self.primary_sell_signal_status_line

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_일반화_파일별_대상목록_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:26:50 | 분류: MASTER_SPEC]
호환 처리:
- 기존 self.macd_sell_* 속성을 참조하는 다른 파일이 있으면 alias로 일정 기간 유지 가능.
- 내부 수집 prefix "macd_sell_"는 indicator_follow_ui_state 구조와 연결되어 있으므로 즉시 변경하지 않는다.
- UI state key migration 설계 후 변경한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_일반화_파일별_대상목록_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:26:50 | 분류: MASTER_SPEC]
--------------------------------------------------------------------------------
3-6. gui_indicator_follow_sell_controls.py
--------------------------------------------------------------------------------
사용처:
- macd_kind_combo = make_combo(["MACD선", "시그널선"], ...)
- macd_sign_combo
- macd_value_line
- macd_compare_combo
- _sync_macd_sign_combo()
- sell_signal_condition_c_macd_check
- sell_signal_condition_c_macd_kind_combo
- sell_signal_condition_c_macd_sign_combo
- sell_signal_condition_c_macd_value_line
- sell_signal_condition_c_macd_compare_combo
- sell_signal_condition_c_macd_logic_combo
- QGroupBox("MACD 반전 매도")
- self.macd_sell_enabled_check
- self.macd_sell_delay_line
- self.macd_sell_status_line

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_일반화_파일별_대상목록_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:26:50 | 분류: MASTER_SPEC]
분류:
- 혼합
 - 표시 문자열 "MACD선", "시그널선", "MACD 반전 매도": 유지/검토
 - UI 내부 변수명 macd_*: 교체 후보
 - condition C macd key: 보류

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_일반화_파일별_대상목록_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:26:50 | 분류: MASTER_SPEC]
판정:
- Condition C가 실제 MACD선/시그널선 필터라면 표시 문자열은 유지 가능하다.
- 그러나 변수명과 위젯 속성명이 macd_*로 굳어져 있어 신규 확장 시 위험하다.
- 이 파일이 가장 먼저 일반화 후보가 될 가능성이 높다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_일반화_파일별_대상목록_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:26:50 | 분류: MASTER_SPEC]
권장 조치:
- 조건 C 내부 위젯명은 다음처럼 일반화한다.
 - macd_kind_combo -> indicator_line_kind_combo
 - macd_sign_combo -> indicator_line_sign_combo
 - macd_value_line -> indicator_line_value_line
 - macd_compare_combo -> indicator_line_compare_combo
 - _sync_macd_sign_combo -> _sync_indicator_line_sign_combo

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_일반화_파일별_대상목록_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:26:50 | 분류: MASTER_SPEC]
- 상태 위젯명은 다음처럼 일반화한다.
 - macd_sell_enabled_check -> primary_sell_signal_enabled_check
 - macd_sell_delay_line -> primary_sell_signal_delay_line
 - macd_sell_status_line -> primary_sell_signal_status_line

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_일반화_파일별_대상목록_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:26:50 | 분류: MASTER_SPEC]
보류:
- sell_signal_condition_c_macd_*는 indicator_follow_ui_state의 현재 저장 key와 연결되어 있으면 즉시 변경하지 않는다.
- UI state key migration 설계 후 변경한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_일반화_파일별_대상목록_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:26:50 | 분류: MASTER_SPEC]
--------------------------------------------------------------------------------
3-7. routines/지표추종매매/routine.py
--------------------------------------------------------------------------------
사용처:
- routine_macd_engine import
- DEFAULT_MACD_ROUTINE_CONFIG alias
- evaluate_macd_routine alias
- _ENGINE_SOURCE = "routine_macd_engine"
분류:
- 보류/호환 유지

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_일반화_파일별_대상목록_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:26:50 | 분류: MASTER_SPEC]
판정:
- 현재 이미 DEFAULT_INDICATOR_FOLLOW_CONFIG와 evaluate_indicator_follow_routine를 우선 사용하고, 기존 MACD 명칭은 alias로 유지하는 구조다.
- 이것은 현재 단계에서 가장 안전한 방식이다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_일반화_파일별_대상목록_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:26:50 | 분류: MASTER_SPEC]
조치:
- 즉시 변경하지 않는다.
- 신규 코드는 반드시 evaluate_indicator_follow_routine, DEFAULT_INDICATOR_FOLLOW_CONFIG만 사용한다.
- evaluate_macd_routine, DEFAULT_MACD_ROUTINE_CONFIG는 legacy compatibility alias로만 문서화한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_일반화_파일별_대상목록_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:26:50 | 분류: MASTER_SPEC]
장기 조치:
- routine_macd_engine.py 파일명 변경이 확정된 이후 import 경로를 변경한다.
- 그 전까지는 이 파일의 MACD import 경로를 건드리지 않는다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_일반화_파일별_대상목록_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:26:50 | 분류: MASTER_SPEC]
--------------------------------------------------------------------------------
3-8. routines/지표추종매매/routine_macd_engine.py
--------------------------------------------------------------------------------
사용처:
- 파일명 자체 routine_macd_engine.py
- docstring: MACD 전용 신호발생 엔진
- routine_type: MACD_OSC
- indicators.macd config
- DEFAULT_MACD_ROUTINE_CONFIG alias
- _macd_sell_section()
- sell.signals.macd_sell
- macd_enabled, macd_passed
- active_sell_names.append("macd_sell")
- signal_pass_map = {"macd_sell": ...}
- evaluate_macd_routine alias
분류:
- 대부분 유지/보류

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_일반화_파일별_대상목록_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:26:50 | 분류: MASTER_SPEC]
판정:
- 이 파일은 실제 MACD/OSC 신호 판정 엔진이므로 현재 MACD 명칭 유지가 타당하다.
- 다만 루틴명이 지표추종매매로 확장된 상황에서는 장기적으로 파일명/함수명 일반화 검토가 필요하다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_일반화_파일별_대상목록_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:26:50 | 분류: MASTER_SPEC]
즉시 유지:
- MACD/OSC 계산 관련 설명
- cfg["indicators"]["macd"]
- target "MACD"
- sell.signals.macd_sell rules key
- evaluate_macd_routine alias

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_일반화_파일별_대상목록_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:26:50 | 분류: MASTER_SPEC]
교체 후보:
- _macd_sell_section -> _primary_sell_signal_section 또는 _legacy_macd_sell_section
- macd_enabled -> primary_sell_signal_enabled 또는 macd_signal_enabled
- macd_passed -> primary_sell_signal_passed 또는 macd_signal_passed
권장:
- 지금은 변경하지 않는다.
- Rule Mapper 승인/저장/엔진 연결 이후에만 정리한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_일반화_파일별_대상목록_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:26:50 | 분류: MASTER_SPEC]
--------------------------------------------------------------------------------
3-9. routines/지표추종매매/routine_rule_mapper.py
--------------------------------------------------------------------------------
사용처:
- sell.signals.macd_sell
- sell.signals.ui_preview_condition_c_macd_sell
- _build_sell_macd_condition()
- condition_c.get("macd_check") 등 UI state macd_* key
- "MACD선" -> "MACD"
- warning 문구: sell condition C MACD ...
- description: UI preview: sell condition C MACD line threshold
- UI_PREVIEW_SELL_MACD_CONDITION_C
분류:
- 핵심 교체 후보

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_일반화_파일별_대상목록_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:26:50 | 분류: MASTER_SPEC]
판정:
- 이 파일은 앞으로 UI state를 engine rules로 연결하는 중간 계층이다.
- 여기에 MACD 전용 후보명이 계속 남으면, 향후 RSI/볼린저/이평 등 지표 확장 시 mapper가 MACD 중심으로 굳어진다.
- 단, 기존 rules key sell.signals.macd_sell은 변경하지 않는다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_일반화_파일별_대상목록_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:26:50 | 분류: MASTER_SPEC]
즉시 유지:
- existing path: sell.signals.macd_sell
- target "MACD"
- UI state의 기존 macd_* key 접근

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_일반화_파일별_대상목록_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:26:50 | 분류: MASTER_SPEC]
교체 후보:
- _build_sell_macd_condition -> _build_sell_indicator_line_condition
- sell_macd_condition -> sell_indicator_line_condition
- UI_PREVIEW_SELL_MACD_CONDITION_C -> UI_PREVIEW_SELL_INDICATOR_LINE_CONDITION_C
- ui_preview_condition_c_macd_sell -> ui_preview_condition_c_indicator_line_sell 또는 ui_preview_condition_c_sell_indicator_line
- warning 문구의 "MACD"는 실제 target이 MACD일 때만 사용하고, 함수/후보명에서는 제거

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_일반화_파일별_대상목록_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:26:50 | 분류: MASTER_SPEC]
중요:
- preview candidate path를 변경하면 테스트와 GUI 표시가 함께 바뀐다.
- 따라서 변경 전 테스트 갱신 계획이 필요하다.
- 지금 바로 코드 수정하지 말고, 먼저 preview path 명명 규칙을 확정해야 한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_일반화_파일별_대상목록_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:26:50 | 분류: MASTER_SPEC]
--------------------------------------------------------------------------------
3-10. routines/지표추종매매/rules.json
--------------------------------------------------------------------------------
사용처:
- indicators.macd
- description: MACD 오실레이터...
- sell.note: MACD SELL과 수익률 SELL...
- sell.signals.macd_sell
- name: 매도조건_MACD_OSC_TURN_DOWN
- indicator_follow_ui_state 내부 condition C macd_* keys
분류:
- 변경 금지

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_일반화_파일별_대상목록_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:26:50 | 분류: MASTER_SPEC]
장기 절차:
1. 새 key 병행 저장
2. 기존 key fallback 유지
3. migration 테스트
4. 실제 변환
5. legacy key 제거 여부 검토

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_일반화_파일별_대상목록_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:26:50 | 분류: MASTER_SPEC]
--------------------------------------------------------------------------------
3-11. tests/test_indicator_follow_rule_mapper_preview.py
--------------------------------------------------------------------------------
사용처:
- UI state macd_* key
- current_rules sell.signals.macd_sell
- indicators.macd
- test name: test_sell_add_signal_candidate_does_not_replace_macd_sell
- expected path: sell.signals.ui_preview_condition_c_macd_sell
- expected target: MACD
분류:
- 보류/추후 갱신

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_일반화_파일별_대상목록_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:26:50 | 분류: MASTER_SPEC]
판정:
- 현재 테스트는 기존 Rule Mapper Preview/Diff의 호환성 검증 역할을 한다.
- macd_sell을 교체하지 않는다는 테스트는 현재 구조에서 중요하다.
- 따라서 지금 변경하면 안 된다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_일반화_파일별_대상목록_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:26:50 | 분류: MASTER_SPEC]
조치:
- Rule Mapper path 명명 규칙을 바꿀 때 테스트도 함께 갱신한다.
- target "MACD" 검증은 유지한다.
- 기존 macd_sell을 replace하지 않는 검증은 계속 유지한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_일반화_파일별_대상목록_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:26:50 | 분류: MASTER_SPEC]
--------------------------------------------------------------------------------
3-12. gui_routine_condition_engine.py
--------------------------------------------------------------------------------
사용처:
- 예시/설명: {"target":"MACD", "operator":"CROSS_UP", "compare_target":"SIGNAL"}
분류:
- 유지
판정:
- 조건 엔진 예시에서 MACD는 실제 지표 target이다.
- 변경 대상이 아니다.
조치:
- 수정 불필요.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_일반화_파일별_대상목록_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:26:50 | 분류: MASTER_SPEC]
--------------------------------------------------------------------------------
3-13. routines/지표추종매매/routine_condition_engine.py
--------------------------------------------------------------------------------
사용처:
- 예시/설명: {"target":"MACD", "operator":"CROSS_UP", "compare_target":"SIGNAL"}
분류:
- 유지
판정:
- 실제 지표 target 예시다.
- 변경 대상이 아니다.
조치:
- 수정 불필요.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_일반화_파일별_대상목록_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:26:50 | 분류: MASTER_SPEC]
--------------------------------------------------------------------------------
3-14. tools/cleanup_project_junk_v3.py
--------------------------------------------------------------------------------
사용처:
- 제거/정리 대상 문자열: gui_macd_routine_settings_dialog.py, macd_signal_engine.py, routine_macd_engine.py
분류:
- 무시/보류

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_일반화_파일별_대상목록_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:26:50 | 분류: MASTER_SPEC]
판정:
- cleanup 도구 내부의 과거 파일명 문자열이다.
- 실제 실행 흐름의 신규 MACD 확산과 직접 관련 없다.
- 다만 정리 도구가 현재 구조와 맞지 않을 수 있으므로 나중에 tools 정리 때 재검토한다.
조치:
- 지금 수정하지 않는다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_일반화_파일별_대상목록_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:26:50 | 분류: MASTER_SPEC]
--------------------------------------------------------------------------------
3-15. tools/create_routine_packages_from_legacy.py
--------------------------------------------------------------------------------
사용처:
- module_name: macd_routine
- description: MACD 기반 자동매매 루틴 패키지...
분류:
- 보류/레거시 도구

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_일반화_파일별_대상목록_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:26:50 | 분류: MASTER_SPEC]
판정:
- legacy package 생성 도구 성격이다.
- 현재 자동인식 루틴 패키지 방향과 다를 수 있으므로 즉시 사용 여부부터 확인해야 한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_일반화_파일별_대상목록_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:26:50 | 분류: MASTER_SPEC]
조치:
- 실행 중인 핵심 흐름이 아니면 당장 수정하지 않는다.
- tools 정리 단계에서 폐기/보존/갱신 판단.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_일반화_파일별_대상목록_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:26:50 | 분류: MASTER_SPEC]
--------------------------------------------------------------------------------
3-16. reports/blocked_actions/*, PROJECT_CHANGELOG.txt
--------------------------------------------------------------------------------
사용처:
- 다수의 MACD 기록 문자열
분류:
- 무시

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_일반화_파일별_대상목록_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:26:50 | 분류: MASTER_SPEC]
판정:
- 과거 작업 기록, blocked action report, changelog 성격이다.
- 실행 코드 일반화 대상이 아니다.
- 문서 이력에서 MACD가 많이 나오는 것은 문제가 아니다.
조치:
- 수정 금지.
- 검색 결과를 볼 때 이 파일들은 제외하고 판단한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_일반화_파일별_대상목록_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:26:50 | 분류: MASTER_SPEC]
================================================================================
4. 우선순위별 작업 후보
================================================================================

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_일반화_파일별_대상목록_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:26:50 | 분류: MASTER_SPEC]
[우선순위 1: 신규 확산 차단]
- 신규 파일명에 macd 사용 금지.
- 신규 함수명에 macd 사용 금지.
- 신규 변수명에 macd 사용 금지.
- 단, 실제 지표명/target/key는 예외.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_일반화_파일별_대상목록_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:26:50 | 분류: MASTER_SPEC]
[우선순위 2: Rule Mapper 명칭 정리 설계]
대상:
- routines/지표추종매매/routine_rule_mapper.py

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_일반화_파일별_대상목록_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:26:50 | 분류: MASTER_SPEC]
변경 후보:
- _build_sell_macd_condition -> _build_sell_indicator_line_condition
- sell.signals.ui_preview_condition_c_macd_sell -> sell.signals.ui_preview_condition_c_indicator_line_sell
- UI_PREVIEW_SELL_MACD_CONDITION_C -> UI_PREVIEW_SELL_INDICATOR_LINE_CONDITION_C

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_일반화_파일별_대상목록_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:26:50 | 분류: MASTER_SPEC]
[우선순위 3: UI 내부 위젯명 일반화]
대상:
- gui_indicator_follow_sell_controls.py
- gui_indicator_follow_data_tabs.py
- gui_indicator_follow_routine_settings_dialog.py

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_일반화_파일별_대상목록_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:26:50 | 분류: MASTER_SPEC]
변경 후보:
- macd_sell_enabled_check -> primary_sell_signal_enabled_check
- macd_sell_delay_line -> primary_sell_signal_delay_line
- macd_sell_status_line -> primary_sell_signal_status_line
- macd_kind_combo -> indicator_line_kind_combo
- macd_sign_combo -> indicator_line_sign_combo
- macd_value_line -> indicator_line_value_line
- macd_compare_combo -> indicator_line_compare_combo

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_일반화_파일별_대상목록_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:26:50 | 분류: MASTER_SPEC]
주의:
- self 속성명 변경은 다른 파일 참조와 연결되므로 grep 후 단계적으로 변경한다.
- 기존 속성 alias를 잠시 유지하는 방식도 가능하다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_일반화_파일별_대상목록_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:26:50 | 분류: MASTER_SPEC]
[우선순위 4: routine.py alias 정책 문서화]
대상:
- routines/지표추종매매/routine.py

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_일반화_파일별_대상목록_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:26:50 | 분류: MASTER_SPEC]
조치:
- DEFAULT_INDICATOR_FOLLOW_CONFIG / evaluate_indicator_follow_routine 우선.
- DEFAULT_MACD_ROUTINE_CONFIG / evaluate_macd_routine는 legacy alias로만 유지.
- 신규 import에서 MACD alias 사용 금지.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_일반화_파일별_대상목록_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:26:50 | 분류: MASTER_SPEC]
[우선순위 5: 엔진 파일명 변경 검토]
대상:
- routines/지표추종매매/routine_macd_engine.py
조치:
- 가장 마지막에 검토.
- 엔진 연결 안정화 전 변경 금지.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_일반화_파일별_대상목록_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:26:50 | 분류: MASTER_SPEC]
================================================================================
5. 절대 변경 금지 목록
================================================================================
다음은 현재 단계에서 변경 금지다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_일반화_파일별_대상목록_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:26:50 | 분류: MASTER_SPEC]
- rules.json의 indicators.macd
- rules.json의 sell.signals.macd_sell
- rules.json의 indicator_follow_ui_state 내부 macd_* key
- target: MACD
- target: OSC
- MACD선 / 시그널선 UI 표시 문자열 중 실제 지표명인 부분
- engines/indicator_engine.py의 macd_series
- routine_macd_engine.py의 MACD/OSC 계산 및 판정 설명
- 기존 테스트가 검증하는 macd_sell 미대체 정책

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_일반화_파일별_대상목록_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:26:50 | 분류: MASTER_SPEC]
================================================================================
6. 다음 실제 작업 제안
================================================================================
가장 안전한 다음 실제 작업은 코드 수정이 아니라 아래 설계 확정이다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_일반화_파일별_대상목록_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:26:50 | 분류: MASTER_SPEC]
1. Rule Mapper preview candidate path 명칭 확정
 - 현재: sell.signals.ui_preview_condition_c_macd_sell
 - 후보: sell.signals.ui_preview_condition_c_indicator_line_sell
 - 또는: sell.signals.ui_preview_condition_c_sell_indicator_line

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_일반화_파일별_대상목록_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:26:50 | 분류: MASTER_SPEC]
2. Rule Mapper 내부 함수명 확정
 - 현재: _build_sell_macd_condition
 - 후보: _build_sell_indicator_line_condition

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_일반화_파일별_대상목록_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:26:50 | 분류: MASTER_SPEC]
3. UI 내부 위젯명 일반화 범위 확정
 - macd_sell_* 위젯명 교체 여부
 - condition_c_macd_* 저장 key 유지 여부
4. 테스트 갱신 범위 확정
 - path 기대값 변경 여부
 - macd_sell 미대체 테스트는 유지

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_일반화_파일별_대상목록_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:26:50 | 분류: MASTER_SPEC]
================================================================================
7. 현재 최종 판정
================================================================================
현재 MACD 명칭 문제는 "위험하지만 통제 가능한 상태"다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_일반화_파일별_대상목록_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:26:50 | 분류: MASTER_SPEC]
위험한 이유:
- Rule Mapper와 UI 내부 변수명에 MACD가 남아 있어 신규 확장 시 계속 복제될 가능성이 있다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_일반화_파일별_대상목록_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:26:50 | 분류: MASTER_SPEC]
통제 가능한 이유:
- 실제 파일명 macd 잔존은 routine_macd_engine.py 1개뿐이다.
- GUI 파일명은 이미 indicator_follow 계열로 정리되어 있다.
- 호출 구조는 일반명 우선 + MACD alias 유지 방식으로 정리되어 있다.
- rules.json과 엔진 key는 변경 금지 대상으로 분리 가능하다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_일반화_파일별_대상목록_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:26:50 | 분류: MASTER_SPEC]
따라서 다음 단계는 "전체 치환"이 아니라 "Rule Mapper와 UI 내부 명칭의 제한적 일반화"가 맞다.
[문서 끝]

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:22:12 | 분류: MASTER_SPEC]
MACD 명칭 사용처 전수조사 및 일반화 기준
작성일: 2026-07-02
대상: 키움 자동매매 프로젝트 / 지표추종매매 루틴
목적: 향후 프로젝트 확장 시 MACD 명칭이 불필요하게 확산되는 것을 방지하고, 변경 금지 대상과 일반화 대상을 명확히 구분한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:22:12 | 분류: MASTER_SPEC]
================================================================================
1. 현재 판정
================================================================================
현재 MACD 용어 문제는 완전 해결 상태가 아니다.
다만 1차 일반화는 완료된 상태다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:22:12 | 분류: MASTER_SPEC]
완료된 부분:
- DEFAULT_INDICATOR_FOLLOW_CONFIG 추가
- evaluate_indicator_follow_routine() 추가
- routine.py에서 일반명 우선 사용
- DEFAULT_MACD_ROUTINE_CONFIG는 호환 alias로 유지
- evaluate_macd_routine()은 호환 alias로 유지

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:22:12 | 분류: MASTER_SPEC]
미완료/잔존 부분:
- routine_macd_engine.py 파일명 유지
- sell.signals.macd_sell 유지
- rules.json 내부 macd 관련 key 유지
- indicator_follow_ui_state 내부 일부 macd_* key 유지
- UI/Mapper 내부 변수명·후보명 일부 macd 명칭 유지
- 테스트 코드 일부 macd 명칭 유지

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:22:12 | 분류: MASTER_SPEC]
현재 결론:
- 기존 호환성 때문에 MACD 명칭을 즉시 전부 제거하면 위험하다.
- 하지만 신규 코드에서 MACD 명칭을 계속 사용하면 나중에 일반화 범위가 폭증한다.
- 따라서 즉시 전체 치환이 아니라, 신규 확산 차단 + 점진적 일반화가 공식 방향이다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:22:12 | 분류: MASTER_SPEC]
================================================================================
2. MACD 명칭 사용처 분류
================================================================================

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:22:12 | 분류: MASTER_SPEC]
--------------------------------------------------------------------------------
2.1 유지 대상: 실제 지표/엔진 의미가 있는 MACD
--------------------------------------------------------------------------------
아래 항목은 MACD 지표 자체를 의미하므로 변경하지 않는다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:22:12 | 분류: MASTER_SPEC]
유지 대상:
- MACD선
- 시그널선
- OSC
- target: MACD
- target: OSC
- indicators.macd
- macd_series()
- MACD/OSC 계산 로직
- MACD/OSC 신호 판정 로직
- routine_macd_engine.py 내부 실제 MACD 계산부

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:22:12 | 분류: MASTER_SPEC]
유지 사유:
- MACD는 루틴 일반명이 아니라 기술적 지표명이다.
- 지표명까지 일반화하면 오히려 의미가 불명확해진다.
- OSC 역시 MACD 기반 오실레이터 개념으로 현재 루틴 로직 핵심이다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:22:12 | 분류: MASTER_SPEC]
금지 사항:
- MACD선/시그널선/OSC 표시명을 임의로 indicator 등으로 바꾸지 않는다.
- rules.json 내부 target 값의 MACD/OSC를 검증 없이 변경하지 않는다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:22:12 | 분류: MASTER_SPEC]
호환 유지 대상:
- DEFAULT_MACD_ROUTINE_CONFIG
- evaluate_macd_routine()
- sell.signals.macd_sell
- rules.json의 macd 관련 key
- indicator_follow_ui_state 내부 기존 macd_* key
- 기존 테스트가 참조하는 macd_* key

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:22:12 | 분류: MASTER_SPEC]
운영 원칙:
- 기존 동작 보존을 위해 alias는 유지한다.
- 새 코드에서는 DEFAULT_INDICATOR_FOLLOW_CONFIG를 사용한다.
- 새 코드에서는 evaluate_indicator_follow_routine()을 사용한다.
- sell.signals.macd_sell은 기존 실행 Rule 보호를 위해 변경하지 않는다.
- rules.json key migration은 장기 과제로 미룬다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:22:12 | 분류: MASTER_SPEC]
--------------------------------------------------------------------------------
2.3 교체 후보: 일반화가 필요한 MACD 명칭
--------------------------------------------------------------------------------

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:22:12 | 분류: MASTER_SPEC]
아래 항목들은 실제 지표명이라기보다 UI/Mapper/후보명/변수명에 MACD가 남아 있는 경우다.
향후 확장 전 점진적으로 일반명으로 교체해야 한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:22:12 | 분류: MASTER_SPEC]
교체 후보 예시:
- macd_sell_enabled_check
- macd_sell_delay_line
- macd_kind_combo
- sell_signal_condition_c_macd_*
- _build_sell_macd_condition
- UI_PREVIEW_SELL_MACD_CONDITION_C
- ui_preview_condition_c_macd_sell

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:22:12 | 분류: MASTER_SPEC]
교체 방향 예시:
- macd_sell_enabled_check
 → indicator_sell_enabled_check 또는 condition_c_sell_enabled_check

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:22:12 | 분류: MASTER_SPEC]
- macd_sell_delay_line
 → sell_delay_line 또는 condition_c_sell_delay_line

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:22:12 | 분류: MASTER_SPEC]
- macd_kind_combo
 → indicator_kind_combo 또는 signal_indicator_kind_combo

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:22:12 | 분류: MASTER_SPEC]
- sell_signal_condition_c_macd_*
 → sell_signal_condition_c_indicator_* 또는 sell_signal_condition_c_osc_*

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:22:12 | 분류: MASTER_SPEC]
- _build_sell_macd_condition
 → _build_sell_indicator_condition 또는 _build_sell_condition_c_candidate

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:22:12 | 분류: MASTER_SPEC]
- UI_PREVIEW_SELL_MACD_CONDITION_C
 → UI_PREVIEW_SELL_CONDITION_C

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:22:12 | 분류: MASTER_SPEC]
- ui_preview_condition_c_macd_sell
 → ui_preview_condition_c_sell

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:22:12 | 분류: MASTER_SPEC]
--------------------------------------------------------------------------------
2.4 무시 가능 대상: 기록/로그/문서성 잔존
--------------------------------------------------------------------------------
아래 항목은 실행 구조가 아니라 기록이므로 당장 변경 대상이 아니다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:22:12 | 분류: MASTER_SPEC]
무시 가능:
- PROJECT_CHANGELOG.txt
- reports/blocked_actions/*
- 과거 작업 리포트
- 과거 오류 로그
- cleanup tool 내부 문자열
- 백업/이전 단계 문서

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:22:12 | 분류: MASTER_SPEC]
원칙:
- 기록 문서는 당시 상황 보존이 우선이다.
- 과거 문서의 MACD 명칭까지 정리하려 하면 작업 범위가 불필요하게 커진다.
- 단, 최신 MASTER_SPEC 갱신자료에는 일반화 기준을 반영한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:22:12 | 분류: MASTER_SPEC]
================================================================================
3. 신규 개발 명명 규칙
================================================================================

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:22:12 | 분류: MASTER_SPEC]
--------------------------------------------------------------------------------
3.1 신규 코드에서 금지할 명칭
--------------------------------------------------------------------------------
앞으로 새로 작성하는 코드에서는 아래 명칭을 사용하지 않는다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:22:12 | 분류: MASTER_SPEC]
금지:
- 새로운 gui_macd_*.py
- 새로운 routine_macd_*.py
- 새로운 test_macd_*.py
- 새로운 macd_* 함수명
- 새로운 macd_* 변수명
- 새로운 DEFAULT_MACD_* 상수
- 새로운 evaluate_macd_* 함수
- 새로운 *_macd_sell 후보명

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:22:12 | 분류: MASTER_SPEC]
--------------------------------------------------------------------------------
3.2 신규 코드에서 사용할 일반명
--------------------------------------------------------------------------------

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:22:12 | 분류: MASTER_SPEC]
신규 코드 기본 명칭:
- indicator_follow
- indicator_signal
- signal_condition
- condition_c
- osc
- rule_mapper
- preview_candidate
- engine_rules_preview

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:22:12 | 분류: MASTER_SPEC]
사용 권장:
- DEFAULT_INDICATOR_FOLLOW_CONFIG
- evaluate_indicator_follow_routine()
- indicator_follow_ui_state
- indicator_follow_rule_preview
- routine_rule_mapper.py
- build_engine_rules_preview_from_ui_state()
- compare_engine_rules_preview()

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:22:12 | 분류: MASTER_SPEC]
--------------------------------------------------------------------------------
3.3 파일명 기준
--------------------------------------------------------------------------------
현재 유지:
- routines/지표추종매매/routine_macd_engine.py

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:22:12 | 분류: MASTER_SPEC]
유지 사유:
- 실제 MACD/OSC 계산 엔진이다.
- 파일명 변경 시 import, 테스트, 문서, rules 연계가 동시에 흔들릴 수 있다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:22:12 | 분류: MASTER_SPEC]
향후 방향:
- 엔진 연결 안정화 후 파일명 변경 검토
- 변경 후보:
 - routine_macd_engine.py → routine_indicator_engine.py
 - 단, MACD 전용 계산 파일로 남길 경우 유지 가능

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:22:12 | 분류: MASTER_SPEC]
신규 파일명 원칙:
- gui_indicator_follow_*.py 사용
- routine_indicator_follow_*.py 사용
- test_indicator_follow_*.py 사용

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:22:12 | 분류: MASTER_SPEC]
--------------------------------------------------------------------------------
4.2 Rule Mapper 현재 정책
--------------------------------------------------------------------------------

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:22:12 | 분류: MASTER_SPEC]
현재 구조:
UI → indicator_follow_ui_state → Rule Mapper Preview → Rule Mapper Diff → 운영자 검토 → 향후 승인 저장
현재 구현 범위:
- Preview 생성
- Diff 생성
- Merge/Add Candidate 생성

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:22:12 | 분류: MASTER_SPEC]
Sell Preview:
- 기존 sell.signals.macd_sell 유지
- 별도 후보 생성
- 후보는 enabled=false, preview_candidate=true

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:22:12 | 분류: MASTER_SPEC]
--------------------------------------------------------------------------------
4.3 Rule Mapper 명칭 교체 우선순위
--------------------------------------------------------------------------------
1순위:
- Python 내부 함수명/상수명에서 불필요한 macd 제거
2순위:
- Preview candidate 이름에서 macd 제거
3순위:
- GUI 내부 변수명에서 macd 제거
4순위:
- 테스트 명칭 일반화
마지막:
- rules.json key migration
- sell.signals.macd_sell 변경

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:22:12 | 분류: MASTER_SPEC]
================================================================================
5. 작업 순서 제안
================================================================================

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:22:12 | 분류: MASTER_SPEC]
--------------------------------------------------------------------------------
5.1 즉시 작업
--------------------------------------------------------------------------------

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:22:12 | 분류: MASTER_SPEC]
1. MACD 명칭 유지/교체/금지 기준 문서화
2. 신규 코드 작성 시 indicator_follow 명칭만 사용
3. Rule Mapper 내부 후보명부터 일반화
4. UI 내부 변수명 중 실제 지표명이 아닌 macd_*만 점진 교체
5. 중복 정의된 build_engine_rules_preview_from_current_ui_state() 정리

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:22:12 | 분류: MASTER_SPEC]
--------------------------------------------------------------------------------
5.2 단기 작업
--------------------------------------------------------------------------------

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:22:12 | 분류: MASTER_SPEC]
--------------------------------------------------------------------------------
5.3 중기 작업
--------------------------------------------------------------------------------

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:22:12 | 분류: MASTER_SPEC]
1. Engine Rule 생성 함수 구현
2. 운영자 승인 후에만 rules.json 갱신
3. 매수 OCR threshold merge 적용
4. SELL 후보는 기존 macd_sell과 분리 유지
5. 테스트 확장

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:22:12 | 분류: MASTER_SPEC]
--------------------------------------------------------------------------------
5.4 장기 작업
--------------------------------------------------------------------------------

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:22:12 | 분류: MASTER_SPEC]
================================================================================
7. 결론
================================================================================
현재 MACD 명칭 문제는 다음과 같이 관리한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:22:12 | 분류: MASTER_SPEC]
A안: 코드 수정 없이 Preview/Diff 화면 검증
B안: 동작 변경 없이 UI/Mapper 내부 macd 명칭 일부 일반화

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:22:12 | 분류: MASTER_SPEC]
권장 순서:
1. 중복 함수 정리
2. Rule Mapper 내부 후보명 일반화
3. Preview/Diff 재검증
4. 승인 절차 설계
5. Engine Rule 생성 설계
[문서 끝]

[출처: 작업재개참조문서_RuleMapper_MACD_정리_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:08:06 | 분류: 작업재개요약]
변경 후 UI -> indicator_follow_ui_state -> Rule Mapper Preview -> Rule
Mapper Diff -> 운영자 검토 -> (향후) 실제 Rule 생성
현재는 Preview/Diff까지만 구현되었으며 실제 저장 및 엔진 연결은 수행하지
않는다.
2. 완료 항목

[출처: 작업재개참조문서_RuleMapper_MACD_정리_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:08:06 | 분류: 작업재개요약]
Buy - merge_into = buy.groups[0].conditions - skip_existing - OSC
TURN_UP - add_conditions - OSC <= UI OCR 값

[출처: 작업재개참조문서_RuleMapper_MACD_정리_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:08:06 | 분류: 작업재개요약]
Sell - 기존 sell.signals.macd_sell 유지 -
ui_preview_condition_c_macd_sell 별도 후보 - enabled = false -
preview_candidate = true
4. Diff 구조

[출처: 작업재개참조문서_RuleMapper_MACD_정리_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:08:06 | 분류: 작업재개요약]
status - changed - same - added - missing - merge_candidate -
add_signal_candidate
risk - low - medium - high

[출처: 작업재개참조문서_RuleMapper_MACD_정리_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:08:06 | 분류: 작업재개요약]
현재 확인 - bar.bar_minutes -> changed(low) - buy.groups[0].conditions
-> merge_candidate - sell.signals.ui_preview_condition_c_macd_sell ->
add_signal_candidate - sell.signals.macd_sell 변경 없음
5. 구현 원칙

[출처: 작업재개참조문서_RuleMapper_MACD_정리_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:08:06 | 분류: 작업재개요약]
Rule Mapper Preview - mapped_paths - warnings - preview_rules -
indicator_follow_rule_preview - merge_add_candidate 표시
Rule Mapper Diff - summary - changes - warnings - 위험도 표시
7. MACD 명칭 정리 결과

[출처: 작업재개참조문서_RuleMapper_MACD_정리_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:08:06 | 분류: 작업재개요약]
완료 - DEFAULT_INDICATOR_FOLLOW_CONFIG 추가 -
evaluate_indicator_follow_routine 추가 - 기존
DEFAULT_MACD_ROUTINE_CONFIG는 alias - 기존 evaluate_macd_routine는
alias - routine.py는 새 일반명 우선 사용

[출처: 작업재개참조문서_RuleMapper_MACD_정리_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:08:06 | 분류: 작업재개요약]
호환 유지 - routine_macd_engine.py 파일명 -
DEFAULT_MACD_ROUTINE_CONFIG - evaluate_macd_routine
8. 변경 금지

[출처: 작업재개참조문서_RuleMapper_MACD_정리_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:08:06 | 분류: 작업재개요약]
- rules.json의 macd 관련 key
- sell.signals.macd_sell
- indicator_follow_ui_state의 macd_* key
- target: MACD
- target: OSC
- MACD선/시그널선
- MACD/OSC 계산
- 기존 테스트 참조 key
9. 향후 작업

[출처: 마스터스펙\MASTER_SPEC_갱신자료_2026-07-02\MASTER_SPEC_갱신자료_RuleMapper_MergeCandidate_MACD_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:07:50 | 분류: 갱신문서]
UI → indicator_follow_ui_state → Rule Mapper → Rule Preview → Rule Diff
→ 운영자 검토 → (향후 승인) → Engine Rule 생성
현재 구현 범위는 Preview/Diff까지이며 실제 Rule 저장 및 엔진 연결은
구현하지 않는다.
3. Rule Mapper
신규 구성요소
routine_rule_mapper.py
주요 함수

[출처: 마스터스펙\MASTER_SPEC_갱신자료_2026-07-02\MASTER_SPEC_갱신자료_RuleMapper_MergeCandidate_MACD_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:07:50 | 분류: 갱신문서]
- build_engine_rules_preview_from_ui_state()
- compare_engine_rules_preview()
역할

[출처: 마스터스펙\MASTER_SPEC_갱신자료_2026-07-02\MASTER_SPEC_갱신자료_RuleMapper_MergeCandidate_MACD_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:07:50 | 분류: 갱신문서]
- UI State를 Preview 후보로 변환
- 기존 Rule과 Preview 차이 비교
- 저장하지 않음
- 실행하지 않음
4. Preview 정책
Replace Preview 폐기.
공식 정책
Merge/Add Candidate
신규 Namespace
indicator_follow_rule_preview
mode
merge_add_candidate
Buy

[출처: 마스터스펙\MASTER_SPEC_갱신자료_2026-07-02\MASTER_SPEC_갱신자료_RuleMapper_MergeCandidate_MACD_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:07:50 | 분류: 갱신문서]
- same
- changed
- added
- missing
- merge_candidate
- add_signal_candidate
위험도
- low
- medium
- high
현재 기준
bar.bar_minutes → changed
buy.groups[0].conditions → merge_candidate

[출처: 마스터스펙\MASTER_SPEC_갱신자료_2026-07-02\MASTER_SPEC_갱신자료_RuleMapper_MergeCandidate_MACD_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:07:50 | 분류: 갱신문서]
sell.signals.ui_preview_condition_c_macd_sell → add_signal_candidate
sell.signals.macd_sell → 변경 대상 아님
6. GUI 정책
설정 검증 화면은 다음 정보를 표시한다.
Rule Mapper Preview

[출처: 마스터스펙\MASTER_SPEC_갱신자료_2026-07-02\MASTER_SPEC_갱신자료_RuleMapper_MergeCandidate_MACD_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:07:50 | 분류: 갱신문서]
- mapped_paths
- warnings
- preview_rules
- indicator_follow_rule_preview
- merge_add_candidate
Rule Mapper Diff

[출처: 마스터스펙\MASTER_SPEC_갱신자료_2026-07-02\MASTER_SPEC_갱신자료_RuleMapper_MergeCandidate_MACD_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:07:50 | 분류: 갱신문서]
- summary
- changes
- warnings
- risk
- current_value
- preview_value
7. 구현 금지

[출처: 마스터스펙\MASTER_SPEC_갱신자료_2026-07-02\MASTER_SPEC_갱신자료_RuleMapper_MergeCandidate_MACD_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:07:50 | 분류: 갱신문서]
- DEFAULT_INDICATOR_FOLLOW_CONFIG
- evaluate_indicator_follow_routine()
호환 Alias 유지
- DEFAULT_MACD_ROUTINE_CONFIG
- evaluate_macd_routine()
routine.py는 일반명을 우선 사용한다.
9. 변경 금지

[출처: 마스터스펙\MASTER_SPEC_갱신자료_2026-07-02\MASTER_SPEC_갱신자료_RuleMapper_MergeCandidate_MACD_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:07:50 | 분류: 갱신문서]
- routine_macd_engine.py 파일명
- rules.json macd 관련 key
- sell.signals.macd_sell
- indicator_follow_ui_state macd_* key
- target: MACD
- target: OSC
- MACD선/시그널선
- 기존 테스트 참조 key
10. 검증 결과

[출처: 마스터스펙\MASTER_SPEC_갱신자료_2026-07-02\MASTER_SPEC_갱신자료_RuleMapper_MergeCandidate_MACD_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:07:50 | 분류: 갱신문서]
1. Preview 기반 실제 Rule 생성 설계
2. 승인 절차 설계
3. Engine 연결
4. Alias 안정화
5. routine_macd_engine.py 파일명 변경 검토
6. rules key migration 장기 검토

[출처: 작업재개요약_및_MASTER_SPEC_갱신자료_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 13:57:47 | 분류: 작업재개요약]
- 지표추종매매 설정 UI 프로토타입 완료
- UI 상태 수집(collect), 복원(apply), 저장(save), 로드(load) 완료
- UI 상태는 indicator_follow_ui_state에 저장
- 엔진 Rule과 UI 상태 완전 분리
- UI→Engine Rule 변환은 미구현
주요 완료 사항

[출처: 작업재개요약_및_MASTER_SPEC_갱신자료_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 13:57:47 | 분류: 작업재개요약]
1. gui_macd/gui_indicator_follow 구조 전환 완료
2. 중복 파일, pycache, pyc, bak 정리
3. tools 폴더 구성 완료
4. 숨은 탭 제거, 단일 화면 구조 확정
5. Collector 완료
 - basic
 - buy_ui(signal_filter/base/repeat/price_compare/situation/additional/cycle/exit)
 - sell_ui(signal_conditions/selected_sets/setting_a/b/c)
6. apply_indicator_follow_ui_state() 구현 완료
7. save_indicator_follow_ui_state_to_rules() 구현 완료
8. JSON Roundtrip 및 저장/재열기 검증 완료
Rules 저장 정책
신규 namespace

[출처: 작업재개요약_및_MASTER_SPEC_갱신자료_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 13:57:47 | 분류: 작업재개요약]
indicator_follow_ui_state - ui_state_version - updated_at - state

[출처: 마스터스펙\MASTER_SPEC_갱신자료_2026-07-02\MASTER_SPEC_갱신자료_상세판_UI프로토타입.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 06:40:32 | 분류: 갱신문서]
- gui_macd_control_tab.py : 3열 외곽 배치 담당.
- gui_macd_buy_method_controls.py :
 기본매수/반복매수/상황변화/추가기능 UI 생성 담당.
- gui_macd_buy_controls.py : 순환설정, 이탈조건, 회차마감 생성 및
 상태제어 담당.
보류 항목

[출처: 마스터스펙\MASTER_SPEC_갱신자료_2026-07-02\MASTER_SPEC_갱신자료_상세판_UI프로토타입.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 06:40:32 | 분류: 갱신문서]
- _make_buy_avg_overview_controls() 생성 흐름 분리.
- gui_macd_* 파일명 공통 루틴 명칭으로 변경.
- 숨겨진 cycle 위젯 생성 구조 개선.
- wrapper 및 레이아웃 정크 코드 최종 정리.
설계 원칙

[출처: 마스터스펙\MASTER_SPEC_갱신자료_2026-07-02\MASTER_SPEC_갱신자료_상세판_UI프로토타입.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 06:40:32 | 분류: 갱신문서]
- 루틴 UI와 엔진은 분리 유지.
- UI는 공통 루틴 기반으로 일반화 예정.
- 실제 MACD 고유 로직은 엔진과 루틴 모듈에만 존재하도록 정리 예정.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
================================================================================
파일:
MASTER_SPEC_┤⌐╢⌠║╕░¡86╚≈╜║┼Σ╕«▒Γ╣▌PLAN╝│░Φ║»░µ░ⁿ╕«╛╞┼░┼╪├│└»┴÷┐°─ó.txt
================================================================================
MASTER_SPEC 누락보강 86 주제 : 히스토리 기반 PLAN 설계 변경 관리 및
아키텍처 유지 원칙
출처 : 작업진행상황대화히스토리_3~8 비교 반영

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
5. 변경 절차 ① 변경 요구 확인 ② 기존 구조 영향 분석 ③ 공통 구조 유지
 여부 검토 ④ 구현 ⑤ 상태·로그 검증 ⑥ MASTER_SPEC 갱신
6. 구현 원칙

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- 기존 루틴과의 호환성을 유지한다.
- 공통 엔진 수정은 최소화한다.
- 변경 사유와 영향 범위를 기록한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
7. 검증 항목 □ 기존 기능 영향 없음 □ PLAN 구조 유지 □ 상태 일관성 □
 로그 일관성 □ 복구 일관성

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
================================================================================
파일: MASTER_SPEC_┼δ╟╒░╗╜┼└┌╖ß_2026-06-30.txt
================================================================================
MASTER SPEC 통합 갱신자료 (원본 병합본)

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
주의: - 본 문서는 업로드된 TXT 문서들을 순서대로 병합한 통합본이다. -
내용을 임의 요약하거나 삭제하지 않았다. - 중복 내용은 그대로 유지하였다.
원본: MASTER_SPEC_갱신메모_UI프로토타입단계(1).txt
MASTER SPEC 갱신 메모
현재 판정
UI는 최종판이 아닌 프로토타입.
원칙

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
□ 가격비교매수 - 평단 >= 현재가 - 호가설정 - 다중지점 - 회차기준 -
예산기준 - 능동매수 - 평단 < 현재가 - 호가설정 - 다중지점 - 회차기준 -
예산기준 - 능동매수
설계 원칙

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
[제목 규칙] - 기본설정 / 매수설정 / 매도설정은 버튼형 박스 사용. - 검정
테두리. - 배경색 없음. - 제목 색상만 사용. - ’|’는 박스 밖, 검정색 유지.
[강조 규칙] - 글자 크기 확대 금지. - 박스 높이, 테두리, 패딩으로 강조.
[복원 기준] - 실험했던 디자인은 폐기. - 복원본을 기준으로 후속 작업
진행.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
[상단] - 신호검출조건 = A OR B OR C 기본. - 매도방식지정 추가. - 설정 A
기본 선택. - 최소 1개 선택. - OR만 사용.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
[설정 공통] 1. 주신호대응 매도설정 2. 매도중상황변화대응 3.
후속매도반복설정 4. 반복이탈조건 5. 매도완료정책

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
[UI 정책] - 소제목 트리형. - 들여쓰기 통일. - 신호검출조건 입력컨트롤과
동일 스타일. - 상단 헤더 구성 확정. - 설정 A/B/C 동일 구조 유지.
원본: MASTER_SPEC_갱신자료_v2026-06-25_MACD매도설정_UI_미체결정책(6).txt

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
================================================================================ 1.
매도 실행 구조 갱신
================================================================================

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
================================================================================
2. 매도방식 UI 갱신
================================================================================
2.1 매도방식 기본 구조 매도방식은 다음 항목으로 구성한다. - 단일호가 -
다중호가 - 다중지점

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
단일호가와 다중호가는 상호배타로 동작한다. 다중지점 내부의 시간 기준과
가격/평단 기준도 상호배타로 동작한다.
2.2 다중호가 표시 형식: - 상향 [4] 호가 / 기준 1호가 / 하향 [2] 호가 |
합계 [7]호가
합계 계산: - 상향 수 + 기준 1호가 + 하향 수 - 예: 4 + 1 + 2 = 7호가
2.3 다중지점 시간 기준 표시 형식: - 시간 [30][분/초/봉][이내/간격][3]회
[주문가/현재가]

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
2.4 다중지점 가격 기준 표시 형식: - [주문가/현재가/평단가] 대비
[주문가/현재가/평단가] [상향/하향/상하] [0.15]% [이상/이하/이내/이탈] /
[3]회

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
중요 변경: - 기존 “에” 표현은 “대비”로 변경한다. - 예: “주문가에 평단가”
→ “주문가 대비 평단가” - 방향에 따라 비교 콤보 표시 옵션을 제한한다.
상향/하향: 이상/이하 상하: 이내/이탈
2.5 마지막회 주문 타입 기존: - 마지막회 시장가 매도
변경: - 마지막회 [시장가/현재가]

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
의미: - 다중지점 설정의 하위 항목이다. - 다중지점 시간/가격 조건 중
하나가 활성화되어야 선택 가능하다. - 마지막회 주문을 시장가로 할지
현재가로 할지 선택한다. - 이 설정은 최초 매도방식과 완료정책에서
독립적으로 가져갈 수 있어야 한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
기본값: - 현재 UI에서는 20초를 기준으로 쓰는 화면이 많았다. - 단, 콤보
아이템 순서는 분/초/봉으로 유지한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
SELL: - [주문가/현재가/평단가] 대비 [주문가/현재가/평단가]
[상향/하향/상하] [0.15]% [이상/이하/이내/이탈] 매도주문취소

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
BUY: - [주문가/현재가/평단가] 대비 [주문가/현재가/평단가]
[상향/하향/상하] [0.15]% [이상/이하/이내/이탈] 매수주문취소

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
기본 체크: - 기본값은 꺼짐(False)이 적절하다. - 기존 시간 기준 취소는
켜짐(True) 유지 가능.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
3.5 가격조건 비교 콤보 숨김 규칙 반드시 적용: - 방향이 상향이면 비교
콤보는 이상/이하만 표시. - 방향이 하향이면 비교 콤보는 이상/이하만
표시. - 방향이 상하이면 비교 콤보는 이내/이탈만 표시. - 숨김 처리는
QComboBox view row hidden 방식으로 기존 공통폼과 동일하게 한다. - 방향
변경 시 현재 선택값이 보이는 옵션에 없으면 자동으로 적절한 기본값으로
바꾼다. 상하: 이내 상향/하향: 이하

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
================================================================================
4. 완료정책 UI 갱신
================================================================================
4.1 완료정책 첫 줄 삭제 삭제 대상: - 마지막 주문 취소 이후 [3][분] 동안
수행

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
삭제 이유: - 현재 완료정책 구조에서 이 항목의 의미가 불명확하다. -
완료정책이 재매도 전략으로 재정의되는 상황에서 상단 실행시간 행은 혼란을
만든다. - 사용자는 해당 행 삭제를 요청했다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
4.2 삭제 시 구현 주의사항 단순히 UI 행만 제거하면 안 된다. 해당
체크박스를 참조하는 내부 로직도 함께 정리해야 한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
점검 대상 메서드: - sync_detail_row_enabled - sync_fill_ratio_enabled -
sync_complete_mode - sync_after_cancel_by_multi_point - toggled.connect
관련 구문

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
발생했던 오류: - AttributeError: ‘MacdRoutineSettingsDialog’ object has
no attribute ‘complete_after_cancel_check’ - 원인은 삭제된 체크박스를
참조하는 로직이 남아 있었기 때문이다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
4.3 완료정책 남길 항목 완료정책에는 다음 항목을 남긴다. - 단일호가 -
다중호가 - 다중지점 - 마지막회차 시장가 또는 향후 마지막회
[시장가/현재가] 구조

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
추후 완료정책도 매도방식과 같은 공통 SellExecutionPolicy UI를 재사용할
수 있다. 단, 현재 단계에서는 대규모 리팩토링 금지.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
================================================================================
5. 신호검출조건 UI 갱신
================================================================================
5.1 조건 B 볼린저밴드 추가 매도 신호검출조건 B에 볼린저밴드를 가격박스와
같은 형태로 추가한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]

Original Body Marker: END

---

Reference Navigation

- Previous: PART03_02_GUI.md
- Next: PART03_04_GUI.md
- Full PART: PART03_GUI.md
- INDEX: 00_REFERENCE_INDEX.md
- Original Canonical: ../CURRENT/MASTER_SPEC_CANONICAL_2026-07-07_RULE_APPLY_PREVIEW_EXECUTION_PREVIEW_CONTROLLER.txt
