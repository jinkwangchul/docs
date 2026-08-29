# Unified Base Budget Change Reference

## Purpose

This reference records the unified `기본예산변경` dialog, permanent starting-
budget persistence, current-operation apply timing, validation, and optional
limit update contracts. It does not define a Routine strategy, order amount,
cycle model, or a new budget Source of Truth.

## Ownership

- Permanent starting budget: the existing per-Stock `config.json` contract.
- Permanent writer: the existing canonical Stock/config writer.
- Current-operation timing evidence: the existing
  `state.json.running_budget_adjustment` contract.
- Operation identity: the existing `trade_started_at` value.

No additional JSON, Source of Truth, writer, or lifecycle is introduced.
Persistence of the user-confirmed base value and its current-cycle application
time are separate concerns.

## Budget Semantic Boundaries

- `전체예산` is the one system-level budget concept. It is not preallocated to
  a Routine, Routine Instance, or Stock, and it is not the sum of per-Routine
  fields named `budget`.
- A Routine or Routine Instance has no implied reserved allocation merely
  because a code or JSON field contains the word `budget`.
- `한도금액` is a ceiling on actual spending eligibility. It is not money set
  aside for a Routine, Instance, or Stock.
- `종목 최초예산` is the basis for sizing that Stock's initial purchase. It is
  not a reserved share of `전체예산`.
- `현재 구매예산` is the execution-time amount determined by the existing buy
  rules. It is not interchangeable with `전체예산`, `종목 최초예산`,
  `한도금액`, or `운영금액`.

Similar names do not merge ownership, persistence, calculation, or lifecycle.
No hierarchical budget allocation may be inferred without a new approved
Canonical contract.

## Unified Dialog Boundary

Starting-budget value editing uses one `기본예산변경` dialog regardless of
current-running state. A separate non-running dialog or direct value-cell editor
is not part of the current contract.

Not current-running:

- `즉시적용` and `다음회차적용` remain visible and disabled.
- Confirm persists the value immediately as the pre-operation base config.
- The disabled timing controls do not prevent the confirm/save path.

Current-running:

- `즉시적용` and `다음회차적용` are enabled.
- Existing Runtime apply-timing and safety validation remain authoritative.
- Confirm persists the new base config in addition to recording the selected
  current-operation timing.

Cancel records nothing. Confirm rechecks the current-running decision, current
mode, value, apply policy when applicable, fresh-price evidence, and optional
limit evidence before mutation.

## Mode Cell And Value Cell

The budget-mode cell and starting-budget value cell have distinct double-click
meanings:

- `주수` / `금액` mode cell: invoke the existing QUANTITY/AMOUNT mode-change
  workflow.
- starting-budget value cell: verify fresh price, then open
  `기본예산변경`.

These actions must not be merged into one handler meaning. Running-state mode
immutability remains governed by the existing safety contract.

## Fresh Current Price Precondition

AMOUNT and QUANTITY modes both require fresh canonical current-price evidence
before the dialog opens. Missing, zero, invalid, stale, previous-session, or
UI-string-only price evidence is not sufficient. Failure is reported through
the existing Toast path, and the dialog, input, and Confirm path remain closed.

The displayed price is not reparsed as authority. The existing current-session
canonical market-data source remains the owner.

## AMOUNT Minimum Validation

AMOUNT minimum validation reuses the existing environment-setting Source of
Truth and calculation path:

```text
fresh current price x configured environment formula value
```

This is not a new `current price x one share` policy, a dialog constant, or a
duplicated calculator. The same minimum applies to non-running confirmation,
running immediate apply, and running next-cycle apply.

The dialog reuses its existing centered red validation label. It is hidden for
a valid value and visible only when AMOUNT validation fails. The message embeds
the actual calculated amount with thousands separators, for example:

```text
※ 입력 불가. 최소값은 13,305원 이상입니다.
```

A below-minimum value blocks Confirm. Returning to a valid value hides the
message immediately. Missing current price is handled before dialog entry and
does not create a second in-dialog message or label.

## Permanent Persistence

