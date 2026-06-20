---
name: substack-post-standard
description: Author, review, repair, and upgrade CogniqOS Substack posts against the live post frame, and produce them through the full mechanical pipeline (concept resolution, metadata, OOXML emission, URL validation, splice, repack). Use when writing a new post from a Lexicon concept, reviewing or grading a draft for publish-readiness, running a targeted fix on a failing section, auditing a batch across multiple posts, or executing the post-creation pipeline end to end. Triggers include "review this post", "score this draft", "is this publish-ready", "write a post for concept X", "repair the countermeasure section", "run Pass A", "create post", or any request to apply the post quality standard. Enforces all live-frame sections, epistemic honesty, example originality, tone compliance, prompt architecture and URL validation. This skill is the specification for the cogniq-app "create post" button. Do NOT use for Lexicon entries (different format) or whole-system strategy critique.
---

# Substack Post Standard

Apply the CogniqOS post quality standard. A post earns its place not when it is informative but when it is structurally tight, epistemically honest, and operationally useful - structured to interrupt a real decision failure in a real reader.

## Skill chain on load

Before entering any mode, silently load these skills in order:

1. **humanizer** - strip AI-pattern prose from any generated output
2. **fact-checker** - flag any empirical claim that needs a source or carries disputed evidence
3. **sparring-partner** - run adversarial critique before a PUBLISH verdict
4. **blind-spot-audit** - surface lateral checks that were never assigned
5. **task-audit** - confirm all sections touched; report skipped items with reasons

Declare which skill is active at each stage. Do not run them silently without reporting.

---

## Modes

Detect the intended mode from context. If ambiguous, ask once using tappable multiple-choice.

- **AUTHOR** - write a new post from a Lexicon concept. Output all 14 sections. Refuse to ship if any hard-fail condition would trigger; flag what is missing instead of padding.
- **REVIEW** - grade an existing draft. Run hard-fail checks first, then soft-fail, then score 0-5 per dimension. State verdict and the specific fixes.
- **REPAIR** - fix one section or one failing dimension. Rewrite the targeted content, re-score that dimension, report what changed.
- **UPGRADE** - apply the 5-pass protocol across a set of posts. Report per-post what changed and what still fails.
- **PASS-A** - targeted example replacement pass. Find all canonical / commodity examples; replace with verified, non-obvious alternatives. Verify each replacement is real before inserting.
- **PIPELINE** - execute the full mechanical production sequence (below) for one or more concepts, ending in a validated docx. AUTHOR produces the prose; PIPELINE produces the artifact.

Always declare the mode at the top of the response.

---

## Known back-catalogue state (do not treat as a surprise)

Posts 1-35 in Substack_Posts_v37.docx were built on the earlier 13-section frame. They lack: Teaser line, Prediction, and the Danger Zone sub-section. This is a known, accepted deficit. All 35 are queued for an UPGRADE run to add the missing sections. In REVIEW mode, report these three as "pending scheduled upgrade" rather than fresh hard-fails. All NEW posts must carry all 14 sections from day one - no grandfathering for new work.

Post 34 (Base Rate Fallacy) uses the taxicab example in its hook. This is a known watchlist soft-fail, queued for Pass A at low priority (it deliberately replaced the worse 99%-medical-test cliché). Do not re-flag it as a discovery.

---

## The live post frame (14 sections)

Every post must contain all 14. Order is fixed.

**1. Teaser line** - one or two sentences above the title. Hooks on the reader's likely misconception or experience. Not a definition; a provocation.

**2. Concept title** - standalone H3, named exactly as in the Lexicon or the post title.

**3. The meme version** - what the popular / commodity understanding of this concept is. Name it precisely. Do not mock; diagnose. One to three paragraphs. VARY THE TURN across a batch: the correction move ("too strong", "backwards", "close but lazy") must not repeat its rhetorical shape in consecutive posts. Sometimes the meme is right but incomplete, sometimes a category error, sometimes true-but-useless.

**4. The mechanism** - what is actually happening, according to the evidence. Driver / process / result structure. Primary account named. Competing account or "one account" framing used (not "the mechanism is" unless genuinely settled). Epistemic status tagged inline for any mixed or weak evidence.

**5. Secondary mechanics** - supporting sub-sections that unpack the mechanism: real-world contexts, why knowing about it does not fix it, domain-specific amplifiers, etc. Typically 2-4 sub-sections. Label each with an H3.

**6. The countermeasure** - what to actually do. Concrete and operational. At least one named protocol or pre-commitment, not vague awareness advice. Threshold conditions included where possible.

