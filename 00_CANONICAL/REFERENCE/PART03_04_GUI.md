# PART03 04 GUI

Reference Edition Subpart

Original Canonical: MASTER_SPEC_CANONICAL_2026-07-08_EXECUTION_SENDORDER_CHEJAN_LIFECYCLE_PIPELINE.txt

Source Full Part: PART03_GUI.md

생성일: 2026-07-08

주의: 본 문서는 AI 참조용 하위 분할본이며 공식 원본은 CURRENT의 Canonical이다.

Original Body Marker: START
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
예: - 가격박스 [하향] [0.1]% [이상] - 볼린저밴드 [하향] [0.1]% [이상] -
[주문가/현재가/평단가] 대비 [주문가/현재가/평단가] …
5.2 조건 C 가격필터 추가 매도 신호검출조건 C 상단에 가격필터를 추가한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
예: - [주문가/현재가/평단가] 대비 [주문가/현재가/평단가] [상하] [0.25]%
[이내] - MACD선 - 1.0 이하 - 배열 5 > 20 > 60

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
================================================================================
7. 마스터스펙 반영 결론
================================================================================
이번 갱신의 핵심 결론은 다음과 같다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
원본: 마스터스펙_갱신자료_v2026-06-22_MACD설정창_BUY_UI비활성정책_SELL작업전(5).txt
마스터스펙_갱신자료_v2026-06-22_MACD설정창_BUY_UI비활성정책_SELL작업전

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
[문서 목적] 이 문서는 기존 MASTER_SPEC에 반영할 갱신자료이다. 이번
작업에서 MACD매매루틴 설정창 BUY 구성 UI에 대해 확정된 화면 구조, 비활성
정책, 용어, 금지사항을 마스터스펙에 반영하기 위한 자료이다. 본 문서는
기존 마스터스펙을 직접 대체하는 문서가 아니라, 마스터스펙 갱신 시
삽입/교체할 내용을 정리한 갱신 자료이다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
============================================================ 1. 갱신
대상 영역 ============================================================

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
대상: - MACD매매루틴 - 설정창 - 구성 탭 - BUY 구성 UI - 향후 SELL 구성
UI에도 동일 원칙 적용 예정
관련 파일: - gui_macd_routine_settings_dialog.py
현재 기준: - BUY 구성 UI 정리 완료 - SELL 구성 UI 작업 시작 직전

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
============================================================ 2. MACD
설정창 UI 운영 원칙
============================================================

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
2-3. 사용자 확인 원칙 UI 수정은 화면 확인 후 진행한다. 작업 순서: 1)
현재 화면 또는 파일 확인 2) 수정 대상 특정 3) 수정 범위 확정 4) 파일
생성 5) 사용자 실행 확인

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
각 영역은 QGroupBox 기반으로 표시하며, 전체 창은 3열 구조를 유지한다. 창
폭은 항목 증가와 콤보박스 잘림 방지를 위해 충분히 넓게 설정한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
============================================================ 4. 공통
비활성 표시 정책
============================================================

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
4-1. 기본 원칙 체크박스가 있는 조건/행은 체크 해제 시 해당 조건의 설정
항목을 비활성 표시한다. 목적은 사용 중 조건과 미사용 조건을 즉시
구분하는 것이다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
4-2. 체크박스는 항상 유지 체크박스 자체는 다시 켤 수 있어야 하므로
비활성 처리하지 않는다. 비활성 처리 대상은 체크박스를 제외한 해당 행의
라벨, 입력칸, 콤보박스, 논리연산 콤보이다.
4-3. 적용 방식 체크 ON: - 행 전체 설정 항목 활성 - 일반 색상

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
체크 OFF: - 행 전체 설정 항목 비활성 - Qt disabled 상태의 회색 표시 -
사용자가 현재 미사용 조건임을 즉시 인식 가능

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
4-4. 예외 평단관리의 상단 기본 정책인 회차기준/예산기준/능동매수에는 이
비활성 정책을 적용하지 않는다. 평단관리에서는 조건별 동작 3행에만
적용한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
============================================================ 5. 적용필터
갱신사항 ============================================================
5-1. 최종 구성 적용필터는 다음 3행으로 구성한다. - RSI기간 -
MACD선/시그널선 - 배열
5-2. 삭제 확정 항목 삭제된 항목: - 20 이평 / 3 봉전대비 / 하락 / 0.2%
삭제 사유: - 중복성 높음 - 화면 가독성 저하 - 공간 낭비 - 시그널선
콤보박스 잘림 문제 개선

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
콤보박스 폭: - MACD선/시그널선 문구가 잘리지 않도록 충분히 확보. - -/+
콤보도 지나치게 좁지 않게 설정. - 값 입력칸도 1.0 표시가 답답하지 않도록
확대.
5-4. 비활성 정책 각 필터 행은 체크박스 기준으로 행 전체 활성/비활성
처리한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
============================================================ 6. 매수방식
갱신사항 ============================================================

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
6-1. 구성 매수방식에는 다음 항목이 포함된다. - 단일호가 - 상향
다중호가 - 다중지점 - 시간 조건 - 주문가/평단 조건 - 마지막회차
능동매수 - 설정가에 평단이 조건

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
6-2. 기존 로직 보존 다음 로직은 유지한다. - 단일호가와 상향 다중호가의
상호배타 - 시간 조건과 평단 조건의 상호배타 - 단일호가 여부에 따른
시장가 선택 가능 여부 - 마지막회차 능동매수 활성 조건

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
6-3. 비활성 정책 체크 해제된 하위 조건은 관련 라벨, 입력칸, 콤보박스를
비활성 처리한다. 단, 기존 상호배타 로직과 충돌하지 않도록 기존 동작을
보존한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
============================================================ 7. 평단관리
갱신사항 ============================================================
7-1. 상단 기본 정책 평단관리 상단에는 다음 정책이 존재한다. - 회차기준 -
예산기준 - 능동매수

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
이 세 항목은 평단관리의 기본 정책이므로 체크 해제 시 행 전체 비활성
정책을 적용하지 않는다. 기존 동작 유지.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
7-2. 조건별 동작 조건별 동작은 3행으로 구성한다. 예시: - 20 이평 / 5
봉전 / 상향 / 0.15% / 이하 / 회차기준 - 20 이평 / 5 봉전 / 상하 / 0.15%
/ 이내 / 예산기준 - 20 이평 / 5 봉전 / 하향 / 0.15% / 이하 / 능동매수

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
7-3. 조건별 동작 비활성 정책 조건별 동작 3행은 체크박스 기준으로 행 전체
활성/비활성 처리한다. 체크 해제 시 입력칸, 라벨, 방향 콤보, 비교 콤보,
정책 콤보가 모두 비활성 처리된다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
============================================================ 9. 완료정책
갱신사항 ============================================================

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
9-2. 현상태로 완료판정 “현상태로 완료판정”은 완료정책의 핵심 기본
항목이다. 완료 조건 중 상단에 유지한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
9-3. 마지막 주문 취소 이후 마지막 주문 취소 이후 항목은 수행 기간을
지정한다. 이 항목이 활성일 때 하위 잔량매수/능동매수 정책을 사용할 수
있다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
9-4. 잔량매수 잔량매수는 마지막 주문 취소 이후 수행되는 하위 정책이다.
잔량매수 체크 해제 시 잔량매수 하위 3행과 예산충족률 관련 설정은 비활성
처리한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
9-6. 예산충족률 예산충족률은 잔량매수 하위 조건과 함께 사용된다.
예산충족률 체크 해제 시 95 / % / 이상 / AND 등의 설정 항목도 같이 비활성
처리한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
9-7. 능동매수 능동매수는 별도 하위 설정을 갖는다. 체크 해제 시 관련
가격기준, 방향, 값, 비교 조건을 비활성 처리한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
9-8. 들여쓰기 정책 잔량매수와 능동매수는 너무 깊게 들여쓰지 않는다.
잔량매수/능동매수는 살짝 좌측으로 빼서 배치한다. 잔량매수 하위 3행은
잔량매수보다 반칸 정도만 안쪽으로 배치한다. 과도한 들여쓰기 금지.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
============================================================ 10.
완료정책 세부설정 갱신사항
============================================================
10-1. 그룹명 그룹명은 “완료정책 세부설정”으로 한다.
10-2. 총 6행 구조 완료정책 세부설정은 총 6행이다.
상단 3행: - 기존 조건별 동작 3행 유지 - 이평/봉전 기준 조건
하단 3행: - 가격관계 기반 조건 3행 추가

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
10-3. 기존 조건별 동작 3행 예시: - 20 이평 5 봉전 상향 0.15% 이하
매수안함 AND - 20 이평 5 봉전 상하 0.15% 이내 능동매수 AND - 20 이평 5
봉전 하향 0.15% 이하 잔량매수 AND

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
10-5. 중요 오해 방지 기존 조건별 동작 3행은 삭제하지 않는다. 사용자가
기존 내용 보존을 명확히 지시했다. 따라서 최종 구조는 기존 3행 + 추가 3행
= 총 6행이다.
10-6. 비활성 정책 완료정책 세부설정 6행 모두 체크박스 기준으로 행 전체
활성/비활성 처리한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
============================================================ 11.
콤보박스 표시 정책
============================================================

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
11-2. 전체 창 폭 우측 완료정책 세부설정의 6행이 들어가므로 창 폭은
충분히 넓게 유지한다. 단, 가로 스크롤은 사용하지 않는 방향이 좋다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
11-3. 3열 비율 매수설정 영역은 큰 틀에서 1:1:1 비율을 유지하되, 실제
내용량에 따라 약간의 폭 조정은 가능하다. 중요한 것은 우측 영역의
콤보박스 잘림을 막는 것이다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
============================================================ 12. SELL
구성에 적용할 예정 원칙
============================================================
SELL 구성은 다음 창에서 작업한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
SELL에 적용할 비활성 정책: - 체크 해제된 조건/행은 행 전체 비활성 -
체크박스 자체는 활성 유지 - 기존 상호배타 로직 보존 - 기존 용어 보존

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
============================================================ 13.
마스터스펙 삽입 권장 위치
============================================================

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
권장 삽입 위치: - MACD매매루틴 설정창 UI 정책 파트 - BUY 구성 파트 - UI
표시/비활성 정책 파트 - 향후 SELL 구성 파트 직전

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
별도 소제목 권장: - “MACD 설정창 체크박스 기반 행 비활성 정책” - “BUY
구성 UI 확정사항” - “완료정책 및 완료정책 세부설정 6행 구조” - “SELL
구성 작업 전 준수사항”

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
============================================================ 14. 다음
갱신 필요 시점
============================================================

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
1. 회차기준 | 매수회차
2. 예산기준 | 직전예산 X N
3. 능동매수 | 설정가에 평단이 [상향/하향/상하] [N]% [이상/이하/-]
능동매수 방향 판정 규칙
상향: - 이상 - 이하
하향: - 이상 - 이하
상하: - “-” - 비교조건 없음
UI 표시 규칙
상향 선택: “-” 숨김
하향 선택: “-” 숨김
상하 선택: “-” 표시 비교 콤보 비활성
조건별 동작 구조:
[20]이평 [5]봉전 [상향/하향/상하] [0.15]% [이상/이하/-]
[회차기준/예산기준/능동매수]
UI 폭 조정은 소폭 → 확인 → 추가조정 순으로 진행
원본: MASTER_SPEC_추가갱신메모_v2026-06-22(9).txt
MASTER_SPEC_추가갱신메모_v2026-06-22

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
[절대금지] - 정상 실행 파일 없이 패치 금지 - 함수 단위 정규식 삭제
금지 - 들여쓰기 자동수정 금지 - 임의 리팩토링 금지 - UI 배치 작업 중
로직 수정 금지 - 사용자가 지시하지 않은 항목 수정 금지
원본: 마스터스펙_갱신자료_STEP44(9).txt
마스터스펙_갱신자료_STEP44

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
[압축파일 생성 금지 정책] - 프로젝트 결과물 기본 전달 방식은 개별 파일 -
ZIP 생성 금지 - 참조문서도 개별 TXT 유지 - 패치파일도 개별 파일 유지
신규 확정 개념
[평단관리]
회차기준 - 매수회차 기반 예산 증가
예산기준 - 직전예산 기준 배수 증가
능동매수 - 평단 개선 효과 기반 자동 예산 산정
지원 정책 - 회차기준 - 예산기준 - 능동매수
동시 사용 불가 택1 사용
능동매수 기준가격 - BUY 신호 발생 시점 현재가
다중지점 마지막회차 능동매수 - 평단관리 능동매수와 별도 개념 -
예산정책이 아닌 매수방식 하위옵션
UI 정책 - 창 제목과 본문 제목 중복 금지 - 세로 공간 확보 우선 - 체크박스
형태 유지 가능

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
매수/매도 탭은 공식 UI에서 제거한다. 다만 기존 load_rules,
_populate_fields, refresh_preview 등의 호환을 위해 내부 위젯 객체는
유지할 수 있다. 공식 화면에만 노출하지 않는다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
============================================================ 3. 첫 화면
구성 원칙 ============================================================
첫 화면은 “설정폼 세로 나열” 방식이 아니라 “구성 컨트롤 패널” 방식이다.
기본 배치는 다음과 같다.
상단: - MACD매매루틴 제목 - 탭: 구성 / 고급 / 검증
구성 탭: - 매수설정 영역 - 매도설정 영역 또는 SELL 구성 영역

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
현재는 매수설정 UI 모양 잡기가 우선이며, SELL 영역은 아직 정리 전이다.
SELL 영역은 당분간 기존 요약 형태로 둔다.
루틴 상태 카드 영역은 제거한다. 이전에는 다음 항목을 보여주었다.
- 루틴 활성
- 매수 활성
- 매도 활성
- 수익률 매도 비활성
- 검증 정상

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
정상 처리 방식: - status_box를 생성한다. - self.card_routine 등 카드
객체를 생성한다. - layout.addWidget(status_box)로 레이아웃에 편입한다. -
status_box.hide()로 화면에서 숨긴다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
금지 방식: - 카드 객체가 포함된 위젯을 레이아웃에 넣지 않고 방치 - 카드
객체 자체 삭제 - _populate_fields가 참조하는 객체명을 제거

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
============================================================ 4. 매수설정
헤더 최종 방향
============================================================
매수설정 헤더는 한 줄이다.
형태: 매수설정 | 메인신호 : OCR [부호] [값] [이하/이상] [상승/하락] 전환
[봉값] 봉

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
현재 화면상 구현 형태: - “매수설정 |” : QLabel, 굵게 강조 - “메인신호 :
OCR” : QLabel, 고정문구 - 부호: QComboBox - 기준값: QLineEdit - 비교:
QComboBox - 방향: QComboBox - “전환”: QLabel, 고정문구 - 봉값:
QLineEdit - “봉”: QLabel, 고정문구
OCR은 설정값이 아니라 고정 지표명이다. 설정값은 대괄호 안에 들어가는
다음 요소들이다.
- 부호
- 값
- 이하/이상
- 상승/하락
- 봉값
메인신호를 다음처럼 세로로 분리하지 않는다.
금지: 매수설정 메인신호 : OCR …
금지: 매수설정 메인신호 [OCR] …
정확한 방향: 매수설정 | 메인신호 : OCR [-] [1] [이하] [상승] 전환 [0] 봉

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
============================================================ 5. OCR
기준값 입력 방식
============================================================
OCR 기준값은 부호와 숫자를 분리해서 표현한다.
부호: - QComboBox - 항목: “-”, “+”
값: - QLineEdit - 숫자 입력 - 십 단위 숫자까지 고려 - 오른쪽 정렬

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
0 처리: - 값이 0일 때는 부호가 의미 없으므로 부호 콤보 비활성 처리
가능 - 현재 UI에서는 값 변경 시 부호 콤보 활성/비활성을 동기화하는
구조를 둘 수 있다.
예: 값 = 0 → 부호 콤보 비활성 값 = 1 이상 → 부호 콤보 활성
다만 현재 단계는 모양 잡기 우선이므로, 실제 검증/저장/부호 비활성 로직은
나중에 연결한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
============================================================ 6. 메인신호
입력 위젯 폰트/크기 조정 현황
============================================================

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
현재 가장 최근 기준은 STEP41V/STEP41T/STEP41U/STEP41R/STEP41S를 거쳐
STEP41V 8pt 상태를 봤고, 이후 7pt/9pt 테스트 논의가 있었다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
중요한 결론: - 입력칸 폰트와 QLabel 고정문구는 같은 pt라도 다르게
보인다. - QComboBox/QLineEdit은 내부 여백, 위젯 높이, 렌더링 때문에
고정문구보다 작거나 다르게 보일 수 있다. - 단순 pt 조정만으로 완전히
맞지 않을 수 있다. - 현재는 완벽한 확정이 아니라 “대략적인 모양 잡기
중단 상태”이다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
사용자가 마지막으로 멈춘 기준: - STEP41V 입력값 8pt 상태에서 “애매하지만
여기서 일단 멈춤”이라고 한 적 있음. - 이후 9pt/8pt를 다시 시험했다. -
마지막 대화 흐름에서는 “8로 해줘봐” 이후 입력값 8pt 파일이 만들어졌고,
그 후 7pt/9pt 논의가 이어졌다. - 다음 창에서는 현재 실제 적용본을 다시
확인하고, 최종 기준을 확정해야 한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
중요: 다음 창에서는 현재 실제 프로젝트에 들어간
gui_macd_routine_settings_dialog.py를 반드시 기준으로 삼아야 한다. 추정
수정 금지.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
============================================================ 7. 매수설정
내부 세부항목 UI 방향
============================================================

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
완료조건 [체크박스] [3]봉 판정 [체크박스] 수량충족률 95% [체크박스]
가격괴리율 0.1% [체크박스] 기간 내 충족 이력 기준
완료정책 [체크박스] 능동매수 [체크박스] 매수안함

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
중요: 문자 “☑”를 QLabel에 넣는 방식은 폐기한다. 반드시 실제 QCheckBox
위젯으로 구성한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
체크박스는 더미 상태여도 활성화한다. 즉: - 실제 QCheckBox -
setChecked(True/False) - setEnabled(True) - 아직 저장은 안 됨

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
금지: - QLabel에 “☑” 문자만 표시 - setEnabled(False)로 회색 비활성
처리 - 읽기 전용 표시물처럼 만드는 것
현재 목적은 모양 잡기이므로, 더미라도 실제 조작 가능한 체크박스로 둔다.
저장/로드 연결은 후순위.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
단, 나중에 연결할 수 있도록 위젯 이름은 유지해야 한다. 위젯 이름을 대충
만들거나 계속 바꾸면 이후 로직 연결이 어려워진다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
권장: - buy_ocr_sign_combo - buy_ocr_value_line -
buy_ocr_compare_combo - buy_ocr_turn_combo - buy_ocr_bar_line -
buy_overview_filter 관련 체크박스들 - buy_overview_method 관련
체크박스들 - buy_overview_avg 관련 체크박스들 - buy_overview_cancel 관련
체크박스들 - buy_overview_complete 관련 체크박스들 - buy_overview_policy
관련 체크박스들
다음 단계부터는 단순 QLabel 묶음보다 실제 위젯 참조를 리스트/딕셔너리로
보존하는 방식이 바람직하다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- BUY 탭을 새로 만들면서 buy_enabled_check 등 기존 위젯명을 제거했다.
- _populate_fields가 기존 이름을 참조하면서 AttributeError 발생.
- 교훈: 기존 로딩 로직이 참조하는 위젯명은 유지해야 한다.
2. STEP41 계열 초기 실패
- “법전” 문구가 공식 탭명에 남았다.
- 공식 UI 용어에서 법전 제거 필요.
3. 루틴 상태 제거 실패

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- status_box를 화면에서 없애는 과정에서 카드 객체가 Qt에서 삭제되었다.
- _populate_fields에서 card[“status”].setText를 호출하며 QLabel
 deleted RuntimeError 발생.
