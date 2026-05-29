# claude-skills

A collection of modular Claude skills for critical thinking, content creation, and workflow automation.

## Installation

### Option A — Manual (recommended)

Copy any skill folder into your Claude skills directory:

```bash
# Clone the repo
git clone https://github.com/arielnishri-svg/claude-skills.git

# Copy a skill into your Claude skills directory
cp -r claude-skills/dispatcher /mnt/skills/user/dispatcher
```

Restart your Claude session. The skill will appear in your available skills list.

### Option B — Install all skills at once

```bash
git clone https://github.com/arielnishri-svg/claude-skills.git
cp -r claude-skills/* /mnt/skills/user/
```

### Option C — npx (if registered on skills.sh)

```bash
npx skills add arielnishri-svg/claude-skills@dispatcher
npx skills add arielnishri-svg/claude-skills@sparring-partner
```

## Skills

| Skill | Invoke | What it does |
|-------|--------|-------------|
| [dispatcher](./dispatcher/SKILL.md) | `/dispatch` | Auto-detects task mode (ANALYZE/REVIEW/CREATE) and routes to the right skill chain |
| [sparring-partner](./sparring-partner/SKILL.md) | `/sparring-partner` | Adversarial review — surfaces blind spots, credibility gaps, structural risks |
| [stress-test](./stress-test/SKILL.md) | `/stress-test` | Two-pass adversarial + reverse interview on any artifact |
| [clarifying-questions](./clarifying-questions/SKILL.md) | `/clarifying-questions` | Asks questions until 95% confidence before executing complex tasks |
| [decision-toolkit](./decision-toolkit/SKILL.md) | `/decision-toolkit` | Structured decision-making frameworks, tradeoff matrices, scenario explorers |
| [style-enforcer-pipeline](./style-enforcer-pipeline/SKILL.md) | `/style-enforcer-pipeline` | Style + humanization + fact-check pipeline in one pass |
| [humanizer](./humanizer/SKILL.md) | `/humanizer` | Removes AI writing patterns, makes text sound human |
| [fact-checker](./fact-checker/SKILL.md) | `/fact-checker` | Systematic fact verification and misinformation identification |
| [compact-conversation](./compact-conversation/SKILL.md) | `/compact-conversation` | Compresses long chats into a snapshot for a fresh context |
| [summarize-doc](./summarize-doc/SKILL.md) | `/summarize-doc` | Compresses heavy documents to 20–30% original length |
| [context-audit](./context-audit/SKILL.md) | `/context-audit` | Audits Claude Code setup for token waste and context bloat |
| [request-validator](./request-validator/SKILL.md) | `/request-validator` | Validates output format and scope before execution to prevent rework |
| [earnings-analysis](./earnings-analysis/SKILL.md) | `/earnings-analysis` | Professional equity research earnings update reports |
| [frontend-slides](./frontend-slides/SKILL.md) | `/frontend-slides` | Animation-rich HTML presentations from scratch or converted from PPTX |
| [prompt-master](./prompt-master/SKILL.md) | `/prompt-master` | Generates optimized prompts for any AI tool |
| [find-skills](./find-skills/SKILL.md) | `/find-skills` | Discovers and installs skills from the open agent skills ecosystem |
| [handoff](./handoff/SKILL.md) | `/handoff` | Creates a clipboard-ready summary to continue a Claude conversation in a fresh chat with zero context loss |

## Requirements

- Claude Code or any Claude interface that supports `/mnt/skills/user/` skill loading
- Skills activate on next session start after installation

## Usage

Invoke by slash command or natural language trigger:

```
/dispatch help me figure out my pricing strategy
/sparring-partner [paste your document]
/stress-test [paste your plan]
/compact-conversation
```

Most skills also activate automatically from natural language — e.g. pasting a document and saying "find the flaws" will trigger sparring-partner without the slash command.
