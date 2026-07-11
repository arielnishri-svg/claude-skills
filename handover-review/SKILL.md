---
version: 1.0.0
name: handover-review
description: Run a rigorous, adversarial self-review pass on a piece of work before it ships, using a verification-and-failure-mode discipline (reconstruct the actual request, check decomposition against the load-bearing question, hunt every unverified specific, audit communication for hedging/confidence calibration, scan for known failure modes like confident interpolation and sycophancy). Trigger via /handover-review, "run the handover review", or "audit this before I ship it". Distinct from sparring-partner (adversarial review of an artifact's substance/credibility) and blind-spot-audit (lateral checks nobody assigned) — this is a self-audit against a specific verification discipline, run against the most recent piece of work in the conversation or an artifact the user points to.
---

# Handover Review: Self-Audit Before Shipping

Run an adversarial self-review pass on the most recent piece of work in the conversation, or on an artifact the user points to. This is not confirmation-seeking ("does this look fine?") — it is the review a departing operator would want their replacement to run before anything ships under their name. Treat every "looks fine" as unverified until actually checked.

## Step 0: Identify what's being reviewed

State in one line what the reviewed artifact is and what stakes attach to it (throwaway draft vs something that ships, gets acted on, or gets shown to someone else). This sets how hard the rest of the pass needs to work.

## Step 1: Reconstruct the request

Re-read the actual request, not your memory of it. Answer four questions:

- What deliverable was asked for — a decision, a document, a number, a diagnosis, an edit?
- Who consumes it, and what do they already know?
- What will they do with it next?
- What happens if it's wrong?

Classify the request: a **question about the world** (has a true answer — must be verified), a **judgment call** (no true answer, only trade-offs — must expose them and take a marked position), or **production work** (has a spec — must nail the spec and flag underdetermined parts). Flag if the work misclassified this — e.g. answered a judgment call as if it were settled fact, or turned production work into an open-ended essay.

## Step 2: Check the decomposition

- Did the work address the load-bearing sub-question first, or spread uniform effort across all parts equally?
- Are assumptions explicitly labelled, or is something in "had to assume this" territory dressed up as established fact?
- Are unknowable future items (prices, adversary behaviour, adoption rates) given scenario treatment, or delivered as point estimates with a straight face?
- Where there's a sequential dependency (X had to be settled before Y), does uncertainty in X visibly carry into Y, or has it been laundered into false precision downstream?

## Step 3: Verification audit — hunt every specific

Go through the work and flag every name, number, date, function signature, quote, URL, and claim about the present world (price, version, office-holder, whether a product still exists). For each, ask: was this verified *this session* with a tool, or is it fluency-generated?

- Anything countable — counted with a tool, not eyeballed?
- Anything computable — actually run, not mentally simulated?
- Anything quoted — read from source this session, or a paraphrase wearing quotation marks?
- Anything about the present world — looked up, or pulled from training data that may have decayed?

Anything that fails gets one of two treatments: label the uncertainty, or cut the claim. Flag any claim that shipped unlabelled. Also check whether the work cited its own earlier statements in this conversation as if they were sources — that's self-citation, flag it.

## Step 4: Communication audit

- Does the work lead with the conclusion, or build toward it?
- Does it take a position? ("It depends" is only acceptable if it names the two or three things it depends on and answers under each.)
- Is the epistemic status of each major claim marked — checked fact, inference, judgment — or is everything mushed together?
- Is confidence language calibrated ("likely" actually meaning likely), rather than uniformly hedged or uniformly bare?
- If the work surfaced a problem with the premise of the request, is that the headline, or buried?
- Are there vague quantifiers ("significant", "many", "often") that should be specific numbers or ranges instead?
- Is formatting proportional to the content? Heavy structure on thin substance is a tell.

## Step 5: Failure-mode scan

Check the work against each of these. Don't skip ones that feel obviously fine — that feeling is exactly what this discipline exists to catch.

1. **Confident interpolation** — any specific claim that feels sure but wasn't actually checked?
2. **Sycophancy** — did the work agree with the user's framing throughout? When did it last push back on something that mattered?
3. **Premature closure** — was a genuine rival explanation or approach ever constructed and argued for, or did the first plausible answer become the only one considered?
4. **Task substitution** — did the work quietly do the fluent, easy version of the task instead of the one asked (e.g. summarised instead of evaluated)?
5. **Scope creep / shrink** — did unrequested sections get added? Did the hardest, most pivotal part get a token paragraph while easy parts got pages?
6. **Format fixation** — is presentation polished ahead of the substance being correct?
7. **Instruction decay** — do format/tone/scope constraints from the start of the task still hold at the end?
8. **Refusing to say "I don't know"** — is there a gap that got papered over with a plausible guess instead of being named as a gap?
9. **Trusting fluency as understanding** — for domain-specific claims, could the work state a falsifiable prediction or what evidence would change the conclusion? If not, it's narration, not reasoning, and should be presented as such.
10. **Solving the wrong instance** — did the work rigorously answer a misread version of the question (wrong version, wrong system, wrong scope)?

## Step 6: Proportionality check

Is the confidence of the prose proportional to the strength of the work underneath? A quick pattern-matched answer delivered with the cadence of deep analysis is a small fraud — flag it and say what would fix it: extend the analysis, or lower the cadence.

## Output format

**Verdict**: one line — ship as-is / ship with fixes below / do not ship.

**What's solid**: one line, only if genuinely true. No padding.

**Findings**: numbered list. For each: the issue (one sentence), where it shows up, why it matters, fixable now or needs more input from the user. Every unlabelled or fabricated-risk claim from Step 3 goes here regardless of size.

**Biggest single risk**: one sentence naming the thing most likely to cause damage if this ships unchanged.

## What NOT to do

- Don't run this as a formality that always concludes "looks good." If a careful audit finds nothing, say so in one line and stop — don't pad the output to look thorough.
- Don't open with praise before critiquing. Go straight to findings.
- Don't flag stylistic preferences as failures — this is a rigor audit, not a taste audit.
- Don't soften a finding that would embarrass the work if wrong. That's the entire point of running this.

## Tone

Direct, unhedged, treats the reader as competent but not exempt from checking. No flattery, no "great question," no closing reassurance that everything's fine unless it actually is.
