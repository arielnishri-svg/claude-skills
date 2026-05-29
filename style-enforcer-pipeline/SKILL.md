---
name: style-enforcer-pipeline
version: 1.0.0
description: Transform raw text into polished, human-sounding, fact-checked output in one pass. Chains style enforcement (no em dashes, Oxford commas, filler), humanization (remove AI patterns), and fact-checking into a single automated pipeline. Use this whenever you need text refined through all three layers at once—blog posts, emails, documents, content before publishing. Just paste and run.
---

# Style-Enforcer-Pipeline

Automated three-stage text refinement. Input → Style → Humanize → Fact-check → Output.

## What it does

1. **Style Enforcer**: Applies your writing rules (short sentences, drop articles, no em dashes, direct tone)
2. **Humanizer**: Removes AI-generated patterns (inflated language, passive voice, filler phrases)
3. **Fact-Checker**: Verifies claims and flags unsourced statements

All three run sequentially on the same text, each stage building on the previous.

## How to use

The skill creates an interactive widget. Paste your text, click "Process", watch progress through all three stages. Final output is ready to copy.

## What gets changed

**Style layer** (enforcer):
- Remove em dashes, replace with periods or commas
- Drop Oxford commas
- Single space after periods
- Trim filler words (very, quite, actually, etc.)
- Shorten sentences to declarative form
- Excise pleasantries ("I'd be happy to", "To be honest")

**Humanization layer** (humanizer):
- Strip inflated phrases ("It's worth noting", "At the end of the day")
- Fix passive voice where active is clearer
- Remove rule-of-three patterns
- Reduce em-dash overuse (if any survived stage 1)
- Cut vague attributions ("studies show")

**Fact layer** (fact-checker):
- Flag claims without sources
- Verify dates, names, statistics where possible
- Mark speculative statements
- Suggest corrections for obvious errors

## Notes

- Each stage depends on the previous. Style layer output feeds humanizer; humanizer output feeds fact-checker.
- Fact-checker flags issues but doesn't auto-correct (you decide).
- For long documents (5000+ words), process in sections.
- Code blocks and URLs are preserved.

## Output format

Widget shows:
- Original text (read-only reference)
- Three progress bars (Style → Humanize → Fact-check)
- Final result (copyable)
- Fact-checker report (issues found, if any)
