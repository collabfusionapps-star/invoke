# End-to-End QA Workflow with Natural Language
## Template — Replace [VARIABLES] before execution

> **Config file:** qa-config.json
> **User story:** user-stories/[STORY_ID].md
> **Platform loop:** [PLATFORM] (opencode | claude | vscode)

---

## STEP 0: Setup — Repository & Environment

Before executing the workflow, confirm the following:

### 0.1 Project Init (`/init`)

If this is a **fresh project** (no qa-config.json, no .env, no npm project):

1. Run `/init` from the starter pack root:
   ```powershell
   powershell.exe -File "path\to\starter-pack\init.ps1" -Target "path\to\your-project"
   ```
2. This scaffolds the QA workflow folder, creates `qa-config.json` and `.env` from templates, initializes state files, and installs Playwright agents (as admin).
3. Confirm `/init` completed successfully before proceeding.

### 0.2 Git Repository

Please provide your Git repository URL (or type "local only" to skip remote):

> Repository URL: **[GIT_REPO_URL]**
> Default branch: main
> Working directory: [current directory]

If no remote, Step 7 will create a local commit only.

### 0.3 Environment Variables

Check that `.env` exists in the project root with the following:

```env
APP_URL=https://your-app.com
TEST_USERNAME=your-username
TEST_PASSWORD=your-password
```

If `.env` is missing:
1. Copy `.env.example` → `.env`
2. Fill in your actual values
3. Confirm to proceed

> **Credentials will be read from `.env`, never hardcoded in scripts or config.**
>
> **If qa-config.json is missing, copy QA_CONFIG_TEMPLATE.json → qa-config.json and fill in your story values.**

---

## STEP 1: Read User Story

Prompt:
I need to start a new testing workflow. Please read the user story from the file:
user-stories/[STORY_ID].md

Summarize the key requirements, acceptance criteria, and testing scope.

Read credentials from `.env` (APP_URL, TEST_USERNAME, TEST_PASSWORD).

Expected Output:
- Summary of the user story
- List of acceptance criteria
- Application URL and test credentials (from .env)
- Key features to test

---

## STEP 2: Create Test Plan

Prompt:
Based on the user story [STORY_ID] that we just reviewed, use the playwright-test-planner agent to:
1. Read the application URL and test credentials from the user story
2. Explore the application and understand all workflows mentioned in the acceptance criteria
3. Create a comprehensive test plan that covers all acceptance criteria including:
   - Happy path scenarios
   - Negative scenarios (validation errors, empty fields, invalid data)
   - Edge cases and boundary conditions
   - Navigation flow tests
   - UI element validation
4. Save the test plan as: specs/[STORY_ID]-test-plan.md

Ensure each test scenario includes:
- Clear test case title
- Detailed step-by-step instructions
- Expected results for each step
- Test data requirements

Expected Output:
- Complete test plan markdown file saved to specs/
- Organized test scenarios with clear structure
- Browser exploration screenshots (if needed)

---

## STEP 3: Perform Exploratory Testing

Prompt:
Now I need to perform manual exploratory testing using Playwright MCP browser tools.

Please read the test plan from: specs/[STORY_ID]-test-plan.md

Then execute the test scenarios defined in that plan:
1. Use Playwright browser tools to manually execute each test scenario from the plan
2. Follow the step-by-step instructions in each test case
3. Verify expected results match actual results
4. Take screenshots at key steps and error states
5. Document your findings:
   - Test execution results for each scenario
   - Any UI inconsistencies or unexpected behaviors
   - Missing validations or bugs discovered
   - Screenshots as evidence

Expected Output:
- Manual test execution results
- Screenshots of the application at various states
- List of observations and findings
- Any issues discovered during exploration

---

## STEP 4: Generate Automation Scripts

Prompt:
Now I need to create automated test scripts using the playwright-test-generator agent.

Please review:
1. Test plan from: specs/[STORY_ID]-test-plan.md (for test scenarios and steps)
2. Exploratory testing results from Step 3 (for actual element selectors and UI insights)

Using insights from the manual exploratory testing:
- Leverage the element selectors and locators that were successfully used in Step 3
- Use stable element properties (IDs, data attributes, roles) discovered during exploration
- Apply wait strategies and UI behaviors observed during manual testing
- Incorporate any workarounds for UI quirks discovered

