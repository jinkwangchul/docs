# PART04 04 ROUTINE

Reference Edition Subpart

Original Canonical: MASTER_SPEC_CANONICAL_2026-07-08_EXECUTION_SENDORDER_CHEJAN_LIFECYCLE_PIPELINE.txt

Source Full Part: PART04_ROUTINE.md

생성일: 2026-07-08

주의: 본 문서는 AI 참조용 하위 분할본이며 공식 원본은 CURRENT의 Canonical이다.

Original Body Marker: START
정정주문 여부
내가 보기엔 이제 다음 주제는
현재가 주문
을 기준으로
미체결 30주 발생
↓
언제 취소할 것인가?
를 먼저 정하는 게 순서다.
여기가 단일매수 정책의 핵심이다.

[출처: 마스터스펙_갱신자료_STEP44\작업진행상황대화히스토리_5.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-18 17:43:02 | 분류: 대화히스토리]
잘 생각해야해...생각보다 복잡한 상황이다. 단일 매수의 경우 단일 매수 주문만 내고 미체결 확인을 루틴에서 해야하는건지 아니면 메인에서 하는건지 , 만약 루틴에서 미체결 확인을 하고 다시 매수 신호를 낼경우 그사이 주문취소는 메인에서 하는 방식인지, 루틴에서 정해진 신호만 내고 나머지는 루틴에서 주문취소 다시 매수진행을 해야하는건지....루틴의 역할이 어디까지인지를 판단
여기서는 진짜 조심해야 한다.
왜냐하면 이걸 잘못 정하면 나중에 루틴 추가될 때마다 구조가 무너진다.
나는 지금 다시 생각해보니 "루틴이 어디까지 책임질 것인가" 가 핵심이라고 본다.
현재 선택지는 사실 3개다.
안 A
루틴 = 신호만
BUY
SELL
만 발생.
메인
주문
체결
미체결
취소
재주문
전부 담당.
장점
구조 단순
단점
루틴별 매매철학 반영 어려움
안 B
루틴 = 신호 + 미체결관리
예:
BUY
↓
주문
↓
미체결 발생
↓
루틴이 다시
BUY
발생.
메인은
취소
주문
만 수행.
장점
루틴 철학 반영 쉬움
단점
루틴이 체결정보를 알아야 함
그 순간.
주문번호
미체결수량
체결수량
까지 루틴이 보기 시작한다.
그러면.
루틴 = 전략
이 무너진다.
안 C
내가 현재 가장 맞다고 보는 구조.
루틴:
BUY
SELL
주문정책
체결정책
미체결정책
결정.
예:
BUY
현재가
목표체결율 100%
5초 후 취소
+1호가 재주문
메인:
실제 주문
실제 취소
실제 재주문
실제 체결감시
수행.
이 경우.
루틴은.
어떻게 할지
를 결정.
메인은.
실제로 처리
한다.
나는 지금 네 프로젝트 철학 기준으로는.
루틴 = 정책결정
메인 = 집행
이 가장 맞다고 본다.
왜냐하면.
예를 들어 MACD 루틴은.
미체결 5초
+1호가
3회 재시도
를 원할 수 있다.
다른 루틴은.
즉시 시장가 전환
을 원할 수 있다.
이건 루틴 철학이다.
하지만.
주문취소 API
주문정정 API
미체결조회 API
는.
모든 루틴 공통.
즉.
취소를 누가 실행하는가?
는 메인.
언제 취소해야 하는가?
는 루틴.
나는 현재까지 정립된
루틴 = 신호
메인 = 실행
철학을 약간 확장해서.
루틴 = 신호 + 정책
메인 = 실행 + 트러블슈팅
으로 보는 게 가장 자연스럽다고 본다.