- 교훈: 화면에서 숨겨도 객체는 레이아웃에 편입시켜 생존시켜야 한다.
4. 체크박스 문자 실패

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- QLabel에 “☑” 문자를 넣었다.
- 사용자는 실제 QCheckBox를 원했다.
- 교훈: 설정 항목은 실제 위젯으로 만들어야 한다.
5. 체크박스 비활성 실패

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- 실제 QCheckBox를 만들었지만 setEnabled(False)로 회색 비활성
 처리했다.
- 사용자는 더미라도 활성 체크박스를 원했다.
- 교훈: 모양 잡기 단계에서는 실제 클릭 가능한 QCheckBox로 둔다. 저장은
 나중에.
6. 메인신호 헤더 오해

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- 매수설정과 메인신호를 두 줄로 분리하려 했다.
- 사용자는 한 줄을 요구했다.
- 교훈: “매수설정 | 메인신호 : …”는 반드시 한 줄.
7. 폰트 조정 실수

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- 고정문구와 설정입력값을 혼동하여 엉뚱한 폰트를 조정했다.
- 교훈: 고정문구와 설정값 위젯을 구분해서 조정해야 한다.
8. 정규식 교체 실패

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- _make_overview_text 함수 교체 중 문법 오류 발생.
- 교훈: 함수 전체 교체는 start/end index 방식으로 안전하게 하며,
 py_compile 검증 필수.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
