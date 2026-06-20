# Master Entry Schema - Field Rules

Canonical schema for every CogniqOS Lexicon concept. Structured, enforceable, automation-compatible. Reject conditions are marked REJECT.

## 1. Identification
- **Concept name**: 5 words or fewer. Non-redundant with existing entries. Not a rebrand of a known concept unless explicitly tagged in field 12.
- **Aliases / related terms**: existing literature names (required if applicable).

## 2. Classification
- **Domain**: Cognitive Bias / Social Behavior / Systems / AI / Economics, etc.
- **Type**: Descriptive / Mechanistic / Systemic / Coined / Derived.
- **Epistemic status** (one primary, optional secondary): Empirical (Replicated) / Empirical (Mixed-Contested) / Observational / Theoretical / Speculative / Coined (Original Synthesis).
- **Confidence**: High / Moderate / Low.
- **Tier**: 1 Foundational / 2 Supporting / 3 Peripheral.

## 3. Definition (strict)
One sentence, 35 words or fewer. Must include agent (who/what), condition (when), outcome (what happens).
REJECT if: vague ("people tend to" with no condition), circular, or purely descriptive without constraint.

## 4. Mechanism
- **Primary** (required): causal explanation in 2-4 points, including driver, process, result.
- **Competing / complementary** (required if applicable): at least one alternative, or explicit "no strong competing model".
REJECT if: mechanism restates the definition, or uses vague neuroscience ("dopamine causes X") without specificity.

## 5. Predictions (non-trivial)
2-3 falsifiable predictions. Format: if [condition], then [observable outcome] increases / decreases.
REJECT if: tautological or obvious ("people will show bias").

## 6. Boundary conditions
Minimum 2 conditions where the concept does NOT apply (environment constraints, population differences, domain limits).

## 7. Failure modes
Minimum 2 cases describing how the concept misleads or breaks.
REJECT if: generic ("can be misused").

## 8. Decision rules (core output - mandatory)
2-4 operational rules, not advice. Format: if [situation], do [specific action] (constraints, thresholds, pre-commitments).
REJECT if: vague ("be aware", "think carefully").

## 9. Cost model (standardized)
- **Impact if ignored**: Low / Moderate / High.
- **Cost dimensions** (at least 2): Time / Money / Accuracy / Social-Reputation / Irreversibility.
- **Reversibility**: Reversible / Partial / Irreversible.

## 10. Interactions
- **Reinforces**: 2-3 related concepts.
- **Conflicts with**: at least 1.
- **Common bundles**: typical real-scenario combinations.

## 11. Evidence & attribution
- **Primary sources**: original / foundational works.
- **Secondary / popularizers**: books, summaries.
- **Evidence notes**: replication status, known limitations (WEIRD samples, etc.).
Standardize citation format (APA or Chicago). Separate primary source from replication / review.

## 12. Originality tag (legal / intellectual clarity)
Choose one: Established Concept (no modification) / Renamed Concept (must link original) / Reframed Concept (interpretation shift) / Synthesis (multi-source) / Original Model (new construct).
REJECT if: unclear or inflated claim.

## 13. Canonical examples (controlled)
Max 2 examples. Avoid overused textbook cases. Prefer modern, cross-domain, non-obvious.

## 14. Misuse risk
Describe how users might misapply, weaponize, or overgeneralize the concept. Include the "apply to yourself first" guard.

---

## Validation engine

### Hard-fail (auto-reject)
Missing predictions / decision rules / mechanism; definition over 35 words; no boundary conditions; no originality classification.

### Soft-fail (needs revision)
Countermeasures vague; examples too generic; no competing explanations; cost model missing dimensions.

### Quality scoring (0-5 per dimension)
Clarity, Mechanistic depth, Predictive power, Operational usefulness, Original contribution.
Minimum publish threshold: average >= 3.5, no single category < 2.

---

## Upgrade protocol (existing entries, apply in order)
1. Structural completion - fill missing fields; add predictions + decision rules everywhere.
2. De-derivatization - replace canonical examples and standard explanations; add >=1 novel angle per entry.
3. Deduplication - cluster overlapping entries; merge or assign parent/child.
4. Epistemic tagging - assign status + confidence; downgrade weak entries.
5. Pruning - remove entries failing predictive power or decision usefulness; cut or merge bottom 20-30%.

## Optional: Decision Mode Layer
For each concept, map when to check it and what trigger activates it. Moves the system from reference-heavy toward decision-native.