[출처: 마스터스펙_갱신자료_STEP44\작업진행상황대화히스토리_5.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-18 17:43:02 | 분류: 대화히스토리]
그러면 루틴은 주문번호나 미체결수량을 직접 볼 필요가 없고, 메인은 전략을 몰라도 된다. 이 분리가 나중에 MACD 루틴, RSI 루틴, 조건검색식 루틴이 수십 개 생겨도 유지된다.
그러면 루틴은 셀,바이,캔슬 ?
나는 지금은 아니다 쪽으로 기운다.
아까는 중간에 흔들렸는데 다시 생각해보면.
루틴 = BUY
루틴 = SELL
까지만 가는 게 맞다.
왜냐하면 CANCEL은 성격이 다르다.
예를 들어.
BUY 발생
↓
100주 주문
↓
70주 체결
30주 미체결
↓
5초 경과
↓
CANCEL
여기서 취소가 발생한 이유는.
```text
매수전략 때문인가?
아니다.
실제로는.
주문관리 때문
이다.
그래서 나는.
BUY
SELL
는 루틴.
CANCEL
MODIFY
REORDER
는 메인.
대신 루틴은.
BUY
정책:
5초 대기
+1호가 허용
3회 재시도
목표체결율 100%
을 같이 넘긴다.
그러면 메인은.
정책 확인
↓
5초 경과
↓
취소
↓
재주문
↓
체결
수행.
즉.

[출처: 마스터스펙_갱신자료_STEP44\작업진행상황대화히스토리_5.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-18 17:43:02 | 분류: 대화히스토리]
루틴
=
BUY
SELL
+
주문정책
메인
=
ORDER
CANCEL
MODIFY
REORDER
이렇게 분리하는 게 더 자연스럽다.
왜냐하면 만약 루틴이:
BUY
SELL
CANCEL
까지 내기 시작하면.
결국 루틴이:
체결상태
미체결상태
주문번호
를 알아야 한다.
그 순간 루틴이 전략엔진이 아니라 주문엔진이 되어버린다.
그래서 현재 시점의 내 결론은:
루틴 신호
=
BUY
SELL
루틴 정책
=
목표체결율
취소조건
재주문조건
주문방식
메인 실행
=
ORDER
CANCEL
MODIFY
REORDER
이 분리가 가장 안정적이다.
실제 캔슬을 시행하는게 아니라 셀신호,바이신호,캔슬신호를 내게 개념 확장
난이도는 중상급으로 봐야 한다.
이유는 기능 추가라기보다 구조 변경에 가깝다.
현재 개념대로 가면 메인파트는 단순 주문 실행기가 아니라:

[출처: 마스터스펙_갱신자료_STEP44\작업진행상황대화히스토리_5.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-18 17:43:02 | 분류: 대화히스토리]
BUY / SELL / CANCEL 신호 수신
↓
주문번호 추적
↓
체결/미체결 추적
↓
취소/정정/재주문 실행
↓
상태 불일치 검출
↓
검토관리 이동
까지 해야 한다.
가장 어려운 부분은 3개다.
주문 상태 추적
주문번호, 원주문번호, 체결수량, 미체결수량, 취소가능수량을 정확히 관리해야 함.
중복 주문 방지
CANCEL 신호가 왔는데 기존 주문이 이미 체결됐거나 취소됐을 수 있음.
BUY 재신호가 왔을 때 기존 미체결 주문이 살아 있으면 중복매수 위험.
서버 정보와 내부 상태 불일치
키움 체결 이벤트 누락, 지연, 조회값 불일치가 생기면 바로 검토관리 후보.
다만 좋은 점은 있다.

[출처: 마스터스펙_갱신자료_STEP44\작업진행상황대화히스토리_5.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-18 17:43:02 | 분류: 대화히스토리]
루틴이 BUY / SELL / CANCEL 신호만 내고, 실제 실행은 메인이 맡으면 메인 구조는 복잡해지지만 공통 엔진으로 한 번만 제대로 만들면 이후 루틴은 확장하기 쉬워진다.
내 판단:

[출처: 마스터스펙_갱신자료_STEP44\작업진행상황대화히스토리_5.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-18 17:43:02 | 분류: 대화히스토리]
1단계: BUY / SELL만 처리
2단계: 주문번호·체결·미체결 추적
3단계: CANCEL 신호 처리
4단계: 취소 확인 후 재주문
5단계: 불일치 시 검토관리
핵심은 먼저 주문 상태머신을 작게 만드는 거다.
현재 판단:

[출처: 마스터스펙_갱신자료_STEP44\작업진행상황대화히스토리_5.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-18 17:43:02 | 분류: 대화히스토리]
구현 가능
난이도 높음
순서 잘못 잡으면 위험
반드시 단계별 테스트 필요
바로 다음은 코드가 아니라, 먼저 ORDER_STATE 정의부터 잡는 게 맞다.
루틴부터 구현해서 그신호를 받는 구조로 시작하는건 어떤가?
나는 오히려 그게 더 안전하다고 본다.
지금 메인을 먼저 건드리면 위험한 이유가 있다.
현재 우리는:
BUY
SELL
CANCEL
개념도 막 정립 중이고,
단일매수
다중매수
능동매수
도 완전히 확정된 상태가 아니다.
그런데 메인부터 만들면.
주문상태머신
을 만들어 놓고.
나중에 루틴 요구사항이 바뀔 때마다.
메인 수정
메인 수정
메인 수정
반복될 가능성이 크다.
오히려 지금은.
1단계
루틴 엔진
구현.
예:
BUY_SIGNAL
SELL_SIGNAL
CANCEL_SIGNAL
출력.
그리고.
신호 발생 이유
신호 발생 시각
신호 정책
까지 로그로 출력.
실제 주문은 안 함.
2단계
가상 메인
만듦.
예:
BUY_SIGNAL 수신
↓
가상 체결
CANCEL_SIGNAL 수신
↓
가상 취소
이렇게 시뮬레이션.
3단계
루틴 철학 확정
여기서.
어?
CANCEL 필요 없네?
혹은.
다중매수 구조 바꿔야겠네?
가 나올 수 있음.
4단계
그때 메인 구현.
현재 프로젝트 상태를 보면.
루틴 설계
= 60~70%
메인 주문상태머신
= 아직 설계중
수준이다.
그래서 내 판단은.
지금은 루틴 먼저
가 맞다.
특히.
현재 MACD 루틴은.
매수신호
매도신호
RSI
이평선 기울기
0봉/1봉
단일매수
다중매수
체결목표
만 구현해도 테스트할 게 엄청 많다.
그래서 순서는.
MACD 루틴 완성
↓
가상 신호 테스트
↓
신호 규격 확정
↓
메인 주문상태머신 설계
↓

[출처: 마스터스펙_갱신자료_STEP44\작업진행상황대화히스토리_5.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-18 17:43:02 | 분류: 대화히스토리]
READY
↓
BUY 발생
↓
RUNNING
↓
SELL 발생
↓
EXITING
↓
RESETTING
↓
READY
핵심은 SELL 주문이 나갔다고 리셋 완료가 아니다.

[출처: 마스터스펙_갱신자료_STEP44\작업진행상황대화히스토리_5.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-18 17:43:02 | 분류: 대화히스토리]
메인 ↔ 루틴 권한분리
BUY 구조
SELL 구조
Position 구조
Exit Strategy
Cancel Policy
Cycle State
Reset 개념
마감/청산 연계
그래서 다음은 진짜 중요한 것만 남았다.
1순위
Position Policy 세부 설계
우리가 계속 언급했지만 아직 완전히 확정 안 된 것.
최초진입예산
연속 BUY
회차 증가
X2
X3
고정금액
고정비율
스킵
예산소진
완충영역
즉.
BUY 발생
↓
이번 회차 얼마를 살 것인가
를 결정하는 엔진.
사실 지금 구조에서 가장 미완성인 부분이다.
2순위
완충(Buffer) 정책 상세화
이건 이미 철학은 확정됐다.
전체예산 위험
↓
선택과 집중
↓
수익률 최저 종목 조기마감
↓
청산
하지만.
몇 %에서 진입?
복수 종목이면?
연속 진입이면?
등은 아직 미정.
3순위
검토관리 → 트러블관리 승격
이건 예전에 네가 말한 것.
현재
검토관리
인데.
실제 역할은.
예외상황 관리
에 가깝다.
그래서.
트러블관리
로 승격할지.
검토관리 유지
할지.
내 판단
지금은 무조건
Position Policy
부터 가야 한다.
이유.
현재 구조에서.
BUY 신호
는 있는데.
얼마를 사는가
가 아직 제대로 확정 안 됐다.
그리고 이게.
최초진입예산
연속 BUY
X2
X3
마틴
고정금액
고정비율
스킵
전부 연결된다.
그래서 다음 논의는:
최초진입예산 = 100만원
BUY #1
BUY #2
BUY #3
BUY #4
일 때.
기본 디폴트를
고정금액
으로 볼지.
고정비율
로 볼지.
배수증가(X2/X3)
로 볼지.
이걸 먼저 정해야 한다.
내 기억으로는 네가 예전에 말한 방향은
최초진입예산
=
메인
회차증가 방식
=
루틴
이었다.
그래서 다음 스텝은 Position Policy 세부 설계가 가장 합리적이다.
동의 고고
좋다.
이제부터는 사실상 Position Policy 핵심부다.
여기서 잘못 잡으면 나중에 X2, X3, 마틴, 고정금액, 능동매수 전부 꼬인다.
우선 현재까지 확정된 것부터.
메인 담당
전체예산
루틴예산
종목예산
최초진입예산
즉.
이 종목 첫 진입에
얼마를 투입할 수 있는가
는 메인 담당.
루틴 담당
추가매수
회차증가
X2
X3
고정금액
고정비율
능동매수
즉.
BUY #2
BUY #3
BUY #4
를 어떻게 운영할지는 루틴 담당.
그러면 다음 질문.
최초 BUY
예)
최초진입예산
100만원
BUY #1
100만원
진입.
그 다음.
BUY #2 발생.
이때 루틴은.
A
100만원
100만원
100만원
고정금액.
B
100만원
200만원
400만원
배수증가.
C
100만원
50만원
50만원
50만원
잔여예산 분할.
D
사용자 직접입력
현재까지 네가 여러 번 말한 철학을 보면.
디폴트는
고정금액
이 맞다.
왜냐하면.
X2
X3
마틴
은 전략이다.
반면.
고정금액
은 가장 중립적이다.
즉.
Position Policy 디폴트.
최초진입
100만원
↓
BUY #2
100만원
↓
BUY #3
100만원
옵션.
배수증가
고정비율
사용자배열
그리고 여기서 하나.
예전에 네가 말했던.
BUY 신호 발생
↓
스킵
은 회차 증가 안 한다.
즉.
BUY #1
↓
BUY #2 스킵
↓
BUY #2
이다.
이 부분은 이미 거의 확정 상태.
그래서 다음 확정해야 할 것은.
배수증가 기준
예)
100
200
400
800
처럼
직전 회차 기준으로 증가할 것인지.
아니면.
100
300
900
2700
처럼
최초진입예산 기준 X3로 갈 것인지.
이 부분이다.
내 기억으로는 너는 예전 계산에서도
100
300
900
같은 방식으로 많이 검증했었다.
즉 "회차별 배수" 쪽에 가까웠다.
이걸 Position Policy 기본 구조에 넣어야 한다.

[출처: 마스터스펙_갱신자료_STEP44\작업진행상황대화히스토리_5.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-18 17:43:02 | 분류: 대화히스토리]
09:01 BUY
09:04 BUY
09:07 BUY
09:10 BUY
09:13 BUY
5번 연속 BUY.
이때.
A안
BUY 나오면 무조건 매수
B안
회차간 최소시간
예)
최소 10분
C안
최초 BUY 기준
-2%
하락해야 추가매수
D안
최소시간
+
가격조건
여기서 우리가 예전에 이미 이야기했던 게 있다.
너는
최초 BUY 기준가
를 중심으로
3분마다
10분내 n회
최초 BUY 대비 -2%
같은 구조를 말했었다.
즉.
추가매수 허용조건
도 Position Policy 영역이다.
그래서 Position Policy는 사실 2단계다.
1단계
수량결정
고정금액
고정주수
X2
X3
사용자배열
2단계
진입허용
BUY 신호만
최소시간
가격조건
시간+가격 조합
내 판단은.
디폴트는
BUY 신호만
이다.
왜냐하면 MACD 오실레이터 루틴의 기본 철학 자체가
신호가 나오면 진입
이기 때문이다.
그리고 옵션으로.
회차간 최소시간
최초 BUY 기준가 조건
시간+가격 조합
을 넣는다.
이렇게 하면.
보수형
사용자는 제한을 걸고,
공격형
사용자는 신호만으로 운영 가능하다.
그래서 다음 확정할 것은 이것이다.
추가매수 허용조건의 기준가격
후보는 두 개.
A.
최초 BUY 체결가 기준
B.
직전 BUY 체결가 기준
나는 지금까지 네가 말한 방향을 보면
최초 BUY 기준
이 더 일관적이라고 본다.
왜냐하면 너는 여러 번
최초 신호 발생 현재가 대비
를 기준으로 예를 들었기 때문이다.
오키 고고
좋다.
그럼 이제 Position Policy에서 가장 중요한 경계선을 하나 정해야 한다.
우리는 지금까지
추가매수 조건
=
최초 BUY 기준
으로 가고 있다.
그런데 여기서 문제가 하나 생긴다.
예)
최초 BUY
10000원
BUY #2 조건
-2%
BUY #3 조건
-4%
BUY #4 조건
-6%
그런데 실제 상황.
10000
↓
9800
(BUY #2)
↓
9600
(BUY #3)
↓
9500
이때 다시 BUY 신호가 10번 나와도.
최초 BUY 기준
만 사용하면
BUY #3 조건 충족
상태가 계속 유지된다.
그래서 Position Policy에는
회차 진입 판정 방식
이 하나 더 필요하다.
A안
조건 충족 상태면
BUY 신호마다 진입
B안
회차별 조건
1회만 사용
예)
-2%
한번 사용
↓
다음부터 무효
↓
다음 회차 조건으로 이동
나는 B가 맞다.
즉.
1회차
10000
2회차
9800 이하
3회차
9600 이하
4회차
9400 이하
각 회차 조건은
한번만 발동
한다.
그래야.
9600에서 횡보
중에
BUY
BUY
BUY
BUY
BUY
나와도
3회차만 실행
되고
4회차 조건
9400
도달 전까지는 추가진입 안 한다.
이 구조가 되면.
최초 BUY 기준
철학도 유지되고.
무한추가매수
도 방지된다.
그래서 현재 Position Policy는.
기준가격
=
최초 BUY 기준
회차조건
=
1회 사용 후 소멸
다음 회차 조건으로 이동
회차증가
=
루틴 담당
예산승인
=
메인 담당
여기까지 오면 상당히 안정된다.
다음으로 넘어가면 최대 회차수를 논의해야 한다.
예를 들어.
무제한
5회
10회
20회
이걸 루틴이 관리할지, 메인이 관리할지 정해야 한다.
내 판단은 지금까지 철학대로라면
회차수 자체
=
루틴
예산한도
=
메인
이 가장 일관적이다.

[출처: 마스터스펙_갱신자료_STEP44\작업진행상황대화히스토리_5.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-18 17:43:02 | 분류: 대화히스토리]
바이 신호 1개는 그거하나로 독립신호로 보는게 맞고 최초 신호에 이후 신호를 종속시키이 위한 장치는 분할매수의 개념으로 생각을 해볼필요가 있다..상황을 유추해보면 연속신호는 매매싸이클의 시작이후 몇번이 될지 모르는 바이를 수행해야 하는 예측이 어려운 분야이다. 비율제한을 건다면 최초 바이 다음바이는 n%이하 그리고 그다음 바이는 2회차 바이의 n%이하....이래야 중간에 충족을 못하는 바이는 패쓰.v 평단관리 유리
오...
이건 지금까지 이야기한 것 중에서 꽤 중요한 관점 전환이다.
내가 방금까지는
BUY #1
BUY #2
BUY #3
를 회차 중심으로 생각했는데,
네 말은 사실상
BUY 신호
=
독립사건
이다.
예를 들어.
09:00 BUY
09:03 BUY
09:06 BUY
09:09 BUY
가 발생.
지금까지 생각.
1회차
2회차
3회차
4회차
그런데 네 관점은.
BUY 신호는 각각 독립
다만
Position Policy가
얼마를 살지 결정
이다.
이게 왜 중요하냐면.
예를 들어.
최초 BUY
100만원
설정.
다음 BUY는
직전 BUY 금액의 80% 이하
그 다음은
직전 BUY의 80% 이하
그러면.
100
80
64
51
40
...
이런 식으로 간다.
반대로.
100
50
25
12
도 가능.
즉.
추가매수는
회차증가
가 아니라.
분할매수 계획
에 더 가까워진다.
이 방식의 장점.
신호 예측 불필요
우리는.
앞으로 BUY가
몇 번 나올지
모름
그래서.
10회 나올 수도 있음
그런데.
100
300
900
2700
같은 구조는.
4번째부터
예산 폭발
가능.
반면.
100
80
64
51
40
32
...
은.
신호가 많이 나올수록
진입규모 감소
한다.
그리고 네가 말한.
조건 충족 못하면
패스
도 중요.
예)
1차
100만원
2차
80만원 이하
현재 예산부족
↓
PASS
↓
다음 BUY 대기
즉.
BUY 신호
와
실제 진입
를 분리하는 개념.
이렇게 보면 Position Policy도 사실 2개로 갈린다.
신호관리
↓
분할매수 계획
↓
메인 예산 승인
솔직히 지금 이 방향은 꽤 마음에 든다.
왜냐하면.
몇 회차까지 갈지 모르는
연속 BUY
라는 MACD 특성과도 잘 맞고.
평단관리
측면에서도.
100
80
64
51
...
같은 감쇠형 구조가
100
200
400
800
...
보다 훨씬 안전하다.
그래서 Position Policy를 단순 "회차 증가 엔진"이 아니라
분할매수 계획 엔진
으로 재정의하는 것이 더 합리적으로 보인다.
이 관점이면 예전에 이야기했던
X2
X3
고정금액
고정비율
사용자배열
도 전부 "분할매수 계획 방식"으로 깔끔하게 흡수된다.

[출처: 마스터스펙_갱신자료_STEP44\작업진행상황대화히스토리_5.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-18 17:43:02 | 분류: 대화히스토리]
0% 조건
= 최초 BUY 현재가 이하
즉 0%도 “아무 가격이나 매수”가 아니라, 최초 신호가보다 같거나 낮을 때만 허용하는 효과가 있다.
그래서 구조는:

[출처: 마스터스펙_갱신자료_STEP44\작업진행상황대화히스토리_5.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-18 17:43:02 | 분류: 대화히스토리]
BUY 신호 발생
↓
다음 미사용 진입 슬롯 확인
↓
현재가 <= 최초 BUY 현재가 × 슬롯 조건%
↓
충족하면 해당 슬롯 실행
↓
미충족이면 BUY 스킵, 슬롯 유지
이걸 position_policy의 핵심 원리로 잡으면 된다.

[출처: 마스터스펙_갱신자료_STEP44\작업진행상황대화히스토리_5.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-18 17:43:02 | 분류: 대화히스토리]
이거를 회차수마다 비율을 정해줄수 있는게 아니다..바이가 몇번이 나올줄알고....비율은 고정 비교대상은 적횽현재와 직전 현재가다....내가 이야기한 최초현재가는 이후 바이 가격이 아무리 높아도 최초바이의 가격을 넘을수 없다는거다 이 알고리즘 이해해?
이제 이해했다. 내가 또 “회차별 % 테이블”로 잘못 끌고 갔다.
정확한 알고리즘은 이거다.
기준 1: 최초 BUY 현재가
기준 2: 직전 실제 BUY 현재가
비율: 고정값 1개
예:
고정조건 = 직전 BUY 현재가 대비 -10% 이하
최초 BUY 현재가 = 10,000원
동작:
BUY #1
10,000원
→ 진입
BUY #2
9,500원
→ 직전 BUY 10,000원의 -10% 이하 아님
→ 스킵

[출처: 마스터스펙_갱신자료_STEP44\작업진행상황대화히스토리_5.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-18 17:43:02 | 분류: 대화히스토리]
BUY #3
8,500원
→ 직전 BUY 10,000원의 -10% 이하
→ 실질 2회차 진입
→ 직전 BUY 현재가 갱신 = 8,500원
다음 BUY
8,000원
→ 8,500원의 -10% 이하 아님
→ 스킵
다음 BUY
7,600원
→ 8,500원의 -10% 이하
→ 실질 3회차 진입
그리고 추가 안전조건:
이후 BUY 가격은 최초 BUY 현재가를 초과하면 안 됨.
즉:

[출처: 마스터스펙_갱신자료_STEP44\작업진행상황대화히스토리_5.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-18 17:43:02 | 분류: 대화히스토리]
BUY 신호는 독립적으로 계속 들어오지만, 실제 추가진입은 “최초가 이하 + 직전 실제 진입가 대비 고정비율 이하”일 때만 발생한다.
다음 고고

[출처: 마스터스펙_갱신자료_STEP44\작업진행상황대화히스토리_5.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-18 17:43:02 | 분류: 대화히스토리]
좋다. 지금은 position_policy를 바로 고쳐야 한다. 핵심은 회차별 %가 아니라, 고정 비율 + 최초 BUY 현재가 상한 + 직전 실제 BUY 현재가 비교로 정정하는 것이다.
5s 동안 생각함
생성이 끊겨서 v9 파일만 다시 만들겠습니다. 방금 정정한 알고리즘 그대로 반영합니다.
v9 작성 완료.
정책 초안 v9 ZIP 다운로드
추가/수정:
position_policy.json
개념정리 v9
다음 뭐?
지금 흐름상 다음은 3개 후보가 있다.

[출처: 마스터스펙_갱신자료_STEP44\작업진행상황대화히스토리_5.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-18 17:43:02 | 분류: 대화히스토리]
A. Position Policy 완성
B. Exit Strategy 고도화
C. 트러블(검토)관리
그런데 우선순위는 A가 맞다.
왜냐하면 지금 Position Policy가 거의 완성 직전인데 아직 핵심 하나가 안 정해졌다.
현재 확정된 것.
최초 BUY 현재가 = 기준점
추가 BUY
=
최초 BUY 현재가 이하
AND
직전 실제 BUY 현재가 대비 -n%
예)
최초 BUY
10000
비율
10%
이면
10000
↓
8500
(실질 2회차)
↓
7600
(실질 3회차)
그런데 아직 안 정한 것.

[출처: 마스터스펙_갱신자료_STEP44\작업진행상황대화히스토리_5.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-18 17:43:02 | 분류: 대화히스토리]
추가 BUY 간격 비율
직전 실제 BUY 대비
몇 % 하락 시
다음 진입 허용?
이걸 단일 값으로 둘지, 범위로 둘지다.
나는 현재는
단일 값
이 맞다고 본다.
예)
5%
10%
15%
20%
운영자가 하나 선택.
이게 지금 Position Policy 마지막 핵심에 가깝다.
%는 실상 +-를모두 대응한는걸로 단일 가..
오. 그게 더 맞다.
내가 계속 하락장 추가매수 관점으로만 보고 있었네.
실제로는 루틴마다 방향이 다를 수 있다.
예를 들면.
하락추종 추가진입
=
직전 BUY 대비 -10%
도 있고.
상승추종 추가진입
=
직전 BUY 대비 +10%
도 있다.
심지어.
±0%
도 가능.
즉.
현재가 >= 직전 BUY
이면 진입.
그러면 구조는.
추가 BUY 가격조건
기준
=
직전 실제 BUY 현재가
변동률
=
사용자 입력
예)
-10%
↓
현재가 <= 직전 BUY × 0.9
예)
+10%
↓
현재가 >= 직전 BUY × 1.1
예)
0%
↓
현재가 >= 직전 BUY
또는
현재가 <= 직전 BUY
방향설정 필요.
그러면 사실 옵션은 2개다.
방향
하락추종
상승추종
비율
0~100%
사용자 입력.
그리고 최초 BUY 현재가 상한은 나는 여전히 유지하는 게 맞다고 봤는데...
여기서 다시 생각해보니
상승추종 전략
을 허용하면
현재가 <= 최초 BUY 현재가
이 조건은 충돌한다.
예)
최초 BUY
10000
상승추종
+10%
이면
11000
에서 진입해야 하는데
최초 BUY 이하
조건 때문에 영원히 진입 못 한다.
그래서 여기서 중요한 질문이 하나 생긴다.
최초 BUY 현재가 제한
은
하락추종 전략에서만 사용
할 것인가?
아니면
상승추종 전략에서는 비활성
할 것인가?
내 생각에는 후자가 더 자연스럽다.
왜냐하면 지금 논의하다 보니
최초 BUY 현재가 이하
는 사실 "평단관리형 추가매수" 전용 안전장치에 가깝고,
상승추종 추가매수
와는 철학 자체가 다르기 때문이다.
이 부분이 Position Policy에서 다음 확정 포인트 같다.

[출처: 마스터스펙_갱신자료_STEP44\작업진행상황대화히스토리_5.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-18 17:43:02 | 분류: 대화히스토리]
가격제한 정책
비활성
BUY 신호 발생
↓
가격조건 검사 없음
↓
BUY
최초 BUY 상한
현재가 <= 최초 BUY 가격
최초 BUY 하한
현재가 >= 최초 BUY 가격
양방향 범위
최초 BUY 기준
상승 +n%
하락 -n%
범위 내만 허용.
직전 BUY 기준 변동률
직전 실제 BUY 기준
+n%
-n%
도달 시 허용.
그리고 지금 보니.
최초 BUY 기준 제한
과
직전 BUY 기준 제한
은 사실 서로 다른 계층이다.
그래서 나중에 구현할 때는.
가격제한 정책
과
추가진입 트리거 정책
을 분리하는 게 더 깔끔할 것 같다.
왜냐하면.
최초 BUY 상한 활성
AND
직전 BUY -10%
같이 조합해서 쓰고 싶을 가능성이 매우 높기 때문이다.
이건 다음 Position Policy 정리 때 반영해야 할 사항으로 보인다.
다음 고고

[출처: 마스터스펙_갱신자료_STEP44\작업진행상황대화히스토리_5.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-18 17:43:02 | 분류: 대화히스토리]
그래서 다음 단계는 사실상 완충(Buffer) 정책 세부 로직으로 넘어가도 될 수준이다. BUY, SELL, Cycle, Exit, Reset은 큰 뼈대가 거의 정리됐다.
오케이 고고
좋다.
그럼 이제 남은 큰 덩어리인 완충(Buffer) 정책으로 가자.
사실 완충은 이미 철학은 거의 확정되어 있다.
완충의 존재 이유
우리는 원래.
BUY 신호
=
제한 없이 허용
철학을 갖고 있다.
즉.
신호가 좋으면
계속 진입
이다.
그런데 현실은.
전체예산
1억
이라 해도.
A종목
B종목
C종목
D종목
가 동시에 돈을 먹는다.
그러면 어느 순간.
예산부족
이 발생.
그래서 완충의 존재 이유는.
신규 BUY 차단
이 아니다.
핵심은.
선택과 집중
이다.
현재까지 확정된 철학
예산 사용률.
70%
80%
90%
경고.
설정 완충영역 진입.
예)
85%
그러면.
가장 성과가 나쁜 종목
을 정리하기 시작.
즉.
수익률 최저
종목을.
조기마감
으로 보냄.
중요.
이건.
즉시 시장가 청산
이 아니다.
우리가 이미 정한 것.
조기마감
=
마지막 SELL 대기
이다.
그래서 흐름.

[출처: 마스터스펙_갱신자료_STEP44\작업진행상황대화히스토리_5.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-18 17:43:02 | 분류: 대화히스토리]
BUY 정책
SELL 정책
Exit Strategy
Cycle State
Position Policy
Buffer Policy
Trouble Policy(v1)
여기까지 왔다.
이 정도면 구조 설계는 상당히 높은 수준까지 올라온 상태다.
다음부터는 예산엔진 세부화 또는 실제 구현 단계에서 검증하면서 수정하는 쪽이 더 효율적일 가능성이 크다.
이름은 트러블관리보다는 다른 이름이 좋을듯
나도 그렇게 생각한다.
사실 "트러블관리"는 개발자 입장에서는 이해되는데,
실제 운영자가 매일 보는 화면 이름으로는 좀 거칠다.
우리가 지금 정의한 역할은 단순히 문제종목 모음이 아니다.
진단
복구
응급조치
격리
관리
까지 포함한다.
그래서 후보를 생각해보면.
1안 검토관리 (기존)
장점
익숙함
거부감 없음
단점
기능이 너무 커졌는데 이름이 약함
2안 복구관리
장점
현재 역할과 가장 가까움
단점
문제 발견 기능이 안보임
3안 안정성관리
장점
현재 철학과 가장 잘 맞음
안정성검사
안정성관리
연결도 자연스러움.
단점
조금 딱딱함
4안 운영관리
장점
포괄적
단점
너무 범위가 넓음
관제창과 역할 충돌.
5안 예외관리
장점
정확함
단점
복구 기능 느낌이 약함
6안 복구센터
장점
직관적
단점
UI 명칭으로는 다소 가벼움
7안 안정성센터
장점
철학과 일치
안정성검사
↓
안정성센터
흐름 좋음.
내가 지금까지 논의된 역할을 기준으로 보면.
검토관리
→ 안정성관리
가 가장 자연스럽다.
왜냐하면 이 창의 목적이
문제종목 보관
이 아니라.
운영 안정성 확보
이기 때문이다.
그래서 현재 1순위 후보는.
안정성관리
2순위는.
복구관리
정도라고 본다.
개인적으로는 지금까지 네가 강조해온
안정성검사
와 이어지는
안정성관리
가 가장 일관성이 좋아 보인다.
그냥 검토관리로...차후 방향성에 맞는 이름이있으면 그거로 변경
동의.
지금은 굳이 이름 바꾸려고 애쓸 필요가 없어 보인다.
오히려 지금의 검토관리는 프로젝트 전체에서 이미 많이 사용되고 있고,
검토관리 이동
검토관리 창
검토관리 종목
검토관리 복귀
등이 전부 정착되어 있다.
지금 단계에서
검토관리 → 안정성관리
검토관리 → 트러블관리
검토관리 → 복구관리
로 바꾸면 얻는 이득보다,
문서/정책/UI/대화기록 수정량이 더 커진다.
그래서 현재 확정안은.
명칭:
검토관리
역할:
문제종목 보관소
+
안정성 확보
+
복구 지원
+
응급조치
+
운영자 확인
그리고 중요한 점.
이름 = 검토관리
기능 = 확장
이다.
즉 예전의 검토관리는
문제종목 모아놓는 곳
이었지만,
현재의 검토관리는
안정성검사 결과 수용
미체결 취소
현재가 청산
시장가 청산
재동기화
루틴 재지정
복귀
까지 포함하는 개념으로 확장.
그래서 현 시점에서는
검토관리 유지
가 가장 합리적이다.
차후 실제 키움 연동 후 운영하면서
"검토"보다 "복구" 역할이 훨씬 크다.
라고 판단되면 그때 명칭 변경 검토.
현재 상태 기준으로 보면 구조 설계 영역은 거의 끝이 보인다.
남은 핵심은
예산엔진 최종 정리
실제 구현
키움 연동 테스트
실전 검증 후 보정
정도다.

[출처: 마스터스펙_갱신자료_STEP44\작업진행상황대화히스토리_5.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-18 17:43:02 | 분류: 대화히스토리]
BUY 신호
→ 가격조건
→ 실제진입
→ 회차증가
→ X2/X3
흐름이 이미 회차기준으로 완전히 맞물려 있기 때문이다.

[출처: 마스터스펙_갱신자료_STEP44\작업진행상황대화히스토리_5.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-18 17:43:02 | 분류: 대화히스토리]
- BUY 신호 생성 검증 완료
- SELL 신호 생성 검증 완료
- BUY 신호는 주문후보 생성기로 전달
- SELL 신호는 보유수량 검증 후 주문후보 생성기로 전달
- SELL 후보 생성 시 실제 보유수량과 mock_position 보유수량을 모두 참조
- mock_position 기반 SELL 후보 생성 검증 완료
PART 08. 주문엔진 정책
(지금 ZIP에서 아직 안 열어본 08 파트)
이게 가장 중요하다.
STEP08~STEP20의 70% 이상이 여기 들어간다.
추가될 내용:
주문 파이프라인

[출처: 마스터스펙_갱신자료_STEP44\작업진행상황대화히스토리_5.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-18 17:43:02 | 분류: 대화히스토리]
1. 사고 개요
MACD 루틴 구현 검토 과정에서 기존 마스터스펙, 작업진행상황대화히스토리, 확정 참조문서에 존재하지 않는 개념이 AI에 의해 삽입되었다.
삽입된 대표 개념:
HOLD 신호
position_status 구조
trade_set_id 구조
STEP21 평단포지션구축 엔진
STEP22 상태관리 설계
능동매수 엔진 선행 구현
이 개념들은 당시 확정 문서에 존재하지 않았으며 사용자 승인도 받지 않은 상태였다.
그럼에도 AI가 일반적인 자동매매 시스템 구조를 기준으로 추론하여 프로젝트 개념처럼 설명하였다.
결과적으로 프로젝트 방향과 무관한 설계 문서 및 코드가 생성되었다.
2. 실제 발생한 문제
2-1. HOLD 개념 삽입
AI는 루틴 구조를 설명하면서:
BUY
SELL
HOLD
구조를 제안하였다.
그러나 이후 검증 결과:
작업진행상황대화히스토리
마스터스펙
확정 참조문서
어느 곳에도 HOLD 신호 체계는 존재하지 않았다.
이는 AI가 일반적인 매매 프로그램 구조를 프로젝트 구조로 착각한 사례이다.
2-2. 상태관리 구조 선행 생성
AI는:
position_status
trade_set_id
buy_plan_status
등을 포함한 상태관리 문서를 작성하였다.
그러나 해당 구조는 프로젝트에서 확정된 적이 없었다.
결과적으로 실제 구현보다 앞선 설계가 문서화되었다.
2-3. 코드 오염
다음 파일들이 생성되었다.
macd_position_engine.py
macd_signal_engine.py
signal_result.py
해당 파일들에는:
HOLD
position_plan
buy_plan
avg_adjustment
등의 미확정 개념이 포함되었다.
이후 프로젝트 기준본을 다시 확인한 결과 해당 파일들은 폐기 대상으로 판정되었다.
3. 복구 작업
복구 기준본:
kiwoom_auto (41)(1).zip
오염본:
kiwoom_auto (42).zip
판정:
42 폐기
41(1) 복귀
으로 결정되었다.
STEP21 문서 폐기
STEP22 문서 폐기
신규 생성 설계 문서 폐기
신규 생성 엔진 파일 폐기
조치가 수행되었다.
4. 절대 금지 규칙
규칙 1
확정 문서에 없는 개념을 생성하지 말 것.
예:
HOLD
POSITION_ACTIVE
trade_set_id
등.
문서 근거 없이 생성 금지.
규칙 2
일반적인 업계 구조를 프로젝트 구조로 착각하지 말 것.
예:
다른 자동매매 프로그램에서 흔한 개념이라도 프로젝트 문서에 없으면 존재하지 않는 것으로 간주한다.
규칙 3
추론보다 문서 검증을 우선한다.
순서:
마스터스펙 확인
작업진행상황대화히스토리 확인
확정 참조문서 확인
사용자 확인
구현
이 순서를 반드시 따른다.
규칙 4
설계 문서 작성은 구현 필요성이 검증된 이후에만 수행한다.
문서를 먼저 만들고 구현 방향을 끌고 가는 행위를 금지한다.
규칙 5
사용자 승인 없는 신규 철학 추가 금지
예:
HOLD 도입
상태머신 도입
포지션 엔진 도입
능동매수 엔진 도입
등.
반드시 기존 문서 근거 또는 사용자 승인 필요.
5. 최종 결론
본 사고는 구현 실패가 아니라 검증 실패 사고이다.
문제의 원인은:
문서 확인 이전에 AI 추론을 우선 적용한 것이다.
향후 프로젝트에서는:
문서 근거 없는 개념 생성 금지
문서 근거 없는 코드 생성 금지
문서 근거 없는 설계 문서 생성 금지
를 최상위 안전 원칙으로 적용한다.

[출처: routine_policy_draft_v3\sell_policy.json | 기준일: 2026-06-16 | 수정시각: 2026-06-16 23:45:08 | 분류: 기타문서/자료]
{
 "version": "1.1",
 "policy_type": "sell_policy",
 "description": "SELL 실행정책 v3 초안: 단일가격/다중호가 + 단일지점/다중지점 조합 및 다중지점 3개 모드 지원",
 "sell_execution_axis": {
 "price_axis": "single_price",
 "time_axis": "single_point",
 "available_price_axis": [
 "single_price",
 "multi_quote"
 ],
 "available_time_axis": [
 "single_point",
 "multi_point"
 ]
 },
 "reference": {
 "main_signal_price": {
 "source": "current_price_at_main_sell_signal",
 "fixed_during_signal_plan": true
 },
 "average_price": {
 "source": "kiwoom_server_average_price",
 "use_internal_average_price_for_validation": true
 }
 },
 "sell_signal_condition": {
 "oscillator_turn_down": true,
 "profit_rate_reached": true,
 "condition_operator": "or",
 "target_profit_percent": 3.0
 },
 "single_price": {
 "enabled": true,
 "order_price_type": "current_price",
 "order_basis": "holding_quantity"
 },
 "multi_quote": {
 "enabled": false,
 "quote_side": "sell",
 "quote_levels": [
 1,
 3,
 5
 ],
 "quantity_distribution_percent": [
 40,
 30,
 30
 ],
 "order_basis": "holding_quantity",
 "purpose": "가격의 종축 배치. 매도호가 분산으로 체결과 가격 개선 균형 조절."
 },
 "single_point": {
 "enabled": true,
 "trigger": "main_sell_signal",
 "sell_quantity_percent": 100,
 "purpose": "메인 SELL 신호 시점 1회 실행."
 },
 "multi_point": {
 "enabled": false,
 "reference_price": "main_signal_price",
 "basis_description": "다중지점 비교 기준은 최초 메인 SELL 신호 발생 시 현재가로 고정한다.",
 "mode": "interval_compare",
 "available_modes": [
 "fixed_time_split",
 "interval_compare",
 "time_window_price_condition"
 ],
 "common_limits": {
 "max_rounds": 3,
 "total_time_limit_minutes": 15,
 "round_quantity_distribution_percent": [
 50,
 30,
 20
 ],
 "stop_when_position_closed": true,
 "stop_when_buy_signal_occurs": true,
 "stop_when_system_close_or_liquidation": true
 },
 "fixed_time_split": {
 "enabled": false,
 "description": "정해진 시간 안에 정해진 횟수로 분할 매도한다.",
 "example": "10분 안에 3번 매도",
 "split_count": 3,
 "total_time_minutes": 10,
 "interval_minutes": 3,
 "price_filter": {
 "enabled": false,
 "basis": "main_signal_price",
 "operator": "current_price_gte_reference_percent",
 "percent": 0.0
 }
 },
 "interval_compare": {
 "enabled": true,
 "description": "최초 매도 이후 일정 시간/봉마다 최초신호가 대비 현재가를 비교 후 매도한다.",
 "example": "최초매도 이후 3분에 한 번 비교 매도",
 "compare_interval": {
 "type": "minute",
 "minutes": 3,
 "candles": null
 },
 "condition": {
 "basis": "main_signal_price",
 "operator": "current_price_gte_reference_percent",
 "percent": 0.0
 },
 "max_compare_count": 3
 },
 "time_window_price_condition": {
 "enabled": false,
 "description": "정해진 시간 안에서 최초신호가 대비 특정 상승률 이상이면 회차 매도한다.",
 "example": "15분 내 최초현재가 대비 +2% 이상이면 최대 3번 매도",
 "time_limit_minutes": 15,
 "condition": {
 "basis": "main_signal_price",
 "operator": "current_price_gte_reference_percent",
 "percent": 2.0
 },
 "max_sell_count": 3,
 "cooldown_between_orders_seconds": 10
 }
 }
}

[출처: routine_policy_draft_v3\buy_policy.json | 기준일: 2026-06-16 | 수정시각: 2026-06-16 23:45:08 | 분류: 기타문서/자료]
{
 "version": "1.1",
 "policy_type": "buy_policy",
 "description": "BUY 실행정책 v3 초안: 단일가격/다중호가 + 단일지점/다중지점 조합 및 다중지점 3개 모드 지원",
 "buy_execution_axis": {
 "price_axis": "single_price",
 "time_axis": "single_point",
 "available_price_axis": [
 "single_price",
 "multi_quote"
 ],
 "available_time_axis": [
 "single_point",
 "multi_point"
 ]
 },
 "reference": {
 "main_signal_price": {
 "source": "current_price_at_main_buy_signal",
 "fixed_during_signal_plan": true
 },
 "average_price": {
 "source": "kiwoom_server_average_price",
 "use_internal_average_price_for_validation": true
 }
 },
 "single_price": {
 "enabled": true,
 "order_price_type": "current_price",
 "order_basis": "amount"
 },
 "multi_quote": {
 "enabled": false,
 "quote_side": "buy",
 "quote_levels": [
 1,
 3,
 5
 ],
 "budget_distribution_percent": [
 40,
 30,
 30
 ],
 "order_basis": "amount",
 "purpose": "가격의 종축 배치. 순간 파동 속 체결 효율 제고."
 },
 "single_point": {
 "enabled": true,
 "trigger": "main_buy_signal",
 "purpose": "메인 BUY 신호 시점 1회 실행."
 },
 "multi_point": {
 "enabled": false,
 "reference_price": "main_signal_price",
 "basis_description": "다중지점 비교 기준은 최초 메인 BUY 신호 발생 시 현재가로 고정한다.",
 "mode": "interval_compare",
 "available_modes": [
 "fixed_time_split",
 "interval_compare",
 "time_window_price_condition"
 ],
 "common_limits": {
 "max_rounds": 5,
 "total_time_limit_minutes": 15,
 "round_budget_distribution_percent": [
 20,
 20,
 20,
 20,
 20
 ],
 "stop_when_budget_exhausted": true,
 "stop_when_sell_signal_occurs": true,
 "stop_when_system_close_or_liquidation": true
 },
 "fixed_time_split": {
 "enabled": false,
 "description": "정해진 시간 안에 정해진 횟수로 분할 매수한다.",
 "example": "10분 안에 5번 매수",
 "split_count": 5,
 "total_time_minutes": 10,
 "interval_minutes": 2,
 "price_filter": {
 "enabled": false,
 "basis": "main_signal_price",
 "operator": "current_price_lte_reference_percent",
 "percent": 0.0
 }
 },
 "interval_compare": {
 "enabled": true,
 "description": "최초 매수 이후 일정 시간/봉마다 최초신호가 대비 현재가를 비교 후 매수한다.",
 "example": "최초매수 이후 3분에 한 번 비교 매수",
 "compare_interval": {
 "type": "minute",
 "minutes": 3,
 "candles": null
 },
 "condition": {
 "basis": "main_signal_price",
 "operator": "current_price_lte_reference_percent",
 "percent": 0.0
 },
 "max_compare_count": 5
 },
 "time_window_price_condition": {
 "enabled": false,
 "description": "정해진 시간 안에서 최초신호가 대비 특정 하락률 이하가 되면 회차 매수한다.",
 "example": "15분 내 최초현재가 대비 -2% 이하면 최대 10번 구매",
 "time_limit_minutes": 15,
 "condition": {
 "basis": "main_signal_price",
 "operator": "current_price_lte_reference_percent",
 "percent": -2.0
 },
 "max_buy_count": 10,
 "cooldown_between_orders_seconds": 10
 }
 }
}

[출처: routine_policy_draft_v3\루틴실행정책_개념정리_v3.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-16 23:45:08 | 분류: 운영정책]
핵심 변경:
- 다중지점의 기준가격을 최초 메인신호 발생 시 현재가로 확정한다.
- 다중지점은 다음 BUY/SELL 신호를 기다리는 구조가 아니라, 최초 메인신호 이후 특정 시간/봉 안에서 해당 신호 가격에 최대한 근접하거나 더 유리한 가격에 체결되도록 실행 효율을 높이는 구조다.
- 백테스트 전 다양한 방식의 검증이 가능하도록 다중지점 3개 모드를 모두 정책 파일에서 표현 가능하게 한다.
1. 다중지점 기준가격

[출처: routine_policy_draft_v3\루틴실행정책_개념정리_v3.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-16 23:45:08 | 분류: 운영정책]
BUY 다중지점:
- 기준가격 = 최초 메인 BUY 신호 발생 시 현재가
- 이후 비교대상 = 현재가 vs 최초 BUY 신호 현재가

[출처: routine_policy_draft_v3\루틴실행정책_개념정리_v3.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-16 23:45:08 | 분류: 운영정책]
SELL 다중지점:
- 기준가격 = 최초 메인 SELL 신호 발생 시 현재가
- 이후 비교대상 = 현재가 vs 최초 SELL 신호 현재가
2. 다중지점 3개 모드

[출처: routine_policy_draft_v3\루틴실행정책_개념정리_v3.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-16 23:45:08 | 분류: 운영정책]
메인:
- BUY/SELL/CANCEL 신호 수신 후 주문/취소/체결추적 수행
- 서버 평단, 현재가, 호가, 잔고 제공
- 검토관리, 마감, 청산, 긴급정지 등 시스템 안전정책 우선

[출처: routine_policy_draft_v3\루틴실행정책_개념정리_v3.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-16 23:45:08 | 분류: 운영정책]
루틴:
- BUY/SELL/CANCEL 신호 판단
- 단일가격/다중호가/단일지점/다중지점 조합 결정
- 다중지점 모드와 회차별 예산/수량 결정
6. CANCEL

[출처: routine_policy_draft_v3\루틴실행정책_개념정리_v3.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-16 23:45:08 | 분류: 운영정책]
미체결은 즉시 실패가 아니다.
기본은 시간/봉 제한을 우선하며, 가격 이탈만으로 즉시 취소하는 것은 기본값으로 사용하지 않는다.
CANCEL은 루틴 입장에서는 신호이고, 메인 입장에서는 주문취소 행동이다.

[출처: routine_policy_draft_v3\execution_policy.json | 기준일: 2026-06-16 | 수정시각: 2026-06-16 23:45:08 | 분류: 기타문서/자료]
{
 "version": "1.1",
 "policy_type": "execution_policy",
 "description": "루틴별 BUY/SELL/CANCEL 신호를 메인 주문 행동으로 변환하기 위한 공통 실행정책 v3 초안",
 "order_basis": {
 "buy_default_basis": "amount",
 "sell_default_basis": "holding_quantity",
 "support_quantity_order": true,
 "support_amount_order": true,
 "support_holding_quantity_order": true
 },
 "order_price_type": {
 "default_buy_price_type": "current_price",
 "default_sell_price_type": "current_price",
 "supported_types": [
 "market_price",
 "current_price",
 "limit_price",
 "quote_price"
 ]
 },
 "quote_data_usage": {
 "enabled": true,
 "source": "kiwoom_server_quote_data",
 "max_quote_depth": 10,
 "buy_quote_side": "buy",
 "sell_quote_side": "sell",
 "use_quote_quantity_for_reference": true,
 "quote_quantity_is_reference_only": true
 },
 "signal_plan_record": {
 "enabled": true,
 "record_main_signal_price": true,
 "record_main_signal_time": true,
 "record_main_signal_candle_index": true,
 "reference_price_is_fixed_during_plan": true
 },
 "fill_tracking": {
 "enabled": true,
 "track_partial_fill": true,
 "track_remaining_quantity": true,
 "track_remaining_budget": true,
 "partial_fill_is_not_failure": true
 },
 "unfilled_handling": {
 "enabled": true,
 "delegate_to_cancel_policy": true,
 "default_wait_seconds": 10,
 "default_wait_candles": 1,
 "price_escape_cancel_default": false
 },
 "retry": {
 "enabled": true,
 "max_retry_count": 3,
 "retry_interval_seconds": 1,
 "retry_target_buy": "remaining_budget",
 "retry_target_sell": "remaining_quantity",
 "on_retry_exhausted": "review_required"
 },
 "average_price_reference": {
 "primary_source": "kiwoom_server_average_price",
 "internal_average_price_usage": "validation_only",
 "mismatch_action": "review_required"
 },
 "safety_rules": {
 "reject_order_when_review_required": true,
 "reject_buy_when_closing_or_liquidating": true,
 "reject_new_buy_after_early_close": true,
 "reject_new_buy_after_auto_close": true,
 "system_cancel_has_priority_over_routine_cancel": true
 },
 "logging": {
 "enabled": true,
 "log_order_create": true,
 "log_fill_update": true,
 "log_cancel_signal": true,
 "log_cancel_action": true,
 "log_retry_order": true,
 "log_policy_decision": true,
 "log_multi_point_round": true,
 "log_multi_quote_order": true
 }
}

[출처: routine_policy_draft_v3\cancel_policy.json | 기준일: 2026-06-16 | 수정시각: 2026-06-16 23:45:08 | 분류: 기타문서/자료]
{
 "version": "1.1",
 "policy_type": "cancel_policy",
 "description": "BUY/SELL 미체결 대응용 CANCEL 정책 v3 초안",
 "cancel_identity": {
 "routine_cancel": "signal",
 "main_cancel": "action",
 "system_cancel_has_priority": true
 },
 "default_principle": {
 "unfilled_is_not_immediate_failure": true,
 "prefer_time_or_candle_limit_over_price_escape": true,
 "cancel_remaining_only": true,
 "partial_fill_is_valid": true
 },
 "buy_cancel": {
 "enabled": true,
 "target": "unfilled_buy_orders",
 "trigger": {
 "time_limit_enabled": true,
 "time_limit_seconds": 10,
 "candle_limit_enabled": true,
 "candle_limit_count": 1,
 "price_escape_enabled": false,
 "price_escape_basis": "main_signal_price",
 "price_escape_percent": 1.0
 },
 "partial_fill": {
 "allow_partial_fill": true,
 "cancel_remaining_only": true
 },
 "after_cancel": {
 "action": "re_buy",
 "target": "remaining_budget",
 "max_retry_count": 3
 }
 },
 "sell_cancel": {
 "enabled": true,
 "target": "unfilled_sell_orders",
 "trigger": {
 "time_limit_enabled": true,
 "time_limit_seconds": 10,
 "candle_limit_enabled": true,
 "candle_limit_count": 1,
 "price_escape_enabled": false,
 "price_escape_basis": "main_signal_price",
 "price_escape_percent": 1.0
 },
 "partial_fill": {
 "allow_partial_fill": true,
 "cancel_remaining_only": true
 },
 "after_cancel": {
 "action": "re_sell",
 "target": "remaining_quantity",
 "max_retry_count": 3
 }
 }
}

[출처: routine_policy_draft_v2\루틴실행정책_개념정리_v2.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-16 23:31:32 | 분류: 운영정책]
작성 목적:
- MACD 오실레이터 루틴을 시작점으로 하되, 볼린저밴드/엔벨로프/RSI 등 다른 루틴에서도 재사용 가능한 실행정책 구조를 정의한다.
- 메인파트는 고정 실행 행동을 담당하고, 루틴은 기법별 신호와 실행정책을 담당한다.
- v2에서는 execution_policy.json을 추가하여 BUY/SELL/CANCEL 신호가 실제 주문 행동으로 변환되는 공통 실행 계층을 분리한다.
1. 기본 역할 분리

[출처: routine_policy_draft_v2\루틴실행정책_개념정리_v2.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-16 23:31:32 | 분류: 운영정책]
루틴파트:
- BUY / SELL / CANCEL 신호 판단
- 단일가격, 다중호가, 단일지점, 다중지점 조합 결정
- 미체결 대응 조건 판단
- 루틴별 실행정책 커스터마이징
2. BUY / SELL / CANCEL 정체성
BUY:
- 포지션 구축 또는 확대 신호
SELL:
- 포지션 축소 또는 청산 신호

[출처: routine_policy_draft_v2\루틴실행정책_개념정리_v2.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-16 23:31:32 | 분류: 운영정책]
CANCEL:
- 루틴 입장에서는 신호
- 메인 입장에서는 주문취소 행동
- 미체결 주문을 정리하고 재 BUY 또는 재 SELL로 이어가기 위한 실행정책 신호
3. 매수/매도 실행축
가격축:
- 단일가격
- 다중호가
시간축:
- 단일지점
- 다중지점

[출처: routine_policy_draft_v2\루틴실행정책_개념정리_v2.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-16 23:31:32 | 분류: 운영정책]
다중호가는 가격의 종축 개념이다.
BUY 또는 SELL 신호 시 여러 호가에 주문을 배치하여 순간 파동 속에서 체결 효율을 높이는 기법이다.
5. 다중지점 개념

[출처: routine_policy_draft_v2\루틴실행정책_개념정리_v2.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-16 23:31:32 | 분류: 운영정책]
다중지점은 시간의 횡축 개념이다.
다음 BUY/SELL 신호를 기다리는 것이 아니라, 최초 메인 신호 발생 이후 특정 시간 또는 봉 안에서 해당 신호 가격에 최대한 근접하거나 더 유리한 가격에 체결되도록 실행 효율을 높이는 기법이다.

[출처: routine_policy_draft_v2\루틴실행정책_개념정리_v2.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-16 23:31:32 | 분류: 운영정책]
BUY 주문 후 부분체결 또는 미체결 발생:
- 미체결 잔량만 CANCEL
- 잔여 예산 기준 재 BUY 가능
- 부분체결은 인정
- 목표는 해당 BUY 신호의 실행 효율 제고
9. 매도 미체결 대응

[출처: routine_policy_draft_v2\루틴실행정책_개념정리_v2.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-16 23:31:32 | 분류: 운영정책]
SELL 주문 후 부분체결 또는 미체결 발생:
- 미체결 잔량만 CANCEL
- 잔여 수량 기준 재 SELL 가능
- 전량매도는 주문 의도이며, 실제 체결은 부분체결될 수 있음
- 최종 목표는 보유수량 0 또는 루틴이 정한 잔여수량
10. execution_policy.json 역할
execution_policy.json은 루틴별 신호와 메인 주문행동 사이의 공통 실행 규칙이다.

[출처: routine_policy_draft_v2\루틴실행정책_개념정리_v2.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-16 23:31:32 | 분류: 운영정책]
권장 파일:
- buy_policy.json
- sell_policy.json
- cancel_policy.json
- execution_policy.json

[출처: routine_policy_draft_v2\execution_policy.json | 기준일: 2026-06-16 | 수정시각: 2026-06-16 23:31:32 | 분류: 기타문서/자료]
{
 "version": "1.0",
 "policy_type": "execution_policy",
 "identity": {
 "description": "루틴별 BUY/SELL/CANCEL 신호를 메인 주문 행동으로 변환하기 위한 공통 실행정책 초안",
 "main_role": "fixed_order_execution",
 "routine_role": "signal_and_execution_strategy"
 },
 "order_basis": {
 "buy_default_basis": "amount",
 "sell_default_basis": "holding_quantity",
 "support_quantity_order": true,
 "support_amount_order": true,
 "support_holding_quantity_order": true
 },
 "order_price_type": {
 "default_buy_price_type": "current_price",
 "default_sell_price_type": "current_price",
 "supported_types": [
 "market_price",
 "current_price",
 "limit_price",
 "quote_price"
 ]
 },
 "quote_data_usage": {
 "enabled": true,
 "source": "kiwoom_server_quote_data",
 "max_quote_depth": 10,
 "buy_quote_side": "buy",
 "sell_quote_side": "sell",
 "use_quote_quantity_for_reference": true,
 "quote_quantity_is_reference_only": true
 },
 "fill_tracking": {
 "enabled": true,
 "track_partial_fill": true,
 "track_remaining_quantity": true,
 "track_remaining_budget": true,
 "partial_fill_is_not_failure": true
 },
 "unfilled_handling": {
 "enabled": true,
 "delegate_to_cancel_policy": true,
 "default_wait_seconds": 10,
 "default_wait_candles": 1,
 "price_escape_cancel_default": false
 },
 "retry": {
 "enabled": true,
 "max_retry_count": 3,
 "retry_interval_seconds": 1,
 "retry_target_buy": "remaining_budget",
 "retry_target_sell": "remaining_quantity",
 "on_retry_exhausted": "review_required"
 },
 "average_price_reference": {
 "primary_source": "kiwoom_server_average_price",
 "internal_average_price_usage": "validation_only",
 "mismatch_action": "review_required"
 },
 "safety_rules": {
 "reject_order_when_review_required": true,
 "reject_buy_when_closing_or_liquidating": true,
 "reject_new_buy_after_early_close": true,
 "reject_new_buy_after_auto_close": true,
 "system_cancel_has_priority_over_routine_cancel": true
 },
 "logging": {
 "enabled": true,
 "log_order_create": true,
 "log_fill_update": true,
 "log_cancel_signal": true,
 "log_cancel_action": true,
 "log_retry_order": true,
 "log_policy_decision": true
 },
 "state_record": {
 "enabled": true,
 "record_signal_id": true,
 "record_order_id": true,
 "record_policy_file": true,
 "record_execution_axis": true,
 "record_cancel_retry_count": true
 }
}

[출처: routine_policy_draft_v2\sell_policy.json | 기준일: 2026-06-16 | 수정시각: 2026-06-16 23:31:32 | 분류: 기타문서/자료]
{
 "version": "1.0",
 "policy_type": "sell_policy",
 "sell_execution_axis": {
 "price_axis": "single_price",
 "time_axis": "single_point"
 },
 "single_price": {
 "enabled": true,
 "order_price_type": "current_price",
 "order_basis": "holding_quantity"
 },
 "multi_quote": {
 "enabled": false,
 "quote_side": "sell",
 "quote_levels": [
 1,
 3,
 5
 ],
 "quantity_distribution_percent": [
 40,
 30,
 30
 ],
 "order_basis": "holding_quantity"
 },
 "single_point": {
 "enabled": true,
 "trigger": "main_sell_signal",
 "sell_quantity_percent": 100
 },
 "multi_point": {
 "enabled": false,
 "max_rounds": 3,
 "round_quantity_distribution_percent": [
 50,
 30,
 20
 ],
 "time_condition": {
 "type": "candle",
 "candle_intervals": [
 1,
 3,
 5
 ],
 "time_limit_minutes": null
 },
 "price_condition": {
 "basis": "kiwoom_server_average_price",
 "compare": "current_price_above_average_price",
 "percent_steps": [
 2.0,
 3.0,
 4.0
 ]
 }
 },
 "sell_signal_condition": {
 "oscillator_turn_down": true,
 "profit_rate_reached": true,
 "condition_operator": "or",
 "target_profit_percent": 3.0
 }
}

[출처: routine_policy_draft_v2\cancel_policy.json | 기준일: 2026-06-16 | 수정시각: 2026-06-16 23:31:32 | 분류: 기타문서/자료]
{
 "version": "1.0",
 "policy_type": "cancel_policy",
 "cancel_identity": {
 "routine_cancel": "signal",
 "main_cancel": "action"
 },
 "buy_cancel": {
 "enabled": true,
 "target": "unfilled_buy_orders",
 "trigger": {
 "time_limit_enabled": true,
 "time_limit_seconds": 10,
 "candle_limit_enabled": true,
 "candle_limit_count": 1,
 "price_escape_enabled": false
 },
 "partial_fill": {
 "allow_partial_fill": true,
 "cancel_remaining_only": true
 },
 "after_cancel": {
 "action": "re_buy",
 "target": "remaining_budget",
 "max_retry_count": 3
 }
 },
 "sell_cancel": {
 "enabled": true,
 "target": "unfilled_sell_orders",
 "trigger": {
 "time_limit_enabled": true,
 "time_limit_seconds": 10,
 "candle_limit_enabled": true,
 "candle_limit_count": 1,
 "price_escape_enabled": false
 },
 "partial_fill": {
 "allow_partial_fill": true,
 "cancel_remaining_only": true
 },
 "after_cancel": {
 "action": "re_sell",
 "target": "remaining_quantity",
 "max_retry_count": 3
 }
 }
}

[출처: 05_운영정책_테스트체크리스트_v2026-06-16_종목폴더통합_검토관리_최신갱신.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-16 17:45:20 | 분류: 갱신문서]
============================================================
[2026-06-16 추가 갱신] 루틴엔진 / 주문생명주기 설계 확정 방향
============================================================
핵심 철학
- 루틴 = 전략 판단 엔진
- 메인 = 주문 실행 및 트러블슈팅 엔진
루틴 신호 체계
- BUY_SIGNAL
- SELL_SIGNAL
- CANCEL_SIGNAL(판단만 수행)
루틴 접근 정보
- 현재가
- 평단
- 보유수량
- 체결수량
- 미체결수량
- 매수회차
- 목표수량/금액

[출처: 05_운영정책_테스트체크리스트_v2026-06-16_종목폴더통합_검토관리_최신갱신.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-16 17:45:20 | 분류: 갱신문서]
최대 미확정 항목
- 주문 생명주기(Order Lifecycle)
- BUY → 부분체결 → CANCEL → 재진입 → 완료 판정

[출처: 05_운영정책_테스트체크리스트_v2026-06-16_종목폴더통합_검토관리_최신갱신.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-16 17:45:20 | 분류: 갱신문서]
초기화 범위:
- config.json:
 - routine
 - routine_name
 - assigned_routine
 - active_routine
 - routines
 초기화
- state.json:
 - status
 - holding_qty
 - avg_price
 - holding_amount
 - buy_count
 - pending_order
 - review_required
 - review_reason
 - review_status
 - review_location
 - review_routine
 - 각종 검토/재시작/마감/청산 메타
 초기화
- orders.json:
 - orders 빈 목록으로 초기화
- review_required 계열 폴더:
 - archive_candidate로 이동

[출처: 05_운영정책_테스트체크리스트_v2026-06-16_종목폴더통합_검토관리_최신갱신.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-16 17:45:20 | 분류: 갱신문서]
[AC-02] 자동마감 상태에서 매수신호 허용
조건:
- 자동마감 상태.
- 루틴 매수신호 발생.
예상:
- 기존처럼 무조건 매수 차단하지 않는다.
- 최종 매수 여부는 예산/매수한도/주문정책/운영방식 기준.

[출처: 05_운영정책_테스트체크리스트_v2026-06-16_종목폴더통합_검토관리_최신갱신.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-16 17:45:20 | 분류: 갱신문서]
[AC-03] 자동마감 상태에서 매도신호 발생
조건:
- 자동마감 상태.
- 보유 있음.
동작:
- 루틴 매도신호 발생.
예상:
- 매도 수행.
- 이후 종료/감시대기 상태 확인.

[출처: 04_프로젝트현재상태보고서_v2026-06-16_종목폴더통합_검토관리_최신갱신.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-16 17:45:10 | 분류: 갱신문서]
- 조기마감/자동마감은 마감상태 진입.
- 마감상태에서도 루틴 매수신호와 매도신호 수용 가능.
- 매수횟수 제한은 두지 않음.
- 여러 번 매수가 진행되면 관제창에서 표시.
- 조기마감은 운영자 개입, 자동마감은 설정값에 따른 자동 진입.
- 본질은 동일한 마감상태.
5.2 예산/완충

[출처: 마스터스펙\01_MASTER_SPEC_v2.3_2026-06-16_종목폴더통합_검토관리_최신갱신.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-16 17:44:44 | 분류: 갱신문서]
============================================================
16. 수익성 신호등 정책
============================================================

[출처: 마스터스펙\01_MASTER_SPEC_v2.3_2026-06-16_종목폴더통합_검토관리_최신갱신.txt | 기준일: 2026-06-16 | 수정시각: 2026-06-16 17:44:44 | 분류: 갱신문서]
============================================================
17. 종목 추세 신호등 정책
============================================================
추세 신호등은 종목에만 적용한다.
루틴 추세는 계산하지 않는다.

[출처: README_적용내용(4).txt | 기준일: 2026-06-14 | 수정시각: 2026-06-14 12:56:42 | 분류: 기타문서/자료]
2. order_manager.py 보강
- handle_routine_signal_dry_run_for_stock_dir() 추가.
- 루틴 신호 BUY/SELL을 dry-run 주문 실행기까지 연결해 볼 수 있음.
- 실제 주문은 보내지 않음.
- dry-run 접수 성공으로 볼 경우 첫 SELL 이후 close_routine_final_sell_ordered 메타 저장 테스트 가능.

[출처: README_적용내용(3).txt | 기준일: 2026-06-14 | 수정시각: 2026-06-14 12:45:14 | 분류: 기타문서/자료]
역할:
- 루틴이 만든 BUY/SELL 신호를 메인 주문판정 계층에서 받는 연결 지점.
- 실제 키움 주문 실행은 하지 않음.
- 주문 실행기는 order_executor 콜백으로 나중에 연결.
- 조기/자동마감 루틴 방식에서 첫 SELL 신호가 실제 주문 접수된 경우에만 close_routine_final_sell_ordered 메타 저장.
- 주문 미접수/실패 시에는 마지막 매도 메타를 저장하지 않음.

[출처: README_적용내용(2).txt | 기준일: 2026-06-14 | 수정시각: 2026-06-14 12:22:00 | 분류: 기타문서/자료]
주의:
- 첫 매도신호 이후 실제 추가 주문 차단은 order_manager.py의 주문판정 훅이 실제 루틴/주문 실행부와 연결된 뒤 동작한다.
- 이번 수정은 조기마감 적용 시 state 저장값과 buy/sell 허용 메타를 정책에 맞게 보정하는 단계다.

[출처: README_적용내용(1).txt | 기준일: 2026-06-13 | 수정시각: 2026-06-13 15:23:54 | 분류: 기타문서/자료]
적용 목적:
- 조기/자동마감의 루틴 방식은 루틴 1세트 마무리 모드로 본다.
- 매도신호 전까지 매수신호와 매수주문 흐름을 허용한다.
- 매도신호 처리 후에는 내부 플래그로 추가 매수/매도 차단이 가능하게 한다.

[출처: README_적용내용(1).txt | 기준일: 2026-06-13 | 수정시각: 2026-06-13 15:23:54 | 분류: 기타문서/자료]
수정 범위:
1. gui_auto_trade_policy.py
 - 루틴 방식 조기/자동마감 판정 훅 추가
 - 마지막 매도신호 처리 플래그 추가
 - 마지막 매도신호 전 매수 미체결 허용 판정 함수 추가

[출처: README_적용내용(1).txt | 기준일: 2026-06-13 | 수정시각: 2026-06-13 15:23:54 | 분류: 기타문서/자료]
주의:
- 조기/자동마감 옵션 UI는 수정하지 않았다.
- 청산 연동 기능은 수정하지 않았다.
- 실제 루틴/주문 엔진 연결은 아직 없다.
- 이 패치는 향후 주문 엔진에서 매도신호 처리 직후 auto_trade_setting_mark_close_routine_final_sell_triggered()를 호출할 수 있도록 준비하는 단계다.

[출처: README_적용내용.txt | 기준일: 2026-06-13 | 수정시각: 2026-06-13 15:20:30 | 분류: 기타문서/자료]
2. auto_trade_setting_close_routine_signal_allowed()
 - 마지막 매도신호 처리 전까지 매수/매도 신호 허용.
 - 마지막 매도신호 처리 후에는 매수/매도 주문 차단 판정.

[출처: README_적용내용.txt | 기준일: 2026-06-13 | 수정시각: 2026-06-13 15:20:30 | 분류: 기타문서/자료]
3. auto_trade_setting_mark_close_routine_final_sell_triggered()
 - 향후 주문 엔진이 루틴 매도주문을 낸 직후 호출할 함수.
 - close_routine_final_sell_triggered=True 기록.
 - buy_enabled=False, sell_enabled=False 고정.

[출처: README_적용내용.txt | 기준일: 2026-06-13 | 수정시각: 2026-06-13 15:20:30 | 분류: 기타문서/자료]
4. clear_close_routine_final_sell_metadata()
 - 조기/자동마감 메타 정리 시 마지막 매도신호 메타도 함께 제거.

[출처: 선행지수98.6pbr1이하삼성.txt | 기준일: 2026-06-13 | 수정시각: 2026-06-13 09:22:24 | 분류: 기타문서/자료]
선행지수98.6/pbr1이하/삼성
선행지수하락신호/60,120 이평 데드크로스/하락장

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_4.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-15 23:01:24 | 분류: 대화히스토리]
1순위: gui_auto_trade_ats_ops.py
- selected_manual_ats_state
- save_selected_manual_ats_state
- open_selected_manual_ats_settings_dialog
- set_selected_manual_ats_flag
- show_selected_ats_immediate_sell_placeholder

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_4.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-15 23:01:24 | 분류: 대화히스토리]
조기마감
조기마감 진입
↓
신규 진입 허용
↓
매수신호 발생 시 정상 매수
↓
최초 매도신호 발생
↓
매도
↓
종료
즉
다음 매도신호를 끝으로 운영종료
개념.
이게 왜 좋냐면
기존 개념은
조기마감
=
매수차단
이라
종종 애매한 상태가 됩니다.
반면 수정 개념은
조기마감
=
출구예약
입니다.
예를 들어
보유중
이면
다음 매도신호
→ 종료
예를 들어
미보유
이면
매수신호 가능
↓
진입
↓
다음 매도신호
↓
종료
이게 루틴 철학에도 맞습니다.
왜냐하면 우리는 지금까지
루틴이 매수
루틴이 매도
를 존중하는 구조로 만들어왔으니까.
그리고 자동마감도 다시 봐야 합니다.
기존:
특정 시간
↓
추가매수 금지
↓
매도만 수행
수정안:

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_4.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-15 23:01:24 | 분류: 대화히스토리]
자동마감 시간 도달
↓
마감예약 상태
↓
매수신호 발생 가능
↓
다음 매도신호 발생 시 종료
그런데 여기서 문제가 하나 생깁니다.
예를 들어
15:10
자동마감 진입
했는데
15:15
매수신호 발생
그리고
매도신호가
내일까지 안 나옴
이면?
이 경우는
기존에 우리가 확정했던
장마감 전 현재가 청산
시장가 청산
익절 N%
손절 N%
등의 마감 옵션과 충돌합니다.
그래서 지금 생각해보면
조기마감은 수정이 맞는데,
자동마감은 아직 검토가 필요합니다.
왜냐하면 자동마감은 본질적으로
운영 종료 시점 강제성
을 갖고 있기 때문입니다.
오히려 현재 개념은 이렇게 나뉠 수도 있습니다.
조기마감
다음 매도신호까지 운영
자동마감
정해진 시간까지 운영
시간 도달 후
설정된 마감정책 실행
즉 조기마감과 자동마감을 같은 철학으로 보면 안 될 수도 있습니다.

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_4.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-15 23:01:24 | 분류: 대화히스토리]
정책 1
알림만
정책 2
신규매수 전면금지
정책 3
최초 완충도달 원인 종목
↓
자동 조기마감 전환
나는 정책3이 상당히 논리적이라고 봅니다.
예를 들어
A종목
매수
↓
완충진입 발생
이면
시스템이 판단.
A종목이 완충진입의
최초 원인 종목
자동 처리.
A종목
조기마감 전환
그 이후.
A종목
매수신호
허용
매도신호
발생
종료
즉
자금을 가장 최근에 소비한 종목이
가장 먼저 자금을 회수하는 책임을 갖는다.
라는 철학.
상당히 합리적입니다.
그리고 옵션화도 가능.
완충진입 정책
[ ] 알림만
[ ] 신규매수금지
[ ] 최초 도달 종목 조기마감
[ ] 최초 도달 루틴 조기마감
[ ] 운영자 수동판단 대기
여기서 중요한 점.
"조기마감"으로 보내는 것이지
즉시청산
은 아닙니다.
우리가 방금 수정한 개념에 따르면
조기마감
=
출구예약
이니까.
오히려 이 개념으로 가면 자동마감/조기마감/완충복구가 전부 같은 철학으로 묶입니다.
자동마감
↓
조기마감 상태 진입
수동 조기마감
↓
조기마감 상태 진입
완충복구
↓
조기마감 상태 진입
전부 동일.
그리고 하나 더.
이 개념이면 나중에
최초 도달 종목
최근 매수 종목
수익률 최하위 종목
자금 점유율 최대 종목
등으로 복구 대상을 선택하는 정책 확장도 가능합니다.
하지만 현재 기준에서는
최초 완충도달 원인 종목
→ 자동 조기마감
이 가장 단순하고 설명 가능한 정책 같습니다.
이건 자금운영 정책에 추가할 가치가 충분해 보입니다.

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_4.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-15 23:01:24 | 분류: 대화히스토리]
마감예약 상태 = 매수 허용 + 매도신호 발생 시 종료.
매수횟수 제한은 선택 옵션이며 기본은 미사용.
여러 번 매수된 경우 관제창에서 운영자가 바로 알 수 있게 표시.

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_4.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-15 23:01:24 | 분류: 대화히스토리]
이미지의 매수신호의 다음봉 시가를 기준해서 +3의 식을 대입해서 평단을 구하고 매도신호의 다음봉 시가에 일괄 매도했을경우를 추정 분석해줘
이미지 생성됨
•
KOSDAQ MACD 전략 백테스트 분석
KOSDAQ MACD 전략 백테스트 분석
생성된 이미지: KOSDAQ MACD 전략 백테스트 분석
편집
kiwoom_auto (23).zip
ZIP 아카이브

[출처: 마스터스펙\MASTER_SPEC_v2.0_FULL_INTEGRATED_ARCHIVE_2026-06-11.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-11 15:25:42 | 분류: MASTER_SPEC]
1. 매매 기준 선택
2. buy_amount 입력
3. buy_qty 입력
4. buy_signal_bar 입력
5. max_buy_count 입력
6. buy_amount_mode 선택
7. buy_amount_step 입력
8. buy_amount_custom_steps 입력
매도 설정 :

[출처: 마스터스펙\MASTER_SPEC_v2.0_FULL_INTEGRATED_ARCHIVE_2026-06-11.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-11 15:25:42 | 분류: MASTER_SPEC]
1. sell_signal_bar 입력
2. profit_hold_enabled 선택
3. profit_hold_percent 입력
4. resell_condition 선택
5. resell_profit_percent 입력
리스크 설정 :

[출처: 마스터스펙\MASTER_SPEC_v2.0_FULL_INTEGRATED_ARCHIVE_2026-06-11.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-11 15:25:42 | 분류: MASTER_SPEC]
{
 "timeframe": "1m",
 "trade_amount_type": "AMOUNT",
 "buy_amount": 100000,
 "buy_qty": 0,
 "buy_signal_bar": 1,
 "sell_signal_bar": 1,
 "buy_amount_mode": "ADD",
 "buy_amount_step": 1,
 "buy_amount_custom_steps": [],
 "max_buy_count": 3,
 "profit_hold_enabled": false,
 "profit_hold_percent": 0,
 "resell_condition": "NEXT_SELL_SIGNAL",
 "resell_profit_percent": 0,
 "allow_higher_rebuy": false,
 "daily_loss_limit": -3,
 "budget_limit": 1000000,
 "investment_type": "SHORT_TERM",
 "investment_period": 0,
 "start_time": "09:00",
 "end_buy_time": "13:30"
}
허용값 :
timeframe :
1m
3m
5m
10m
15m
custom
trade_amount_type :
AMOUNT
QTY
buy_amount_mode :
ADD
MULTIPLY
FIBONACCI
CUSTOM
resell_condition :
NEXT_SELL_SIGNAL
AVG_PRICE_PROFIT
investment_type :
SHORT_TERM
LONG_TERM
---
## [config.json 검증 규칙]
1. buy_amount 는 0보다 커야 한다.
2. buy_qty 는 0 이상이어야 한다.
3. trade_amount_type 이 AMOUNT 이면 buy_amount 를 사용한다.
4. trade_amount_type 이 QTY 이면 buy_qty 를 사용한다.
5. max_buy_count 는 1 이상이어야 한다.
6. buy_signal_bar 는 1 이상이어야 한다.
7. sell_signal_bar 는 1 이상이어야 한다.
8. daily_loss_limit 은 0 이하 값이어야 한다.
9. start_time 은 end_buy_time 보다 빨라야 한다.
10. timeframe 은 허용값만 사용할 수 있다.
11. budget_limit 은 0보다 커야 한다.

[출처: 마스터스펙\MASTER_SPEC_v2.0_FULL_INTEGRATED_ARCHIVE_2026-06-11.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-11 15:25:42 | 분류: MASTER_SPEC]
12. buy_amount_mode 가 CUSTOM 이면 buy_amount_custom_steps 는 비어 있으면 안 된다.

[출처: 마스터스펙\MASTER_SPEC_v2.0_FULL_INTEGRATED_ARCHIVE_2026-06-11.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-11 15:25:42 | 분류: MASTER_SPEC]
13. profit_hold_enabled 가 true 이면 profit_hold_percent 는 0 이상이어야 한다.

[출처: 마스터스펙\MASTER_SPEC_v2.0_FULL_INTEGRATED_ARCHIVE_2026-06-11.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-11 15:25:42 | 분류: MASTER_SPEC]
{
 "status": "STOPPED",
 "trade_set_status": "WAIT_BUY",
 "current_set_no": 1,
 "current_round": 0,
 "avg_price": 0,
 "holding_qty": 0,
 "holding_amount": 0,
 "buy_count": 0,
 "last_buy_price": 0,
 "last_buy_time": "",
 "last_sell_time": "",
 "allocated_budget": 0,
 "used_budget": 0,
 "last_signal_candle_time": "",
 "last_order_candle_time": "",
 "pending_order": false,
 "ignore_sell_until_next_buy": true,
 "updated_at": ""
}
status 허용값 :
STOPPED
RUNNING
PAUSED
EMERGENCY_STOPPED
trade_set_status 허용값 :
WAIT_BUY
BUY_ACTIVE
WAIT_SELL
SELL_DONE
규칙 :
1. 프로그램 시작 시 state.json 을 읽는다.
2. 키움 계좌 조회 결과를 우선 적용한다.
3. state.json 은 보조 복구 데이터로 사용한다.
4. 실제 계좌 정보와 state.json 이 불일치하면 실제 계좌 정보를 우선한다.
5. 불일치 내역은 system_error.log 에 기록한다.
6. 불일치 발생 시 GUI 상태표시 영역에 경고를 표시한다.
---
## [orders.json]
역할 :
종목별, 루틴별 주문 상태 저장
기본 구조 :
{
 "orders": []
}
주문 항목 구조 :

[출처: 마스터스펙\MASTER_SPEC_v2.0_FULL_INTEGRATED_ARCHIVE_2026-06-11.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-11 15:25:42 | 분류: MASTER_SPEC]
4. config.json 의 allow_higher_rebuy 값이 true 인 경우에만 예외적으로 허용한다.
5. allow_higher_rebuy 기본값은 false 이다.
6. 추가매수 차단 내역은 로그에 기록한다.
---
## [매매 세트 상태 정책]
상태값 :
WAIT_BUY
BUY_ACTIVE
WAIT_SELL
SELL_DONE
흐름 :
WAIT_BUY → BUY_ACTIVE → WAIT_SELL → SELL_DONE → WAIT_BUY
규칙 :
1. 보유수량이 없는 상태에서는 매도신호를 무시한다.
2. 매도 완료 후 다음 매수신호가 나오기 전까지 매도신호를 무시한다.
3. 매수 발생 시 새로운 매매 세트를 시작한다.
4. 매도 발생 시 현재 매매 세트를 종료한다.
5. 현재 매매 세트 번호는 state.json 의 current_set_no 에 기록한다.

[출처: 마스터스펙\MASTER_SPEC_v2.0_FULL_INTEGRATED_ARCHIVE_2026-06-11.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-11 15:25:42 | 분류: MASTER_SPEC]
6. 매도신호 무시 상태는 state.json 의 ignore_sell_until_next_buy 에 기록한다.
7. 매매 세트 상태는 자동매매설정 창에 표시한다.
---
## [매수 회차]
최대 매수 회차는 사용자 설정값 max_buy_count 를 사용한다.
예)
1회
3회
5회
10회
설정 가능.
매수 회차 증가 방식은 buy_amount_mode 를 따른다.
ADD :
기준 금액 또는 수량에 지정값을 더한다.
MULTIPLY :
기준 금액 또는 수량에 지정 배수를 곱한다.
FIBONACCI :
피보나치 수열 기준으로 증가한다.
CUSTOM :
buy_amount_custom_steps 에 입력된 사용자 지정값을 사용한다.
CUSTOM 규칙 :
1. 입력값은 증가 연산자와 숫자 목록으로 구성한다.
2. 예: +1,2,5,8,9
3. 설정된 증가값 개수가 max_buy_count 보다 적으면 마지막 값을 반복 적용한다.
4. 설정된 증가값 개수가 max_buy_count 보다 많으면 max_buy_count 까지만 적용한다.
---
## [매도 홀딩 정책]
profit_hold_enabled 가 true 인 경우 적용한다.
규칙 :
1. 매도 신호 발생 시 예상 매도 손익을 계산한다.

[출처: 마스터스펙\MASTER_SPEC_v2.0_FULL_INTEGRATED_ARCHIVE_2026-06-11.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-11 15:25:42 | 분류: MASTER_SPEC]
2. 매수 평단에서 거래세 및 매도 비용을 제외하고 profit_hold_percent 이하이면 매도하지 않는다.
3. 매도하지 않은 경우 HOLD 상태로 기록한다.
4. 이후 재매도 조건은 resell_condition 을 따른다.
resell_condition :
NEXT_SELL_SIGNAL :
다음 매도 신호에서 다시 매도 판단한다.
AVG_PRICE_PROFIT :
평단 대비 resell_profit_percent 이상 상승 시 매도한다.
---
## [거래 가능 시간]
신규 매수 가능 :
09:00 ~ 13:30
신규 매도 가능 :
09:00 ~ 장 종료
GUI 표시 :
메인 윈도우에 현재 매수 가능 여부를 표시한다.
---
## [13:30 이후]
신규 매수 금지
신규 매수 신호 무시
기존 보유 종목 관리만 수행
매도는 허용
GUI 표시 :
13:30 이후에는 메인 윈도우에 "신규 매수 금지 시간"을 표시한다.
---
## [장기투자 모드]
별도 설정 가능
예)
7일
30일
90일
180일
사용자 지정
investment_type 이 LONG_TERM 인 경우 investment_period 를 사용한다.
---
## [부분체결 정책]
부분체결 발생 시 미체결 수량 자동 취소.
체결 수량만 관리.
예)
10주 주문
4주 체결
6주 미체결
↓
6주 자동 취소
↓
4주만 관리
규칙 :
1. 부분체결 발생 시 orders.json 의 status 를 PARTIAL_FILLED 로 변경한다.
2. 미체결 수량 취소 요청 시 CANCEL_REQUESTED 로 변경한다.
3. 취소 완료 시 CANCELLED 로 변경한다.
4. 체결 수량만 state.json 에 반영한다.
5. 미체결 취소 실패 시 system_error.log 에 기록한다.
6. 미체결 취소 실패 시 GUI 알림을 출력한다.
---
## [매수 실패]
예수금 부족
주문 거부
API 오류
일 손실 제한 도달
예산 부족
config 검증 실패
중복 주문 차단
등 발생 시 GUI 알림 출력.
사용자 판단에 따른다.
모든 실패 내역은 로그에 기록한다.
---
## [다중 루틴 정책]
동일 종목 다중 루틴 등록 허용.
예)
삼성전자
MACD
RSI
동시 운영 가능.
루틴별 보유수량 독립 관리.
루틴별 설정 독립 관리.
루틴별 주문 독립 관리.
루틴별 로그 독립 관리.
GUI에서는 동일 종목이라도 루틴별로 별도 행으로 표시한다.
---
## [매도 정책]
예)
삼성전자
MACD 보유 100주
RSI 보유 50주
MACD 매도신호 발생 시
100주만 매도
RSI 50주는 유지
규칙 :
1. 매도 주문은 해당 루틴의 보유수량만 대상으로 한다.
2. 다른 루틴의 보유수량은 매도하지 않는다.
3. 실제 계좌 보유수량과 루틴별 state.json 이 불일치할 경우 실제 계좌 정보를 우선한다.
4. 불일치 내역은 system_error.log 에 기록한다.
5. GUI에서는 불일치 상태를 경고로 표시한다.
---
## [상태 복구]
프로그램 시작 시 수행 순서 :
1. state.json 읽기
2. orders.json 읽기
3. budget.json 읽기
4. 키움 계좌 조회
5. 실제 계좌 정보와 state.json 비교
6. 실제 계좌 정보 우선 적용
7. 불일치 내역 기록
8. 복구 결과 GUI 출력
규칙 :
state.json 은 보조 데이터로 사용한다.
실제 계좌 정보가 우선이다.
orders.json 에 pending 주문이 남아 있으면 미체결 주문 조회 후 동기화한다.
복구 결과는 메인 윈도우 상태 영역에 표시한다.
---
## [긴급 정지]
긴급 정지 시 수행 내용 :
1. 신규 매수 중지
2. 실시간 감시 정지
3. 상태 저장
4. 보유 종목 유지
5. 미체결 주문 조회
6. 미체결 주문 취소 여부 사용자 확인
7. 긴급 정지 로그 기록
8. state.json status 를 EMERGENCY_STOPPED 로 변경
주의 :
긴급 정지는 보유 종목을 자동 매도하지 않는다.
GUI 규칙 :
1. 긴급 정지 버튼은 메인 윈도우에 항상 표시한다.
2. 긴급 정지 실행 전 확인창을 표시한다.
3. 긴급 정지 완료 후 전체 상태를 새로고침한다.
---
## [종목 삭제]
보유 종목 존재 시 경고 메시지 출력.
사용자 확인 후 삭제 가능.
삭제 순서 :
1. 기초종목.txt 확인
2. 해당 종목의 루틴 등록 여부 확인
3. state.json 보유수량 확인
4. 실제 계좌 보유수량 확인
5. 보유수량 존재 시 경고창 출력
6. 사용자 확인
7. 기초종목.txt 루틴 정보 수정
8. 루틴 폴더 내 종목 폴더 삭제 또는 격리
9. PROJECT_CHANGELOG.txt 기록
주의 :
로그 파일은 원칙적으로 삭제하지 않는다.
삭제 대상 종목 폴더는 즉시 삭제보다 격리를 우선한다.
---
## [로그 정책]
일별 로그 생성.
예)
20260531.log
20260601.log
기록 내용 :
매수
매도
주문요청
주문접수
체결
부분체결
미체결취소
손익
예외
오류
복구
상태변경
중복주문차단
예산부족
일손실제한
GUI 조작 기록
로그 영구 보관.
로그 파일은 삭제하지 않는다.
---
## [PROJECT_CHANGELOG.txt 기록 정책]
모든 변경사항은 PROJECT_CHANGELOG.txt 에 기록한다.
기록 형식 :

[출처: 마스터스펙\MASTER_SPEC_v2.0_FULL_INTEGRATED_ARCHIVE_2026-06-11.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-11 15:25:42 | 분류: MASTER_SPEC]
- 매수신호 폐기
- 매도신호는 메인엔진 판정 후 실행 가능
- 기본 매도 판단은 루틴의 매도정책을 따른다
- +N% 익절, -N% 손절 등 루틴 기반 매도조건 허용
진입 예:
- 시간운영 종료
- 종료 후 정책이 감시/매도인 경우
이탈:

[출처: 마스터스펙\MASTER_SPEC_v2.0_FULL_INTEGRATED_ARCHIVE_2026-06-11.txt | 기준일: 2026-06-11 | 수정시각: 2026-06-11 15:25:42 | 분류: MASTER_SPEC]
- 매수신호 생성
- 매도신호 생성
- 보유 또는 무신호 판단
- +N% 익절 조건 판단
- -N% 손절 조건 판단
- MACD 등 기술적 신호 판단
- 조기마감 시 시간조건 제거 후 즉시 평가
루틴은 주문을 직접 실행하지 않는다.
루틴은 시간판정, 긴급정지, 장마감 정책, 검토종목 정책을 직접 처리하지 않는다.
---
## 6.2 메인엔진 역할
메인엔진은 통합 통제기이다.
담당:

[출처: 마스터스펙\작업진행상황대화히스토리\작업진행상황대화히스토리_3.txt | 기준일: 2026-06-09 | 수정시각: 2026-06-11 15:30:36 | 분류: 대화히스토리]
start_time = normalized_hhmmss_or_empty(...)
end_buy_time = normalized_hhmmss_or_empty(...)
그런데 상단 import에는:

[출처: 중요문서1\상태전이표_최종확정본_v5.md | 기준일: 2026-06-05 | 수정시각: 2026-06-05 13:57:40 | 분류: 기타문서/자료]
- 매수신호 폐기
- 매도신호는 메인엔진 판정 후 실행 가능
- +N% 익절, -N% 손절 등 루틴 매도조건 허용
이탈:

[출처: 중요문서1\구조개선_설계의사결정기록_ADR_v1 .md | 기준일: 2026-06-05 | 수정시각: 2026-06-05 12:02:06 | 분류: 기타문서/자료]
--------------------------------------------------
ADR-012
매수 타이밍 유실
--------------------------------------------------
결론
신호 만료 가능
추후 루틴 설계 단계에서 재검토

14. 조건식/연산자 정책
==================
[출처: 마스터스펙\MASTER_SPEC_최신정리본_2026-07-03.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:40:50 | 분류: MASTER_SPEC]
최신본으로 참조할 파일:
- 00_MASTER_SPEC_merged_INDEX.txt
- 99_deduplication_report.txt
- merged_by_index/00_Final_Index_Reference_Map_merged.txt
- merged_by_index/01_Order_Pipeline_merged.txt
- merged_by_index/02_Runtime_Data_Model_merged.txt
- merged_by_index/03_Architecture_merged.txt
- merged_by_index/04_Implementation_Test_Verification_merged.txt
- merged_by_index/05_Operations_Policy_Governance_merged.txt
- merged_by_index/06_Glossary_merged.txt
- merged_by_index/90_Misc_merged.txt

[출처: 마스터스펙\MASTER_SPEC_최신정리본_2026-07-03.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:40:50 | 분류: MASTER_SPEC]
SendOrder 검토 전 필수 조건:
- hoga 확정
- order_type 확정
- order_intent.unresolved=false 확정
- execution_enabled=true 전환 정책 확정
- operator_confirmed=true 정책 확정
- Final Execution Guard 확정
- Order Lock 확인
- Request Hash 중복 방지 확정
- ORDER_QUEUED 생성 주체 확정
- Kiwoom Boundary/Executor 단일 진입점 확정

[출처: 마스터스펙\MASTER_SPEC_최신정리본_2026-07-03.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:40:50 | 분류: MASTER_SPEC]
현재/기존 Runtime 파일:
- runtime/routine_signals.json
- runtime/order_queue.json
- runtime/real_trade_guard.json
- candles.json
- latest_price.json

[출처: 마스터스펙\MASTER_SPEC_최신정리본_2026-07-03.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:40:50 | 분류: MASTER_SPEC]
향후 후보 Runtime 파일:
- runtime/order_locks.json
- runtime/order_executions.json
- runtime/fills.json
- runtime/positions.json
- runtime/review_items.json
- runtime/audit_log.jsonl
- runtime/close_history.json
- runtime/order_execution_log.json

[출처: 마스터스펙\MASTER_SPEC_최신정리본_2026-07-03.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:40:50 | 분류: MASTER_SPEC]
1. 주문 후보 단계
- order_candidate 생성
- order_intent 생성
- order_provenance 생성
- execution_enabled 기본값 false 확인

[출처: 마스터스펙\MASTER_SPEC_최신정리본_2026-07-03.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:40:50 | 분류: MASTER_SPEC]
5. Adapter Preview
- Preview 생성
- queue 변경 없음
- SendOrder 호출 없음

[출처: 마스터스펙\MASTER_SPEC_최신정리본_2026-07-03.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:40:50 | 분류: MASTER_SPEC]
6. Execution 준비
- hoga 확정
- order_type 확정
- order_intent.unresolved=false
- execution_enabled=true 정책
- operator_confirmed=true 정책

[출처: 마스터스펙\MASTER_SPEC_최신정리본_2026-07-03.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:40:50 | 분류: MASTER_SPEC]
7. Final Guard
- Final Execution Guard
- Lock 확인
- Request Hash 생성
- ORDER_QUEUED 생성

[출처: 마스터스펙\MASTER_SPEC_최신정리본_2026-07-03.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:40:50 | 분류: MASTER_SPEC]
10. 운영 계층
- Review Management
- Recovery
- Close History
- Runtime 검증

[출처: 마스터스펙\MASTER_SPEC_최신정리본_2026-07-03.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:40:50 | 분류: MASTER_SPEC]
MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED/99_deduplication_report.txt

[출처: 마스터스펙\MASTER_SPEC_최신정리본_2026-07-03.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:40:50 | 분류: MASTER_SPEC]
새 구현 작업을 시작할 때:
1. 00_MASTER_SPEC_merged_INDEX.txt를 먼저 확인한다.
2. 작업 영역에 해당하는 merged_by_index 문서를 확인한다.
3. 01_Order_Pipeline_merged.txt의 금지선에 걸리는지 확인한다.
4. 03_Architecture_merged.txt의 계층/호출 방향을 확인한다.
5. 02_Runtime_Data_Model_merged.txt의 Runtime 수정 주체를 확인한다.
6. 04_Implementation_Test_Verification_merged.txt의 체크리스트와 테스트 기준을 확인한다.
7. 작업 완료 후 이 정리본 또는 후속 최신정리본을 갱신한다.
최신 정본 판정 문구:

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\99_deduplication_report.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
MASTER_SPEC deduplication report
Generated: 2026-07-03 15:22:26

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\99_deduplication_report.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
Summary
==================================================
- Source TXT documents: 76
- Exact duplicate files: 0
- Duplicate blocks removed: 16

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\99_deduplication_report.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
Exact duplicate files
==================================================
- None

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\99_deduplication_report.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
Removed duplicate blocks
==================================================
- [01_Order_Pipeline] MASTER_SPEC_추가갱신_order_intent_미확정진단필드_2026-07-03.txt => MASTER_SPEC_추가갱신_Execution_Request_order_executions_설계_2026-07-03.txt
 Preview: ================================================== 1. 배경 ==================================================
- [01_Order_Pipeline] MASTER_SPEC_추가갱신_order_intent_미확정진단필드_2026-07-03.txt => MASTER_SPEC_추가갱신_Execution_Request_order_executions_설계_2026-07-03.txt
 Preview: ================================================== 14. 최종 결론 ==================================================
- [01_Order_Pipeline] MASTER_SPEC_추가갱신_order_provenance_주문생성이력_2026-07-03.txt => MASTER_SPEC_추가갱신_Execution_Request_order_executions_설계_2026-07-03.txt
 Preview: ================================================== 1. 배경 ==================================================
- [01_Order_Pipeline] MASTER_SPEC_추가갱신_order_provenance_주문생성이력_2026-07-03.txt => MASTER_SPEC_추가갱신_order_intent_미확정진단필드_2026-07-03.txt
 Preview: 현재 단계에서는 unresolved=false를 만들지 않는다.
- [01_Order_Pipeline] MASTER_SPEC_추가갱신_실주문실행책임_ORDER_QUEUED_주문생명주기_2026-07-03.txt => MASTER_SPEC_추가갱신_order_provenance_주문생성이력_2026-07-03.txt
 Preview: PENDING ↓ Approval Engine APPROVED / BLOCKED ↓ Operation Policy Gate 단건 EXECUTABLE / BLOCKED_POLICY ↓ Real Preflight 단건 
- [01_Order_Pipeline] MASTER_SPEC_추가갱신_실주문실행책임_ORDER_QUEUED_주문생명주기_2026-07-03.txt => MASTER_SPEC_추가갱신_ADAPTER_READY_미사용정책_2026-07-03.txt
 Preview: 현재 단계에서 금지:
- [02_Runtime_Data_Model] MASTER_SPEC_추가갱신_Runtime_Data_Model_Entity_Relationship_2026-07-03.txt => MASTER_SPEC_추가갱신_Runtime_Data_Model_Entity_Relationship_2026-07-03.txt
 Preview: 현재 상태: - 아직 미구현.
- [02_Runtime_Data_Model] MASTER_SPEC_추가갱신_프로젝트_모듈카탈로그_Module_Catalog_2026-07-03.txt => MASTER_SPEC_추가갱신_프로젝트_모듈카탈로그_Module_Catalog_2026-07-03.txt
 Preview: 입력 - Controller
- [03_Architecture] MASTER_SPEC_추가갱신_Controller_Layer_호출책임_2026-07-03.txt => MASTER_SPEC_추가갱신_Controller_Layer_호출책임_2026-07-03.txt
 Preview: 현재 상태: - 설계만 존재. - 구현 금지.
- [03_Architecture] MASTER_SPEC_추가갱신_Controller_Layer_호출책임_2026-07-03.txt => MASTER_SPEC_추가갱신_Controller_Layer_호출책임_2026-07-03.txt
 Preview: 현재 상태: - 설계만 존재. - 구현 금지.
- [03_Architecture] MASTER_SPEC_추가갱신_Controller_Layer_호출책임_2026-07-03.txt => MASTER_SPEC_추가갱신_Controller_Layer_호출책임_2026-07-03.txt
 Preview: 현재 상태: - 설계만 존재. - 구현 금지.
- [04_Implementation_Test_Verification] MASTER_SPEC_추가갱신_프로젝트_구현추적표_Implementation_Trace_Register_2026-07-03.txt => MASTER_SPEC_추가갱신_프로젝트_검증매트릭스_Verification_Matrix_2026-07-03.txt
 Preview: ================================================== 최종 원칙 ==================================================
- [05_Operations_Policy_Governance] MASTER_SPEC_추가갱신_프로젝트_종합평가기준_Project_Governance_Framework_2026-07-03.txt => MASTER_SPEC_추가갱신_프로젝트_완성도평가_Completion_Assessment_2026-07-03.txt
 Preview: ================================================== 최종 결론 ==================================================
- [90_Misc] MASTER_SPEC_추가갱신_전체아키텍처_로드맵_2026-07-03.txt => MASTER_SPEC_추가갱신_실구현_우선순위_착수계획_2026-07-03.txt
 Preview: ================================================== 2. 구현 우선순위 ==================================================
- [90_Misc] MASTER_SPEC_추가갱신_프로젝트_추적성매트릭스_Traceability_Matrix_2026-07-03.txt => MASTER_SPEC_추가갱신_구현단계별_완료기준_Definition_of_Done_2026-07-03.txt
 Preview: 최종 원칙
- [90_Misc] 고정역할정의_ChatGPT_Codex_협업기준_v2026-07-03.txt => 고정역할정의_ChatGPT_Codex_협업기준_v2026-07-03.txt
 Preview: 주요 역할

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\00_MASTER_SPEC_merged_INDEX.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
Merged outputs
==================================================
- 00_Final_Index_Reference_Map: merged_by_index/00_Final_Index_Reference_Map_merged.txt
 Source documents: 3, unique blocks: 42, duplicates removed: 0
- 01_Order_Pipeline: merged_by_index/01_Order_Pipeline_merged.txt
 Source documents: 16, unique blocks: 642, duplicates removed: 6
- 02_Runtime_Data_Model: merged_by_index/02_Runtime_Data_Model_merged.txt
 Source documents: 9, unique blocks: 318, duplicates removed: 2
- 03_Architecture: merged_by_index/03_Architecture_merged.txt
 Source documents: 7, unique blocks: 251, duplicates removed: 3
- 04_Implementation_Test_Verification: merged_by_index/04_Implementation_Test_Verification_merged.txt
 Source documents: 16, unique blocks: 211, duplicates removed: 1
- 05_Operations_Policy_Governance: merged_by_index/05_Operations_Policy_Governance_merged.txt
 Source documents: 14, unique blocks: 185, duplicates removed: 1
- 06_Glossary: merged_by_index/06_Glossary_merged.txt
 Source documents: 2, unique blocks: 45, duplicates removed: 0
- 90_Misc: merged_by_index/90_Misc_merged.txt
 Source documents: 9, unique blocks: 168, duplicates removed: 3

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\90_Misc_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
candles.json → routine_signal_probe → routine_signals.json(PENDING)
Consumer

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\90_Misc_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
PENDING → OrderManager(dry-run) → Payload Preview →
BLOCKED/PREVIEWED/ERROR

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\90_Misc_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
기본 정책: - execution_enabled=False - SendOrder 금지 - order_queue.json
생성 금지
Timer

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\90_Misc_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
반영 우선순위 C (구현 기준)
==================================================
- Implementation Standards
- Readiness Checklist
- Implementation Gates
- Verification Matrix
- Definition of Done
- Evidence Package

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\90_Misc_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
반영 우선순위 D (관리 문서)
==================================================
- RACI Matrix
- Reference Priority Guide
- Integrated Reference Map
- Document Architecture
- Domain Glossary
- Traceability Matrix

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\90_Misc_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
1. 기록 대상
- Signal 생성
- Order Candidate 생성
- Approval 결과
- Operation Policy 결과
- Real Preflight 결과
- Adapter Preview 생성
- ORDER_QUEUED 생성(향후)
- Execution Request 생성(향후)
- SendOrder 호출(향후)
- 주문접수/체결/취소/정정 이벤트(향후)
- Recovery 처리
- 검토관리 이동

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\90_Misc_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
3. 권장 항목
- log_id
- timestamp
- actor
- entity_type
- entity_id
- action
- from_status
- to_status
- reason
- details
- routine
- code
- source_signal_id
- order_id
- execution_id(향후)
- request_hash(향후)
- kiwoom_order_no(향후)

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\90_Misc_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
4. Actor 예시
- RoutineEngine
- OrderCandidateEngine
- ApprovalEngine
- OperationPolicyGate
- RealPreflight
- AdapterPreview
- ExecutionController
- KiwoomOrderExecutor
- FillEventController
- RecoveryController
- Operator

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\90_Misc_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
5. Runtime 후보
- runtime/audit_log.jsonl
또는
- logs/order_pipeline.log
JSON Lines 형식을 권장한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\90_Misc_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
9. 향후 연계
- Runtime Entity Model
- Execution Request
- Request Hash
- Order Lock
- Review Management

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\90_Misc_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
2. Candidate 단계
==================================================

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\90_Misc_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
완료 조건
□ Order Candidate 생성
□ order_intent 생성
□ order_provenance 생성
□ execution_enabled=false 유지
□ 기존 Approval 테스트 통과

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\90_Misc_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
완료 조건
□ REAL_READY/BLOCKED_REAL 전이
□ Guard 검증
□ 자동 Guard 생성 없음
□ SendOrder 미연결

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\90_Misc_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
6. Adapter Preview
==================================================
완료 조건
□ Preview 생성
□ Queue 변경 없음
□ SendOrder/Stub 미호출

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\90_Misc_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
완료 조건
□ Final Guard 통과
□ Lock 확인
□ Request Hash 생성
□ ORDER_QUEUED 생성
□ SendOrder는 별도 검증

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\90_Misc_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
완료
- Signal → Order Candidate
- Approval
- Operation Policy
- Real Preflight
- Adapter Request Preview
- order_intent
- order_provenance

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\90_Misc_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
미구현
- ExecutionController
- Order Lock
- Request Hash
- ORDER_QUEUED
- SendOrder
- Fill
- Position Runtime
- Recovery Runtime

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\90_Misc_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
Priority 1
- hoga / order_type 매핑 규칙 확정
- order_intent resolved 조건 확정

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\90_Misc_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
Priority 7
- Recovery Runtime
- Review Runtime
- Audit Runtime

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\90_Misc_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
[주문 파이프라인]
- Order Lifecycle
- Order State Machine
- order_intent
- order_provenance

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\90_Misc_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
1단계 (실행 준비)
- hoga/order_type Mapper
- order_intent resolved 규칙
- ExecutionController 인터페이스

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\90_Misc_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
2단계 (실행 보호)
- order_lock_manager
- request_hash 생성
- Final Execution Guard 구현

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\90_Misc_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
3. 구현 선행조건
==================================================
SendOrder 구현 전 반드시 완료되어야 하는 항목

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\90_Misc_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
1. 아키텍처 핵심 문서
==================================================
01. Order Lifecycle
02. Order State Machine
03. Controller Layer
04. Architecture Dependency Map
05. Runtime Data Model
06. Runtime File Specification
07. Kiwoom Boundary

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\90_Misc_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
2. 주문 파이프라인
==================================================
08. Order Candidate
09. Approval
10. Operation Policy
11. Real Preflight
12. Adapter Request Preview
13. Final Execution Guard
14. Execution Request
15. Order Lock
16. Request Hash

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\90_Misc_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
6. 구현 순서
==================================================
1) Runtime 규격 확인
2) Mapper(hoga/order_type)
3) ExecutionController
4) Final Execution Guard
5) Order Lock
6) Request Hash
7) Execution Request
8) Kiwoom Boundary 연결
9) Fill
10) Position
11) Recovery
12) Review
13) Audit

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\90_Misc_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
7. 현재 구현 금지
==================================================
- SendOrder 연결
- ORDER_SENT 구현
- Chejan 자동 연결
- Position Runtime 구현
- Runtime 신규 파일 생성
- execution_enabled 자동 true
- operator_confirmed 자동 true

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\90_Misc_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
================================================== 2. Codex의 고정 역할
==================================================
Codex는 구현 담당(Implementation Worker)이다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\06_Glossary_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
2. Order Candidate
==================================================
Signal로부터 생성된 주문 후보.
실주문 대상이 아니다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\06_Glossary_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
8. Final Execution Guard
==================================================
ORDER_QUEUED 생성 직전 마지막 안전 검증.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\06_Glossary_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
주문 파이프라인
==================================================
Signal
- 루틴이 생성한 매매 판단.
Order Candidate
- 주문 가능성을 계산한 후보.
Approval
- 주문 후보 승인 단계.
Policy
- 운영 정책 검증 단계.
Preflight
- 실주문 직전 최종 검증.
Preview
- 실제 주문 없이 요청을 생성하는 검증 단계.
Execution
- 실제 주문 요청 수행.
Fill
- 체결 결과.
Position
- 체결 결과로 유지되는 보유 상태.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\05_Operations_Policy_Governance_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
주요 산출물
- ExecutionController
- Final Execution Guard
- Order Lock
- Request Hash

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\05_Operations_Policy_Governance_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
B. 구현
- Candidate
- Approval
- Policy
- Preflight
- Adapter Preview

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\05_Operations_Policy_Governance_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
D. 실주문 준비
- ExecutionController
- Final Execution Guard
- Order Lock
- Request Hash
- Execution Request

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\05_Operations_Policy_Governance_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
1. ExecutionController
2. Final Execution Guard
3. Hoga / OrderType Mapper
4. Order Lock
5. Request Hash
6. Execution Request
위 항목이 완료되면 실주문 계층 구현을 시작할 준비가 된다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\05_Operations_Policy_Governance_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
[실주문 위험]
- 원인: 잘못된 SendOrder 연결
- 대응:
 - Preview 우선
 - Final Execution Guard
 - execution_enabled 기본 false
 - operator_confirmed 기본 false

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\05_Operations_Policy_Governance_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
1단계 : 기반 아키텍처 (완료 수준)
==================================================
완료
- Signal Pipeline
- Order Pipeline
- Approval
- Policy
- Preflight
- Adapter Preview
- Runtime 기본 구조
- State Machine
- Controller 역할 정의
- Architecture 문서화

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\05_Operations_Policy_Governance_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
2단계 : 실주문 준비
==================================================
구현 대상
- hoga / order_type Mapper
- ExecutionController
- Final Execution Guard
- Order Lock
- Request Hash
- Execution Request
완료 조건
- Preview와 실제 요청 일치 검증
- 실주문 미연결 유지

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\05_Operations_Policy_Governance_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
4단계 : 체결 및 보유
==================================================
구현 대상
- Chejan 수신
- Fill Runtime
- Position Runtime
- Close History
완료 조건
- Fill 기반 Position 관리
- 청산 이력 관리

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\05_Operations_Policy_Governance_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
구현
- Implementation Standards
- Readiness Checklist
- Implementation Gates
- Deliverables Map

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\05_Operations_Policy_Governance_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
4. 운영 완료
==================================================
□ Review
□ Recovery
□ Audit
□ Monitoring
□ 운영 정책 적용

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
1. 주문 후보 단계
==================================================
[ ] order_candidate 생성
[ ] order_intent 생성
[ ] order_provenance 생성
[ ] execution_enabled 기본값 false 확인

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
5. Adapter Preview
==================================================
[ ] Preview 생성
[ ] queue 변경 없음
[ ] SendOrder 호출 없음

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
6. Execution 준비
==================================================
[ ] hoga 확정
[ ] order_type 확정
[ ] order_intent.unresolved=false
[ ] execution_enabled=true 정책
[ ] operator_confirmed=true 정책

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
7. Final Guard
==================================================
[ ] Final Execution Guard
[ ] Lock 확인
[ ] Request Hash 생성
[ ] ORDER_QUEUED 생성

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
10. 운영 계층
==================================================
[ ] Review Management
[ ] Recovery
[ ] Close History
[ ] Runtime 검증

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
SOURCE: MASTER_SPEC_추가갱신_코딩규약_Implementation_Standards_2026-07-03.txt
==================================================
MASTER_SPEC_추가갱신_코딩규약_Implementation_Standards_2026-07-03

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
4. 테스트 규칙
==================================================
- 신규 기능마다 단위 테스트 추가.
- 회귀 테스트 필수.
- TemporaryDirectory 기반 테스트 우선.
- 운영 Runtime 사용 금지.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
Level 4 : 운영 검증(Pre-Production)
- Preview만 수행
- SendOrder 금지
- 실계좌 변경 금지

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
2. 단계별 테스트
Candidate
□ order_candidate 생성
□ order_intent
□ order_provenance
Approval
□ APPROVED
□ BLOCKED
Policy
□ EXECUTABLE
□ BLOCKED_POLICY
Preflight
□ REAL_READY
□ BLOCKED_REAL
Adapter Preview
□ Preview 생성
□ Queue 변경 없음

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
[주문 파이프라인]
□ Candidate
□ Approval
□ Policy
□ Preflight
□ Adapter Preview

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
[실주문 준비]
□ ExecutionController
□ Final Execution Guard
□ Order Lock
□ Request Hash
□ Execution Request
[운영]
□ Review
□ Recovery
□ Audit
□ Runtime 무결성

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
1. 실주문
- SendOrder 직접 호출 금지
- GUI/Timer에서 SendOrder 호출 금지
- Preview 단계에서 실주문 연결 금지

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
4. 데이터
- ID 재사용 금지
- source_signal_id 변경 금지
- Fill 없이 Position 변경 금지
- SendOrder 성공만으로 Position 변경 금지

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
P0 (완료)
==================================================
- Signal Pipeline
- Order Candidate
- Approval
- Operation Policy
- Real Preflight
- Adapter Request Preview
- Runtime 기본 규격
- State Machine
- Architecture 문서화

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
P1 (최우선)
==================================================
- Hoga Mapper
- OrderType Mapper
- ExecutionController
- Final Execution Guard
- Order Lock
- Request Hash
- Execution Request
완료 기준
- Preview와 Request 일치
- SendOrder 미연결 유지
- 회귀 테스트 통과

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
P3
==================================================
- Chejan Event
- Fill Runtime
- Position Runtime
- Close History

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
3. 테스트 준비
==================================================
□ 단위 테스트 계획
□ 회귀 테스트 대상 선정
□ Temporary Runtime 사용
□ 운영 Runtime 미사용

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
기록 단위
==================================================
각 구현 항목은 하나의 Trace Record를 가진다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
Trace Record 예시
==================================================

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
Implementation ID : IMP-0001
기능 : Real Preflight
MASTER_SPEC : Runtime Specification
ADR : ADR-003
Runtime : order_queue.json
Unit Test : test_real_order_preflight.py
Regression : PASS
Status : VERIFIED

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
모든 구현은 하나의 Trace Record로 관리하며,
설계·구현·검증·문서를 하나의 식별자로 추적할 수 있어야 한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
M1. 기반 구조 수립 (완료)
==================================================
완료 항목
- 주문 파이프라인 기본 구조
- Signal → Order Candidate
- Approval
- Operation Policy
- Real Preflight
- Adapter Request Preview
산출물
- 기본 Runtime 구조
- 핵심 테스트

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
5. 실주문 인증
==================================================
□ Final Execution Guard 검증
□ ExecutionController 검증
□ Order Lock 검증
□ Request Hash 검증
□ Kiwoom Boundary 검증
□ 단일 SendOrder 진입점 확인

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
5. 실주문 준비
==================================================
□ Final Execution Guard
□ ExecutionController
□ Order Lock
□ Request Hash
□ Execution Request
□ Kiwoom Boundary 검증

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
6. 운영 준비도 판정
==================================================
READY
- 모든 핵심 항목 충족
CONDITIONALLY_READY
- 일부 미구현이 있으나 운영 영향 없음
NOT_READY
- 실주문 안전성 또는 Runtime 무결성 미확보

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
3. 주문 파이프라인
==================================================
□ Signal
□ Order Candidate
□ Approval
□ Operation Policy
□ Real Preflight
□ Adapter Preview

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\04_Implementation_Test_Verification_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
4. 실주문 준비
==================================================
□ Hoga Mapper
□ OrderType Mapper
□ ExecutionController
□ Final Execution Guard
□ Order Lock
□ Request Hash
□ Execution Request

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
Layer 1. Controller Layer
- 호출 순서 관리.
- SignalController
- OrderCandidateController
- ApprovalController
- OperationPolicyController
- RealPreflightController
- AdapterPreviewController
- ExecutionController
- FillEventController
- RecoveryController

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
Layer 2. Domain Engine / Gate / Policy
- routine_signal_probe
- order_candidate_engine
- order_approval_engine
- operation_policy_gate
- real_order_preflight
- kiwoom_order_adapter preview

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
Layer 3. Runtime Storage
- routine_signals.json
- order_queue.json
- real_trade_guard.json
- candles.json
- latest_price.json
- 향후 order_locks.json, order_executions.json, fills.json 등

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
Timer / Manual Trigger
 ↓
SignalController, 향후
 ↓
routine_signal_probe
 ↓
routine_signal_queue
 ↓
OrderCandidateController, 향후
 ↓
order_queue.signal_to_order_candidate
 ↓
order_candidate_engine.build_order_candidate
 ↓
ApprovalController, 향후
 ↓
order_approval_engine.apply_order_approval_to_queue
 ↓
OperationPolicyController, 향후
 ↓
operation_policy_gate.apply_operation_policy_gate_for_order
 ↓
RealPreflightController, 향후
 ↓
real_order_preflight.apply_real_order_preflight_for_order
 ↓
AdapterPreviewController, 향후
 ↓
kiwoom_order_adapter.build_kiwoom_order_request_preview_for_order
 ↓
REAL_READY 유지

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
금지:
- Adapter Preview 이후 ADAPTER_READY 생성 금지.
- Adapter Preview가 ExecutionController를 호출 금지.
- Preflight가 Adapter/Executor를 호출 금지.
- Approval이 Policy/Preflight를 직접 호출 금지.
- order_candidate_engine이 Approval/Preflight/Adapter를 호출 금지.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
SignalController
허용:
- routine_signal_probe 호출.
- routine_signal_queue enqueue 흐름 관리.
금지:
- order_queue 생성.
- Approval/Policy/Preflight 호출.
- SendOrder 호출.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
OrderCandidateController
허용:
- order_queue.signal_to_order_candidate 호출.
- order_candidate_engine 호출 흐름 관리.
금지:
- Approval 판정.
- EXECUTABLE/REAL_READY 생성.
- hoga/order_type 확정.
- SendOrder 호출.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
ApprovalController
허용:
- order_approval_engine.apply_order_approval_to_queue 호출.
금지:
- OperationPolicyGate 호출 자동 연결, 별도 단계 전까지.
- Preflight 호출.
- SendOrder 호출.
- execution_enabled 변경.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
OperationPolicyController
허용:
- operation_policy_gate.apply_operation_policy_gate_for_order 호출.
금지:
- 일괄 승격 기본값.
- Preflight 자동 호출.
- execution_enabled 변경.
- SendOrder 호출.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
RealPreflightController
허용:
- real_order_preflight.apply_real_order_preflight_for_order 호출.
금지:
- Adapter 자동 호출.
- ORDER_QUEUED 생성.
- SendOrder 호출.
- operator_confirmed 변경.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
routine_signal_probe 금지:
- order_queue 생성.
- order_candidate_engine 호출.
- Approval/Policy/Preflight 호출.
- execution_enabled=true 설정.
- SendOrder 호출.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
routine_signal_queue 금지:
- order candidate 생성.
- order_queue status 변경.
- Kiwoom API 호출.
- SendOrder 호출.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
7. order_candidate_engine
==================================================

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
8. order_queue
==================================================

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
허용:
- signal_to_order_candidate.
- order_candidate_engine 호출.
- order_provenance 추가.
- order_intent 포함 후보 저장.
- order_queue.json 읽기/쓰기, 후보 생성 범위.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
금지:
- Approval 결과 직접 판정.
- Operation Policy 직접 판정.
- Preflight 직접 판정.
- SendOrder 호출.
- execution_enabled=true 변경.
- hoga/order_type 임의 확정.
- ADAPTER_READY 생성.
- ORDER_QUEUED 자동 생성.
의존 가능:
- order_candidate_engine.
- routine signal record.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
9. order_approval_engine
==================================================

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
의존 금지:
- operation_policy_gate 직접 호출.
- real_order_preflight 직접 호출.
- adapter/executor.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
허용:
- APPROVED 단건 order 검토.
- APPROVED -> EXECUTABLE.
- APPROVED -> BLOCKED_POLICY.
- operation policy 기준 확인.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
금지:
- PENDING 직접 승인.
- EXECUTABLE 이후 Preflight 자동 호출.
- execution_enabled=true 변경.
- operator_confirmed 변경.
- SendOrder 호출.
- GUI 직접 호출.
- 일괄 승격 기본 연결.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
의존 가능:
- order_queue.json.
- operation policy, 향후.
- order dict.
의존 금지:
- real_order_preflight 자동 호출.
- adapter/executor.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
11. real_order_preflight
==================================================

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
허용:
- EXECUTABLE 단건 order 검토.
- EXECUTABLE -> REAL_READY.
- EXECUTABLE -> BLOCKED_REAL.
- real_trade_guard 읽기.
- execution_enabled, operator_confirmed, account, login, quantity 등 최종 차단 조건 확인.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
금지:
- SendOrder 호출.
- send_order_stub 호출, preview helper에서는 금지.
- order_queue.json status 변경.
- ADAPTER_READY 생성.
- ORDER_QUEUED 생성.
- execution_enabled 변경.
- operator_confirmed 변경.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
의존 가능:
- order dict.
- guard dict/path.
- 순수 request builder.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
13. order_executor / real_order_executor_stub
==================================================

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
order_executor.py 현재 상태:
- 현재 order_queue 실행기가 아님.
- DryRunOrderExecutor는 order_manager dry-run callable 성격.
- KiwoomOrderExecutor는 NotImplementedError.
허용, 현재:
- 구조 분석.
- dry-run 범위 유지.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
금지:
- real_order_executor_stub 자동 실행.
- Timer/GUI 연결.
- ADAPTER_READY 전이 사용.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
금지:
- Domain Engine이 Kiwoom API 직접 호출.
- order_candidate_engine/order_queue/approval/preflight/adapter preview가 SendOrder 호출.
- GUI가 SendOrder 직접 호출.
- Timer가 SendOrder 직접 호출.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
15. Runtime Storage 의존성
==================================================

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
절대 금지 의존성:
- order_candidate_engine -> SendOrder
- order_candidate_engine -> GUI
- order_candidate_engine -> real_trade_guard
- order_queue -> Preflight
- order_queue -> Adapter
- order_queue -> Executor
- order_approval_engine -> Preflight
- order_approval_engine -> SendOrder
- operation_policy_gate -> SendOrder
- real_order_preflight -> Adapter
- real_order_preflight -> Executor
- kiwoom_order_adapter preview -> order_queue status write
- Adapter Preview -> ADAPTER_READY
- Timer -> SendOrder
- GUI -> SendOrder 직접 호출
- FillEvent 없는 상태에서 FILLED 전이

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
허용 의존성:
- routine_signal_probe -> routine evaluate
- routine_signal_probe -> routine_signal_queue
- order_queue -> order_candidate_engine
- routine_signal_consumer -> order_queue, 현재 과도기
- order_approval_engine -> order_queue
- operation_policy_gate -> order_queue
- real_order_preflight -> order_queue + real_trade_guard
- kiwoom_order_adapter preview -> order_queue read + guard read
- Controller -> 각 하위 모듈
- GUI/Timer -> Controller, 장기 목표

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
3단계:
- ExecutionController 설계.
- order_lock_manager 설계.
- hoga/order_type resolved mapper 설계.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
앞으로 SendOrder, 체결 이벤트, 취소/정정, 복구 기능을 구현할 때 이 문서를 기준으로 의존성 위반 여부를 먼저 검토해야 한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
Layer 3. Order Pipeline
- order_queue 후보 생성
- Approval Engine
- Operation Policy Gate
- Real Preflight
- Adapter Request Preview
Layer 4. Order Metadata
- order_intent
- order_provenance

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
1. SignalController
2. OrderCandidateController
3. ApprovalController
4. OperationPolicyController
5. RealPreflightController
6. AdapterPreviewController
7. ExecutionController
8. FillEventController
9. CancelModifyController
10. RecoveryController
현재 구현 대상은 아니다.
우선 설계 기준으로만 고정한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
금지:
- order_queue 생성 금지.
- Approval 호출 금지.
- Preflight 호출 금지.
- SendOrder 호출 금지.
- execution_enabled 변경 금지.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
5. OrderCandidateController
==================================================

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
책임:
- PENDING signal을 order_queue 후보로 변환하는 흐름을 조율한다.
- order_candidate_engine / order_queue를 호출한다.
- order_intent / order_provenance가 붙은 후보를 생성한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
호출 대상:
- order_queue.signal_to_order_candidate()
- order_candidate_engine.build_order_candidate()
허용 전이:
- signal PENDING 기반 order PENDING 후보 생성.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
금지:
- Approval 결과를 임의 결정 금지.
- EXECUTABLE/REAL_READY 생성 금지.
- hoga/order_type 확정 금지.
- SendOrder 호출 금지.
- execution_enabled=true 변경 금지.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
책임:
- order_queue의 PENDING order에 대해 Approval Engine을 호출한다.
- 후보 품질 검토 결과를 APPROVED/BLOCKED로 반영한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
호출 대상:
- order_approval_engine.apply_order_approval_to_queue()
허용 전이:
- PENDING -> APPROVED
- PENDING -> BLOCKED

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
금지:
- APPROVED -> EXECUTABLE 전이 금지.
- Real Preflight 호출 금지.
- ORDER_QUEUED 생성 금지.
- SendOrder 호출 금지.
- execution_enabled 변경 금지.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
책임:
- APPROVED order를 운영정책 기준으로 Real Preflight 검토 대상으로 승격할지 결정하는 호출 흐름을 관리한다.
- 단건 수동 승격이 기본이다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
호출 대상:
- operation_policy_gate.apply_operation_policy_gate_for_order()

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
금지:
- 일괄 승격 금지.
- EXECUTABLE 이후 자동 Preflight 호출 금지.
- REAL_READY 생성 금지.
- execution_enabled=true 변경 금지.
- SendOrder 호출 금지.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
호출 대상:
- real_order_preflight.apply_real_order_preflight_for_order()

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
금지:
- REAL_READY 이후 Adapter/Executor 자동 호출 금지.
- SendOrder 호출 금지.
- execution_enabled=true 변경 금지.
- operator_confirmed=true 변경 금지.
- ORDER_QUEUED 생성 금지.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
금지:
- ADAPTER_READY 생성 금지.
- ORDER_QUEUED 생성 금지.
- send_order_stub 호출 금지.
- SendOrder 호출 금지.
- queue 파일 수정 금지.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
금지:
- 현재 구현 금지.
- SendOrder 직접 구현 금지.
- Timer 자동 연결 금지.
- execution_enabled 자동 true 전환 금지.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
권장:
- Timer: SignalController까지만 자동 호출.
- signal_probe_only: OrderCandidate/Approval까지만 자동 호출 가능.
- OperationPolicy/RealPreflight 이후는 수동 또는 명시 호출.
- ExecutionController는 자동 Timer 연결 금지.
- GUI는 후보 목록/검토/승인 흐름을 Controller에 위임.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
권장 다음 작업:
- hoga/order_type 매핑 설계 또는 order lock manager 설계.
- 실주문 연결은 아직 금지.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
특히 ORDER_QUEUED 생성은 향후 ExecutionController만 담당해야 하며, Timer/Adapter Preview/Preflight가 자동으로 생성하면 안 된다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
5. 자동 복구 금지
- SendOrder 재호출
- execution_enabled 자동 true
- operator_confirmed 자동 true
- Lock 자동 재생성
- ORDER_QUEUED 자동 생성

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
6. 안전 우선
==================================================
- SendOrder는 단일 진입점만 허용한다.
- execution_enabled=false가 기본값이다.
- operator_confirmed=false가 기본값이다.
- 불명확한 상태는 검토관리로 보낸다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
Level 2 : 구현 기준 문서
- Implementation Standards
- Implementation Checklist
- Definition of Done
- Test Strategy

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\03_Architecture_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
RACI 정의
==================================================
R : Responsible (실행 책임)
A : Accountable (최종 책임)
C : Consulted (검토 참여)
I : Informed (결과 공유)

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
현재/기존 파일:
- runtime/routine_signals.json
- runtime/order_queue.json
- runtime/real_trade_guard.json
- candles.json, 위치는 종목/루틴 구조에 따름
- latest_price.json, 위치는 종목/루틴 구조에 따름

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
향후 후보 파일:
- runtime/order_locks.json
- runtime/order_executions.json
- runtime/fills.json
- runtime/positions.json
- runtime/review_items.json
- runtime/audit_log.jsonl
- runtime/close_history.json
- runtime/order_execution_log.json, 대체/보조 후보

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
관계
- id -> order_queue.orders[].source_signal_id
- id -> order_provenance.source_signal_id

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
5. runtime/order_queue.json
==================================================

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
역할
- Signal에서 생성된 주문 후보와 주문 생명주기 상태를 관리하는 중심 파일이다.
- 현재는 PENDING~REAL_READY~Adapter Preview 전 단계까지 사용한다.
- ORDER_QUEUED 이후 실주문 영역은 아직 구현 금지이다.
생성 주체
- order_queue
- 향후 OrderCandidateController

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
수정 주체
- order_approval_engine: PENDING -> APPROVED/BLOCKED
- operation_policy_gate: APPROVED -> EXECUTABLE/BLOCKED_POLICY
- real_order_preflight: EXECUTABLE -> REAL_READY/BLOCKED_REAL
- 향후 ExecutionController: REAL_READY -> ORDER_QUEUED
- 향후 FillEventController: 체결 상태 반영, 설계 후

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
금지
- Adapter Preview가 status를 변경하면 안 됨.
- ADAPTER_READY 생성 금지.
- SendOrder 호출 결과 직접 기록 금지, Execution 설계 전까지.
- execution_enabled 자동 true 금지.
- hoga/order_type 임의 확정 금지.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
정책
- 기본값은 모두 차단.
- operator_confirmed=true 자동 설정 금지.
- real_trade_enabled=true 자동 설정 금지.
- order별 실행 허가가 아니라 전역 guard이다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
7. runtime/order_locks.json, 향후
==================================================
역할
- 동일 order/source_signal/request의 중복 실행 방지.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
생성 시점
- ExecutionController가 ORDER_QUEUED로 승격하기 직전.
- REAL_READY 단계 자동 생성 금지.
생성 주체
- 향후 order_lock_manager
- 향후 ExecutionController

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
금지
- Candidate/Approval/Policy/Preflight/Adapter Preview 단계에서 lock 생성 금지.
- Timer/GUI 직접 lock 생성 금지.
- lock 없이 ORDER_QUEUED/SendOrder 금지.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
8. runtime/order_executions.json, 향후
==================================================

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
금지
- SendOrder 구현 전 파일 생성 금지.
- execution_id 임의 생성 금지.
- 같은 order_id로 active execution 중복 금지.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
금지
- SendOrder 성공만으로 fill 생성 금지.
- Chejan/서버 확인 없이 fill 생성 금지.
- 중복 fill 자동 정상 처리 금지.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
JSONL 1행 예시
{
 "log_id": "string",
 "timestamp": "datetime",
 "actor": "ApprovalEngine",
 "action": "status_transition",
 "entity_type": "order",
 "entity_id": "order id",
 "from_status": "PENDING",
 "to_status": "APPROVED",
 "reason": "approved",
 "routine": "지표추종매매",
 "code": "003550",
 "source_signal_id": "signal id",
 "order_id": "order id",
 "execution_id": null,
 "request_hash": null,
 "kiwoom_order_no": null,
 "details": {}
}

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
관계
- routine_signal_probe가 평가 입력으로 사용.
- 향후 order_provenance에 source_candle snapshot 연결 가능.
금지
- 주문 상태 저장 금지.
- SendOrder 관련 정보 저장 금지.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
15. latest_price.json
==================================================
역할
- order_candidate_engine의 price_basis 후보.
- 최신 가격 기준.
생성/수정 주체
- 가격 수집 계층, 향후 명확화
- Kiwoom 조회/실시간 계층
관계
- order_intent.price_basis에 latest_price로 기록 가능.
금지
- 주문 상태 저장 금지.
- 체결 상태와 혼동 금지.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
order_queue.json
- 생성: OrderCandidate
- 수정: Approval/Policy/Preflight/ExecutionController, 각 책임 범위
real_trade_guard.json
- 수정: Guard 관리 계층

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
order_locks.json
- 생성/수정: Lock Manager / ExecutionController, 향후

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
close_history.json
- 생성/수정: Close/Liquidation Controller, 향후

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
현재 금지:
- 새 runtime 파일 생성
- order_locks.json 구현
- order_executions.json 구현
- fills.json 구현
- positions.json 구현
- review_items.json 구현
- audit_log.jsonl 구현
- close_history.json 구현
- SendOrder 연결
- Chejan 이벤트 연결
- Position Runtime 구현
- Runtime 마이그레이션 자동 수행

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
현재 실제로 안정화된 Runtime 파일은 routine_signals.json, order_queue.json, real_trade_guard.json 계열이다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
대표 파일:
- runtime/routine_signals.json
- runtime/order_queue.json
- runtime/real_trade_guard.json
- runtime/orders.json
- runtime/state.json
- runtime/positions.json 또는 종목별 state/config 계열
- runtime/log 계열
- candles.json
- latest_price.json
현재는 각 파일이 기능별로 존재하지만, 장기적으로 다음 질문에 답할 수 있어야 한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
Routine
 ↓ generates
Signal
 ↓ source_signal_id
Order Candidate
 ↓ order_id
Order Queue
 ↓ execution_id
Execution Request
 ↓ kiwoom_order_no
Kiwoom Order
 ↓ fill_id
Fill
 ↓ position_id
Position
 ↓ close_order_id
Close / Exit History
보조 흐름:
Order / Execution
 ↓ error_id / review_id
Review Management
Order / Execution / Fill
 ↓ log_id
Audit Log

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
연결:
- Order Candidate는 source_signal_id로 Signal에 연결된다.
- order_provenance.source_signal_id = Signal.id.
3.3 Order Candidate / Order Queue
의미:
- Signal을 기반으로 생성된 주문 후보.
- 아직 실주문이 아니다.
현재 저장 위치:
- runtime/order_queue.json

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
주요 필드:
- id 또는 order_id
- source_signal_id
- code
- name
- side
- quantity
- price
- amount
- status
- candidate_status
- execution_enabled
- order_type
- order_intent
- order_provenance

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
권장 식별자:
- execution_id
- order_id
- source_signal_id
- created_at
- requested_at
- lock_id
- account_no
- request_preview_hash
- send_order_request

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
권장 필드:
- close_history_id
- position_id
- close_order_id
- close_fill_ids
- code
- reason
- close_type
- requested_at
- completed_at
- pnl
- status

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
권장 필드:
- log_id
- timestamp
- actor
- action
- entity_type
- entity_id
- from_status
- to_status
- reason
- details
- file_path

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
사용처:
- order_queue.source_signal_id
- order_provenance.source_signal_id
- execution.source_signal_id
- audit_log.entity_id, 필요 시

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
규칙:
- 한 signal은 0개 또는 1개 이상의 order 후보를 만들 수 있다.
- 중복 후보 생성 방지를 위해 source_signal_id 기준 추적 필요.
4.2 order_id
정의:
- order_queue.orders[].id.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
사용처:
- execution.order_id
- fill.order_id
- position.source_order_ids
- close_history.close_order_id
- review.related_order_id
- audit_log.entity_id

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
사용처:
- Position source_fill_ids
- Close History close_fill_ids

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
규칙:
- 부분체결마다 별도 fill_id를 가진다.
- 전량체결도 하나 이상의 fill 이벤트로 구성될 수 있다.
4.6 position_id
정의:
- 종목별 보유 포지션 단위 ID.
사용처:
- Close History
- Review Management
- Audit Log

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
runtime/order_queue.json
- Order Candidate / Order Lifecycle의 중심 파일.
- order_id, source_signal_id, order_intent, order_provenance 포함.
- 실주문 전후 lifecycle 상태 관리 후보.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
runtime/real_trade_guard.json
- 실주문 전역 guard.
- operator_confirmed, real_trade_enabled, 로그인/계좌 확인 등.
- order_queue와 직접 부모자식 관계는 아니지만 preflight/execution의 필수 조건.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
candles.json
- 루틴 평가 입력 데이터.
- 향후 source_candle_time/source_candle_snapshot을 signal/order_provenance에 연결 가능.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
latest_price.json
- order_candidate_engine의 price_basis 근거.
- order_intent.price_basis에 반영 가능.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
order_intent
- 주문 후보 산출 의도.
- hoga/order_type/UI source 미확정 진단.
- unresolved=true 기본.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
order_provenance
- 주문 생성 이력.
- signal_id, routine, matched_groups, details, reason, signal_index 등 추적.
- source_ui_path/rule_path/setting_set은 현재 null.
- unresolved=true 기본.
두 필드는 order_queue.json의 order에 포함된다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
1. order_locks.json 설계
2. order_executions.json 설계
3. hoga/order_type 매핑 설계
4. SendOrder request entity 설계
5. Chejan/Event entity 설계
6. fills.json 설계
7. positions.json 설계
8. review_items.json 설계
9. audit_log.jsonl 설계

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
권장 다음 작업:
- order_locks.json 설계
- 이유: ORDER_QUEUED 이후 실주문 위험 구간으로 가기 전 중복주문 방지가 필수이기 때문이다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
2. Runtime 목록
==================================================
현재
- routine_signals
- order_queue
- real_trade_guard

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
예정
- order_locks
- order_executions
- fills
- positions
- review_items
- audit_log

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
4. Runtime 의존
==================================================
routine_signals
↓
order_queue
↓
real_trade_guard
↓
order_execution(예정)
↓
fills(예정)
↓
positions(예정)
↓
review(예정)
↓
audit(예정)

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
3. Order Candidate Contract
==================================================
필수
- id
- side
- quantity
- price
- candidate_status
선택
- order_intent
- order_provenance
- execution_enabled

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
4. Execution Contract(예정)
==================================================
- request_id
- order_id
- request_hash
- sent_at
- execution_status

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
5. Fill Contract(예정)
==================================================
- fill_id
- order_id
- filled_qty
- filled_price
- filled_at

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
6. Runtime 카탈로그
==================================================
- routine_signals
- order_queue
- real_trade_guard
- order_locks(예정)
- order_executions(예정)
- fills(예정)
- positions(예정)
- review_items(예정)
- audit_log(예정)

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
3. Order 상태
==================================================
CANDIDATE
→ APPROVED
→ EXECUTABLE
→ REAL_READY
→ ORDER_QUEUED(예정)
→ ORDER_SENT(예정)
→ FILLED(예정)
→ CLOSED(예정)

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\02_Runtime_Data_Model_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
5. 이벤트와 Runtime
==================================================
Signal Event
→ routine_signals
Order Event
→ order_queue
Execution Event
→ order_executions(예정)
Fill Event
→ fills(예정)
Review Event
→ review_items(예정)
Audit Event
→ audit_log(예정)

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
MASTER_SPEC merged index - 01_Order_Pipeline
Generated: 2026-07-03 15:22:26
Source zip: C:\Users\JIN KWANG CHUL\Documents\docs\MASTER_SPEC_추가갱신_026-07-03.zip
Source document count: 16

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
BLOCKED
- approval 단계에서 차단된 상태.
- 예: 수량 없음, 예산 없음, candidate_status 미준비.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
order_queue.py
- routine signal을 order 후보로 변환한다.
- 최초 status=PENDING.
- execution_enabled=false 고정.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
order_approval_engine.py
- PENDING order만 approval 대상.
- 통과 시 APPROVED.
- 실패 시 BLOCKED.
- execution_enabled=false 유지.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
operation_policy_gate.py
- APPROVED order만 정책 gate 대상.
- 통과 시 EXECUTABLE.
- 실패 시 BLOCKED_POLICY.
- execution_enabled=false 유지.
- 단건 helper:
 apply_operation_policy_gate_for_order(order_id, queue_path=None)

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
real_order_preflight.py
- EXECUTABLE order만 real preflight 대상.
- 통과 시 REAL_READY.
- 실패 시 BLOCKED_REAL.
- guard_path 없음 또는 guard 파일 없음이면 기본 guard 자동 생성 금지.
- 단건 helper:
 apply_real_order_preflight_for_order(order_id, queue_path=None, guard_path=None)

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
order_executor.py
- 현재 queue executor가 아니다.
- DryRunOrderExecutor는 order_manager 경로의 dry-run callable.
- KiwoomOrderExecutor는 NotImplementedError 상태.
- 실제 SendOrder 미구현.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
routine_signal_consumer.py
- PENDING routine signal을 dry-run 소비한다.
- mark_previewed=True일 때 routine signal status를 PREVIEWED/BLOCKED/ERROR로 변경할 수 있다.
- write_order_queue=True, apply_approval=True 옵션에서만 order_queue 후보 생성 및 approval 반영.
- SendOrder, Preflight, Executor 미연결.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
gui_auto_trade_timer.py
- signal_probe_only=True 종목이 있을 때만 probe 이후 consumer 제한 실행.
- 연결 범위는 order_queue 후보 생성 및 approval까지.
- Real Preflight, Adapter, Executor, SendOrder 미연결.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
routine_signal_queue.py
- update_signal_status(signal_id, status, metadata=None)

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
routine_signal_consumer.py
- consume_pending_routine_signals_dry_run(limit=None, mark_previewed=False, write_order_queue=False, apply_approval=False)

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
routine_signal_order_bridge.py
- build_order_payload_preview_for_signal(signal_record)
- dry_run_order_manager_for_signal_with_payload_preview(signal_record)
- dry_run_pending_routine_signals_with_payload_preview(limit=None)

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
order_approval_engine.py
- apply_order_approval_to_queue(...)

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
operation_policy_gate.py
- apply_operation_policy_gate_for_order(order_id, queue_path=None)

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
real_order_preflight.py
- evaluate_real_order_preflight(order, guard)
- apply_real_order_preflight_for_order(order_id, queue_path=None, guard_path=None)

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
tests/test_order_queue_approval_scenarios.py
tests/test_operation_policy_gate_single_order.py
tests/test_real_order_preflight_evaluate.py
tests/test_real_order_preflight_single_order.py
tests/test_kiwoom_order_adapter_preview.py
6. 검증 명령 목록

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
1) hoga/order_type
- 현재 request_preview는 hoga="UNDECIDED"이다.
- 실제 주문 전송 전에 주문유형, 호가구분, 가격 정책을 확정해야 한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
2) execution_enabled
- 현재 자동 흐름은 false 유지가 안전장치이다.
- true 전환 정책 없이 SendOrder 연결 금지.
3) operator_confirmed
- 수동 확인 없이는 실주문 단계 진입 금지.
4) 중복 실행 방지
- order_id 기준으로 이미 처리된 주문을 재실행하지 않는 잠금 정책 필요.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
SOURCE: MASTER_SPEC_추가갱신_ADAPTER_READY_미사용정책_2026-07-03.txt
==================================================
MASTER_SPEC_추가갱신_ADAPTER_READY_미사용정책_2026-07-03

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
REAL_READY
 ↓ Adapter Request Preview
REAL_READY 유지
 ↓ 최종 실행 승인/호출 시
ORDER_QUEUED
 ↓ SendOrder 결과
DONE / ERROR

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
즉 Adapter Request Preview는 order_queue.json의 status를 변경하지 않는다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
정책:
- REAL_READY order 1건만 preview 대상이다.
- build_kiwoom_order_request_preview_for_order(order_id, queue_path=None, guard_path=None)를 통해 메모리 dict만 생성한다.
- send_order_stub() 호출 금지.
- SendOrder 호출 금지.
- order_queue.json 수정 금지.
- status 변경 금지.
- ADAPTER_READY 생성 금지.
- 반환값에는 not_saved=True, send_order_called=False, send_order_stub_called=False를 명시한다.
Preview 결과는 운영자/개발자 검토용이다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
정책:
- REAL_READY -> ORDER_QUEUED 자동 전환 금지.
- Adapter Preview만으로 ORDER_QUEUED 전환 금지.
- ORDER_QUEUED는 별도 최종 실행 함수/버튼에서만 생성 가능하다.
- 최종 실행 전에는 guard와 중복 주문 방지 검사를 다시 수행해야 한다.
- ORDER_QUEUED 이후에만 SendOrder 결과에 따라 DONE/ERROR 전이가 가능하다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
6. SendOrder 전 최종 조건
==================================================
SendOrder는 아래 조건을 모두 만족하기 전까지 호출 금지이다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
7. real_order_executor_stub.py 처리 정책
==================================================
real_order_executor_stub.py는 자동 연결하지 않는다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
8. 공식 주문 파이프라인 반영
==================================================
최신 공식 파이프라인은 다음과 같다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
10. 다음 작업 후보
==================================================
다음에 진행 가능한 안전 작업은 다음 중 하나이다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
SendOrder 구현은 별도 승인, guard, order_type/hoga, 중복 방지 lock 설계 이후에만 검토한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
SOURCE: MASTER_SPEC_추가갱신_Chejan_Fill_Event_Lifecycle_설계_2026-07-03.txt
==================================================
MASTER_SPEC_추가갱신_Chejan_Fill_Event_Lifecycle_설계_2026-07-03

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
9. 금지
- Chejan에서 전략 판단
- Chejan에서 SendOrder
- Chejan에서 Approval/Policy
- Chejan에서 execution_enabled 변경

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
5. Close History 권장 필드
- close_history_id
- position_id
- close_order_id
- close_fill_ids
- reason
- close_type
- requested_at
- completed_at
- realized_pnl

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
SOURCE: MASTER_SPEC_추가갱신_Execution_Request_order_executions_설계_2026-07-03.txt
==================================================

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
MASTER_SPEC_추가갱신_Execution_Request_order_executions_설계_2026-07-03

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
Execution Request는 REAL_READY order를 실제 SendOrder 대상으로 올리는 실행 요청 단위이다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
Execution Request는 체결 결과가 아니다.
Execution Request는 주문 접수 완료도 아니다.
Execution Request는 “이 order를 실제 주문으로 요청하려 했다”는 실행 요청 기록이다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
3. 생성 시점
==================================================
Execution Request는 아래 조건을 모두 만족할 때만 생성 가능하다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
생성 위치:
- REAL_READY -> ORDER_QUEUED 전환 시점
- 또는 ORDER_QUEUED 생성 직후

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
{
 "version": 1,
 "updated_at": "...",
 "executions": [
 {
 "execution_id": "...",
 "order_id": "...",
 "source_signal_id": "...",
 "lock_id": "...",
 "status": "REQUEST_PREPARED",
 "created_at": "...",
 "requested_at": null,
 "account_no": "...",
 "code": "003550",
 "side": "SELL",
 "quantity": 10,
 "price": 158.0,
 "order_type": "...",
 "hoga": "...",
 "request_preview": {},
 "request_hash": "...",
 "guard_snapshot": {},
 "operator_confirmed": true,
 "execution_enabled": true,
 "kiwoom_order_no": null,
 "api_result_code": null,
 "api_message": null,
 "error": null
 }
 ]
}
현재는 실제 파일 생성 금지.
문서 설계만 유지한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
5. 주요 필드
==================================================

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
execution_id
- 실행 요청 단위 ID.
- order_id와 별도로 생성.
- SendOrder 시도/요청 기록을 추적하기 위한 핵심 ID.
order_id
- order_queue.orders[].id 참조.
source_signal_id
- routine_signals.json의 signal id 참조.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
lock_id
- order_locks.json의 lock_id 참조, 향후.
- 중복 실행 방지 lock과 연결.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
6. order_queue와의 관계
==================================================

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
order_queue는 주문 후보 및 lifecycle 중심 파일이다.
Execution Request는 실제 실행 요청 기록이다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
관계:
- order_queue.orders[].id == order_executions.executions[].order_id
- order_queue.orders[].source_signal_id == order_executions.executions[].source_signal_id

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
권장:
- order_queue order에 latest_execution_id 또는 execution_ids 요약 필드 추가 가능, 향후.
- 단, 현재 코드 추가 금지.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
8. Execution Request와 Lock 관계
==================================================
Execution Request 생성 전 lock이 필요하다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
흐름:
REAL_READY
 ↓ lock 획득
ORDER_QUEUED
 ↓ execution 생성
Execution Request
 ↓ SendOrder

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
관계:
- execution.lock_id -> order_locks.lock_id
- lock.order_id -> execution.order_id
- lock.source_signal_id -> execution.source_signal_id

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
Order Lifecycle:
REAL_READY
 -> ORDER_QUEUED
 -> ORDER_SENT
 -> ORDER_ACCEPTED / REJECTED
 -> PARTIAL_FILLED / FILLED

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
Execution Request:
REQUEST_PREPARED
 -> SENDORDER_CALLED
 -> ACCEPTED / REJECTED / ERROR

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
10. 중복 실행 방지
==================================================

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
중복 실행 방지 기준:
- 같은 order_id로 활성 execution이 이미 있으면 새 execution 생성 금지.
- 같은 source_signal_id로 실행 중인 order가 있으면 재검토.
- request_hash가 같은 요청은 중복 실행 금지.
- lock이 active이면 동일 order 실행 금지.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
13. 다음 설계 우선순위
==================================================
Execution Request 설계 이후 다음 후보:

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
14. 최종 결론
==================================================

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
Execution Request는 order_queue의 REAL_READY order를 실제 SendOrder 요청으로 넘기기 위한 실행 단위이다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
order_queue는 후보와 lifecycle 중심 파일이고,
order_executions는 실행 요청 상세 이력 파일이다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
SOURCE: MASTER_SPEC_추가갱신_Final_Execution_Guard_최종실행게이트_2026-07-03.txt
==================================================
MASTER_SPEC_추가갱신_Final_Execution_Guard_최종실행게이트_2026-07-03

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
작성 목적
- 본 문서는 REAL_READY 이후 ORDER_QUEUED로 넘어가기 직전, 실주문 실행을 허용할지 최종 판정하는 Final Execution Guard 정책을 정의하기 위한 MASTER_SPEC 추가 갱신자료이다.
- 본 문서는 코드 구현 문서가 아니라, SendOrder 직전 최종 차단 조건과 책임 분리를 정의하는 기준 문서이다.
- 현재 단계에서 SendOrder, ExecutionController 구현, order_locks.json 생성, order_executions.json 생성, GUI/Timer 연결은 금지한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
1. Final Execution Guard의 위치
==================================================
공식 위치:

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
Final Execution Guard는 REAL_READY order가 ORDER_QUEUED로 넘어가기 직전에만 호출된다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
2. Final Execution Guard의 목적
==================================================
Final Execution Guard는 실주문 직전의 마지막 차단 게이트이다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
Final Execution Guard는 주문을 보내지 않는다.
Final Execution Guard는 ORDER_QUEUED 생성 가능 여부만 판정한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
3. Final Execution Guard 호출 주체
==================================================
허용 주체:
- ExecutionController, 향후.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
금지 주체:
- Timer
- GUI 직접 호출
- Adapter Preview
- Real Preflight
- Operation Policy Gate
- Approval Engine
- order_queue
- order_candidate_engine
- routine_signal_consumer

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
4. 필수 입력
==================================================
Final Execution Guard 입력 후보:
1. order
- order_queue의 REAL_READY order 1건.
2. guard
- real_trade_guard.json의 현재 snapshot.
3. order_intent
- order.order_intent.
- resolved 여부 확인.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
5. 필수 통과 조건
==================================================
Final Execution Guard는 아래 조건이 모두 true일 때만 통과한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
6. 차단 결과
==================================================
Final Execution Guard 실패 시 기본 정책:

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
{
 "ok": false,
 "order_id": "...",
 "blocked": true,
 "reasons": [
 "execution_enabled is false",
 "hoga is unresolved"
 ],
 "status_changed": false,
 "send_order_called": false
}

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
7. 통과 결과
==================================================
Final Execution Guard 통과 시 허용 가능한 다음 작업:

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
- order lock 획득.
- Execution Request 생성.
- order status를 ORDER_QUEUED로 전환.
- request_hash 기록.
- guard snapshot 기록.
- Adapter request snapshot 기록.
단, 현재 단계에서는 구현하지 않는다.
향후 통과 반환 후보:

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
{
 "ok": true,
 "order_id": "...",
 "ready_for_order_queued": true,
 "lock_required": true,
 "execution_request_required": true,
 "send_order_called": false
}

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
8. execution_enabled 정책
==================================================
execution_enabled는 Final Execution Guard의 핵심 조건이다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
정책:
- false이면 무조건 차단.
- Guard는 execution_enabled를 true로 바꾸지 않는다.
- true 전환은 별도 수동 승인/실행 컨트롤에서만 가능하다.
- execution_enabled=true는 order 단위 최종 실행 허가이다.
- true가 되어도 다른 guard 조건이 실패하면 차단된다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
9. operator_confirmed 정책
==================================================
operator_confirmed는 전역 실주문 확인 플래그이다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
정책:
- false이면 무조건 차단.
- Final Execution Guard는 값을 읽기만 한다.
- true 전환은 별도 guard UI/운영자 확인 절차에서만 가능하다.
- operator_confirmed=true만으로 SendOrder 허용 아님.
- order.execution_enabled도 true여야 한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
10. order_intent resolved 조건
==================================================

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
Final Execution Guard는 order_intent.unresolved == true인 order를 차단한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
필수:
- order_intent 존재
- source_ui_path 또는 명확한 정책 출처 존재, 향후
- order_type 확정
- hoga 확정
- price_mode 확정
- method_type 확정
- multi_hoga 정보 확정, 해당 시

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
11. order_provenance 조건
==================================================
Final Execution Guard는 order_provenance 존재를 요구한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
이유:
- 실주문 직전 주문 출처를 추적할 수 있어야 한다.
- source_signal_id 없이 SendOrder 금지.
- routine/code/signal/reason 추적 가능해야 한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
필수:
- order_provenance.source_signal_id 존재
- order_provenance.routine 존재
- order_provenance.signal 존재
- order_provenance.code 또는 order.code 존재

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
단, order_provenance.unresolved가 true라고 해서 무조건 차단할지는 향후 정책이다.
현재는 order_intent.unresolved가 더 직접적인 차단 조건이다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
12. Lock 조건
==================================================
Final Execution Guard는 중복주문 lock 획득 가능성을 확인해야 한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
필수:
- order_id 기준 active lock 없음.
- source_signal_id 기준 중복 실행 없음.
- 동일 request_hash 중복 없음.
- lock 생성 주체는 ExecutionController.
- Lock 없이 ORDER_QUEUED 생성 금지.
- Lock 없이 SendOrder 호출 금지.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
13. Adapter Request 조건
==================================================

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
15. Runtime 관계
==================================================
Final Execution Guard는 아래 Runtime 관계를 확인한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
- order_queue.orders[].id
- order_queue.orders[].source_signal_id
- order_intent
- order_provenance
- real_trade_guard.json
- order_locks.json, 향후
- order_executions.json, 향후
- review management, 향후
- audit log, 향후

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
17. 다음 구현 전 선행 조건
==================================================
Final Execution Guard 구현 전 반드시 선행되어야 할 항목:

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
1. hoga/order_type 매핑 확정
2. order_intent unresolved=false 조건 확정
3. order_locks.json 설계 확정
4. order_executions.json 설계 확정
5. request_hash 정책 확정
6. execution_enabled=true 전환 UI/함수 설계
7. operator_confirmed=true guard UI/함수 설계
8. ExecutionController 설계 확정
9. 검토관리/운영상태 차단 조건 정리

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
18. 최종 결론
==================================================
Final Execution Guard는 실주문 직전의 마지막 방어선이다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
SOURCE: MASTER_SPEC_추가갱신_Hoga_OrderType_매핑설계_2026-07-03.txt
==================================================
MASTER_SPEC_추가갱신_Hoga_OrderType_매핑설계_2026-07-03

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
목적
- 본 문서는 주문 후보(order_candidate) 단계에서 실제 키움 주문 파라미터(order_type, hoga)를 언제, 어떻게 확정할 것인지에 대한 기준을 정의한다.
- 현재 단계에서는 매핑 규칙만 정의하며 코드 구현은 하지 않는다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
1. 기본 원칙
- order_candidate 단계에서는 order_type/hoga를 확정하지 않는다.
- order_intent에는 의도만 기록한다.
- 실제 확정은 ExecutionController 직전에서만 수행한다.
2. 단계별 상태
Signal
→ Candidate
 order_type = 미확정
 hoga = 미확정
Approval
→ 변경 없음
Policy
→ 변경 없음
Preflight
→ 변경 없음
Adapter Preview
→ Preview 값만 생성
→ 저장 금지
ExecutionController
→ 최종 매핑
→ order_type 확정
→ hoga 확정
3. 매핑 책임
order_candidate_engine
- 주문 의도 생성
- 확정 금지
order_intent
- 주문 방식 설명
- 확정 금지
Adapter Preview
- Preview 생성
- 저장 금지
ExecutionController
- 최종 결정
- Execution Request에 반영
KiwoomOrderExecutor
- 이미 확정된 값을 사용만 한다.
- 자체 판단 금지.
4. 입력 후보

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
- GUI 직접 참조
- Combo 문자열을 직접 사용
- Candidate 단계 확정
- Approval 단계 확정
- Policy 단계 확정
- Preflight 단계 확정
- Adapter Preview 결과를 실제 주문값으로 사용
- ExecutionController 이전 저장
6. 완료 조건
ExecutionController 진입 시

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
- order_type 확정
- hoga 확정
- order_intent.unresolved == false
이후에만 ORDER_QUEUED 생성 가능.
7. 향후 구현 순서

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
7. 오류 처리
- API 오류는 그대로 상위에 전달한다.
- Boundary가 자동 재주문하지 않는다.
- 자동 재시도 정책은 Controller에서 결정한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
9. Audit Log
- SendOrder 호출
- TR 요청
- Chejan 수신
- API 오류
를 Audit Log 기록 대상으로 사용한다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
SOURCE: MASTER_SPEC_추가갱신_order_intent_미확정진단필드_2026-07-03.txt
==================================================
MASTER_SPEC_추가갱신_order_intent_미확정진단필드_2026-07-03

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
2. 현재 구현 범위
==================================================

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
변경 파일:
- order_candidate_engine.py
- tests/test_order_queue_approval_scenarios.py

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
3. order_intent의 현재 의미
==================================================
order_intent는 현재 “확정 주문 지시”가 아니다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
{
 "side": "BUY",
 "source": "order_candidate_engine",
 "budget_source": "entry_amount",
 "price_basis": "latest_price",
 "source_ui_path": null,
 "unresolved": true
}

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
6. source_ui_path 정책
==================================================
source_ui_path는 정확히 알 수 있을 때만 채운다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
7. unresolved 정책
==================================================
현재 기본값:
- unresolved=true

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
의미:
- 주문방식 확정 불가
- UI state 미연결
- hoga/order_type 미확정
- source_ui_path 미확정
향후 unresolved=false가 되려면 아래 조건이 필요하다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
8. order_type / hoga 정책
==================================================
현재 order_type:
- 기존 값 유지
- 대부분 UNDECIDED 또는 기존 후보 정책 유지

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
9. UI state 접근 정책
==================================================

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
현재 order_candidate_engine.py는 rules.json 또는 indicator_follow_ui_state를 읽지 않는다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
금지:
- order_candidate_engine.py에서 rules.json 직접 읽기
- order_candidate_engine.py에서 indicator_follow_ui_state 직접 읽기
- UI dialog 인스턴스 참조
- 한글 combo text 직접 해석
- sell setting_a/b/c 추정
향후 필요 시 별도 mapper 계층을 둔다.
권장 향후 구조:

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
indicator_follow_ui_state
 ↓
order_intent_mapper
 ↓
order_intent 확정/보강
 ↓
order_queue candidate
 ↓
adapter preview

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
검증 결과:
- python -m py_compile order_candidate_engine.py order_queue.py routine_signal_consumer.py 통과
- python -m unittest tests.test_order_queue_approval_scenarios 통과: 3 tests OK
- python -m unittest tests.test_kiwoom_order_adapter_preview tests.test_real_order_preflight_single_order 통과: 10 tests OK

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
order_intent는 현재 진단 메타데이터이므로 approval/preflight/adapter가 무시해도 된다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
12. 향후 확장 방향
==================================================
향후 확장 후보:

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
1. order_intent_mapper.py 신설 검토
- UI state/rules를 읽어 order_intent를 보강.
- order_candidate_engine.py가 직접 UI state를 읽지 않도록 분리.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
4. Adapter Preview 보강
- order_intent가 resolved일 때만 hoga/order_type preview 확정.
- unresolved이면 hoga/order_type은 계속 UNDECIDED.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
5. SendOrder 전 조건
- unresolved=false
- hoga 확정
- order_type 확정
- execution_enabled=true
- operator_confirmed=true
- lock 통과

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
정확히 알면 나중에 확정한다.
정확히 모르면 unresolved=true로 남긴다.
추정값을 실주문 입력으로 사용하지 않는다.

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
==================================================
SOURCE: MASTER_SPEC_추가갱신_Order_Lock_Manager_설계_2026-07-03.txt
==================================================
MASTER_SPEC_추가갱신_Order_Lock_Manager_설계_2026-07-03

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
3. Lock 단위
필수 식별자
- lock_id
- order_id
- source_signal_id
- code
- side
- created_at
- status(active/released/error)

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
권장 추가 정보
- execution_id(향후)
- routine
- account_no
- operator_confirmed_snapshot

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
4. 생성 조건
모든 조건 충족 시에만 생성
- status == REAL_READY
- execution_enabled == true
- operator_confirmed == true
- real_trade_enabled == true
- 로그인 완료
- 계좌 선택 완료
- account_no 존재
- quantity > 0
- order_type 확정
- hoga 확정

[출처: 마스터스펙\MASTER_SPEC_통합본_2026-07-03_FINAL_REVISED\merged_by_index\01_Order_Pipeline_merged.txt | 기준일: 2026-07-03 | 수정시각: 2026-07-03 15:22:26 | 분류: MASTER_SPEC]
관계
lock.order_id -> order_queue.order_id
lock.source_signal_id -> routine_signals.signal_id
lock.execution_id -> execution.execution_id(향후)


Original Body Marker: END

---

Reference Navigation

- Previous: PART04_03_ROUTINE.md
- Next: PART04_ROUTINE.md
- Full PART: PART04_ROUTINE.md
- INDEX: 00_REFERENCE_INDEX.md
- Original Canonical: ../CURRENT/MASTER_SPEC_CANONICAL_2026-07-08_EXECUTION_SENDORDER_CHEJAN_LIFECYCLE_PIPELINE.txt
