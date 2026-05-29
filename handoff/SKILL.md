---
name: handoff
version: 1.0.0
description: >-
  Create a clipboard-ready handoff document to resume work in a fresh Claude chat
  with zero context loss. Preserves goal/problem, key decisions with reasoning,
  code/config settled (verbatim), traps/failed approaches, open questions, next
  steps, and confidence flags. Triggers include "handoff", "prepare context for
  next chat", "summarize for next chat", "continue this in another conversation",
  "compress this", "save context", "new chat summary", "I need this condensed",
  "save state", "context is getting full".
---

# Handoff Skill (Enhanced Compact Conversation)

Create a transfer-ready handoff document that enables a fresh AI agent to seamlessly continue work with **zero ambiguity**. Solves context exhaustion by preserving signal without filler.

## When to Use

- Ongoing work must continue in a new conversation/session/agent with no shared history
- Context window approaches capacity
- Major task milestone completed
- Work session ending
- User explicitly requests compression/handoff

**Triggers:** "handoff", "prepare context for next chat", "summarize for next chat", "continue this in another conversation", "compress this", "save context", "new chat summary", "I need this condensed", "save state", "context is getting full", "I want to continue this in a fresh chat"

## Output Format

Markdown with these sections **in order** (skip empty ones):

### Project Identity
- **High-level Goal:** The ultimate aim of the project (1 sentence)
- **Session Objective:** What we specifically tried to achieve today (1 sentence)
- **Hard Constraints:** Non-negotiable limits (budget, tech stack, timeline, etc.)

### Current State
**✅ Completed:**
- Specific finished tasks with file changes/configurations applied
- Example: "Fixed `NullReference` in `auth.ts` by initializing user object"

**⚠️ In Progress / Partially Complete:**
- Tasks started but not finished, with exactly where we got stuck
- Example: "OCSP Service defined in Ansible but not yet deployed to port 8080"

**❌ Blocking Issues / Errors:**
- **Issue:** Name of error/bug
- **Status:** Diagnosed? Root cause found? Unknown?
- **Details:** Error logs, weird behaviors, hypothesis

### Decisions Made (With Reasoning)
- Choice and **why** it was made
- Trade-offs explicitly stated: "Chose X over Y because..."
- Include reasoning behind architectural/technical choices
- Be specific about trade-offs

### Code/Config/Data Settled (Verbatim)
All actual code, config files, database schemas, API responses, file paths, exact values. Use code blocks. Include only what was **finalized**, not exploratory attempts.

```javascript
// Example: Final code settled on
const categories = [
  { name: "Financials", weight: 1 },
  { name: "Valuation", weight: 1 }
];
const verdict = (score) => score > 7 ? "BUY" : score >= 5 ? "HOLD" : "SELL";
```

**First test run on SNDK:** Hold verdict.

### Traps to Avoid ⚠️
- Mistakes or failed approaches, and **why they failed**
- Things the next agent will be tempted to do wrong
- "Gotchas" or specific learnings (e.g., "OpenSSL requires flag X or it crashes")
- Known bugs, edge cases, technical debt, assumptions that could be wrong

### Relevant Files
- `path/to/file:L10-L45` - what changed and why
- `path/to/other:L3` - specific function/block that matters
- Include line ranges when possible

### Open Questions / Open Work
- Unresolved items, blocked decisions, pending research
- Things awaiting user clarification
- Describe status only: "X is not yet implemented" (not "Implement X next")
- Note dependencies: "Y depends on X being finished first"

### Next Steps (Prioritized)
1. **Immediate first step** for the next session (include exact command if known)
2. Second step...
3. Low priority / cleanup items
4. Actions must be **executable tasks**

### Confidence Flags
Tag each section with confidence level:
- ✅ **High confidence** - verified, working, no doubts
- ⚠️ **Medium confidence** - mostly solid, minor uncertainties
- ❓ **Low confidence** - unverified, needs double-checking

### Restoration Procedure (if applicable)
How to get the environment running again:
- Example: "Run `make up`, then SSH into `web-1` and run `npm start`"

