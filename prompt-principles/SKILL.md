---
name: prompt-principles
version: 1.0.0
description: Reference guide for prompting principles and patterns. Use when teaching someone how to write better prompts, reviewing a prompt for structural weaknesses, or explaining why a prompt is underperforming. Distinct from prompt-master (which builds production prompts) — this skill teaches the underlying principles.
---

## When to Use This Skill

- User asks "why isn't my prompt working" or "how do I prompt better"
- User wants to understand prompting principles, not just get a prompt built
- Reviewing someone else's prompt and explaining what's wrong
- Onboarding a new team member to AI tools
- Invoked via `/prompt-principles`

**Do NOT use this skill to build a production prompt.** For that, use `prompt-master`.

---

## Core Principles

### 1. Be Specific — Not Vague

State the task, deliverable, length, and format upfront. Vague inputs produce vague outputs.

| Weak | Strong |
|------|--------|
| "Help me with a presentation" | "10-slide deck for Q2 sales meeting. Cover: performance, top products, Q3 targets. Provide outline with key points per slide." |
| "Write a professional email" | "Email to client about 1-month delay due to supply chain. Tone: professional but warm. Mirror the structure of [example]." |

**Rule:** If you can't describe what "done" looks like, Claude can't either.

---

### 2. Show Examples

When format or style matters, show an example. Description alone is lossy — examples are lossless.

- Paste a previous output you liked
- Show the structure you want replicated
- Provide input/output pairs for pattern-sensitive tasks

---

### 3. Assign a Role

For complex or specialized tasks, give Claude an expert identity. This narrows the response space to the most relevant knowledge and tone.

| Weak | Strong |
|------|--------|
| "Help me prepare for a negotiation" | "You are a fabric supplier. I'm trying to cut prices 10%. Give me 3 objections you'd raise, a counterargument for each, and 2 alternative proposals. Then switch roles and coach me as the buyer." |

Role assignment works because it shifts Claude's frame of reference, not just its vocabulary.

---

### 4. Structure the Output

Don't let Claude decide the shape of the response. Specify:

- Number of items (3 recommendations, 5 examples)
- Format (table, numbered list, prose, JSON)
- Sections (Executive Summary → Findings → Recommendations)
- Length (200 words, 2 paragraphs, 1 sentence per point)

Unstructured prompts produce inconsistent output. Structured prompts produce consistent, scannable output.

---

### 5. Encourage Reasoning on Hard Problems

For analysis, strategy, and multi-factor problems: ask Claude to think through the problem before answering.

Add: *"Think through this step by step. Explain your reasoning for each step. Summarize at the end."*

**Exception:** Do NOT add this to Claude's extended thinking mode or reasoning-native models (o3, o4-mini, DeepSeek-R1). They reason internally — adding CoT instructions degrades output.

---

### 6. Give Context That Shapes the Answer

Tell Claude:
- Who the output is for (technical expert, non-technical exec, 8th grader)
- How the output will be used (board meeting, internal Slack, published blog)
- What constraints apply (word count, platform, existing style guide)

Context lets Claude calibrate register, depth, and assumptions. Without it, Claude defaults to middle-of-the-road.

---

### 7. Iterate With Precision

If the first response misses, don't say "make it better." Say exactly what to change.

| Weak | Strong |
|------|--------|
| "Make it better" | "Shorten paragraph 2. Make the tone more casual. Add one customer example in section 3." |

Vague feedback = random walk. Specific feedback = targeted correction.

---

### 8. Allow Uncertainty

Add: *"If you're unsure, say so. Don't guess."*

Without this, Claude will often fill gaps with plausible-sounding but wrong information. Explicit permission to say "I don't know" improves factual reliability.

---

## Anti-Patterns Catalog

These are the 10 most common prompt failure modes. Diagnose against this list first.

