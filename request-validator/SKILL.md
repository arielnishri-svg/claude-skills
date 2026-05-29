---
name: request-validator
version: 1.0.0
description: Validate every output request before execution. Runs automatically on complex tasks and manually via /validate. Extracts request intent (format, deliverable, structure, scope), maps planned output against it, and BLOCKS execution if mismatch detected. Use this to catch format errors, scope creep, and structural misalignment before wasting tokens. Critical for preventing "I made X but you asked for Y" rework cycles.
---

# Request Validator

Validates every output request against actual user intent before executing. Catches format mismatches, wrong deliverable types, structural errors, and scope creep upfront.

## When to Use

**Auto-trigger on:**
- Creating files (.docx, .xlsx, .pdf, code files, etc.)
- Building artifacts (React, HTML, SVG, interactive tools)
- Complex multi-step tasks with specific output requirements
- Any task where format/structure is critical

**Manual trigger:**
- `/validate` command before starting work on ambiguous requests
- When uncertain about expected output format

## Validation Framework

### 1. Parse Request Intent

Extract from the user message:
- **Deliverable type**: What are they asking for? (file, artifact, prose, code, analysis, tool, etc.)
- **Format requirement**: Explicit format? (.docx, .jsx, markdown, inline, etc.)
- **Structure expectation**: List vs prose? Table vs narrative? Organized by what logic?
- **Scope boundaries**: What's included? What's explicitly excluded?
- **Success criteria**: How will they know it's correct?

### 2. Identify Output Constraints

List what constraints the request implies:
- File format (if any)
- Length/brevity expectations
- Structural layout
- Technical requirements (responsive, interactive, etc.)
- Audience/tone
- Deliverable location (artifact vs inline vs download)

### 3. Map Planned Approach

Before executing, state:
- What you plan to output (be specific: "React artifact with dropdown menu in .jsx")
- How it matches the request intent
- Any assumptions you're making

### 4. Validation Check

Compare planned output against parsed intent. Flag if:
- **Format mismatch**: They asked for .docx, you're building HTML
- **Deliverable mismatch**: They want inline analysis, you're creating an artifact
- **Structure mismatch**: They asked for a list, you're building prose
- **Scope creep**: You're building features they didn't ask for
- **Structural error**: They asked for one thing, the structure/logic suggests another
- **Missing requirement**: They specified a constraint you overlooked

### 5. Block or Proceed

**If mismatch found:**
- STOP execution
- Show the mismatch clearly (parsed intent vs planned output)
- Ask: "Is this correct?" or suggest the fix
- Wait for explicit confirmation before proceeding

**If aligned:**
- Proceed with execution
- No announcement needed

## Example Validation

**Request**: "Write a Python script to parse CSVs"

Parse intent:
- Deliverable: code file
- Format: .py (implicit from "script")
- Structure: executable, organized by functions
- Scope: CSV parsing, no UI

Planned approach: Create `/home/claude/csv_parser.py` with functions for read/parse/output

Validation: MATCH ✓ Proceed.

---

**Request**: "Create a dashboard showing Q4 revenue"

Parse intent:
- Deliverable: interactive tool
- Format: web-based (implied, visual + interactive)
- Structure: dashboard layout with charts
- Scope: revenue data visualization

Planned approach: Build React artifact with recharts

Validation: MATCH ✓ Proceed.

---

**Request**: "Explain how OAuth works"

Parse intent:
- Deliverable: explanation/analysis
- Format: inline prose
- Structure: conceptual explanation
- Scope: OAuth flow, not implementation

Planned approach: Create a .jsx artifact visualization

Validation: MISMATCH ✗ They asked for explanation (prose), you're building an artifact. Ask: "Should I explain this in prose, or create an interactive OAuth flow diagram artifact?"

## Validation Checklist

- [ ] Deliverable type matches request
- [ ] Format (file/artifact/inline/etc.) matches request
- [ ] Structure (list/prose/table/etc.) matches expectation
- [ ] Scope is bounded to what they asked for
- [ ] No unasked features creeping in
- [ ] Constraints (length, tone, technical) acknowledged

## When Validation Fails

State clearly:
```
VALIDATION MISMATCH

Request intent:
- Deliverable: [what they asked for]
- Format: [what format]
- Structure: [what structure]
- Scope: [boundaries]

Planned output:
- [what you were going to build]

Mismatch:
- [specific mismatch]

Question for you:
[Ask for clarification or suggest fix]
```

Wait for explicit approval before proceeding.
