# setup-guide.md — Scaffolding a New Project with `/init`

## Phase 0 — First time, new project

From this framework's root (`Agentic Coding Framework (FINAL)/`), scaffold into your target project:

```powershell
.\03-setup\init.ps1 -Target "C:\path\to\my-new-project"
```

Or double-click `03-setup\init.bat` and enter the path when prompted.

This will:

1. Copy the framework (`01-framework/`, `02-cheatsheet/`, `03-setup/`) and the QA worked example (`04-worked-example/`) into your project — the pre-built example run (`AgentE2EQAWorkflow-Playwright-main/`) and this repo's own `_archive/`/`_verification-log/` are stripped out, since they don't belong in a fresh project.
2. Create `04-worked-example/qa-config.json` from `QA_CONFIG_TEMPLATE.json` (ready to edit).
3. Create `04-worked-example/.env` from `.env.example` (ready to fill).
4. Initialize `04-worked-example/qa-state.json` + `TELEMETRY_LOG.ndjson`.
5. Launch `03-setup/scripts/install-playwright-agents.ps1` as admin (auto-elevates) → installs `@playwright/mcp` + runs `npx playwright init-agents`.

> ⚠️ Step 5 elevates via UAC and writes to your AI tool's global config file (`opencode.json` or Claude Desktop's `claude_desktop_config.json`). Review what it does (see the script) before running it for real.

## Phase 1 — Customize (edit these files in your project)

| File | What to fill |
|------|---------------|
| `04-worked-example/qa-config.json` | Story ID, URLs, selectors, test data |
| `04-worked-example/.env` | `APP_URL`, `TEST_USERNAME`, `TEST_PASSWORD` |
| `04-worked-example/user-stories/SCRUM-101-ecommerce-checkout[edit to applicable application].md` | Your actual acceptance criteria |

## Phase 2 — Run the workflow

In your AI tool, say:

> "I want to QA story SCRUM-101. Read `01-framework/session-start-checklist.md` and begin."

The agent reads `session-start-checklist.md` → sees the `/init` check → proceeds to Step 0 → Step 1 (read story) → ... → Step 8 (audit). Results logged to `qa-state.json` + `TELEMETRY_LOG.ndjson`.
