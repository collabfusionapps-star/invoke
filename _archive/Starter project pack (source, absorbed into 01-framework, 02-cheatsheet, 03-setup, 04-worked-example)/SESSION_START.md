# Session Start — Bootstrap Protocol

> Read this file FIRST at the start of every session.

## Procedure

```
0. CHECK  → init.ps1 exists in root?         → project not initialized → RUN /init
1. READ    → PROJECT_STATE.md                (current status, blockers, health)
2. READ    → HANDOFF.md                      (last session's completed work, next steps)
3. READ    → TASK_BACKLOG.md                 (pick next P0/P1 task)
4. READ    → End to End Agentic Qa AI workflow/qa-state.json  (if QA work planned)
```

> **New project?** Run `/init` from the starter pack root to scaffold the QA workflow into your project:
> `powershell.exe -File "path\to\starter-pack\init.ps1" -Target "path\to\your-project"`

## Rules

- If `HANDOFF.md` does not exist → this is the **first session**. Start at **Phase 1** of `PROJECT_STARTER_KIT.md`.
- If `PROJECT_STATE.md` does not exist → create it from the template in `PROJECT_STARTER_KIT.md`.
- Update `PROJECT_STATE.md` at the **start** and **end** of every session.
- Update `HANDOFF.md` at the **end** of every session.

## Key Files

| File | Purpose |
|------|---------|
| `PROJECT_STARTER_KIT.md` | Master initialization framework (10 phases + standards) |
| `PROJECT_STATE.md` | Live project dashboard — session owner, health, blockers |
| `HANDOFF.md` | Session-to-session continuity — what was done, what's next |
| `TASK_BACKLOG.md` | All tasks, status, priorities |
| `DECISIONS.md` | Architecture Decision Records |
| `End to End Agentic Qa AI workflow/WORKFLOW_MANIFEST.json` | QA workflow definition and entry point |
| `End to End Agentic Qa AI workflow/qa-state.json` | Cumulative QA state across all runs |
