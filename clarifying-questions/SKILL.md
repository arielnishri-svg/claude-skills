---
name: clarifying-questions
version: 1.0.0
description: Ask clarifying questions until reaching 95% confidence you can complete the task successfully. Trigger this skill whenever a user request is ambiguous, has unclear requirements, or success criteria aren't defined. Also use this skill when explicitly invoked via /clarifying-questions command. Systematically explore unknowns through grouped questions, track confidence level openly, and proceed only when hitting 95% certainty. Essential for high-stakes tasks, ambiguous requests, or any work where clarity prevents rework.
---

# Clarifying Questions Skill

Ask questions until you're 95% confident you can complete the task successfully.

## Core Principle

**Confidence = 95% means:**
- You understand what done looks like
- You know all hard constraints and soft preferences
- You can anticipate edge cases and failure modes
- You know when to ask mid-task vs. decide unilaterally
- You'd be shocked if output doesn't meet expectations

**Below 95% means:** Risk of misalignment, rework, wasted effort. Ask more questions.

## Workflow

### Step 1: Assess Initial Confidence

When user requests a task, ask yourself:
- Do I understand what success looks like?
- Are there obvious gaps in my knowledge?
- Would this task benefit from clarification?

If confidence < 95%, move to Step 2.

### Step 2: Ask Clarifying Questions (Grouped & Conversational)

Use this framework to identify what you don't know:

**A. Task Clarity**
- What is the primary goal? (User's intent, not method)
- What is the expected output format/deliverable?
- What does "done" look like? (Success criteria)

**B. Scope & Constraints**
- What is in scope? (What should be included?)
- What is out of scope? (What should NOT be included?)
- Hard constraints? (Deadlines, format, size, style)
- Soft preferences? (Nice-to-haves, style choices)

**C. Context & Dependencies**
- Who is the audience/user of the output?
- What context is relevant? (Existing files, prior decisions, background info)
- Does this depend on other work? (If so, what's the status?)
- Approval/review steps needed?

**D. Risk & Edge Cases**
- What would make this task fail?
- What's the worst misunderstanding you could have?
- Version/compatibility concerns?
- Should I make assumptions or ask if unclear?

**E. Decision Authority**
- What decisions can I make unilaterally?
- What decisions need your input?
- If uncertain mid-task, should I ask or decide?

### Step 3: Ask Questions Conversationally

Group related questions and batch them (3-7 max per round). Ask specific, actionable questions. Build on previous answers. Sound like sparring partner mode: conversational, direct, no filler.

Example for ambiguous request:

**"I'm at 40% confidence. A few things to lock down:**

What's the core goal here? (Pitch for funding vs. internal process change vs. client proposal vs. something else?)

Who's reading this? (C-suite, board, external stakeholders, your team?)

What format works best for your audience? (Formal document, slide deck, one-pager, email thread?)"

After answers: Round 2 if needed.

**"I'm at 75% now. Couple more things:**

Budget/financial component needed? If so, how detailed?

Timeline pressure? When do you need it, and when does this take effect?

Any known objections or competing alternatives I should address?"

### Step 4: Track Confidence Openly

After asking questions, state your confidence level explicitly:
- List what you now understand clearly
- List remaining uncertainties (if any)
- State confidence: "I'm at 75% confidence" or "I'm at 95% confidence"

If below 95%, ask follow-up questions.

### Step 5: Get Explicit Confirmation

Once at 95%+, summarize what you'll do:

**CONFIDENCE CHECK: 95%**

**✓ Clear on:** [3-4 things you're certain about]
**✓ Clear on:** [3-4 things you're certain about]

**? Assuming:** [any assumptions you're making]
**? Will decide unilaterally on:** [formatting, style, structure choices]

**Proceeding with:** [specific action]

Only proceed after explicit yes (or clear nod).

## Question Strategy

**Do:**
- Ask 3-7 clarifying questions maximum per round (batch them)
- Prioritize high-impact unknowns (what blocks the most?)
- Make questions specific and actionable
- Build on previous answers

**Don't:**
- Ask questions you could answer from context
- Ask yes/no questions if open-ended would be richer
- Ask the same question twice
- Make the user feel interrogated

## When to Use This Skill

**Use when:**
- Task is ambiguous or has multiple interpretations
- Output will be used by others (higher stakes)
- Task involves multiple steps or dependencies
- You're not sure if you understand success criteria
- User says "do what you think is best" but scope is unclear
- Task has hard constraints (budget, deadline, format)
- Risk of producing something that needs major rework
- User explicitly invokes `/clarifying-questions` command

**Skip when:**
- Task is simple and unambiguous ("fix this typo")
- User explicitly says "just vibe" or "don't overthink"
- You're legitimately at 95%+ already
- User is in a hurry (still flag, but move fast)

## Recovery Mid-Task

If you discover mid-task that you're below 95% confidence: STOP. Flag it.

"I realized I'm uncertain about X. Should I proceed with assumption Y, or would you like to clarify?"

## Anti-Pattern: Overthinking

Don't ask about every possible detail. Focus on what blocks execution.

**Bad:**
- "What font would you prefer?"
- "Should I add a copyright notice?"
- "What color scheme?"

**Good:**
- "What's the decision you need from this?"
- "Who's the final approver?"
- "What happens after they read this?"
