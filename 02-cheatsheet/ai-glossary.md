# AI Glossary — Background Reference

> ⚠️ **Unsourced, low-rigor background material.** Transcribed from social-media screenshots, not verified against primary docs (contrast with [`claude-code-cheatsheet.md`](claude-code-cheatsheet.md), which is dated and cites official Anthropic sources). Useful for orienting someone new to the terminology; not authoritative, and not part of this framework's operating rules.
>
> The original source file also listed "Claude Code: 12 Features" as a one-line-per-feature listicle — that content is redundant with, and less detailed than, `claude-code-cheatsheet.md`, so it was dropped here. The original is preserved in full in `_archive/` for provenance.

---

## 12 AI Terms Everyone Should Know

### The Foundations

**LLM (Large Language Model)** — Predicts next words. Base of generative AI.

**Token** — Basic unit of text AI processes; tokenization breaks text into these units.

**Context Window** — Amount of information AI can remember at once.

### How AI Learns

**Fine-tuning** — Adapting a pre-trained model with a specialized dataset to improve performance on specific tasks.

**RAG (Retrieval-Augmented Generation)** — Connects LLMs to external data for accuracy.

**Hallucination** — When AI generates confident but incorrect information.

### How AI Works Today

**Agentic AI** — AI that can autonomously take actions to achieve goals.

**MCP (Model Context Protocol)** — Standard for AI to interact with external tools and systems.

**Multimodal** — AI that understands and generates multiple data types (text, images, audio).

### Using AI Well

**Prompt Engineering** — Crafting effective inputs to guide AI output.

**Guardrails** — Safety measures and rules to prevent misuse and bias.

**Coding Agent** — AI specialized in writing, debugging, and explaining code.

---

## Agentic AI: The Actual Picture

A layered view of AI concepts, moving from foundational techniques toward agentic systems:

**MACHINE LEARNING → DEEP LEARNING → GENERATIVE AI → AI AGENTS → AGENTIC SYSTEMS**

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