============================================================ 10. 다음
마스터 스펙 반영 핵심 문장
============================================================
마스터 스펙에 반영할 핵심 문장은 다음과 같다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
원본: MASTER_SPEC_v3.0_갱신반영문_v2026-06-18_MACD루틴_HOLD오염복구_rules구조(8).txt
MASTER_SPEC_v3.0_갱신반영문_v2026-06-18_MACD루틴_HOLD오염복구_rules구조

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
적용 범위: - MACD매매루틴 파트 - 루틴 신호 정의 파트 - 루틴/메인
역할분리 파트 - 실주문 전 안전기준 파트 - AI 구현 금지행위/오염복구 기준
파트

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
본 문서는 기존 MASTER_SPEC 전체를 대체하지 않는다. 기존 MASTER_SPEC_v3.0
BASELINE은 유지하고, 아래 내용을 해당 파트에 반영한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
------------------------
 1. HOLD 오염 사고 정리
 ------------------------
1.1 발생 원인

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
----------------------------
 3. CANCEL 개념 위치 재정리
 ----------------------------
3.1 현재 확인 결과
현재 코드에서 발견된 CANCEL은 대부분 GUI 취소 버튼 또는 주문상태 코드다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
-----------------------------
 4. HOLD 오염 제거 적용 파일
 -----------------------------
수정 적용 완료 파일:

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- engines/signal_result.py
- engines/macd_signal_engine.py
- routines/MACD매매루틴/routine.py
- routines/MACD매매루틴/routine_macd_engine.py
- routines/MACD매매루틴/routine_condition_engine.py
- gui_routine_condition_engine.py
- create_test_candles_step5.py
- test_macd_routine_step1.py
- test_macd_routine_step2.py
삭제/보관 제외 권장:

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- docs/routine_macd_engine.py
- docs/routine_condition_engine.py

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
이유: - 초안 성격 - 실사용 import 경로 아님 - 최신 실사용 파일과 중복 -
HOLD 오염 가능성 존재
-------------------
 5. 검증 완료 내역
 -------------------
