# agents.md — Methodology & File Structure

This framework follows the **Agentic Industry Standard Pattern** defined in [`project-starter-kit.md`](project-starter-kit.md).

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

**Start:** Read [`session-start-checklist.md`](session-start-checklist.md) → bootstrap.
**Work:** Follow [`project-starter-kit.md`](project-starter-kit.md) phases in order.
**End:** Write `HANDOFF.md`, update `PROJECT_STATE.md` (both live in your target project's `docs/` folder — see Phase 8 of `project-starter-kit.md`).

## Enforcement

- No code without a plan (Phase 9)
- No merge without documentation updates
- No session without a handoff
- No secrets in code — use `.env`
- No custom infrastructure for monitoring — files + MCP only

## Root-Cause-In-Context Principle

When something breaks — a script fails, a reference points at a moved file, an agent produces the wrong output — diagnose the root cause in the **input or context that produced it**, not just the symptom in front of you. Ask: what upstream file, instruction, or assumption was stale, missing, or wrong? Fix that, then let the downstream failure resolve as a consequence. Patching only the visible symptom (renaming a broken link without checking what else depends on the old name, silencing an error without understanding why it fired) leaves the same class of failure to resurface elsewhere.

## File Map

This is the layout of the framework itself (what you're reading now):

```
Agentic Coding Framework (FINAL)/
├── README.md                        ← Start here
├── 01-framework/
│   ├── agents.md                    ← This file
│   ├── global-rules.md              ← AI behavioral rules
│   ├── master-prompt.md             ← Pasteable session-kickoff prompt
│   ├── session-start-checklist.md   ← Bootstrap protocol (read this first, every session)
│   └── project-starter-kit.md       ← Master blueprint (10 phases + standards)
├── 02-cheatsheet/
│   ├── claude-code-cheatsheet.md
│   └── ai-glossary.md
├── 03-setup/
│   ├── init.bat / init.ps1          ← Scaffolds 04-worked-example/ into a target project
│   ├── scripts/
│   └── setup-guide.md
└── 04-worked-example/               ← QA/Playwright worked example
    ├── WORKFLOW_MANIFEST.json       ← QA pipeline definition
    ├── TEMPLATE_prompt_workflow.md  ← 9-step (0–8) QA prompt, canonical
    ├── QA_CONFIG_TEMPLATE.json      ← Config template for placeholders
    ├── qa-state.json                ← Cumulative QA state
    └── scripts/                     ← (legacy path — see 03-setup/scripts/)
```

In a **target project** you initialize with this framework, the layout is different: `PROJECT_STATE.md`, `HANDOFF.md`, `TASK_BACKLOG.md`, `DECISIONS.md`, `RISKS.md`, and the rest of the Phase 8 file registry live in that project's own `docs/` folder — see `project-starter-kit.md` Phase 8 for the full registry.
