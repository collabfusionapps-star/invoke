# Claude Code Cheat Sheet — New Project, GUI User

Verified against Anthropic's official Claude Code docs (code.claude.com) — July 2026.
Availability varies by plan/version — type `/` in your session to see your actual live list; treat this as a starting map, not gospel.

---

## 1. First 10 minutes in a new project (orientation)

Run these in order, in this order, before you touch any code:

| Step | Command | What it actually does |
|---|---|---|
| 1 | `/init` | Scans the repo and generates a starter `CLAUDE.md` — the project's persistent memory file. This is your single best "get to know the project" move. |
| 2 | `/memory` | Opens `CLAUDE.md` so you can read what Claude just learned, and correct anything wrong before it becomes gospel for every future session. |
| 3 | `/status` | Shows your current model, permission mode, connected MCP servers. Confirm settings before you start work. |
| 4 | `/permissions` | Set your approval rules (what Claude can do without asking). As a non-daily coder, start conservative — leave most things on "ask." |
| 5 | `/mcp` | If the project needs external tools (GitHub, databases, etc.), connect them here. |

Then, **in plain language, not slash commands**, ask Claude directly:
- "Explain the architecture of this codebase and how the main pieces connect."
- "Walk me through what happens end-to-end when [core feature] runs."
- "What would break if I changed X? What depends on it?"

This is more useful than any single command — a fresh Claude reading the whole repo and narrating it back to you is the real "get to know the project" tool.

**If the project has an app you can run:**

| Command | Purpose |
|---|---|
| `/run` | Launches and drives your app so you can see it actually working, not just pass tests. Infers how to launch it from your README/package.json/Makefile. |
| `/verify` | Builds and runs the app to confirm a change does what it should — actual behavior, not just "tests pass." |
| `/run-skill-generator` | Run this **once per project**. It records the exact recipe to build/launch it (env vars, install commands) so `/run` and `/verify` stop guessing. Worth it if the project has any non-trivial setup (DB, env file, multi-step build). |

Critical note: `/team-onboarding` exists and generates a ramp-up guide, but it works by inspecting *existing local Claude Code usage* in the repo — CLAUDE.md, skills, subagents, past workflows. On a repo with zero Claude Code history, it has nothing to summarize. Don't expect it to substitute for the walkthrough above on day one.

---

## 2. Prompting to get from problem → goal

This is the part that actually determines whether you get good output, more than any command.

**Don't do this:** "Build a user management system."
**Do this instead:** Split it into steps you can verify one at a time —
1. "Create the User schema: id, email, name, role, created_at."
2. "Add CRUD endpoints for users with input validation."
3. "Add tests for the endpoints."

Verify each step before moving to the next. This is the single biggest lever for someone who isn't reading every line of code Claude writes — small verifiable steps mean a bad step is cheap to catch.

| Command | When to use it |
|---|---|
| `/plan [description]` | Before any non-trivial change. Puts Claude into plan mode: it thinks through an approach and shows you *before* editing files. Use this any time you can't easily eyeball whether the change is right. |
| `/goal [condition]` | Claude keeps working autonomously across turns until the condition is met. **Use with caution as a non-daily coder** — it needs a genuinely checkable exit condition ("tests pass," not "code is good"), or it can wander and burn budget without you noticing. Check in on it; don't set-and-forget. |
| `/diff` | Interactive viewer of everything that changed. Use this after *every* meaningful step, not just at the end — it's your primary way to catch a wrong turn early. |
| `/btw [question]` | A side question that doesn't pollute your main conversation's context — good for "wait, what does this function do?" without derailing the task. |

If Claude heads in the wrong direction mid-response: **interrupt it** (stop generation) rather than letting it finish a large wrong change, then redirect. Don't wait and hope it self-corrects.

---

## 3. Slash commands that speed up real work

### Managing context (do this before Claude gets confused, not after)
| Command | Purpose |
|---|---|
| `/context [all]` | Visual breakdown of what's filling your context window — catches context bloat before it degrades responses. |
| `/compact [instructions]` | Summarizes the conversation to free space. Optionally focus the summary. |
| `/clear` | Starts a new conversation with empty context but **keeps project memory** (CLAUDE.md). Use this between unrelated tasks. |

### Model and effort (cost/speed control)
| Command | Purpose |
|---|---|
| `/model [name]` | Switch models. Cheaper/faster model for mechanical tasks, stronger model for real reasoning. |
| `/effort [level]` | `low`/`medium`/`high`/`xhigh` — how hard the model reasons. Low effort for quick iteration, higher for genuinely hard problems. |
| `/usage` (alias `/cost`) | See what you're spending. Worth checking early so cost doesn't surprise you. |

### Before you consider something "done"
| Command | Purpose |
|---|---|
| `/code-review [--fix]` | Reviews the current diff for correctness bugs and cleanup opportunities. `--fix` applies the findings directly. This is your "second pair of eyes," which matters more for you since you're not reading every diff line-by-line yourself. |
| `/security-review` | Checks the diff for security vulnerabilities specifically. |
| `/review` | Fast, read-only review of a GitHub pull request. |

### Recovering from mistakes (the safety net you actually need)
| Command | Purpose |
|---|---|
| `/rewind` (or Esc Esc) | Rolls code **and/or** conversation back to an earlier checkpoint. This is your undo button — learn it before you need it, not during a panic. |
| `/doctor` | Diagnoses installation/config issues, can auto-fix some. Run this if anything behaves strangely. |
| `/debug [description]` | Turns on debug logging and helps troubleshoot a specific runtime issue. |
| `/resume` | Return to an earlier conversation by name/ID — useful since sessions persist. |

---

## 4. What I'm deliberately NOT giving you yet

These are real, documented commands — but they're built for people running multiple parallel agent sessions, and picking them up before you're fluent in the basics above will cost you more (in confusion and burned usage) than it saves:

- `/batch` — decomposes a large change into 5–30 parallel background subagents, each in its own git worktree. Powerful, but assumes you're comfortable reviewing multiple independent PRs.
- `/loop` — runs a prompt repeatedly on an interval in the background.
- `/background` / `/fork` — detaches sessions to run unattended.

Come back to these once `/plan`, `/diff`, `/code-review`, and `/rewind` are second nature. Skipping straight to parallel agents before you can review one diff confidently is how people end up with a mess they don't understand.

---

## Sources
Anthropic official docs, verified July 28, 2026:
- https://code.claude.com/docs/en/commands
- https://code.claude.com/docs/en/slash-commands
