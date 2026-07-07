# PART04_02 ROUTINE

Reference Edition Subpart

Original Canonical: MASTER_SPEC_CANONICAL_2026-07-07_RULE_APPLY_PREVIEW_EXECUTION_PREVIEW_CONTROLLER.txt

Source Full Part: PART04_ROUTINE.md

생성일: 2026-07-07

주의: 본 문서는 AI 참조용 하위 분할본이며 공식 원본은 CURRENT의 Canonical이다.

Original Body Marker: START
---
오실레이터 하락
↓
상승 전환
---
10. 매수 판정
---
최저점 확정
*
전환 확인
---
11. 매수 필터
---
선택 적용.
---
12. RSI 필터
---
지원.
---
13. RSI 예시
---
RSI 50 이하.
---
14. 이동평균 필터
---
지원.
---
15. 이동평균 예시
---
5일선
10일선
20일선
---
16. 가격비교 필터
---
지원.
---
17. 봉 비교 필터
---
지원.
---
18. 논리 조건
---
AND
OR
NOT
---
19. 매도 주신호
---
오실레이터 상승
↓
하락 전환
---
20. 매도 주신호
---
수익률 도달.
---
21. 수익률 조건
---
+n%
---
22. 매도 조건 결합
---
AND
OR
---
23. 매도 보조필터
---
RSI
이동평균
가격비교
---
24. 다중매수 지원
---
지원.
---
25. 추가진입 조건
---
Position Policy 기준.
---
26. 추가진입 횟수
---
정책 기반.
---
27. 목표체결율
---
지원.
---
28. 목표체결율 미달
---
재매수 가능.
---
29. 주문 방식
---
시장가
현재가
---
30. 현재가 실패
---
재시도 가능.
---
31. 재시도 조건
---
시간
가격
봉 수
---
32. 분할진입
---
지원 가능.
---
33. 분할청산
---
지원 가능.
---
34. 루틴 책임
---
신호 생성.
---
35. 루틴 책임
---
필터 판단.
---
36. 루틴 금지사항
---
주문 실행 금지.
---
37. 루틴 금지사항
---
상태 변경 금지.
---
38. 루틴 금지사항
---
예산 계산 금지.
---
39. 메인엔진 역할
---
주문 실행.
---
40. 메인엔진 역할
---
상태 관리.
---
41. 메인엔진 역할
---
예산 관리.
---
42. 메인엔진 역할
---
검토관리.
---
43. 저장 구조
---
routine.json
rules.json
---
44. routine.json 역할
---
루틴 정보 저장.
---
45. rules.json 역할
---
전략 규칙 저장.
---
46. MACD 루틴 핵심 철학
---
루틴은 신호 생성기이다.
주문은 메인엔진이 수행한다.
---
47. PART 17 핵심 요약
---
MACD 오실레이터 기반 신호를 사용한다.
1봉 기준을 기본으로 사용한다.
Position Policy와 Price Policy를 통해 실제 진입이 결정된다.
END OF PART 17
MASTER_SPEC_v3.0_BASELINE
제5권
PART 18. 안정성검사 및 Reset Complete 정책
문서등급 : 최상위 기준 문서
작성일 : 2026-06

[출처: 마스터스펙_갱신자료_STEP44\작업진행상황대화히스토리_5.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-18 17:43:02 | 분류: 대화히스토리]
BUY_POLICY
단일매수
BUY
↓
1회 주문
다중매수
BUY
↓
기준가격 생성
↓
다중 가격대 생성
↓
각 가격대별 주문 집행
그리고 여기서 중요한 점.
현재 네 설계를 보면
다중매수
는 사실
매수 실패 대응
이 아니다.
오히려
최초부터 계획된 진입전략
이다.
예:
MACD BUY
발생.
루틴은 처음부터:
100%
한번에 사지마
20%
20%
20%
20%
20%
를 계획.
즉
단일매수
와
다중매수
는 동급이다.
그래서 현재 개념은 이렇게 정리된다.
매수방식
1. 단일매수
2. 다중매수
그리고 그 아래에
미체결 대응정책
이 별도로 존재.
이렇게 분리하면 구조가 깔끔해진다.
그래서 다음 단계는:
다중매수
설정항목
매수 횟수
가격 간격
(% / 호가)
비율
잔량처리
유효봉
중에서 가격 간격을 % 기준으로 할지, 호가 기준으로 할지, 둘 다 지원할지를 먼저 정해야 한다.
내 생각에는 둘 다 지원해야 한다.
왜냐하면:
저가주
고가주
의 호가 단위 차이가 너무 크기 때문이다.
오키...호가도 중요하고 비율도 중요하다..
맞다.
방금 이야기하면서 보니까 다중매수의 핵심 설정은 사실 3개다.
1. 가격 기준
2. 비율 기준
3. 미체결 처리
1. 가격 기준
% 방식
예:
신호가 10000
1차 10000
2차 -0.5%
3차 -1.0%
4차 -1.5%
장점
직관적
호가 방식
예:
1차 현재가
2차 -2호가
3차 -4호가
4차 -6호가
장점
실제 주문 느낌
둘 다 지원
이게 맞아 보임.
2. 비율 기준
균등
20
20
20
20
20
증가형
10
15
20
25
30
하락할수록 많이 매수.
사용자 지정
10
20
30
40
직접 입력.
이건 반드시 사용자 지정이 있어야 함.
3. 미체결 처리
이게 지금부터 중요.
예:
5회 다중매수
설정.
근데
1차 체결
2차 체결
3차 미도달
4차 미도달
5차 미도달
상황.
그럼?

[출처: 마스터스펙_갱신자료_STEP44\작업진행상황대화히스토리_5.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-18 17:43:02 | 분류: 대화히스토리]
BUY 신호 → 매수계획 생성
MACD BUY 발생
↓
매수계획 생성
↓
매수계획 진행
↓
완료 / 미완성
여기까지는 공통.
그리고
미완성
상태가 되면
즉시 실패가 아니라
루틴이 정의한 유효조건 확인
으로 간다.
예:
현재가 매수
100만원 목표
40만원 체결
60만원 미체결
↓
매수 미완성
↓
루틴 확인
유효봉 3봉
현재 2봉 경과
↓
재매수 허용
↓
잔여 60만원 재매수
반대로
유효봉 종료
↓
60만원 미체결 유지
↓
매수 실패
↓
후속정책
그래서 지금 새로 정리되는 구조는
BUY
↓
매수계획
상태
1. 진행중
2. 완료
3. 미완성
4. 실패
이다.
그리고 여기서 다음으로 정해야 할 것은 사실
매수 실패 후 정책
이다.
왜냐하면 우리는 이미:
미완성
≠ 실패
를 확정했기 때문이다.
그러면 이제 남는 건:
실패
가 되었을 때
루틴이 뭘 할 것인가.
예:
1. 종료
2. 검토관리
3. 새로운 BUY 신호 대기
4. 강제 시장가
5. 다른 가격조건으로 재계획
내 생각에는 여기서부터는 MACD 루틴의 철학이 들어가기 시작한다.
그래서 다음 논의는:
매수 실패 후
MACD 루틴은 어떤 행동을 해야 하는가?
를 정하는 단계다.
여기서부터는 메인이 아니라 루틴 영역이다.

[출처: 마스터스펙_갱신자료_STEP44\작업진행상황대화히스토리_5.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-18 17:43:02 | 분류: 대화히스토리]
이 루틴의 핵심은 신호가 아니다.
이 루틴의 핵심은 평단이다.
그래서 내가 아까 일반적인 자동매매 관점으로 계속 생각하니까 자꾸 어긋났던 거다.
일반 자동매매는
신호
↓
진입
↓
청산
이다.
근데 네 MACD 루틴은
신호
↓
평단 구축
↓
평단 관리
↓
청산
이다.
그러면 많은 개념이 바뀐다.
예를 들어.
일반 자동매매
BUY 실패
↓
기회 상실
네 루틴
BUY 실패
↓
평단 구축 실패
완전히 다른 문제다.
그래서
매수 완료
라는 개념도 애매해진다.
예를 들면.
1차 매수
성공.
그 후
추매 구간
안 옴.
그러면.
매수 미완성
인가?
아니다.
오히려.
평단 구축 완료
일 수도 있다.
왜냐하면 주가가 계속 올라가 버렸으니까.
그래서 이제 보이는 구조는.
핵심 관리 대상
기존
주문
↓
아님.
현재
평단
이다.
루틴은 계속:
현재 평단
현재 가격
현재 보유비중
잔여 예산
을 의식하게 된다.
그래서 앞으로는
매수 실패
라는 표현보다.
평단 구축 실패
또는
포지션 구축 실패
가 더 맞을 수 있다.
그리고 이 개념이 맞다면.
다음으로 정해야 할 가장 중요한 건.
루틴 목표
이다.
예를 들어.
목표
100만원
인가.
아니면.
목표
5회차 완성
인가.
아니면.
목표
평단과 현재가 괴리
n%
이내
인가.
왜냐하면.
지금 네 철학은.
몇 주 샀는가
보다.
현재 평단이 어디인가
를 더 중요하게 보고 있기 때문이다.
그래서 내가 보기엔 이제부터는 주문 중심 사고를 버리고 "평단 중심 사고"로 루틴을 다시 정의해야 한다.
그 순간 다중매수, 추매, 재매수, 매수실패, 능동매수 개념들이 전부 하나로 연결된다.

[출처: 마스터스펙_갱신자료_STEP44\작업진행상황대화히스토리_5.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-18 17:43:02 | 분류: 대화히스토리]
routines/
 ├─ MACD_보수형
 ├─ MACD_공격형
 ├─ RSI_반등형
 └─ 추세추종형
각 루틴이 자기 전략을 전부 들고 있고.
종목은:
삼성전자
→ MACD_공격형
→ 진입예산 50만원
SK하이닉스
→ MACD_공격형
→ 진입예산 100만원
이 정도만 들고 있으면 된다.
그리고 이 방향이면 루틴 설정창도 자연스럽다.
루틴 클릭
↓
루틴 설정창
여기서 전략 관련 옵션 전부 설정.
종목 클릭
↓
종목 설정창
여기서는
진입예산
또는
진입주수
정도만 설정.

[출처: 마스터스펙_갱신자료_STEP44\작업진행상황대화히스토리_5.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-18 17:43:02 | 분류: 대화히스토리]
매수 신호 예를 들어 보자 macd 오실레이터 상승추세전환 시 rsi 기준선 50이하 이고 20이평선 5봉전 가격이 현재 봉 가격보다 높으면 신호없음...과 기준선 50이하이거나 5벙전 가격이 현재봉보다 가격이 높거나......커버가 되나?
된다.
사실 네가 방금 든 예시는 내가 앞에서 말한
필터는 제한기
개념을 그대로 보여준다.
주신호
MACD OSC 상승전환
발생.
필터 1
RSI < 50
필터 2
5봉전 가격 > 현재봉 가격
(즉 최근 5봉 기준 하락상태)
경우 1
필터 전체 AND
MACD BUY
AND
RSI < 50
AND
5봉전가격 > 현재가격
이 경우
3개 모두 만족
해야 BUY 발생.
경우 2
필터 전체 OR
MACD BUY
AND
(
RSI < 50
OR
5봉전가격 > 현재가격
)
이 경우
둘중 하나만 만족
해도 BUY 발생.
경우 3
필터 NOT
예:
MACD BUY
AND
RSI < 50
AND
NOT(5봉전가격 > 현재가격)
즉
최근 5봉 하락중이면 매수 금지
같은 것도 가능.
그래서 구조적으로는 충분히 커버된다.
오히려 지금 이야기하면서 느끼는 건.
우리가 앞에서
필터 = AND
로 단순하게 생각했는데.
실전에서는 네가 방금 든 예처럼
(RSI 조건)
AND
(가격조건)
도 있고
(RSI 조건)
OR
(가격조건)
도 있다.
그러면 결국 내부 구조는.
필터A
연결자
필터B
연결자
필터C
형태를 지원해야 한다.
예:
MACD BUY
AND
RSI < 50
OR
5봉전가격 > 현재가격
AND
거래량 증가
이런 조합까지.
그래서 결론은.
로직 엔진
AND
OR
NOT
전부 지원.
UI
처음에는
필터 추가
연결자 선택
AND / OR
NOT 체크
형태로 가는 게 맞다.
오히려 지금 보니까
필터는
제한기
라기보다
조건식 빌더
에 가까워지고 있다.
그리고 이 구조를 만들면 나중에
MACD 루틴
RSI 루틴
조건검색식 루틴
전부 같은 필터 엔진을 재사용할 수 있다.

[출처: 마스터스펙_갱신자료_STEP44\작업진행상황대화히스토리_5.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-18 17:43:02 | 분류: 대화히스토리]
이평선 비교는 당일 봉만 보지 말고 연속 캔들 기준으로 계산
그래야 9시 직후에도 20MA 방향 필터가 동작한다.
오키..해보면서 결정..다음고고
좋다.
지금까지 보면.
MACD
RSI
이평선 방향
까지는 거의 윤곽이 나왔다.
다음은
가격비교 필터
이다.
이건 사실 이평선보다 더 강력할 수 있다.
예를 들어.
현재가
와
5봉전 가격
비교.
조건.
현재가 > 5봉전 가격
의미.
최근 5봉 기준 상승중
반대로.
현재가 < 5봉전 가격
의미.
최근 5봉 기준 하락중
이걸 매수 필터로 쓰면.
예.
MACD BUY
발생.
추가 필터.
현재가 < 5봉전 가격
그러면.
하락 추세에서만 매수
가능.
반대로.
현재가 > 5봉전 가격
이면.
상승 확인 후 매수
가능.
이 필터의 좋은 점.
5봉
10봉
20봉
바꾸기만 하면.
단기추세
중기추세
전부 표현 가능.
그래서 현재 V1 구조는.
RSI 필터
이평선 방향 필터
가격비교 필터
3개.
그리고 가격비교 필터는.
비교대상
현재가
시가
고가
저가
종가
중 선택.
비교기준.
N봉전 동일가격
조건.
크다
작다
정도면 충분할 것 같다.
다만 여기서 하나 결정해야 한다.
가격비교 필터를
현재가 vs N봉전 현재가
만 둘 것인가.
아니면.
현재가 vs N봉전 고가
현재가 vs N봉전 저가
현재가 vs N봉전 종가
까지 허용할 것인가.
내 생각에는 V1부터 후자가 맞다.
왜냐하면 구현 난이도는 거의 차이 없는데 활용도는 훨씬 높아진다.
다음은 이 부분을 정하면 될 것 같다.
가격 비교 필터는 허점이 너무 많아 안된다....이게 갑자기 왜 나왔나?
맞다. 가격비교 필터는 내가 잘못 끌고 왔다.
현재 확정 범위는:

[출처: 마스터스펙_갱신자료_STEP44\작업진행상황대화히스토리_5.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-18 17:43:02 | 분류: 대화히스토리]
RSI 필터
이평선 방향 필터
이고, 네가 말한 가격 비교는 현재가 vs 과거가가 아니라 이평선 현재값 vs 이평선 과거값이었다.
그래서 정리:
가격비교 필터 ❌
이평선 방향 필터 ⭕
V1 필터는 여기까지만 가자.
1. RSI
2. 이평선 방향
매수:
MACD OSC 상승전환
+ RSI 과매도 필터
+ 이평선 방향 필터
매도:

[출처: 마스터스펙_갱신자료_STEP44\작업진행상황대화히스토리_5.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-18 17:43:02 | 분류: 대화히스토리]
수익률 SELL / MACD OSC 하락전환
+ RSI 과매수 필터
+ 이평선 방향 필터
가격비교 필터는 폐기.