Generate one Playwright TypeScript spec file for every scenario section defined in the test plan.
The mapping must be 1:1 — each numbered section in the plan becomes its own `.spec.ts` file.

For example, if the test plan has sections 1.1 through 1.10, generate 10 spec files:
- specs/[STORY_ID]-test-plan.md  →  tests/[STORY_ID]/
  - Section 1.1: "Complete Checkout Flow"  →  complete-checkout-flow.spec.ts
  - Section 1.2: "Cart Review"             →  cart-review.spec.ts
  - ...one file per section.

Organize scripts into: tests/[STORY_ID]/
Use the test case names and steps from each section. Use reliable selectors and strategies from exploratory testing.

Requirements for all scripts:
- Follow Playwright best practices
- Include proper assertions using expect()
- Use descriptive test names matching the format in the test plan
- Use robust element selectors discovered during manual testing
- Use proper wait strategies based on actual application behavior
- Add proper test hooks (beforeEach, afterEach)
- Configure for multiple browsers (Chromium, Firefox, WebKit)

After generating the scripts, run the tests to verify they pass.

Expected Output:
- One spec file per test plan section in tests/[STORY_ID]/
- Scripts using robust selectors discovered during exploratory testing
- All scripts follow Playwright best practices
- Initial test generation complete

---

## STEP 5: Execute and Heal Automation Tests

Prompt:
Now I need to execute the generated automation scripts and heal any failures using the playwright-test-healer agent.

1. Run all automation scripts in: tests/[STORY_ID]/
2. Identify any failing tests
3. For each failing test, use the playwright-test-healer agent to:
   - Analyze the failure (selector issues, timing issues, assertion failures)
   - Auto-heal the test by fixing selectors, adding waits, or adjusting assertions
   - Update the test script with the fixes
4. Re-run the healed tests to verify they pass
5. Repeat the heal process until all tests are stable and passing
6. Document:
   - Initial test results (pass/fail count)
   - Healing activities performed
   - Final test results after healing
   - Any tests that couldn't be auto-healed

Expected Output:
- All automation tests executed
- Failing tests identified and healed using test-healer agent
- Healed test scripts updated in tests/[STORY_ID]/
- Final stable test execution results
- Summary of healing activities performed

---

## STEP 6: Create Test Report

Prompt:
Now I need to create a comprehensive test execution report based on manual testing, automation execution, and healing activities.

Please compile results from:
- Step 3: Manual exploratory testing results
- Step 4: Generated automation scripts
- Step 5: Automated test execution and healing results

Structure the report as: test-results/[STORY_ID]-test-report.md

Include:
1. Executive Summary
   - Total test cases planned
   - Test cases executed (manual + automated)
   - Overall Pass/Fail/Blocked status

2. Manual Test Results
   - Results from Step 3 exploratory testing
   - Screenshots and observations
   - Issues found during manual testing

3. Automated Test Results
   - Initial automation results from Step 5
   - Healing activities performed
   - Final test execution results after healing
   - Test suite execution summary
   - Pass/Fail count for each test suite

4. Defects Log
   - For any failed tests (manual or automated):
     - Bug ID
     - Severity (Critical/High/Medium/Low)
     - Title and Description
     - Steps to Reproduce
     - Expected vs Actual Behavior
     - Screenshots/Evidence
     - Environment Details

5. Test Coverage Analysis
   - Which acceptance criteria are covered
   - Coverage from manual vs automated tests
   - Any gaps in test coverage
   - Recommendations for additional testing

6. Summary and Recommendations
   - Overall quality assessment
   - Risk areas
   - Next steps

Expected Output:
- Comprehensive test execution report covering both manual and automated testing
- Clear PASS/FAIL status for all test scenarios
- Detailed bug reports for failures
- Complete test coverage analysis
- Evidence and screenshots attached

---

## STEP 7: Commit to Git Repository

Prompt:
Now I need to commit all the test artifacts to the Git repository using the GitHub MCP server.

Git Repository URL: [GIT_REPO_URL]

Please perform the following Git operations:
1. Initialize Git repository if not already initialized
2. Stage all files in the workspace (all new and modified files)
3. Create a commit with the message:
   "feat(tests): Add complete test suite for [STORY_ID] [STORY_TITLE]"