5.1 HOLD 제거 검증

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
실행: - python test_macd_routine_step1.py - python
test_macd_routine_step2.py - python test_routine_signal_probe_step3.py

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
----------------------------
 6. rules.json 도입 및 검증
 ----------------------------
6.1 rules.json 생성
위치: - routines/MACD매매루틴/rules.json

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
역할: - MACD매매루틴 전략 설정 파일 - 종목 config.json과 분리 - 루틴
고유 전략 설정 저장소

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
1. context[“routine_config”]
2. context[“rules”]
3. routines/MACD매매루틴/rules.json
4. DEFAULT_MACD_ROUTINE_CONFIG
검증: - test_rules_json_load_step21.py 통과

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
------------------------
 7. SELL 신호 구조 갱신
 ------------------------
7.1 기존 구조
기존 macd_signal_engine.py는 다음 구조만 읽었다.
sell.groups
7.2 갱신 구조
rules.json v0.2부터 SELL은 다중 독립신호 구조를 지원한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
sell: enabled: true signal_logic: “OR” signals: macd_sell: enabled: true
delay_bar: 1 groups: […] profit_rate_sell: enabled: false
profit_rate_percent: null basis: “average_price”
7.3 확정된 의미
MACD SELL과 수익률 SELL은 같은 레벨의 독립 SELL 신호 후보이다.
둘 다 활성화된 경우 결합 방식은 signal_logic으로 지정한다.
- OR
- AND

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
결과: - sell.signals.macd_sell.groups를 임시로 CLOSE > 0 조건으로 변경 -
루틴 결과 signal=“SELL” -
matched_groups=[“STEP22_SELL_SIGNALS_MACD_FORCE”] - 테스트 종료 후
rules.json 원본 복구

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
-----------------------------
 8. 현재 MACD 루틴 구현 상태
 -----------------------------
구현 완료:

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
-----------------------------
 9. AI 잘못 및 재발방지 반영
 -----------------------------
9.1 AI 잘못
다음 행위는 AI 잘못으로 기록한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
1. sell.signal_logic AND/OR 실제 평가 구현
2. profit_rate_sell 실제 평가 구현 여부 재확정
3. MACD 루틴 설정 UI 설계
4. 다중매수/평단 기반 추매 설계 재검토
5. CANCEL 계층 위치 재확정
주의: 바로 구현하지 말고 다음 창에서 먼저 현재 기준 문서와 본
갱신반영문을 확인한 뒤 진행한다.
ZIP 참고: MASTER_SPEC_13_루틴신호평가_및_조건엔진_수정본 (1)(3).zip

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
포함 파일: -
마스터스펙_갱신자료_v2026-06-25_MACD매도신호조합_NOT규칙_확정.txt -
작업재개요약서_v2026-06-25_MACD매도신호조합_UI_NOT규칙_확정.txt
ZIP 참고: 마스터스펙_갱신자료_STEP44(5).zip

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
================================================================================
파일: MASTER_SPEC_누락보강_01_루틴설정창_UI구조.txt
================================================================================
MASTER_SPEC 누락보강 01 주제 : 루틴 설정창 UI 구조 및 설계 철학
1. 목적

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- 한 화면에서 전체 설정 확인.
- 실제 컨트롤(QCheckBox/QComboBox/QLineEdit) 중심 구성.
- 저장 기능 비활성 유지.
- 기존 위젯명 유지.
- 공통 생성 로직 재사용.
3. UI 진화 과정
- 카드형 UI 검토.
- 카드형은 가독성 및 공간 활용 문제로 보류/폐기.
- 시나리오 박스 방식 채택.
4. 시나리오 구조

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- 설정 A/B/C 독립 구성.
- 각 시나리오는 독립 수행 단위.
- 마지막 시나리오에는 연산자를 두지 않는다.
5. 연산자 규칙

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
================================================================================
파일: MASTER_SPEC_누락보강_02_시나리오기반_매도설정구조.txt
================================================================================
MASTER_SPEC 누락보강 02 주제 : 시나리오 기반 매도설정 구조
1. 설계 목적

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- 매도설정을 단순 옵션 나열이 아닌 시나리오 단위로 구성한다.
- 각 시나리오는 독립적으로 수정·확장 가능해야 한다.
2. 시나리오 구성
- 설정 A
- 설정 B
- 설정 C
- 향후 확장 가능

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- 반복이탈조건 미사용 : 다음신호로 이월
- 반복이탈조건 사용 : 보유잔량시장가매도
- 별도 콤보 선택 없이 자동 표시
9. UI 규칙

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- 소제목 좌측 정렬
- 설정 입력은 반칸 들여쓰기
- 줄간격 통일
- 입력 컨트롤 높이 통일
- 콤보 잘림 금지
10. 설계 철학

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- 수행 순서가 곧 실행 흐름이다.
- 사용자가 시나리오를 위에서 아래로 읽을 수 있어야 한다.
- 설정과 실행 흐름이 동일한 UI를 유지한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- 기본 진입전략이 아닌 후속 대응정책으로 활용 가능성을 검토한다.
- 현재 포지션과 평단을 고려하여 자동으로 대응하는 방향을 검토한다.
8. 평단관리 정책
- 회차기준
- 예산기준
- 능동매수 세 정책은 목적이 서로 다르며 혼용하지 않는다.
9. 설계 원칙

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- 추매는 평균단가 개선을 위한 수단이다.
- 목표는 포지션 안정화이며 단순 매수 횟수가 아니다.
- 루틴은 평단을 관리하고 메인은 주문을 수행한다.
10. 향후 보강 대상
- 포지션 완성도 정의
- 후속매수 정책
- 실패 판정 기준
- 능동매수와 고정 추매의 역할 구분

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
================================================================================
파일: MASTER_SPEC_누락보강_04_입력컨트롤_UI통일정책.txt
================================================================================
MASTER_SPEC 누락보강 04 주제 : 입력 컨트롤 및 UI 통일 정책
1. 목적

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- 동일한 의미의 설정은 동일한 위젯을 사용한다.
- 동일한 입력은 동일한 폭과 높이를 유지한다.
- 동일한 정렬 방식을 유지한다.
3. 콤보박스 정책

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- 표시 문구가 잘리지 않도록 충분한 폭 확보.
- 동일 계열 콤보는 동일 폭 사용.
- 좌우 정렬이 흐트러지지 않도록 배치.
4. 입력칸(LineEdit) 정책

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- 숫자는 우측 정렬.
- 높이는 신호검출조건 입력칸과 동일.
- 입력 가능한 범위는 이후 검증 엔진에서 관리한다.
5. 체크박스 정책

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- 실제 QCheckBox 사용.
- 문자(☑, □)로 대체 금지.
- 체크박스는 항상 활성 상태 유지.
- 저장 기능과 독립적으로 동작.
6. 들여쓰기 정책
- 소제목은 최대한 좌측 정렬.
- 하위 설정은 반칸 들여쓰기.
- 과도한 들여쓰기 금지.
7. 레이아웃 정책
- 줄간격 통일.
- 그룹 간 간격 통일.
- 입력칸 높이 통일.
- 제목과 설정 간 간격 통일.
8. 공통 스타일

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- 신호검출조건 입력 스타일을 기준으로 통일.
- 그림자 효과 사용 금지.
- 불필요한 흰색 배경 사용 금지.
- 강조는 테두리와 간격으로 표현.
9. 화면 구성 원칙

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- 위에서 아래로 읽는 구조.
- 설정 순서와 실행 순서를 일치.
- 사용자가 현재 실행 흐름을 직관적으로 이해할 수 있어야 한다.
10. 구현 주의사항

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- UI 변경 시 기존 위젯명 유지.
- 기존 참조 구조 유지.
- 공통 생성 함수 재사용.
- 개별 위젯마다 서로 다른 스타일 적용 금지.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
================================================================================
파일: MASTER_SPEC_누락보강_05_상태제어_비활성정책.txt
================================================================================
MASTER_SPEC 누락보강 05 주제 : 상태제어 및 비활성 정책
1. 목적

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- 설정 사용 여부를 사용자가 즉시 식별할 수 있도록 상태를 일관되게
 표시한다.
