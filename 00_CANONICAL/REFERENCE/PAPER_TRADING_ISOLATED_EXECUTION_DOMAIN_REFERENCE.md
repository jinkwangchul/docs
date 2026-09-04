# PAPER Trading Isolated Execution Domain Reference

## Status

- `PENDING IMPLEMENTATION`
- `ARCHITECTURE DIRECTION APPROVED`

This document is a design boundary, not a statement that PAPER trading exists
in Production.

## Starting Point

PAPER is an independent Execution Domain. It is not a value of
`real_trade_enabled`, a badge on REAL state, a monitoring-only alias, or a mode
flag that shares REAL persistence.

Canonical invariants:

- `PAPER_ISOLATED_EXECUTION_DOMAIN`
- `REAL_PAPER_PERSISTENCE_ZERO_CROSS_WRITE`
- `PAPER_RESULTS_NEVER_ENTER_REAL_PERFORMANCE`
- `PAPER_HAS_NO_SENDORDER_PATH`
- `SHARED_INPUT_READ_ONLY_AND_ONE_WAY`
- `REAL_AND_PAPER_RECOVERY_FULLY_SEPARATED`
- `MAIN_REMAINS_ROUTINE_AGNOSTIC`
- `REAL_AND_PAPER_UI_VISUALLY_AND_LOGICALLY_SEPARATED`

## Persistence Isolation

- PAPER orders write zero REAL Queue rows.
- PAPER fills write zero REAL Fill rows.
- PAPER positions never merge with REAL positions.
- PAPER accounts never change a REAL account or Broker-funds projection.
- PAPER PnL never enters REAL Performance.
- PAPER events write zero REAL Event Journal entries.
- PAPER Recovery never reads or mutates REAL Runtime state.
- REAL Recovery never reads or mutates PAPER state.
- A PAPER executor has no SendOrder path.

The same Stock code has domain-qualified identity, for example:

```text
REAL  / instance_id / stock_code
PAPER / instance_id / stock_code
```

## Shared Inputs

Only read-only, one-way inputs may be shared:

- realtime MarketData
- Stock master information
- Routine definitions
- an operator-approved settings snapshot when explicitly required

PAPER output must never write back into those shared inputs or any REAL result
store.

## UI Direction

REAL and PAPER have separate visual and logical spaces. A single badge on one
mixed Stock row is insufficient.

REAL displays actual operation, order, fill, holding, and PnL evidence. PAPER
displays virtual operation, order, fill, holding, and PnL evidence. Their
selection, aggregation, recovery status, and performance totals remain
separate.

## v1 Direction

The first design target is:

```text
Routine BUY/SELL
-> PAPER Executor
-> Virtual Order
-> immediate Virtual Fill at current price
-> Virtual Position
-> Virtual Account
-> Virtual PnL
```

Required components are Virtual Account, Order, Fill, Position, Performance,
Event Journal, and PAPER Recovery.

v1 does not attempt complete exchange emulation, order-book-accurate fills,
complex partial fills, a precision slippage model, or Chejan emulation.

## Relationship To Retired Monitoring-only

The former monitoring-only path kept REAL-domain MarketData and Routine
evaluation while suppressing execution before REAL_READY/ORDER_QUEUED and
SendOrder. It has no virtual account, fill, position, performance, event
journal, or recovery domain. Therefore:

```text
MONITORING_ONLY_EXECUTION_SUPPRESSION != PAPER
```

The next authorized work item is an architecture and mutation-boundary audit,
not direct PAPER implementation.
