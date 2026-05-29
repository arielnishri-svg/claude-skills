---
name: task-audit
version: 1.0.0
description: Appends a completion audit to any task. Reports exact count of items processed, names every skipped item with a specific reason, and uses the word "complete" only if every item was finished. Invoke via /task-audit or append "task-audit" to any instruction.
---

## When to Use This Skill

Append to any task where Claude is processing a defined set of items:
- Editing a list of prompts
- Reviewing a set of files
- Applying changes across multiple sections
- Executing a checklist
- Any multi-item task where partial completion is a risk

Triggered by:
- `/task-audit` slash command
- User appends "task-audit" to their instruction
- User says "report what you processed" after a task

---

## Output Format

After completing the task, always append this audit block. No exceptions.

```
---
**Task Audit**
Items processed: [exact number]
[If all complete]: ✅ Complete.
[If any skipped]: ⚠️ Not complete.

Skipped:
- [Item name]: [specific reason — not vague, not "couldn't do it"]
```

---

## Rules

**Count rules**
- Count is the total number of discrete items in the task scope — not the number attempted
- State processed count AND total count: "3 of 5 processed"
- Never round or estimate — exact numbers only

**Skip rules**
- Every skipped item gets its own line
- Reason must be specific: "file not found at path X" not "couldn't access"
- Acceptable skip reasons: missing input, ambiguous instruction (state what was ambiguous), out of scope per user's own constraints, tool limitation (name the tool and limitation)
- NOT acceptable: "ran out of space", "too complex", vague references to difficulty

**Completion word rule**
- Use "Complete" ONLY if: processed count = total count AND zero items skipped
- If 1 item was skipped for any reason: "Not complete" — no exceptions
- Partial success is never "complete"

**Honesty rule**
- If Claude made a judgment call on an ambiguous item, note it: "Item X: processed — assumed [assumption]"
- If Claude partially completed an item, it counts as skipped with reason "partially completed: [what was done, what was left]"

---

## Examples

**All items processed:**
```
---
**Task Audit**
Items processed: 4 of 4
✅ Complete.
```

**Some items skipped:**
```
---
**Task Audit**
Items processed: 3 of 5
⚠️ Not complete.

Skipped:
- prompt_007: no howToUse field provided in source, couldn't generate without context
- prompt_012: duplicate ID detected — skipped to avoid overwriting existing entry
```

**Assumption logged:**
```
---
**Task Audit**
Items processed: 5 of 5
✅ Complete.

Notes:
- prompt_003: processed — assumed "improve" meant tighten wording only, not restructure
```

---

## Scope Detection

When the task scope isn't explicitly stated, Claude infers it from:
- A list provided by the user (count the items)
- A file with sections (count the sections)
- A numbered checklist (count the numbers)
- An instruction like "all prompts in the DB" (query the DB for count first, then audit against that)

If scope cannot be determined, state it: "Scope unclear — audited against [what Claude used as the item list]. Correct this if the scope was different."
