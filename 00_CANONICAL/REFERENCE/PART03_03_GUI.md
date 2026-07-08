# PART03 03 GUI

Reference Edition Subpart

Original Canonical: MASTER_SPEC_CANONICAL_2026-07-08_EXECUTION_SENDORDER_CHEJAN_LIFECYCLE_PIPELINE.txt

Source Full Part: PART03_GUI.md

생성일: 2026-07-08

주의: 본 문서는 AI 참조용 하위 분할본이며 공식 원본은 CURRENT의 Canonical이다.

Original Body Marker: START
[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
기존 구조에서 가장 중요한 변화:
- preview_rules["buy"]["groups"] = ... 제거
- signals["macd_sell"] = ... 제거
- 기존 rules dict를 덮어쓰는 방식 중단
- preview 전용 namespace 생성
**2. 변경될 Preview 구조**

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
현재 구조:
json
{
 "preview_rules": {
 "bar": {
 "bar_minutes": 5
 },
 "buy": {
 "groups": [...]
 },
 "sell": {
 "signals": {
 "macd_sell": {...}
 }
 }
 }
}

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
mapped_paths 변경 후보:
json
[
 "bar.bar_minutes",
 "buy.groups[0].conditions",
 "sell.signals.ui_preview_condition_c_macd_sell"
]

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
- sell.signals.ui_preview_condition_c_macd_sell
 - current: 없음
 - preview: indicator_follow_rule_preview.candidates.sell.add_signal_candidate
 - status: add_signal_candidate
 - risk: low for preview, execution risk 별도 note
 - note: 기존 sell.signals.macd_sell 변경 없음

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
중요:
- sell.signals.macd_sell은 mapped_paths에서 제거
- 따라서 diff에 sell.signals.macd_sell changed가 나오면 실패
- 기존 macd_sell은 변경 대상이 아니라 “unchanged by mapper preview”로 해석해야 함

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
기존 테스트 중 수정 필요:
- test_mapped_paths_match_expected_preview_paths
- test_buy_delay_bar_is_under_preview_buy
- test_sell_delay_bar_is_under_preview_sell_macd_sell_only
- diff 관련 테스트 일부
새 테스트 방향:

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
5. sell add signal candidate
python
candidate = preview_rules["indicator_follow_rule_preview"]["candidates"]["sell"]["add_signal_candidate"]
candidate["path"] == "sell.signals.ui_preview_condition_c_macd_sell"
candidate["enabled"] is False
candidate["preview_candidate"] is True

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
6. 기존 sell.signals.macd_sell 미변경
python
assert preview_rules["sell"]["signals"]["macd_sell"] == current_rules["sell"]["signals"]["macd_sell"]

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
다만 preview_rules가 current_rules deepcopy를 유지할 경우에만 해당. 만약 preview_rules를 후보만 담는 구조로 축소하면 이 테스트는 “preview namespace가 macd_sell을 포함하지 않는다”로 바꿔야 함.

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
7. diff status
text
buy.groups[0].conditions → merge_candidate
sell.signals.ui_preview_condition_c_macd_sell → add_signal_candidate
sell.signals.macd_sell → changes에 없어야 함
8. warnings ASCII 유지
**5. 위험 요소**

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
구현 추천 여부:
- **구현 추천: 예**
- 단, 기존 실행 rules로 직접 매핑하지 말고 preview namespace 기반으로만 구현해야 합니다.
- buy.groups 직접 대체와 sell.signals.macd_sell 직접 대체는 금지하는 방향이 맞습니다.
분석 방향 좋습니다. 이제 구현 들어가도 됩니다.
다만 범위는 아주 좁게 잡는 게 맞습니다.

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
수정 범위:
1. build_engine_rules_preview_from_ui_state()
2. compare_engine_rules_preview()
3. tests/test_indicator_follow_rule_mapper_preview.py

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
구현 내용:
1. preview에서 buy.groups를 직접 덮어쓰지 않는다.
2. preview에서 sell.signals.macd_sell을 직접 덮어쓰지 않는다.
3. preview 전용 namespace를 추가한다.
namespace:
indicator_follow_rule_preview
mode:
merge_add_candidate

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
sell 후보:
- 기존 sell.signals.macd_sell은 변경하지 않는다.
- MACD <= -1.0 조건은 별도 signal candidate로 둔다.
- path: sell.signals.ui_preview_condition_c_macd_sell
- enabled: false
- preview_candidate: true

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
mapped_paths:
- bar.bar_minutes
- buy.groups[0].conditions
- sell.signals.ui_preview_condition_c_macd_sell

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
diff:
- bar.bar_minutes: same/changed
- buy.groups[0].conditions: merge_candidate
- sell.signals.ui_preview_condition_c_macd_sell: add_signal_candidate
- sell.signals.macd_sell은 changes에 나오면 안 됨

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
테스트:
- current_rules 불변
- preview namespace 존재
- buy.groups 직접 대체 없음
- buy merge candidate 확인
- sell add signal candidate 확인
- sell.signals.macd_sell 변경 없음
- diff status 확인
- warnings ASCII 유지

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
변경 내용:
- buy.groups 직접 대체 제거
- sell.signals.macd_sell 직접 대체 제거
- preview 전용 namespace 추가:
 - indicator_follow_rule_preview
 - mode: merge_add_candidate
- buy는 buy.groups[0].conditions에 대한 merge_candidate로 표현
 - 기존 OSC TURN_UP은 skip_existing
 - OSC <= -91.0만 add_conditions
- sell은 기존 macd_sell 유지
 - sell.signals.ui_preview_condition_c_macd_sell 별도 signal 후보로 표현
 - enabled: false
 - preview_candidate: true

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
mapped_paths 변경:
json
[
 "bar.bar_minutes",
 "buy.groups[0].conditions",
 "sell.signals.ui_preview_condition_c_macd_sell"
]

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
diff 변경:
- bar.bar_minutes: same/changed
- buy.groups[0].conditions: merge_candidate
- sell.signals.ui_preview_condition_c_macd_sell: add_signal_candidate
- sell.signals.macd_sell은 changes에 나오지 않음

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
replace preview 제거 완료
merge/add candidate preview 적용 완료
buy.groups 직접 대체 제거 OK
sell.signals.macd_sell 직접 대체 제거 OK
별도 preview namespace 적용 OK
테스트 12개 통과 OK
rules.json 미수정
엔진 미연결
다음 작업은 GUI 표시 확인입니다.
코덱스 지시:
파일 수정 금지.

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
확인 대상:
1. indicator_follow_rule_preview namespace가 보이는지
2. mode가 merge_add_candidate인지
3. buy.groups가 changed가 아니라 merge_candidate로 표시되는지
4. sell.signals.macd_sell이 changes에 없는지
5. sell.signals.ui_preview_condition_c_macd_sell이 add_signal_candidate로 표시되는지
6. rules.json 수정 시간 변경 없는지
이 출력 확인 후 문제가 없으면, 다음은 작업재개요약 / MASTER_SPEC 갱신자료 작성으로 한 번 끊는 게 좋습니다.

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
text
[Rule Mapper Preview]
{
 "mapped_paths": [
 "bar.bar_minutes",
 "buy.groups[0].conditions",
 "sell.signals.ui_preview_condition_c_macd_sell"
 ],
 "warnings": [
 "sell condition C MACD is an add_signal_candidate and does not replace existing macd_sell",
 "buy method mapping is postponed",
 "repeat buy mapping is postponed",
 "price compare buy mapping is postponed",
 "situation response mapping is postponed",
 "additional feature mapping is postponed",
 "cycle setting mapping is postponed",
 "exit condition mapping is postponed",
 "sell method A/B/C mapping is postponed",
 "pending order policy mapping is postponed",
 "completion policy mapping is postponed"
 ],
 "preview_rules": {
 "bar": {
 "bar_minutes": 5
 },
 "buy": {
 "enabled": true,
 "groups_logic": "OR",
 "groups": [
 {
 "enabled": true,
 "name": " ż 1",
 "conditions_logic": "AND",
 "conditions": [
 {
 "enabled": true,
 "not": false,
 "target": "OSC",
 "operator": "TURN_UP",
 "description": "MACD Ƿ ϶ ȯ"
 }
 ]
 },
 {
 "enabled": false,
 "name": " ż 2",
 "conditions_logic": "AND",
 "conditions": []
 },
 {
 "enabled": false,
 "name": " ż 3",
 "conditions_logic": "AND",
 "conditions": []
 },
 {
 "enabled": false,
 "name": " ż 4",
 "conditions_logic": "AND",
 "conditions": []
 },
 {
 "enabled": false,
 "name": " ż 5",
 "conditions_logic": "AND",
 "conditions": []
 }
 ]
 },
 "sell": {
 "enabled": true,
 "signal_logic": "OR",
 "note": "MACD SELL ͷ SELL SELL ȣ . Ȱ ȭ signal_logic AND/OR Ѵ .",
 "signals": {
 "macd_sell": {
 "enabled": true,
 "delay_bar": 1,
 "groups_logic": "OR",
 "groups": [
 {
 "enabled": true,
 "name": " ŵ _MACD_OSC_TURN_DOWN",
 "conditions_logic": "AND",
 "conditions": [
 {
 "enabled": true,
 "not": false,
 "target": "OSC",
 "operator": "TURN_DOWN",
 "description": "MACD Ƿ ϶ ȯ"
 }
 ]
 }
 ]
 },
 "profit_rate_sell": {
 "enabled": false,
 "profit_rate_percent": null,
 "basis": "average_price",
 "description": " ͷ ۼ Ʈ ̻ SELL ȣ ĺ . ⺻ Ȱ ."
 }
 },
 "filters": {
 "rsi": {
 "enabled": false,
 "conditions": []
 },
 "moving_average": {
 "enabled": false,
 "conditions": []
 },
 "price_compare": {
 "enabled": false,
 "conditions": []
 }
 }
 }
 }
}

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
확인 결과:
- indicator_follow_rule_preview namespace: **현재 설정 검증 화면의 Rule Mapper Preview에는 보이지 않음**
- mode = merge_add_candidate: **현재 설정 검증 화면에는 보이지 않음**
- buy.groups: changed가 아니라 buy.groups[0].conditions가 merge_candidate로 표시됨
- sell.signals.macd_sell: changes에 없음
- sell.signals.ui_preview_condition_c_macd_sell: add_signal_candidate로 표시됨
- rules.json 수정 시간 변경 없음: True

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
즉 diff 쪽은 의도대로 바뀌었지만, 설정 검증 화면의 [Rule Mapper Preview]가 아직 indicator_follow_rule_preview namespace를 표시하지 않고 있습니다.
판정 맞습니다.
현재 문제는 mapper 자체가 아니라 GUI 표시부입니다.

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
검증:
- py_compile
- offscreen 설정창 생성
- has_indicator_follow_rule_preview True
- has_merge_add_candidate True
- has_buy_merge_candidate True
- has_sell_add_signal_candidate True
- rules_mtime_unchanged True
이것만 하면 Preview와 Diff가 같은 구조를 보여주는 상태가 됩니다.
지금 수정과정들을 지켜보면 macd 구문들이 많이 보이는데 ?
맞습니다. 지금 보이는 macd 구문은 그냥 넘기면 안 됩니다.
다만 종류를 나눠서 봐야 합니다.

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
1. 남아 있어도 되는 macd
지표추종 루틴 내부에서 실제 계산 대상이 MACD/OSC라면 아래는 남아 있을 수 있습니다.

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
target: MACD
target: OSC
sell.signals.macd_sell
routine_macd_engine.py
MACD <= -1.0
OSC TURN_UP
OSC TURN_DOWN
이건 지표추종 루틴이 사용하는 지표 이름이라서 당장 금지 대상은 아닙니다.
2. 정리해야 할 가능성이 큰 macd
문제가 되는 건 이런 것들입니다.

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
gui_macd_...
MacdRoutineSettingsDialog
routine_macd_engine.py
macd_sell
MACD매매루틴
특히 UI/공통 구조에 붙은 macd는 현재 명칭 체계와 안 맞습니다.
현재 기준은:
지표추종매매루틴
indicator_follow
입니다.
그래서 앞으로 정리 방향은 이겁니다.
gui_macd_* 
→ gui_indicator_follow_* 또는 gui_routine_*

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
MacdRoutineSettingsDialog
→ IndicatorFollowRoutineSettingsDialog

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
routine_macd_engine.py
→ routine_indicator_follow_logic.py 또는 routine_signal_logic.py 검토

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
macd_sell
→ 당장 변경 금지. 기존 rules 호환 때문에 별도 검토 필요
3. 지금 당장 할 일
바로 이름 변경하면 위험합니다.
먼저 macd 문자열 실태조사가 필요합니다.
다음 코덱스 지시는 이렇게 가는 게 맞습니다.
파일 수정 금지.
현재 프로젝트에서 macd / MACD / Macd 문자열이 남아 있는 위치를 전수 조사해라.

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
분류 기준:
1. 지표 이름으로 유지 가능한 것
 - target: MACD
 - MACD 계산
 - OSC 계산
 - 조건 설명

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
2. 지표추종 루틴 전용 파일/클래스/함수라 이름 변경 후보인 것
 - gui_macd_*
 - MacdRoutineSettingsDialog
 - routine_macd_engine.py 등

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
산출:
- 파일별 macd 문자열 목록
- 분류
- 변경 후보
- 변경 금지 후보
- 변경 시 영향 파일
- 추천 작업 순서

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
업로드된 최신 압축본 기준으로 macd/MACD/Macd 문자열을 전수 조사하겠습니다. 파일은 수정하지 않고, 위치와 성격만 분류하겠습니다.

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
46s 동안 생각함
분석 결과, macd/MACD/Macd는 꽤 많이 남아 있습니다.
다만 대부분은 당장 수정 대상이 아닙니다.

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
전체 현황
macd/MACD/Macd 포함 파일: 65개
본문 발생 횟수: 3,186회
파일명 자체 hit: 1개
대부분은 과거 로그/리포트입니다.
분류 결과
1. 유지 가능
지표명으로 쓰이는 MACD/OSC입니다.

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
target: MACD
target: OSC
MACD선
시그널선
OSC TURN_UP
OSC TURN_DOWN
이건 지표추종 루틴이 MACD/OSC를 사용하는 한 유지 가능합니다.
2. 핵심 검토 대상
여기가 중요합니다.

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
routines/지표추종매매/routine.py
routines/지표추종매매/routine_macd_engine.py
routines/지표추종매매/routine_rule_mapper.py
routines/지표추종매매/rules.json
특히 문제 후보:

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
routine_macd_engine.py
evaluate_macd_routine
DEFAULT_MACD_ROUTINE_CONFIG
routine_type: MACD_OSC
sell.signals.macd_sell
여기는 지표명으로서 MACD인지, 루틴명 잔재인지 분리 검토가 필요합니다.

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
macd_sell
macd_kind_combo
macd_value_line
sell_signal_condition_c_macd_*
같은 변수명이 남아 있습니다.

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
이건 지표 MACD 조건을 의미하면 유지 가능하지만, macd_sell은 rules key라 신중해야 합니다.

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
추천 순서
1. routine_macd_engine.py가 실제로 지표추종 전용 로직인지 검토
2. evaluate_macd_routine / DEFAULT_MACD_ROUTINE_CONFIG 명칭 변경 가능성 검토
3. macd_sell key는 유지 또는 alias 전략 검토
4. GUI 변수명은 마지막에 정리
5. 로그/리포트는 보류
결론:
지금은 “MACD 명칭 전면 교체”가 아니라, routine_macd_engine.py와 macd_sell key를 어떻게 다룰지 먼저 결정해야 합니다.
이전에 한번 정리 했는데 아직도 많이 남았어. 왜?
이유는 크게 3가지입니다.
첫째, 이전 정리는 하드코딩된 루틴명 제거가 중심이었습니다.
그때 정리한 대상은 주로 이런 것들이었습니다.

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
"지표추종매매만 지원"
routine_name == "지표추종매매"
routines/지표추종매매/rules.json 직접 참조
설정창 호출 하드코딩
Registry/routine.json 기반 전환
즉 루틴 등록/호출 구조의 하드코딩 제거였지, macd 문자열 전체 제거 작업은 아니었습니다.
둘째, 남아 있는 macd 중 상당수는 지표 이름입니다.

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
MACD선
OSC
target: MACD
operator: TURN_UP / TURN_DOWN
macd_kind_combo
sell condition C MACD
이건 루틴명이 아니라 지표추종 루틴 내부에서 사용하는 지표 조건이라 남아 있을 수 있습니다.
셋째, 일부는 기존 rules 호환 키라서 일부러 못 지운 겁니다.
대표적으로:

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
sell.signals.macd_sell
routine_macd_engine.py
evaluate_macd_routine
DEFAULT_MACD_ROUTINE_CONFIG
이런 건 단순 치환하면 기존 rules.json, 테스트, mapper, 신호판단 경로가 깨질 수 있습니다.
정리하면:

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
이전 정리 = 루틴명/경로 하드코딩 제거
현재 남은 문제 = 파일명/함수명/rules key/지표명에 남은 macd 분류
그래서 이번에는 바로 삭제가 아니라, 다음처럼 가야 합니다.

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
1. 지표명 MACD → 유지
2. rules key macd_sell → 호환 때문에 보류/alias 검토
3. routine_macd_engine.py → 변경 후보
4. evaluate_macd_routine → 변경 후보
5. gui 내부 macd 변수명 → 후순위 정리
즉, 아직 많이 남은 건 “정리가 실패했다”기보다 이전 작업 범위가 달랐고, 지금은 더 깊은 명칭 정리 단계로 들어온 것입니다.
gui_indicator_follow_routine_settings_dialog.py만 최소 수정.
목표:
현재 Rule Mapper Preview 마무리.

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
수정:
[Rule Mapper Preview] 출력에 preview_rules["indicator_follow_rule_preview"] 내용을 포함한다.

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
MACD / macd / Macd 명칭 전수조사 결과를 바탕으로
유지 / 변경 후보 / 변경 금지 항목을 세부 분류
코덱스에 보낼 다음 지시는 이렇게 바꾸는 게 맞습니다.
파일 수정 금지.

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
프로젝트 전체에서 macd / MACD / Macd 문자열이 남아 있는 위치를 전수 조사하고,
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

Original Body Marker: END

---

Reference Navigation

- Previous: PART03_02_GUI.md
- Next: PART03_04_GUI.md
- Full PART: PART03_GUI.md
- INDEX: 00_REFERENCE_INDEX.md
- Original Canonical: ../CURRENT/MASTER_SPEC_CANONICAL_2026-07-08_EXECUTION_SENDORDER_CHEJAN_LIFECYCLE_PIPELINE.txt
