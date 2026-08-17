# PROJECT STARTER KIT
### Master Initialization & Continuity Framework — Agentic Edition
**Version:** v1.0 | **Last Updated:** 2026-06-08 | **Standard:** Agentic Industry Pattern

---

> **YOU ARE:** Principal Solution Architect · Product Manager · Senior Engineer · QA Lead · Security Architect · Technical Writer
>
> **FIRST RESPONSIBILITY:** Understand the project. Create foundational documentation. **Never write code first.**

---

## TABLE OF CONTENTS

1. [Mandatory Documentation Rule](#mandatory-documentation-rule)
2. [PROJECT_STATE.md — Live Dashboard](#project_statemd--live-dashboard)
3. [Phase 1 — Discovery Interview](#phase-1--discovery-interview)
4. [Phase 2 — PRODUCT_VISION.md](#phase-2--product_visionmd)
5. [Phase 3 — ARCHITECTURE.md](#phase-3--architecturemd)
6. [Phase 4 — TASK_BACKLOG.md](#phase-4--task_backlogmd)
7. [Phase 5 — Development Standards](#phase-5--development-standards)
8. [Phase 6 — RISKS.md & Security Review](#phase-6--risksmd--security-review)
9. [Phase 7 — TEST_STRATEGY.md](#phase-7--test_strategymd)
10. [Phase 8 — Agent Operating System (File Registry)](#phase-8--agent-operating-system-file-registry)
11. [Phase 9 — Implementation Mode Protocol](#phase-9--implementation-mode-protocol)
12. [Phase 10 — HANDOFF.md Continuity Mode](#phase-10--handoffmd-continuity-mode)
13. [DECISIONS.md — ADR Format](#decisionsmd--architecture-decision-records)
14. [DEFINITION_OF_DONE.md](#definition_of_donemd)
15. [DATA_MODEL.md](#data_modelmd)
16. [WORKFLOW_MAP.md](#workflow_mapmd)
17. [PERMISSION_MATRIX.md](#permission_matrixmd)
18. [AUDIT_TRAIL.md](#audit_trailmd)
19. [COMPLIANCE.md](#compliancemd)
20. [Final Rules — Non-Negotiable](#final-rules--non-negotiable)

---

## MANDATORY DOCUMENTATION RULE

> ⛔ **No task is complete until documentation is updated. This rule overrides all time pressure.**

Whenever **any** implementation, configuration, architecture, workflow, schema, API, or business logic changes:

| Step | Action | File |
|------|--------|------|
| 1 | Update all affected documentation | All relevant `.md` files |
| 2 | Update backlog to reflect task state | `TASK_BACKLOG.md` |
| 3 | Record any design decision made | `DECISIONS.md` |
| 4 | Update architecture if structure changed | `ARCHITECTURE.md` |
| 5 | Update project dashboard | `PROJECT_STATE.md` |
| 6 | Write handoff before ending session | `HANDOFF.md` |

**Enforcement:** A PR cannot be merged if any of the above files are stale relative to the code change.

---

## PROJECT_STATE.md — Live Dashboard

> 🔄 **Update this at the start AND end of every session.**

```
# Current Version
v0.7

# Last Updated
2026-06-08

# Session Owner
[Name / AI Session ID]

# Project Name
[Project Name]
```

### Completion Tracker

| Module / Feature | Status | Owner | Notes |
|-----------------|--------|-------|-------|
| Authentication | ✅ Complete | — | — |
| Document Upload | ✅ Complete | — | — |
| Version Control | ✅ Complete | — | — |
| OCR Pipeline | ⏳ In Progress | — | Vendor TBD |
| AI Summaries | ❌ Not Started | — | — |
| Workflow Automation | ❌ Not Started | — | — |

### Blockers

| Blocker | Impact | Required Action | Owner |
|---------|--------|-----------------|-------|
| OCR Vendor Selection | Blocks OCR Pipeline | Decision meeting required | [Owner] |

### Next Task

```
→ Implement OCR extraction service
   Entry point: src/services/ocr/OcrService.ts
   Dependencies: Vendor contract signed
   Estimated effort: 5 days
```

### Health Indicators

| Indicator | Status |
|-----------|--------|
| Test coverage | ⚠️ Below 80% |
| Open critical bugs | ✅ 0 |
| Stale documentation | ⚠️ ARCHITECTURE.md |
| Security scan | ✅ Passed |
| Last deployment | ✅ Staging — 2026-06-07 |

---

## PHASE 1 — DISCOVERY INTERVIEW

> 🎯 **Do not proceed to Phase 2 until all questions below are answered or explicitly deferred.**

### 1.1 Business Context

```
Q1.  What is the project name?
Q2.  What type of project is this? (Web app / API / Mobile / Data pipeline / AI agent / Other)
Q3.  What industry does this serve?
Q4.  Who are the primary users? (Internal staff / Customers / Partners / Public)
Q5.  What are the top 3 business goals this project must achieve?
Q6.  How will success be measured? (KPIs, OKRs, SLAs)
Q7.  Is there a revenue model? (SaaS / Transactional / Internal tooling / Other)
Q8.  What is the target go-live date?
Q9.  What is the project budget range?
Q10. Who are the key stakeholders and decision-makers?
```

### 1.2 Problem Definition

```
Q11. What problem is being solved in one sentence?
Q12. Why does it matter to the business RIGHT NOW?
Q13. What is the current manual or legacy process?
Q14. What are the top 3 pain points with the current process?
Q15. What is the risk/cost of NOT solving this?
Q16. Has this been attempted before? What failed?
```

### 1.3 User Personas

For each persona, capture:

```
Persona Name:
Role / Job Title:
Technical Level: (Non-technical / Semi-technical / Technical)
Primary Goal:
Biggest Frustration:
Usage Frequency: (Daily / Weekly / Ad-hoc)
Devices Used:
Accessibility Requirements:
```

### 1.4 Technical Context

```
Q17. What existing systems must this integrate with?
Q18. What APIs or third-party services are involved?
Q19. What are the existing data sources and formats?
Q20. What is the current hosting infrastructure? (Cloud / On-prem / Hybrid)
Q21. Is there a preferred cloud provider? (AWS / Azure / GCP / Other)
Q22. What are the security requirements? (SSO / MFA / Encryption at rest / In transit)
Q23. What compliance frameworks apply? (GDPR / HIPAA / PCI-DSS / POPIA / SOC2 / Other)
Q24. Are there performance SLAs? (Response time / Uptime / Throughput)
Q25. What is the expected user volume at launch and at scale?
Q26. Are there cost constraints per month on infrastructure?
```

### 1.5 Functional Requirements

```
Q27. List the MUST-HAVE features for MVP.
Q28. List the SHOULD-HAVE features for Phase 2.
Q29. List the COULD-HAVE features for future.
Q30. What is explicitly OUT OF SCOPE?
```

### 1.6 Non-Functional Requirements

| NFR | Target | Notes |
|-----|--------|-------|
| Response time (p95) | < 500ms | |
| Uptime SLA | 99.9% | |
| Max concurrent users | [TBD] | |
| Data retention | [TBD] | |
| RTO (Recovery Time Objective) | [TBD] | |
| RPO (Recovery Point Objective) | [TBD] | |
| Accessibility standard | WCAG 2.1 AA | |
| Max infrastructure cost | [TBD] /month | |

### Discovery Sign-Off

```
[ ] All questions answered or formally deferred
[ ] Personas documented
[ ] NFRs defined
[ ] Stakeholders identified
[ ] Signed off by: _____________ Date: _____________
```

---

## PHASE 2 — PRODUCT_VISION.md

> 📄 **Template. Replace all `[placeholders]` before Phase 3 begins.**

```markdown
# PRODUCT_VISION.md
Version: [x.x] | Date: [YYYY-MM-DD] | Owner: [Name]

## Executive Summary
[2–3 sentences. What this product is, who it serves, and what outcome it delivers.]

## Business Goals
| Goal | Metric | Target | Timeline |
|------|--------|--------|----------|
| [Goal 1] | [KPI] | [Value] | [Date] |
| [Goal 2] | [KPI] | [Value] | [Date] |
| [Goal 3] | [KPI] | [Value] | [Date] |

## User Personas
### Persona 1: [Name]
- Role: [Role]
- Goal: [Primary goal]
- Pain point: [Key frustration]
- Success looks like: [Outcome]

### Persona 2: [Name]
[Repeat structure]

## Problem Statement
[Precise articulation of the problem. Include current state, pain points, and cost of inaction.]

## Proposed Solution
[What the product does. How it solves the problem. Key differentiators.]

## Success Metrics
| Metric | Baseline | Target | Measurement Method |
|--------|----------|--------|--------------------|
| [Metric 1] | [Current] | [Goal] | [How measured] |

## Constraints
- Budget: [Amount]
- Timeline: [Date]
- Team size: [Number]
- Technology: [Any mandated stack]

## Assumptions
- [Assumption 1]
- [Assumption 2]

## Risks
| Risk | Probability | Impact | Mitigation |
|------|-------------|--------|------------|
| [Risk 1] | High/Med/Low | High/Med/Low | [Plan] |

## Out of Scope
- [Item 1]
- [Item 2]
```

---

## PHASE 3 — ARCHITECTURE.md

> 📐 **Template. Complete before any code is written.**

```markdown
# ARCHITECTURE.md
Version: [x.x] | Date: [YYYY-MM-DD] | Architect: [Name]

## Recommended Stack

| Layer | Technology | Version | Rationale |
|-------|-----------|---------|-----------|
| Frontend | [e.g. React + TypeScript] | [x.x] | [Why] |
| Backend | [e.g. Node.js / Python FastAPI] | [x.x] | [Why] |
| Database (Primary) | [e.g. PostgreSQL] | [x.x] | [Why] |
| Database (Cache) | [e.g. Redis] | [x.x] | [Why] |
| Authentication | [e.g. Auth0 / Supabase Auth] | [x.x] | [Why] |
| Storage | [e.g. S3 / Azure Blob] | — | [Why] |
| Message Queue | [e.g. Kafka / RabbitMQ / SQS] | — | [Why] |
| Search | [e.g. Elasticsearch / Typesense] | — | [Why] |
| Hosting | [e.g. AWS ECS / Vercel / AKS] | — | [Why] |
| Monitoring | [e.g. Datadog / Grafana + Prometheus] | — | [Why] |
| CI/CD | [e.g. GitHub Actions] | — | [Why] |
| IaC | [e.g. Terraform / Pulumi] | — | [Why] |

## Architecture Diagram

\`\`\`
┌─────────────────────────────────────────────────────────────┐
│                        CLIENT LAYER                         │
│              Web App (React/TS)  │  Mobile (React Native)   │
└─────────────────────┬───────────────────────────────────────┘
                      │ HTTPS / WSS
┌─────────────────────▼───────────────────────────────────────┐
│                      API GATEWAY                            │
│            Rate Limiting │ Auth │ Routing │ Logging         │
└──────┬──────────────┬───────────────┬────────────┬──────────┘
       │              │               │            │
┌──────▼───┐  ┌───────▼──┐  ┌────────▼──┐  ┌─────▼──────┐
│  Auth    │  │  Core    │  │  AI/Agent │  │  Worker    │
│ Service  │  │  API     │  │  Service  │  │  Service   │
└──────────┘  └───┬───┬──┘  └─────┬─────┘  └────┬───────┘
                  │   │           │               │
        ┌─────────▼─┐ │    ┌──────▼──────┐  ┌────▼────────┐
        │ Primary   │ │    │  Vector DB  │  │  Message    │
        │    DB     │ │    │ (Embeddings)│  │   Queue     │
        └───────────┘ │    └─────────────┘  └─────────────┘
                  ┌───▼───────┐
                  │   Cache   │
                  │  (Redis)  │
                  └───────────┘
\`\`\`

## Design Decisions

> See DECISIONS.md for full ADR entries. Summary:

| Decision | Chosen | Alternatives | Key Trade-off |
|----------|--------|-------------|---------------|
| [Decision 1] | [Choice] | [Alt A, Alt B] | [Trade-off] |
| [Decision 2] | [Choice] | [Alt A, Alt B] | [Trade-off] |

## Infrastructure & Deployment

\`\`\`
Environment     │ Region        │ Purpose
────────────────┼───────────────┼──────────────────
Production      │ [Region]      │ Live traffic
Staging         │ [Region]      │ Pre-release validation
Development     │ Local + CI    │ Feature development
\`\`\`

## Security Architecture
- All data encrypted in transit (TLS 1.3)
- All data encrypted at rest (AES-256)
- Secrets managed via [Vault / AWS Secrets Manager / Azure Key Vault]
- Network segmentation: public / private / data subnets
- Zero-trust service-to-service authentication
```

---

## PHASE 4 — TASK_BACKLOG.md

> 📋 **Template. Every epic → feature → task must be fully populated before sprint 1.**

```markdown
# TASK_BACKLOG.md
Version: [x.x] | Date: [YYYY-MM-DD] | PM: [Name]

## Backlog Legend
Priority: P0 = Blocker | P1 = Critical | P2 = High | P3 = Medium | P4 = Low
Status:   🔴 Not Started | 🟡 In Progress | 🟢 Complete | ⏸ Blocked | 🚫 Cancelled
Complexity: XS=1pt | S=2pt | M=3pt | L=5pt | XL=8pt | XXL=13pt

---

## MVP SCOPE

### EPIC-001: [Epic Name]
- **Objective:** [What this epic achieves]
- **Deliverables:** [Tangible outputs]
- **Dependencies:** [Other epics or external items]
- **Priority:** P[0-4]

#### FEAT-001-01: [Feature Name]
- **User Story:** As a [persona], I want to [action] so that [outcome].
- **Priority:** P[0-4]
- **Acceptance Criteria:**
  - [ ] [Criterion 1]
  - [ ] [Criterion 2]
  - [ ] [Criterion 3]

| Task ID | Description | Complexity | Effort | Depends On | Status | Owner |
|---------|-------------|------------|--------|------------|--------|-------|
| TASK-001-01-01 | [Description] | M | 3pts | — | 🔴 | — |
| TASK-001-01-02 | [Description] | S | 2pts | TASK-001-01-01 | 🔴 | — |

---

## PHASE 2 SCOPE

### EPIC-0XX: [Epic Name]
[Same structure as MVP]

---

## FUTURE SCOPE

| Feature | Business Value | Complexity | Notes |
|---------|----------------|------------|-------|
| [Feature] | [Value] | [XS–XXL] | [Notes] |

---

## BACKLOG HEALTH METRICS

| Metric | Value | Target |
|--------|-------|--------|
| Total story points (MVP) | [X] | — |
| Completed this sprint | [X] | [Sprint capacity] |
| Velocity (last 3 sprints) | [X pts/sprint] | — |
| Blocked items | [X] | 0 |
```

---

## PHASE 5 — DEVELOPMENT STANDARDS

### 5.1 Coding Standards

| Language | Standard | Linter | Formatter |
|----------|----------|--------|-----------|
| TypeScript | Strict mode enabled | ESLint + `@typescript-eslint` | Prettier |
| Python | PEP8 | Ruff | Black |
| SQL | Uppercase keywords | sqlfluff | — |
| CSS/SCSS | BEM naming | Stylelint | Prettier |

**Universal Rules:**
- Functions: single responsibility, max 40 lines
- Files: max 300 lines — split if exceeded
- No magic numbers — use named constants
- No commented-out code in main branch
- All public functions must have JSDoc / docstrings
- No `any` type in TypeScript without explicit comment justification

### 5.2 Naming Conventions

| Entity | Convention | Example |
|--------|-----------|---------|
| Files (TS) | PascalCase | `UserService.ts` |
| Files (Python) | snake_case | `user_service.py` |
| Components | PascalCase | `UserProfileCard` |
| Functions | camelCase | `getUserById()` |
| Constants | SCREAMING_SNAKE | `MAX_RETRY_COUNT` |
| DB tables | snake_case plural | `user_accounts` |
| DB columns | snake_case | `created_at` |
| Env vars | SCREAMING_SNAKE | `DATABASE_URL` |
| API endpoints | kebab-case | `/api/user-accounts` |
| Git branches | kebab-case | `feat/ocr-extraction` |

### 5.3 Folder Structure

```
project-root/
├── .github/
│   ├── workflows/          # CI/CD pipelines
│   └── PULL_REQUEST_TEMPLATE.md
├── docs/                   # All .md documentation lives here
│   ├── PROJECT_STATE.md
│   ├── ARCHITECTURE.md
│   ├── DECISIONS.md
│   ├── HANDOFF.md
│   ├── RISKS.md
│   └── ...
├── src/
│   ├── api/                # Route handlers / controllers
│   ├── services/           # Business logic (pure functions)
│   ├── repositories/       # Data access layer
│   ├── models/             # Data models / entities
│   ├── middleware/         # Auth, logging, error handling
│   ├── agents/             # AI agent definitions
│   ├── tools/              # Agent tool implementations
│   ├── prompts/            # LLM prompt templates (versioned)
│   ├── utils/              # Shared utilities
│   └── config/             # Environment config
├── tests/
│   ├── unit/
│   ├── integration/
│   ├── e2e/
│   └── fixtures/
├── infra/                  # IaC (Terraform / Pulumi)
├── scripts/                # Dev and ops scripts
└── docker-compose.yml
```

### 5.4 Error Handling Standards

```typescript
// ✅ CORRECT — structured error with context
class AppError extends Error {
  constructor(
    public code: string,       // e.g. "OCR_EXTRACTION_FAILED"
    public message: string,
    public statusCode: number,
    public context?: Record<string, unknown>
  ) { super(message); }
}

// All async functions must handle errors explicitly
const result = await ocrService.extract(document).catch((err) => {
  logger.error({ code: err.code, context: err.context }, err.message);
  throw new AppError("OCR_EXTRACTION_FAILED", "Extraction failed", 500, { documentId });
});
```

**Rules:**
- Never swallow errors silently (`catch {}` is banned)
- Every error must have a unique error code
- Errors must include context (IDs, inputs) for traceability
- User-facing errors must never expose stack traces or internal details
- All unhandled rejections and uncaught exceptions must be logged and alerted

### 5.5 Logging Standards

```typescript
// Structure: JSON logs only in production
logger.info({ event: "OCR_STARTED", documentId, userId }, "OCR extraction started");
logger.warn({ event: "RATE_LIMIT_HIT", endpoint, userId }, "Rate limit approached");
logger.error({ event: "DB_CONNECTION_FAILED", error: err.code }, "Database unreachable");
```

| Level | When to Use |
|-------|-------------|
| `debug` | Development only — verbose internal state |
| `info` | Normal operations — request received, job started/completed |
| `warn` | Degraded state — retry attempts, approaching limits |
| `error` | Operation failed — requires investigation |
| `fatal` | System cannot continue — immediate alert required |

**Never log:** Passwords, tokens, PII, credit card numbers, secret keys.

### 5.6 Git Workflow & Branching Strategy

```
main                    ← Production. Protected. Deployable at all times.
  └── staging           ← Pre-production. Auto-deploys to staging environment.
        └── develop     ← Integration branch. All features merge here first.
              ├── feat/[ticket-id]-[description]     ← New features
              ├── fix/[ticket-id]-[description]      ← Bug fixes
              ├── chore/[ticket-id]-[description]    ← Tooling, deps, config
              ├── docs/[ticket-id]-[description]     ← Documentation only
              ├── refactor/[ticket-id]-[description] ← Code restructure, no behaviour change
              └── hotfix/[ticket-id]-[description]   ← Emergency prod fix → branches from main
```

**Branch Rules:**
- Branch names must include ticket ID: `feat/TASK-001-01-01-ocr-service`
- `main` and `staging` require 2 approvals + all CI checks green
- `develop` requires 1 approval + all CI checks green
- No force-push to `main`, `staging`, or `develop`
- Branches must be deleted after merge

### 5.7 Pull Request Requirements

**PR Title format:** `[TYPE] TASK-XXX — Short description`

**PR must include:**
- [ ] Description of changes
- [ ] Link to ticket / task ID
- [ ] Screenshots / recordings (for UI changes)
- [ ] Test coverage report (no coverage decrease allowed)
- [ ] Documentation updated (or note explaining why not needed)
- [ ] No new linting errors
- [ ] All CI checks passing
- [ ] Security scan passing

**PR Template (`.github/PULL_REQUEST_TEMPLATE.md`):**

```markdown
## Summary
[What does this PR do?]

## Ticket
Closes TASK-XXX

## Type of Change
- [ ] New feature
- [ ] Bug fix
- [ ] Refactor
- [ ] Documentation
- [ ] Hotfix

## Testing Done
- [ ] Unit tests added/updated
- [ ] Integration tests added/updated
- [ ] Manually tested in dev environment

## Documentation Updated
- [ ] TASK_BACKLOG.md updated
- [ ] DECISIONS.md updated (if design decision made)
- [ ] ARCHITECTURE.md updated (if architecture changed)
- [ ] HANDOFF.md updated

## Screenshots
[If applicable]
```

### 5.8 Testing Standards

| Test Type | Coverage Target | Tool | When Run |
|-----------|----------------|------|----------|
| Unit | ≥ 80% line coverage | Jest / Pytest | Every commit |
| Integration | All API endpoints | Supertest / Pytest | Every PR |
| E2E | Critical user journeys | Playwright | Pre-merge to staging |
| Contract | All external APIs | Pact | Every PR |
| Performance | p95 response targets | k6 | Weekly + pre-release |
| Security | OWASP Top 10 | OWASP ZAP / Semgrep | Weekly + pre-release |

### 5.9 Documentation Standards

- All functions: JSDoc / docstring with `@param`, `@returns`, `@throws`
- All API endpoints: OpenAPI 3.x spec (auto-generated where possible)
- All `.md` files: updated before PR is merged
- README.md: must include setup, local run, test, and deploy instructions
- Changelog: maintained in `CHANGELOG.md` using Keep a Changelog format

---

## PHASE 6 — RISKS.md & Security Review

```markdown
# RISKS.md
Version: [x.x] | Date: [YYYY-MM-DD] | Security Architect: [Name]

## Risk Register

| ID | Category | Risk | Severity | Probability | Impact | Mitigation | Status | Owner |
|----|----------|------|----------|-------------|--------|-----------|--------|-------|
| RISK-001 | Auth | Token not invalidated on logout | Critical | High | High | Implement token blocklist / short TTL | Open | [Owner] |
| RISK-002 | AuthZ | IDOR — user accesses other user's data | Critical | Medium | High | Enforce row-level security on all queries | Open | [Owner] |
| RISK-003 | API | No rate limiting on public endpoints | High | High | High | Implement API gateway rate limiting | Open | [Owner] |
| RISK-004 | Data | PII logged in error traces | High | Medium | High | Add PII scrubbing middleware to logger | Open | [Owner] |
| RISK-005 | AI | Prompt injection via user input | High | High | High | Input sanitisation + output validation layer | Open | [Owner] |
| RISK-006 | AI | LLM hallucination in business logic | High | High | Critical | Never use raw LLM output for decisions — validate outputs | Open | [Owner] |
| RISK-007 | AI | Model output data leakage | High | Medium | Critical | Implement output filtering + context isolation per session | Open | [Owner] |
| RISK-008 | Infra | No DR plan | High | Low | Critical | Define RTO/RPO, implement automated backups + failover | Open | [Owner] |
| RISK-009 | Deps | Vulnerable third-party packages | Medium | High | High | Automated dependency scanning (Dependabot / Snyk) | Open | [Owner] |
| RISK-010 | Compliance | Data residency violation | Critical | Low | Critical | Confirm data regions match compliance requirements | Open | [Owner] |
```

### Threat Model (STRIDE)

| Threat | Vector | Control |
|--------|--------|---------|
| **Spoofing** | Forged identity tokens | JWT signature validation, short expiry, refresh rotation |
| **Tampering** | Modified API payloads | Input validation, schema enforcement, HMAC signatures |
| **Repudiation** | Denial of actions | Immutable audit log (append-only table or WORM storage) |
| **Information Disclosure** | Exposed PII in errors/logs | PII scrubbing, structured errors, field-level encryption |
| **Denial of Service** | API flood | Rate limiting, circuit breakers, autoscaling |
| **Elevation of Privilege** | Role bypass | RBAC enforced server-side, deny by default |

### AI-Specific Security Controls

| Risk | Control |
|------|---------|
| Prompt injection | Sanitise all user input before injection into prompts; use structured prompt templates |
| Indirect prompt injection | Validate all external content (documents, emails) before passing to agent |
| Agent tool misuse | Principle of least privilege on all tool definitions; require confirmation for destructive actions |
| LLM output as code | Never `eval()` LLM output; use structured output schemas with validation |
| Context window leakage | Isolate context per user session; never share memory across sessions without explicit permission |
| Model data exfiltration | Outbound filtering on agent responses; no raw DB access from agent layer |

---

## PHASE 7 — TEST_STRATEGY.md

```markdown
# TEST_STRATEGY.md
Version: [x.x] | Date: [YYYY-MM-DD] | QA Lead: [Name]

## Testing Philosophy
- Tests are first-class code. They are not optional.
- No feature ships without tests covering its acceptance criteria.
- Failing tests block deployment — no exceptions.

## Test Pyramid

          /‾‾‾‾‾‾‾\
         /   E2E    \        ← Few, slow, high confidence
        /─────────────\
       /  Integration  \     ← Moderate, test boundaries
      /─────────────────\
     /    Unit Tests     \   ← Many, fast, test logic
    /─────────────────────\

## Unit Testing Plan
- Framework: Jest (TS) / Pytest (Python)
- Target: ≥80% line coverage on all service and utility files
- Pattern: Arrange → Act → Assert
- Every business logic function has a unit test
- Every edge case and error path is tested
- Mocks used for: DB, external APIs, file system, time

## Integration Testing Plan
- All REST/GraphQL endpoints tested against real database (test container)
- Auth flows tested end-to-end (token issuance → protected route)
- Message queue publish/consume tested
- File upload/download flows tested
- External service integrations tested against sandbox environments

## UAT Plan
- Persona-based walkthroughs against acceptance criteria
- Conducted in staging environment with production-like data (anonymised)
- UAT sign-off required before promote-to-production
- UAT checklist generated from TASK_BACKLOG.md acceptance criteria

## Regression Plan
- Full suite runs on every PR to develop
- Subset (smoke tests) runs on every commit
- Regression failures are P0 blockers — no new work until resolved

## Performance Testing Plan
| Endpoint / Operation | p50 Target | p95 Target | p99 Target | Tool |
|---------------------|-----------|-----------|-----------|------|
| GET /api/[resource] | <100ms | <300ms | <500ms | k6 |
| POST /api/[resource] | <200ms | <500ms | <1000ms | k6 |
| File upload (10MB) | <2s | <5s | <10s | k6 |
| AI inference call | <3s | <8s | <15s | k6 |

## Security Testing Plan
- SAST: Semgrep / SonarQube — runs on every PR
- Dependency audit: npm audit / pip-audit — runs daily
- DAST: OWASP ZAP — runs weekly against staging
- Secrets scanning: GitLeaks — runs on every commit
- Penetration test: Annually or before major release

## Acceptance Criteria Standard

Every feature's AC must follow this format:

\`\`\`
Given [precondition]
When  [action]
Then  [expected outcome]
And   [additional outcome if needed]
\`\`\`

Example:
\`\`\`
Given a user is authenticated with the "editor" role
When  they upload a PDF document larger than 50MB
Then  the system rejects the upload with error code FILE_TOO_LARGE
And   a user-friendly message is displayed without exposing internal details
And   the rejection event is recorded in the audit log
\`\`\`

### Agentic E2E QA Workflow

> This project uses an **8-step AI-agent-driven E2E QA pipeline** powered by official Playwright Test Agents and Playwright MCP.
> The workflow lives in the adjacent folder `End to End Agentic Qa AI workflow/` (sibling to this file).

#### Overview

The agentic workflow converts a user story into committed, healed Playwright tests through 7 automated steps:

```
User Story → Test Plan → Manual Exploration → Script Generation → Execute & Heal → Report → Git Commit
```

Three official Playwright agents orchestrate the core steps:
| Agent | Role |
|-------|------|
| **🎭 Planner** | Explores the app, writes a Markdown test plan |
| **🎭 Generator** | Transforms plan into Playwright Test `.spec.ts` files |
| **🎭 Healer** | Runs tests, auto-heals failures, re-runs until stable |

#### Prerequisites

- Node.js installed
- Playwright MCP server (`@playwright/mcp`) configured in your MCP client
- GitHub MCP server configured with repo access
- AI tool with MCP support (OpenCode, Claude Code, VS Code)

#### Setup (Run Once Per Project)

```powershell
# Script auto-detects your platform (opencode/claude/vscode)
# and installs: @playwright/mcp + playwright init-agents
.\End to End Agentic Qa AI workflow\scripts\install-playwright-agents.ps1
```

```bash
# Bash equivalent
bash End\ to\ End\ Agentic\ Qa\ AI\ workflow/scripts/install-playwright-agents.sh
```

This generates agent definitions in `.github/` and configures MCP.

#### Per-Story Execution

For each story in `TASK_BACKLOG.md`:

1. **Configure:** Copy `QA_CONFIG_TEMPLATE.json` → `qa-config.json`, fill with the story's variables
2. **Secrets:** Ensure `.env` exists with `APP_URL`, `TEST_USERNAME`, `TEST_PASSWORD` — never hardcoded
3. **Place user story:** Write it in `user-stories/[STORY_ID].md`
4. **Trigger:** The AI agent discovers `WORKFLOW_MANIFEST.json`, hydrates the `TEMPLATE_prompt_workflow.md` from `qa-config.json`, executes Step 0 (GitHub + .env check), then runs the 8-step pipeline (Steps 1-7 + Step 8 Audit)
5. **Outputs produced:**
   - `specs/[STORY_ID]-test-plan.md` — test plan
   - `tests/[STORY_ID]/*.spec.ts` — Playwright spec files
   - `test-results/[STORY_ID]-test-report.md` — test report
   - `test-results/audit/audit-[STORY_ID].md` — independent audit report
   - Screenshots in `test-results/screenshots/`

#### Feedback Loop

| QA Workflow Output | Feeds Into | Update Trigger |
|---|---|---|
| Test failures / bugs | `RISKS.md` | Defects found during execution |
| Uncovered scenarios | `TASK_BACKLOG.md` | Gaps identified in coverage analysis |
| Pass rate / health | `PROJECT_STATE.md` | Health indicators update |
| Coverage thresholds | `DEFINITION_OF_DONE.md` | Criteria validation results |

#### Required MCP Servers

| Server | Configuration |
|--------|--------------|
| **@playwright/mcp** | `{ "command": "npx", "args": ["@playwright/mcp@latest"] }` |
| **github/github-mcp-server** | Standard GitHub MCP setup with `repo` scope token |

#### Reference

| Resource | Location |
|----------|----------|
| Workflow manifest | `End to End Agentic Qa AI workflow/WORKFLOW_MANIFEST.json` |
| Template prompt | `End to End Agentic Qa AI workflow/TEMPLATE_prompt_workflow.md` |
| Config template | `End to End Agentic Qa AI workflow/QA_CONFIG_TEMPLATE.json` |
| Example output | `End to End Agentic Qa AI workflow/AgentE2EQAWorkflow-Playwright-main/` |
| Playwright agents docs | https://playwright.dev/docs/test-agents |
| Playwright MCP docs | https://playwright.dev/mcp/introduction |

---

## PHASE 8 — AGENT OPERATING SYSTEM FILE REGISTRY

> 📁 **All files live in `/docs/`. All must exist before Phase 9 begins.**

| File | Owner Role | Update Trigger | Last Updated |
|------|-----------|----------------|--------------|
| `PROJECT_STATE.md` | PM | Every session | — |
| `PRODUCT_VISION.md` | PM | Scope change | — |
| `ARCHITECTURE.md` | Architect | Any structural change | — |
| `TECH_STACK.md` | Architect | New dependency added | — |
| `TASK_BACKLOG.md` | PM | Every task state change | — |
| `DECISIONS.md` | Architect | Any design decision | — |
| `DEFINITION_OF_DONE.md` | QA Lead | Process change | — |
| `TEST_STRATEGY.md` | QA Lead | New test type added | — |
| `HANDOFF.md` | All | End of every session | — |
| `RISKS.md` | Security Arch | New risk identified | — |
| `DATA_MODEL.md` | Architect | Schema change | — |
| `WORKFLOW_MAP.md` | PM + Architect | Process change | — |
| `PERMISSION_MATRIX.md` | Security Arch | Role change | — |
| `AUDIT_TRAIL.md` | Security Arch | Compliance change | — |
| `COMPLIANCE.md` | Security Arch | Regulatory change | — |

### Pre-Coding Checklist (Gate to Phase 9)

```
[ ] PRODUCT_VISION.md — complete and signed off
[ ] ARCHITECTURE.md — complete with diagram
[ ] TECH_STACK.md — complete with versions
[ ] DATA_MODEL.md — complete with ERD
[ ] WORKFLOW_MAP.md — complete with all flows
[ ] PERMISSION_MATRIX.md — complete with all roles
[ ] AUDIT_TRAIL.md — design approved
[ ] COMPLIANCE.md — requirements confirmed
[ ] RISKS.md — initial risk register populated
[ ] TASK_BACKLOG.md — MVP scope fully broken down
[ ] DEFINITION_OF_DONE.md — agreed by team
[ ] TEST_STRATEGY.md — approved by QA lead

Gate approval: _________________________ Date: _____________
```

---

## PHASE 9 — IMPLEMENTATION MODE PROTOCOL

> 🔧 **Every coding task follows this protocol without exception.**

### Pre-Task Checklist (Run before every task)

```
[ ] Requirements verified against TASK_BACKLOG.md acceptance criteria
[ ] Architecture verified — change does not violate ARCHITECTURE.md
[ ] Dependencies confirmed available
[ ] Risks identified and logged in RISKS.md if new
[ ] Implementation plan written (see template below)
```

### Implementation Plan Template

```markdown
## Implementation Plan: [TASK-XXX]

**Task:** [Description]
**Ticket:** TASK-XXX
**Estimated effort:** [X pts]

### Approach
[How will this be implemented? Which files, services, patterns?]

### Reasoning
[Why this approach? What alternatives were considered?]

### Risks
[What could go wrong? What is the mitigation?]

### Steps
1. [Step 1]
2. [Step 2]
3. [Step 3]

### Definition of Done
- [ ] Code written and peer-reviewed
- [ ] Unit tests written and passing (≥80% coverage)
- [ ] Integration tests passing
- [ ] Documentation updated
- [ ] TASK_BACKLOG.md updated
- [ ] No linting errors
- [ ] Security scan passing
```

### Agentic Task Execution Loop

```
FOR EACH TASK:
  1. READ   → task acceptance criteria from TASK_BACKLOG.md
  2. PLAN   → write implementation plan
  3. VERIFY → confirm plan against ARCHITECTURE.md and RISKS.md
  4. CODE   → write production-grade code
  5. TEST   → write and run tests (unit + integration)
  6. REVIEW → self-review against DEFINITION_OF_DONE.md
  7. DOC    → update all affected documentation
  8. LOG    → update TASK_BACKLOG.md task status
  9. COMMIT → meaningful commit message with task ID
 10. NEXT   → pick next task or raise blocker

NEVER skip steps 4–8.
NEVER proceed if step 2 or 3 reveals a blocker — resolve first.
```

---

## PHASE 10 — HANDOFF.md CONTINUITY MODE

> 🔁 **Generate at the end of every session. A new session must resume from this alone.**

```markdown
# HANDOFF.md
Session: [YYYY-MM-DD] — [Session ID]
Project: [Project Name]
Version: [x.x]

---

## 1. Completed This Session
- [TASK-XXX] — [Description] — Files: [list]
- [TASK-XXX] — [Description] — Files: [list]

## 2. In Progress
- [TASK-XXX] — [Current state] — Next micro-step: [exact next action]

## 3. Blockers
| Blocker | Impact | Required | Owner |
|---------|--------|----------|-------|
| [Blocker] | [Blocked tasks] | [Decision/Resource needed] | [Owner] |

## 4. Decisions Made This Session
| Decision | Rationale | ADR Ref |
|----------|-----------|---------|
| [Decision] | [Why] | ADR-XXX |

## 5. Files Modified
| File | Nature of Change |
|------|-----------------|
| [path/to/file] | [What changed] |

## 6. Next Recommended Tasks (in order)
1. [TASK-XXX] — [Why this first]
2. [TASK-XXX] — [Why this second]
3. [TASK-XXX] — [Why this third]

## 7. Risks Identified This Session
| Risk | Severity | Logged in RISKS.md |
|------|----------|--------------------|
| [Risk] | High/Med/Low | [ ] Yes / [ ] No |

## 8. Context Future Sessions Must Know
- [Critical assumption or constraint]
- [Non-obvious technical decision]
- [Stakeholder context]
- [Environment quirk]

## 9. Environment State
- Branch: [current branch]
- Last commit: [hash + message]
- Deployment state: [deployed to / not deployed]
- Test coverage: [X%]
- Open PRs: [list]

---
> ⚠️ This file was updated: [YYYY-MM-DD HH:MM] — Do not start a new session without reading this.
```

---

## DECISIONS.md — Architecture Decision Records

> 📝 **One ADR per significant decision. Never delete — supersede instead.**

```markdown
# DECISIONS.md
Version: [x.x] | Date: [YYYY-MM-DD]

---

## ADR-001: [Decision Title]

**Date:** [YYYY-MM-DD]
**Status:** Accepted | Superseded by ADR-XXX | Deprecated
**Deciders:** [Names / roles]

### Context
[What situation or requirement forced this decision? What were the constraints?]

### Decision
[What was decided, stated clearly.]

### Alternatives Considered
| Option | Pros | Cons | Reason Rejected |
|--------|------|------|-----------------|
| [Option A] | [Pros] | [Cons] | [Why not chosen] |
| [Option B] | [Pros] | [Cons] | [Why not chosen] |

### Consequences
**Positive:**
- [Benefit 1]

**Negative / Trade-offs:**
- [Trade-off 1]

**Risks:**
- [Risk 1] → Mitigation: [Plan]

---

## ADR-002: [Next Decision]
[Same structure]
```

---

## DEFINITION_OF_DONE.md

```markdown
# DEFINITION_OF_DONE.md
Version: [x.x] | Date: [YYYY-MM-DD] | QA Lead: [Name]

## A Task is DONE when ALL of the following are true:

### Code Quality
- [ ] Code reviewed and approved by ≥1 peer (≥2 for security-sensitive code)
- [ ] No linting errors or warnings
- [ ] No TypeScript `any` types without documented justification
- [ ] No commented-out code
- [ ] Functions ≤40 lines, files ≤300 lines (or exception documented)

### Testing
- [ ] Unit tests written covering all logic paths
- [ ] Unit test coverage ≥80% for changed files
- [ ] Integration tests written for all new API endpoints
- [ ] All existing tests still passing
- [ ] Edge cases and error paths tested

### Documentation
- [ ] All public functions have JSDoc / docstrings
- [ ] API endpoints documented in OpenAPI spec
- [ ] TASK_BACKLOG.md — task marked complete
- [ ] DECISIONS.md — updated if design decision was made
- [ ] ARCHITECTURE.md — updated if architecture changed
- [ ] HANDOFF.md — updated before session ends

### Security
- [ ] No secrets or PII in code or logs
- [ ] Input validation on all user-facing inputs
- [ ] SAST scan passing
- [ ] Dependency audit passing

### Deployment
- [ ] Feature flag implemented if required
- [ ] Environment variables documented in `.env.example`
- [ ] Migration scripts tested on a copy of production data (for DB changes)
- [ ] Rollback plan documented for high-risk changes

## A Feature is DONE when:
- [ ] All tasks within the feature are done (per above)
- [ ] All acceptance criteria from TASK_BACKLOG.md are verified
- [ ] UAT completed and signed off
- [ ] No P0 or P1 bugs open against this feature

## A Release is DONE when:
- [ ] All MVP features are done
- [ ] Performance targets met (p95 benchmarks)
- [ ] Security penetration test passed
- [ ] Compliance sign-off obtained
- [ ] Runbook documented
- [ ] Monitoring and alerting verified in production
- [ ] Rollback procedure tested
```

---

## DATA_MODEL.md

```markdown
# DATA_MODEL.md
Version: [x.x] | Date: [YYYY-MM-DD] | Architect: [Name]

> ⚠️ MANDATORY PRE-CODING ARTIFACT. No database schema may be created without this document being approved.

## Entity Relationship Diagram (ERD)

\`\`\`
[users] ────────< [sessions]
   |
   └──────────< [documents]
                    |
                    └──────< [document_versions]
                    |
                    └──────< [audit_logs]
\`\`\`

## Entity Definitions

### users
| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| id | UUID | PK, NOT NULL | Primary key |
| email | VARCHAR(255) | UNIQUE, NOT NULL | User email |
| role | ENUM | NOT NULL | User role (see PERMISSION_MATRIX.md) |
| created_at | TIMESTAMPTZ | NOT NULL, DEFAULT NOW() | Creation timestamp |
| updated_at | TIMESTAMPTZ | NOT NULL | Last update timestamp |
| deleted_at | TIMESTAMPTZ | NULL | Soft delete timestamp |

### [entity_name]
| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| id | UUID | PK, NOT NULL | |
| [column] | [type] | [constraints] | [description] |

## Indexing Strategy
| Table | Index | Type | Reason |
|-------|-------|------|--------|
| users | email | UNIQUE B-TREE | Login lookup |
| audit_logs | (entity_id, created_at) | COMPOSITE B-TREE | Audit queries |

## Data Lifecycle
| Entity | Retention | Archive Strategy | Deletion |
|--------|-----------|-----------------|----------|
| users | Indefinite | — | Soft delete |
| audit_logs | 7 years | Cold storage after 1 year | Never deleted |
| sessions | 30 days | — | Hard delete on expiry |

## PII Fields
| Table | Column | PII Type | Encryption |
|-------|--------|----------|------------|
| users | email | Contact | At rest (AES-256) |
| users | name | Identity | At rest (AES-256) |

## Migration Strategy
- All schema changes via versioned migration files
- Migration files: `YYYYMMDDHHMMSS_description.sql`
- Never modify existing migrations — create new ones
- Migrations must be tested against production data copy before deployment
- Rollback migration required for every forward migration
```

---

## WORKFLOW_MAP.md

```markdown
# WORKFLOW_MAP.md
Version: [x.x] | Date: [YYYY-MM-DD] | PM + Architect: [Name]

> ⚠️ MANDATORY PRE-CODING ARTIFACT. Every user-facing and system workflow must be mapped before coding begins.

## Workflow Index
| ID | Workflow | Type | Status |
|----|---------|------|--------|
| WF-001 | User Registration & Onboarding | User-facing | [Draft/Approved] |
| WF-002 | Authentication & Session Management | System | [Draft/Approved] |
| WF-003 | [Core Feature Workflow] | User-facing | [Draft/Approved] |
| WF-004 | Error & Recovery Flow | System | [Draft/Approved] |
| WF-005 | AI Agent Execution Flow | System | [Draft/Approved] |

---

## WF-001: User Registration & Onboarding

\`\`\`
User                    System                    Email Service
 |                        |                            |
 |── Enter email ────────>|                            |
 |                        |── Validate format          |
 |                        |── Check duplicate          |
 |                        |── Create user (inactive)   |
 |                        |── Send verification ──────>|
 |                        |                            |── Send email
 |<── Show "check email" ─|                            |
 |                        |                            |
 |── Click verify link ──>|                            |
 |                        |── Validate token           |
 |                        |── Activate user            |
 |<── Redirect to app ────|                            |
\`\`\`

**Happy path:** [Description]
**Error paths:**
- Duplicate email → Return error `EMAIL_ALREADY_EXISTS`
- Invalid token → Return error `INVALID_VERIFICATION_TOKEN`
- Expired token → Allow resend

---

## WF-005: AI Agent Execution Flow

\`\`\`
User Input
    │
    ▼
Input Validation & Sanitisation
    │
    ▼
Context Assembly (retrieve memory, tools, permissions)
    │
    ▼
Agent Orchestrator
    ├── Tool Selection
    │       ├── Tool A (read-only)  → Execute → Validate Output
    │       ├── Tool B (write)      → Confirm → Execute → Validate Output
    │       └── Tool C (external)  → Auth Check → Execute → Validate Output
    │
    ▼
Output Validation (schema, safety filter, PII scrub)
    │
    ▼
Response to User + Audit Log Entry
\`\`\`

**Guardrails:**
- All tool calls logged in audit trail
- Destructive actions require explicit user confirmation
- Output passes through safety filter before delivery
- Session context isolated — no cross-session leakage
```

---

## PERMISSION_MATRIX.md

```markdown
# PERMISSION_MATRIX.md
Version: [x.x] | Date: [YYYY-MM-DD] | Security Architect: [Name]

> ⚠️ MANDATORY PRE-CODING ARTIFACT. Deny by default. Grant explicitly.

## Roles
| Role | Description |
|------|-------------|
| `super_admin` | Full system access. Internal only. |
| `admin` | Organisation-level management. |
| `editor` | Create and modify content. |
| `viewer` | Read-only access. |
| `service` | Machine-to-machine. Scoped per service. |

## Permission Matrix

| Resource | Action | super_admin | admin | editor | viewer | service |
|----------|--------|:-----------:|:-----:|:------:|:------:|:-------:|
| Users | Create | ✅ | ✅ | ❌ | ❌ | ❌ |
| Users | Read (own) | ✅ | ✅ | ✅ | ✅ | ❌ |
| Users | Read (any) | ✅ | ✅ | ❌ | ❌ | ❌ |
| Users | Update (own) | ✅ | ✅ | ✅ | ✅ | ❌ |
| Users | Update (any) | ✅ | ✅ | ❌ | ❌ | ❌ |
| Users | Delete | ✅ | ❌ | ❌ | ❌ | ❌ |
| Documents | Create | ✅ | ✅ | ✅ | ❌ | ✅ |
| Documents | Read (own) | ✅ | ✅ | ✅ | ✅ | ✅ |
| Documents | Read (any) | ✅ | ✅ | ❌ | ❌ | ❌ |
| Documents | Update | ✅ | ✅ | ✅ | ❌ | ✅ |
| Documents | Delete | ✅ | ✅ | ❌ | ❌ | ❌ |
| Audit Logs | Read | ✅ | ✅ | ❌ | ❌ | ❌ |
| Audit Logs | Export | ✅ | ❌ | ❌ | ❌ | ❌ |
| System Config | Manage | ✅ | ❌ | ❌ | ❌ | ❌ |

## Enforcement Rules
1. All permissions enforced **server-side** — client UI is cosmetic only
2. Row-level security enforced at database layer for multi-tenant data
3. Service accounts scoped to minimum required permissions
4. Permission checks logged in audit trail for sensitive operations
5. Role assignment requires approval from `admin` or above
6. Roles reviewed quarterly — unused roles revoked

## Sensitive Operations (require elevated confirmation)
| Operation | Confirmation Required |
|-----------|----------------------|
| Delete user | Admin + 2FA confirmation |
| Export audit logs | Admin + logged reason |
| Change user role | Admin approval |
| Deploy to production | 2 approvals + CI pass |
```

---

## AUDIT_TRAIL.md

```markdown
# AUDIT_TRAIL.md
Version: [x.x] | Date: [YYYY-MM-DD] | Security Architect: [Name]

> ⚠️ MANDATORY PRE-CODING ARTIFACT. Audit trail is immutable. Design before any data layer is built.

## Audit Requirements
- All state-changing operations must generate an audit event
- Audit log is append-only — no update or delete permitted
- Audit records retained for minimum 7 years (or as required by compliance)
- Audit log must be queryable by: entity, actor, action, date range

## Audit Event Schema

\`\`\`json
{
  "id":           "uuid",
  "timestamp":    "ISO 8601 with timezone",
  "actor_id":     "uuid — user or service account that performed action",
  "actor_type":   "user | service",
  "actor_ip":     "IP address (hashed if required by compliance)",
  "session_id":   "uuid",
  "action":       "CREATED | UPDATED | DELETED | ACCESSED | EXPORTED | LOGIN | LOGOUT | FAILED_LOGIN",
  "entity_type":  "user | document | config | ...",
  "entity_id":    "uuid",
  "changes":      { "field": { "before": "value", "after": "value" } },
  "metadata":     { "user_agent": "...", "request_id": "..." },
  "outcome":      "SUCCESS | FAILURE",
  "failure_reason": "string | null"
}
```

## Audited Operations

| Operation | Actor | Entity | Fields Captured |
|-----------|-------|--------|----------------|
| User login | User | Session | IP, user_agent, outcome |
| User created | Admin | User | All fields (excl. password) |
| Role changed | Admin | User | role.before, role.after |
| Document uploaded | User | Document | name, size, type |
| Document deleted | User/Admin | Document | name, deleted_by |
| Permission changed | Admin | Resource | permission.before, after |
| Config changed | Super Admin | Config | key, value.before, after |
| Audit log exported | Admin | AuditLog | date_range, exported_by |

## Storage & Integrity

| Property | Implementation |
|----------|---------------|
| Storage | Separate, append-only audit database or WORM storage |
| Integrity | Each record hash-chained to previous (tamper detection) |
| Access | Read-only for `admin`, export requires `super_admin` |
| Backup | Daily backup, separate from primary database |
| Encryption | AES-256 at rest |
```

---

## COMPLIANCE.md

```markdown
# COMPLIANCE.md
Version: [x.x] | Date: [YYYY-MM-DD] | Security Architect + Legal: [Name]

> ⚠️ MANDATORY PRE-CODING ARTIFACT. Confirm applicable frameworks before architecture is finalised.

## Applicable Frameworks

| Framework | Applies | Scope | Owner | Review Date |
|-----------|---------|-------|-------|-------------|
| POPIA (South Africa) | [ ] Yes / [ ] No | [Scope] | [Owner] | [Date] |
| GDPR (EU) | [ ] Yes / [ ] No | [Scope] | [Owner] | [Date] |
| HIPAA (US Healthcare) | [ ] Yes / [ ] No | [Scope] | [Owner] | [Date] |
| PCI-DSS (Payments) | [ ] Yes / [ ] No | [Scope] | [Owner] | [Date] |
| SOC 2 Type II | [ ] Yes / [ ] No | [Scope] | [Owner] | [Date] |
| ISO 27001 | [ ] Yes / [] No | [Scope] | [Owner] | [Date] |

## Data Classification

| Classification | Definition | Examples | Handling |
|---------------|------------|---------|---------|
| Public | Non-sensitive, publicly available | Marketing content | No restriction |
| Internal | Business data, not public | Reports, configs | Access control |
| Confidential | Sensitive business data | Financials, contracts | Encryption + ACL |
| Restricted | PII, regulated data | User ID, health data | Encryption + audit + consent |

## Privacy Requirements

| Requirement | Implementation | Status |
|-------------|---------------|--------|
| Data minimisation | Collect only what is needed for stated purpose | [ ] |
| Consent management | Explicit consent captured and stored with timestamp | [ ] |
| Right to access | User can request all their data within 30 days | [ ] |
| Right to erasure | User can request deletion — anonymise where retention required | [ ] |
| Data portability | User can export their data in machine-readable format | [ ] |
| Breach notification | Notify regulator within 72 hours of confirmed breach | [ ] |
| Data residency | Data stored in [Region] — confirm matches compliance requirement | [ ] |
| Privacy by design | Privacy controls built-in, not bolted on | [ ] |

## Third-Party Processors

| Vendor | Data Shared | Basis | DPA Signed | Review Date |
|--------|-------------|-------|------------|-------------|
| [Vendor] | [Data types] | [Legal basis] | [ ] Yes / [ ] No | [Date] |

## Compliance Sign-Off

\`\`\`
Framework reviewed by:  _________________________
Legal sign-off:         _________________________
Date:                   _________________________
Next review:            _________________________
\`\`\`
```

---

## SESSION START PROTOCOL

> Every new session (new chat, new AI process) must follow this protocol. This is the bootstrap procedure that satisfies the Agentic Continuity Principle.

### Procedure

```
1. READ    → SESSION_START.md         (bootstrap file at project root)
2. READ    → PROJECT_STATE.md         (current status, blockers, health)
3. READ    → HANDOFF.md               (last session's completed work, next steps)
4. READ    → TASK_BACKLOG.md          (pick next P0/P1 task)
```

### First Session

If `HANDOFF.md` does not exist:
- This is the **first session**.
- Begin at **Phase 1 — Discovery Interview** of this document.
- After completing the interview, populate `PROJECT_STATE.md` from the template.
- Do not skip to Phase 2 without Discovery being signed off.

### Subsequent Sessions

If `HANDOFF.md` exists:
- Resume from the **next recommended task** in HANDOFF.md section 6.
- Check PROJECT_STATE.md for any new blockers or health changes since the last session.
- If QA work is planned, read `End to End Agentic Qa AI workflow/qa-state.json` for cumulative QA state.

### Key Enforcement Rules

| Rule | Why |
|------|-----|
| Read `SESSION_START.md` first | It tells the agent where to find everything — no guesswork |
| Update `PROJECT_STATE.md` at start AND end | Ensures health indicators are never stale |
| Write `HANDOFF.md` at end of every session | Next session resumes from here — this is the contract |
| If `HANDOFF.md` exists, do NOT repeat Phase 1 | Discovery only happens once — session continuity depends on respecting prior work |

---

## AGENTIC INDUSTRY STANDARDS

> This section codifies the emerging industry consensus for agentic workflow execution. These standards apply across all phases — not just QA.

### Three-Layer Execution Model

Every agentic workflow must have these three layers. They are not optional.

```
┌─────────────────────────────────────────────────────┐
│           1. EXECUTION LAYER                         │
│   The agentic workflow itself (Steps 1–7 in QA)     │
│   - Produces artifacts (specs, plans, reports)       │
│   - Emits structured status after each step          │
└─────────────────────────────────────────────────────┘
        │ emits step-level status
        ▼
┌─────────────────────────────────────────────────────┐
│           2. FEEDBACK LAYER                           │
│   The healer IS the monitor — no separate infra      │
│   - Healer detects failures, analyzes root cause,    │
│     applies fix, appends to pattern bank             │
│   - Pattern bank: .github/healing-patterns.json      │
│   - Escalate: same pattern ≥3 runs → flag in RISKS   │
│   - Stop: healer fails ≥3 attempts on one test →     │
│     skip, flag for human review, do not infinite-loop│
└─────────────────────────────────────────────────────┘
        │ feeds patterns + unresolved failures
        ▼
┌─────────────────────────────────────────────────────┐
│           3. AUDIT LAYER                              │
│   Separate persona pass — not separate infra         │
│   - Same AI tool, same MCPs, different instruction   │
│   - Auditor reads all artifacts, does NOT trust      │
│     the process that produced them                   │
│   - Writes audit report to test-results/audit/       │
│   - If gaps found → creates tasks in TASK_BACKLOG.md │
└─────────────────────────────────────────────────────┘
```

### Monitoring Standard

| Principle | Practice |
|-----------|----------|
| **The healer is the monitor** | No separate telemetry stack, no metrics server, no custom dashboards. The healer agent that detects and fixes failures IS the observability layer. |
| **Structured step output** | After each step, append one JSON line to `TELEMETRY_LOG.ndjson` — step, agent, status, duration_ms, output_artifact, error. Never truncate — rotate after 1000 lines. This is the only telemetry artifact. |
| **Fail fast** | If a step fails with no recoverable path, stop the pipeline and write a clear error to the log. Do not retry blindly. |

### Patching Standard

| Principle | Practice |
|-----------|----------|
| **Pattern bank** | Every healer fix appends to `.github/healing-patterns.json` — original selector, fixed selector, root cause, timestamp. |
| **Escalation threshold** | Same pattern ≥3 occurrences across different runs → human flag in `RISKS.md`. |
| **Abort threshold** | Healer fails ≥3 consecutive attempts on the same test → stop, skip test, flag in `TASK_BACKLOG.md` as tech debt. Do not infinite-loop. |
| **Flakiness tracking** | If a healed test breaks again in a subsequent run → mark as flaky, disable from CI, assign human to rewrite. Do not re-heal the same test more than once across runs. |

### Audit Standard

| Principle | Practice |
|-----------|----------|
| **Role separation** | The audit pass is a different persona, not a different tool. The same AI is instructed: "You are now an impartial auditor. Do not trust the producer." |
| **Every run is audited** | No execution is complete without an audit pass. The audit is Step 8 of the QA workflow — not optional. |
| **Audit scope** | Coverage: every AC has ≥1 test. No hardcoded secrets. Assertions exist beyond visibility checks. Edge cases are covered (empty, error, boundary states). |
| **Audit output** | `test-results/audit/audit-[STORY_ID].md`. If gaps found, corresponding tasks are created in `TASK_BACKLOG.md`. |

### Feedback Loop Standard

| Principle | Practice |
|-----------|----------|
| **Updates are file-based** | Everything is a file. TELEMETRY_LOG.ndjson, healing-patterns.json, audit reports. No database, no external service, no API. |
| **Bidirectional** | QA outputs update PROJECT_STATE.md, RISKS.md, TASK_BACKLOG.md. And those documents, when changed, affect how the next QA run is configured. |
| **Traceable** | Every artifact references the STORY_ID it was generated from. Every pattern bank entry references the test name and run date. Every audit report references all source artifacts. |

### Zero Custom Infrastructure Rule

> If solving a problem requires building a new service, database, or API — the solution is wrong. MCP servers + agent definitions + structured file output are sufficient for monitoring, feedback, and audit. This rule overrides all other considerations.

### Agentic Standards Compliance Gate

Before a workflow can be promoted from "experimental" to "standard", it must pass:

```
[ ] Three-Layer Model: Execution + Feedback + Audit documented
[ ] Healer is primary monitor — no telemetry service added
[ ] Pattern bank exists with escalation threshold defined
[ ] Audit step exists with non-optional execution
[ ] Zero custom infrastructure — all layers use files + existing MCPs
[ ] Feedback loop is bidirectional (QA outputs → project docs)
```

---

## FINAL RULES — Non-Negotiable

### The Five Roles — Always Active Simultaneously

| Role | Primary Responsibility | Challenge |
|------|----------------------|-----------|
| **Product Manager** | Scope, priority, user value | "Does this serve a real user need?" |
| **Solution Architect** | System design, trade-offs, scalability | "Will this hold at 10× scale?" |
| **Senior Developer** | Production-grade code, maintainability | "Would I be comfortable maintaining this in 2 years?" |
| **QA Lead** | Test coverage, acceptance criteria | "How do I know this works AND keeps working?" |
| **Security Architect** | Threat model, risk mitigation, compliance | "How could this be abused?" |

### Absolute Rules

| Rule | Enforcement |
|------|-------------|
| Never write code without a plan | Implementation plan required — see Phase 9 |
| Never skip tests | Tests are a deliverable, not optional |
| Never skip documentation | Docs gate the PR — no merge without updates |
| Never assume requirements | Ask. Wrong assumption = expensive rework |
| Never use LLM output directly in business logic | Always validate and structure AI outputs |
| Never store secrets in code | Secrets manager only — scan enforced in CI |
| Challenge weak assumptions | Surface hidden risks before they hit production |
| Prefer maintainability over cleverness | Boring, readable code outlasts clever code |
| Prefer simplicity over premature optimisation | Measure before optimising |
| Update PROJECT_STATE.md every session | This is the project's heartbeat |
| Update HANDOFF.md before ending every session | The next session (or agent) depends on it |

### Agentic Continuity Principle

> Every session must leave the project in a state where a completely new AI agent — with no memory of previous sessions — can read the `/docs/` folder and resume work within 5 minutes without asking a single clarifying question.

**Test:** At the end of each session, ask: *"If I handed this project to a new AI right now with only the /docs/ folder, would it know exactly what to do next?"* If the answer is no, the session is not over.

---

*PROJECT STARTER KIT — v1.0 — 2026-06-08*
*Agentic Industry Standard Pattern*
