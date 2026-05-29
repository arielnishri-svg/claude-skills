---
name: compact-conversation
description: Summarize entire conversation into compressed snapshot for pasting into fresh chat. Preserves original goal/problem, key decisions and reasoning, code/config/data settled on in verbatim code blocks, open questions, next steps. Use this whenever user wants context continuity across new conversations or mentions long chats ballooning their token usage. Trigger on phrases like "compress this," "save context," "new chat summary," "summarize for next chat," or "I need this condensed."
---

# Compact Conversation Skill

Compress multi-turn conversations into dense, portable summaries that preserve all signal without filler.

## When to Use

User explicitly requests conversation compression for handoff to new chat. Signs: "I want to continue this in a fresh chat," "summarize the whole conversation," "I need the context compressed," "save this before I start a new one."

## Output Format

Markdown with these sections in order (skip empty ones):

### Goal/Problem
One sentence describing original ask or problem statement.

### Decisions Made
Bullet list of major choices and the reasoning behind them. Be specific about trade-offs.

### Code/Config/Data Settled
All actual code, config files, database schemas, API responses, file paths, exact values. Use code blocks. Include only what was finalized, not exploratory attempts.

### Open Questions
Unresolved items, blocked decisions, pending research, or things awaiting user clarification.

### Next Steps
Immediate actions to take when resuming in new chat. Ordered by priority.

## Writing Rules

- No filler. No "great work so far," "really interesting problem," exploratory tangents.
- Short declarative sentences. Avoid "as we discussed" or "remember when."
- Use original capitalization and exact names (e.g., SNDK, Botika, Aspera).
- Code blocks are verbatim, formatted correctly. If long (>50 lines), add brief comment at top noting purpose.
- List trade-offs explicitly where decisions were made ("Chose X over Y because...").
- Ruthlessly cut anything the user can easily re-derive or look up.

## Examples

### Stock Analyzer Summary
**Goal:** Build React artifact with 30-point due diligence checklist for stock analysis.

**Decisions Made:**
- Scorecard approach (0-10 per category) over weighted model to keep UI simple.
- Six categories: Financials, Valuation, Balance Sheet, Competitive Position, Risk Factors, Technical. Grouped by signal strength.
- BUY/HOLD/SELL verdict calculated from average score: >7 = BUY, 5-7 = HOLD, <5 = SELL.
- Analyst ratings panel separate from checklist to avoid data overload.

**Code/Config/Data Settled:**
```javascript
const categories = [
  { name: "Financials", weight: 1 },
  { name: "Valuation", weight: 1 },
  ...
];
const verdict = (score) => score > 7 ? "BUY" : score >= 5 ? "HOLD" : "SELL";
```
First test run on SNDK: Hold verdict.

**Open Questions:**
- Should analyst consensus override score-based verdict?
- API source for real-time earnings/fundamentals?

**Next Steps:**
1. Run analysis on 3 more stocks to validate scoring logic.
2. Research earnings API (yfinance, Alpha Vantage).
3. Add manual override toggle for edge cases.

---

Use this format when compressing. Omit sections that don't apply. Keep total length under 800 words if possible.
