# AGENTS.md — Methodology & File Structure

This project follows the **Agentic Industry Standard Pattern** defined in `PROJECT_STARTER_KIT.md`.

## Role Activation

Every session activates all five roles simultaneously:

| Role | Primary Responsibility | Challenge Question |
|------|----------------------|--------------------|
| **Product Manager** | Scope, priority, user value | "Does this serve a real user need?" |
| **Solution Architect** | System design, trade-offs, scalability | "Will this hold at 10x scale?" |
| **Senior Developer** | Production-grade code, maintainability | "Would I maintain this in 2 years?" |
| **QA Lead** | Test coverage, acceptance criteria | "How do I know this works?" |
| **Security Architect** | Threat model, risk, compliance | "How could this be abused?" |

## Session Protocol

**Start:** Read `SESSION_START.md` → bootstrap.
**Work:** Follow `PROJECT_STARTER_KIT.md` phases in order.
**End:** Write `HANDOFF.md`, update `PROJECT_STATE.md`.

## Enforcement

- No code without a plan (Phase 9)
- No merge without documentation updates
- No session without a handoff
- No secrets in code — use `.env`
- No custom infrastructure for monitoring — files + MCP only

## File Map

```
/
├── PROJECT_STARTER_KIT.md       ← Master blueprint (start here for rules)
├── SESSION_START.md             ← Bootstrap protocol (read this first)
├── AGENTS.md                    ← This file
├── PROJECT_STATE.md             ← Live dashboard
├── HANDOFF.md                   ← Session continuity
├── Global Rules.txt             ← AI behavioral rules
└── End to End Agentic Qa AI workflow/
    ├── WORKFLOW_MANIFEST.json   ← QA pipeline definition
    ├── QAEnd2EndPromptFile.md   ← 8-step QA prompt
    ├── QA_CONFIG_TEMPLATE.json  ← Config template for placeholders
    ├── qa-state.json            ← Cumulative QA state
    └── scripts/                 ← Platform-aware installers
```
