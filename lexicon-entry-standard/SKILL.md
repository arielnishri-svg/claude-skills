---
name: lexicon-entry-standard
description: Author, review, score, and upgrade CogniqOS Lexicon concept entries against a fixed quality standard. Use when writing a new Lexicon entry, reviewing or grading an existing one, deciding whether a coined concept earns inclusion, or running an upgrade pass across multiple entries. Triggers include "review this entry", "score this concept", "is this entry publish-grade", "upgrade these entries", "does this coined concept pass the bar", or any request to apply the entry schema. Enforces per-entry epistemic tagging, falsifiable predictions, operational decision rules, and originality classification. Do NOT use for the Substack posts (different format) or for whole-system strategy critique.
---

# Lexicon Entry Standard

Apply the CogniqOS entry quality standard to one or more concept entries. The standard exists because the execution layer is the moat: a concept earns its place only if it does the work of an insight - increasing predictive or decision power - not just labeling a phenomenon. An entry becomes publish-grade not when it is correct, but when it is structured to be challenged, tested, and used.

## Modes

Detect which mode the request wants. If ambiguous, ask once using tappable options.

- **AUTHOR** - write a new entry to the schema. Output all 14 fields. Refuse to ship if any hard-fail condition would trigger; flag what is missing instead of padding.
- **REVIEW** - grade an existing entry. Run hard-fail checks first, then soft-fail, then score 0-5 per dimension. State verdict and the specific fixes.
- **GATE** - decide whether a coined concept may exist as a standalone entry. Apply the inclusion bar. Recommend keep / merge / cut.
- **REPAIR** - fix one entry that scored REVISE or REJECT. Rewrite to clear the failing checks, re-score, report what changed. This is the workhorse mode for the single-entry fix loop.
- **UPGRADE** - apply the 5-pass protocol across a set of entries. Report per-entry what changed and what still fails.

Always declare the mode at the top of the response (e.g. "REVIEW mode").

## The schema (14 fields)

Full field rules are in `reference/schema.md`. Read it before AUTHOR or REVIEW. Summary:

1. Identification - name (<=5 words, non-redundant), aliases
2. Classification - domain, type, epistemic status, confidence, tier
3. Definition - one sentence, <=35 words, must name agent + condition + outcome
4. Mechanism - primary (driver/process/result) + competing account or explicit "none"
5. Predictions - 2-3 falsifiable, format "if [condition], then [outcome] increases/decreases"
6. Boundary conditions - >=2 where it does not apply
7. Failure modes - >=2 specific (not "can be misused")
8. Decision rules - 2-4 operational, format "if [situation], do [action]" (not "be aware")
9. Cost model - impact if ignored (Low/Mod/High), >=2 cost dimensions, reversibility
10. Interactions - reinforces, conflicts with, common bundles
11. Evidence & attribution - primary source, secondary, replication notes
12. Originality tag - Established / Renamed / Reframed / Synthesis / Original Model
13. Canonical examples - max 2, prefer modern / cross-domain / non-obvious
14. Misuse risk - how users misapply, weaponize, overgeneralize

## Validation (REVIEW mode)

### Hard-fail (auto-reject, fix before any scoring)
- Missing predictions, decision rules, or mechanism
- Definition over 35 words
- No boundary conditions
- No originality classification

These are mechanical and belong to the script, not LLM judgment. If `validate_entry.py` exists in the repo root, run it for the hard-fail checks and report its verdict. If it does not exist yet, do the checks directly and label them as provisional (LLM-judged, not script-verified).

### Soft-fail (needs revision, does not auto-reject)
- Countermeasures / decision rules vague
- Examples too generic (textbook canonical cases)
- No competing explanation given
- Cost model missing dimensions

### Scoring (0-5 per dimension)
Score: Clarity, Mechanistic depth, Predictive power, Operational usefulness, Original contribution.

**Publish threshold: average >= 3.5 AND no single dimension < 2.**

Per-dimension rubric (anchors scores across sessions - use these, do not freehand):

- **Clarity**: 2 = readable but vague or hedged. 3 = clear, definition names agent+condition+outcome. 4 = sharp, no wasted words, unambiguous scope. 5 = a stranger could apply it correctly on first read.
- **Mechanistic depth**: 2 = asserts a cause, no process. 3 = primary mechanism with driver/process/result. 4 = primary + one credible competing account. 5 = mechanism is derived, not just named, and boundary of the account is stated.
- **Predictive power**: 2 = one vague or near-tautological prediction. 3 = 2 falsifiable if/then predictions. 4 = predictions are non-obvious and directionally specific. 5 = predictions would surprise a layperson and are testable with available data.
- **Operational usefulness**: 2 = advice ("be aware"). 3 = 2+ rules with a concrete action. 4 = rules have thresholds or pre-commitments, not just actions. 5 = rules are usable under time pressure without re-reading the entry.
- **Original contribution**: 2 = rename of an existing concept, weakly tagged. 3 = honest reframe or synthesis, correctly tagged. 4 = synthesis that compresses 2+ known effects into one usable unit. 5 = original model with a prediction the source concepts do not make.

Report as a table: dimension, score, one-line reason. Then verdict: PUBLISH / REVISE / REJECT.

## Inclusion bar (GATE mode)

A coined concept may stand alone only if it passes at least 2 of:
- Predicts something non-obvious
- Compresses multiple known effects
- Enables a concrete decision rule
- Resolves a contradiction

If it passes fewer than 2: recommend merge into the nearest established concept, or cut. Name the merge target. Coined concepts that only rename an existing mechanism must be tagged Renamed and linked to the original, never presented as Original Model.

**Precedence**: a Renamed concept (field 12) cannot pass GATE on the strength of "enables a decision rule" alone - the rule belongs to the original concept, not the rename. A pure Rename is cut or merged regardless of the 2-of-4 count. Originality tag overrides the GATE count when the tag is Renamed.

## Upgrade protocol (UPGRADE mode)

Apply in order. Report per entry.
1. **Structural completion** - fill missing fields; add predictions + decision rules everywhere
2. **De-derivatization** - replace canonical examples and standard explanations; add >=1 novel angle
3. **Deduplication** - cluster overlaps; merge or assign parent/child
4. **Epistemic tagging** - assign status + confidence; downgrade weak entries
5. **Pruning** - cut or merge entries failing on predictive power or decision usefulness; target bottom 20-30%

## Cross-cutting rules (apply in every mode)
- Replace "mechanism is" with "leading account is" / "one explanatory model" unless the mechanism is genuinely settled.
- Separate descriptive claims from prescriptive ones; they carry different evidence standards.
- Use dual framing for biases: adaptive in context X, maladaptive in context Y. Avoid framing all cognition as error.
- Every entry carries an "apply to yourself first" misuse guard.
- No em dashes in any output. Spaced hyphens ( - ) instead. En dashes only for numeric ranges.
- Brand name is always "CogniqOS" exactly.

## Worked exemplars

`reference/exemplars.md` holds 5 reference-grade entries (Content Selection Bias under near-zero marginal cost, Audience-Weighted Belief Expression, Proxy Metric Capture, LLM Probabilistic Coherence failure, Reward Prediction Error loop). Use them as the target shape in AUTHOR mode and as the calibration anchor in REVIEW mode. Do not copy their content; match their structure and rigor.
