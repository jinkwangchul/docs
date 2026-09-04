# Main Operator UI Reference

## Purpose

This reference owns detailed Main operator-UI behavior for Review Management,
state-aware Stock context menus, footer projection, footer icon/color semantics,
and footer layout. High-level authority remains in the 2026-08-24 Window/Stock
UI contract except that the monitoring/operating permission switch is
superseded by
`MASTER_SPEC_CANONICAL_2026-09-04_MONITORING_OPERATING_MODE_RETIREMENT.txt`.

It does not define Runtime, participant, Queue, Execution, Broker, or SendOrder
semantics.

## Review Management Entry

- The old top Review table filter is removed.
- The old bottom `검토관리(N)` button is removed.
- The top Review position is the single Review Management entry.
- Its count comes from the existing Review Management count source; a second
  counter is not maintained.
- Clicking it opens the existing single Review Management window.
- It is green only while that window is actually open.
- A nonzero count alone does not produce the green active state.
- Normal close and X-button close immediately restore the default state.

Review Stocks are inspected and managed in the dedicated Review Management
window rather than through a Main-table Review filter.

## Common Context-Menu Safety

Menu composition, order, separators, and state-specific branches remain intact.
An action that is disallowed for the current state remains visible and is set
disabled; it is not deleted or hidden.

The retired monitoring/operating permission QAction is an explicit exception:
it is ABSENT in every Main and Settings context, including Review. There is no
visible-disabled placeholder for the retired action.

UI disabling is not the mutation boundary. The same authoritative state guard
must reject direct callback or alternate-caller execution. A disabled parent
menu disables access to every child action.

Current-running Stocks cannot transition directly to operation exclusion from
double-click, context menu, or another mutation caller. The transition becomes
available only after the existing current-running contract no longer applies.

## Review Context Menu: CASE A

When the existing menu branch contains `시간변경` and `변경리셋`, Review-state
enabled actions are:

- `전체선택`
- `선택해제`
- `시간변경`
- `변경리셋`
- `등록해제`

The following remain visible and disabled:

- `운영시작`
- `운영제외`
- `조기마감`
- `개별청산`
- `종목등록`
- `간이차트`
- any other action not explicitly allowed by this Review branch

This branch does not create an `ATS설정` action.

## Review Context Menu: CASE B

When the existing menu branch contains `ATS설정`, Review-state enabled actions
are:

- `전체선택`
- `선택해제`
- `ATS설정`
- `등록해제`

The following remain visible and disabled:

- `운영시작`
- `운영제외`
- `조기마감`
- `개별청산`
- `종목등록`
- `간이차트`
- any other action not explicitly allowed by this Review branch

This branch does not create `시간변경` or `변경리셋` actions. CASE A and CASE B
remain separate existing menu compositions.

## Disabled Action Visuals

Enabled actions retain their existing text and semantic colors. Disabled
actions use one muted gray foreground close to the menu background and do not
retain green, blue, orange, warning, or other active semantic colors. In
particular, disabled `조기마감` is not green. Hover or selection must not make a
disabled action appear executable.

## Footer Projection Boundary

The Main footer receives existing `showMessage` traffic through one common
operator projection boundary:

```text
Production caller / raw status
  -> hidden QStatusBar messageChanged
  -> Operator Footer Projection
  -> canonical message, icon, color
  -> footer QLabel
```

The raw Production inventory remains historical audit evidence. The current
footer exposes 29
canonical operator messages:

- success: 8
- failure: 11
- progress: 7
- state: 2
- warning: 1

`FOOTER_REMOVED` suppresses only footer projection. Existing caller behavior,
Event Journal, logger, Runtime, and Execution evidence remains available.

The detailed raw inventory, caller paths, former 30-message table, and all 185
dispositions remain historical audit evidence in the code repository:

- `reports/MAIN_FOOTER_STATUS_MESSAGE_AUDIT.md`
- `reports/MAIN_FOOTER_STATUS_MESSAGE_EXHAUSTIVE_LIST.md`

They do not override the current 29-message implementation-owned tuple.

## Footer Inclusion And Exclusion

The footer summarizes current program state, major success/failure, and states
that require immediate operator judgment. It is not a detailed execution log.

The following remain in Event/Log evidence and do not appear as footer stages:

- `REAL_READY`
- Approval
- Policy Gate
- Execution Preview
- `ORDER_QUEUED`
- Runtime Commit
- Dispatch
- Manual Queue
- Manual SendOrder
- internal IDs, hashes, and revisions

The projected footer has zero raw English messages and zero internal execution-
stage messages.

## Footer Icon And Color Contract

| Icon | Meaning | Color | Canonical count |
|---|---|---|---:|
| `✓` | success / completion | green | 8 |
| `✕` | failure / fault | red | 11 |
| `▷` | progress / wait | orange | 7 |
| `●` | current state / mode | dark gray | 2 |
| `※` | warning / operator attention | orange family | 1 |

Total: 29. `▶`, `!!`, and arbitrary new icons are not used. Failure and warning
messages retain the current 2.5-second protection from lower-priority overwrite.

Representative canonical messages include:

- connection/authentication: `▷ 로그인 중`, `✓ 서버 연결 완료`,
  `✕ 로그인 실패 ({code})`, `✕ 서버 연결 실패`, `✕ 서버 연결 끊김`,
  `▷ 서버 재연결 중`, `▷ 서버 인증 중`, `✓ 서버 인증 완료`,
  `✕ 서버 인증 실패`
- program: `▷ 준비 중`, `✓ 준비 완료`, `● 운영 대기`, `● 비운영 상태`,
  `※ 운영 대상 없음`
- market data: `▷ 시장데이터 수신 대기`, `✓ 시장데이터 수신 정상`,
  `✕ 시장데이터 수신 중단`
- operation: `▷ 운영 시작 대기`, `✓ 운영 시작`, `✓ 운영 정지`,
  `✕ 운영 시작 실패`, `✕ 운영 정지 실패`
- safety: `✕ 긴급정지`, `✓ 긴급정지 해제`

The implementation-owned canonical tuple is the authority for the complete
29-message list. Older exhaustive inventory counts remain historical evidence.

## Footer Layout And Button Style

- The operator message and five bottom buttons share one horizontal row.
- There is no separate status-message row below the buttons.
- The message is left aligned; the button group occupies the right side.
- The message area and first button retain visible horizontal separation.
- All five bottom buttons use a white default background, including Operation
  Start/Stop.
- Operation state is communicated by button text/icon, not a different default
  background.
- Existing hover, pressed, and disabled behavior remains.
- Button height, function, and wording remain unchanged.
- Layout margins, spacing, and stretch preserve separation from the window
  boundaries and remain responsive to window width.

Exact pixel widths, margins, and spacing are implementation details rather than
Canonical behavior.