Every confirmed starting-budget change persists independently of trading:

```text
non-running Confirm
  -> canonical config writer
  -> Stock config.json

running Immediate Confirm
  -> current Running value
  -> base config.json

running Next-Cycle Confirm
  -> current Running projection keeps the old value
  -> Pending Next Cycle records the new value
  -> base config.json records the new value
```

BUY, SELL, Queue, SendOrder, Chejan, and Fill are not persistence triggers.
Operation stop or process restart must not discard a confirmed base value merely
because no trade occurred.

## Immediate And Next-Cycle Timing

The timing state machine governs current-operation projection only.

Immediate:

```text
WAIT_FIRST_BUY
  + newly queued BUY
  -> APPLIED
```

Next cycle:

```text
WAIT_SELL
  + newly queued SELL
  -> WAIT_FIRST_BUY
  + newly queued BUY
  -> APPLIED
```

BUY before the first SELL in `WAIT_SELL` uses the old current-cycle base value.
Multiple SELL signals do not change the result after `WAIT_FIRST_BUY` is
reached. Duplicate, ignored, and failed queue results do not advance timing.
None of these signal transitions controls whether the base config is durable.

## Projection Boundary

For running Immediate apply, the current operator-facing projection changes to
the confirmed value according to the existing timing contract. For Next-Cycle
apply, the current projection remains old while the pending projection carries
the new value. On a later non-running view or process restart, the permanent
base config supplies the confirmed value.

Signals, candidates, approvals, Queue rows, and orders created before
confirmation are not rewritten retrospectively.

## Stale Full-Settings Protection

An older full-settings window snapshot must not overwrite a newer starting
budget confirmed through `기본예산변경`. Before a full-config write, the current
canonical budget fields are rehydrated or otherwise protected so stale
`trade_amount_type`, `buy_qty`, or `buy_amount` values cannot restore an older
budget.

This protection is a writer-boundary contract, not a reason to retire a
participant or create a second version store.

## Main / Routine Independence

The current-operation timing state machine may observe only:

- standard BUY
- standard SELL
- operator-confirmed adjustment state

It must not branch on Routine name, Routine type, cycle identity, round number,
averaging stage, strategy metadata, holding quantity, or position state. SELL is
not interpreted as a full exit. The Routine remains the authority for actual BUY
amount or quantity calculation.

## Limit Option

`한도금액에 새 설정값 적용` is available in the same dialog for running and
non-running Stocks.

- unchecked: preserve the existing persistent limit.
- checked: reuse the existing recommended-limit formula and digit alignment.
- successful calculation: the existing writer may persist the recomputed limit.
- missing or incomplete source: fail closed and preserve an existing valid
  persistent `RECOMMENDED` limit.

An incomplete source must not replace a valid limit with `None`, `대기`, an
empty value, or another incomplete projection. No limit formula is changed by
this dialog contract.

## Login And Fresh-Price Display Transition

Starting-budget and limit display use one transition contract:

- before login: use the existing persistent display; do not force `대기`.
- login succeeded, server authentication pending: display `대기` for both.
- authentication complete but no fresh current-session price: keep `대기` for
  both.
- authentication complete and first fresh current-session price available:
  replace `대기` with the normal persistent/resolved values.

The end boundary is therefore
`SERVER_AUTH_COMPLETE + FRESH_CURRENT_PRICE_AVAILABLE`, not authentication
alone. The text `한도(확인 필요)` is not part of the current display contract.

## Prohibited Interpretations

- Non-running value editing bypasses `기본예산변경` through a direct cell editor.
- Disabled non-running timing controls suppress permanent Confirm.
- Runtime timing evidence replaces or owns permanent base config.
- A trade, Queue row, SendOrder, Chejan, or Fill is needed to persist a budget.
- Main determines a Routine cycle.
- `holding == 0` activates the adjustment.
- SELL always means full liquidation or cycle completion.
- A named Routine receives a special Main branch.
- Missing limit inputs erase a valid persistent limit.
- Authentication completion alone ends the budget/limit `대기` display.
