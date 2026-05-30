# claude-skills

A collection of modular Claude skills for critical thinking, content creation, document work, and workflow automation. 22 skills, each self-contained with YAML frontmatter and a slash-command trigger.

## Installation

### Option A — Manual (recommended)

```bash
# Clone the repo
git clone https://github.com/arielnishri-svg/claude-skills.git
cd claude-skills

# Copy a single skill into your Claude skills directory
cp -r dispatcher /mnt/skills/user/dispatcher
```

Restart your Claude session. The skill appears in your available skills list.

### Option B — Install all skills at once

```bash
git clone https://github.com/arielnishri-svg/claude-skills.git
cd claude-skills
cp -r */ /mnt/skills/user/
```

### Option C — npx (if registered on skills.sh)

```bash
npx skills add arielnishri-svg/claude-skills@dispatcher
npx skills add arielnishri-svg/claude-skills@sparring-partner
```

## Skills

### Thinking & Review

| Skill | Invoke | What it does |
|-------|--------|-------------|
| [dispatcher](./dispatcher/SKILL.md) | `/dispatch` | Auto-detects task mode (ANALYZE/REVIEW/CREATE) and routes to the right skill chain |
| [anti-sycophancy](./anti-sycophancy/SKILL.md) | `/anti-syc` | Rewrites validation-seeking prompts into adversarial ones before answering — catches sycophancy at the question level |
| [sparring-partner](./sparring-partner/SKILL.md) | `/sparring-partner` | Adversarial review — surfaces blind spots, credibility gaps, structural risks |
| [stress-test](./stress-test/SKILL.md) | `/stress-test` | Two-pass adversarial + reverse interview on any artifact |
| [decision-toolkit](./decision-toolkit/SKILL.md) | `/decision-toolkit` | Structured decision frameworks, tradeoff matrices, scenario explorers |
| [clarifying-questions](./clarifying-questions/SKILL.md) | `/clarifying-questions` | Asks questions until 95% confidence before executing complex tasks |
| [request-validator](./request-validator/SKILL.md) | `/validate` | Validates output format and scope before execution to prevent rework |
| [task-audit](./task-audit/SKILL.md) | `/task-audit` | Appends a completion audit: exact item count, every skip named, "complete" only if truly done |

### Writing & Content

| Skill | Invoke | What it does |
|-------|--------|-------------|
| [humanizer](./humanizer/SKILL.md) | `/humanizer` | Removes AI writing patterns, makes text sound human |
| [fact-checker](./fact-checker/SKILL.md) | `/fact-checker` | Systematic fact verification and misinformation identification |
| [style-enforcer-pipeline](./style-enforcer-pipeline/SKILL.md) | `/style-enforcer-pipeline` | Style + humanization + fact-check in one pass |
| [summarize-doc](./summarize-doc/SKILL.md) | `/summarize-doc` | Compresses heavy documents to 20–30% original length |
| [earnings-analysis](./earnings-analysis/SKILL.md) | `/earnings-analysis` | Professional equity research earnings update reports |

### Prompting

| Skill | Invoke | What it does |
|-------|--------|-------------|
| [prompt-master](./prompt-master/SKILL.md) | `/prompt-master` | Generates optimized, paste-ready prompts for any AI tool |
| [prompt-principles](./prompt-principles/SKILL.md) | `/prompt-principles` | Teaches prompting principles and diagnoses why a prompt underperforms |

### Frontend & Design

| Skill | Invoke | What it does |
|-------|--------|-------------|
| [frontend-design](./frontend-design/SKILL.md) | natural language | Distinctive, production-grade UI that avoids generic AI aesthetics |
| [frontend-slides](./frontend-slides/SKILL.md) | `/frontend-slides` | Animation-rich HTML presentations from scratch or converted from PPTX |

### Workflow & Launch

| Skill | Invoke | What it does |
|-------|--------|-------------|
| [product-launch](./product-launch/SKILL.md) | `/product-launch` | Full go-to-market plan: validation, pricing, platform, sales page, 30-day content calendar |

### Context & Continuity

| Skill | Invoke | What it does |
|-------|--------|-------------|
| [handoff](./handoff/SKILL.md) | `/handoff` | Full work-resumption document: decisions, traps, failed approaches, confidence flags |
| [compact-conversation](./compact-conversation/SKILL.md) | `/compact-conversation` | Lightweight chat snapshot (under 800 words) for quick continuity |
| [context-audit](./context-audit/SKILL.md) | `/context-audit` | Audits Claude Code setup for token waste and context bloat |

### Discovery

| Skill | Invoke | What it does |
|-------|--------|-------------|
| [find-skills](./find-skills/SKILL.md) | `/find-skills` | Discovers and installs skills from the open agent skills ecosystem |

> **handoff vs compact-conversation:** handoff is the full superset (traps, failed approaches, confidence flags). compact-conversation is the quick version. compact defers to handoff for explicit-handoff phrases, so they no longer collide.

## Requirements

- Claude Code or any Claude interface that loads skills from `/mnt/skills/user/`
- Skills activate on the next session start after installation

## Usage

Invoke by slash command or natural-language trigger:

```
/dispatch help me figure out my pricing strategy
/sparring-partner [paste your document]
/stress-test [paste your plan]
/handoff
```

Most skills also activate from natural language — e.g. pasting a document and saying "find the flaws" triggers sparring-partner without the slash command.

## Conventions

- Every `SKILL.md` carries `name`, `version`, and `description` frontmatter
- Paths are POSIX (`/mnt/skills/user/...`); no Windows-style backslashes
- Each skill is self-contained; cross-skill references are explicit (e.g. stress-test loads sparring-partner)

## License

Per-skill. `fact-checker` and `humanizer` are MIT; `frontend-design` ships its own LICENSE.txt. Others default to repository license.
