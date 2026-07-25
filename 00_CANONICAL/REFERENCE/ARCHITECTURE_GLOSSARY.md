# ARCHITECTURE_GLOSSARY

Document role: terminology reference only.

This file does not define AI operating procedure, startup order, Git workflow, document lifecycle, or project contracts.

If this glossary conflicts with the latest Canonical or `AGENT_WORKFLOW_REFERENCE.txt`, follow the latest Canonical for technical contracts and `AGENT_WORKFLOW_REFERENCE.txt` for AI operating rules.

Use `00_CANONICAL/REFERENCE/00_REFERENCE_INDEX.md` only to locate this file when terminology clarification is needed.

## Call Order Terms

Service:
- Use-case entry point.
- Receives input, selects the flow, and returns the result.
- Does not directly assemble internal executor objects.

Builder:
- Converts validated input into the request object required by an executor contract.
- Does not run business flow or write data.

Adapter:
- Converts builder output to the lower-level interface shape.
- Does not create a new policy or request structure.

Runtime Commit Real Executor:
- The single write owner that performs Runtime Commit after approval, guard, persistence, recovery, and verification contracts pass.
- Production-callable implementation and production-connected implementation are separate facts.

## Preview, Review, Approval, Verification

Preview:
- A no-side-effect calculation of expected result or execution candidate.
- Mode or stage, not state.

Review:
- Operator or upper-layer risk inspection of evidence and candidates.

Approval:
- Explicit permission decision for a specific evidence, plan, or execution target.
- Not the same as Review.

Verification:
- Check that input, contract, execution result, or persisted result is correct.
- Not an operator approval decision.

Validation:
- Check that input and contract format are valid before passing to the next step.

## State, Stage, Mode

State examples:
- READY
- BLOCKED
- INVALID
- APPROVED
- COMMITTED
- VERIFIED
- ABORTED
- ROLLED_BACK
- REVIEW_REQUIRED

Stage examples:
- Build
- Adapt
- Validate
- Review
- Commit
- Verify
- Recover

Mode examples:
- Preview
- Dry-run
- Production

Do not use `PREVIEW` as a state such as READY or BLOCKED.

## Contract, Plan, Boundary, Gate

Contract:
- Formal promise for data or behavior passed between layers.

Plan:
- Concrete sequence or list of work generated before execution.

Boundary:
- Responsibility and access limit of a layer or feature.

Gate:
- Decision point that allows or blocks entry to the next step.

Policy:
- Rule used by a Gate or Service.

Operation Mode Change Gate:
- The single-stock Backend decision point for `CONTINUOUS` and `SCHEDULED`
  transitions. Multi-stock operation-mode changes are unsupported.
- Its time inputs come from the effective per-stock schedule with the global
  scheduled-operation policy as fallback; missing or invalid policy is
  fail-closed.
- It decides the time boundary before Runtime ATS clearing and mode persistence.
  GUI callers only present its reason and must not duplicate the calculation.
- Boundary tests cover before, equal, and after the effective end time, strict
  Source of Truth resolution, ATS-clear failure, and rejection of non-single
  GUI selection before the Backend call.

Token:
- Verifiable permission evidence bound to a specific target and scope.

Candidate:
- Proposed change that is not yet approved or committed.

Pending:
- Candidate waiting for approval or rejection.

## Cleanup, Rollback, Recovery

Cleanup:
- Release locks or temporary resources after failure or completion.
- Not data rollback.

Lock Release:
- A cleanup operation.
- Not the same as rollback.

Rollback:
- Restore an already-applied change to the previous verified state.

Recovery:
- Bring the system back to an operational state after interruption.
- May include rollback, journal use, and verification.

## Runtime, Lifecycle, Execution

Lifecycle:
- State transition flow of an operating object such as an order or holding.

Runtime:
- Operating state and files that are used or changed while the program runs.

Execution:
- Flow that moves approved signal or plan toward order, commit, or production action.

Lifecycle Runtime Commit:
- Commit flow that records lifecycle state changes in Runtime Source of Truth.

Execution Runtime Commit:
- Commit flow that records execution result or execution state in Runtime Source of Truth.

## Usage Notes

- Do not invent terms such as Preview Executor without user approval.
- Do not interpret Real Executor as proof of completed Production connection.
- Do not use Review and Approval interchangeably.
- Do not use Validation and Verification interchangeably.
- Do not use Rollback and Lock Release interchangeably.
- Do not mix Stage and State in the same field.
- Do not change existing code names only because the glossary uses cleaner terminology.
