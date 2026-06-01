---
name: blind-spot-audit
version: 1.0.0
description: Surfaces "what I know I didn't look at" — the lateral checks Claude never ran because no one assigned them. Distinct from task-audit (did I finish assigned items) — this catches checks that were never in scope. Use after any multi-item edit on a structured artifact, before publish/ship, or via /blind-spot. Demotes every unverified "looks fine" assertion to a flagged unknown until directly inspected.
---

## When to Use This Skill

Claude reliably QAs the exact edit it just made and verifies that one edit. It is weak at lateral QA — the checks no one asked for. This skill front-loads that pass instead of relying on the user to surface gaps ad hoc.

Use:
- After any multi-item edit on a structured artifact (multi-post doc, set of files, schema, config across sections)
- Before publish, ship, pack, or any irreversible commitment
- Via `/blind-spot` slash command
- When a handoff or session lists "self-identified QA gaps" that were never closed

Distinct from:
- **task-audit** — answers "did I finish every item in scope." This answers "what was never in scope to begin with."
- **sparring-partner** — attacks the work's argument and conclusions. This catches mechanical and structural omissions. Run blind-spot first (cheap, structural), sparring-partner second (expensive, semantic).

---

## Core Mechanic

Produce four lists of checks Claude did NOT run, then assign each a confidence flag. The default flag for anything not directly inspected is ❓ — never ✅ by assumption.

**A. Cross-item consistency** — properties asserted uniform across items but verified on only some. (markers present on all N items? formatting inherited identically? labels match a canonical set?)

**B. Downstream / render behavior** — outcomes Claude asserted but cannot observe from here. (how a glyph renders in the target platform, how pasted content reflows, whether a link resolves)

**C. Inherited assumptions never verified** — facts taken from a source, prior session, or clone without independent check. (a tag's correctness against the source of truth, a value carried from a template, "it was right last time")

**D. Coherence across items** — whether references between items actually resolve. (do "see next" chains point to things that exist? do cross-references form a coherent path? are IDs unique where assumed?)

---

## Hard Rules

**Demotion rule**
- Every "looks fine / should be correct / all uniform" claim about something Claude did not directly inspect this session is demoted to ❓ until verified. No exceptions for "it was fine last time."

**Assertion-without-sight rule**
- If Claude asserted a visual or downstream outcome it physically cannot see from its environment, it goes in list B flagged ❓ and is named as an assertion, not a finding.

**Clone-inheritance rule**
- After any clone-based insert (copying an existing node as a template), audit ALL inherited properties, not just the one being changed. List every property that rode along. This is a known recurring failure.

**Scope-shift rule**
- After inserts or deletions, item boundaries and indices shift. Never reuse a cached map. Note if any check relied on a pre-edit boundary map.

**No-padding rule**
- If a list is genuinely empty after honest review, say "none identified" and state what was checked to reach that. Do not invent gaps to look thorough.

---

## Output Format

```
---
**Blind-Spot Audit**

A. Cross-item consistency
- [check]: [✅ verified this session / ❓ not run — what's unknown]

B. Downstream / render behavior
- [asserted outcome]: ❓ asserted, not observable from here — [what can't be seen]

C. Inherited assumptions
- [assumption]: [source it came from] — [✅ checked / ❓ taken on trust]

D. Coherence across items
- [reference type]: [✅ resolves / ❓ never traced]

Biggest unverified risk: [single highest-stakes ❓]
Recommended next check: [one concrete action]
```

---

## Example

```
---
**Blind-Spot Audit**

A. Cross-item consistency
- [PULL QUOTE] marker on all 25 posts: ❓ not run — inserted dividers on all 25, never confirmed every post still carries its pull-quote marker
- Heading3 label formatting: ✅ verified this session — zero direct run-prop overrides across 324 labels

B. Downstream / render behavior
- 8-em-dash divider renders as distinct CTA break in Substack: ❓ asserted, not observable from here — XML is distinct from the 20-dash divider, but Substack autoformat/collapse behavior on pasted dashes was never tested

C. Inherited assumptions
- 20 VOL 1 tags correct: from prior session — ❓ taken on trust; only the 5 mismatches were ever checked against the Lexicon
- Guide-line italic not bold: from clone of MY DECISION block — ✅ checked after first pack shipped bold

D. Coherence across items
- "Next trap in the chain" lines: ❓ never traced — not confirmed they point to traps that exist in the series or form a coherent path

Biggest unverified risk: VOL 1 tag correctness — 20 tags unaudited against source of truth, structural mislabel ships silently
Recommended next check: cross-check all 25 VOL tags against Lexicon v48 before pack
```

---

## Scope Detection

Derive the item set the same way task-audit does (user list, file sections, numbered checklist). Then, for each of the four categories, ask: "what property of this set did I assume rather than inspect?" The audit targets the assumptions, not the items.