- UI 상태와 내부 상태가 서로 다르게 보이지 않도록 한다.
2. 기본 원칙

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- 체크박스는 항상 활성 상태를 유지한다.
- 체크 해제 시 체크박스를 제외한 관련 컨트롤만 비활성 처리한다.
- 비활성은 Qt 기본 Disabled 상태를 사용한다.
3. 적용 대상

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- 상호배타 조건은 선택된 항목만 활성.
- 선택되지 않은 항목은 자동 비활성.
- 기존 상호배타 로직을 임의 변경하지 않는다.
5. 연계 비활성

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- UI 표시 상태와 내부 Enable 상태를 항상 동기화한다.
- 화면만 변경되고 내부 상태가 남는 현상을 금지한다.
8. 구현 원칙

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- 상태 변경은 공통 함수로 처리한다.
- 동일 기능의 상태제어를 중복 구현하지 않는다.
- 삭제된 위젯 참조를 남기지 않는다.
9. 검증 항목

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- UI 작업 중 로직 수정 금지
- 기존 객체명 유지
- 기존 Signal/Slot 참조 유지
- 위젯 삭제 시 참조 제거까지 완료
5. 공통 구현 원칙

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- py_compile
- 런타임 실행
- AttributeError 여부
- 콤보 표시 규칙
- 상태 동기화
- UI 잘림 여부
7. 문서 반영 원칙

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- 확정 사항만 MASTER_SPEC 반영
- 논의 단계는 보류로 기록
- 폐기된 설계는 폐기 사유와 함께 기록
8. AI 작업 원칙

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- 확정되지 않은 내용을 사실처럼 구현하지 않는다.
- 구현 방향은 사용자 확인 후 진행한다.
- 설명보다 실제 구현 기준을 우선한다.
- 이미 확정된 내용을 반복 질문하지 않는다.
9. 복구 기준

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- 문제가 발생하면 최신 정상본 기준으로 복원한다.
- 부분 수정보다 정상 기준 비교를 우선한다.
- 변경 범위를 명확히 기록한다.
10. 향후 보강

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- 엔진 연결 체크리스트
- UI 수정 체크리스트
- MASTER_SPEC 반영 체크리스트
- 코드 리뷰 체크리스트

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
================================================================================
파일: MASTER_SPEC_누락보강_07_루틴설정창_UI진화과정_설계변경이력.txt
================================================================================
MASTER_SPEC 누락보강 07 주제 : 루틴 설정창 UI 진화 과정 및 설계 변경
이력

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- 초기 설정 나열 방식
- 컨트롤 패널 방식 전환
- 카드형 UI 검토
- 시나리오 기반 구조 검토
- 박스형 시나리오 구조 확정(프로토타입)
3. 카드형 UI 검토 결과 장점
- 시각적 구분이 쉬움
- 독립 카드 단위 구성 가능
문제점 - 화면이 산만해짐 - 설정 요약 영역이 좁아짐 - 시선 흐름이 끊김 -
공간 활용이 비효율적
결론 - 공식 구조에서 제외. - 참고 설계안으로만 보관.
4. 시나리오 방식 채택 이유

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- 실제 실행 순서를 UI에 그대로 표현 가능
- 설정 A/B/C 독립 관리 가능
- 추후 시나리오 추가 용이
- 로직 구조와 UI 구조 일치

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- 제목은 좌측 정렬
- 설정은 반칸 들여쓰기
- 입력 컨트롤 높이 통일
- 콤보 폭 충분히 확보
- 줄간격 일정 유지
- 가로 스크롤 지양
7. 입력 스타일 통일

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- 신호검출조건을 기준 스타일로 사용
- 설정 입력도 동일 스타일 적용
- 그림자 효과 제거
- 흰색 강조 박스 사용 금지
8. 프로토타입 단계 원칙

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- 현재 화면은 최종 디자인이 아님
- 기능보다 구조 검증 우선
- 로직 연결은 후순위
- UI 변경 이력은 MASTER_SPEC에 지속 반영
9. 향후 개선 대상

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- 우측 여백 활용
- 탭 구조 재검토
- 용어 체계 일괄 정리
- 상태 표시 개선
- 엔진 연결 후 최종 UI 확정

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- 동일 의미의 항목은 동일한 위치에 배치한다.
- 동일 의미의 입력은 동일한 위젯을 사용한다.
- 동일 계열 콤보박스는 동일한 폭과 높이를 유지한다.
- 실행 흐름이 위에서 아래로 읽히도록 구성한다.
4. 비교 조건 공통 규칙 방향 :
- 상향
- 하향
- 상하
비교 : 상향/하향 → 이상 / 이하 / 이내 상하 → 이내 / 이탈
모든 가격 비교형 UI에 동일 규칙을 적용한다.
5. 공통 상태제어

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- 체크박스 기반 활성/비활성
- 상위 정책과 하위 정책 연계
- 공통 Enable 제어 함수 사용
- 동일한 동작은 동일한 처리 방식 유지
6. 공통 명명 규칙

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- UI는 실행 엔진을 설명하는 문서가 아니라, 실행 정책을 시각적으로
 구성하는 도구이다.
- 설정 순서와 실제 처리 순서를 최대한 일치시킨다.
9. 향후 확장

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- 다른 루틴 추가 시 동일 구조 사용
- 공통 컴포넌트 기반으로 신규 루틴 생성
- 엔진 변경 시 UI 구조는 최대한 유지

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
10. 결론 매수와 매도는 기능은 다르지만, 사용자가 학습해야 하는 UI 규칙은
 하나만 존재하도록 설계한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
================================================================================
파일: MASTER_SPEC_누락보강_09_루틴엔진연계_UI엔진매핑원칙.txt
================================================================================
MASTER_SPEC 누락보강 09 주제 : 루틴 엔진 연계 및 UI-엔진 매핑 원칙
1. 목적

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- UI는 엔진 내부를 직접 제어하지 않는다.
- 엔진은 UI 위젯을 직접 참조하지 않는다.
- 설정값만 전달한다.
5. 설정 저장
- UI 객체를 저장하지 않는다.
- 설정 데이터만 저장한다.
- 공통 데이터 구조를 사용한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
10. 결론 UI, 저장구조, 엔진은 서로 독립성을 유지하며 데이터 구조를
 통해서만 연결하는 것을 기본 원칙으로 한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
================================================================================
파일:
MASTER_SPEC_누락보강_100_히스토리기반_PLAN중심_자동매매프레임워크_최종종합원칙.txt
================================================================================

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
MASTER_SPEC 누락보강 100 주제 : 히스토리 기반 PLAN 중심 자동매매
프레임워크 최종 종합 원칙
출처 : 작업진행상황대화히스토리_3~8 비교 반영

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
3. 최상위 구조 ① Routine Layer : 전략·신호 ② PLAN Layer : 주문
 계획·상태·생명주기 ③ Execution Layer : 주문·체결·재시도 ④ Management
 Layer : 로그·복구·운영·검토관리
