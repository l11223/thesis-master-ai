# AGENTS.md

## Cursor Cloud specific instructions

This repository is a **pure content/documentation project** (Academic Paper Writing System / 学术论文写作系统 v4.0). It contains Markdown files, templates, and one shell script — there are no software services to build, run, or deploy.

### Repository overview

- `THESIS_MASTER_PROMPT.md` — core prompt (~12,000+ lines) to paste into LLMs (Claude, ChatGPT, etc.)
- `QUICK_START.md` — condensed version of the prompt
- `完整论文/` (10 papers, split by chapter) and `完整论文精品集/` (80 papers, single-file) — sample academic papers in Markdown
- `示例论文/` — 10 example papers
- `_论文模板/` — outline, literature matrix, and archive templates
- `new_thesis.sh` — the only executable; creates a new thesis project folder structure from templates

### Lint / test / build / run

| Task | Command | Notes |
|------|---------|-------|
| Markdown lint | `npx markdownlint-cli "*.md"` | Pre-existing style warnings exist (inline HTML in `README.md`, etc.); these are intentional |
| Shell syntax check | `bash -n new_thesis.sh` | Standard bash syntax validation |
| Run the script | `./new_thesis.sh "論文題目"` | Creates a thesis project directory with subdirectories and template files |

- There is **no build step**, no package manager lockfile, and no test suite.
- There are **no backend/frontend services** to start.
- `markdownlint-cli` is available via npx (Node.js is pre-installed).
