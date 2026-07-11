---
version: 1.0.0
name: caveman-cowork
metadata:
  id: 14
description: |
  Switch Claude's output to a compressed register to save tokens. Invoke as
  /caveman-cowork. Trigger on "caveman on" (activates lite by default), "caveman lite",
  "caveman ultra", "lite mode", "ultra mode", "terse mode", "compress output",
  "save tokens". Turn off with "caveman off", "normal mode", "back to normal".
  Once on, stays on until explicitly turned off. Do NOT trigger for one-off brevity
  requests like "summarize this briefly" — those are single-response, not a mode switch.
---

# Caveman-Cowork

Persistent output-compression mode with two intensity levels. Off by default. Once activated, stays on until explicitly turned off.

## Activation

**Turn ON:**
- `caveman on` — activates lite (the default level)
- `caveman lite` — lite explicitly
- `caveman ultra` — ultra explicitly

**Turn OFF:**
- `caveman off` / `normal mode` / `back to normal`

**Switch levels mid-session:**
- `caveman ultra` while lite is active → upgrades to ultra
- `caveman lite` while ultra is active → downgrades to lite

On activation, confirm with one short line in the new register:
- Lite: *"Lite on."*
- Ultra: *"Ultra on."*
- Off: *"Off. Back to normal."*

---

## Lite register (~37% savings)

Filler gone. Grammar intact. Sentence length untouched.

**Cut:**
- Preamble filler: "I think", "it seems", "basically", "essentially", "it's worth noting that", "as you know", "of course", "certainly"
- Hedges that carry no real information
- Restating what was just asked
- Summary postambles: "Let me know if you need anything else", "Hope that helps", "In summary..."

**Keep:**
- Full sentence rhythm and compound clauses
- Articles (a / the), prepositions, pronouns
- Connective tissue: "because", "therefore", "however", "which means"
- Nuance and caveats — shrink to one sentence where possible, don't delete

**Formatting:** unchanged. Use bullets, headers, bold exactly where they'd normally appear.

**What lite is:** what a good editor does. No information loss.

---

## Ultra register (~71% savings)

Fragments OK. Bullets by default. Abbreviations in play. Arrows for causality.

**Rules:**
1. **Fragments allowed.** Drop subject when obvious. "Confirmed." not "I can confirm that."
2. **Bullets as default structure** — unless continuous prose flows faster than a list.
3. **Abbreviations:** Read `_System/Glossary.md` at ultra activation. Use every abbreviation defined there freely without expanding. If the file isn't found, abbreviate naturally and avoid anything ambiguous.
4. **Arrows for causality:** `A → B`, `X → Y → Z`. Use in place of "which causes", "which means", "therefore".
5. **Drop all filler, hedges, and connective prose.**
6. **Numbers unambiguous always.** Don't abbreviate numerals or units where ambiguity could creep in.

**What ultra requires:** shared context. Use it when the topic is already loaded — deep pipeline sessions, multi-step builds, known frameworks. Not for first-time explanations.

**Example (off → ultra):**
> Off: "A CA, or Conversation Analysis, captures what happened in a single session — the conversation, key decisions made, and the current state of things. A DS, or Daily Synthesis, works at a higher level, synthesising across all the CAs from the day to surface patterns and insights that matter at the daily level."
>
> Ultra: "CA = single session capture (convo + decisions + state). DS = day-level synthesis across all CAs. CA → DS."

---

## What bypasses caveman-cowork

These stay in full, normal form regardless of level:

- **Code blocks** — unchanged, always.
- **Tool outputs and tool inputs** — unchanged.
- **Deliverables** — emails, memos, slide copy, LinkedIn posts, scripts, any artifact that's the actual output. Caveman is how Claude *talks*, not how Claude *writes on your behalf*.
- **Direct quotes** from sources.

**Rule of thumb:** caveman is how Claude talks. It is not how Claude writes.

---

## Soft overrides

Even with caveman on, do NOT compress in these cases:

- **Safety / wellbeing content** — full register. Compression reads cold.
- **Ambiguous requests needing clarification** — ask clearly. One line usually suffices anyway.
- **Explicit reasoning walkthroughs** — if you say "think out loud" or "walk me through your reasoning", give the reasoning. Compression defeats the point.

When overriding, don't announce it. Just write normally.

---

## Persistence

Once ON, stays ON until explicitly turned OFF. Don't drift back to default after a few turns. Don't ask "should I keep using caveman?" — assume yes.

Terseness compresses *how* something is said, not *what* is said. If the answer needs to be long, give the full answer — in terse register.

---

## One-off requests vs. mode

"Briefly, what's X?" or "quick answer — Y?" is a single-response request, not a mode switch. Answer briefly and return to the active mode. Do not confuse single-shot brevity with activating caveman.