| # | Anti-Pattern | Symptom | Fix |
|---|-------------|---------|-----|
| 1 | **Vague task verb** | Output is generic, off-target | Replace "help me with" → "write / analyze / extract / compare" |
| 2 | **No output format** | Wall of prose when you wanted a table | Specify format explicitly: "respond as a table with columns X, Y, Z" |
| 3 | **No length constraint** | 800 words when you needed 3 sentences | Add word count or item count |
| 4 | **Missing audience** | Wrong register (too technical, too simple) | State who reads this and their expertise level |
| 5 | **No role assignment** | Generic response to a specialized question | Add domain expert identity in the opening line |
| 6 | **Assumed shared context** | Claude misses key constraints it wasn't told | Every prompt must be self-contained — paste all relevant context |
| 7 | **Two tasks in one prompt** | Claude does one well, bungles the other | Split into 2 sequential prompts |
| 8 | **No success criteria** | You don't know if the output is good | Define what "done" looks like: "this should enable a non-technical person to understand X" |
| 9 | **No constraints** | Output includes things you explicitly don't want | Add MUST NOT rules: "do not include jargon, do not exceed 3 bullet points per section" |
| 10 | **Vague refinement request** | Iteration doesn't converge | Name the specific element to change and the direction: "shorten section 2 by 50%, not the whole response" |

---

## Prompt Self-Scoring Checklist

Before sending any prompt, score it against these 8 criteria. Each is pass/fail.

- [ ] Task verb is precise (write / extract / compare / summarize — not "help" or "do")
- [ ] Output format is specified (table / list / prose / JSON / outline)
- [ ] Length or item count is defined
- [ ] Audience or use case is stated
- [ ] All necessary context is included (no assumed shared knowledge)
- [ ] Role assignment present (for complex/specialized tasks)
- [ ] MUST NOT constraints added (for tasks with known failure modes)
- [ ] Success criteria defined (how will you know it worked?)

6/8 minimum for a reliable first-pass response. 8/8 for high-stakes tasks.

---

## Claude-Specific Notes

These apply specifically to Claude and are not in the base guide.

**XML tags improve structure on long prompts.** For multi-section prompts, wrap distinct parts:
```
<context>background info here</context>
<task>what you want done</task>
<constraints>what must and must not happen</constraints>
<output_format>exactly how to format the response</output_format>
```

**Claude 4.x follows instructions literally.** Missing context = narrow literal output. If you want Claude to exercise judgment, say so explicitly: "use your judgment where the instructions are ambiguous."

**Claude Opus over-engineers by default.** Add: *"Only make changes directly requested. Do not refactor, expand, or add features beyond the task."*

**Thinking mode (extended thinking).** Do NOT add "think step by step" — Claude calibrates depth automatically. To increase depth: *"Think carefully before responding."* To decrease: *"Prioritize a quick response."*

**No memory across conversations.** Every new chat needs full context. Don't reference "what we discussed earlier" in a fresh session — it won't work.

**System prompts vs user prompts.** If you control the system prompt, put persistent role, constraints, and output format there. Use the user turn for task-specific instructions. Don't repeat system prompt content in every user message.

---

## Task-Type Templates

Fill-in-the-blank starters for the most common task types.

**Content creation**
```
Write a [FORMAT] about [TOPIC] for [AUDIENCE]. Tone: [TONE]. Length: [LENGTH].
Include: [REQUIRED ELEMENTS]. Do not include: [EXCLUDED ELEMENTS].
```

**Document analysis**
```
I've attached [DOCUMENT NAME]. Analyze it and provide:
1. [SPECIFIC FINDING TYPE]
2. [SPECIFIC FINDING TYPE]
Cite page numbers or sections for each point. If uncertain, say so.
```

**Data analysis**
```
Analyze [DATA SOURCE]. Present findings as:
- Executive summary (2-3 sentences)
- Key metrics: [LIST METRICS]
- Top [N] trends with brief explanations
- [N] recommendations with rationale
```

**Brainstorming**
```
Generate [N] ideas for [GOAL]. For each idea:
- One-sentence description
- Why it works for [CONTEXT]
- Level of effort: low / medium / high
```

**Comparison**
```
Compare [OPTION A], [OPTION B], [OPTION C] in a table.
Columns: [CRITERIA 1], [CRITERIA 2], [CRITERIA 3], [CRITERIA 4].
Add a "Best for" row at the bottom.
```

**Refinement**
```
Revise the [ELEMENT] above. Changes:
1. [SPECIFIC CHANGE + DIRECTION]
2. [SPECIFIC CHANGE + DIRECTION]
Keep everything else the same.
```

---

## Skill Boundaries

| Task | Use This Skill | Use prompt-master |
|------|---------------|-------------------|
| Explain why a prompt is weak | ✅ | |
| Teach someone prompting principles | ✅ | |
| Review a prompt for anti-patterns | ✅ | |
| Build a production-ready prompt from scratch | | ✅ |
| Optimize a prompt for a specific model | | ✅ |
| Fix a broken prompt and deliver a paste-ready version | | ✅ |
