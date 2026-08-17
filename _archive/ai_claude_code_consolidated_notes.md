# AI & Claude Code — Consolidated Notes

> Extracted and consolidated from the four supplied screenshots.  
> The first two screenshots contain overlapping portions of the same LinkedIn post; duplicated text is consolidated below.

---

# Claude Code: 12 Features

You're using three of Claude Code's twelve features.

Probably the same three as everyone else.

I've used it daily for months to ship real things.

The gap between "fancy autocomplete" and "ships production code" isn't the model. It's these:

## 1. CLAUDE.md

Your project memory file. Define your stack, conventions, and rules.

## 2. Permissions

Whitelist safe tools. Block risky commands.

## 3. Skills

Reusable instruction sets saved in `.claude/skills/`.

## 4. Hooks

Custom shell scripts that fire on lifecycle events:

- `PreToolUse`
- `PostToolUse`
- `Notification`

## 5. Slash Commands

One-line shortcuts for repetitive workflows.

## 6. Plan Mode

Claude shows you the full plan before writing a single line.

## 7. Checkpoints

Automatic git snapshots at every step.

## 8. Compaction

Long conversation eating tokens? Compress it.

## 9. Context

Manage exactly what Claude sees.

## 10. MCP

Connect Claude to databases, APIs, and external services.

## 11. Subagents

Spawn parallel agents for complex tasks.

## 12. Headless Mode

`claude -p` in scripts, CI pipelines, cron jobs.

---


---

# 12 AI Terms Everyone Should Know in 2026

## The Foundations

### LLM

**Large Language Model:**  
Predicts next words. Base of generative AI. Token: Basic unit of text AI processes.

### Token

**Tokenization:** Process of breaking text into smaller units (tokens) for AI processing.

### Context Window

**Context Window:** Amount of information AI can remember at once.

---

## How AI Learns

### Fine-tuning

**Fine-tuning:** Adapting a pre-trained model with a specialized dataset to improve performance on specific tasks.

### RAG

**RAG (Retrieval-Augmented Generation):** Connects LLMs to external data for accuracy.

### Hallucination

**Hallucination:** When AI generates confident but incorrect information.

---

## How AI Works Today

### Agentic AI

**Agentic AI:** AI that can autonomously take actions to achieve goals.

### MCP (Model Context Protocol)

**MCP (Model Context Protocol):** Standard for AI to interact with external tools and systems.

### Multimodal

**Multimodal:** AI that understands and generates multiple data types (text, images, audio).

---

## Using AI Well

### Prompt Engineering

**Prompt Engineering:** Crafting effective inputs to guide AI output.

### Guardrails

**Guardrails:** Safety measures and rules to prevent misuse and bias.

### Coding Agent

**Coding Agent:** AI specialized in writing, debugging, and explaining code.

---

# Agentic AI: The Actual Picture

## Layered AI / Agentic Systems Diagram

The diagram presents AI concepts as nested layers, moving from foundational techniques toward agentic systems:

### 1. Machine Learning

- Supervised & Unsupervised Learning
- Classification, Regression, Clustering
- Reinforcement Learning
- Feature Engineering
- Optimization & Loss Functions

### 2. Deep Learning

- Neural Networks
- CNNs, RNNs, Transformers
- Backpropagation
- Embeddings & Vector Representations
- Attention & Self-Attention

### 3. Generative AI

- Large Language Models
- Prompting & In-Context Learning
- Chain-of-Thought
- RLHF & Instruction Tuning
- Transfer Learning & Fine-Tuning
- Multimodal Generation
- RAG & Retrieval

### 4. AI Agents

- Function Calling & Tool Use
- ReAct
- Autonomous Single-Agent Loops
- Task Decomposition
- Persistent Memory
- Self-Correction & Reflection

### 5. Agentic Systems

- Multi-Agent Collaboration
- Multi-Agent Orchestration
- Planning & Goal Hierarchies
- Human-in-the-Loop Workflows
- Guardrails & Safety
- Observability & Evaluation

---

## Full Diagram Title

**Agentic AI: The Actual Picture**

The diagram's major nested categories are:

**MACHINE LEARNING → DEEP LEARNING → GENERATIVE AI → AI AGENTS → AGENTIC SYSTEMS**

---