4. 공통 유지 원칙

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- PLAN 생명주기 유지
- 공통 인터페이스 유지
- 공통 상태 머신 유지
- 공통 이벤트 처리 유지
- 공통 로그 및 복구 체계 유지
5. 장기 확장 원칙

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- 신규 루틴은 기존 PLAN 구조를 재사용한다.
- 공통 엔진은 전략에 의존하지 않는다.
- 구조 변경보다 정책 변경을 우선한다.
- 기존 루틴과의 호환성을 유지한다.
6. 운영 원칙

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- 상태와 로그는 항상 일치해야 한다.
- 예외 발생 시 복구를 우선한다.
- 검토관리는 자동 처리 불가능한 상황에서만 사용한다.
- 구현 변경 시 문서를 함께 갱신한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
7. 최종 검증 기준 □ 구조 일관성 □ 상태 일관성 □ 이벤트 일관성 □
 로그·복구 일관성 □ 루틴 독립성 □ 장기 확장성

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
================================================================================
파일: MASTER_SPEC_누락보강_101_UI구현표준_통합본.txt
================================================================================
MASTER_SPEC 누락보강 101 주제 : 루틴 설정 UI 구현 표준 (통합본)
출처 : 작업진행상황대화히스토리 3~8 비교 반영

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- 체크박스 기반 활성화
- 비활성 시 회색 표시
- 관련 하위 옵션 동시 비활성
- 상태 변경 즉시 UI 반영
4. Show / Hide 정책
- 선택값에 따라 필요한 항목만 표시
- 불필요한 입력은 숨김
- 레이아웃이 무너지지 않도록 공간 유지
5. 콤보 연동 규칙
- 방향 변경 시 비교 연산자 자동 변경
- 관련 옵션 자동 갱신
- 공통 함수로 구현
6. Row Builder 원칙
- 동일 형식의 입력행은 공통 생성 규칙 사용
- 화면별 개별 구현 최소화
- 공통 스타일 유지
7. 폭 및 정렬
- 긴 정책 문구 우선 확보
- 입력폭 표준화
- 문구 잘림 방지
- 좌우 정렬 일관성 유지
8. 공통 구현 원칙

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
================================================================================
파일: MASTER_SPEC_누락보강_102_루틴설정UI_통합설계기준.txt
================================================================================
MASTER_SPEC 누락보강 102 주제 : 루틴 설정 UI 통합 설계 기준
출처 : 작업진행상황대화히스토리 3~8 비교 반영

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- 신호검출기준
- 거래시간
- 데이터 누락 정책
- 신호 재검증
- 오류 발생 처리
- 공통 활성/비활성 규칙
2. 적용필터

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- Row Builder 공통 사용
- Show/Hide 정책
- 활성/비활성 정책
- 반칸 들여쓰기
- 공통 정렬
- 입력폭 표준화
- 문구 잘림 방지
9. 구현 원칙

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- 계층 구조를 유지한다.
- 의미 없는 중복 키를 만들지 않는다.
- 확장 가능한 구조를 우선한다.
- 하위 호환성을 고려한다.
4. 버전 관리
- 구조 변경 시 버전을 증가시킨다.
- 변경 이력을 기록한다.
- 이전 버전과의 호환 여부를 명시한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- 단위 테스트(Unit)
- 통합 테스트(Integration)
- UI 테스트
- Mock 테스트
- 운영 시나리오 테스트
- 회귀 테스트

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- 테스트는 실제 운영 흐름과 동일하게 수행한다.
- 테스트 코드와 운영 코드를 명확히 분리한다.
- 버그 수정 시 동일 시나리오를 회귀 테스트에 추가한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
================================================================================
파일: MASTER_SPEC_누락보강_105_운영정책_통합기준.txt
================================================================================

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- 자동 처리보다 데이터 무결성을 우선한다.
- 운영 상태는 항상 실제 주문 상태와 일치해야 한다.
- 예외 상황은 검토 가능한 형태로 기록한다.
2. 검토관리

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- 자동 처리 불가능한 예외를 관리한다.
- 상태 불일치, 복구 실패, 미해결 주문 등을 대상으로 한다.
- 운영자가 확인 후 복귀 또는 정리한다.
3. 긴급정지

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- 장전, 정규장, 동시호가, 장후 정책을 구분한다.
- 루틴은 시간 정책을 준수한다.
- 운영 상태는 시간 변경 시 즉시 재판정한다.
6. 안정성검사
- 주문 상태 일치
- 보유 상태 일치
- PLAN 상태 일치
- 로그 일치
- 복구 가능 여부 확인
7. 구현 원칙

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
================================================================================
파일: MASTER_SPEC_누락보강_106_루틴엔진_신호처리_통합기준.txt
================================================================================
MASTER_SPEC 누락보강 106 주제 : 루틴 엔진 및 신호 처리 통합 기준
출처 : 작업진행상황대화히스토리 3~8 비교 반영

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
목적 루틴 엔진의 신호 생성부터 메인 엔진 전달까지의 공통 처리 구조와
구현 기준을 통합하여 모든 루틴이 동일한 방식으로 동작하도록 한다.
1. 기본 원칙

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
3. 신호 처리 절차 ① 데이터 수집 ② 지표 계산 ③ 조건 평가 ④ 신호 생성 ⑤
 PLAN 생성 요청 ⑥ 메인 엔진 전달
4. 루틴 책임
- 조건식 평가
- 필터 적용
- 유효조건 확인
- 신호 생성
- 종료 정책 정의
5. 메인 엔진 책임
- PLAN 생성
- 주문 실행
- 체결 관리
- 상태 갱신
- 로그 및 복구
6. 구현 원칙

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- 동일 신호 처리 인터페이스를 사용한다.
- 루틴은 거래소 API를 직접 호출하지 않는다.
- 루틴 추가 시 공통 신호 인터페이스를 유지한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
반영 원칙 본 문서는 기존 누락보강 151~160 수준의 루틴 엔진 및 신호 처리
정책을 통합한 기준 문서이다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- 설계 후 구현을 원칙으로 한다.
- 공통 구조를 우선하고 중복 구현을 지양한다.
- 기능보다 구조 안정성을 우선한다.
- 구현과 문서는 동시에 갱신한다.
2. 코딩 규칙

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- 계층별 책임을 명확히 분리한다.
- 공통 기능은 재사용 가능한 형태로 구현한다.
- 하드코딩을 최소화한다.
- 상태 변경은 명확한 이벤트를 통해 수행한다.
- 예외 처리는 일관된 방식으로 기록한다.
3. 구조 관리 원칙

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- Routine, PLAN, Execution, Management 계층을 유지한다.
- 공통 인터페이스를 변경할 경우 영향 범위를 먼저 분석한다.
- 신규 기능은 기존 구조와의 호환성을 우선 검토한다.
4. MASTER_SPEC 관리 기준

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
반영 원칙 본 문서는 기존 누락보강 161~170 수준의 개발 원칙, 코딩 규칙 및
MASTER_SPEC 관리 기준을 통합한 기준 문서이다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- 기능별 모듈 분리
- UI, 엔진, 데이터, 운영 기능 분리
- 공통 기능은 공용 모듈로 관리
- 순환 참조를 지양한다.
2. 디렉터리 구성

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- GUI
- Engine
- Routine
- Runtime
- Logs
- Stocks
- Config
- Test
- Docs

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
3. 모듈 의존성 Routine → PLAN → Execution → Management 상위 정책은 하위
 실행을 직접 구현하지 않는다.