**7. The harder / uncomfortable version** - where the concept implicates the reader personally or reveals a second-order consequence most readers miss. One to two paragraphs.

**8. Where it hurts** - 2-3 specific real-world cost examples, one per domain. Non-obvious preferred. Must be empirically grounded; if not, tag with (observational).

**9. When this isn't a bias** - the adaptive case. When does this cognitive pattern serve people correctly? Dual framing required; do not treat cognition as pure error.

**10. Common combinations / related traps** - 2-4 concepts this one reinforces or compounds with. One sentence each. Link to the post if published (see Cross-linking mechanics).

> **10a. Danger Zone** - one named cluster: the single most dangerous combination involving this bias. Format: `[Concept A] + [Concept B] + [this bias] - one sentence explaining why the combination is specifically worse than any part alone.` The sentence must describe the compounding mechanism, not just assert severity. Example: *Affect Heuristic + Narrative Fallacy + Outcome Bias - a bad result with a compelling story locks in a wrong lesson as emotional truth, bypassing any re-examination of whether the decision itself was sound.*

**11. Decision stress test** - 3-5 diagnostic questions the reader applies to their own current decision. Format: direct second-person interrogatives. No rhetorical questions. The stress-test scenario must be a DIFFERENT situation from the opening hook - different numbers, different domain. Never reuse the hook's statistic anywhere else in the post.

**12. Prediction** - 1-2 falsifiable if/then predictions specific to this bias. Format: "If [condition], then [outcome] increases/decreases." Non-obvious and testable.

**13. Sources** - 3-5 primary sources. URL validated per the URL procedure below. Flag any unvalidated URL with `[VALIDATE]`.

> **13a. People links** - every prominent named person in the post gets a link: Wikipedia or personal site for non-academics; Google Scholar profile or university page for academics. Validated like source URLs. A person named only in a citation line does not need a separate link; a person discussed in prose does.

**14. Run This Prompt block** - the AI audit prompt. Contains: context-setting instruction, `MY DECISION: [paste here]` placeholder, and an `Audit:` block with 4-6 numbered questions specific to this bias. Closes with the "Keep this in your stack. Next trap in the chain: [concept]." line. The Next-trap pointer must name a concept that has a published post, or flag it as `[UNRESOLVED - no post yet]`.

---

## Production pipeline (PIPELINE mode) - the create-post button spec

