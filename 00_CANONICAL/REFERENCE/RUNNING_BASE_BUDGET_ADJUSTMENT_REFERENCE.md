# Running Base Budget Adjustment Reference

## Purpose

This reference records the current-operation base-budget adjustment boundary.
It does not define a Routine strategy, order amount, cycle model, or permanent
starting-budget rewrite.

## Ownership

- Permanent starting budget: the existing per-stock `config.json` contract.
- Current-operation adjustment evidence: `state.json.running_budget_adjustment`.
- Mutation boundary: the existing canonical Runtime stock-state writer.
- Operation identity: the existing `trade_started_at` value.

No additional JSON, Source of Truth, writer, or lifecycle is introduced.

## Editing Boundary

Not current-running:

- direct mode and value editing follows the existing starting-budget contract.

Current-running:

- `trade_amount_type` is immutable.
- direct `buy_qty` / `buy_amount` config mutation is blocked.
- `기본예산변경` records a current-operation adjustment request.
- cancel records nothing.
- confirm rechecks current-running state, mode, value, apply policy, and optional
  limit evidence before the canonical Runtime commit.

## State Machine

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

BUY before the first SELL in `WAIT_SELL` uses the old base budget. Multiple SELL
signals do not change the result after `WAIT_FIRST_BUY` is reached. Duplicate,
ignored, and failed queue results do not advance the state.

## Projection Boundary

The effective `stock_config` copy is projected before Routine evaluation. This
allows the Routine's existing BUY policy to calculate a new execution intent
from the adjusted base input. The persistent base config is not rewritten.

Signals, candidates, approvals, Queue rows, and orders created before adjustment
confirmation are unchanged.

## Main / Routine Independence

The adjustment state machine may observe only:

- standard BUY
- standard SELL
- operator adjustment state

It must not branch on Routine name, Routine type, cycle identity, round number,
averaging stage, strategy metadata, holding quantity, or position state. SELL is
not interpreted as a full exit. The Routine remains the authority for actual BUY
amount or quantity calculation.

## Restart And End

The reader restores an adjustment only when its
`operation_session_started_at` exactly equals the current `trade_started_at`.
When operation is no longer enabled, or a new operation has a different
`trade_started_at`, the old adjustment is ignored. It never promotes itself
into permanent non-running config.

This exact-match rule is the current implementation boundary. Because
Operation Start creates a new `trade_started_at`, preservation across an
Operation Start followed by process restart/recovery is a
`PENDING / KNOWN LIMITATION` item until that identity boundary is verified.
This document must not describe that cross-boundary recovery as live-complete.

## Display / Edit Hydration

Main and the double-click editor expose the same latest operator-facing
projection. Main uses the existing `ROUTINE_STOCK_INITIAL_BUY_ROLE`; the
editor consumes that projection first and falls back to the existing
`project_running_budget_adjustment_display_config()` projection when the role
is unavailable. While a current-operation adjustment is active, the previous
permanent base value is not reintroduced into the user-facing value.

This is a display/read boundary only. It does not rewrite `config.json`, alter
the adjustment state machine, or change the IMMEDIATE/NEXT_CYCLE application
point.

## Limit Option

The optional current-operation limit projection reuses the existing recommended
limit formula and digit alignment. It does not overwrite the permanent Stock
limit config. Missing required evidence is a fail-closed confirmation result.

## Prohibited Interpretations

- Main determines a Routine cycle.
- `holding == 0` activates the adjustment.
- SELL always means full liquidation or cycle completion.
- A named Routine receives a special Main branch.
- Runtime adjustment rewrites existing candidates or permanent base config.
