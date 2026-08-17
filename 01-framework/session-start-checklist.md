# session-start-checklist.md — Bootstrap Protocol

> Read this file FIRST at the start of every session. This is the single canonical bootstrap procedure — it replaces the two near-duplicate versions that used to exist (a standalone file and a copy embedded inside the starter kit).

## Procedure

```
0. CHECK  → does the target project already have this framework scaffolded?
             → no  → run /init (see 03-setup/setup-guide.md) to scaffold 04-worked-example/ into it
1. READ   → PROJECT_STATE.md   (target project's docs/ folder — current status, blockers, health)
2. READ   → HANDOFF.md         (target project's docs/ folder — last session's completed work, next steps)
3. READ   → TASK_BACKLOG.md    (target project's docs/ folder — pick next P0/P1 task)
4. READ   → 04-worked-example/qa-state.json   (only if QA work is planned)
```

## First Session

If `HANDOFF.md` does not exist in the target project:
- This is the **first session**.
- Begin at **Phase 1 — Discovery Interview** in [`project-starter-kit.md`](project-starter-kit.md) (or paste [`master-prompt.md`](master-prompt.md) to start the same interview conversationally).
- After completing the interview, populate `PROJECT_STATE.md` from the template in `project-starter-kit.md`.
- Do not skip to Phase 2 without Discovery being signed off.

## Subsequent Sessions

If `HANDOFF.md` exists:
- Resume from the **next recommended task** in `HANDOFF.md` section 6.
- Check `PROJECT_STATE.md` for any new blockers or health changes since the last session.
- If QA work is planned, read `04-worked-example/qa-state.json` for cumulative QA state.

## Rules

- If `HANDOFF.md` does not exist → this is the **first session**. Start at **Phase 1** of `project-starter-kit.md`.
- If `PROJECT_STATE.md` does not exist → create it from the template in `project-starter-kit.md`.
- Update `PROJECT_STATE.md` at the **start** and **end** of every session.
- Update `HANDOFF.md` at the **end** of every session.
- If `HANDOFF.md` exists, do **not** repeat Phase 1 — discovery only happens once; session continuity depends on respecting prior work.

## Key Files

| File | Purpose |
|------|---------|
| [`project-starter-kit.md`](project-starter-kit.md) | Master initialization framework (10 phases + standards) |
| `PROJECT_STATE.md` (target project) | Live project dashboard — session owner, health, blockers |
| `HANDOFF.md` (target project) | Session-to-session continuity — what was done, what's next |
| `TASK_BACKLOG.md` (target project) | All tasks, status, priorities |
| `DECISIONS.md` (target project) | Architecture Decision Records |
| [`../04-worked-example/WORKFLOW_MANIFEST.json`](../04-worked-example/WORKFLOW_MANIFEST.json) | QA workflow definition and entry point |
| [`../04-worked-example/qa-state.json`](../04-worked-example/qa-state.json) | Cumulative QA state across all runs |