4. 공통 모듈
- 공통 유틸리티
- 공통 상태 관리
- 공통 로그
- 공통 JSON 처리
- 공통 UI Helper
5. 구현 원칙

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- 모듈 간 역할을 중복하지 않는다.
- 내부 구현보다 공개 인터페이스를 사용한다.
- 변경 영향 범위를 최소화한다.
6. 확장 원칙

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
7. 검증 항목 □ 순환참조 없음 □ 공통 모듈 재사용 □ 계층 의존성 유지 □
 구조 일관성 □ 유지보수성 확보

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
================================================================================
파일:
MASTER_SPEC_누락보강_109_데이터흐름_상태관리_이벤트전달체계_통합기준.txt
================================================================================
MASTER_SPEC 누락보강 109 주제 : 프로젝트 데이터 흐름·상태 관리·이벤트
전달 체계 통합 기준
출처 : 작업진행상황대화히스토리 3~8 비교 반영

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- 데이터는 단방향 흐름을 기본으로 한다.
- 이벤트 발생 → 상태 변경 → UI 갱신 순서를 유지한다.
- 동일 데이터를 여러 위치에서 임의 수정하지 않는다.
2. 상태 관리

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- 상태는 단일 관리 주체를 가진다.
- 내부 상태와 화면 표시 상태를 분리한다.
- 상태 변경은 반드시 기록 가능해야 한다.
3. 이벤트 전달

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- 이벤트 기반 처리 구조를 사용한다.
- 이벤트는 명확한 의미와 단일 책임을 가진다.
- 동일 이벤트의 중복 처리를 방지한다.
4. 계층 간 흐름 Routine → PLAN → Execution → Management → UI
각 계층은 필요한 정보만 전달하며 직접 내부 구현에 의존하지 않는다.
5. 동기화 원칙

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- 상태와 로그를 항상 동기화한다.
- UI는 내부 상태를 기준으로 갱신한다.
- 복구 시 저장된 상태를 기준으로 재구성한다.
6. 구현 원칙

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- 이벤트 없이 상태를 변경하지 않는다.
- 데이터 전달은 공통 인터페이스를 사용한다.
- 상태 불일치 발생 시 운영 정책에 따라 처리한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
7. 검증 항목 □ 데이터 흐름 일관성 □ 이벤트 전달 정상 □ 상태 동기화 □ UI
 반영 정상 □ 로그 일치 □ 복구 일치

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
반영 원칙 본 문서는 기존 누락보강 181~190 수준의 데이터 흐름·상태
관리·이벤트 전달 체계를 통합한 기준 문서이다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- 기능보다 구조를 우선한다.
- 구조보다 철학을 우선한다.
- 임시 해결보다 확장 가능한 설계를 우선한다.
- 구현보다 검증을 우선한다.
3. 자동매매 철학

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- 루틴은 ’언제 매매할 것인가’를 판단한다.
- 메인은 ’어떻게 주문할 것인가’를 수행한다.
- 루틴과 메인의 책임은 명확히 분리한다.
4. 설계 원칙

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- 공통 구조를 최대한 재사용한다.
- 동일 기능은 동일한 정책을 사용한다.
- UI와 엔진은 독립성을 유지한다.
- 정책 변경이 엔진 변경으로 이어지지 않도록 설계한다.
5. UI 철학

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- 실행 흐름을 그대로 표현한다.
- 사용자가 한 화면에서 전체 흐름을 이해할 수 있어야 한다.
- 설정 순서와 실제 처리 순서를 최대한 일치시킨다.
6. 데이터 관리 원칙
- 설정은 데이터로 저장한다.
- 위젯 상태를 직접 저장하지 않는다.
- 공통 데이터 구조를 사용한다.
7. 유지보수 원칙

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- 루틴 추가 시 동일 구조 재사용
- 설정창 공통화
- 엔진 공통화
- 정책 공통화
- 유지보수 비용 최소화

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- 전략과 실행을 분리한다.
- PLAN 중심 구조를 유지한다.
- 공통 기능은 재사용하고 중복 구현을 지양한다.
- 운영 안정성을 기능 추가보다 우선한다.
2. 아키텍처 원칙

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- Routine Layer : 전략 및 신호
- PLAN Layer : 계획 및 상태
- Execution Layer : 주문 및 체결
- Management Layer : 로그, 복구, 운영 관리
- UI Layer : 사용자 표시 및 설정
3. 운영 원칙

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- 이벤트 기반 상태 전이
- 상태와 로그의 일관성 유지
- 예외 발생 시 복구 우선
- 자동 처리 불가 상황은 검토관리 연계
4. 구현 원칙

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- 공통 인터페이스 유지
- 계층 간 책임 분리
- 하위 호환성 유지
- 문서와 구현 동시 갱신
- 테스트 후 반영
5. 유지보수 원칙

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- 구조 변경보다 정책 변경을 우선한다.
- 변경 영향 범위를 사전에 검토한다.
- 버전 및 변경 이력을 관리한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
6. 품질 기준 □ 구조 일관성 □ 데이터 일관성 □ 상태 일관성 □ UI 일관성 □
 로그 및 복구 일관성 □ 장기 확장성

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- 로그인 관리자
- 서버 상태 관리자
- 계좌 관리자
- 실시간 등록 관리자
- TR 관리자
- 주문 관리자
- 체결 관리자
3. 로그인 정책
- 프로그램 시작 시 로그인 확인
- 서버 연결 상태 감시
- 재접속 정책
- 장애 감지 및 운영정지 연계
4. 실시간 처리
- 종목 등록/해제
- 이벤트 분배
- 중복 등록 방지
- 종목별 이벤트 큐 관리
5. TR 처리
- 요청 큐
- 응답 대기
- 연속조회
- 요청 제한 관리
- 실패 재시도 정책
6. 주문 처리
- 주문 요청 표준 인터페이스
- 주문번호 관리
- 정정/취소 처리
- 주문 상태 추적
7. 체결 처리
- 접수
- 확인
- 부분체결
- 전체체결
- 미체결
- 취소
- 내부 PLAN 상태와 동기화

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
8. 이벤트 브로커 OpenAPI 이벤트를 직접 루틴으로 전달하지 않고 공통
 이벤트 브로커를 통해 PLAN 엔진 → 운영엔진 → UI로 전달한다.
9. 장애 대응
- 서버 끊김
- 이벤트 누락
- 주문 응답 지연
- 체결 불일치
- 재로그인
- 상태 복구
10. 로그
- 로그인
- TR
- 실시간
- 주문
- 체결
- 오류
- 복구
11. 구현 원칙

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- OpenAPI 의존성은 Adapter 계층으로 제한한다.
- 루틴은 OpenAPI 객체를 직접 사용하지 않는다.
- 이벤트는 공통 인터페이스를 통해 전달한다.
12. 향후 확장
- 다른 증권사 API 추가
- 모의투자/실거래 공통 인터페이스
- 멀티 브로커 구조 대응

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
반영 원칙 본 문서는 기존 01~110에 포함되지 않았던 OpenAPI 연동 구조를
신규 추가한 설계 문서이다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
================================================================================
파일: MASTER_SPEC_누락보강_112_종목관리엔진_종목생명주기설계_신규.txt
================================================================================
MASTER_SPEC 누락보강 112 주제 : 종목관리 엔진 및 종목 생명주기 설계
(신규)
※ 본 문서는 기존 01~111과 중복되지 않는 종목관리 엔진의 내부 설계를 신규
정의한다.
1. 목적 프로젝트 전체에서 종목 등록부터 운영 종료까지의 생명주기를
 표준화한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
2. 종목 생명주기 ① 등록 대기 ② 등록 완료 ③ 루틴 지정 ④ 운영 준비 ⑤ 운영
 중 ⑥ 일시정지 ⑦ 검토관리 ⑧ 복귀 ⑨ 운영 종료 ⑩ 보관/삭제
3. 종목 객체 관리

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- 종목코드
- 종목명
- 루틴 연결
- 운영 상태
- PLAN 상태
- 예산 상태
- 주문 상태
- 보유 상태
- 로그 참조
4. 종목 상태 전이 상태 변경은 이벤트 기반으로만 수행하며, 운영 엔진이
 단일 관리 주체가 된다.
