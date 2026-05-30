---
name: product-launch
version: 1.0.0
description: Turn any product or skill into a complete go-to-market plan in one guided pass. Chains a 12-step workflow (idea generation, validation, outline, pricing, platform selection, sales page, 30-day content plan) into a single sequence with a hard validation gate before build. Use when the user wants to take a product, skill, or expertise to market — triggers include "launch", "go to market", "how do I sell this", "product plan", "pricing and platform", "/product-launch". Skips ideation steps automatically when the product already exists. Outputs a sales page and content plan ready for style/humanizer/fact-check polish.
---

# Product Launch: Skill-to-Market Engine

Turn a product, skill, or body of expertise into a complete, sellable go-to-market plan in one pass. Adapted from a 12-prompt sequence; upgraded with a validation gate, real-data checks, and artifact output.

## Trigger

`/product-launch`, or any request to take a product/skill to market.

## Step 0: Establish Inputs (required before anything else)

Do not run the chain on blanks. Generic inputs produce generic slop. Collect:

- **Product / skill:** what it is
- **Stage:** idea-only | building | live-but-not-selling | selling
- **Audience:** who buys it (specific, not "everyone")
- **Goal:** first sales | testimonials | recurring revenue | scale
- **Time available:** before wanting first revenue

If any are missing and stakes are high, ask once (load `clarifying-questions` if deeply ambiguous). Otherwise state the assumption and proceed.

## Stage-Based Routing (critical)

Do not run all 12 steps blindly. Route by stage:

- **idea-only** → run Steps 1–12
- **building** → skip 1–3, run 4–12
- **live-but-not-selling** → skip 1–7, run 8–12 (outline, price, platform, sales page, content)
- **selling** → run 9–12 only (price audit, platform, sales page, content), unless user wants a full re-think

State which steps you're running and why before starting.

## The Chain

Run sequentially. Each step's output feeds the next. After every step, give a one-line summary and continue — do not stop for approval unless the user asked to review between steps.

1. **Idea generation** — Acting as a digital product strategist: 15 product ideas from the skill. For each: what it is, who buys, problem solved, difficulty, launch speed, best platform. Rank easiest-money → highest long-term potential.
2. **Beginner-friendly variants** — 10 products buildable with simple tools (Docs, Canva, Notion, sheets). Name, format, price range, creation steps, purchase reason.
3. **Fastest launch** — 7 ideas launchable in the stated time budget. Day-by-day plan, tools, price, difficulty. Flag best for speed + first sales.
4. **Product ladder** — 4 levels: low-ticket, mid, premium digital, recurring. Each: what to sell, price, format, buyer type, how it leads to the next.
5. **Trend match** — Top 15 real problems the audience is actively solving. Convert each to a product idea: problem, idea, transformation promised, buyer intent.
6. **Validation scoring** — 10 ideas scored 1–10 on demand, urgency, ease, uniqueness, purchase-likelihood. Name top 3 fastest-to-revenue + why.
7. **Knowledge extraction** — What the user repeats, explains, shortcuts, helps people avoid, frameworks they use. Convert to 10 products with format, titles, ideal customer.
8. **Full outline** — Winning product: title, promise, modules, section contents, bonuses, quick-wins, deliverable structure. Practical, not academic.

### ⚠️ VALIDATION GATE — between Step 8 and Step 9

Do not proceed to pricing/launch until the chosen product clears a demand threshold. A product can be perfectly outlined and still have no buyers. Before continuing, confirm:

- Does Step 6 scoring put this idea in the top tier?
- Is there *evidence* of demand beyond model opinion? (search-validated, competitor existence, user's own signal)

State plainly: **search shows what is marketed, not what sells.** Real validation is a landing page + payment button + traffic. Flag this to the user. If the idea hasn't cleared, say so and recommend a cheap validation test before building further. Do not silently pass the gate.

9. **Pricing** — 3 tiers (low/mid/premium): inclusions, buyer type, conversion logic, pros/cons. Recommend a starting price for the stated goal. **Web-search current competitor pricing** rather than guessing.
10. **Platform** — Compare Gumroad, Etsy, Payhip, Shopify, Notion marketplaces, own site for this product/audience/goal. Best pick + why: fees, setup ease, traffic, beginner-friendliness. **Web-search current fees** — they change.
11. **Sales page** — Headline, hook, problem, solution, benefits, what's included, who it's for / not for, FAQ, CTA. Helpful, not pushy.
12. **30-day content plan** — Short posts, teaching hooks, pain-point posts, story posts, authority posts, CTAs. Simple, trust-building, not spammy. Map to the chosen platform.

## Output (artifacts, not chat dumps)

Final deliverable is files, not a wall of text:

- **Product spec** (validated outline + pricing + platform pick) → MD or DOCX
- **Sales page draft** → MD
- **30-day content calendar** → MD or table

Run the sales page and content through the user's polish pipeline before presenting:
1. `style-enforcer-pipeline` (or `humanizer`) — strip AI tells
2. `fact-checker` — verify any pricing/fee/market claims

## Chained Skills

- `clarifying-questions` — if Step 0 inputs are too vague
- `fact-checker` — validation gate + pricing/fee claims
- `style-enforcer-pipeline`, `humanizer` — final output polish
- `sparring-partner` — optional: stress-test the chosen product before building

## What NOT to Do

- Don't run on blank `[skill]`/`[audience]`. Get real inputs first.
- Don't run all 12 steps when the product already exists. Route by stage.
- Don't pass the validation gate silently. A nice outline is not demand.
- Don't present raw chat output. Produce artifacts, polished.
- Don't treat model-scored "demand" as proof. It's a guess.
