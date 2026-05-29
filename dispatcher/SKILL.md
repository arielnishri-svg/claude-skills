---
name: dispatcher
version: 1.0.0
description: Auto-detect task mode (ANALYZE, REVIEW, CREATE) from user input and route to the correct skill chain automatically. Use when invoked via /dispatch or when a complex request is ambiguous about what kind of help is needed. Eliminates manual skill invocation on multi-step tasks.
---

# Dispatcher: Task Mode Router

Classify the request, announce the mode and planned skill chain, confirm if ambiguous, then execute.

## The Three Modes

### ANALYZE
User is exploring a problem, decision, or idea. No artifact exists yet or it's still forming.

**Signals:** "help me think through", "I'm trying to decide", "what should I do about", "explore", "what are my options", "I'm considering"

**Default chain:** clarifying-questions → decision-toolkit → sparring-partner

**When to compress:** If scope is already clear, skip clarifying-questions and go straight to decision-toolkit + sparring-partner.

---

### REVIEW
User has an artifact (doc, plan, deck, strategy, code, pitch) that needs adversarial critique.

**Signals:** "review this", "what's wrong with", "tear this apart", "stress-test", "find the flaws", "feedback on", user pastes a document/plan without further instruction

**Default chain:** sparring-partner → stress-test

**Optional extensions:** + fact-checker (if factual claims are central) + humanizer (if it's written content going public)

---

### CREATE
User wants output produced from scratch or near-scratch.

**Signals:** "write", "build", "create", "make me", "draft", "generate", requests naming a deliverable (doc, slides, tool, email, report)

**Default chain:** clarifying-questions (if scope unclear) → [relevant creation skill] → style-enforcer-pipeline

**Creation skill selection:**
- Document/report → docx skill
- Slides/presentation → frontend-slides or pptx skill
- UI/component/web → frontend-design skill
- Spreadsheet → xlsx skill
- Written content for publishing → humanizer → fact-checker
- Decision tool/dashboard → decision-toolkit

---

## Routing Logic

```
1. Read request
2. Check for explicit skill invocation (/sparring-partner, /stress-test, etc.)
   → If found: bypass dispatcher, run that skill directly
3. Classify mode: ANALYZE / REVIEW / CREATE
4. Confidence in classification:
   - High (>80%): announce mode + chain, proceed
   - Low (<80%): ask ONE question to resolve ambiguity, then route
5. Execute chain in order
6. After each skill step, confirm before proceeding to next if output is substantial
```

## Ambiguity Resolution

When a request could be REVIEW or CREATE (e.g., "help me with my pitch deck"):
> "Treating this as REVIEW — you have a draft and want critique. Correct, or are you building from scratch?"

When a request could be ANALYZE or CREATE (e.g., "help me figure out my pricing"):
> "Treating this as ANALYZE — you're still deciding. Correct, or do you want me to produce a pricing framework document?"

One question only. Don't loop.

## Bypass Conditions

Skip dispatcher entirely when:
- Request is simple and unambiguous ("fix this typo", "translate this")
- User already invoked a specific skill by name or slash command
- User says "just [do X]" — treat as direct instruction, no routing overhead
- Task is conversational, not a deliverable

## Output Format

When routing, state:
```
MODE: [ANALYZE / REVIEW / CREATE]
CHAIN: [skill1] → [skill2] → [skill3]
```
Then proceed immediately unless ambiguous.

Do not explain the dispatcher. Do not narrate the routing in detail. One line, then execute.

## Example Routing Announcements

- "MODE: REVIEW — running sparring-partner then stress-test."
- "MODE: CREATE — scope unclear. What's the primary audience for this?"
- "MODE: ANALYZE — starting with clarifying questions, then decision-toolkit."