[출처: 마스터스펙_갱신자료_STEP44\작업진행상황대화히스토리_5.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-18 17:43:02 | 분류: 대화히스토리]
이평선 각격 비교의 주목적은 상승/하락 추세의 강도를 보려고 한다..단순 가격이 높고 낮고를 판단할게 아니고 기울기에 대한 값을 이전값과 현재값의 상승/하락 비율도 봐야한다.
아... 이건 완전히 다른 이야기네.
지금까지 나는:
현재 20MA > 5봉전 20MA
정도만 생각했는데.
네가 말하는 건 사실:
기울기
를 보겠다는 거다.
예를 들어.
경우 A
5봉전 20MA = 1000
현재 20MA = 1001
상승.
경우 B
5봉전 20MA = 1000
현재 20MA = 1030
상승.
둘 다:
현재 > 과거
라서 기존 로직은 동일 판정.
근데 실제 의미는 완전히 다르다.
A = 거의 횡보
B = 강한 상승
그래서 네가 보고 싶은 건.
단순 방향이 아니라.
상승률
하락률
기울기 강도
다.
예를 들면.
(현재20MA - 5봉전20MA)
/ 5봉전20MA
× 100
결과.
+0.05%
이면.
약한 상승
+3%
이면.
강한 상승
-2%
이면.
하락
이건 사실 필터라기보다.
추세강도 필터
에 가깝다.
그래서 V1도 생각보다 단순하게 가능하다.
예:
이평선 기간
20
비교봉수
5
조건
상승률 >= 1%
하락률 <= -1%
매수 예.
20MA 5봉기준 상승률 >= 0.5%
매도 예.
20MA 5봉기준 상승률 <= 0%
이렇게.
솔직히 이 개념은 꽤 괜찮다.
왜냐하면.
20MA 상승중인가?
보다.
20MA가 얼마나 강하게 상승중인가?
를 볼 수 있기 때문이다.
그래서 현재 정리하면.
RSI 필터는:
과매수
과매도
확인.
이평선 필터는:
방향
이 아니라.
기울기 강도
확인.
이게 네가 원래 의도한 개념에 훨씬 가까워 보인다.
다음
좋다.
지금까지 정리된 걸 보면.
MACD
RSI
이평선 기울기 강도
까지 왔다.
그 다음은 사실 0봉/1봉이다.
이건 별거 아닌 것 같지만 실제 자동매매에서는 엄청 중요하다.
0봉
예:
09:05 봉 진행중
MACD 상승전환 발생
즉시.
BUY
신호.
장점
빠름
저점 진입 가능
단점
페이크 신호 많음
봉 마감시 신호 사라질 수 있음
1봉
예:
09:05 봉 마감
MACD 상승전환 확정
↓
09:06부터 BUY
장점
신뢰도 높음
백테스트 일치성 좋음
단점
진입이 늦음
근데 여기서 네 철학은 이미 거의 정해져 있다.
예전에 여러 번 이야기했듯.
디폴트 = 1봉
선택 = 0봉 허용
이다.
그리고 중요한 부분.
0봉은 단순히:
0봉 체크
가 아니다.
예를 들어.
0봉 BUY 발생
↓
매수 실패
↓
봉 마감
↓
신호 사라짐
이때 어떻게 할 것인가?
이 문제가 생긴다.
---
그래서 내가 보기엔 다음으로 정해야 할 건.
# 0봉 신호의 생명주기
이다.
예:
```text
0봉 BUY 발생
↓
주문 접수
↓
체결 안됨
↓
봉 마감
↓
신호 소멸
이 상황을.
유효 신호로 계속 볼 것인가
무효 처리할 것인가
이건 네가 계속 말한:
매수신호 발생
=
반드시 대응해야 함
철학과 직결된다.

[출처: 마스터스펙_갱신자료_STEP44\작업진행상황대화히스토리_5.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-18 17:43:02 | 분류: 대화히스토리]
그리고 내 생각엔 이건 루틴보다는 메인 주문관리 계층이 들고 있어야 할 가능성이 높다. 왜냐하면 MACD든 RSI든 다른 루틴이든 미체결 취소 자체는 공통 문제이기 때문이다.
한가지 더 미체결 취소는 어디서 하는가?
미체결 취소는 메인 주문관리 계층에서 하는 게 맞다.
이유는 간단하다.

[출처: 마스터스펙_갱신자료_STEP44\작업진행상황대화히스토리_5.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-18 17:43:02 | 분류: 대화히스토리]
비활성
최초 BUY 상한
최초 BUY 하한
양방향 제한
사용자 지정 범위
이렇게 두 층으로 나누는 게 가장 유연하다.
그리고 이건 MACD뿐 아니라 나중에 다른 루틴을 만들 때도 그대로 재사용 가능하다.
지금 단계에서 보면 Position Policy는 거의 범용 포지션 엔진 형태로 가고 있다.
다음으로 가면 이제 남은 건
추가 BUY 최대 회차수
를 둘 것인가,
아니면
메인 예산 한도만 있으면 무제한
으로 둘 것인가의 문제다.

[출처: 마스터스펙_갱신자료_STEP44\작업진행상황대화히스토리_5.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-18 17:43:02 | 분류: 대화히스토리]
routine_name = MACD매매루틴
routine_instance_id = MACD_001 / MACD_002 / MACD_003
display_name = MACD 단타형 / MACD 보수형 / MACD 공격형
구조다.
핵심 변경
루틴 파일 원본:
routines/MACD매매루틴/
은 그대로 하나.
하지만 등록 시에는 인스턴스가 여러 개 생김.

[출처: 마스터스펙_갱신자료_STEP44\작업진행상황대화히스토리_5.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-18 17:43:02 | 분류: 대화히스토리]
registered_routines/
 MACD_001.json
 MACD_002.json
 MACD_003.json
각 인스턴스가 서로 다른 설정을 가짐.

[출처: 마스터스펙_갱신자료_STEP44\작업진행상황대화히스토리_5.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-18 17:43:02 | 분류: 대화히스토리]
MACD_001 = X3, 하락추가매수
MACD_002 = 고정금액, 상승추종
MACD_003 = 분할매도 보수형
종목 연결도 이름이 아니라 ID 기준
삼성전자 → MACD_001
LG전자 → MACD_002
이렇게 해야 한다.

[출처: 마스터스펙_갱신자료_STEP44\작업진행상황대화히스토리_5.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-18 17:43:02 | 분류: 대화히스토리]
필수 원칙
루틴 원본 = 기능 템플릿
루틴 인스턴스 = 실제 운영 설정
종목은 루틴 인스턴스에 연결
이 기능 없으면 나중에 같은 MACD라도 공격형/보수형을 동시에 못 돌린다.
다음은 이 구조를 routine_instance_policy.json으로 잡는 게 맞다.
일단 나중에 메인엔진 수정에서 다시 해보는걸로 하고 어지간 하면 이제 루틴구현가야지
맞다. 동일루틴 중복등록은 보류하고, 메인엔진 수정 때 다시 다루는 게 맞다.
지금은 루틴 구현으로 넘어갈 시점이다.
진행 순서는 이렇게 잡으면 된다.

[출처: 마스터스펙_갱신자료_STEP44\작업진행상황대화히스토리_5.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-18 17:43:02 | 분류: 대화히스토리]
갱신본으로 만든다. 원본 내용은 유지하고, STEP08~STEP20 구현 검증 결과를 해당 PART 안에 추가 반영하는 방식으로 처리한다.
8s 동안 생각함
수정본 파일 생성 완료.
MASTER_SPEC_v3.0_BASELINE_5_8_STEP08_20_갱신본.txt
MASTER_SPEC_v3.0_BASELINE_13_16_STEP08_20_갱신본.txt
반영 방식은 원본 유지 + STEP08~STEP20 구현 검증 결과 추가다.
MASTER_SPEC_v3.0_BASELINE_ (2).zip
ZIP 아카이브
-------------------------------------------------------
MASTER_SPEC_v3.0_BASELINE_ (2).zip
ZIP 아카이브
작업진행상황대화히스토리_5(7).txt
문서
kiwoom_auto (41).zip
ZIP 아카이브
02_MACD루틴구현진행결과보고서_v2026-06-18(1).txt
문서
01_작업재개요약서_v2026-06-18(1).txt
문서
STEP13_실제주문_안전요구사항(1).txt
문서
파일의 모든것을 빼먹지 말고 파악해
kiwoom_auto (42).zip
ZIP 아카이브
파악해보고 결정해봐
kiwoom_auto (41)(1).zip
ZIP 아카이브
이걸로 돌아가는게 맞나?
이 문서는 만들 가치가 있다.
왜냐하면 이번 일은 단순 실수가 아니라,

[출처: routine_policy_draft_v3\루틴실행정책_개념정리_v3.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-16 23:45:08 | 분류: 운영정책]
백테스트 전에 위 3개 모드를 모두 구현해야 한다.
이유:
- MACD, 볼린저밴드, 엔벨로프 등 루틴별로 신호 특성이 다르다.
- 단일 방식만 구현하면 전략 비교가 제한된다.
- 다중호가 + 다중지점 조합의 체결 효율을 비교하려면 내부 정책 표현이 먼저 완성되어야 한다.
5. 메인/루틴 역할

[출처: routine_policy_draft_v2\루틴실행정책_개념정리_v2.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-16 23:31:32 | 분류: 운영정책]
위 파일들은 설계 확정 후 routines/MACD매매루틴/ 내부에 둘 수 있으며, 다른 루틴에서도 같은 형식을 재사용할 수 있게 한다.

[출처: routine_policy_draft_v1\루틴실행정책_개념정리_v1.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-16 23:19:00 | 분류: 운영정책]
작성 목적:
- MACD 오실레이터 루틴을 시작점으로 하되, 볼린저밴드/엔벨로프/RSI 등 다른 루틴에서도 재사용 가능한 실행정책 구조를 정의한다.
- 메인파트는 고정 실행 행동을 담당하고, 루틴은 기법별 신호와 실행정책을 담당한다.
1. 기본 역할 분리

[출처: routine_policy_draft_v1\루틴실행정책_개념정리_v1.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-16 23:19:00 | 분류: 운영정책]
위 파일들은 routines/MACD매매루틴/ 내부에 둘 수 있으며, 다른 루틴에서도 같은 형식을 재사용할 수 있게 한다.

[출처: 05_운영정책_테스트체크리스트_v2026-06-16_종목폴더통합_검토관리_최신갱신.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-16 17:45:20 | 분류: 갱신문서]
MACD 루틴 V1
매수:
- MACD 오실레이터 상승전환(주신호)
- RSI(필터)
- 이평선 기울기(필터)

[출처: 05_운영정책_테스트체크리스트_v2026-06-16_종목폴더통합_검토관리_최신갱신.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-16 17:45:20 | 분류: 갱신문서]
매도:
- 상승비율(주신호)
- MACD 오실레이터 하락전환(주신호)
- RSI(필터)
- 이평선 기울기(필터)
RSI 정책
- 매수: N일 RSI 50/40/30 이하
- 매도: N일 RSI 50/70/85 이상

[출처: 05_운영정책_테스트체크리스트_v2026-06-16_종목폴더통합_검토관리_최신갱신.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-16 17:45:20 | 분류: 갱신문서]
루틴관리 용어:
- 루틴 지정: 등록된 종목에 MACD매매루틴 같은 자동매매 루틴을 연결한다.
- 루틴 해제: 종목은 유지하고 루틴 연결만 제거한다.

[출처: 05_운영정책_테스트체크리스트_v2026-06-16_종목폴더통합_검토관리_최신갱신.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-16 17:45:20 | 분류: 갱신문서]
완료 또는 확인된 내용:
- 중앙 stocks/ 종목폴더 기준으로 종목 등록이 가능하다.
- 수동등록창에서 종목 등록이 가능하다.
- 수동등록창 헤더 정렬 기능을 추가했다.
- 수동등록창 우클릭 메뉴를 추가했다.
 - 전체 선택
 - 전체 해제
 - 선택 등록
- 매매루틴지정창에서 루틴 지정/해제가 가능하다.
- 루틴 지정 시 더 이상 _MACD매매루틴/종목폴더가 새로 생성되지 않도록 패치했다.
- 자동매매설정창은 중앙 stocks 기준으로 루틴 연결 종목을 표시한다.
- 매매루틴지정창 하단 “선택 루틴 연결 종목”도 중앙 stocks/state.json, config.json 기준으로 표시되도록 수정했다.
- 검토관리창은 중앙 stocks/state.json 기준으로 REVIEW_REQUIRED 또는 review_required=True 종목을 표시하도록 수정했다.
- 검토관리 버튼 카운트와 검토관리창 내부 목록이 일치하도록 load_review_items() 내부 직접 중앙 수집 방식을 추가했다.
4. 루틴폴더 관련 정리

[출처: 05_운영정책_테스트체크리스트_v2026-06-16_종목폴더통합_검토관리_최신갱신.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-16 17:45:20 | 분류: 갱신문서]
이 종목들은 다음 값이 섞여 있었다.
- routine=MACD매매루틴
- status=REVIEW_REQUIRED
- review=True
- holding_qty 값 존재
- avg_price 값 존재

[출처: 05_운영정책_테스트체크리스트_v2026-06-16_종목폴더통합_검토관리_최신갱신.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-16 17:45:20 | 분류: 갱신문서]
이로 인해:
- 매매루틴지정창에는 MACD 연결 종목으로 보임.
- 자동매매설정창에는 운영대상에서 빠짐.
- 이전에는 검토관리창에 표시되지 않는 문제가 있었다.

[출처: 05_운영정책_테스트체크리스트_v2026-06-16_종목폴더통합_검토관리_최신갱신.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-16 17:45:20 | 분류: 갱신문서]
확인된 정상 동작:
- SK하이닉스에 임의 보유/평단 값을 넣으면 프로그램 시작 시 검토관리 카운트가 발생한다.
- 검토관리창에 SK하이닉스가 표시된다.
- 위치는 MACD매매루틴으로 표시된다.
- 상태는 미해결로 표시된다.
- 사유는 보유수량 있음 + 현재가 확인 불가 등으로 표시된다.
- 보유수량도 표시된다.

[출처: 05_운영정책_테스트체크리스트_v2026-06-16_종목폴더통합_검토관리_최신갱신.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-16 17:45:20 | 분류: 갱신문서]
3순위:
- 전체 리셋 후 깨끗한 상태에서 루틴 지정/해제/검토관리 재검증.
- 루틴 지정 후 _MACD매매루틴 내부에 새 종목폴더가 다시 생기지 않는지 확인.

[출처: 05_운영정책_테스트체크리스트_v2026-06-16_종목폴더통합_검토관리_최신갱신.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-16 17:45:20 | 분류: 갱신문서]
[STK-02] 루틴 지정 후 구형 폴더 재생성 금지
조건:
- _MACD매매루틴/ 내부 종목폴더 없음.
- 중앙 stocks에는 종목 존재.
동작:
- 매매루틴지정창에서 MACD매매루틴 지정.
예상:
- stocks/종목/config.json의 routine 값 갱신.
- _MACD매매루틴/코드_종목명 폴더가 새로 생기지 않음.
- 자동매매설정창 루틴 종목수 증가.
- 매매루틴지정창 하단 연결종목에 중앙 state/config 정보 표시.

[출처: 05_운영정책_테스트체크리스트_v2026-06-16_종목폴더통합_검토관리_최신갱신.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-16 17:45:20 | 분류: 갱신문서]
[STK-03] 루틴 해제
조건:
- MACD매매루틴 연결 종목 존재.
동작:
- 매매루틴지정창 하단에서 루틴 해제.
예상:
- stocks/config.json의 routine 계열 필드가 비워짐.
- 종목 자체는 삭제되지 않음.
- 루틴폴더 내부 종목폴더 생성 없음.

[출처: 05_운영정책_테스트체크리스트_v2026-06-16_종목폴더통합_검토관리_최신갱신.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-16 17:45:20 | 분류: 갱신문서]
[CLN-01] 루틴폴더 잔재 확인
조건:
- 루틴 지정/해제 테스트 후.
예상:
- _MACD매매루틴/ 안에는 budget.json 등 루틴 정의 파일만 남음.
- 종목폴더가 새로 생기지 않음.

[출처: 03_작업재개요약서_v2026-06-16_종목폴더통합_검토관리_최신갱신\03_작업재개요약서_v2026-06-16_종목폴더통합_검토관리_최신갱신.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-16 17:45:02 | 분류: 작업재개요약]
직전 작업에서 확인된 사실:
- _MACD매매루틴 내부에 새 종목폴더가 다시 생기는 문제는 gui_routine_assign_window.py에서 ensure_stock_runtime_files 호출을 제거해 해결했다.
- 매매루틴지정창 하단 정보가 '-'로 나오던 문제는 중앙 stocks/state.json, config.json 기준 조회로 해결했다.
- 검토관리 버튼에는 카운트가 있는데 창 내부에는 0건이던 문제는 load_review_items()가 직접 중앙 stocks를 스캔하도록 하여 해결했다.
- 검토관리창에 SK하이닉스 1건이 표시되는 것까지 확인했다.
- 복귀 버튼 테스트에서 “복귀 완료 1건” 메시지가 나온 장면이 있었으므로, 복귀 차단 정책이 아직 위험하다.
- 사용자가 테스트용 보유/평단 데이터를 삭제했기 때문에 다음 창에서 다시 조건을 만들어 검증해야 한다.

[출처: README_적용내용(26).txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 19:20:46 | 분류: 기타문서/자료]
수정:
1. runtime_assigned_stock_summary()
 - `_MACD매매루틴/종목폴더`를 보지 않음
 - 중앙 `stocks/종목폴더/state.json`, `config.json`, `orders.json` 기준으로 표시

[출처: README_적용내용(26).txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 19:20:46 | 분류: 기타문서/자료]
확인:
1. 파일 교체
2. 프로그램 실행
3. 매매루틴지정창에서 MACD 선택
4. 하단 연결 종목의 운영/상태/보유/평단 등이 '-'가 아니라 중앙 stocks 기준으로 표시되는지 확인
5. `_MACD매매루틴` 폴더에 새 종목폴더가 생성되지 않는지 확인

[출처: README_적용내용(24).txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 18:32:54 | 분류: 기타문서/자료]
문제:
- 루틴 지정 시 `ensure_stock_runtime_files(selected_routine_dir, code, name)` 호출 때문에
 `_MACD매매루틴/105560_KB금융` 같은 구형 종목폴더가 다시 생성됨.

[출처: README_적용내용(24).txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 18:32:54 | 분류: 기타문서/자료]
기대 결과:
- 루틴 지정 후 `_MACD매매루틴/종목폴더`가 다시 생성되지 않아야 함.
- 중앙 `stocks/` 내부 config/state/orders만 사용됨.

[출처: README_적용내용(24).txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 18:32:54 | 분류: 기타문서/자료]
확인:
1. 파일 교체
2. `_MACD매매루틴` 내부에 남은 종목폴더를 archive 이동 또는 삭제
3. 프로그램 실행
4. 미등록 종목 1개를 MACD매매루틴에 지정
5. `_MACD매매루틴` 폴더 안에 새 종목폴더가 생기지 않는지 확인
6. `stocks/해당종목/config.json`의 routine 값이 갱신됐는지 확인

[출처: README_적용내용(23).txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 17:02:16 | 분류: 기타문서/자료]
적용 후 확인:
- `_MACD매매루틴/` 안에는 budget.json 등 루틴 파일만 남는지
- `_등록확인폴더/` 안에도 종목폴더가 사라졌는지
- `archive_candidate/legacy_routine_stock_dirs/` 아래로 이동됐는지
- 프로그램 실행/메인창/자동매매설정창 정상 여부

[출처: routine_folder_liveness_hits.json | 기준일: 2026-06-15 | 수정시각: 2026-06-15 16:50:10 | 분류: 기타문서/자료]
{
 "hits": {
 "_MACD매매루틴": [
 {
 "file": "docs/gui_windows(160).py",
 "line": 257,
 "text": "예: _MACD매매루틴 -> MACD매매루틴"
 },
 {
 "file": "gui_auto_trade_runtime.py",
 "line": 160,
 "text": "과거 _MACD매매루틴, _등록확인폴더 잔재가 아니라 중앙 종목 상태를 기준으로 동작한다."
 },
 {
 "file": "gui_auto_trade_setting_window.py",
 "line": 350,
 "text": "예: _MACD매매루틴 -> MACD매매루틴"
 },
 {
 "file": "gui_review_required_window.py",
 "line": 82,
 "text": "예: _MACD매매루틴 -> MACD매매루틴"
 },
 {
 "file": "gui_schedule_window.py",
 "line": 251,
 "text": "예: _MACD매매루틴 -> MACD매매루틴"
 },
 {
 "file": "gui_windows_149_manual_ats_status_policy_fix.py",
 "line": 257,
 "text": "예: _MACD매매루틴 -> MACD매매루틴"
 },
 {
 "file": "make_sample_orders.py",
 "line": 11,
 "text": "_MACD매매루틴/035420_NAVER/orders.json"
 },
 {
 "file": "make_sample_orders.py",
 "line": 33,
 "text": "TARGET_STOCK_DIR = PROJECT_ROOT / \"_MACD매매루틴\" / \"035420_NAVER\""
 },
 {
 "file": "make_sample_orders_multi_day.py",
 "line": 11,
 "text": "_MACD매매루틴/035420_NAVER/orders.json"
 },
 {
 "file": "make_sample_orders_multi_day.py",
 "line": 29,
 "text": "TARGET_STOCK_DIR = PROJECT_ROOT / \"_MACD매매루틴\" / \"035420_NAVER\""
 },
 {
 "file": "make_sample_orders_multi_day_with_fee.py",
 "line": 11,
 "text": "_MACD매매루틴/035420_NAVER/orders.json"
 },
 {
 "file": "make_sample_orders_multi_day_with_fee.py",
 "line": 28,
 "text": "TARGET_STOCK_DIR = PROJECT_ROOT / \"_MACD매매루틴\" / \"035420_NAVER\""
 }
 ],
 "_등록확인폴더": [
 {
 "file": "gui_auto_trade_runtime.py",
 "line": 160,
 "text": "과거 _MACD매매루틴, _등록확인폴더 잔재가 아니라 중앙 종목 상태를 기준으로 동작한다."
 }
 ],
 "budget.json": [
 {
 "file": "docs/gui_windows(160).py",
 "line": 13,
 "text": "- budget.json 이 있는 폴더만 루틴으로 인정"
 },
 {
 "file": "docs/gui_windows(160).py",
 "line": 239,
 "text": "- budget.json 이 있는 폴더만 루틴으로 인정"
 },
 {
 "file": "docs/gui_windows(160).py",
 "line": 247,
 "text": "and (path / \"budget.json\").exists()"
 },
 {
 "file": "docs/gui_windows(160).py",
 "line": 1271,
 "text": "_ 로 시작하고 budget.json 이 있는 폴더만 루틴으로 인정한다."
 },
 {
 "file": "docs/gui_windows(160).py",
 "line": 1280,
 "text": "budget_path = routine_dir / \"budget.json\""
 },
 {
 "file": "docs/gui_windows(160).py",
 "line": 6804,
 "text": "budget = read_json_dict(routine_dir / \"budget.json\")"
 },
 {
 "file": "gui_auto_trade_setting_window.py",
 "line": 332,
 "text": "- budget.json 이 있는 폴더만 루틴으로 인정"
 },
 {
 "file": "gui_auto_trade_setting_window.py",
 "line": 340,
 "text": "and (path / \"budget.json\").exists()"
 },
 {
 "file": "gui_auto_trade_setting_window.py",
 "line": 1320,
 "text": "budget = read_json_dict(routine_dir / \"budget.json\")"
 },
 {
 "file": "gui_integrity_check_window.py",
 "line": 80,
 "text": "(\"budget_json\", \"budget.json 검증\"),"
 },
 {
 "file": "gui_main_table_loader.py",
 "line": 144,
 "text": "\"\"\"budget.json이 있는 루틴 폴더를 메인 좌측 루틴표에 표시한다."
 },
 {
 "file": "gui_main_table_loader.py",
 "line": 157,
 "text": "budget_path = routine_dir / \"budget.json\""
 },
 {
 "file": "gui_review_required_window.py",
 "line": 64,
 "text": "- budget.json 이 있는 폴더만 루틴으로 인정"
 },
 {
 "file": "gui_review_required_window.py",
 "line": 72,
 "text": "and (path / \"budget.json\").exists()"
 },
 {
 "file": "gui_schedule_window.py",
 "line": 13,
 "text": "- budget.json 이 있는 폴더만 루틴으로 인정"
 },
 {
 "file": "gui_schedule_window.py",
 "line": 233,
 "text": "- budget.json 이 있는 폴더만 루틴으로 인정"
 },
 {
 "file": "gui_schedule_window.py",
 "line": 241,
 "text": "and (path / \"budget.json\").exists()"
 },
 {
 "file": "gui_schedule_window.py",
 "line": 820,
 "text": "_ 로 시작하고 budget.json 이 있는 폴더만 루틴으로 인정한다."
 },
 {
 "file": "gui_schedule_window.py",
 "line": 829,
 "text": "budget_path = routine_dir / \"budget.json\""
 },
 {
 "file": "gui_schedule_window.py",
 "line": 3853,
 "text": "budget = read_json_dict(routine_dir / \"budget.json\")"
 },
 {
 "file": "gui_stock_register_window.py",
 "line": 13,
 "text": "- budget.json 이 있는 폴더만 루틴으로 인정"
 },
 {
 "file": "gui_windows.py",
 "line": 13,
 "text": "- budget.json 이 있는 폴더만 루틴으로 인정"
 },
 {
 "file": "gui_windows_149_manual_ats_status_policy_fix.py",
 "line": 13,
 "text": "- budget.json 이 있는 폴더만 루틴으로 인정"
 },
 {
 "file": "gui_windows_149_manual_ats_status_policy_fix.py",
 "line": 239,
 "text": "- budget.json 이 있는 폴더만 루틴으로 인정"
 },
 {
 "file": "gui_windows_149_manual_ats_status_policy_fix.py",
 "line": 247,
 "text": "and (path / \"budget.json\").exists()"
 },
 {
 "file": "gui_windows_149_manual_ats_status_policy_fix.py",
 "line": 1271,
 "text": "_ 로 시작하고 budget.json 이 있는 폴더만 루틴으로 인정한다."
 },
 {
 "file": "gui_windows_149_manual_ats_status_policy_fix.py",
 "line": 1280,
 "text": "budget_path = routine_dir / \"budget.json\""
 },
 {
 "file": "gui_windows_149_manual_ats_status_policy_fix.py",
 "line": 6621,
 "text": "budget = read_json_dict(routine_dir / \"budget.json\")"
 },
 {
 "file": "integrity_checker.py",
 "line": 115,
 "text": "and (path / \"budget.json\").exists()"
 },
 {
 "file": "integrity_checker.py",
 "line": 276,
 "text": "f\"_{routine_name}/budget.json 확인\","
 },
 {
 "file": "integrity_checker.py",
 "line": 291,
 "text": "budget_path = routine_dir / \"budget.json\""
 },
 {
 "file": "integrity_checker.py",
 "line": 298,
 "text": "\"budget.json 오류\","
 },
 {
 "file": "registry_migratio/stock_registry_step1_analyzer.py",
 "line": 74,
 "text": "# 현재 프로젝트는 budget.json이 없는 등록확인폴더도 사실상 루틴/분류 폴더로 쓰인다."
 },
 {
 "file": "stock_migration_to_central_stocks.py",
 "line": 66,
 "text": "# budget.json이 있는 폴더를 루틴 폴더로 본다."
 },
 {
 "file": "stock_migration_to_central_stocks.py",
 "line": 67,
 "text": "return (path / \"budget.json\").exists()"
 }
 ],
 "get_routine_dirs": [
 {
 "file": "docs/gui_windows(160).py",
 "line": 231,
 "text": "def get_routine_dirs() -> list[Path]:"
 },
 {
 "file": "docs/gui_windows(160).py",
 "line": 607,
 "text": "return {routine_display_name(path): path for path in get_routine_dirs()}"
 },
 {
 "file": "docs/gui_windows(160).py",
 "line": 917,
 "text": "for routine_dir in get_routine_dirs():"
 },
 {
 "file": "docs/gui_windows(160).py",
 "line": 1273,
 "text": "routine_dirs = get_routine_dirs()"
 },
 {
 "file": "docs/gui_windows(160).py",
 "line": 1428,
 "text": "for routine_dir in get_routine_dirs():"
 },
 {
 "file": "docs/gui_windows(160).py",
 "line": 2796,
 "text": "routine_dirs = get_routine_dirs()"
 },
 {
 "file": "docs/gui_windows(160).py",
 "line": 3064,
 "text": "routine_dir_by_name = {routine_display_name(path): path for path in get_routine_dirs()}"
 },
 {
 "file": "docs/gui_windows(160).py",
 "line": 3099,
 "text": "routine_dir_by_name = {routine_display_name(path): path for path in get_routine_dirs()}"
 },
 {
 "file": "docs/gui_windows(160).py",
 "line": 4471,
 "text": "for routine_dir in get_routine_dirs():"
 },
 {
 "file": "docs/gui_windows(160).py",
 "line": 4946,
 "text": "for routine_dir in get_routine_dirs():"
 },
 {
 "file": "docs/gui_windows(160).py",
 "line": 6798,
 "text": "routine_dirs = get_routine_dirs()"
 },
 {
 "file": "docs/gui_windows(160).py",
 "line": 7641,
 "text": "for routine_dir in get_routine_dirs():"
 },
 {
 "file": "docs/gui_windows(160).py",
 "line": 8939,
 "text": "for routine_dir in get_routine_dirs():"
 },
 {
 "file": "docs/gui_windows(160).py",
 "line": 9014,
 "text": "for routine_dir in get_routine_dirs():"
 },
 {
 "file": "gui_auto_trade_setting_window.py",
 "line": 324,
 "text": "def get_routine_dirs() -> list[Path]:"
 },
 {
 "file": "gui_auto_trade_setting_window.py",
 "line": 425,
 "text": "for routine_dir in get_routine_dirs():"
 },
 {
 "file": "gui_auto_trade_setting_window.py",
 "line": 1314,
 "text": "routine_dirs = get_routine_dirs()"
 },
 {
 "file": "gui_auto_trade_status_ops.py",
 "line": 76,
 "text": "def get_routine_dirs() -> list[Path]:"
 },
 {
 "file": "gui_auto_trade_status_ops.py",
 "line": 327,
 "text": "for routine_dir in get_routine_dirs():"
 },
 {
 "file": "gui_global_review_required_window.py",
 "line": 40,
 "text": "get_routine_dirs,"
 },
 {
 "file": "gui_global_review_required_window.py",
 "line": 66,
 "text": "for routine_dir in get_routine_dirs():"
 },
 {
 "file": "gui_global_review_required_window.py",
 "line": 541,
 "text": "for routine_dir in get_routine_dirs():"
 },
 {
 "file": "gui_main_table_loader.py",
 "line": 41,
 "text": "get_routine_dirs,"
 },
 {
 "file": "gui_main_table_loader.py",
 "line": 149,
 "text": "routine_dirs = get_routine_dirs()"
 },
 {
 "file": "gui_review_required_window.py",
 "line": 56,
 "text": "def get_routine_dirs() -> list[Path]:"
 },
 {
 "file": "gui_review_required_window.py",
 "line": 402,
 "text": "for routine_dir in get_routine_dirs():"
 },
 {
 "file": "gui_review_required_window.py",
 "line": 872,
 "text": "for routine_dir in get_routine_dirs():"
 },
 {
 "file": "gui_routine_assign_window.py",
 "line": 79,
 "text": "get_routine_dirs,"
 },
 {
 "file": "gui_routine_assign_window.py",
 "line": 93,
 "text": "for path in get_routine_dirs():"
 },
 {
 "file": "gui_routine_assign_window.py",
 "line": 612,
 "text": "routine_dirs = get_routine_dirs()"
 },
 {
 "file": "gui_routine_assign_window.py",
 "line": 880,
 "text": "routine_dir_by_name = {routine_display_name(path): path for path in get_routine_dirs()}"
 },
 {
 "file": "gui_routine_assign_window.py",
 "line": 915,
 "text": "routine_dir_by_name = {routine_display_name(path): path for path in get_routine_dirs()}"
 },
 {
 "file": "gui_schedule_window.py",
 "line": 225,
 "text": "def get_routine_dirs() -> list[Path]:"
 },
 {
 "file": "gui_schedule_window.py",
 "line": 554,
 "text": "return {routine_display_name(path): path for path in get_routine_dirs()}"
 },
 {
 "file": "gui_schedule_window.py",
 "line": 822,
 "text": "routine_dirs = get_routine_dirs()"
 },
 {
 "file": "gui_schedule_window.py",
 "line": 877,
 "text": "for routine_dir in get_routine_dirs():"
 },
 {
 "file": "gui_schedule_window.py",
 "line": 1704,
 "text": "routine_dirs = get_routine_dirs()"
 },
 {
 "file": "gui_schedule_window.py",
 "line": 1972,
 "text": "routine_dir_by_name = {routine_display_name(path): path for path in get_routine_dirs()}"
 },
 {
 "file": "gui_schedule_window.py",
 "line": 2007,
 "text": "routine_dir_by_name = {routine_display_name(path): path for path in get_routine_dirs()}"
 },
 {
 "file": "gui_schedule_window.py",
 "line": 2535,
 "text": "for routine_dir in get_routine_dirs():"
 },
 {
 "file": "gui_schedule_window.py",
 "line": 3695,
 "text": "for routine_dir in get_routine_dirs():"
 },
 {
 "file": "gui_schedule_window.py",
 "line": 3847,
 "text": "routine_dirs = get_routine_dirs()"
 },
 {
 "file": "gui_schedule_window.py",
 "line": 4316,
 "text": "for routine_dir in get_routine_dirs():"
 },
 {
 "file": "gui_schedule_window.py",
 "line": 5167,
 "text": "for routine_dir in get_routine_dirs():"
 },
 {
 "file": "gui_schedule_window.py",
 "line": 5239,
 "text": "for routine_dir in get_routine_dirs():"
 },
 {
 "file": "gui_stock_register_window.py",
 "line": 243,
 "text": "get_routine_dirs,"
 },
 {
 "file": "gui_stock_register_window.py",
 "line": 353,
 "text": "for routine_dir in get_routine_dirs():"
 },
 {
 "file": "gui_windows.py",
 "line": 61,
 "text": "get_routine_dirs,"
 },
 {
 "file": "gui_windows.py",
 "line": 89,
 "text": "return {routine_display_name(path): path for path in get_routine_dirs()}"
 },
 {
 "file": "gui_windows.py",
 "line": 336,
 "text": "for routine_dir in get_routine_dirs():"
 },
 {
 "file": "gui_windows_149_manual_ats_status_policy_fix.py",
 "line": 231,
 "text": "def get_routine_dirs() -> list[Path]:"
 },
 {
 "file": "gui_windows_149_manual_ats_status_policy_fix.py",
 "line": 607,
 "text": "return {routine_display_name(path): path for path in get_routine_dirs()}"
 },
 {
 "file": "gui_windows_149_manual_ats_status_policy_fix.py",
 "line": 917,
 "text": "for routine_dir in get_routine_dirs():"
 },
 {
 "file": "gui_windows_149_manual_ats_status_policy_fix.py",
 "line": 1273,
 "text": "routine_dirs = get_routine_dirs()"
 },
 {
 "file": "gui_windows_149_manual_ats_status_policy_fix.py",
 "line": 1428,
 "text": "for routine_dir in get_routine_dirs():"
 },
 {
 "file": "gui_windows_149_manual_ats_status_policy_fix.py",
 "line": 2613,
 "text": "routine_dirs = get_routine_dirs()"
 },
 {
 "file": "gui_windows_149_manual_ats_status_policy_fix.py",
 "line": 2881,
 "text": "routine_dir_by_name = {routine_display_name(path): path for path in get_routine_dirs()}"
 },
 {
 "file": "gui_windows_149_manual_ats_status_policy_fix.py",
 "line": 2916,
 "text": "routine_dir_by_name = {routine_display_name(path): path for path in get_routine_dirs()}"
 },
 {
 "file": "gui_windows_149_manual_ats_status_policy_fix.py",
 "line": 4288,
 "text": "for routine_dir in get_routine_dirs():"
 },
 {
 "file": "gui_windows_149_manual_ats_status_policy_fix.py",
 "line": 4763,
 "text": "for routine_dir in get_routine_dirs():"
 },
 {
 "file": "gui_windows_149_manual_ats_status_policy_fix.py",
 "line": 6615,
 "text": "routine_dirs = get_routine_dirs()"
 },
 {
 "file": "gui_windows_149_manual_ats_status_policy_fix.py",
 "line": 7450,
 "text": "for routine_dir in get_routine_dirs():"
 },
 {
 "file": "gui_windows_149_manual_ats_status_policy_fix.py",
 "line": 8748,
 "text": "for routine_dir in get_routine_dirs():"
 },
 {
 "file": "gui_windows_149_manual_ats_status_policy_fix.py",
 "line": 8823,
 "text": "for routine_dir in get_routine_dirs():"
 },
 {
 "file": "integrity_checker.py",
 "line": 108,
 "text": "def get_routine_dirs(project_root: Path) -> list[Path]:"
 },
 {
 "file": "integrity_checker.py",
 "line": 179,
 "text": "routine_dirs = get_routine_dirs(project_root)"
 }
 ],
 "routine_display_name": [
 {
 "file": "docs/gui_windows(160).py",
 "line": 254,
 "text": "def routine_display_name(routine_dir: Path) -> str:"
 },
 {
 "file": "docs/gui_windows(160).py",
 "line": 607,
 "text": "return {routine_display_name(path): path for path in get_routine_dirs()}"
 },
 {
 "file": "docs/gui_windows(160).py",
 "line": 918,
 "text": "routine_name = routine_display_name(routine_dir)"
 },
 {
 "file": "docs/gui_windows(160).py",
 "line": 1278,
 "text": "routine_name = routine_display_name(routine_dir)"
 },
 {
 "file": "docs/gui_windows(160).py",
 "line": 1440,
 "text": "return routine_display_name(stock_dir.parent)"
 },
 {
 "file": "docs/gui_windows(160).py",
 "line": 2806,
 "text": "display_name = routine_display_name(routine_dir)"
 },
 {
 "file": "docs/gui_windows(160).py",
 "line": 3064,
 "text": "routine_dir_by_name = {routine_display_name(path): path for path in get_routine_dirs()}"
 },
 {
 "file": "docs/gui_windows(160).py",
 "line": 3099,
 "text": "routine_dir_by_name = {routine_display_name(path): path for path in get_routine_dirs()}"
 },
 {
 "file": "docs/gui_windows(160).py",
 "line": 4472,
 "text": "routine_name = routine_display_name(routine_dir)"
 },
 {
 "file": "docs/gui_windows(160).py",
 "line": 6803,
 "text": "routine_name = routine_display_name(routine_dir)"
 },
 {
 "file": "docs/gui_windows(160).py",
 "line": 8940,
 "text": "routine_name = routine_display_name(routine_dir)"
 },
 {
 "file": "docs/gui_windows(160).py",
 "line": 8990,
 "text": "routine_name = routine_display_name(routine_dir)"
 },
 {
 "file": "docs/gui_windows(160).py",
 "line": 9015,
 "text": "routine_name = routine_display_name(routine_dir)"
 },
 {
 "file": "gui_auto_trade_runtime.py",
 "line": 64,
 "text": "def _routine_display_name_from_dir(routine_dir: Path) -> str:"
 },
 {
 "file": "gui_auto_trade_runtime.py",
 "line": 162,
 "text": "routine_name = _routine_display_name_from_dir(routine_dir)"
 },
 {
 "file": "gui_auto_trade_setting_window.py",
 "line": 347,
 "text": "def routine_display_name(routine_dir: Path) -> str:"
 },
 {
 "file": "gui_auto_trade_setting_window.py",
 "line": 426,
 "text": "routine_name = routine_display_name(routine_dir)"
 },
 {
 "file": "gui_auto_trade_setting_window.py",
 "line": 1319,
 "text": "routine_name = routine_display_name(routine_dir)"
 },
 {
 "file": "gui_auto_trade_setting_window.py",
 "line": 1930,
 "text": "routine_name = routine_display_name(routine_dir)"
 },
 {
 "file": "gui_global_review_required_window.py",
 "line": 45,
 "text": "routine_display_name,"
 },
 {
 "file": "gui_global_review_required_window.py",
 "line": 67,
 "text": "routine_name = routine_display_name(routine_dir)"
 },
 {
 "file": "gui_main_table_loader.py",
 "line": 43,
 "text": "routine_display_name,"
 },
 {
 "file": "gui_main_table_loader.py",
 "line": 155,
 "text": "routine_name = routine_display_name(routine_dir)"
 },
 {
 "file": "gui_review_required_window.py",
 "line": 79,
 "text": "def routine_display_name(routine_dir: Path) -> str:"
 },
 {
 "file": "gui_review_required_window.py",
 "line": 403,
 "text": "routine_name = routine_display_name(routine_dir)"
 },
 {
 "file": "gui_routine_assign_window.py",
 "line": 83,
 "text": "routine_display_name,"
 },
 {
 "file": "gui_routine_assign_window.py",
 "line": 94,
 "text": "if routine_display_name(path) == routine_name:"
 },
 {
 "file": "gui_routine_assign_window.py",
 "line": 622,
 "text": "display_name = routine_display_name(routine_dir)"
 },
 {
 "file": "gui_routine_assign_window.py",
 "line": 880,
 "text": "routine_dir_by_name = {routine_display_name(path): path for path in get_routine_dirs()}"
 },
 {
 "file": "gui_routine_assign_window.py",
 "line": 915,
 "text": "routine_dir_by_name = {routine_display_name(path): path for path in get_routine_dirs()}"
 },
 {
 "file": "gui_schedule_window.py",
 "line": 248,
 "text": "def routine_display_name(routine_dir: Path) -> str:"
 },
 {
 "file": "gui_schedule_window.py",
 "line": 554,
 "text": "return {routine_display_name(path): path for path in get_routine_dirs()}"
 },
 {
 "file": "gui_schedule_window.py",
 "line": 827,
 "text": "routine_name = routine_display_name(routine_dir)"
 },
 {
 "file": "gui_schedule_window.py",
 "line": 889,
 "text": "return routine_display_name(stock_dir.parent)"
 },
 {
 "file": "gui_schedule_window.py",
 "line": 1714,
 "text": "display_name = routine_display_name(routine_dir)"
 },
 {
 "file": "gui_schedule_window.py",
 "line": 1972,
 "text": "routine_dir_by_name = {routine_display_name(path): path for path in get_routine_dirs()}"
 },
 {
 "file": "gui_schedule_window.py",
 "line": 2007,
 "text": "routine_dir_by_name = {routine_display_name(path): path for path in get_routine_dirs()}"
 },
 {
 "file": "gui_schedule_window.py",
 "line": 2536,
 "text": "routine_name = routine_display_name(routine_dir)"
 },
 {
 "file": "gui_schedule_window.py",
 "line": 3852,
 "text": "routine_name = routine_display_name(routine_dir)"
 },
 {
 "file": "gui_schedule_window.py",
 "line": 5168,
 "text": "routine_name = routine_display_name(routine_dir)"
 },
 {
 "file": "gui_schedule_window.py",
 "line": 5218,
 "text": "routine_name = routine_display_name(routine_dir)"
 },
 {
 "file": "gui_schedule_window.py",
 "line": 5240,
 "text": "routine_name = routine_display_name(routine_dir)"
 },
 {
 "file": "gui_stock_register_window.py",
 "line": 262,
 "text": "routine_display_name,"
 },
 {
 "file": "gui_stock_register_window.py",
 "line": 354,
 "text": "routine_name = routine_display_name(routine_dir)"
 },
 {
 "file": "gui_windows.py",
 "line": 66,
 "text": "routine_display_name,"
 },
 {
 "file": "gui_windows.py",
 "line": 89,
 "text": "return {routine_display_name(path): path for path in get_routine_dirs()}"
 },
 {
 "file": "gui_windows.py",
 "line": 348,
 "text": "return routine_display_name(stock_dir.parent)"
 },
 {
 "file": "gui_windows_149_manual_ats_status_policy_fix.py",
 "line": 254,
 "text": "def routine_display_name(routine_dir: Path) -> str:"
 },
 {
 "file": "gui_windows_149_manual_ats_status_policy_fix.py",
 "line": 607,
 "text": "return {routine_display_name(path): path for path in get_routine_dirs()}"
 },
 {
 "file": "gui_windows_149_manual_ats_status_policy_fix.py",
 "line": 918,
 "text": "routine_name = routine_display_name(routine_dir)"
 },
 {
 "file": "gui_windows_149_manual_ats_status_policy_fix.py",
 "line": 1278,
 "text": "routine_name = routine_display_name(routine_dir)"
 },
 {
 "file": "gui_windows_149_manual_ats_status_policy_fix.py",
 "line": 1440,
 "text": "return routine_display_name(stock_dir.parent)"
 },
 {
 "file": "gui_windows_149_manual_ats_status_policy_fix.py",
 "line": 2623,
 "text": "display_name = routine_display_name(routine_dir)"
 },
 {
 "file": "gui_windows_149_manual_ats_status_policy_fix.py",
 "line": 2881,
 "text": "routine_dir_by_name = {routine_display_name(path): path for path in get_routine_dirs()}"
 },
 {
 "file": "gui_windows_149_manual_ats_status_policy_fix.py",
 "line": 2916,
 "text": "routine_dir_by_name = {routine_display_name(path): path for path in get_routine_dirs()}"
 },
 {
 "file": "gui_windows_149_manual_ats_status_policy_fix.py",
 "line": 4289,
 "text": "routine_name = routine_display_name(routine_dir)"
 },
 {
 "file": "gui_windows_149_manual_ats_status_policy_fix.py",
 "line": 6620,
 "text": "routine_name = routine_display_name(routine_dir)"
 },
 {
 "file": "gui_windows_149_manual_ats_status_policy_fix.py",
 "line": 8749,
 "text": "routine_name = routine_display_name(routine_dir)"
 },
 {
 "file": "gui_windows_149_manual_ats_status_policy_fix.py",
 "line": 8799,
 "text": "routine_name = routine_display_name(routine_dir)"
 },
 {
 "file": "gui_windows_149_manual_ats_status_policy_fix.py",
 "line": 8824,
 "text": "routine_name = routine_display_name(routine_dir)"
 },
 {
 "file": "integrity_checker.py",
 "line": 104,
 "text": "def routine_display_name(routine_dir: Path) -> str:"
 },
 {
 "file": "integrity_checker.py",
 "line": 180,
 "text": "routine_by_name = {routine_display_name(path): path for path in routine_dirs}"
 },
 {
 "file": "integrity_checker.py",
 "line": 288,
 "text": "routine_name = routine_display_name(routine_dir)"
 }
 ]
 },
 "routine_like_dirs": [
 {
 "name": "_deleted_stocks",
 "has_budget_json": false,
 "stock_dir_count": 1,
 "stock_dir_sample": [
 "20260602_131559"
 ]
 },
 {
 "name": "_MACD매매루틴",
 "has_budget_json": true,
 "stock_dir_count": 20,
 "stock_dir_sample": [
 "000660_SK하이닉스",
 "003550_LG",
 "005380_현대차",
 "005930_삼성전자",
 "006400_삼성SDI",
 "012330_현대모비스",
 "028260_삼성물산",
 "035420_NAVER",
 "035720_카카오",
 "051910_LG화학"
 ]
 },
 {
 "name": "_recovery_backup",
 "has_budget_json": false,
 "stock_dir_count": 0,
 "stock_dir_sample": []
 },
 {
 "name": "__pycache__",
 "has_budget_json": false,
 "stock_dir_count": 0,
 "stock_dir_sample": []
 },
 {
 "name": "_등록확인폴더",
 "has_budget_json": true,
 "stock_dir_count": 18,
 "stock_dir_sample": [
 "000660_SK하이닉스",
 "003550_LG",
 "005380_현대차",
 "005930_삼성전자",
 "006400_삼성SDI",
 "012330_현대모비스",
 "028260_삼성물산",
 "035420_NAVER",
 "035720_카카오",
 "051910_LG화학"
 ]
 }
 ]
}

[출처: project_reference_analysis_report.txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 16:34:52 | 분류: 기타문서/자료]
[_MACD매매루틴]
참조 파일 수: 9
- kiwoom_auto/gui_auto_trade_runtime.py
- kiwoom_auto/gui_auto_trade_setting_window.py
- kiwoom_auto/gui_review_required_window.py
- kiwoom_auto/gui_schedule_window.py
- kiwoom_auto/gui_windows_149_manual_ats_status_policy_fix.py
- kiwoom_auto/make_sample_orders.py
- kiwoom_auto/make_sample_orders_multi_day.py
- kiwoom_auto/make_sample_orders_multi_day_with_fee.py
- kiwoom_auto/docs/gui_windows(160).py

[출처: project_reference_analysis_report.txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 16:34:52 | 분류: 기타문서/자료]
권장 분류
- 유지: stocks, review_required, auto_trade_settings
- 보관 후보: _MACD매매루틴, _등록확인폴더
- 폐기 후보: stock_migration_* , registry_migration_* (참조 없을 경우)
- 고위험 보류: gui_windows_149 계열

[출처: kiwoom32_cleanup_analysis_report.txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 16:32:54 | 분류: 기타문서/자료]
C. 구 종목폴더 흔적(바로 삭제 금지, archive 보관 후 검증 필요)
- _MACD매매루틴/ : 구 루틴별 종목 runtime 폴더. 현재 중앙 stocks와 병행 흔적으로 보임.
- _등록확인폴더/ : 구 루틴별 종목 runtime 폴더. 현재 중앙 stocks와 병행 흔적으로 보임.
 권장: 즉시 삭제하지 말고 legacy_routine_folders_backup/ 같은 폴더로 이동 후 재실행 검증.

[출처: kiwoom32_cleanup_analysis_report.txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 16:32:54 | 분류: 기타문서/자료]
## gui_auto_trade_runtime.py
- L160: 과거 _MACD매매루틴, _등록확인폴더 잔재가 아니라 중앙 종목 상태를 기준으로 동작한다.

[출처: kiwoom32_cleanup_analysis_report.txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 16:32:54 | 분류: 기타문서/자료]
## gui_review_required_window.py
- L52: BASE_STOCK_PATH = PROJECT_ROOT / "기초종목.txt"
- L82: 예: _MACD매매루틴 -> MACD매매루틴
- L179: 기초종목.txt 의 특정 종목 행에 루틴 목록을 반영한다.
- L181: if not BASE_STOCK_PATH.exists():
- L184: lines = BASE_STOCK_PATH.read_text(encoding="utf-8").splitlines()
- L206: BASE_STOCK_PATH.write_text(
- L811: append_changelog("UPDATE", "기초종목.txt/state.json", f"검토관리 미지정 전환: {changed}개")
- L855: if BASE_STOCK_PATH.exists():
- L857: for raw_line in BASE_STOCK_PATH.read_text(encoding="utf-8").splitlines():
- L863: BASE_STOCK_PATH.write_text(
- L885: append_changelog("DELETE", "기초종목.txt/runtime", f"검토관리 종목 삭제: {deleted}개")

[출처: kiwoom32_cleanup_analysis_report.txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 16:32:54 | 분류: 기타문서/자료]
## gui_schedule_window.py
- L171: BASE_STOCK_PATH = PROJECT_ROOT / "기초종목.txt"
- L251: 예: _MACD매매루틴 -> MACD매매루틴
- L387: 기초종목.txt 에 이미 저장된 종목 1행의 표시용 검증 상태를 반환한다.
- L424: 기초종목.txt 활성 루틴은 종목당 1개만 허용한다.
- L427: 활성 연결은 기초종목.txt의 첫 번째 유효 루틴 1개만 사용한다.
- L441: 기존 기초종목.txt에 루틴이 여러 개 저장되어 있으면 첫 번째 루틴만 남긴다.
- L446: - 자동매매설정 창은 기초종목.txt의 단일 루틴 연결만 표시한다.
- L448: if not BASE_STOCK_PATH.exists():
- L451: lines = BASE_STOCK_PATH.read_text(encoding="utf-8").splitlines()
- L474: BASE_STOCK_PATH.write_text(
- L482: def read_base_stocks() -> list[dict[str, object]]:
- L484: 기초종목.txt 를 읽어 종목 목록으로 변환한다.
- L489: 현재 기초종목.txt 에 등록일시 필드는 사용하지 않는다.
- L491: if not BASE_STOCK_PATH.exists():
- L492: BASE_STOCK_PATH.write_text("", encoding="utf-8")
- L498: for line_no, raw_line in enumerate(BASE_STOCK_PATH.read_text(encoding="utf-8").splitlines(), start=1):
- L541: 기초종목.txt 에 종목 1개를 추가한다.
- L543: existing_text = BASE_STOCK_PATH.read_text(encoding="utf-8") if BASE_STOCK_PATH.exists() else ""
- L546: with BASE_STOCK_PATH.open("a", encoding="utf-8") as file:
- L560: 기초종목.txt에 연결된 각 종목마다 실주문 루틴이 최대 1개가 되도록 정리한다.
- ... 외 42개

[출처: kiwoom32_cleanup_analysis_report.txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 16:32:54 | 분류: 기타문서/자료]
## gui_windows_149_manual_ats_status_policy_fix.py
- L176: BASE_STOCK_PATH = PROJECT_ROOT / "기초종목.txt"
- L257: 예: _MACD매매루틴 -> MACD매매루틴
- L440: 기초종목.txt 에 이미 저장된 종목 1행의 표시용 검증 상태를 반환한다.
- L477: 기초종목.txt 활성 루틴은 종목당 1개만 허용한다.
- L480: 활성 연결은 기초종목.txt의 첫 번째 유효 루틴 1개만 사용한다.
- L494: 기존 기초종목.txt에 루틴이 여러 개 저장되어 있으면 첫 번째 루틴만 남긴다.
- L499: - 자동매매설정 창은 기초종목.txt의 단일 루틴 연결만 표시한다.
- L501: if not BASE_STOCK_PATH.exists():
- L504: lines = BASE_STOCK_PATH.read_text(encoding="utf-8").splitlines()
- L527: BASE_STOCK_PATH.write_text(
- L535: def read_base_stocks() -> list[dict[str, object]]:
- L537: 기초종목.txt 를 읽어 종목 목록으로 변환한다.
- L542: 현재 기초종목.txt 에 등록일시 필드는 사용하지 않는다.
- L544: if not BASE_STOCK_PATH.exists():
- L545: BASE_STOCK_PATH.write_text("", encoding="utf-8")
- L551: for line_no, raw_line in enumerate(BASE_STOCK_PATH.read_text(encoding="utf-8").splitlines(), start=1):
- L594: 기초종목.txt 에 종목 1개를 추가한다.
- L596: existing_text = BASE_STOCK_PATH.read_text(encoding="utf-8") if BASE_STOCK_PATH.exists() else ""
- L599: with BASE_STOCK_PATH.open("a", encoding="utf-8") as file:
- L613: 기초종목.txt에 연결된 각 종목마다 실주문 루틴이 최대 1개가 되도록 정리한다.
- ... 외 48개

[출처: kiwoom32_cleanup_analysis_report.txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 16:32:54 | 분류: 기타문서/자료]
## make_sample_orders.py
- L11: _MACD매매루틴/035420_NAVER/orders.json
- L33: TARGET_STOCK_DIR = PROJECT_ROOT / "_MACD매매루틴" / "035420_NAVER"

[출처: kiwoom32_cleanup_analysis_report.txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 16:32:54 | 분류: 기타문서/자료]
## make_sample_orders_multi_day.py
- L11: _MACD매매루틴/035420_NAVER/orders.json
- L29: TARGET_STOCK_DIR = PROJECT_ROOT / "_MACD매매루틴" / "035420_NAVER"

[출처: kiwoom32_cleanup_analysis_report.txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 16:32:54 | 분류: 기타문서/자료]
## make_sample_orders_multi_day_with_fee.py
- L11: _MACD매매루틴/035420_NAVER/orders.json
- L28: TARGET_STOCK_DIR = PROJECT_ROOT / "_MACD매매루틴" / "035420_NAVER"

[출처: kiwoom32_cleanup_analysis_report.txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 16:32:54 | 분류: 기타문서/자료]
## docs/gui_windows(160).py
- L176: BASE_STOCK_PATH = PROJECT_ROOT / "기초종목.txt"
- L257: 예: _MACD매매루틴 -> MACD매매루틴
- L440: 기초종목.txt 에 이미 저장된 종목 1행의 표시용 검증 상태를 반환한다.
- L477: 기초종목.txt 활성 루틴은 종목당 1개만 허용한다.
- L480: 활성 연결은 기초종목.txt의 첫 번째 유효 루틴 1개만 사용한다.
- L494: 기존 기초종목.txt에 루틴이 여러 개 저장되어 있으면 첫 번째 루틴만 남긴다.
- L499: - 자동매매설정 창은 기초종목.txt의 단일 루틴 연결만 표시한다.
- L501: if not BASE_STOCK_PATH.exists():
- L504: lines = BASE_STOCK_PATH.read_text(encoding="utf-8").splitlines()
- L527: BASE_STOCK_PATH.write_text(
- L535: def read_base_stocks() -> list[dict[str, object]]:
- L537: 기초종목.txt 를 읽어 종목 목록으로 변환한다.
- L542: 현재 기초종목.txt 에 등록일시 필드는 사용하지 않는다.
- L544: if not BASE_STOCK_PATH.exists():
- L545: BASE_STOCK_PATH.write_text("", encoding="utf-8")
- L551: for line_no, raw_line in enumerate(BASE_STOCK_PATH.read_text(encoding="utf-8").splitlines(), start=1):
- L594: 기초종목.txt 에 종목 1개를 추가한다.
- L596: existing_text = BASE_STOCK_PATH.read_text(encoding="utf-8") if BASE_STOCK_PATH.exists() else ""
- L599: with BASE_STOCK_PATH.open("a", encoding="utf-8") as file:
- L613: 기초종목.txt에 연결된 각 종목마다 실주문 루틴이 최대 1개가 되도록 정리한다.
- ... 외 48개

[출처: kiwoom32_cleanup_analysis_report.txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 16:32:54 | 분류: 기타문서/자료]
6. 권장 마무리 절차
1) 안전 백업 생성.
2) __pycache__/ 및 0바이트 로그 삭제.
3) stock_migration_* / registry_migratio/ / gui_windows_149... / _state_policy.py를 cleanup_archive/로 이동.
4) _MACD매매루틴/ 과 _등록확인폴더/는 바로 삭제하지 말고 legacy_routine_folders_backup/로 이동.
5) 프로그램 재실행 후 확인:
 - 메인창 표시
 - 중앙 종목관리
 - 매매루틴지정
 - 자동매매설정
 - 검토관리
6) 문제가 없으면 보관 폴더를 장기 백업으로 유지하거나 별도 ZIP으로 분리.

[출처: kiwoom29_dependency_analysis_report.txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 14:58:42 | 분류: 기타문서/자료]
### make_sample_orders.py
발견: PROJECT_ROOT / "_:1
L33: TARGET_STOCK_DIR = PROJECT_ROOT / "_MACD매매루틴" / "035420_NAVER"

[출처: kiwoom29_dependency_analysis_report.txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 14:58:42 | 분류: 기타문서/자료]
### make_sample_orders_multi_day.py
발견: PROJECT_ROOT / "_:1
L29: TARGET_STOCK_DIR = PROJECT_ROOT / "_MACD매매루틴" / "035420_NAVER"

[출처: kiwoom29_dependency_analysis_report.txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 14:58:42 | 분류: 기타문서/자료]
### make_sample_orders_multi_day_with_fee.py
발견: PROJECT_ROOT / "_:1
L28: TARGET_STOCK_DIR = PROJECT_ROOT / "_MACD매매루틴" / "035420_NAVER"

[출처: README_적용내용(14).txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 12:22:48 | 분류: 기타문서/자료]
기대 결과:
- 메인 좌측 MACD 종목수와 자동매매설정창 MACD 종목수가 일치해야 합니다.
- 우측 실행 종목표에서 '미지정' 종목은 사라져야 합니다.

[출처: README_적용내용(10).txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 10:38:10 | 분류: 기타문서/자료]
확인 방법:
1. 파일 교체
2. gui_main.py 실행
3. 자동매매설정창에서 MACD 루틴 종목 등록해제
4. 창을 닫았다 다시 열었을 때 MACD 종목수/하단 목록이 줄어드는지 확인
5. 종목등록설정창의 등록 루틴도 같이 갱신되는지 확인

[출처: README_적용내용(9).txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 10:16:02 | 분류: 기타문서/자료]
수정 이유:
- 자동매매설정창 하단 종목목록과 루틴 해제 판정이 기존 `_MACD매매루틴`, `_등록확인폴더` 종목폴더를 직접 스캔하고 있었습니다.
- 중앙 `stocks/` 마이그레이션 이후에는 이 방식이 과거 잔재를 읽어 상단 종목수와 하단 목록이 불일치합니다.

[출처: README_적용내용(9).txt | 기준일: 2026-06-15 | 수정시각: 2026-06-15 10:16:02 | 분류: 기타문서/자료]
확인:
1. 파일 교체 후 `python gui_main.py` 실행.
2. 자동매매설정창에서 MACD매매루틴 선택.
3. 상단 종목수와 하단 목록 수가 맞는지 확인.
4. 등록확인폴더 선택 시 상단 0이면 하단도 0인지 확인.
5. 루틴해제 불가 4종목 문제가 사라졌는지 확인.

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_4.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-15 23:01:24 | 분류: 대화히스토리]
1. _MACD매매루틴/종목폴더
2. _등록확인폴더/종목폴더
3. review_required 관련 과거 폴더
4. archive_candidate
5. migration 백업 파일
6. 구형 registry/json
7. 종목별 orders.json 잔재
8. 종목별 state.json 안의 죽은 필드
지금은 함부로 지우면 안 되고
먼저
kiwoom_auto
프로젝트 전체 폴더 구조를 한번 스캔해야 한다.
확인해야 할 건:
최상위 폴더 목록

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_4.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-15 23:01:24 | 분류: 대화히스토리]
stocks/
_MACD매매루틴/
_등록확인폴더/
stock_repository.py
stock_library.json
review_required.json
operation_policy.json
global_schedule.json
종목통합 완료 후 정리 후보
이건 검토 대상이다.

[출처: 마스터스펙\MASTER_SPEC_v2.0_FULL_INTEGRATED_ARCHIVE_2026-06-11.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-11 15:25:42 | 분류: MASTER_SPEC]
1. 분봉 데이터 요청
2. 일봉 데이터 요청
3. 봉 마감 여부 판단
4. MACD 계산용 데이터 제공
5. 데이터 부족 여부 확인
6. 불완전 봉 제외
---
### config_validator.py
역할 :
config.json 값의 유효성을 검증한다.
주요 기능 :

[출처: 마스터스펙\MASTER_SPEC_v2.0_FULL_INTEGRATED_ARCHIVE_2026-06-11.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-11 15:25:42 | 분류: MASTER_SPEC]
{
 "order_id": "20260531-005930-MACD-BUY-001",
 "kiwoom_order_no": "",
 "routine": "MACD",
 "code": "005930",
 "name": "삼성전자",
 "side": "BUY",
 "order_qty": 10,
 "filled_qty": 0,
 "unfilled_qty": 10,
 "order_price": 75000,
 "filled_price": 0,
 "status": "ORDER_REQUESTED",
 "created_at": "2026-05-31 09:15:10",
 "updated_at": "2026-05-31 09:15:10"
}
side 허용값 :
BUY
SELL
status 허용값 :
READY
ORDER_REQUESTED
ORDER_ACCEPTED
PARTIAL_FILLED
FILLED
CANCEL_REQUESTED
CANCELLED
REJECTED
FAILED
규칙 :
1. 주문 요청 전 orders.json 에 주문 예정 정보를 기록한다.
2. 주문 요청 후 status 를 ORDER_REQUESTED 로 변경한다.
3. 키움 주문 접수 확인 시 ORDER_ACCEPTED 로 변경한다.
4. 일부 체결 시 PARTIAL_FILLED 로 변경한다.
5. 전량 체결 시 FILLED 로 변경한다.
6. 부분체결 후 미체결 수량 취소 요청 시 CANCEL_REQUESTED 로 변경한다.
7. 취소 완료 시 CANCELLED 로 변경한다.
8. 주문 거부 시 REJECTED 로 변경한다.
9. API 오류 또는 알 수 없는 실패 발생 시 FAILED 로 변경한다.
10. 모든 주문 상태 변경은 logs 에도 기록한다.
11. 주문 상태는 GUI 주문상태 보기 창에 표시한다.
---
## [budget.json]
역할 :
루틴 단위 예산 관리
위치 :
_루틴명/budget.json
기본 구조 :

[출처: 마스터스펙\MASTER_SPEC_v2.0_FULL_INTEGRATED_ARCHIVE_2026-06-11.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-11 15:25:42 | 분류: MASTER_SPEC]
6. 마지막 주문 발생 봉 시간은 state.json 의 last_order_candle_time 에 기록한다.
7. 중복 주문 차단 내역은 로그에 기록한다.
8. 중복 주문 차단이 반복 발생하면 GUI 상태에 경고 표시한다.
---
## [MACD 매매 규칙]
0봉 정의 :
MACD 오실레이터 증가 또는 감소가 시작된 첫 번째 봉.
최저점 또는 최고점 자체가 아니다.
모든 계산은 봉 마감 후 수행한다.
---
## [MACD 계산 정책]
기본값 :
macd_fast_period = 12
macd_slow_period = 26
macd_signal_period = 9
min_candle_count = 100
규칙 :
1. MACD 계산에는 최소 100개 이상의 봉 데이터를 확보한다.
2. 데이터가 부족하면 매매 판단을 하지 않는다.
3. 불완전 봉은 계산에서 제외한다.
4. 모든 매수 / 매도 판단은 봉 마감 후 수행한다.
5. timeframe 은 config.json 설정값을 따른다.
6. 데이터 부족 상태는 GUI에 표시한다.
---
## [매수 기준]
음수 구간에서 감소하던 MACD 오실레이터가 처음 감소폭을 줄인 봉을 0봉으로 정의한다.
예)
-5
-8
-12
-10 ← 0봉
-7 ← 1봉
-4 ← 2봉
설정값 buy_signal_bar 에 따라 진입한다.
모든 계산은 봉 마감 후 수행한다.
---
## [매도 기준]
양수 구간에서 증가하던 MACD 오실레이터가 처음 감소하기 시작한 봉을 0봉으로 정의한다.
예)
5
9
15
12 ← 0봉
8 ← 1봉
4 ← 2봉
설정값 sell_signal_bar 에 따라 매도한다.
모든 계산은 봉 마감 후 수행한다.
---
## [추가매수 제한 정책]
1. 동일 매매 세트 내 추가 매수 신호 발생 시 현재가를 직전 매수가와 비교한다.
2. 현재가가 직전 매수가보다 높으면 추가매수하지 않는다.
3. 기본값은 추가매수 금지이다.

[출처: 마스터스펙\MASTER_SPEC_v2.0_FULL_INTEGRATED_ARCHIVE_2026-06-11.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-11 15:25:42 | 분류: MASTER_SPEC]
```text
매수 = MACD 조건
매도 = 매수가 대비 +N% 익절
매도 = 매수가 대비 -N% 손절
```
이 구조는 v1.2 상태체계와 충돌하지 않는다.
이유:

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_3.txt | 기준일: 2026-06-09 | 수정시각: 2026-06-11 15:30:36 | 분류: 대화히스토리]
상단 종목 1개 체크
우측 MACD매매루틴 체크
루틴 지정
그 후 그 종목이 상단에서 사라지고 하단으로 내려가면 정상입니다.
원래 하던게 뭐였더라?
우리가 마지막으로 하던 작업은 구조개선(파일 분리) 검증이었다.
진행 순서를 정리하면:

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_3.txt | 기준일: 2026-06-09 | 수정시각: 2026-06-11 15:30:36 | 분류: 대화히스토리]
1. 상단 종목 1개 선택
2. MACD매매루틴 선택
3. 루틴 지정
4. 상단 목록에서 사라지는가
5. 하단 연결종목으로 이동하는가
6. 창 닫고 다시 열어도 유지되는가
이 단계가 끝나면
RoutineAssignWindow 분리 작업은 사실상 완료 판정.
그 다음 원래 계획은:

[출처: 작업진행상황대화히스토리.txt | 기준일: 2026-06-06 | 수정시각: 2026-06-06 23:18:38 | 분류: 대화히스토리]
루틴단계에서 넣는 매매지점에 나는 +- n%의 기능을 넣을려고 한다... 가령 매수는 MACD 매도는 n% 상승시 매도... 부딛히는 부분이 없나?
큰 충돌은 없습니다.
오히려 루틴 설계에 넣는 게 맞습니다.
정리하면:
매수 = MACD 조건
매도 = 매수가 대비 +N% 또는 -N%
이 구조 가능.
단, 부딪히는 지점은 3개 있습니다.
1. 감시/매도와 충돌 없음
감시/매도는
신규매수 금지
매도 허용
이므로
+N% 익절
-N% 손절
매도 조건은 그대로 작동 가능.
2. 조기마감과도 충돌 없음
조기마감 기본값을
루틴 유지 + 시간조건 제거 + 즉시평가
로 정했기 때문에,
+N%
-N%
도 즉시 평가하면 됩니다.
예:

[출처: 작업진행상황대화히스토리.txt | 기준일: 2026-06-06 | 수정시각: 2026-06-06 23:18:38 | 분류: 대화히스토리]
매수가
현재가
수익률
보유수량
즉 루틴이 단순 차트 신호만 보는 게 아니라
보유 포지션 정보도 받아야 합니다.
내 판단:
MACD 매수
+N% 익절
-N% 손절
은 루틴 정책에 넣어도 됩니다.
다만 역할은 이렇게 나눠야 합니다.
루틴
→ 매수/매도 신호 생성
메인엔진
→ 지금 실행 가능한지 최종 판단
그래서 부딪히지 않게 하려면 최종 구조는:

[출처: routine_folder_liveness_report.txt | 기준일: 2026-06-02 | 수정시각: 2026-06-15 16:49:58 | 분류: 기타문서/자료]
========================================================================
1. 실제 루틴형 폴더 현황
- _deleted_stocks: budget.json=False, 하위 종목폴더=1
 sample: 20260602_131559
- _MACD매매루틴: budget.json=True, 하위 종목폴더=20
 sample: 000660_SK하이닉스, 003550_LG, 005380_현대차, 005930_삼성전자, 006400_삼성SDI, 012330_현대모비스, 028260_삼성물산, 035420_NAVER, 035720_카카오, 051910_LG화학
- _recovery_backup: budget.json=False, 하위 종목폴더=0
- __pycache__: budget.json=False, 하위 종목폴더=0
- _등록확인폴더: budget.json=True, 하위 종목폴더=18
 sample: 000660_SK하이닉스, 003550_LG, 005380_현대차, 005930_삼성전자, 006400_삼성SDI, 012330_현대모비스, 028260_삼성물산, 035420_NAVER, 035720_카카오, 051910_LG화학

[출처: routine_folder_liveness_report.txt | 기준일: 2026-06-02 | 수정시각: 2026-06-15 16:49:58 | 분류: 기타문서/자료]
## _MACD매매루틴
- 직접 참조 수: 12
 - docs/gui_windows(160).py:L257 예: _MACD매매루틴 -> MACD매매루틴
 - gui_auto_trade_runtime.py:L160 과거 _MACD매매루틴, _등록확인폴더 잔재가 아니라 중앙 종목 상태를 기준으로 동작한다.
 - gui_auto_trade_setting_window.py:L350 예: _MACD매매루틴 -> MACD매매루틴
 - gui_review_required_window.py:L82 예: _MACD매매루틴 -> MACD매매루틴
 - gui_schedule_window.py:L251 예: _MACD매매루틴 -> MACD매매루틴
 - gui_windows_149_manual_ats_status_policy_fix.py:L257 예: _MACD매매루틴 -> MACD매매루틴
 - make_sample_orders.py:L11 _MACD매매루틴/035420_NAVER/orders.json
 - make_sample_orders.py:L33 TARGET_STOCK_DIR = PROJECT_ROOT / "_MACD매매루틴" / "035420_NAVER"
 - make_sample_orders_multi_day.py:L11 _MACD매매루틴/035420_NAVER/orders.json
 - make_sample_orders_multi_day.py:L29 TARGET_STOCK_DIR = PROJECT_ROOT / "_MACD매매루틴" / "035420_NAVER"
 - make_sample_orders_multi_day_with_fee.py:L11 _MACD매매루틴/035420_NAVER/orders.json
 - make_sample_orders_multi_day_with_fee.py:L28 TARGET_STOCK_DIR = PROJECT_ROOT / "_MACD매매루틴" / "035420_NAVER"

[출처: routine_folder_liveness_report.txt | 기준일: 2026-06-02 | 수정시각: 2026-06-15 16:49:58 | 분류: 기타문서/자료]
## _등록확인폴더
- 직접 참조 수: 1
 - gui_auto_trade_runtime.py:L160 과거 _MACD매매루틴, _등록확인폴더 잔재가 아니라 중앙 종목 상태를 기준으로 동작한다.

[출처: routine_folder_liveness_report.txt | 기준일: 2026-06-02 | 수정시각: 2026-06-15 16:49:58 | 분류: 기타문서/자료]
========================================================================
4. 판정
- `_MACD매매루틴` 또는 `_등록확인폴더` 직접 문자열 참조가 남아 있음.
- 직접 참조 제거 전에는 해당 폴더명을 바꾸거나 이동하면 안 됨.

[출처: routine_folder_liveness_report.txt | 기준일: 2026-06-02 | 수정시각: 2026-06-15 16:49:58 | 분류: 기타문서/자료]
권장 정리 방식
1. 루틴폴더 자체(`_MACD매매루틴`, `_등록확인폴더`)는 budget.json 때문에 당장 삭제하지 않음.
2. 루틴폴더 내부의 종목폴더만 `archive_candidate/legacy_routine_stock_dirs/`로 이동하는 도구를 먼저 dry-run으로 작성.
3. 이동 후 메인/자동매매설정/루틴지정/종목관리 화면 정상 여부 확인.
4. `등록확인폴더`가 더 이상 루틴으로 필요 없으면 별도 단계에서 루틴 정의 자체 폐기 여부 판단.

13. 신호 체계 BUY/SELL/CANCEL
=============================
[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\90_Misc_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
PENDING PREVIEWED BLOCKED READY ORDER_QUEUED DONE CANCELLED EXPIRED
ERROR
검증 완료

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\90_Misc_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
- 로그인
- 분봉조회
- candles 저장
- Timer Tick
- SELL 생성
- Consumer 실행
- BLOCKED 전이

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
routine_signal_probe 허용:
- candles.json 읽기.
- routine evaluate 호출.
- BUY/SELL/CANCEL 신호 생성.
- routine_signal_queue에 enqueue.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
허용:
- signal/config/state/latest_price 기반 BUY/SELL 후보 산출.
- quantity/amount/price/candidate_status 계산.
- order_intent 진단 필드 생성.
- execution_enabled=false 유지.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
1. 현재 구조 요약
==================================================
현재 프로젝트는 다음 계층으로 분리되어 있다.
Layer 1. Routine Engine
- 루틴 평가
- BUY/SELL/CANCEL 신호 생성

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
책임:
- Timer 또는 수동 호출에서 routine_signal_probe 실행을 조율한다.
- routine_signals.json에 PENDING 신호가 생성되는 흐름을 관리한다.
- signal_probe_only 조건을 확인한다.
호출 대상:
- routine_signal_probe
- routine_signal_queue
허용 전이:
- 없음. 신호 생성/등록만 담당한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
향후 허용 전이:
- ORDER_SENT -> ORDER_ACCEPTED
- ORDER_ACCEPTED -> PARTIAL_FILLED
- PARTIAL_FILLED -> FILLED
- ORDER_ACCEPTED -> FILLED
- CANCEL_REQUESTED -> CANCELLED
- MODIFY_REQUESTED -> MODIFIED
금지:
- SendOrder 반환값만으로 FILLED 처리 금지.
- 이벤트 없이 체결 상태 변경 금지.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
12. CancelModifyController
==================================================

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
향후 허용 전이:
- ORDER_ACCEPTED/PARTIAL_FILLED -> CANCEL_REQUESTED
- ORDER_ACCEPTED/PARTIAL_FILLED -> MODIFY_REQUESTED
- CANCEL_REQUESTED -> CANCELLED/CANCEL_REJECTED
- MODIFY_REQUESTED -> MODIFIED/MODIFY_REJECTED
금지:
- 취소 요청 직후 CANCELLED 처리 금지.
- 정정 요청 직후 MODIFIED 처리 금지.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
1. 책임 분리
==================================================
- Routine : 신호 판단
- Candidate : 주문 후보 생성
- Approval : 후보 검증
- Policy : 운영 정책 검증
- Preflight : 실주문 조건 검증
- Execution : 실행 제어
- Boundary : Kiwoom 통신
- Fill : 체결 반영
- Position : 보유 관리
- Recovery : 복구 판단
하나의 계층은 하나의 책임만 가진다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
역할
- 루틴 평가 결과 생성된 BUY/SELL/CANCEL 등 신호를 저장한다.
- order_queue 후보 생성의 출처 파일이다.
생성 주체
- routine_signal_queue
- 향후 SignalController

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
주요 필드
{
 "id": "signal id",
 "created_at": "datetime",
 "updated_at": "datetime, optional",
 "routine": "지표추종매매",
 "engine": "optional",
 "code": "003550",
 "name": "LG",
 "signal": "BUY|SELL|CANCEL",
 "reason": "string",
 "matched_groups": [],
 "details": [],
 "signal_index": 0,
 "delay_bar": 0,
 "tick_key": "string",
 "status": "PENDING|PREVIEWED|BLOCKED|...",
 "source": "routine_signal_probe|manual_verification",
 "execution_enabled": false
}

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
order 주요 필드
{
 "id": "order id",
 "source_signal_id": "signal id",
 "created_at": "datetime",
 "updated_at": "datetime",
 "routine": "지표추종매매",
 "code": "003550",
 "name": "LG",
 "side": "BUY|SELL",
 "quantity": 0,
 "price": 0.0,
 "amount": 0.0,
 "status": "PENDING|APPROVED|BLOCKED|EXECUTABLE|BLOCKED_POLICY|REAL_READY|BLOCKED_REAL|ORDER_QUEUED...",
 "candidate_status": "CANDIDATE_READY|NO_HOLDING_QTY|NEED_BUDGET|...",
 "order_type": "UNDECIDED",
 "hoga": "UNDECIDED",
 "execution_enabled": false,
 "order_intent": {},
 "order_provenance": {}
}

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
order_intent 현재 규격
{
 "side": "BUY|SELL",
 "source": "order_candidate_engine",
 "budget_source": "optional",
 "holding_source": "optional",
 "price_basis": "latest_price|none",
 "source_ui_path": null,
 "unresolved": true
}

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
order_provenance 현재 규격
{
 "source": "routine_signals",
 "source_signal_id": "signal id",
 "signal_source": "routine_signal_probe",
 "signal_created_at": "datetime",
 "signal_updated_at": "datetime optional",
 "routine": "지표추종매매",
 "engine": null,
 "code": "003550",
 "name": "LG",
 "signal": "BUY|SELL",
 "reason": "string",
 "matched_groups": [],
 "details": [],
 "signal_index": 0,
 "delay_bar": 0,
 "tick_key": "string",
 "source_ui_path": null,
 "rule_path": null,
 "setting_set": null,
 "unresolved": true
}

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
주요 구조 후보
{
 "version": 1,
 "updated_at": "datetime",
 "positions": [
 {
 "position_id": "string",
 "code": "003550",
 "name": "LG",
 "holding_qty": 0,
 "available_qty": 0,
 "avg_price": 0.0,
 "total_buy_amount": 0.0,
 "realized_pnl": 0.0,
 "unrealized_pnl": 0.0,
 "source_order_ids": [],
 "source_fill_ids": [],
 "updated_at": "datetime",
 "verified_by_kiwoom": false
 }
 ]
}

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
현재 저장 위치 후보:
- routines/{루틴명}/routine.json
- routines/{루틴명}/rules.json
- routine registry
3.2 Signal
의미:
- 루틴 평가 결과 생성된 BUY/SELL/CANCEL 등 신호.
- 주문 후보의 출처.
현재 저장 위치:
- runtime/routine_signals.json

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
관계:
- source_signal_id -> routine_signals.json.id
- order_provenance.source_signal_id -> routine_signals.json.id
- order_intent는 주문방식/가격방식 의도 메타데이터
- order_provenance는 신호 출처 추적 메타데이터

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
권장 필드:
- position_id
- code
- name
- holding_qty
- available_qty
- avg_price
- total_buy_amount
- realized_pnl
- unrealized_pnl
- source_order_ids
- source_fill_ids
- updated_at
- verified_by_kiwoom

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
3. Engine 계층
==================================================
역할
- 계산
- 신호 판단
- 정책 평가
입력
- Runtime(Read)
- Config
출력
- 계산 결과

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
3. 흐름
Position
→ 청산 결정
→ SELL Order
→ Execution
→ Fill
→ Position 감소
→ holding_qty==0
→ Close History 생성

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
4. Position 감소 규칙
- 부분체결: holding_qty 부분 감소
- 전량체결: holding_qty=0
- avg_price는 남은 수량 기준 유지
- realized_pnl은 Fill마다 누적

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
미완성 항목:
- hoga 확정
- order_type 확정
- UI 주문방식과 order_queue 후보 연결
- BUY/SELL별 주문방식 출처 추적
- sell setting_a/b/c 출처 식별
- 실제 SendOrder 입력값 매핑

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
추가 helper:
- build_order_intent_for_candidate(side, candidate)
적용 대상:
- build_buy_candidate()
- build_sell_candidate()
추가 필드:
- order_intent

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
현재 order_intent는 BUY/SELL 후보 생성 결과에 포함된다.
직접 build_buy_candidate() / build_sell_candidate() 호출 결과에도 order_intent와 execution_enabled=False가 붙도록 보강되었다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
{
 "side": "SELL",
 "source": "order_candidate_engine",
 "holding_source": "REAL_OR_STATE_HOLDING",
 "price_basis": "latest_price",
 "source_ui_path": null,
 "unresolved": true
}

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
필드 의미:
- side: SELL
- source: order_candidate_engine에서 생성됨
- holding_source: 매도 가능 수량 산출 근거
- price_basis: 가격 기준 근거
- source_ui_path: 현재는 알 수 없으므로 null
- unresolved: sell setting_a/b/c 출처가 아직 신호 payload에 없으므로 true

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
현재 SELL은 보유수량/가용수량 기준 후보 산출만 수행한다.
sell_ui.setting_a/b/c 중 어느 주문방식에서 온 신호인지는 아직 알 수 없다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
현재 정책:
- 정확하지 않으면 null.
- 추정으로 buy_ui.base를 넣지 않는다.
- 추정으로 sell_ui.setting_a/b/c를 넣지 않는다.
- sell signal payload에 setting_a/b/c 출처가 없으면 null 유지.
- “아는 척” 경로를 넣는 행위 금지.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
향후 source_ui_path 후보:
- indicator_follow_ui_state.state.buy_ui.base
- indicator_follow_ui_state.state.sell_ui.setting_a
- indicator_follow_ui_state.state.sell_ui.setting_b
- indicator_follow_ui_state.state.sell_ui.setting_c
단, 향후에도 실제 신호 payload 또는 명확한 매핑 근거가 있어야 한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
- UI state 또는 rules 기반 주문방식 출처 확인
- source_ui_path 확정
- method_type 확정
- price_mode 확정
- hoga_mode 확정
- order_type/hoga 매핑 가능
- sell의 경우 setting_a/b/c 출처 확인
현재 단계에서는 unresolved=false를 만들지 않는다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
2. BUY 매핑
- buy_ui.base 기반 method_type 확정.
- 단일호가/다중호가 구분.
- 주문가/시장가 구분.
- multi_up/multi_down/multi_total 산출.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
3. SELL 매핑
- sell signal payload에 setting_a/b/c 출처 추가 필요.
- 출처가 확인된 경우 sell_ui.setting_a/b/c 주문방식 적용.
- 출처가 없으면 unresolved 유지.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
목적
- ORDER_QUEUED 이후 동일 주문/동일 신호/동일 종목의 중복 실행을 방지하기 위한 Lock 정책을 정의한다.
- 본 문서는 설계 기준이며 코드 구현은 포함하지 않는다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
5. 해제 조건
- FILLED
- CANCELLED
- REJECTED
- ERROR(정책 확인 후)
- RecoveryController의 복구 절차

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
예:
- 어떤 루틴 신호에서 왔는가
- 어떤 matched_group이 통과했는가
- 어떤 reason/details가 있었는가
- signal_index/delay_bar는 무엇이었는가
- 어떤 tick에서 만들어졌는가
- 엔진/루틴 출처는 무엇인가
이 정보를 order 후보에 보존하기 위해 order_provenance를 추가한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
order_provenance:
- 왜 이 주문 후보가 만들어졌는가를 설명한다.
- 루틴 신호 출처, matched_groups, details, reason, signal_index, tick_key 등을 담는다.
- 디버깅/검토/로그/GUI 상세보기용이다.
정리:
- order_intent = 주문 의도
- order_provenance = 주문 생성 이력

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
engine
- signal_record.engine이 있으면 기록.
- 없으면 None.
- 현재 enqueue 단계에서 engine이 항상 보존되는 것은 아니므로 없을 수 있다.
code
- 종목 코드.
name
- 종목명.
signal
- BUY / SELL / CANCEL 등 루틴 신호.
reason
- 루틴 결과 reason.
matched_groups
- 루틴 평가에서 통과한 그룹 목록.
- 없으면 빈 배열.
details
- 루틴 평가 세부 내용.
- 없으면 빈 배열.
signal_index
- 신호가 발생한 candle/index.
- 있으면 기록.
delay_bar
- 지연봉/확정봉 관련 값.
- 있으면 기록.
tick_key
- Timer/probe tick 식별자.
source_ui_path
- 현재는 알 수 없으므로 null.
- 추정 입력 금지.
rule_path
- 현재 signal payload에 없으므로 null.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
setting_set
- sell setting_a/b/c 출처.
- 현재 signal payload에 없으므로 null.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
이유:
- signal payload가 rule path를 포함하지 않음.
- signal payload가 UI source path를 포함하지 않음.
- signal payload가 sell setting A/B/C 출처를 포함하지 않음.
- signal payload가 source candle snapshot을 포함하지 않음.
unresolved=false가 되려면 향후 아래 정보가 신호 또는 매핑 계층에서 명확히 제공되어야 한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
3. source_ui_path 추가
- UI state 기반 rule mapper가 확정되면 추가 가능.
- buy_ui.base / sell_ui.setting_a/b/c 등.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
4. setting_set 추가
- SELL 신호가 setting_a/b/c 중 어디에서 왔는지 engine이 알려줄 수 있어야 함.
- 현재는 null 유지.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
반영해야 할 핵심:
- order_provenance는 주문 생성 이력 메타데이터이다.
- order_intent와 역할이 다르다.
- order_intent는 주문 의도/미확정 진단.
- order_provenance는 루틴 신호 출처 추적.
- provenance는 실행 판단에 사용하지 않는다.
- 모르는 값은 null 또는 unresolved=true로 남긴다.
- setting_a/b/c, source_ui_path, rule_path는 추정하지 않는다.
- 향후 GUI 상세보기/검토관리/로그 분석에 활용 가능하다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
정확히 아는 신호 출처만 기록하고, 모르는 UI/rule/setting 출처는 unresolved로 남기는 것이 안전하다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
3. Position 핵심 필드
- position_id
- code
- name
- holding_qty
- available_qty
- avg_price
- total_buy_amount
- realized_pnl
- unrealized_pnl
- source_order_ids
- source_fill_ids
- updated_at
- verified_by_kiwoom

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
4. 변경 규칙
매수 Fill:
- holding_qty 증가
- avg_price 재계산
- total_buy_amount 갱신

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
현재 의미:
- PENDING: 루틴 신호 기반 주문 후보.
- APPROVED: 후보 품질 검토 통과. 실주문 허용 아님.
- EXECUTABLE: 운영정책 게이트 통과. Real Preflight 검토 대상. 실주문 허용 아님.
- REAL_READY: Real Preflight 통과. 그래도 SendOrder 아님.
- Adapter Request Preview: 키움 요청 dict를 메모리로 검토. 상태 변경 없음.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
향후 추가 검토 필요:
- ORDER_SENT
- ORDER_ACCEPTED
- PARTIAL_FILLED
- FILLED
- CANCEL_REQUESTED
- CANCELLED
- MODIFY_REQUESTED
- REJECTED

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
indicator_follow_ui_state
기존 buy/sell/indicators/order_policy/cancel_policy는 그대로 유지.
코덱스

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
저장된 namespace:
text
indicator_follow_ui_state
 ui_state_version
 updated_at
 state
 basic
 buy_ui
 sell_ui
 complete_ui

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
기존 핵심 key 변경 없음 확인:
text
buy: 유지
sell: 유지
indicators: 유지
order_policy: 유지
cancel_policy: 유지
safety: 유지
저장 결과:
text
save_success True
tmp_file_leftover False
좋다. 저장/로드 연결 1차는 정상 완료로 본다.
현재 완료 상태:
UI 상태 수집 완료
UI 상태 apply 완료
JSON roundtrip 검증 완료
rules.json에 indicator_follow_ui_state 저장 완료
새 dialog에서 저장 state 로드/apply 성공
기존 엔진 핵심 key 변경 없음
저장 버튼 활성화 완료
다음은 실제 화면에서 저장/재열기 확인이다.
확인할 것:
설정창에서 임의 값 몇 개 변경
UI 상태 저장
창 닫기
다시 설정창 열기
값이 그대로 복원되는지 확인

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
그 다음 단계는 indicator_follow_ui_state를 실제 엔진용 buy/sell rules로 변환할지 여부를 설계하는 것이다.
다음
좋다. 저장/재열기 검증까지 정상 완료다.
현재 완료 판정:
UI 값 변경
UI 상태 저장
새 설정창 생성
자동 apply
복원 성공
불일치 0개
기존 엔진 rules key 유지
py_compile 통과
이제 UI 상태 저장/로드 연결 1차는 완료로 봐도 된다.
다음 단계는 별도 설계가 필요하다:
indicator_follow_ui_state를 실제 엔진용 buy/sell rules로 변환할지
아니면 UI 저장은 UI 저장대로 유지하고, 엔진 연결은 별도 매핑 계층을 만들지
바로 엔진 연결로 들어가지 말고, 먼저 UI state → engine rules 매핑 설계가 맞다.
합리적인 방향으로 가자
합리적인 방향은 바로 엔진 연결이 아니라 중간 매핑 계층을 만드는 것이다.
현재 구조는 이렇게 분리하는 게 맞다.
UI 상태 저장
indicator_follow_ui_state
화면 복원용
이미 완료
엔진 실행 rules
기존 buy, sell, indicators
실제 신호 판단용
함부로 오염시키면 안 됨
변환 계층
indicator_follow_ui_state → 엔진 rules 후보 생성
처음에는 저장하지 않고 preview만
다음 작업은:
“UI state를 엔진 rules로 어떻게 변환할지 매핑표 작성”
특히 먼저 연결할 최소 범위:
기본 분봉 → bar.bar_minutes
매수 OCR → buy.groups
매도 MACD/수익률 → 기존 sell.signals
나머지 매수/매도방식/순환/이탈은 아직 UI 저장만 유지
즉, 다음 단계는 부분 매핑 설계가 맞다.
전체 UI를 한 번에 엔진에 연결하면 위험하다.
작업재개요약문서와 마스터스펙 갱신문서를 네 처리용량 한도내에서 중요한것들은 누락하지말고 작성해줘

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
cleanup tools
migration tools
order helper
log reader
routine_signal_probe.py 만 루트 유지.
4. 숨은 탭 구조 제거
예전
_buy_tab
_sell_tab
_buy_edit_tab
_sell_edit_tab
생성 중단.
현재
공식 단일 화면만 생성.
숨은 탭 생성 제거.
Validation Tab만 유지.
5. collector 구조
현재
collect_indicator_follow_ui_state()
완료.
구조
basic
buy_ui

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
signal_filter
base
repeat
price_compare
situation
additional
cycle
exit
close
legacy_summary
sell_ui
signal_conditions
condition_a
condition_b
condition_c
selected_sets
setting_a
setting_b
setting_c
legacy_summary
complete_ui
6. buy collector 완료
완료
signal_filter
OCR
Bollinger
MA
RSI
완료
base
완료
repeat
완료
price_compare
완료
situation
완료
additional
완료
cycle
총
29개
완료
exit
11개
close
저장 제외.
7. sell collector 완료
추가
signal_conditions
condition_a
18
condition_b
16
condition_c
19
로컬 위젯 제거 완료.
setting
setting_a
setting_b
setting_c
각각
65개
수집 완료.
selected_sets
완료.
8. self 참조 정리
공식 화면 기준
local-only
0
달성.
공식 화면의 저장 대상 위젯은
모두 self 참조 완료.
9. apply 구현
완료
apply_indicator_follow_ui_state()
추가.
지원
CheckBox
ComboBox
LineEdit
없는 위젯
skip.
지원 안되는 타입
skip.
상태 동기화
자동 수행.
_update_all_buy_method_states()
buy_exit updater
등 호출.
10. rules.json
새 namespace 추가.
indicator_follow_ui_state
ui_state_version
updated_at
state
기존
buy
sell
indicators
order_policy
cancel_policy
safety
절대 수정하지 않음.
11. 저장 기능
추가 완료
save_indicator_follow_ui_state_to_rules()
동작
현재 rules
↓
deep copy
↓
UI state collect
↓
indicator_follow_ui_state 추가
↓
tmp 저장
↓
replace
↓
완료
UTF-8
ensure_ascii=False
indent=2
12. 저장 버튼
기존 Save 버튼
↓
UI 상태 저장
으로 사용.
13. 로드
rules
↓
indicator_follow_ui_state 존재
↓
apply()
↓
없으면
기존 populate
유지.
14. 검증
완료
collect
↓
apply
↓
collect
차이
0
JSON
roundtrip
성공.
save
↓
새 dialog
↓
자동 apply
↓
복원
100%
성공.
기존 Rule
buy
sell
indicator
order
cancel
safety
변경 없음.
15. 현재 완료 범위
완료
UI 저장
UI 복원
UI Preview
Pending Rules Preview
JSON Roundtrip
실제 Save
실제 Load
실제 재열기 복원
미완료
UI
↓
Engine Rule
변환.
MASTER SPEC 갱신자료
신규 구조
rules.json
신규 namespace
indicator_follow_ui_state
추가.
구조
indicator_follow_ui_state
ui_state_version
updated_at
state
basic
buy_ui
sell_ui
complete_ui
UI 저장 정책
UI 상태는
기존 Rule과 완전히 분리.
기존 Rule은
신호 판단 전용.
UI는
화면 복원 전용.
혼합 금지.
Collector 정책
Collector는
공식 단일 화면 기준.
숨은 탭
제외.
legacy
제외.
display
제외.
저장 대상
basic
buy_ui
signal_filter
base
repeat
price_compare
situation
additional
cycle
exit
sell_ui
signal_conditions
selected_sets
setting_a
setting_b
setting_c
저장 제외
buy_ui.close
자동 계산 결과.
사용자 입력 아님.
complete_ui
현재 공식 화면 미사용.
legacy_summary
호환용.
Apply 정책
우선순위
Combo
↓
LineEdit
↓
CheckBox
↓
상태 Sync
없는 Widget
skip
없는 Key
skip
Combo 값 없음
skip
예외
UI 중단 금지.
Save 정책
현재 Rule
↓
유지
↓
indicator_follow_ui_state만 교체
↓
tmp 저장
↓
replace
기존 Rule 변경 금지.
Load 정책
indicator_follow_ui_state
존재
↓
apply()
없으면
populate
유지.
Engine 연결 정책 (다음 단계)
UI 저장과 엔진 Rule은 분리 유지.
직접 buy, sell, order_policy 등을 수정하지 않는다.
중간 변환 계층을 둔다.
권장 구조:

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
Preview 출력:
json
{
 "mapped_paths": [
 "bar.bar_minutes",
 "buy.delay_bar",
 "buy.groups",
 "sell.signals.macd_sell",
 "sell.signals.macd_sell.delay_bar"
 ],
 "warnings": [
 "sell.signals.macd_sell is a preview candidate and does not replace existing rules",
 " ż mapping is postponed",
 " ݺ ż mapping is postponed",
 " ְ 񱳸ż mapping is postponed",
 " Ȳ ȭ mapping is postponed",
 " ߰ ɼ mapping is postponed",
 " ȯ mapping is postponed",
 " Ż mapping is postponed",
 " ŵ A/B/C mapping is postponed",
 " 체 책 mapping is postponed",
 " Ϸ 책 mapping is postponed"
 ],
 "preview": {
 "bar": {
 "bar_minutes": 5
 },
 "buy": {
 "enabled": true,
 "groups_logic": "OR",
 "groups": [
 {
 "enabled": true,
 "name": "UI_PREVIEW_BUY_OSC",
 "conditions_logic": "AND",
 "conditions": [
 {
 "enabled": true,
 "not": false,
 "target": "OSC",
 "operator": "TURN_UP",
 "description": "UI preview: buy OCR/OSC turn condition"
 },
 {
 "enabled": true,
 "not": false,
 "target": "OSC",
 "operator": "<=",
 "value": -91.0,
 "description": "UI preview: buy OCR/OSC threshold condition"
 }
 ]
 }
 ],
 "delay_bar": 1
 },
 "sell": {
 "enabled": true,
 "signal_logic": "OR",
 "signals": {
 "macd_sell": {
 "enabled": true,
 "delay_bar": 1,
 "groups_logic": "OR",
 "groups": [
 {
 "enabled": true,
 "name": "UI_PREVIEW_SELL_MACD_CONDITION_C",
 "conditions_logic": "AND",
 "conditions": [
 {
 "enabled": true,
 "not": false,
 "target": "MACD",
 "operator": "<=",
 "value": -1.0,
 "description": "UI preview: sell condition C MACD line threshold"
 }
 ]
 }
 ]
 }
 }
 }
 }
}

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
buy method mapping is postponed
repeat buy mapping is postponed
price compare buy mapping is postponed
situation response mapping is postponed
additional feature mapping is postponed
cycle mapping is postponed
exit condition mapping is postponed
sell scenario A/B/C mapping is postponed
unfilled policy mapping is postponed
completion policy mapping is postponed
routine_rule_mapper.py만 최소 수정했습니다.

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
routine_rule_mapper.py 분리 OK
preview 전용 구조 OK
rules.json 미수정 OK
엔진 미연결 OK
warning 인코딩 정리 OK
bar / buy / sell 후보 위치 OK
다음 작업은 테스트 고정입니다.
바로 다음 코덱스 지시:
구현 확장 금지.
routine_rule_mapper.py에 대한 최소 테스트 파일을 작성해라.

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
검증 내용:
- preview dict 생성 확인
- 입력 current_rules 불변 확인
- mapped_paths 기대값 확인
- warnings가 모두 ASCII 문자열인지 확인
- preview.bar == {"bar_minutes": 5} 확인
- preview.buy.delay_bar 위치 확인
- preview.sell.signals.macd_sell.delay_bar 위치 확인

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
**위험도 기준**
- low: 숫자/단순 값 이동 또는 동일 경로 후보 
 예: bar.bar_minutes, buy.delay_bar
- medium: engine condition 구조 변경 후보 
 예: buy.groups
- high: 기존 실행 신호를 대체처럼 보일 수 있는 후보 
 예: sell.signals.macd_sell
- postponed: 아직 매핑하지 않는 UI 영역

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
buy.delay_bar:
"Moved from current bar.buy_delay_bar into preview buy.delay_bar."
buy.groups:
"Preview-only OCR/OSC buy condition candidate."

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
표시 항목:
1. [Rule Mapper Preview]
 - 기존 mapped_paths
 - warnings
 - preview bar/buy/sell 후보

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
수정 방향:
1. risk가 high 또는 medium인 change는 current_value / preview_value 요약 길이를 크게 늘린다.
2. 가능하면 240자 제한을 1200~2000자 수준으로 늘린다.
3. low risk 항목은 기존처럼 짧게 유지해도 된다.
4. 출력에 path별 구분선을 넣어 가독성을 높인다.
5. buy.groups와 sell.signals.macd_sell은 전체 조건 구조가 보일 정도로 표시한다.

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
변경 내용:
- [Rule Mapper Diff] 표시 전용 요약 길이 개선
- risk == "high" 또는 "medium" 항목은 current_value / preview_value 최대 1800자까지 표시
- low risk 항목은 기존 240자 유지
- 각 change에 구분선 추가:
 - separator: "----- buy.groups -----"
 - separator: "----- sell.signals.macd_sell -----"

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
buy.groups
current_len 520
preview_len 368
current_endswith_ellipsis False
preview_endswith_ellipsis False

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
buy.groups
→ medium, 기존 그룹 전체 대체 금지
→ preview 후보를 별도 group으로 비교해야 함

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
목표:
- 기존 buy.groups 구조가 무엇인지 확인
- preview buy.groups가 기존 구조를 대체해도 되는지 판단
- 기존 sell.signals.macd_sell 구조가 OSC TURN_DOWN인지 확인
- preview sell.signals.macd_sell이 기존 매도 신호를 대체하면 안 되는지 확인
그 원문을 보고 나면, 다음은 대체 방식이 아니라 병합/후보 방식으로 갈지를 확정하면 됩니다.
파일 수정 없이 현재 [Rule Mapper Diff]에서 두 항목만 전체 출력했습니다.

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
판단: 기존 buy.groups는 5개 그룹 구조이고, 1번 그룹만 OSC TURN_UP 조건이 켜져 있습니다. preview는 단일 그룹으로 줄이고 threshold 조건까지 추가합니다. 그대로 대체하면 기존 5그룹 구조를 잃을 수 있어 아직 직접 대체는 위험합니다.

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
검토할 방향:
1. buy.groups는 기존 5그룹 구조를 유지하면서 UI preview 조건을 어느 그룹에 병합할 수 있는가?
2. 기존 group[0] OSC TURN_UP과 preview OSC TURN_UP + threshold 조건은 병합 가능한가?
3. sell.signals.macd_sell은 기존 OSC TURN_DOWN을 유지하면서 MACD <= -1.0 조건을 추가 group으로 넣을 수 있는가?
4. 아니면 sell condition_c MACD 조건은 macd_sell이 아니라 별도 signal 후보로 분리해야 하는가?
5. 실제 rules 저장 없이 preview/diff에서 “replace”가 아니라 “merge/add candidate”로 표현하려면 mapper 구조를 어떻게 바꿔야 하는가?

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
산출:
- buy 병합안
- sell 병합안
- 별도 후보 signal 안
- 위험도
- 추천안
- 아직 구현 금지
현재 단계의 핵심은:

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
preview 구조:
- 단일 그룹 UI_PREVIEW_BUY_OSC
- OSC TURN_UP
- OSC <= -91.0
가장 안전한 병합안은 group[0] 유지 + threshold 조건만 추가 후보로 보여주는 방식입니다.

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
**Buy 병합 가능성**
group[0]의 OSC TURN_UP과 preview의 OSC TURN_UP은 동일 의미로 보입니다. 따라서 중복 추가하지 않고 “이미 존재”로 판단하는 게 맞습니다.

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
병합 규칙 초안:
- 기존 group 중 target=OSC, operator=TURN_UP 조건이 있으면 재사용
- preview의 TURN_UP은 추가하지 않음
- preview threshold OSC <= -91.0만 같은 group에 추가 후보로 표시
- 기존 group이 없으면 새 group 추가 후보로 표시

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
또는 엔진 rules preview 안에서 표시하려면:
json
"buy": {
 "groups": "기존 유지",
 "_preview_merge_candidates": [...]
}

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
**추천안**
1. Buy는 기존 buy.groups[0]에 threshold 조건을 **merge candidate**로 표현
2. 기존 OSC TURN_UP은 중복 추가하지 않음
3. Sell은 기존 macd_sell을 대체하지 않음
4. Sell MACD <= -1.0은 우선 별도 signal 후보 또는 add group 후보로 분리
5. preview/diff 문구는 replace가 아니라 merge candidate, add group candidate, add signal candidate로 바꿈
6. 실제 rules 저장은 계속 금지

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
내 추천은 더 보수적으로:
- **buy는 merge candidate**
- **sell은 별도 signal candidate**
입니다.

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
이유는 buy는 기존 OSC TURN_UP과 UI OCR이 같은 계열이라 병합 의미가 비교적 자연스럽고, sell은 기존 OSC TURN_DOWN과 preview MACD threshold가 의미상 다른 신호라 macd_sell 안에 넣는 것보다 별도 후보로 빼는 게 안전합니다.
이 분석이 맞습니다. 이제 방향은 확정입니다.

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
기존 rules를 덮어쓰는 형태로 보여주지 않는다.
기존 rules는 유지한다.
UI에서 온 값은 "추가/병합 후보"로만 표시한다.
확정안
Buy
기존 buy.groups 5개 구조 유지
group[0]의 OSC TURN_UP 유지
UI OCR/OSC TURN_UP은 중복 추가하지 않음
UI threshold 조건만 buy.groups[0]에 merge candidate로 표시
Sell
기존 sell.signals.macd_sell 유지
OSC TURN_DOWN 유지
UI condition_c MACD <= -1.0은 macd_sell 대체 금지
별도 signal candidate로 분리
다음 코덱스 지시
아직 구현하지 말고, 다음 수정안을 기준으로 routine_rule_mapper.py 변경 계획만 작성해라.

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
가장 큰 위험:
- 현재 compare_engine_rules_preview()가 단순 path getter 기반이라 buy.groups[0].conditions 같은 list index path를 처리하지 못함.
- groups[0] 문법을 지원하려면 path parser가 필요함.
- 하지만 과한 parser 구현은 불필요할 수 있음. mapper diff 전용으로 hard-coded path handling을 쓰는 편이 안전합니다.

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
두 번째 위험:
- preview_rules = deepcopy(current_rules)를 계속 유지할지 여부.
- 유지하면 preview 안에 기존 buy/sell 전체가 계속 들어가서 “실제 후보”와 “기존 copy”가 섞입니다.
- 제거하면 기존 preview 표시 화면에서 preview bar/buy/sell 후보 구조가 바뀝니다.
- 추천은 hybrid:
 - preview_rules["bar"]만 mapped preview로 유지
 - indicator_follow_rule_preview에 후보 저장
 - 기존 buy/sell copy는 더 이상 preview 핵심으로 쓰지 않음

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
네 번째 위험:
- sell condition_c를 별도 signal candidate로 만들면 엔진이 실제로 지원하는 signal key인지 불명확.
- 따라서 enabled: false, preview_candidate: true를 반드시 넣어 실행 후보가 아님을 명확히 해야 합니다.
**6. 구현 여부 판단**
지금 바로 구현 가능하지만, 범위는 작게 나눠야 합니다.

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
buy 후보:
- merge_into: buy.groups[0].conditions
- 기존 OSC TURN_UP이 있으면 skip_existing에 기록
- OSC <= -91.0 threshold만 add_conditions 후보로 기록
- 기존 buy.groups 5개 구조를 직접 변경하지 않는다.

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
[Rule Mapper Preview] 화면이 아직 preview_rules의 bar/buy/sell만 보여주고,
indicator_follow_rule_preview namespace를 표시하지 않음
다음 코덱스 지시
gui_indicator_follow_routine_settings_dialog.py만 최소 수정.

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
수정 내용:
1. 기존 [Rule Mapper Preview] 출력에서 preview_rules의 bar/buy/sell만 표시하지 말고,
 indicator_follow_rule_preview도 함께 표시한다.

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
2. 특히 아래 값이 화면에 보여야 한다.
 - indicator_follow_rule_preview
 - mode: merge_add_candidate
 - candidates.buy.merge_into
 - candidates.buy.skip_existing
 - candidates.buy.add_conditions
 - candidates.sell.add_signal_candidate
3. 기존 [Rule Mapper Diff] 출력은 유지한다.

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
3. GUI 쪽 검토 대상
gui_indicator_follow_data_tabs.py
gui_indicator_follow_routine_settings_dialog.py
gui_indicator_follow_sell_controls.py
gui_indicator_follow_buy_controls.py
여긴 대부분 현재 indicator_follow 이름으로 이미 바뀌었지만, 내부에 아직:

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
반드시 화면에 보여야 할 항목:
- indicator_follow_rule_preview
- mode: merge_add_candidate
- candidates.buy.merge_into
- candidates.buy.skip_existing
- candidates.buy.add_conditions
- candidates.sell.add_signal_candidate

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
검증:
- py_compile
- offscreen 설정창 생성
- has_indicator_follow_rule_preview True
- has_merge_add_candidate True
- has_buy_merge_candidate True
- has_sell_add_signal_candidate True
- has_rule_mapper_diff True
- rules_mtime_unchanged True
<--직전에 네가 준 코덱스 아직유효한가?
아니요. 이미 완료된 지시라서 더 이상 유효하지 않습니다.
그 지시는 직전에 코덱스가 이미 수행했습니다.
완료 확인된 내용:

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
gui_indicator_follow_routine_settings_dialog.py 최소 수정 완료
[Rule Mapper Preview]에 indicator_follow_rule_preview 표시 완료
mode: merge_add_candidate 표시 완료
buy merge candidate 표시 완료
sell add signal candidate 표시 완료
py_compile 통과
offscreen 설정창 생성 성공
rules.json 미수정 확인
따라서 지금 같은 지시를 다시 보내면 중복 작업입니다.
현재 다음 유효 작업은 이것입니다.

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
- 003550_LG/candles.json: 존재, 60개
- start_signal_probe_only_for_selected_stocks():
 - MONITORING
 - trade_enabled=true
 - real_trade_enabled=false
 - buy_enabled=false
 - sell_enabled=false
 - signal_probe_only=true
- 이후 stop_signal_probe_only_for_selected_stocks()로 STOPPED 복구 완료
- orders.json: 변경 없음
- rules.json: 변경 없음
- runtime/order_queue.json: 생성 없음
- runtime/routine_signals.json: 변경 없음
확인된 문제:

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
키움 분봉 candles.json
→ timer tick
→ routine_signal_probe
→ 지표추종매매 엔진
→ SELL 신호 생성
→ routine_signals.json
→ consumer(mark_previewed=True)
→ OrderManager dry-run
→ BLOCKED 전이
→ 주문 없음
성공 판정:
신규 신호 생성: 20260703_085128_003550_SELL_5
최종 status: BLOCKED
PENDING 0건
상태바 summary 정상
order_queue.json 없음
orders.json 변경 없음
rules.json 변경 없음
SendOrder 없음
테스트 후 state 복구 완료
이제 현재 단계는 “키움 데이터 기반 전체 검증 루프 1차 완료”로 보면 됩니다.
다음
다음은 이번 단계 마무리 문서화가 맞습니다.
이제 단기 목표였던:

[출처: 작업진행상황대화히스토리_9.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:55:05 | 분류: 대화히스토리]
키움 서버 데이터
→ candles.json
→ 루틴 엔진
→ BUY/SELL 신호
→ queue
→ consumer
→ OrderManager dry-run
→ 주문 차단
이 실제로 통과했습니다.
따라서 다음 구현으로 바로 넘어가기 전에 아래 2개를 만들어두는 게 안전합니다.
작업재개요약
다음 창에서 바로 이어갈 수 있는 현재 상태
성공한 검증 루트
남은 작업
주의사항
MASTER_SPEC 갱신자료

[출처: 작업재개요약서_2026-07-03_주문파이프라인_아키텍처설계_중간정리.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:02:24 | 분류: 작업재개요약]
핵심 필드:
- position_id
- code
- holding_qty
- available_qty
- avg_price
- total_buy_amount
- realized_pnl
- unrealized_pnl
- source_order_ids
- source_fill_ids

[출처: 작업재개요약서_2026-07-03_주문파이프라인_아키텍처설계_중간정리.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 13:02:24 | 분류: 작업재개요약]
흐름:
Position
 ↓ 청산 결정
SELL Order
 ↓ Execution
Fill
 ↓ Position 감소
holding_qty == 0
 ↓
Close History

[출처: 작업재개요약서_2026-07-03_주문파이프라인_Preview.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 10:42:48 | 분류: 작업재개요약]
1) Routine Signal Queue
- runtime/routine_signals.json의 PENDING BUY/SELL 신호를 소비 대상으로 읽는다.
- 기본 dry-run 모드는 파일을 변경하지 않는다.
- mark_previewed=True일 때만 routine_signals.json의 status를 PREVIEWED/BLOCKED/ERROR로 전이한다.

[출처: 작업재개요약서_2026-07-03_주문파이프라인_Preview.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 10:42:48 | 분류: 작업재개요약]
tests/test_order_queue_approval_scenarios.py
- BUY/SELL 후보 생성 및 approval 시나리오 검증
- SELL 보유수량 0 -> BLOCKED
- SELL 보유수량 있음 -> APPROVED
- BUY -> APPROVED
- execution_enabled=false 유지

[출처: 작업재개요약서_2026-07-03_주문파이프라인_Preview.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 10:42:48 | 분류: 작업재개요약]
tests/test_kiwoom_order_adapter_preview.py
- REAL_READY SELL/BUY -> request_preview 생성
- guard 없음 -> skipped
- APPROVED/EXECUTABLE/BLOCKED_REAL -> skipped
- 없는 order_id -> not_found
- queue 파일 미변경
- send_order_stub 미호출
4. 검증 명령
수행된 주요 검증 명령:

[출처: 작업재개요약서_2026-07-03_주문파이프라인_Preview.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 10:42:48 | 분류: 작업재개요약]
2) build_kiwoom_order_request() 테스트 보강
- BUY/SELL side, account_no, quantity, price, unknown side 고정.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\EngineRule_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:13:12 | 분류: MASTER_SPEC]
주의:
- Pending이 있어도 실제 engine rules는 변경되지 않는다.
- Pending 저장을 하더라도 buy/sell rules에는 반영하지 않는다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\EngineRule_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:13:12 | 분류: MASTER_SPEC]
현재 GUI 표시:
- [Rule Mapper Approval Simulation - Not Saved]
- simulation_only = true
- not_saved = true
- not_applied = true
현재 simulation 종류:
- no_approval
- buy_only
- sell_only
보류:
- both-approved simulation은 아직 구현하지 않음

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\EngineRule_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:13:12 | 분류: MASTER_SPEC]
주의:
- Approved는 “승인 기록”이다.
- 실제 buy/sell rules가 바뀐 상태는 Applied다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\EngineRule_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:13:12 | 분류: MASTER_SPEC]
적용 대상:
- buy.groups[0].conditions append
- sell.signals.ui_condition_c_indicator_sell add

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\EngineRule_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:13:12 | 분류: MASTER_SPEC]
금지:
- sell.signals.macd_sell 변경 금지
- 기존 buy condition 삭제 금지
- 기존 conditions_logic 임의 변경 금지
- indicators/order_policy/cancel_policy/safety 임의 변경 금지

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\EngineRule_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:13:12 | 분류: MASTER_SPEC]
상태: Pending
허용:
- 화면 표시
- 향후 별도 namespace 저장 검토
금지:
- buy/sell 직접 반영
- 실행

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\EngineRule_LifeCycle_StateMachine_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:13:12 | 분류: MASTER_SPEC]
상태: Approval Simulation
허용:
- 검증 화면 표시
- no_approval/buy_only/sell_only 요약
금지:
- 실제 승인 처리
- 저장
- 실행

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\RuleMapper_승인구조_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:09:52 | 분류: MASTER_SPEC]
6. Approval Simulation GUI 표시
- [Rule Mapper Approval Simulation - Not Saved]
- simulation_only = true
- not_saved = true
- not_applied = true
- no_approval / buy_only / sell_only 요약 표시
- both-approved simulation은 아직 구현하지 않음

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\RuleMapper_승인구조_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:09:52 | 분류: MASTER_SPEC]
5단계: Approval Simulation 확인
- approve_engine_rule_candidates()를 저장 없이 호출
- buy-only / sell-only 결과 요약 확인
- 실제 반영 아님

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\RuleMapper_승인구조_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:09:52 | 분류: MASTER_SPEC]
BUY:
- buy.groups[0].conditions
- 기존 OSC TURN_UP은 중복 추가 금지
- UI OCR threshold 조건만 append 후보

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\RuleMapper_승인구조_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:09:52 | 분류: MASTER_SPEC]
주의:
- sell add signal은 BUY merge보다 위험도가 높음
- 실제 엔진 연결 전까지는 pending/approved 기록 수준이 적절

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\RuleMapper_승인구조_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:09:52 | 분류: MASTER_SPEC]
- buy
- sell
- indicators
- order_policy
- cancel_policy
- safety
- indicator_follow_ui_state
단, 승인 대상에 포함된 세부 path만 예외로 둔다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\RuleMapper_승인구조_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:09:52 | 분류: MASTER_SPEC]
3. Actual rules apply 테스트
- buy merge 승인 시 threshold append
- OSC TURN_UP 중복 없음
- sell add signal 승인 시 macd_sell 불변
- ui_condition_c_indicator_sell 추가
- unknown path skip/warning

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\RuleMapper_승인구조_설계문서_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 17:09:52 | 분류: MASTER_SPEC]
5. Actual rules apply 설계
- buy merge
- sell add signal
- snapshot/diff 검증
6. Actual rules 저장 구현
- 별도 버튼
- 별도 함수
- 강한 검증
7. Engine 연결
- 가장 마지막

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:22:12 | 분류: MASTER_SPEC]
당분간 변경 금지:
- sell.signals.macd_sell
- rules.json 내부 macd 관련 key
- target: MACD
- target: OSC
- 기존 buy/sell/indicators/order_policy/cancel_policy/safety 구조

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:22:12 | 분류: MASTER_SPEC]
Buy Preview:
- merge_into = buy.groups[0].conditions
- 기존 OSC TURN_UP 존재 시 skip_existing
- OCR threshold만 add_conditions 후보 생성

[출처: 마스터스펙\MASTER_SPEC_갱신자료_2026-07-02\MASTER_SPEC_갱신자료_RuleMapper_MergeCandidate_MACD_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 16:07:50 | 분류: 갱신문서]
- merge_into = buy.groups[0].conditions
- 기존 OSC TURN_UP 존재 시 skip_existing
- OCR Threshold만 add_conditions 후보 생성
Sell
기존
sell.signals.macd_sell
변경 금지.
새 후보
sell.signals.ui_preview_condition_c_macd_sell
속성
- enabled = false
- preview_candidate = true
5. Diff 정책
상태

[출처: 작업재개요약_및_MASTER_SPEC_갱신자료_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 13:57:47 | 분류: 작업재개요약]
기존 buy/sell/indicators/order_policy/cancel_policy/safety는 변경하지
않음.
현재 완료

[출처: 작업재개요약_및_MASTER_SPEC_갱신자료_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 13:57:47 | 분류: 작업재개요약]
buy_ui - signal_filter - base - repeat - price_compare - situation -
additional - cycle - exit

[출처: 작업재개요약_및_MASTER_SPEC_갱신자료_2026-07-02.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-02 13:57:47 | 분류: 작업재개요약]
sell_ui - signal_conditions - selected_sets - setting_a - setting_b -
setting_c
저장 제외
- buy_ui.close
- complete_ui
- legacy_summary
Apply 정책
Combo → LineEdit → CheckBox → 상태 Sync
Save 정책
기존 Rules 유지. indicator_follow_ui_state만 갱신.
Load 정책
indicator_follow_ui_state 존재 시 apply. 없으면 기존 populate 유지.
다음 작업

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
SELL 매도방식에서는 시장가를 시간 기준 주문 콤보에 넣지 않는 방향이었다.
BUY 매수방식에서는 시장가가 단일호가에서만 가능하도록 제한하는 로직이
있었다. 시장가 사용 가능 여부는 추후 메인 주문 정책과 충돌하지 않게
재검토한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
3.2 시간 기준 취소 문구 SELL: - 매도 미체결 발생 시 [매회/일괄] 기준
[20][분/초/봉] 후 주문취소
BUY: - 매수 미체결 발생 시 [매회/일괄] 기준 [20][분/초/봉] 후 주문취소
콤보 순서: - 분/초/봉

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
점검 대상 속성: - complete_after_cancel_check -
sell_complete_after_cancel_check - complete_after_cancel_line -
complete_after_cancel_unit_combo - complete_after_cancel_tail_label -
sell_complete_after_cancel_line -
sell_complete_after_cancel_unit_combo -
sell_complete_after_cancel_tail_label

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
6.2 필수 검증 파일 수정 후: - py_compile 실행 - 문자열 검색: - “마지막
주문 취소 이후”가 남아 있는지 - complete_after_cancel_check 참조가 남아
있는지 - sell_complete_after_cancel_check 참조가 남아 있는지 -
“QLabel("에")”가 남아 있는지 - 미체결정책 가격조건이 중복 추가되었는지 -
add_cancel_gap_row가 불필요하게 여러 번 호출되는지 - 가능하면 GUI 실행
테스트에서 루틴 설정창 열기까지 확인한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
6.3 PyQt 주의 - py_compile 통과는 런타임 안전을 보장하지 않는다. - 위젯
속성을 삭제하면 signal connect와 sync 함수에서 AttributeError가 발생할
수 있다. - UI 삭제는 반드시 참조 제거까지 같이 해야 한다. - 공통 함수
교체는 BUY/SELL 양쪽에 영향을 준다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
SELL 작업 원칙: - BUY와 동일 패턴을 참고한다. - 그러나 SELL 구조가 BUY와
완전히 같다고 단정하지 않는다. - SELL 고유 항목을 먼저 확인한다. - 확인
후 적용필터부터 단계별로 수정한다. - 임의 삭제 금지. - 명시된 항목만
수정.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
1. 현재 루틴의 구성 상태를 한눈에 보여준다.
2. BUY/SELL 구성을 상하 구조로 보여준다.
3. 각 설정 항목을 실제 컨트롤 위젯 형태로 배치한다.
4. 설정 항목의 모양을 먼저 잡고, 저장/로드/로직 연결은 후순위로 둔다.
5. 사용자는 첫 화면에서 별도 세부창으로 들어가지 않고, 가능한 한 컨트롤
 패널에서 직접 조정할 수 있어야 한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
기존처럼 “BUY 탭”, “SELL 탭”을 별도 공식 UI로 유지하는 방향은
폐기하였다. 현재 공식 탭은 다음으로 정리한다.
- 구성
- 고급
- 검증

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
============================================================ 2.
금지/주의 사항
============================================================
다음 표현은 공식 UI 용어로 사용하지 않는다.
- 법전
- BUY 법전
- SELL 법전
“법전”은 논의 과정에서 개념을 설명하기 위한 비유였을 뿐이며, 실제
프로그램 UI에는 사용하지 않는다.
다음 개념은 새로 만들지 않는다.
- HOLD
- 신호유지
- 재진입정책
- 추가 BUY 신호
- 평단 BUY 신호
- 다중 주신호 슬롯

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
루틴은 BUY/SELL/CANCEL 신호와 조건을 다룬다. BUY 신호는 모두 동등하다.
운영자가 결과적으로 2회차, 3회차 매수라고 부를 수는 있지만, 루틴 내부에
“추가 BUY”라는 별도 주신호를 만들지 않는다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
그러나 해당 영역은 의미가 약하고 화면 공간을 많이 차지하므로 공식 구성
화면에서는 제거한다. 단, 내부적으로 _populate_fields, refresh_preview가
참조하는 card_routine/card_buy/card_sell/card_profit/card_validation
객체는 유지해야 한다. 이 객체가 삭제되면 QLabel deleted RuntimeError가
발생한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
작성 목적: 본 문서는 MASTER_SPEC_v3.0 BASELINE 이후 MACD매매루틴 구현 중
발생한 HOLD 오염 사고, 해당 오염 제거 과정, rules.json 도입, SELL 신호
구조 갱신 내용을 마스터스펙에 반영하기 위한 갱신 자료이다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
AI가 일반 자동매매 엔진에서 흔히 쓰는 BUY / SELL / HOLD 구조를 사용자
확정 없이 MACD매매루틴 코드와 테스트에 반영하였다.
그러나 본 프로젝트에서 사용자가 확정한 루틴 신호 구조는 다음이다.
- BUY
- SELL
- 비신호
비신호는 신호가 아니다. 비신호는 HOLD라는 별도 신호로 저장하거나
처리하지 않는다.
따라서 HOLD는 본 프로젝트의 루틴 공식 신호가 아니며, AI가 임의로 생성한
오염 개념이다.
1.2 잘못 적용된 내용
다음과 같은 형태가 코드/테스트/문서에 들어갔다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- BUY / SELL / HOLD
- RoutineSignal(“HOLD”, …)
- 조건 미충족 → HOLD
- 봉데이터 부족 → HOLD
- 루틴 비활성 → HOLD
- HOLD 유지 가능
- 테스트 통과 조건에 HOLD 포함
위 내용은 모두 폐기 또는 수정 대상이다.
1.3 HOLD 제거 후 확정 구조
루틴 평가 결과는 다음 중 하나다.
- signal = “BUY”
- signal = “SELL”
- signal = None
signal=None은 비신호이다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
비신호 발생 예: - 조건 미충족 - 봉데이터 부족 - 루틴 비활성 - context
오류 - import 실패 - BUY/SELL로 확정되지 않은 판단

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
------------------------
 2. 루틴 신호 정의 갱신
 ------------------------
2.1 공식 주문신호
MACD매매루틴의 공식 주문신호는 다음 두 개만 사용한다.
- BUY
- SELL
2.2 비신호
비신호는 신호 없음이다. 비신호는 signal=None으로 표현한다.
비신호를 HOLD, WAIT, SKIP, NO_SIGNAL 등 별도 루틴 공식 신호로 승격하지
않는다.
2.3 SKIP/ERROR
SKIP과 ERROR는 루틴 공식 신호가 아니다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
현재 코드상 SKIP은 routine_signal_probe.py의 프로브/스캔 결과로
확인되었다. 예: - 감시 대상 아님 → signal=SKIP
이는 루틴 신호가 아니며, 주문큐 저장 대상도 아니다.
ERROR 역시 프로브/검사 결과이며, 루틴 공식 주문신호가 아니다.
2.4 큐 저장 기준
routine_signal_queue.py 기준:
- BUY만 저장
- SELL만 저장
- 그 외는 ignored
큐 저장 허용 신호: - BUY - SELL

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
예: - QDialogButtonBox.Cancel - CANCEL_REQUESTED - CANCELED -
CANCELLED - CANCEL_COMPLETE
이는 루틴 신호 개념이 아니다.
3.2 확정 원칙
CANCEL은 루틴 공식 신호가 아니다.
CANCEL은 필요 시 주문후보/주문관리/미체결관리/정정취소 계층에서 다룬다.
루틴은 다음 역할을 수행한다.
- BUY 판단
- SELL 판단
- 비신호 판단
- 주문정책 제안 가능
루틴이 직접 취소주문을 실행하거나 원주문번호를 관리하면 안 된다.
3.3 향후 확인 필요
CANCEL은 본 창에서 실제 구현하지 않았다. 향후 주문후보/주문관리 계층
설계 시 다시 확정해야 한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
기본 원칙: - signal_only=True - allowed_order_signals=[“BUY”, “SELL”] -
non_signal은 signal=None - execution_enabled=False - 주문 실행 주체는
main_order_engine
6.2 routine.py rules.json 자동 로드
routine.py는 다음 우선순위로 루틴 설정을 선택한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- BUY / SELL / 비신호(None)
- HOLD 제거
- condition_engine 기반 조건평가
- 조건그룹 내부 AND
- 조건그룹 간 OR
- NOT 반전
- OSC TURN_UP
- OSC TURN_DOWN
- RSI 비교
- MA TREND_UP / TREND_DOWN
- MACD CROSS_UP / CROSS_DOWN
- ZERO_CROSS
- 가격/거래량 계열 비교
- delay_bar
- rules.json 자동 로드
- sell.signals.macd_sell 구조 인식
- BUY/SELL만 routine_signals.json 큐 저장
- execution_enabled=False 유지
미구현/보류:

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- 사용자 확정 없는 HOLD 개념 생성
- 비신호를 HOLD라는 신호로 승격
- 코드, 테스트, 문서에 BUY/SELL/HOLD 구조 반영
- CANCEL의 기존 논의 위치를 즉시 파악하지 못함
- 현재 코드 상태와 과거 설계 철학을 혼동
- 수익률 매도 구현을 다음 작업으로 단정
- 확정/추정/미확정을 분리하지 않고 말함
- 사용자 승인 전 구현 방향을 앞서 제시
9.2 재발방지 원칙
향후 AI는 다음 원칙을 반드시 지킨다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- 매수(BUY)와 매도(SELL) 설정창은 서로 다른 기능을 수행하지만, 동일한
 UI 철학과 공통 구조를 유지한다.
- 공통 컴포넌트를 재사용하여 유지보수성과 일관성을 확보한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- 루틴 설정 UI와 실제 엔진의 역할을 명확히 분리한다.
- UI는 정책을 정의하고, 엔진은 정책을 실행한다.
2. 역할 분리 UI
- 사용자 설정 입력
- 정책 구성
- 활성/비활성 관리
- 저장 대상 생성
루틴 엔진 - BUY/SELL/CANCEL 신호 판단 - 조건 평가 - 실행 정책 제안
메인 엔진 - 주문 실행 - 주문취소 - 체결 관리 - 자금 관리 - 상태 관리

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- 루틴은 전략과 신호만 담당한다.
- 주문 실행은 메인 엔진이 담당한다.
- 루틴은 주문을 직접 수행하지 않는다.
2. 신호 종류
- BUY
- SELL
- CANCEL
신호는 실행 명령이 아니라 전략 판단 결과이다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
7. 검증 항목 □ BUY 생성 □ SELL 생성 □ CANCEL 생성 □ PLAN 전달 □ 메인
 엔진 연계 □ 상태 기록

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
3. 기본 실행 흐름 대기 → 신호검출 → 조건평가 → BUY/SELL/CANCEL 결정 →
 주문요청 → 체결대기 → 후속정책 → 완료 → 대기
4. 주문 상태
- 주문대기
- 주문접수
- 부분체결
- 전체체결
- 미체결
- 주문취소
- 종료
5. 루틴 상태
- 비활성
- 대기
- 실행중
- 후속정책 수행
- 완료
- 종료
6. 상태전이 원칙

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
2. 최상위 계층 ① UI 계층 ② 설정/저장 계층 ③ 루틴 엔진 계층 ④ 메인 실행
 계층 ⑤ OpenAPI 연동 계층
3. UI 계층 책임
- 사용자 입력
- 정책 구성
- 상태 표시
- 활성/비활성 제어
- 데이터 편집
4. 설정/저장 계층 책임
- 설정값 직렬화
- JSON 저장/로드
- 버전 관리
- 기본값 관리
5. 루틴 엔진 책임
- BUY/SELL/CANCEL 판단
- 조건 평가
- 정책 계산
- 후속 정책 결정
6. 메인 실행 계층 책임
- 주문 요청
- 체결 관리
- 자금 관리
- 종목 상태 관리
- 운영 정책 적용
7. OpenAPI 계층 책임
- 시세 수신
- 주문 송수신
- 체결 이벤트
- 서버 상태 확인
8. 계층 간 통신 원칙

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- 입력기와 내부 해석은 동일해야 한다.
- 사용자가 보는 조건식과 엔진 해석이 달라져서는 안 된다.
- 동일 규칙을 BUY/SELL 조건 모두에 적용한다.
5. 구현 원칙

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
================================================================================
파일:
MASTER_SPEC_누락보강_44_히스토리기반_HOLD제거_BUY_SELL_CANCEL체계.txt
================================================================================

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
MASTER_SPEC 누락보강 44 주제 : 히스토리 기반 HOLD 개념 제거 및
BUY/SELL/CANCEL 체계 확정
출처 : 작업진행상황대화히스토리 및 프로젝트 복구 이력 비교 반영

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
1. 목적 루틴 신호 체계를 프로젝트 전체에서 하나의 기준으로 통일하고,
 과거 검토 과정에서 발생한 HOLD 개념 혼입을 공식적으로 배제한다.
2. 최종 신호 체계 루틴이 생성할 수 있는 공식 신호는 다음 세 가지로
 한정한다.
- BUY
- SELL
- CANCEL
위 세 신호 외의 상태는 루틴 신호로 사용하지 않는다.
3. HOLD 정책

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- HOLD는 루틴 신호가 아니다.
- 대기 상태를 의미하는 내부 운영 개념으로도 사용하지 않는다.
- 문서, UI, 엔진에서 공식 신호로 정의하지 않는다.
4. CANCEL 역할

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- 루틴이 현재 주문 또는 진행 정책을 취소해야 함을 알리는 신호이다.
- CANCEL 이후 실제 주문 취소, 상태 변경, 후속 처리 여부는 메인 엔진이
 결정한다.
5. 책임 분리 루틴
- BUY / SELL / CANCEL 판단
메인 엔진 - 주문 수행 - 주문 취소 - 상태 변경 - 후속 정책 수행
6. 구현 원칙

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
7. 검증 항목 □ BUY 생성 □ SELL 생성 □ CANCEL 생성 □ HOLD 미사용 확인 □
 UI·JSON·엔진 신호 일치

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
1. 목적 BUY 신호 이후의 모든 매수 진행을 하나의 ’매수계획(BUY
 PLAN)’으로 관리하기 위한 공통 구조를 정의한다.
2. 기본 개념

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- BUY 신호가 발생하면 즉시 주문하는 것이 아니라 매수계획을 생성한다.
- 매수계획은 목표 금액 또는 목표 수량이 달성될 때까지 유지된다.
- 단일매수와 다중매수는 모두 동일한 BUY PLAN 구조를 사용한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
3. 처리 흐름 ① BUY 신호 발생 ② BUY PLAN 생성 ③ 주문 수행 ④ 체결 결과
 확인 ⑤ 완료 또는 미완성 판정 ⑥ 필요 시 루틴 정책에 따라 후속 처리
4. 완료 기준
- 목표 금액 충족 또는
- 목표 수량 충족
체결률은 표시 정보이며 완료 판정 기준으로 사용하지 않는다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
================================================================================
파일:
MASTER_SPEC_누락보강_64_히스토리기반_연속BUY신호_기존BUYPLAN연계정책.txt
================================================================================

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
MASTER_SPEC 누락보강 64 주제 : 히스토리 기반 연속 BUY 신호 처리 및 기존
BUY PLAN 연계 정책
출처 : 작업진행상황대화히스토리_3~8 비교 반영

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
1. 목적 BUY PLAN이 진행 중인 상태에서 새로운 BUY 신호가 발생하는 경우의
 처리 원칙을 표준화한다.
2. 기본 원칙

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- 연속 BUY 신호가 발생하더라도 즉시 새로운 BUY PLAN을 생성하지 않는다.
- 기존 BUY PLAN의 상태를 먼저 확인한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
5. 완료 상태 처리 기존 BUY PLAN이 완료된 경우에는 새로운 BUY 신호에
 대해 새로운 BUY PLAN을 생성할 수 있다.
6. 역할 분리 루틴
- 연속 BUY 허용 정책
- 기존 계획 연계 기준
- 새 계획 생성 조건
메인 - BUY PLAN 상태 관리 - 주문 실행 - 체결 결과 반영
7. 구현 원칙

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- BUY 신호 생성
- BUY PLAN 생성 조건
- 목표 금액/수량 정의
- 재매수 허용 여부
- 유효 봉, 유효 시간, 가격 조건
- 완료 및 종료 정책 정의
4. 메인의 책임

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
3. 상태 흐름 ① BUY 신호 발생 ② BUY PLAN 생성 ③ 주문 진행 ④ 체결 확인 ⑤
 완료 또는 미완성 판정 ⑥ 종료 또는 후속 정책 수행
4. 미완성 상태

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
================================================================================
파일:
MASTER_SPEC_누락보강_72_히스토리기반_BUYPLAN_CANCEL처리_후속정책.txt
================================================================================
MASTER_SPEC 누락보강 72 주제 : 히스토리 기반 BUY PLAN CANCEL 처리 및
후속 정책
출처 : 작업진행상황대화히스토리_3~8 비교 반영

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
1. 목적 BUY PLAN 진행 중 CANCEL 신호가 발생하는 경우의 처리 기준과 후속
 정책을 정의한다.
2. 기본 원칙

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- CANCEL은 실패를 의미하지 않는다.
- CANCEL은 루틴이 판단하는 신호이며, 실행은 메인이 담당한다.
- CANCEL 처리 후 BUY PLAN의 상태를 일관되게 관리한다.
3. CANCEL 발생 조건
- 루틴에서 CANCEL 신호 발생
- 루틴 정책상 매수 중단 조건 충족
- 운영 정책에 의한 중단 요청

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
4. 처리 절차 ① CANCEL 신호 수신 ② BUY PLAN 상태 확인 ③ 미체결 주문 처리
 ④ BUY PLAN 종료 또는 후속 정책 수행 ⑤ 상태 및 로그 기록
5. 역할 분리 루틴
- CANCEL 신호 생성
- CANCEL 조건 정의
메인 - 주문 취소 - BUY PLAN 종료 처리 - 상태 기록
6. 구현 원칙

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- CANCEL을 BUY_FAILED와 동일하게 처리하지 않는다.
- 미체결 주문은 운영 정책에 따라 정리한다.
- CANCEL 사유를 반드시 기록한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
7. 검증 항목 □ CANCEL 신호 수신 □ 주문 취소 □ BUY PLAN 종료 □ 상태 기록
 □ 로그 기록

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- BUY PLAN 생성
- 주문 요청
- 체결 결과
- 부분 체결
- 재매수 수행
- CANCEL 처리
- 완료
- 미완성
- 실패
- 종료

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
================================================================================
파일:
MASTER_SPEC_누락보강_74_히스토리기반_BUYPLAN_SELLPLAN_대칭설계원칙.txt
================================================================================

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
MASTER_SPEC 누락보강 74 주제 : 히스토리 기반 BUY PLAN과 SELL PLAN의 대칭
설계 원칙
출처 : 작업진행상황대화히스토리_3~8 비교 반영

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- BUY PLAN과 SELL PLAN은 서로 다른 전략이지만 동일한 구조를 사용한다.
- 한쪽에서 검증된 상태 관리와 정책은 다른 쪽에도 동일한 기준을
 적용한다.
- 공통 개념은 공유하고, 전략은 각각 독립적으로 정의한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- BUY와 SELL의 상태 관리 인터페이스를 가능한 한 동일하게 유지한다.
- 상태명, 로그 형식, 복구 절차를 일관성 있게 설계한다.
- 한쪽 기능 변경 시 다른 쪽에도 동일한 구조 적용 여부를 검토한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- 주문 엔진은 PLAN을 실행하는 공통 실행 계층이다.
- BUY PLAN과 SELL PLAN은 동일한 실행 구조를 공유한다.
- 전략은 루틴이 정의하고, 실행은 주문 엔진이 담당한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- BUY와 SELL을 별도의 엔진으로 분리하지 않는다.
- 공통 상태 관리와 공통 실행 절차를 사용한다.
- 로그와 복구 체계도 동일한 인터페이스를 따른다.
7. 검증 항목 □ PLAN 생성 □ 주문 실행 □ 체결 처리 □ 상태 전이 □ 종료
 처리 □ 복구 처리

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- BUY/SELL 외 새로운 PLAN 유형도 동일 인터페이스를 따른다.
- 공통 상태명과 생명주기를 유지한다.
- 로그와 복구 형식도 동일 규격을 사용한다.

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- 신호 발생
- 주문 접수
- 체결
- 부분 체결
- 재시도
- CANCEL
- 유효조건 종료
- 운영 종료
6. 구현 원칙

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
1. 목적 PLAN(BUY/SELL)의 상태 전이가 이벤트 기반으로만 수행되도록 공통
 처리 규칙을 정의한다.
2. 기본 원칙

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- 신호 생성
- PLAN 생성
- 주문 요청
- 주문 접수
- 부분 체결
- 전체 체결
- 재시도
- CANCEL
- 유효조건 종료
- 운영 종료

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
1. 목적 PLAN(BUY/SELL) 처리 중 예외 상황이 발생했을 때 일관된 복구
 절차와 우선순위를 적용하기 위한 기준을 정의한다.
2. 기본 원칙

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- 단일매수와 다중매수는 동일한 PLAN 구조를 사용한다.
- BUY와 SELL은 대칭 구조를 유지한다.
- 완료와 실패 사이에는 ‘미완성’ 상태를 독립적으로 관리한다.
- CANCEL은 실패와 동일하게 취급하지 않는다.
5. 구현 원칙

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
7. 검증 기준 □ 공통 상태 일관성 □ 이벤트 기반 전이 □ 로그 일치 □ 복구
 일치 □ BUY/SELL 대칭성 □ PLAN 독립성

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
3. 전체 처리 순서 ① 루틴 등록 ② 루틴 선택 및 활성화 ③ 신호 검출 ④
 BUY/SELL PLAN 생성 ⑤ 주문 요청 생성 ⑥ 주문 실행 ⑦ 체결 감시 ⑧ 상태
 갱신 ⑨ 완료·미완성·실패 판정 ⑩ PLAN 종료 및 기록
4. 역할 분리 루틴
- 신호 생성
- 정책 정의
- 종료 조건 정의
PLAN - 주문 대상 관리 - 상태 관리 - 생명주기 관리
주문 엔진 - 주문 전송 - 체결 확인 - 상태 반영
5. 구현 원칙

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
- 신규 루틴은 기존 프레임워크를 재사용한다.
- 공통 엔진 수정은 최소화한다.
- BUY/SELL 외 새로운 PLAN도 동일 구조를 따른다.
6. 유지보수 원칙

[출처: 마스터스펙\MASTER_SPEC_단순통합_MACD_명칭_사용처_전수조사_및_일반화_기준_2026-07-02\MASTER_SPEC_단순통합_1차.txt | 기준일: 2026-07-02 | 수정시각: 2026-07-01 07:50:08 | 분류: MASTER_SPEC]
5. 주문 처리 검증 □ PLAN을 기준으로 주문이 실행되는가 □ BUY/SELL 모두
 동일한 실행 구조를 사용하는가 □ 부분 체결 및 미완성 처리가
 정상적인가

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_05.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:30 | 분류: MASTER_SPEC]
MASTER_SPEC 누락보강 64 주제 : 히스토리 기반 연속 BUY 신호 처리 및 기존
BUY PLAN 연계 정책

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_05.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:30 | 분류: MASTER_SPEC]
1. 목적 BUY PLAN이 진행 중인 상태에서 새로운 BUY 신호가 발생하는 경우의
 처리 원칙을 표준화한다.

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_05.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:30 | 분류: MASTER_SPEC]
5. 완료 상태 처리 기존 BUY PLAN이 완료된 경우에는 새로운 BUY 신호에
 대해 새로운 BUY PLAN을 생성할 수 있다.
- 연속 BUY 허용 정책
- 기존 계획 연계 기준
- 새 계획 생성 조건
메인 - BUY PLAN 상태 관리 - 주문 실행 - 체결 결과 반영

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_05.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:30 | 분류: MASTER_SPEC]
- BUY 신호 생성
- BUY PLAN 생성 조건
- 목표 금액/수량 정의
- 유효 봉, 유효 시간, 가격 조건
- 완료 및 종료 정책 정의
4. 메인의 책임

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_05.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:30 | 분류: MASTER_SPEC]
MASTER_SPEC 누락보강 70 주제 : 히스토리 기반 BUY PLAN 완료·미완성·실패
최종 판정 체계

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_05.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:30 | 분류: MASTER_SPEC]
================================================================================
파일:
MASTER_SPEC_누락보강_72_히스토리기반_BUYPLAN_CANCEL처리_후속정책.txt
================================================================================
MASTER_SPEC 누락보강 72 주제 : 히스토리 기반 BUY PLAN CANCEL 처리 및
후속 정책

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_05.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:30 | 분류: MASTER_SPEC]
1. 목적 BUY PLAN 진행 중 CANCEL 신호가 발생하는 경우의 처리 기준과 후속
 정책을 정의한다.

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_05.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:30 | 분류: MASTER_SPEC]
4. 처리 절차 ① CANCEL 신호 수신 ② BUY PLAN 상태 확인 ③ 미체결 주문 처리
 ④ BUY PLAN 종료 또는 후속 정책 수행 ⑤ 상태 및 로그 기록
- CANCEL 신호 생성
- CANCEL 조건 정의
메인 - 주문 취소 - BUY PLAN 종료 처리 - 상태 기록

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_05.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:30 | 분류: MASTER_SPEC]
- BUY PLAN의 모든 주요 상태 변화는 기록한다.
- 로그와 내부 상태는 서로 일치해야 한다.
- 복구 시 기록을 기준으로 상태를 재구성한다.
3. 기록 대상
- 체결 결과
- 재매수 수행
- CANCEL 처리
- 미완성

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_05.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:30 | 분류: MASTER_SPEC]
MASTER_SPEC 누락보강 74 주제 : 히스토리 기반 BUY PLAN과 SELL PLAN의 대칭
설계 원칙

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_05.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:30 | 분류: MASTER_SPEC]
- BUY PLAN과 SELL PLAN은 서로 다른 전략이지만 동일한 구조를 사용한다.
- 한쪽에서 검증된 상태 관리와 정책은 다른 쪽에도 동일한 기준을
- 공통 개념은 공유하고, 전략은 각각 독립적으로 정의한다.

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_05.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:30 | 분류: MASTER_SPEC]
1. 목적 주문 엔진을 BUY/SELL 개별 기능 중심이 아니라 PLAN 중심 구조로
 설계하기 위한 공통 원칙을 정의한다.

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_05.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:30 | 분류: MASTER_SPEC]
1. 목적 모든 PLAN(BUY/SELL)이 동일한 상태 전이 규칙을 따르도록 공통
 상태 머신 설계 원칙을 정의한다.

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_05.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:30 | 분류: MASTER_SPEC]
1. 목적 PLAN(BUY/SELL)의 상태 전이가 이벤트 기반으로만 수행되도록 공통
 처리 규칙을 정의한다.
- 상태는 이벤트에 의해 변경된다.
- 이벤트 없이 상태를 직접 변경하지 않는다.
3. 주요 이벤트
- 전체 체결

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_05.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:30 | 분류: MASTER_SPEC]
1. 목적 PLAN(BUY/SELL) 처리 중 예외 상황이 발생했을 때 일관된 복구
 절차와 우선순위를 적용하기 위한 기준을 정의한다.

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_05.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:30 | 분류: MASTER_SPEC]
3. PLAN 공통 생명주기 ① 신호 생성 ② PLAN 생성 ③ 주문 실행 ④ 체결 관리 ⑤
 완료·미완성·실패 판정 ⑥ 종료 ⑦ 로그 및 복구
4. 공통 운영 원칙
- 단일매수와 다중매수는 동일한 PLAN 구조를 사용한다.
- BUY와 SELL은 대칭 구조를 유지한다.
- 완료와 실패 사이에는 ‘미완성’ 상태를 독립적으로 관리한다.
- CANCEL은 실패와 동일하게 취급하지 않는다.
- 공통 인터페이스 유지
- 공통 상태 머신 사용
- 공통 이벤트 처리 규칙 적용
- 공통 로그 및 복구 체계 유지
- 루틴 독립성 보장
6. 유지보수 원칙

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_05.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:30 | 분류: MASTER_SPEC]
3. 전체 처리 순서 ① 루틴 등록 ② 루틴 선택 및 활성화 ③ 신호 검출 ④
 BUY/SELL PLAN 생성 ⑤ 주문 요청 생성 ⑥ 주문 실행 ⑦ 체결 감시 ⑧ 상태
 갱신 ⑨ 완료·미완성·실패 판정 ⑩ PLAN 종료 및 기록
4. 역할 분리 루틴
- 정책 정의
PLAN - 주문 대상 관리 - 상태 관리 - 생명주기 관리
주문 엔진 - 주문 전송 - 체결 확인 - 상태 반영

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_04.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:24 | 분류: MASTER_SPEC]
3. 기본 실행 흐름 대기 → 신호검출 → 조건평가 → BUY/SELL/CANCEL 결정 →
 주문요청 → 체결대기 → 후속정책 → 완료 → 대기
4. 주문 상태
- 주문대기
- 주문접수
- 부분체결
- 전체체결
- 미체결
- 주문취소
- 종료
5. 루틴 상태
- 비활성
- 대기
- 실행중
- 후속정책 수행
- 완료
6. 상태전이 원칙

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_04.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:24 | 분류: MASTER_SPEC]
2. 최상위 계층 ① UI 계층 ② 설정/저장 계층 ③ 루틴 엔진 계층 ④ 메인 실행
 계층 ⑤ OpenAPI 연동 계층
3. UI 계층 책임
- 사용자 입력
- 정책 구성
- 활성/비활성 제어
- 데이터 편집
4. 설정/저장 계층 책임
- 설정값 직렬화
- JSON 저장/로드
- 버전 관리
- 기본값 관리
5. 루틴 엔진 책임
- BUY/SELL/CANCEL 판단
- 조건 평가
- 정책 계산
- 후속 정책 결정
6. 메인 실행 계층 책임
- 주문 요청
- 체결 관리
- 자금 관리
- 종목 상태 관리
- 운영 정책 적용
7. OpenAPI 계층 책임
- 시세 수신
- 주문 송수신
- 체결 이벤트
- 서버 상태 확인
8. 계층 간 통신 원칙
- UI는 엔진을 직접 제어하지 않는다.
- 엔진은 UI 위젯을 참조하지 않는다.
- 데이터 구조를 통해서만 계층을 연결한다.
- 책임은 한 계층에만 둔다.
- 중복 구현을 금지한다.
- 공통 정책은 공통 모듈에서 관리한다.
- 계층 간 의존성은 최소화한다.
10. 장기 목표

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_02.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:10 | 분류: MASTER_SPEC]
누적 로그가 남아 있었다. 해당 로그와 runtime/routine_signals.json,
runtime/order_queue.json을 삭제 후 재생성하였다.
재실행 결과: - HOLD 없음 - SKIP 18건 - reason=감시 대상 아님 - 큐 저장
0건
판정: - SKIP은 프로브 상태이며 루틴 신호 아님. - 큐 저장 기준은 정상.

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_02.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:10 | 분류: MASTER_SPEC]
================================================================================
파일: MASTER_SPEC_누락보강_106_루틴엔진_신호처리_통합기준.txt
================================================================================
MASTER_SPEC 누락보강 106 주제 : 루틴 엔진 및 신호 처리 통합 기준

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_02.txt | 기준일: 2026-07-01 | 수정시각: 2026-07-01 08:03:10 | 분류: MASTER_SPEC]
- 루틴은 전략과 신호만 담당한다.
- 주문 실행은 메인 엔진이 담당한다.
- 루틴은 주문을 직접 수행하지 않는다.
2. 신호 종류
- BUY
- SELL
신호는 실행 명령이 아니라 전략 판단 결과이다.

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_01.txt | 기준일: 2026-06-30 | 수정시각: 2026-07-01 08:03:04 | 분류: MASTER_SPEC]
6.2 필수 검증 파일 수정 후: - py_compile 실행 - 문자열 검색: - “마지막
주문 취소 이후”가 남아 있는지 - complete_after_cancel_check 참조가 남아
있는지 - sell_complete_after_cancel_check 참조가 남아 있는지 -
“QLabel(”에”)”가 남아 있는지 - 미체결정책 가격조건이 중복 추가되었는지 -
add_cancel_gap_row가 불필요하게 여러 번 호출되는지 - 가능하면 GUI 실행
테스트에서 루틴 설정창 열기까지 확인한다.

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_01.txt | 기준일: 2026-06-30 | 수정시각: 2026-07-01 08:03:04 | 분류: MASTER_SPEC]
---------------------------------------
 1. HOLD 오염 사고 정리
 ---------------------------------------
 3. CANCEL 개념 위치 재정리
1 현재 확인 결과
재 코드에서 발견된 CANCEL은 대부분 GUI
 취소 버튼 또는 주문상태 코드다.

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_01.txt | 기준일: 2026-06-30 | 수정시각: 2026-07-01 08:03:04 | 분류: MASTER_SPEC]
: - QDialogButtonBox.Cancel -
 CANCEL_REQUESTED - CANCELED - NCELLED -
 CANCEL_COMPLETE
는 루틴 신호 개념이 아니다.
2 확정 원칙
NCEL은 루틴 공식 신호가 아니다.
NCEL은 필요 시
 주문후보/주문관리/미체결관리/정정취소
 계층에서 다룬다.
틴은 다음 역할을 수행한다.
BUY 판단 SELL 판단 비신호 판단 주문정책
 제안 가능
틴이 직접 취소주문을 실행하거나
 원주문번호를 관리하면 안 된다.
3 향후 확인 필요

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_01.txt | 기준일: 2026-06-30 | 수정시각: 2026-07-01 08:03:04 | 분류: MASTER_SPEC]
NCEL은 본 창에서 실제 구현하지 않았다.
 향후 주문후보/주문관리 계층 계 시 다시
 확정해야 한다.
 ---------------------------------------
4. HOLD 오염 제거 적용 파일
수정 적용 완료 파일:

[출처: ______MASTER_SPEC_통합본\MASTER_SPEC_통합본_01.txt | 기준일: 2026-06-30 | 수정시각: 2026-07-01 08:03:04 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
5. 검증 완료 내역
5.1 HOLD 제거 검증

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_106_루틴엔진_신호처리_통합기준.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:30:36 | 분류: MASTER_SPEC]
MASTER_SPEC 누락보강 106
주제 : 루틴 엔진 및 신호 처리 통합 기준
출처 : 작업진행상황대화히스토리 3~8 비교 반영

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_106_루틴엔진_신호처리_통합기준.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:30:36 | 분류: MASTER_SPEC]
1. 기본 원칙
- 루틴은 전략과 신호만 담당한다.
- 주문 실행은 메인 엔진이 담당한다.
- 루틴은 주문을 직접 수행하지 않는다.
2. 신호 종류
- BUY
- SELL
- CANCEL
신호는 실행 명령이 아니라 전략 판단 결과이다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_85_히스토리기반_PLAN중심_자동매매프레임워크_최종설계원칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:22:22 | 분류: MASTER_SPEC]
5. 확장 원칙
- 신규 루틴은 기존 프레임워크를 재사용한다.
- 공통 엔진 수정은 최소화한다.
- BUY/SELL 외 새로운 PLAN도 동일 구조를 따른다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_82_히스토리기반_루틴등록_PLAN생성_주문실행_전체흐름.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:22:04 | 분류: MASTER_SPEC]
3. 전체 처리 순서
① 루틴 등록
② 루틴 선택 및 활성화
③ 신호 검출
④ BUY/SELL PLAN 생성
⑤ 주문 요청 생성
⑥ 주문 실행
⑦ 체결 감시
⑧ 상태 갱신
⑨ 완료·미완성·실패 판정
⑩ PLAN 종료 및 기록
4. 역할 분리
루틴
- 신호 생성
- 정책 정의
- 종료 조건 정의
PLAN
- 주문 대상 관리
- 상태 관리
- 생명주기 관리
주문 엔진
- 주문 전송
- 체결 확인
- 상태 반영

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_80_히스토리기반_PLAN설계철학_종합_공통운영원칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:21:56 | 분류: 운영정책]
4. 공통 운영 원칙
- 단일매수와 다중매수는 동일한 PLAN 구조를 사용한다.
- BUY와 SELL은 대칭 구조를 유지한다.
- 완료와 실패 사이에는 '미완성' 상태를 독립적으로 관리한다.
- CANCEL은 실패와 동일하게 취급하지 않는다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_78_히스토리기반_PLAN이벤트처리_상태전이규칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:21:40 | 분류: MASTER_SPEC]
1. 목적
PLAN(BUY/SELL)의 상태 전이가 이벤트 기반으로만 수행되도록
공통 처리 규칙을 정의한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_78_히스토리기반_PLAN이벤트처리_상태전이규칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:21:40 | 분류: MASTER_SPEC]
3. 주요 이벤트
- 신호 생성
- PLAN 생성
- 주문 요청
- 주문 접수
- 부분 체결
- 전체 체결
- 재시도
- CANCEL
- 유효조건 종료
- 운영 종료

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_77_히스토리기반_PLAN공통상태머신_설계원칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:21:36 | 분류: MASTER_SPEC]
5. 이벤트 기준
- 신호 발생
- 주문 접수
- 체결
- 부분 체결
- 재시도
- CANCEL
- 유효조건 종료
- 운영 종료

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_76_히스토리기반_PLAN공통인터페이스_루틴독립성원칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:21:30 | 분류: MASTER_SPEC]
6. 확장 기준
- BUY/SELL 외 새로운 PLAN 유형도 동일 인터페이스를 따른다.
- 공통 상태명과 생명주기를 유지한다.
- 로그와 복구 형식도 동일 규격을 사용한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_75_히스토리기반_PLAN중심_주문엔진구조_확장원칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:21:24 | 분류: MASTER_SPEC]
2. 기본 철학
- 주문 엔진은 PLAN을 실행하는 공통 실행 계층이다.
- BUY PLAN과 SELL PLAN은 동일한 실행 구조를 공유한다.
- 전략은 루틴이 정의하고, 실행은 주문 엔진이 담당한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_75_히스토리기반_PLAN중심_주문엔진구조_확장원칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:21:24 | 분류: MASTER_SPEC]
6. 구현 원칙
- BUY와 SELL을 별도의 엔진으로 분리하지 않는다.
- 공통 상태 관리와 공통 실행 절차를 사용한다.
- 로그와 복구 체계도 동일한 인터페이스를 따른다.
7. 검증 항목
□ PLAN 생성
□ 주문 실행
□ 체결 처리
□ 상태 전이
□ 종료 처리
□ 복구 처리

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_74_히스토리기반_BUYPLAN_SELLPLAN_대칭설계원칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:21:20 | 분류: MASTER_SPEC]
2. 기본 철학
- BUY PLAN과 SELL PLAN은 서로 다른 전략이지만 동일한 구조를 사용한다.
- 한쪽에서 검증된 상태 관리와 정책은 다른 쪽에도 동일한 기준을 적용한다.
- 공통 개념은 공유하고, 전략은 각각 독립적으로 정의한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_74_히스토리기반_BUYPLAN_SELLPLAN_대칭설계원칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:21:20 | 분류: MASTER_SPEC]
3. 공통 생명주기
① PLAN 생성
② 주문 수행
③ 체결 확인
④ 부분 체결 관리
⑤ 완료 또는 미완성 판정
⑥ 종료 및 기록
4. 공통 상태
- PLAN 생성
- 진행 중
- 부분 체결
- 완료
- 미완성
- 실패
- 종료
5. 역할 분리
루틴
- 신호 생성
- PLAN 생성 조건
- 종료 정책
- 후속 정책 정의
메인
- 주문 실행
- 체결 관리
- 상태 전이
- 로그 및 복구

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_74_히스토리기반_BUYPLAN_SELLPLAN_대칭설계원칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:21:20 | 분류: MASTER_SPEC]
6. 구현 원칙
- BUY와 SELL의 상태 관리 인터페이스를 가능한 한 동일하게 유지한다.
- 상태명, 로그 형식, 복구 절차를 일관성 있게 설계한다.
- 한쪽 기능 변경 시 다른 쪽에도 동일한 구조 적용 여부를 검토한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_73_히스토리기반_BUYPLAN_로그상태기록_복구기준.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:21:14 | 분류: 구현로그/검증보고]
3. 기록 대상
- BUY PLAN 생성
- 주문 요청
- 체결 결과
- 부분 체결
- 재매수 수행
- CANCEL 처리
- 완료
- 미완성
- 실패
- 종료

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_72_히스토리기반_BUYPLAN_CANCEL처리_후속정책.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:21:08 | 분류: 운영정책]
MASTER_SPEC 누락보강 72
주제 : 히스토리 기반 BUY PLAN CANCEL 처리 및 후속 정책
출처 : 작업진행상황대화히스토리_3~8 비교 반영
1. 목적
BUY PLAN 진행 중 CANCEL 신호가 발생하는 경우의 처리 기준과 후속 정책을 정의한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_72_히스토리기반_BUYPLAN_CANCEL처리_후속정책.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:21:08 | 분류: 운영정책]
2. 기본 원칙
- CANCEL은 실패를 의미하지 않는다.
- CANCEL은 루틴이 판단하는 신호이며, 실행은 메인이 담당한다.
- CANCEL 처리 후 BUY PLAN의 상태를 일관되게 관리한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_72_히스토리기반_BUYPLAN_CANCEL처리_후속정책.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:21:08 | 분류: 운영정책]
3. CANCEL 발생 조건
- 루틴에서 CANCEL 신호 발생
- 루틴 정책상 매수 중단 조건 충족
- 운영 정책에 의한 중단 요청

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_72_히스토리기반_BUYPLAN_CANCEL처리_후속정책.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:21:08 | 분류: 운영정책]
4. 처리 절차
① CANCEL 신호 수신
② BUY PLAN 상태 확인
③ 미체결 주문 처리
④ BUY PLAN 종료 또는 후속 정책 수행
⑤ 상태 및 로그 기록
5. 역할 분리
루틴
- CANCEL 신호 생성
- CANCEL 조건 정의
메인
- 주문 취소
- BUY PLAN 종료 처리
- 상태 기록

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_72_히스토리기반_BUYPLAN_CANCEL처리_후속정책.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:21:08 | 분류: 운영정책]
6. 구현 원칙
- CANCEL을 BUY_FAILED와 동일하게 처리하지 않는다.
- 미체결 주문은 운영 정책에 따라 정리한다.
- CANCEL 사유를 반드시 기록한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_66_히스토리기반_BUYPLAN_상태전이_생명주기관리.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:08:42 | 분류: MASTER_SPEC]
3. 상태 흐름
① BUY 신호 발생
② BUY PLAN 생성
③ 주문 진행
④ 체결 확인
⑤ 완료 또는 미완성 판정
⑥ 종료 또는 후속 정책 수행

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_65_히스토리기반_루틴과메인의책임분리_BUYPLAN운영기준.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:08:34 | 분류: 운영정책]
3. 루틴의 책임
- BUY 신호 생성
- BUY PLAN 생성 조건
- 목표 금액/수량 정의
- 재매수 허용 여부
- 유효 봉, 유효 시간, 가격 조건
- 완료 및 종료 정책 정의

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_64_히스토리기반_연속BUY신호_기존BUYPLAN연계정책.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:08:26 | 분류: 운영정책]
2. 기본 원칙
- 연속 BUY 신호가 발생하더라도 즉시 새로운 BUY PLAN을 생성하지 않는다.
- 기존 BUY PLAN의 상태를 먼저 확인한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_64_히스토리기반_연속BUY신호_기존BUYPLAN연계정책.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:08:26 | 분류: 운영정책]
5. 완료 상태 처리
기존 BUY PLAN이 완료된 경우에는
새로운 BUY 신호에 대해 새로운 BUY PLAN을 생성할 수 있다.
6. 역할 분리
루틴
- 연속 BUY 허용 정책
- 기존 계획 연계 기준
- 새 계획 생성 조건
메인
- BUY PLAN 상태 관리
- 주문 실행
- 체결 결과 반영

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_64_히스토리기반_연속BUY신호_기존BUYPLAN연계정책.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:08:26 | 분류: 운영정책]
7. 구현 원칙
- 동일 종목에 중복 BUY PLAN을 무분별하게 생성하지 않는다.
- 기존 계획과의 관계를 우선 판단한다.
- 루틴 정책과 메인 실행 책임을 분리한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_61_히스토리기반_BUYPLAN_매수계획_공통구조.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:08:06 | 분류: MASTER_SPEC]
1. 목적
BUY 신호 이후의 모든 매수 진행을 하나의 '매수계획(BUY PLAN)'으로
관리하기 위한 공통 구조를 정의한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_61_히스토리기반_BUYPLAN_매수계획_공통구조.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 20:08:06 | 분류: MASTER_SPEC]
2. 기본 개념
- BUY 신호가 발생하면 즉시 주문하는 것이 아니라 매수계획을 생성한다.
- 매수계획은 목표 금액 또는 목표 수량이 달성될 때까지 유지된다.
- 단일매수와 다중매수는 모두 동일한 BUY PLAN 구조를 사용한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_44_히스토리기반_HOLD제거_BUY_SELL_CANCEL체계.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:50:52 | 분류: MASTER_SPEC]
1. 목적
루틴 신호 체계를 프로젝트 전체에서 하나의 기준으로 통일하고,
과거 검토 과정에서 발생한 HOLD 개념 혼입을 공식적으로 배제한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_44_히스토리기반_HOLD제거_BUY_SELL_CANCEL체계.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:50:52 | 분류: MASTER_SPEC]
2. 최종 신호 체계
루틴이 생성할 수 있는 공식 신호는 다음 세 가지로 한정한다.
- BUY
- SELL
- CANCEL
위 세 신호 외의 상태는 루틴 신호로 사용하지 않는다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_44_히스토리기반_HOLD제거_BUY_SELL_CANCEL체계.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:50:52 | 분류: MASTER_SPEC]
3. HOLD 정책
- HOLD는 루틴 신호가 아니다.
- 대기 상태를 의미하는 내부 운영 개념으로도 사용하지 않는다.
- 문서, UI, 엔진에서 공식 신호로 정의하지 않는다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_44_히스토리기반_HOLD제거_BUY_SELL_CANCEL체계.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:50:52 | 분류: MASTER_SPEC]
4. CANCEL 역할
- 루틴이 현재 주문 또는 진행 정책을 취소해야 함을 알리는 신호이다.
- CANCEL 이후 실제 주문 취소, 상태 변경, 후속 처리 여부는 메인 엔진이 결정한다.
5. 책임 분리
루틴
- BUY / SELL / CANCEL 판단
메인 엔진
- 주문 수행
- 주문 취소
- 상태 변경
- 후속 정책 수행

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_44_히스토리기반_HOLD제거_BUY_SELL_CANCEL체계.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:50:52 | 분류: MASTER_SPEC]
6. 구현 원칙
- 신호 종류를 임의로 추가하지 않는다.
- 신호 의미를 화면마다 다르게 해석하지 않는다.
- 모든 루틴은 동일한 신호 체계를 따른다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_43_히스토리기반_NOT연산규칙_입력기해석기준.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:50:46 | 분류: MASTER_SPEC]
4. 입력기 원칙
- 입력기와 내부 해석은 동일해야 한다.
- 사용자가 보는 조건식과 엔진 해석이 달라져서는 안 된다.
- 동일 규칙을 BUY/SELL 조건 모두에 적용한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_30_프로젝트전체아키텍처_계층별책임원칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:41:36 | 분류: MASTER_SPEC]
2. 최상위 계층
① UI 계층
② 설정/저장 계층
③ 루틴 엔진 계층
④ 메인 실행 계층
⑤ OpenAPI 연동 계층
3. UI 계층 책임
- 사용자 입력
- 정책 구성
- 상태 표시
- 활성/비활성 제어
- 데이터 편집
4. 설정/저장 계층 책임
- 설정값 직렬화
- JSON 저장/로드
- 버전 관리
- 기본값 관리
5. 루틴 엔진 책임
- BUY/SELL/CANCEL 판단
- 조건 평가
- 정책 계산
- 후속 정책 결정

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_29_상태전이_루틴실행흐름원칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:41:32 | 분류: MASTER_SPEC]
3. 기본 실행 흐름
대기
→ 신호검출
→ 조건평가
→ BUY/SELL/CANCEL 결정
→ 주문요청
→ 체결대기
→ 후속정책
→ 완료
→ 대기
4. 주문 상태
- 주문대기
- 주문접수
- 부분체결
- 전체체결
- 미체결
- 주문취소
- 종료
5. 루틴 상태
- 비활성
- 대기
- 실행중
- 후속정책 수행
- 완료
- 종료

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_11_매수미완성_매수실패판정철학.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:40:10 | 분류: MASTER_SPEC]
7. 연속 BUY 신호
- 기존 매수계획과의 관계를 우선 검토한다.
- 새로운 계획 생성보다 기존 계획의 상태를 먼저 확인한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_09_루틴엔진연계_UI엔진매핑원칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:39:54 | 분류: MASTER_SPEC]
1. 목적
- 루틴 설정 UI와 실제 엔진의 역할을 명확히 분리한다.
- UI는 정책을 정의하고, 엔진은 정책을 실행한다.
2. 역할 분리
UI
- 사용자 설정 입력
- 정책 구성
- 활성/비활성 관리
- 저장 대상 생성
루틴 엔진
- BUY/SELL/CANCEL 신호 판단
- 조건 평가
- 실행 정책 제안
메인 엔진
- 주문 실행
- 주문취소
- 체결 관리
- 자금 관리
- 상태 관리

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_08_매수매도_공통설계철학_구조통일원칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:39:50 | 분류: MASTER_SPEC]
1. 목적
- 매수(BUY)와 매도(SELL) 설정창은 서로 다른 기능을 수행하지만,
 동일한 UI 철학과 공통 구조를 유지한다.
- 공통 컴포넌트를 재사용하여 유지보수성과 일관성을 확보한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_08_매수매도_공통설계철학_구조통일원칙.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:39:50 | 분류: MASTER_SPEC]
6. 공통 명명 규칙
- '대비' 표현 사용
- 용어를 임의로 변경하지 않는다.
- BUY와 SELL에서 동일 의미는 동일 용어를 사용한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_07_루틴설정창_UI진화과정_설계변경이력.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:39:46 | 분류: MASTER_SPEC]
7. 입력 스타일 통일
- 신호검출조건을 기준 스타일로 사용
- 설정 입력도 동일 스타일 적용
- 그림자 효과 제거
- 흰색 강조 박스 사용 금지

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_04_입력컨트롤_UI통일정책.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:39:32 | 분류: 운영정책]
4. 입력칸(LineEdit) 정책
- 숫자는 우측 정렬.
- 높이는 신호검출조건 입력칸과 동일.
- 입력 가능한 범위는 이후 검증 엔진에서 관리한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_02_시나리오기반_매도설정구조.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:39:22 | 분류: MASTER_SPEC]
8. 수행 5
- 반복이탈조건 미사용 : 다음신호로 이월
- 반복이탈조건 사용 : 보유잔량시장가매도
- 별도 콤보 선택 없이 자동 표시

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_누락보강_01_루틴설정창_UI구조.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:39:16 | 분류: MASTER_SPEC]
6. 입력 컨트롤 정책
- 신호검출조건과 동일 스타일.
- 입력 높이, 정렬, 폭 통일.
- 콤보 잘림 금지.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_통합갱신자료_2026-06-30.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:21:22 | 분류: 갱신문서]
################################################################################
# 원본: MASTER_SPEC_갱신자료_주신호대응설정_UI재설계(2).txt
################################################################################
MASTER SPEC 갱신자료
UI 정책 변경
주신호대응설정
기존 매수방식/다중지점/세부상황설정 구조는 폐기 대상으로 전환.
새 구조
□ 기본매수방식 - 단일호가 / 다중호가 - 선택없음 / 다중시간 / 다중비율

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_통합갱신자료_2026-06-30.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:21:22 | 분류: 갱신문서]
예:
- 가격박스 [하향] [0.1]% [이상]
- 볼린저밴드 [하향] [0.1]% [이상]
- [주문가/현재가/평단가] 대비 [주문가/현재가/평단가] ...
5.2 조건 C 가격필터 추가
매도 신호검출조건 C 상단에 가격필터를 추가한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_통합갱신자료_2026-06-30.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:21:22 | 분류: 갱신문서]
6.2 필수 검증
파일 수정 후:
- py_compile 실행
- 문자열 검색:
 - "마지막 주문 취소 이후"가 남아 있는지
 - complete_after_cancel_check 참조가 남아 있는지
 - sell_complete_after_cancel_check 참조가 남아 있는지
 - "QLabel(\"에\")"가 남아 있는지
 - 미체결정책 가격조건이 중복 추가되었는지
 - add_cancel_gap_row가 불필요하게 여러 번 호출되는지
- 가능하면 GUI 실행 테스트에서 루틴 설정창 열기까지 확인한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_통합갱신자료_2026-06-30.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:21:22 | 분류: 갱신문서]
1. STEP40 실패
- BUY 탭을 새로 만들면서 buy_enabled_check 등 기존 위젯명을 제거했다.
- _populate_fields가 기존 이름을 참조하면서 AttributeError 발생.
- 교훈: 기존 로딩 로직이 참조하는 위젯명은 유지해야 한다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_통합갱신자료_2026-06-30.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:21:22 | 분류: 갱신문서]
------------------------------------------------------------
1. HOLD 오염 사고 정리
------------------------------------------------------------
1.1 발생 원인

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_통합갱신자료_2026-06-30.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:21:22 | 분류: 갱신문서]
- BUY / SELL / HOLD
- RoutineSignal("HOLD", ...)
- 조건 미충족 → HOLD
- 봉데이터 부족 → HOLD
- 루틴 비활성 → HOLD
- HOLD 유지 가능
- 테스트 통과 조건에 HOLD 포함
위 내용은 모두 폐기 또는 수정 대상이다.
1.3 HOLD 제거 후 확정 구조
루틴 평가 결과는 다음 중 하나다.
- signal = "BUY"
- signal = "SELL"
- signal = None
signal=None은 비신호이다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_통합갱신자료_2026-06-30.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:21:22 | 분류: 갱신문서]
------------------------------------------------------------
2. 루틴 신호 정의 갱신
------------------------------------------------------------
2.1 공식 주문신호
MACD매매루틴의 공식 주문신호는 다음 두 개만 사용한다.
- BUY
- SELL
2.2 비신호
비신호는 신호 없음이다.
비신호는 signal=None으로 표현한다.
비신호를 HOLD, WAIT, SKIP, NO_SIGNAL 등 별도 루틴 공식 신호로 승격하지 않는다.
2.3 SKIP/ERROR
SKIP과 ERROR는 루틴 공식 신호가 아니다.

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_통합갱신자료_2026-06-30.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:21:22 | 분류: 갱신문서]
------------------------------------------------------------
4. HOLD 오염 제거 적용 파일
------------------------------------------------------------
수정 적용 완료 파일:

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_통합갱신자료_2026-06-30.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:21:22 | 분류: 갱신문서]
------------------------------------------------------------
5. 검증 완료 내역
------------------------------------------------------------
5.1 HOLD 제거 검증

[출처: 마스터스펙\MASTER_SPEC_누락보강\MASTER_SPEC_통합갱신자료_2026-06-30.txt | 기준일: 2026-06-30 | 수정시각: 2026-06-30 19:21:22 | 분류: 갱신문서]
기본 원칙:
- signal_only=True
- allowed_order_signals=["BUY", "SELL"]
- non_signal은 signal=None
- execution_enabled=False
- 주문 실행 주체는 main_order_engine
6.2 routine.py rules.json 자동 로드
routine.py는 다음 우선순위로 루틴 설정을 선택한다.

[출처: 작업재개요약서_상세_매수개편_v2.txt | 기준일: 2026-06-27 | 수정시각: 2026-06-27 17:45:24 | 분류: 작업재개요약]
- 매수신호는 매도보다 약간 낮은 정밀도를 허용한다.
- 대신 실제 매수기법은 매도보다 복잡하게 설계한다.
- 주신호의 품질보다 신호 이후의 매수전략을 중요하게 본다.
2. UI 변경
기본설정
- 독립 토글 유지
- 제목 버튼만 클릭 시 펼침/접힘
- 헤더 전체 클릭 제거
매수설정
- 자동 접힘 제거
- 다른 영역을 열어도 유지
적용필터

[출처: 작업재개요약_매도설정_UI_2026-06-26.txt | 기준일: 2026-06-26 | 수정시각: 2026-06-26 15:00:53 | 분류: 작업재개요약]
- 반복이탈조건 선택 없음 → ‘다음신호로 이월’
- 반복이탈조건 선택 있음 → ‘보유잔량시장가매도’
- 체크박스는 표시용.
6. UI

[출처: 작업재개요약_매도설정_UI_2026-06-26.txt | 기준일: 2026-06-26 | 수정시각: 2026-06-26 15:00:53 | 분류: 작업재개요약]
- 소제목 접기표시 적용.
- 반칸 들여쓰기.
- 입력컨트롤 통일.
- 콤보 잘림 다수 수정.
- 상단 폭 조정.
- 창 크기 조정.
- 상단 헤더에 신호검출조건/매도방식지정 표시.

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_8.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-30 19:18:38 | 분류: 대화히스토리]
image(1129).png
 그림자 뭐냐..그리고 5번의 아래 다음신호로 이월 과 체크박스 정렬은 왜 이렇고??

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_8.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-30 19:18:38 | 분류: 대화히스토리]
2. 매도설정 상단 헤더 변경
2.1 신호검출조건 명칭 변경
2.2 OR 정책 확정
2.3 A OR B OR C 기본값
2.4 매도방식지정 추가
2.5 설정 A/B/C 체크 정책
2.6 최소 1개 선택 규칙
2.7 기본 선택값
2.8 헤더 배치 변경
2.9 포인트 아이콘 통일
2.10 폰트 통일
3. 신호검출조건
3.1 A
3.2 B
3.3 C
3.4 OR 정책
3.5 향후 엔진 연계

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_8.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-30 19:18:38 | 분류: 대화히스토리]
다시 설명한다. 4.번에 어느 하나라도 체크박스 선택이 되면 5번에 보유잔량 시장가 매도를 표시하고 체크박스에 체크 되어 있는 표시를 같이 보여주고, 그 반대의 상황이면 다음신호로 이월을 노출 시켜줘. 지금 문제는 5번의 두 항목이 다 노출이 되어 있고 동작도 없다.
한심해....몇번을 이러는건가? 다시 수정파일 생성해
못해??? 뭘 수정했는지 보고해

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_8.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-30 19:18:38 | 분류: 대화히스토리]
보기에는 정상 작동 한다. 신호검출 /a/b/c 를 통합하고 중복 필터 삭제 하고 매수설정처럼 조합식으로 직접 설정하는 방식으로 바꾸자

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_8.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-30 19:18:38 | 분류: 대화히스토리]
연산자 동작 형식 손보자..우선 신호검출조건 의 설정 필터들 뒤에 연산자는 제일 마지막 거는 삭제 해라...그리고 왜 필터 앞에 a,b,c를 넣었나?? 원래 넣게 설정을 했나?

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_8.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-30 19:18:38 | 분류: 대화히스토리]
이 창의 구성을 바꾸자. 적용 필터를 신호검출 조건 으로 변경하고 a~d 의 필터를 상단에 1개의 박스에 한줄로 배치. 가능?
신호검출조건이 중복되네.....위에는 신호검출필터조합, 아래는 신호검출필터 으로 다시 변경
체크박스가 다 채크되면 규칙위반?

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_8.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-30 19:18:38 | 분류: 대화히스토리]
정리한 내용:
- _make_sell_scenario_overview_controls() 내부의 매도완료정책에서 QTimer.singleShot, 250ms 반복 QTimer 제거
- self.sell_* 기반 전체 재동기화 함수 제거
- 완료정책 표시는 add_sell_complete_policy() 생성 시점의 로컬 참조 기준으로 동작하게 유지
- 체크/콤보 변경 시 로컬 exit_checks만 보고 “다음신호로 이월 / 보유잔량 시장가매도” 표시 전환
- 중복 stateChanged 연결 일부 제거하고 필요한 toggled/currentTextChanged 중심으로 정리
- UI 문구, 배치, 폭은 변경하지 않음
- 매수 파일은 수정하지 않음

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_8.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-30 19:18:38 | 분류: 대화히스토리]
지금 우측은 기능을 억지로 넣기에는 애매한 폭입니다. 반대로 운영 정보는 세로 공간을 잘 활용할 수 있습니다.
예를 들면,
MACD 자동매매루틴
■ 매수신호
• OSC 상승전환
• 기준봉 : 1봉
• 적용필터 : A / B / C / D
■ 매수동작
• 단일호가 / 다중호가
• 순환매수
• 상황변화 대응
■ 순환관리
• 추가매수
• 이탈조건
• 회차관리
■ 매도동작
• 매도신호 발생
• 순환매도
• 세트마감

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_8.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-30 19:18:38 | 분류: 대화히스토리]
┌────────────────────────────┐
│ [루틴개요] [설정요약] │
├────────────────────────────┤
│ │
│ 루틴 설명 │
│ │
│ • 매수신호 │
│ • 매도신호 │
│ • 순환방식 │
│ • 특징 │
│ │
└────────────────────────────┘
루틴개요
이 루틴의 철학
신호 발생 조건
운용 흐름
주의사항
설정요약
현재 UI 값을 자동으로 읽어서

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_8.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-30 19:18:38 | 분류: 대화히스토리]
지금 우측 공간은 생각보다 넓습니다. 그래서 고정 설명보다 상태 요약 비중을 더 높이는 것이 더 실용적일 수 있습니다.
예를 들면,
■ 루틴 상태
매수신호 : OSC 상승전환
매도신호 : OSC 하락전환
신호기준 : 1분봉
적용필터 : A B C D
매수방식 : 다중호가
순환방식 : 다중시간
추가매수 : 사용
상황변화 : 가격비교

[출처: 작업재개요약서_v2026-06-25_MACD매도설정_UI_미체결정책_상세.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 16:17:00 | 분류: 작업재개요약]
2) 임의 삭제/임의 수정 금지
- 사용자가 요청한 항목 외에는 건드리지 않는다.
- 특히 UI 공통폼은 한 줄 수정이 전체 BUY/SELL 여러 위치에 퍼질 수 있으므로 반드시 영향범위를 확인한다.
- “QLabel('에') → QLabel('대비')” 같은 전체 치환은 요청 범위와 영향 범위를 먼저 정확히 파악해야 한다.
- 기존에 정상 동작하던 BUY 완료정책, 매수방식, 매도방식, 신호검출조건을 의도 없이 깨면 안 된다.

[출처: 작업재개요약서_v2026-06-25_MACD매도설정_UI_미체결정책_상세.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 16:17:00 | 분류: 작업재개요약]
1) 사용자가 최신 파일을 업로드하면 먼저 파일명과 기준 버전을 확인한다.
2) 파일 내용에서 아래 문자열을 검색한다.
 - def _make_common_cancel_overview_controls
 - def _make_buy_complete_overview_controls
 - 마지막 주문 취소 이후
 - complete_after_cancel_check
 - sell_complete_after_cancel_check
 - QLabel("에")
 - add_cancel_gap_row
 - cancel_price_gap
3) 현재 UI 스크린샷이 있으면 파일 내용과 대조한다.
4) 미체결정책 수정은 함수 전체를 교체하기보다, 가능한 한 현 함수 구조를 유지하고 안전하게 삽입한다.
5) 완료정책 첫 줄 삭제는 이미 되어 있으면 건드리지 않는다.
6) 공통 “에→대비” 변경은 가격비교 row에 한정한다.
7) 수정 후 py_compile 실행.
8) 추가로 파일 내 위험 문자열 검색:
 - 삭제된 속성 참조가 남아 있지 않은지
 - 중복 add_cancel_gap_row 호출이 없는지
 - 미체결정책 가격조건 row가 BUY/SELL 공통으로 1줄만 추가되었는지
9) 파일 제공 후 설명은 최소화한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_FINAL_INTEGRATED.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 10:56:16 | 분류: MASTER_SPEC]
============================================================
2. SIGNAL SYSTEM
============================================================
Allowed signals:
- BUY : entry decision
- SELL : exit decision
- None : no action state

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_FINAL_INTEGRATED.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 10:56:16 | 분류: MASTER_SPEC]
STRICT RULES:
- HOLD is prohibited
- No additional signal types
- No partial signals

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_SYSTEM_CONSOLIDATION_v2.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 10:28:39 | 분류: MASTER_SPEC]
============================================================
2. SIGNAL SYSTEM
============================================================
Allowed signals ONLY:
- BUY : entry decision
- SELL : exit decision
- None : no signal state

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_SYSTEM_CONSOLIDATION_v2.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 10:28:39 | 분류: MASTER_SPEC]
STRICT RULE:
- HOLD is permanently forbidden
- No additional signal types allowed

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_SYSTEM_CONSOLIDATION_v2.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 10:28:39 | 분류: MASTER_SPEC]
Signal Queue:
- stores BUY / SELL only
- never stores internal states or debug values

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_SYSTEM_CONSOLIDATION_v2.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 10:28:39 | 분류: MASTER_SPEC]
============================================================
5. BUY STRUCTURE
============================================================
BUY is NOT an execution signal.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_SYSTEM_CONSOLIDATION_v2.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 10:28:39 | 분류: MASTER_SPEC]
============================================================
6. SELL STRUCTURE
============================================================
SELL is NOT immediate liquidation.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_SYSTEM_CONSOLIDATION_v2.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 10:28:39 | 분류: MASTER_SPEC]
Rules:
- SELL = exit decision only
- A/B/C condition groups required
- independent evaluation groups

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_SYSTEM_CONSOLIDATION_v2.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 10:28:39 | 분류: MASTER_SPEC]
============================================================
10. GLOBAL RULES (FREEZE)
============================================================
- no HOLD allowed
- no new signal types
- no runtime rule mutation
- full deterministic evaluation required
- execution strictly in MAIN only

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART30_1차본_30.21-30.30.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:50:11 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
30.23 오염 판정
다음은 오염으로 판정한다.
- 승인되지 않은 신호 추가
- 정책 임의 변경
- 문서와 불일치하는 구현

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART30_1차본_30.11-30.20.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:47:24 | 분류: MASTER_SPEC]
MASTER_SPEC v4.0 정본
PART 30. HOLD 오염복구와 금지행위 1차본 (30.11 ~ 30.20)
30.11 Signal Queue 검증
Signal Queue에는 BUY와 SELL만 저장한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART30_1차본_30.11-30.20.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:47:24 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
30.12 루틴 검증
루틴은 비신호를 signal=None으로 반환한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART30_1차본_30.11-30.20.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:47:24 | 분류: MASTER_SPEC]
- HOLD 미생성
- signal=None 확인
- BUY/SELL 정상 생성
- Queue 검증
- 문서 일치

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART30_1차본_30.11-30.20.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:47:24 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
30.19 구현 금지
- HOLD 재사용
- 임의 신호 추가
- 문서 없는 정책 변경
- 테스트 편의 수정

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART30_1차본_30.11-30.20.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:47:24 | 분류: MASTER_SPEC]
프로젝트는 BUY와 SELL만 공식 주문 신호로 사용한다. 모든 비신호는
signal=None으로 처리한다.
END OF PART 30.11~30.20

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART30_1차본_30.1-30.10.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:46:19 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
30.2 적용 범위
- 루틴 신호
- Signal Queue
- 테스트 코드
- 신호엔진
- 문서 기준

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART30_1차본_30.1-30.10.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:46:19 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
30.3 HOLD 오염 정의
HOLD를 공식 주문 신호로 취급하는 모든 구현은 오염으로 정의한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART30_1차본_30.1-30.10.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:46:19 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
30.4 공식 신호
공식 주문 신호는 BUY와 SELL만 허용한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART30_1차본_30.1-30.10.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:46:19 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
30.5 비신호
조건 미충족은 signal=None으로 처리한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART30_1차본_30.1-30.10.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:46:19 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
30.8 테스트 기준
- HOLD 미생성
- signal=None 처리
- BUY/SELL 생성
- Signal Queue 검증

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART30_1차본_30.1-30.10.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:46:19 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
30.9 구현 금지
- HOLD 재도입
- HOLD 저장
- HOLD 주문 후보 생성
- HOLD 테스트 기준 사용

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART28_1차본_28.21-28.30.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:42:12 | 분류: MASTER_SPEC]
공통설정, BUY, SELL, 검증 영역은 독립적으로 관리한다. 한 영역의 설정
변경이 다른 영역의 UI 배치를 변경해서는 안 된다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART28_1차본_28.11-28.20.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:36:20 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
28.15 BUY 영역 연계
BUY 영역의 설정은 BUY 정책에만 영향을 준다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART28_1차본_28.11-28.20.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:36:20 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
28.16 SELL 영역 연계
SELL 영역은 A/B/C 조건그룹 정책을 따른다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART28_1차본_28.11-28.20.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:36:20 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
28.17 공통설정 연계
공통설정은 BUY와 SELL 모두에 적용될 수 있다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART28_1차본_28.1-28.10.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:34:00 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
28.2 적용 범위
- 루틴 설정창
- BUY 설정
- SELL 설정
- 공통 설정
- 저장 구조

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART28_1차본_28.1-28.10.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:34:00 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
28.4 화면 구성
공통설정, BUY, SELL, 검증 영역으로 구성한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART28_1차본_28.1-28.10.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:34:00 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
28.7 SELL 구성
A/B/C 조건그룹과 조합 규칙을 사용한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART27_1차본_27.21-27.30.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:32:11 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
27.25 신호엔진 초기화
모든 검증 완료 후 신호엔진을 초기화한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART27_1차본_27.21-27.30.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:32:11 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
27.26 검증 실패
검증 실패 시 BUY/SELL 신호를 생성하지 않는다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART27_1차본_27.11-27.20.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:31:13 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
27.15 SELL 설정 저장
SELL 관련 조건그룹과 조합 규칙은 SELL 영역에 저장한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART27_1차본_27.11-27.20.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:31:13 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
27.20 최종 원칙
rules.json은 루틴 정책의 공식 저장소이다.
신호엔진은 검증된 설정만 사용하여 BUY/SELL을 판단한다.
END OF PART 27.11~27.20

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART27_1차본_27.1-27.10.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:28:49 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
27.5 신호엔진 역할
신호엔진은 rules.json을 해석하여 BUY/SELL 여부를 판단한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART26_1차본_26.21-26.30.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:26:51 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
26.24 조건 충돌
상호 충돌하는 조건이 동시에 참이 될 경우 최종 조합 규칙에 따라 비신호로
처리한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART26_1차본_26.21-26.30.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:26:51 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
26.25 비신호 처리
NOT 적용 결과 최종 조건을 만족하지 못하면 signal=None으로 종료한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART26_1차본_26.21-26.30.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:26:51 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
26.28 테스트 항목
- 조건 제외
- 복합 조합
- 비신호 처리
- Signal Queue 미저장
- 규칙 저장

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART26_1차본_26.1-26.10.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:24:52 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
26.2 적용 범위
- BUY 조건조합
- SELL 조건조합
- A/B/C 조건그룹
- 수식 입력기
- rules.json

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART25_1차본_25.21-25.30.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:24:13 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
25.23 보조필터
보조필터는 SELL 조건을 보완하는 용도로만 사용한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART25_1차본_25.21-25.30.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:24:13 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
25.24 데이터 부족
필수 데이터가 부족하면 SELL을 생성하지 않는다.
signal=None으로 처리한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART25_1차본_25.21-25.30.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:24:13 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
25.25 오류 처리
SELL 계산 중 오류가 발생하면 오류를 기록하고 비신호로 종료한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART25_1차본_25.21-25.30.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:24:13 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
25.27 테스트 기준
검증 항목
- 그룹 활성/비활성
- 데이터 부족
- 조건 조합
- SELL 생성
- 비신호 처리

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART25_1차본_25.21-25.30.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:24:13 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
25.28 구현 금지
- 그룹 내부 정책 임의 변경
- 비신호를 SELL로 승격
- 사용자 승인 없는 조합 규칙 변경

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART25_1차본_25.11-25.20.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:23:35 | 분류: MASTER_SPEC]
1. 데이터 검증
2. 기준봉 확인
3. A 그룹 평가
4. B 그룹 평가
5. C 그룹 평가
6. 조건 조합
7. 최종 SELL 판단

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART25_1차본_25.11-25.20.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:23:35 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
25.12 기준봉
SELL은 사용자 설정 기준봉(0봉 또는 1봉)을 기준으로 평가한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART25_1차본_25.11-25.20.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:23:35 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
25.13 A 그룹 평가
A 그룹은 기본 SELL 조건을 담당한다.
각 조건은 독립적으로 평가한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART25_1차본_25.11-25.20.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:23:35 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
25.17 SELL 신호 생성
최종 조합 규칙을 만족한 경우에만 SELL 신호를 생성한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART25_1차본_25.11-25.20.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:23:35 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
25.18 Signal Queue 연계
SELL 생성 후 Signal Queue에는 SELL만 저장한다.
비신호는 저장하지 않는다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART25_1차본_25.11-25.20.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:23:35 | 분류: MASTER_SPEC]
- 조건그룹 순환 참조
- 그룹 간 내부값 변경
- HOLD 생성
- SELL 생성 후 루틴 내부 주문 실행

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART25_1차본_25.1-25.10.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:22:42 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
25.2 적용 범위
- SELL 신호
- A/B/C 조건그룹
- 조건 조합
- 보조필터
- 신호 생성

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART24_1차본_24.21-24.30.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:22:13 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
24.22 신규 BUY 연계
완료 이후 새로운 BUY 신호가 발생하면 기존 완료 상태와 독립적으로 새로운
매수계획을 생성할 수 있다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART23_1차본_23.21-23.30.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:20:06 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
23.22 매수계획 갱신
새로운 BUY 신호가 발생하면 기존 매수계획의 유지, 갱신 또는 종료 여부를
먼저 판단한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART23_1차본_23.21-23.30.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:20:06 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
23.27 오류 처리
다중매수 계산 오류 발생 시 BUY 신호를 임의 생성하지 않는다.
오류는 기록하고 비신호로 처리한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART23_1차본_23.1-23.10.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:18:52 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
23.3 매수방식 정의
매수방식은 BUY 신호 이후 실제 매수지점을 구성하는 정책이다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART22_1차본_22.21-22.30.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:18:02 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
22.26 중복 BUY
동일 조건에서 중복 BUY 생성 여부는 루틴 설정 정책에 따른다.
중복 방지 기능은 신호 생성 이후 단계에서 처리할 수 있다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART22_1차본_22.11-22.20.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:17:06 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
22.14 기준가격
능동매수의 기준가격은 BUY 신호 발생 시점의 기준가격을 사용한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART22_1차본_22.1-22.10.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:16:33 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
22.2 적용 범위
본 문서는 다음에 적용된다.
- BUY 신호
- 평단관리
- 매수계획
- 매수회차
- 예산 산정
- 능동매수

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART22_1차본_22.1-22.10.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:16:33 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
22.4 BUY 발생 조건
BUY는 주신호와 보조필터를 모두 평가한 후 생성한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART22_1차본_22.1-22.10.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:16:33 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
22.6 추가 매수
보유 중 BUY는 기존 포지션에 대한 추가 매수 후보이다.
무조건 추매를 의미하지 않는다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART22_1차본_22.1-22.10.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:16:33 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
22.9 기준가격
평단관리의 기준가격은 BUY 신호 발생 시점의 기준가격을 사용한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART21_1차본_21.21-21.30.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:16:01 | 분류: MASTER_SPEC]
1. 데이터 검증
2. 기준봉 결정
3. 주신호 평가
4. 보조필터 평가
5. 조건그룹 평가
6. 최종 BUY/SELL 여부 결정

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART21_1차본_21.21-21.30.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:16:01 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
21.23 신호 일관성
동일 데이터에 대해 동일 설정이면 항상 동일 결과를 반환해야 한다.
무작위 요소를 포함하지 않는다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART21_1차본_21.21-21.30.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:16:01 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
21.24 데이터 부족
봉 데이터 부족, 지표 계산 불가, 필수 입력 누락 시 BUY 또는 SELL을
생성하지 않는다.
signal=None으로 처리한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART21_1차본_21.21-21.30.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:16:01 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
21.25 예외 처리
예외가 발생해도 임의의 BUY 또는 SELL을 생성하지 않는다.
오류는 로그에 기록하고 비신호로 종료한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART21_1차본_21.21-21.30.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:16:01 | 분류: MASTER_SPEC]
- BUY 생성
- SELL 생성
- 비신호 처리
- Signal Queue 저장
- 기준봉 변경
- 예외 처리

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART21_1차본_21.21-21.30.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:16:01 | 분류: MASTER_SPEC]
이후 PART22부터는 BUY 구조와 평단관리, PART23부터는 매수방식,
PART24부터는 완료정책, PART25부터는 SELL 구조를 상세 규정한다.
END OF PART 21.21~21.30

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART21_1차본_21.11-21.20.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:15:10 | 분류: MASTER_SPEC]
MASTER_SPEC v4.0 정본
PART 21. MACD 루틴 기본 철학과 신호 구조 1차본 (21.11 ~ 21.20)
21.11 Signal Queue 저장 규칙
Signal Queue는 루틴이 생성한 판단 결과를 메인 프로그램으로 전달하기 위한
공식 전달 계층이다.
저장 가능한 공식 주문 신호는 다음 두 가지뿐이다.
- BUY
- SELL
다음 항목은 Signal Queue에 저장해서는 안 된다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART21_1차본_21.11-21.20.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:15:10 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
21.12 BUY 신호의 의미
BUY는 단순 주문 명령이 아니라 매수 판단 완료를 의미한다.
BUY 발생 시 루틴은 다음 정보를 메인 프로그램에 제공한다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART21_1차본_21.11-21.20.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:15:10 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
21.13 SELL 신호의 의미
SELL은 보유 포지션 종료 판단이다.
SELL 역시 주문 실행 명령이 아니다.
SELL 발생 시 다음 정보를 제공한다.
- 발생 시각
- 발생 조건
- 조건그룹
- 통과 필터
- 기준봉
- 기준가격

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART21_1차본_21.11-21.20.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:15:10 | 분류: MASTER_SPEC]
- 루틴 내부 SendOrder 호출
- 루틴 내부 계좌 변경
- 루틴 내부 자금 승인
- 루틴 내부 검토관리 이동
- HOLD 공식 신호 재도입
- Signal Queue에 비신호 저장
- 테스트 편의를 위한 정책 변경
- 사용자 승인 없는 구조 변경

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART21_1차본_21.11-21.20.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:15:10 | 분류: MASTER_SPEC]
------------------------------------------------------------------------
21.20 최종 원칙
루틴은 판단한다.
메인은 실행한다.
BUY와 SELL만 공식 주문 신호이다.
비신호는 signal=None으로 처리한다.
루틴은 주문을 실행하지 않는다.
루틴은 계좌를 변경하지 않는다.
루틴은 자금을 승인하지 않는다.
END OF PART 21.11~21.20

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART21_1차본_21.1-21.10.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:13:16 | 분류: MASTER_SPEC]
21.2 적용 범위 - MACD 루틴 엔진 - 루틴 설정창 - BUY/SELL 신호 생성 -
Signal Queue - rules.json - routine.json - 테스트 코드 - 검증 코드

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART21_1차본_21.1-21.10.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:13:16 | 분류: MASTER_SPEC]
21.7 역할 분리 원칙 루틴은 판단한다. 메인은 실행한다. 이 원칙은 프로젝트
전체에서 변경할 수 없는 최상위 구조 원칙이다.
21.8 공식 신호 공식 주문 신호는 BUY와 SELL 두 가지뿐이다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART21_1차본_21.1-21.10.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:13:16 | 분류: MASTER_SPEC]
21.9 비신호 BUY와 SELL이 아닌 상태는 signal=None으로 처리한다. 비신호는
정상 상태이며 주문 큐에 저장하지 않는다.

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_PART21_33_1차본\MASTER_SPEC_v4.0_PART21_1차본_21.1-21.10.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:13:16 | 분류: MASTER_SPEC]
21.10 HOLD 금지 HOLD는 공식 신호가 아니다. HOLD를 Signal Queue, 주문
후보, 테스트 기준으로 사용하는 것을 금지한다.
(계속)

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_00_전체목차_및_작성맵_초안.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:06:32 | 분류: MASTER_SPEC]
핵심 반영:
- HOLD 금지
- 비신호는 signal=None
- BUY/SELL만 주문 큐 저장
- SKIP/ERROR는 공식 주문신호 아님
- CANCEL은 루틴 공식 신호 아님
- 테스트 편의를 위한 HOLD 재도입 금지

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_00_전체목차_및_작성맵_초안.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:06:32 | 분류: MASTER_SPEC]
핵심 반영:
- 루틴 설정창은 설명창이 아니라 컨트롤 패널
- 공식 탭은 구성 / 고급 / 검증
- BUY/SELL 공식 탭 폐기
- 루틴 상태 카드 화면 표시 제거
- 내부 호환 객체는 유지 가능
- 법전 용어 금지
- 실제 QCheckBox 사용
- 문자열 체크박스 흉내 금지

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_00_전체목차_및_작성맵_초안.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:06:32 | 분류: MASTER_SPEC]
핵심 반영:
- 결과물 기본 전달 방식은 개별 파일
- ZIP 생성 금지
- 회차기준 / 예산기준 / 능동매수 택1
- 능동매수 기준가격은 BUY 신호 발생 시점 현재가
- 다중지점 마지막회차 능동매수는 매수방식 하위옵션

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_00_전체목차_및_작성맵_초안.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:06:32 | 분류: MASTER_SPEC]
[2026-06-25 MACD 매도신호조합 / NOT 규칙]
반영 위치:
- PART 25. MACD SELL 구조와 A/B/C 신호검출조건
- PART 26. MACD 신호검출조건조합과 NOT 규칙
- PART 28. MACD 설정창 UI 구조

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_00_전체목차_및_작성맵_초안.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:06:32 | 분류: MASTER_SPEC]
2순위:
- PART 20. 루틴/메인 역할분리와 신호 큐
- PART 27. rules.json 구조와 신호엔진 검증
- PART 30. HOLD 오염복구와 금지행위
- PART 31. AI 구현절차와 사용자 승인 원칙

[출처: MASTER_SPEC_v4.0\MASTER_SPEC_v4.0_00_전체목차_및_작성맵_초안.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 08:06:32 | 분류: MASTER_SPEC]
1. MASTER_SPEC_v4.0_PART_21_MACD루틴_기본철학과_신호구조_1차본.txt
2. MASTER_SPEC_v4.0_PART_22_MACD_BUY구조와_평단관리_1차본.txt
3. MASTER_SPEC_v4.0_PART_23_MACD_매수방식_다중매수_능동매수_1차본.txt
4. MASTER_SPEC_v4.0_PART_24_MACD_완료조건_완료정책_미체결정책_1차본.txt
5. MASTER_SPEC_v4.0_PART_25_MACD_SELL구조와_ABC조건그룹_1차본.txt
6. MASTER_SPEC_v4.0_PART_26_MACD_NOT규칙_신호검출조건조합_1차본.txt
7. MASTER_SPEC_v4.0_PART_28_MACD설정창_UI구조_1차본.txt
이 순서가 현재 작업 효율이 가장 높다.
END OF DOCUMENT

[출처: 마스터스펙\마스터스펙_갱신자료_v2026-06-25_MACD매도신호조합_NOT규칙_확정.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 06:45:48 | 분류: 갱신문서]
3. 신호검출조건 A
- OCR 추세 감지
- 주문가/현재가/평단가 기반 가격필터
- RSI
OCR은 고정 주신호가 아니며, 가격필터 단독 사용 가능성을 열어둔다.

[출처: 마스터스펙\마스터스펙_갱신자료_v2026-06-25_MACD매도신호조합_NOT규칙_확정.txt | 기준일: 2026-06-25 | 수정시각: 2026-06-25 06:45:48 | 분류: 갱신문서]
4. 신호검출조건 B
- 가격박스 [상향/하향] [0.1]% [이상/이하]
- 주문가/현재가/평단가 기반 가격신호
B는 OCR과 동일 레벨의 독립 신호검출조건이다.

Original Body Marker: END

---

Reference Navigation

- Previous: PART04_01_ROUTINE.md
- Next: PART04_03_ROUTINE.md
- Full PART: PART04_ROUTINE.md
- INDEX: 00_REFERENCE_INDEX.md
- Original Canonical: ../CURRENT/MASTER_SPEC_CANONICAL_2026-07-07_RULE_APPLY_PREVIEW_EXECUTION_PREVIEW_CONTROLLER.txt
