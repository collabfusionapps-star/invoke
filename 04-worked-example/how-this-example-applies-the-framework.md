# How This Example Applies the Framework

This folder is a **worked example**, not a second product. It shows one concrete way to satisfy [`../01-framework/project-starter-kit.md`](../01-framework/project-starter-kit.md) Phase 7's QA strategy for a real application (the [SauceDemo](https://www.saucedemo.com) checkout flow) — read it side-by-side with that phase, not as a standalone tool.

## The chain: user story → test plan → specs → checkout flow

1. **User story** — [`user-stories/SCRUM-101-ecommerce-checkout[edit to applicable application].md`](user-stories/) is the bracket-named template: acceptance criteria with `[APP_URL]`/`[TEST_USERNAME]`/`[TEST_PASSWORD]` placeholders, meant to be copied and filled in per-application. The filled-in version that actually drove this example lives inside [`AgentE2EQAWorkflow-Playwright-main/user-stories/SCRUM-101-ecommerce-checkout.md`](AgentE2EQAWorkflow-Playwright-main/user-stories/SCRUM-101-ecommerce-checkout.md) (no brackets — a real, resolved story).
2. **Test plan** — [`AgentE2EQAWorkflow-Playwright-main/specs/saucedemo-checkout-test-plan.md`](AgentE2EQAWorkflow-Playwright-main/specs/saucedemo-checkout-test-plan.md), produced by the Playwright Test Planner agent (Step 2 of the workflow) exploring the live app and mapping every acceptance criterion to a numbered test scenario.
3. **Specs** — [`AgentE2EQAWorkflow-Playwright-main/tests/saucedemo-checkout/`](AgentE2EQAWorkflow-Playwright-main/tests/saucedemo-checkout/): five `.spec.ts` files, one per test-plan section (Step 4's 1:1 mapping rule) — `cart-review`, `checkout-information-validation`, `complete-checkout-flow`, `order-completion`, `order-overview`.
4. **Checkout flow, executed and reported** — [`AgentE2EQAWorkflow-Playwright-main/test-results/SCRUM-101-checkout-test-report.md`](AgentE2EQAWorkflow-Playwright-main/test-results/SCRUM-101-checkout-test-report.md) is Step 6's output: pass/fail status, defects log, coverage analysis, tying back to every AC in the original story.

## Which framework rules this demonstrates

| Framework rule (in `01-framework/`) | Where it shows up here |
|---|---|
| Phase 7's Agentic E2E QA Workflow (`project-starter-kit.md`) | [`TEMPLATE_prompt_workflow.md`](TEMPLATE_prompt_workflow.md) is the canonical, genericized version of this exact 9-step (0–8) pipeline. [`QAEnd2EndPromptFile.md`](QAEnd2EndPromptFile.md) is a worked transcript of the same pipeline hardcoded to SauceDemo/SCRUM-101 — useful to read as a concrete example, not as the template to copy. |
| The Audit Standard, Three-Layer Execution Model (`project-starter-kit.md`, Agentic Industry Standards) | [`test-results/audit/template-audit-report.md`](test-results/audit/template-audit-report.md) — Step 8's role-separated auditor pass, checked against the same criteria the standard defines: AC coverage, no hardcoded secrets, assertions beyond visibility checks, edge cases covered. |
| Verification Philosophy — verify by doing the real thing (`01-framework/global-rules.md`) | The Planner/Generator/Healer pipeline drives the actual SauceDemo UI via Playwright MCP browser tools, not mocked requests — the specs click real buttons and assert on real page state. |
| Root-Cause-In-Context Principle (`01-framework/agents.md`) | The Healer step (Step 5) is required to diagnose *why* a selector or assertion broke (stale locator, timing, app change) before patching it, and to escalate a pattern to `RISKS.md` if the same root cause recurs ≥3 times, rather than papering over each failure individually. |
| Zero Custom Infrastructure Rule | The entire feedback/monitoring layer is `qa-state.json` + `TELEMETRY_LOG.ndjson` + `.github/healing-patterns.json` — plain files, no telemetry service. |

## Known gaps in this worked example (found during reconciliation, not hidden)

- [`AgentE2EQAWorkflow-Playwright-main/README.md`](AgentE2EQAWorkflow-Playwright-main/README.md) is empty — there are no standalone run instructions inside that sub-folder; use [`../03-setup/setup-guide.md`](../03-setup/setup-guide.md) and the [Logical Dry-Run gate](../_verification-log/) instead.
- [`AgentE2EQAWorkflow-Playwright-main/specs/saucedemo-checkout-test-plan.md`](AgentE2EQAWorkflow-Playwright-main/specs/saucedemo-checkout-test-plan.md) references spec file paths under `tests/checkout/...`; the specs actually delivered live under `tests/saucedemo-checkout/...`. If you use this test plan as a template, update the "File:" paths to match wherever your generator actually writes files.

## Adapting this to your own application

Don't edit these files in place — copy the pattern:
1. Copy `user-stories/SCRUM-101-ecommerce-checkout[edit to applicable application].md` to a new `user-stories/[YOUR_STORY_ID].md` and fill it in for your app.
2. Copy `QA_CONFIG_TEMPLATE.json` → `qa-config.json`, fill in your selectors and test data.
3. Follow `TEMPLATE_prompt_workflow.md` (not `QAEnd2EndPromptFile.md`) as your prompt — it's the genericized, current version.