Inputs per post: one Lexicon concept (by # in the Master Mapping), its v48 entry, its GF metadata row, its See_Also row.

1. **Resolve concept** - `Lexicon_v48_Master_Mapping.xlsx`, sheet "Master Mapping": #, Concept Name, Volume, Canonical Section, Full Title, See_Also_1..5.
2. **Pull GF metadata** - `Lexicon_v48_greenfield_ranked.xlsx`, sheet "Ranked Topics": online_saturation, novelty, reader_pull, substack_fit, greenfield_score, group(tier). Build the metadata line exactly: `[Publish rank Tier N <label> · GF x pull y fit z sat s]`.
3. **Extract the v48 entry** - capture the `## N. Name: Subtitle` block to the next `## ` header. TRAP: the v48 "docx" is a UTF-8 plaintext/markdown file with a .docx extension. Read it directly. Never run docx tools on it (they fail with "Could not find EOCD").
4. **Map Canonical Section to the byte-exact VOL header** (`&` encoded as `&amp;` in XML). The 7 in use:
   - V1 I - `VOL 1. THE INDIVIDUAL PART I. JUDGMENT ERRORS & COGNITIVE SHORTCUTS`
   - V1 II - `VOL 1. THE INDIVIDUAL PART II. DECISION-MAKING & BEHAVIORAL DYNAMICS`
   - V1 III - `VOL 1. THE INDIVIDUAL PART III. SELF-DECEPTION & IDENTITY TRAPS`
   - V1 VB - `VOL 1. THE INDIVIDUAL PART VB. ATTENTION, PREDICTION & KNOWLEDGE GAPS`
   - V2 III - `VOL 2. THE GROUP PART III. SYSTEMS, INSTITUTIONS & POWER`
   - V2 IV - `VOL 2. THE GROUP PART IV. PROBABILITY, STATISTICS & SCIENTIFIC REASONING`
   - V4 V - `VOL 4. THE WORLD PART V. INFORMATION & MEDIA`
5. **Transform entry to the 14 sections** (AUTHOR mode rules apply). The Lexicon is canonical for concepts and evidence tags, NOT for prose: never propagate its textual defects (two v48 entries carry a mis-pasted affective-forecasting "failure mode" line). Write correct prose.
6. **Humanizer pass** on all generated prose.
7. **Fact-check pass** - verify claims and citations against primary sources; run the URL procedure on every link; apply the replication-caveat rule.
8. **Emit OOXML** matching the locked style table (below).
9. **Splice** into document.xml in REVERSE post-order (prevents index drift); update CONTENTS hooks, version label, count line.
10. **Repack** with pack.py using `--original`; **validate**; run blind-spot-audit + task-audit.

### Locked OOXML style table

```
Post title:    Heading1, after=160
Metadata:      italic, color B8860B, sz 18
VOL header:    Courier New, b, i, color C2522C, sz 17, before=80 after=200 (preceded by before=200 spacer para)
Section head:  Heading3, after=80
Body para:     color 12100C, before=80 after=120
Bullet:        ListParagraph, numPr ilvl=0 numId=2, before=60 after=60, color 12100C
Divider rule:  pBdr bottom single sz=4 color D9D3C7, before=200 after=200
Pull quote:    italic, color C2522C
Dash8/Dash20:  8x / 20x em-dash glyph rows, before/after=360 (divider glyphs only - not prose)
Prompt H2:     Heading2 "Run This Prompt: <name>", before=240 after=120
Prompt gray:   italic, color 888888
Source line:   ind left=1080 hanging=1080, prefix "• " (U+2022 + space), text + <w:hyperlink r:id> + suffix
```

Hyperlink relationships live in `word/_rels/document.xml.rels`. Check the max rId before adding new ones; start well clear of it.

### Edit-safety rules (mandatory in PIPELINE and REPAIR)

- Assert `count(anchor) == 1` before any string replacement. If not exactly 1, stop and re-anchor.
- Multi-region edits run in reverse document order to prevent index drift.
- **Match hyperlinks by post + rId, never by link text alone.** The same source (e.g. Kahneman) is cited across many posts with separate rIds; a text-only match WILL edit the wrong post. Map every candidate rId to its containing post before touching it.
- Verify post counts against cogniq-brain.md, never against working-session figures.
- Warn before any destructive or lossy operation.

---

## URL validation procedure

Preference order: (1) official publisher page for the work, (2) permanent resolver for papers - doi.org or PubMed, (3) journal landing page, (4) `scholar.google.com/scholar?q=` search link. Google Books id-based links are BANNED (they 404).

Procedure, per URL:

1. HTTP-fetch the preferred URL. Pass = reachable AND resolves to the cited work (title/author visible).
2. On failure, walk DOWN the preference order automatically and validate the fallback. Do not just flag-and-stop.
3. Robots-blocked publisher sites (e.g. us.macmillan.com) count as "correct but unverified-by-fetch": keep the URL, flag for a manual eyeball, do not reject.
4. Any URL that has not been validated ships flagged `[VALIDATE]` - never silently.

---

## Examples: originality with honesty

### Commodity example watchlist (auto-flag, soft-fail, queue for Pass A)

- WWII Wald bombers (Survivorship Bias)
- Linda / bank teller (Representativeness)
- Standard medical test with 1% prevalence (Base Rate)
- Kahneman taxi / cab colour (Base Rate / Representativeness)
- Jam study as the sole choice-overload example (acceptable as a recognised anchor only when paired with an obscure second example)
- Milgram (Obedience) when used as the sole social-pressure example
- Steve Jobs garage (Survivorship Bias / Overconfidence)
- Any example described as "famous study" without naming who did it

### Replication-caveat rule

Obscure examples are likelier to carry shaky replication. Before inserting any non-canonical example, check its replication status. If mixed or failed (e.g. Song & Schwarz 2009 has a failed replication on new stimuli), phrase as "in one study" - never as settled law. Originality must not cost epistemic honesty.

### Verified examples bank (fact-checked, ready for reuse)

- **Fluency:** Song & Schwarz 2009 - invented food additives rated more harmful when hard to pronounce (Hnegripitrom vs Magnalroxate). Caveat: failed replication on new stimuli; use "in one study".
- **Choice overload:** Iyengar, Huberman & Jiang 2004 - ~800,000 retirement savers; every 10 extra fund options dropped 401(k) participation by ~2%.
- **Halo:** Nisbett & Wilson 1977 - same instructor filmed warm and cold; viewers rated his appearance and accent differently and then DENIED the halo, insisting causation ran the other way. Forewarning did not eliminate it.
- **Base rate:** taxicab problem (85/15 base rate, 80% witness, correct answer 41%) - WATCHLISTED; less saturated than the medical test but still Kahneman canon. Use only as a stopgap.

Add to this bank whenever a new example passes fact-check.

---

## Validation (REVIEW mode)

### Hard-fail (auto-reject; fix before any scoring)

- Missing any of the 14 sections (for posts 1-35, the three known-missing sections report as "pending scheduled upgrade", not fresh failures)
- Countermeasure section contains only awareness advice with no named protocol or concrete action
- Sources section has 0 validated URLs
- Prediction section missing or contains tautological / non-falsifiable if/then statements
- "When this isn't a bias" section absent (pure-error framing disqualifies)
- Danger Zone sub-section absent or contains more than one cluster, or the cluster sentence asserts severity without naming the compounding mechanism
- Definition or mechanism section asserts as settled fact what the Lexicon tags as Evidence: Mixed or Evidence: Weak - without inline epistemic qualifier

### Soft-fail (needs revision; does not auto-reject)

- Commodity-watchlist example used - flag and queue for Pass A
- Meme version section is vague rather than naming the specific misconception
- Meme-version correction turn repeats the rhetorical shape of the previous post in the batch
- The same statistic or scenario appears in more than one section of the post (hook, countermeasure, stress test must each stand on distinct material)
- Countermeasure has no threshold condition - just an action with no "when" trigger
- Decision stress test questions are rhetorical, not interrogative
- Next-trap pointer is unresolved (no post exists) but not flagged
- Named person discussed in prose with no people-link (13a)
- Pull-quote markers (`[PULL QUOTE...]`) removed or absent where a pull-quote was present in the source

### Scoring (0-5 per dimension)

**Publish threshold: average >= 3.5 AND no single dimension < 2.**

Rubric anchors (use these; do not freehand scores across sessions):

**Clarity** - 2 = readable but hedged or vague. 3 = reader understands the failure without prior knowledge. 4 = mechanism and countermeasure are unambiguous on first read. 5 = a reader could explain this accurately to a colleague after one pass.

**Mechanistic honesty** - 2 = states a cause, no process, no epistemic tag. 3 = driver/process/result present, contested claims tagged. 4 = competing account named or explicitly noted as absent. 5 = mechanism is derived and boundary stated; "leading account is" language used where appropriate.

**Operational usefulness** - 2 = advice level ("be aware", "check for"). 3 = one named protocol with a trigger condition. 4 = 2+ concrete actions, one with a pre-commitment or threshold. 5 = decision stress test and countermeasure together constitute a usable interrupt under time pressure.

**Example originality** - 2 = commodity example, well-known canonical case. 3 = non-textbook but still familiar. 4 = obscure, verified, and cross-domain. 5 = proprietary or coined example that readers will not have seen elsewhere.

**Tonal compliance** - 2 = motivational, spiritual, or productivity-influencer tone present. 3 = neutral but lacks CogniqOS precision. 4 = precise, unsentimental, calibrated throughout. 5 = tone is itself the argument - clinical precision functions as proof of the thesis.

Report as a table: dimension, score, one-line reason. Then verdict: PUBLISH / REVISE / REJECT.

### Batch-level checks (run whenever 2+ posts are in scope)

- No two consecutive posts use the same meme-version correction turn
- No example appears in more than one post in the batch
- Next-trap pointers audited as a set: every pointer either resolves to a post or carries the `[UNRESOLVED]` flag
- Metadata lines consistent with the greenfield_ranked source, not inherited figures

---

## Pass A: example replacement

Trigger: user invokes Pass A or says "replace the canonical example."

For each flagged example:

1. Identify the canonical / commodity example and the section it appears in.
2. Propose 1-3 verified replacements. Each must be: real (not fabricated), non-obvious, cross-domain preferred, and attributable to a source.
3. Run `fact-checker` on every proposed replacement before presenting; apply the replication-caveat rule.
4. Present as before/after. Do not apply without approval.
5. After applying, run `blind-spot-audit` to catch adjacent examples in the same post that were not in scope.
6. Add every approved replacement to the verified examples bank.

---

## Upgrade protocol (UPGRADE mode)

Apply in order across all posts in scope. Report per post.

1. **Structural completion** - fill any missing sections; for posts 1-35 this means adding Teaser, Prediction and Danger Zone; write decision stress tests where absent
2. **Example de-commodification** - flag and queue all commodity examples for Pass A
3. **Epistemic tagging** - add inline evidence qualifiers to any claim the Lexicon tags as Mixed or Weak
4. **Prompt tightening** - ensure Run This Prompt audit questions are bias-specific (not generic); remove any question that would apply equally to all 35 posts
5. **Next-trap resolution** - audit all Next-trap pointers; flag unresolved ones; do not fabricate posts that do not exist
6. **Link enrichment** - add people-links (13a) and inter-post cross-links where target URLs exist

---

## Cross-linking mechanics

- Target URLs come from the `substack_url` column in cogniq-app, pasted manually by Ariel per post after publishing. The doc is not the URL source.
- First-priority link targets: the Related Traps section and the Next-trap pointer line.
- Never link a dangling pointer. A concept with no published post keeps the `[UNRESOLVED - no post yet]` flag instead of a link. Roughly 10 of 35 current next-trap pointers dangle by design - do not "fix" them by inventing posts.
- In-body concept mentions (e.g. Survivorship Bias named inside the Narrative Fallacy post) are second-priority targets, linked only once per post per concept.

---

## App integration contract (locked design decisions - do not relitigate)

1. **Storage:** posts live in the cogniq-app DB as structured rows mirroring the Lexicon import pattern - one row per post, the sections as columns/JSON, parsed on `Post \d+:` Heading1 boundaries. In-app display re-renders from a template using the design tokens; OOXML styling is not stored. (Tokens: V1 teal #7daea3, V2 pink #d3869b, V3 orange #e78a4e, V4 green #a9b665, V5 blue #7da9d8; highlight gold #d8a657; body 12100C; metadata gold B8860B; VOL red C2522C.)
2. **Substack URLs:** nullable `substack_url` column, manual paste via the app UI. The importer does not read URLs from the doc. The launch button opens the column value in a new tab.
3. **Script:** Node module inside cogniq-app, matching the existing codebase. Design-only until explicit go.
4. **Generation depth:** full 14-section prose draft from the start, with a MANDATORY human-review gate. Auto-run validate + fact-check + humanizer, present for edit, mark draft - never auto-publish.
5. **New-post destination:** append to the posts docx as the authored artifact, then the importer syncs it to the DB. The docx is the human-editable source of truth; the DB is a derived copy.

---

## Cross-cutting rules (apply in every mode)

- No em dashes in any output. Spaced hyphens ( - ) only. En dashes for numeric ranges only. (The Dash8/Dash20 divider rows are glyph art, not prose - they are the sole exception.)
- No Oxford commas.
- Brand name: CogniqOS exactly. No variants.
- Never use "the mechanism is" for a contested cognitive account. Use "the leading account is" or "one explanatory model."
- Dual framing required: every post must name the context where the pattern is adaptive, not just maladaptive.
- Pull-quote markers (`[PULL QUOTE - blockquote this line in Substack, then delete this marker]`) are production cues. Never remove; never add new ones without flagging.
- Substack center-crop rule: when writing visual or image copy, key elements must fall within the center 50% of canvas height.
- URL validation is non-negotiable. Run the URL procedure; flag any unvalidated URL with `[VALIDATE]`. Google Books id-based URLs are banned.
- Post count: always verify against brain.md, not working-session figures.
- "Run This Prompt" block format is fixed. Do not restructure it.
- Sources section format: inline citation in prose + numbered list at end of post. Both must be present.

---

## Tonal standard

CogniqOS tone: precise, unsentimental, calibrated.

Flagged patterns that violate this standard (run humanizer before any PUBLISH verdict):

- Motivational openers ("This changes everything," "Here's what most people miss")
- Spiritual framing ("Your deeper self," "lean into discomfort")
- Filler intensifiers ("incredibly," "fascinating," "powerful")
- AI hedge-phrases ("It's worth noting that," "It's important to remember")
- Rule of three lists that feel assembled rather than derived
- Passive constructions where the agent matters ("It was found that" vs. who found it)
- Em dashes used for dramatic pause

---

## Author checklist (AUTHOR mode)

Before outputting a draft, verify:

- [ ] Concept exists in Lexicon v48 Master Mapping with correct name and tier
- [ ] Evidence level sourced from Lexicon entry (do not upgrade or downgrade without citing a source)
- [ ] Lexicon textual defects not propagated (prose written fresh; lexicon canonical for concepts/tags only)
- [ ] At least 1 non-commodity example drafted and fact-checked, replication status checked
- [ ] Hook scenario and stress-test scenario are different situations with different numbers
- [ ] Meme-version turn differs from the previous post in the batch
- [ ] Danger Zone names exactly one cluster; the sentence explains the compounding mechanism
- [ ] Countermeasure names a protocol, not just an awareness instruction
- [ ] Next-trap pointer names a concept with an existing post (or flagged `[UNRESOLVED]`)
- [ ] All source URLs validated via the URL procedure or flagged `[VALIDATE]`
- [ ] All prominent named people carry validated links (13a)
- [ ] Humanizer pass applied to generated prose
- [ ] Sparring-partner pass run before declaring draft complete
