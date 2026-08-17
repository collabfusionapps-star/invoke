# Agentic Coding Framework

A reusable system for how to work with AI coding agents on any project — not tied to any one tech stack or app.

## What's here

| Folder | What it is |
|---|---|
| [`01-framework/`](01-framework/) | The methodology itself: roles, behavioral rules, session bootstrap, and the 10-phase project blueprint. |
| [`02-cheatsheet/`](02-cheatsheet/) | Practical Claude Code CLI reference + a background AI-terms glossary. |
| [`03-setup/`](03-setup/) | The `/init` scaffolding tool that copies this framework + the worked example into a new project. |
| [`04-worked-example/`](04-worked-example/) | A real, worked QA/Playwright example (SauceDemo checkout) showing the framework applied end-to-end — proof it works, not a second product. |
| [`_verification-log/`](_verification-log/) | Real, timestamped command output backing every "this works" claim below. |
| [`_archive/`](_archive/) | Superseded/redundant source material, kept for provenance, not active. |

## Start a session in 5 minutes

1. **New project, first time ever:** read [`01-framework/session-start-checklist.md`](01-framework/session-start-checklist.md) — it tells you whether to run `/init` first (see [`03-setup/setup-guide.md`](03-setup/setup-guide.md)) and where to go next.
2. **Kick off the actual work:** paste [`01-framework/master-prompt.md`](01-framework/master-prompt.md) into your AI session verbatim, or point the agent at [`01-framework/project-starter-kit.md`](01-framework/project-starter-kit.md) for the full 10-phase blueprint with templates.
3. **Every session after the first:** [`01-framework/session-start-checklist.md`](01-framework/session-start-checklist.md) is still your entry point — it routes you to `PROJECT_STATE.md`/`HANDOFF.md`/`TASK_BACKLOG.md` in your target project's `docs/` folder.
4. **Behavioral rules** (how the agent should act, what "verified" actually means): [`01-framework/global-rules.md`](01-framework/global-rules.md).

## What the agent is and isn't allowed to do unsupervised

Non-negotiable rules live in `01-framework/project-starter-kit.md`'s Final Rules section — the short version: never write code without a plan, never skip tests or documentation, never assume requirements, never store secrets in code, never treat something as "verified" without actually running it. See [`01-framework/global-rules.md`](01-framework/global-rules.md) for the full behavioral contract.

## How errors get diagnosed

Root cause first, in the input/context that produced the failure — not just a patch on the visible symptom. See the **Root-Cause-In-Context Principle** in [`01-framework/agents.md`](01-framework/agents.md#root-cause-in-context-principle).

## How work gets marked done

A task is done per `01-framework/project-starter-kit.md`'s `DEFINITION_OF_DONE.md` template (code quality, testing, documentation, security, deployment gates) — and per the **Agentic Continuity Principle**: if you handed the project to a brand-new AI agent right now with only its `docs/` folder, would it know exactly what to do next? If no, the session isn't over.

## The worked example

[`04-worked-example/`](04-worked-example/) is a complete, real run of the framework's agentic E2E QA pipeline against a live app (saucedemo.com) — user story → test plan → generated Playwright specs → executed + healed tests → audit report. Start with [`04-worked-example/how-this-example-applies-the-framework.md`](04-worked-example/how-this-example-applies-the-framework.md) to see exactly which framework rules it demonstrates.

## Verification

Every "works"/"passes" claim in this framework is backed by a real, logged command run — see [`_verification-log/`](_verification-log/). Anything not actually runnable in the environment that built this is marked `NOT YET VERIFIED` there, not silently assumed.