5. 종목 등록 정책
- 중복 등록 방지
- 루틴 미지정 허용 여부 정책
- 자동 초기화
- 설정 검증 후 활성화
6. 검토관리 연계 다음 상황은 검토관리 대상으로 전환할 수 있다.
- 상태 불일치
- 주문 이상
- 체결 이상
- 복구 실패
- 운영 정책 위반
7. 복구 정책
- 재시작 시 종목 상태 복원
- PLAN 및 주문 상태 재동기화
- 운영 가능 여부 재판정
8. UI 연계
- 관제창
- 종목 등록창
- 검토관리창
- 상태 표시
- 색상 정책
9. 구현 원칙

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- 종목은 독립 객체로 관리한다.
- 루틴과 종목을 직접 결합하지 않는다.
- 운영 상태는 공통 인터페이스로 조회한다.
10. 향후 확장
- 다중 계좌
- 다중 시장
- 종목 그룹
- 우선순위 운영
반영 원칙 본 문서는 종목관리 엔진과 종목 생명주기를 신규 설계한 기준
문서이다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- 예산 부족 시 신규 PLAN 생성 제한
- 예산 변경 이력 기록
- 재시작 시 예약예산 재검증
- 예산 불일치 시 검토관리 연계
9. 향후 확장
- 계좌별 예산
- 시장별 예산
- 통화별 예산
- 전략별 예산 풀
10. 구현 원칙

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
================================================================================
파일:
MASTER_SPEC_누락보강_114_실시간데이터수집_캐시_동기화아키텍처_신규.txt
================================================================================
MASTER_SPEC 누락보강 114 주제 : 실시간 데이터 수집·캐시·동기화 아키텍처
(신규)
※ 본 문서는 기존 01~113과 중복되지 않는 실시간 데이터 처리 구조를 신규
정의한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
1. 목적 실시간 시세와 체결 데이터를 안정적으로 수집하고 내부 엔진에
 일관되게 전달하기 위한 데이터 처리 아키텍처를 정의한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
2. 데이터 계층 ① OpenAPI 실시간 수신 ② 이벤트 수집기 ③ 데이터 정규화 ④
 실시간 캐시 ⑤ 이벤트 브로커 ⑥ 엔진 전달 ⑦ UI 반영
3. 수집 대상
- 현재가
- 호가
- 체결
- 거래량
- 장상태
- 계좌 이벤트
- 주문 이벤트
4. 실시간 캐시

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- 종목별 최신 데이터 유지
- 마지막 수신 시각 기록
- 변경 항목만 갱신
- 엔진은 캐시를 조회하여 처리
5. 동기화 정책

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- 이벤트 순서를 보존한다.
- 동일 이벤트의 중복 처리를 방지한다.
- 캐시와 내부 상태를 주기적으로 검증한다.
6. 데이터 검증
- 누락 감지
- 시간 역전 감지
- 비정상 가격 감지
- 장상태 일치 여부
- 종목 등록 상태 확인
7. 장애 대응
- 이벤트 누락
- 실시간 해제
- 서버 재접속
- 캐시 재생성
- 동기화 재검증
8. 성능 정책
- 불필요한 UI 갱신 최소화
- 변경 데이터만 전달
- 종목 단위 처리
- 큐 기반 비동기 처리
9. 향후 확장
- 멀티 계좌
- 멀티 브로커
- 멀티 시장
- 실시간 데이터 저장소 연계
10. 구현 원칙

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- OpenAPI 이벤트를 직접 UI나 루틴으로 전달하지 않는다.
- 실시간 캐시를 단일 진실 공급원(Source of Truth)으로 사용한다.
- 모든 엔진은 공통 이벤트 브로커를 통해 데이터를 수신한다.
반영 원칙 본 문서는 실시간 데이터 수집, 캐시 및 동기화 구조를 신규
정의한 설계 문서이다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
================================================================================
파일: MASTER_SPEC_누락보강_115_장애복구_운영자동화아키텍처_신규.txt
================================================================================
MASTER_SPEC 누락보강 115 주제 : 장애 복구 및 운영 자동화 아키텍처 (신규)
※ 본 문서는 기존 01~114와 중복되지 않는 장애 복구 및 운영 자동화 구조를
신규 정의한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
1. 목적 프로그램 장애, API 오류, 네트워크 단절, 비정상 종료 상황에서도
 자동매매 시스템의 무결성을 유지하기 위한 복구 체계를 정의한다.
2. 복구 대상

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- 프로그램 비정상 종료
- OpenAPI 연결 해제
- 주문 응답 누락
- 체결 불일치
- 실시간 데이터 중단
- 내부 예외

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
3. 복구 단계 ① 장애 감지 ② 신규 주문 중지 ③ 현재 상태 보존 ④ 로그 기록
 ⑤ 복구 가능성 분석 ⑥ 자동 복구 수행 ⑦ 무결성 검사 ⑧ 운영 재개 또는
 검토관리
4. 자동 복구 엔진

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- 로그인 재시도
- 실시간 재등록
- TR 재조회
- PLAN 상태 재동기화
- 주문 상태 재조회
- 계좌 상태 재조회
5. 무결성 검사

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- 보유 수량 일치
- 주문 상태 일치
- PLAN 상태 일치
- 예산 상태 일치
- 종목 상태 일치
- 로그 일관성 확인
6. 운영 자동화

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- 정기 상태 점검
- 시간 정책 자동 재판정
- 실시간 연결 감시
- 이상 징후 자동 탐지
- 운영 알림 생성
7. 검토관리 연계 다음 경우 자동 복구를 중단하고 검토관리로 전환한다.
- 복구 실패
- 데이터 불일치 지속
- 반복 장애
- 수동 확인 필요
8. 향후 확장
- 다중 서버 감시
- 이중화 환경
- 원격 모니터링
- 자동 장애 리포트
9. 구현 원칙

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- 복구보다 데이터 무결성을 우선한다.
- 복구 과정은 모두 로그로 기록한다.
- 운영 재개 전 반드시 무결성 검사를 완료한다.
반영 원칙 본 문서는 장애 복구 및 운영 자동화 아키텍처를 신규 정의한 설계
문서이다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
================================================================================
파일:
MASTER_SPEC_누락보강_116_루틴패키지_배포_설치_업데이트아키텍처_신규.txt
================================================================================
MASTER_SPEC 누락보강 116 주제 : 루틴 패키지 배포·설치·업데이트 아키텍처
(신규)
※ 본 문서는 기존 01~115와 중복되지 않는 루틴 패키지의 배포 및 관리
구조를 신규 정의한다.
1. 목적 루틴을 프로그램 수정 없이 추가·업데이트·제거할 수 있는 표준
 패키지 구조를 정의한다.
2. 목표

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- 파일 배치만으로 루틴 자동 인식
- 설치 프로그램 불필요
- 기존 루틴과 독립 운영
- 버전 호환성 유지
3. 표준 패키지 구성

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- 루틴은 플러그인처럼 독립 동작한다.
- 메인 프로그램은 패키지 규격만 의존한다.
- 배포 절차는 운영 환경과 개발 환경에서 동일해야 한다.
반영 원칙 본 문서는 루틴 패키지 배포·설치·업데이트 체계를 신규 정의한
설계 문서이다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
================================================================================
파일:
MASTER_SPEC_누락보강_117_다중루틴_스케줄링_실행우선순위엔진_신규.txt
================================================================================
MASTER_SPEC 누락보강 117 주제 : 다중 루틴 스케줄링 및 실행 우선순위 엔진
(신규)
※ 본 문서는 기존 01~116과 중복되지 않는 다중 루틴 실행 제어 구조를
정의한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
1. 목적 복수의 자동매매 루틴이 동시에 동작하는 환경에서 실행 순서와
 자원 배분을 일관성 있게 관리하기 위한 스케줄링 엔진을 정의한다.
2. 설계 목표
- 루틴 간 독립성 유지
- 실행 충돌 방지
- 예산 및 주문 경쟁 최소화
- 공정한 실행 순서 보장

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
3. 스케줄링 계층 ① 이벤트 수신 ② 실행 대상 선별 ③ 우선순위 계산 ④ 실행
 큐 생성 ⑤ 실행 ⑥ 결과 반영
4. 우선순위 요소

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- 운영 상태
- 시간 정책
- 루틴 우선순위
- 종목 상태
- PLAN 진행 상태

Original Body Marker: END

---

Reference Navigation

- Previous: PART03_03_GUI.md
- Next: PART03_05_GUI.md
- Full PART: PART03_GUI.md
- INDEX: 00_REFERENCE_INDEX.md
- Original Canonical: ../CURRENT/MASTER_SPEC_CANONICAL_2026-07-08_EXECUTION_SENDORDER_CHEJAN_LIFECYCLE_PIPELINE.txt
