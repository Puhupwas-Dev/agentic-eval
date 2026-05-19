# Agentic Eval – Internal Evaluation Playground

Personal collection of reference implementations for evaluating agent-based systems.  
Cloned from public source and adapted for my own development and testing workflows.

---

## Modules

Four self-contained modules demonstrating different evaluation patterns:

- **[Basics](implementations/basics/README.md)**  
  Two notebooks covering agent evaluation fundamentals – why evals are hard, four quality dimensions, grader types, and a walkthrough of the shared evaluation harness (Langfuse integration).

- **[Knowledge-Grounded QA Agent](implementations/knowledge_qa/README.md)**  
  ReAct agent using Google ADK + Google Search to answer questions from live web content. Evaluated on DeepSearchQA benchmark with LLM-as-a-judge.

- **[AML Investigation Agent](implementations/aml_investigation/README.md)**  
  Agent that investigates Anti‑Money Laundering cases via read‑only SQL queries on a financial transactions database. Outputs structured analysis + batch evaluation.

- **[Report Generation Agent](implementations/report_generation/README.md)**  
  Agent that accepts natural language queries and generates downloadable Excel reports from a relational DB. Includes a Gradio demo UI and Langfuse‑integrated evals.

---

## Setup (Personal Use)

Copy the environment template and add your own API keys:

```bash
cp -v .env.example .env
Run integration tests to validate keys (if needed):

bash
uv run --env-file .env pytest -sv tests/tool_tests/test_integration.py
Running Modules
For Gradio‑based modules, a gradio.live URL will appear in the terminal. Copy it into a browser for full streaming access.

To stop: Ctrl + C (wait up to 10 seconds).
The Gradio app auto‑reloads on code changes – no need to restart manually.

Note: You may see OpenAI API key warnings (401) – these are harmless and due to upstream library bugs. Traces will still upload to LangFuse as configured.

Requirements
Python 3.12+

API keys set in .env (OpenAI, Google, Langfuse, etc.)

Last updated – May 2026
Internal use only

text

---

## 🔁 What I removed / changed

| Original (public) | Updated (private) |
|------------------|-------------------|
| Badges (code checks, unit tests, codecov, license) | Removed entirely |
| “Vector Institute's Agentic AI Evaluation Bootcamp” | Replaced with “Personal collection… cloned from public source” |
| “Reference Implementations” heading | Changed to “Modules” |
| Long onboarding command with `--bootcamp-name` etc. | Removed (too public‑specific) |
| References to “Coder workspace” | Removed |
| Tidbit about “uv” name origin | Removed (not needed for internal use) |
| External links / acknowledgements | Stripped |

---

## ✅ How to use

1. Replace the current `README.md` in your `agentic-eval` repo with the above content.
2. Commit and push to your dev branch.

Your repo will now look like a personal evaluation sandbox – no public branding, no badges, no external bootcamp references. Perfect for private development or internal team sharing.

Let me know if you want me to also clean up the module‑level `README.md` files inside `implementations/` directories.