4. Push all changes to the Git repository
5. Provide a summary of what was committed

Expected Output:
- All workspace files committed to Git
- Descriptive commit message following conventional commit format
- Confirmation of successful push to the provided repository
- Summary of changes

---

---

## STEP 8: Audit

Prompt:
You are now an impartial auditor. Read all artifacts produced in Steps 1-7:

1. User story: user-stories/[STORY_ID].md
2. Test plan: specs/[STORY_ID]-test-plan.md
3. Generated scripts: tests/[STORY_ID]/*.spec.ts
4. Test report: test-results/[STORY_ID]-test-report.md
5. Healing patterns: .github/healing-patterns.json (if present)
6. Telemetry log: TELEMETRY_LOG.ndjson (if present — append-only, one JSON object per line)

Do not trust the process that produced these artifacts. Verify independently:

Verification checklist:
- [ ] Every acceptance criterion from the user story has >=1 test case in the test plan
- [ ] Every test plan section has a corresponding spec file (1:1 mapping)
- [ ] No hardcoded credentials, URLs, or secrets in spec files (use .env or process.env)
- [ ] Assertions exist beyond visibility checks (validate text, state, calculations)
- [ ] Edge cases are covered (empty states, validation errors, boundaries)
- [ ] Error paths are tested, not just happy paths
- [ ] Healing pattern bank does not have the same pattern >=3 times (escalation check)

If gaps found:
- Create corresponding tasks in TASK_BACKLOG.md under "QA Debt"
- Note severity (Low/Medium/High/Critical)

Write the audit report to: test-results/audit/audit-[STORY_ID].md

Expected Output:
- Independent audit report with pass/fail per checklist item
- List of gaps found (if any) with severity and recommended actions
- Tasks created in TASK_BACKLOG.md for any findings

---

## Complete Workflow Execution
## Single Combined Prompt

I want to demonstrate a complete end-to-end QA workflow using natural language and MCP servers.

STEP 0 - SETUP:
Confirm Git repository URL (or local only) and verify .env exists with APP_URL, TEST_USERNAME, TEST_PASSWORD.

STEP 1 - READ USER STORY:
First, read the user story from: user-stories/[STORY_ID].md
Provide a brief summary of what needs to be tested.

STEP 2 - CREATE TEST PLAN:
Use the playwright-test-planner agent to create a comprehensive test plan based on the user story. The agent should explore the application URL from the user story and cover all acceptance criteria. Save it as: specs/[STORY_ID]-test-plan.md

STEP 3 - EXPLORATORY TESTING:
Read the test plan from specs/[STORY_ID]-test-plan.md and use Playwright browser tools to manually execute each test scenario. Document findings with screenshots and note any issues discovered.

STEP 4 - GENERATE AUTOMATION SCRIPTS:
Review both the test plan (specs/[STORY_ID]-test-plan.md) and exploratory testing results from Step 3. Use the playwright-test-generator agent to create one spec file per scenario section in the test plan (1:1 mapping). Leverage element selectors and insights discovered during manual testing. Save scripts in tests/[STORY_ID]/.

STEP 5 - EXECUTE AND HEAL TESTS:
Run all automation scripts from tests/[STORY_ID]/. Use the playwright-test-healer agent to identify and auto-heal any failing tests. Re-run tests until all are stable and passing. Document healing activities.

STEP 6 - CREATE TEST REPORT:
Create a comprehensive test execution report at: test-results/[STORY_ID]-test-report.md
Compile results from Step 3 (manual testing), Step 4 (script generation), and Step 5 (execution and healing). Include PASS/FAIL status, healing summary, defects log, and test coverage analysis.

STEP 7 - COMMIT TO GIT:
Use the GitHub MCP agent to commit all new files with a descriptive message and push to the repository: [GIT_REPO_URL]

STEP 8 - AUDIT:
You are now an impartial auditor. Read all artifacts produced in Steps 1-7 (specs/, tests/, test-results/). Do not trust the process that produced them.
Verify: every AC has >=1 test, no hardcoded credentials, assertions exist beyond visibility checks, edge cases are covered.
Write findings to: test-results/audit/audit-[STORY_ID].md
If gaps found, create corresponding tasks in TASK_BACKLOG.md.

Execute this complete workflow and provide status updates after each step.