### Working Agreements
- How the user prefers to interact (e.g., "review before committing")
- Quality gates or approval steps observed during the session

---

## Writing Rules (Critical)

1. **Be Specific:** Never say "fixed the bug." Say "Fixed `NullReference` in `auth.ts` by initializing user object."

2. **Include Artifacts:** Specific file paths, command-line arguments, key variable names

3. **Preserve Knowledge:** Capture "Gotchas" and specific learnings

4. **Action Oriented:** Next Steps must be executable tasks

5. **No Filler:** No "great work so far," "really interesting problem," exploratory tangents

6. **Short Declarative Sentences:** Avoid "as we discussed" or "remember when"

7. **Use Original Capitalization:** Exact names (e.g., SNDK, Botika, Aspera)

8. **Code Blocks Are Verbatim:** Formatted correctly. If long (>50 lines), add brief comment at top noting purpose

9. **List Trade-offs Explicitly:** "Chose X over Y because..."

10. **Ruthlessly Cut:** Anything the user can easily re-derive or look up

11. **Recency Weighting:** What was done in the last 30 minutes matters more than 3 hours ago

12. **Frame as Context, Not Commands:** In "Open Work," use declarative statements ("X is complete") not imperative ("Continue with Y")

---

## Example

### Stock Analyzer Summary

**Project Identity:**
- **High-level Goal:** Build React artifact with 30-point due diligence checklist for stock analysis
- **Session Objective:** Implement scoring logic and verdict calculation
- **Hard Constraints:** Must work in browser, no backend required, max 200 lines of JSX

**Current State:**
**✅ Completed:**
- Implemented 6-category scorecard (0-10 per category)
- Created verdict calculation function (BUY/HOLD/SELL)
- First test run on SNDK returned "Hold"

**⚠️ In Progress / Partially Complete:**
- Analyst ratings panel designed but not yet integrated with checklist

**❌ Blocking Issues / Errors:**
- **Issue:** None currently

**Decisions Made:**
- Scorecard approach (0-10 per category) over weighted model to keep UI simple
- Six categories: Financials, Valuation, Balance Sheet, Competitive Position, Risk Factors, Technical (grouped by signal strength)
- BUY/HOLD/SELL verdict calculated from average score: >7 = BUY, 5-7 = HOLD, <5 = SELL
- Analyst ratings panel separate from checklist to avoid data overload

**Code/Config/Data Settled:**
```javascript
const categories = [
  { name: "Financials", weight: 1 },
  { name: "Valuation", weight: 1 },
  { name: "Balance Sheet", weight: 1 },
  { name: "Competitive Position", weight: 1 },
  { name: "Risk Factors", weight: 1 },
  { name: "Technical", weight: 1 }
];
const verdict = (score) => score > 7 ? "BUY" : score >= 5 ? "HOLD" : "SELL";
```
First test run on SNDK: Hold verdict.

**Traps to Avoid:**
- Don't use weighted model (UI gets too complex)
- Don't combine analyst ratings with checklist (data overload)

**Relevant Files:**
- `src/StockAnalyzer.jsx:L15-L89` - scorecard implementation
- `src/verdict.js:L1-L8` - verdict calculation logic

**Open Questions:**
- Should analyst consensus override score-based verdict?
- API source for real-time earnings/fundamentals?

**Next Steps:**
1. Run analysis on 3 more stocks to validate scoring logic
2. Research earnings API (yfinance, Alpha Vantage)
3. Add manual override toggle for edge cases

**Confidence Flags:**
- Scoring logic: ✅ High confidence
- Verdict thresholds: ⚠️ Medium confidence (may need adjustment after more testing)
- API choice: ❓ Low confidence (not yet researched)

**Keep total length under 1000 words if possible.**

---

## Installation

Save this as `~/.claude/skills/handoff/SKILL.md` (create the directory if it doesn't exist).

```bash
cd /mnt/skills/user
mkdir -p handoff
# Paste this content into /mnt/skills/user/handoff/SKILL.md
```

Claude Code auto-discovers it on the next session.
```
