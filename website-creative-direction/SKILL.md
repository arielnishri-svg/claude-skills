---
name: website-creative-direction
version: 2.0.0
description: Run a staged creative-direction and build sequence for premium websites, from visual identity through launch audit. Use when the user wants to design, build, or overhaul a website's look, feel, UX flow, or motion system - not for isolated component tweaks. Triggers include "design a website for X", "creative direction for my site", "make my site feel premium/agency-built", "audit my website before launch". Chains 6 stages - creative direction, UX/UI experience map, hero + motion system, build sequence, agency-polish audit, final launch audit. Each stage needs explicit go-ahead before the next starts. Delegates to specialist skills at each stage rather than duplicating their rules - taste-skill for direction, emil-design-eng for motion, impeccable and frontend-design for build/audit, ui-ux-pro-max for pattern lookup. Falls back to inline guidance if a specialist skill isn't installed.
---

# Website Creative Direction

Staged workflow for taking a website from concept to launch-ready. Six stages, run sequentially, one go/no-go confirmation between each. Do not batch stages - each stage's output feeds the next.

## Specialist skills this depends on

This skill is a director, not a design encyclopedia - each stage below delegates the actual judgment to a specialist skill where one is installed:

- **taste-skill** (`design-taste-frontend`) - direction, layout variance, motion intensity, visual density dials. Leads stage 1.
- **emil-design-eng** - motion and interaction craft, easing, duration, restraint. Leads the motion half of stage 3.
- **impeccable** - anti-slop code-level enforcement, 23-command vocabulary (polish, audit, critique, distill, animate). Leads stages 4 and 5.
- **frontend-design** (Anthropic) - fallback code-level aesthetic guidance when impeccable isn't installed. Also the baseline stage 4 already used before this version.
- **ui-ux-pro-max** - searchable database of styles/palettes/font pairings/UX patterns. Consulted in stage 2 or 4 when a concrete reference is needed rather than an invented one.

**Conflict rule:** taste-skill and impeccable both hold opinions on anti-slop aesthetics. Never run both unprompted on the same pass - one leads per stage per the assignments above. If their outputs disagree when both get invoked across stages, surface the disagreement to the user rather than silently picking one.

**Missing skill fallback:** if a specialist skill listed above isn't installed, don't block - do that stage's work using this skill's own inline instructions (below) and tell the user which skill would have sharpened the result.

## Setup

Before stage 1, confirm two variables with the user if not already given:
- `[BRAND]` - brand/company name and one-line description of what they do
- `[WEBSITE]` - existing site URL or "new build" if none exists yet

If the user has already given enough context to infer these, state the assumption in one line and proceed rather than asking.

## Stage 1 - Creative Direction

Invoke **taste-skill** to set direction, layout variance, motion intensity, and visual density for [BRAND]. If not installed, use this prompt directly:

Act as an award-winning digital creative director. Transform [BRAND] into an ultra-smooth, premium website that feels crafted by a world-class digital studio. Define the visual identity, mood, typography, color palette, layout system, imagery, signature interactions, and motion language. Make every detail feel distinctive, modern, and intentional, while keeping the experience conversion-focused, memorable, and completely original.

**Output:** a creative direction document - identity, palette, type pairing, layout system, motion language.

## Stage 2 - Complete Experience Map

Act as a world-class UX/UI designer. Design the complete website experience for [BRAND]. Map out the navigation, hero section, content flow, storytelling, product/service presentation, social proof, CTAs, forms, footer, and mobile experience. For every section, define its purpose, visual hierarchy, composition, interactions, and transition to the next. Make the entire journey feel seamless, premium, intuitive, and effortless to navigate.

If **ui-ux-pro-max** is installed and a section needs a concrete pattern reference (a specific layout family, a named UX pattern) rather than an invented one, query it instead of guessing.

**Output:** section-by-section experience map, using stage 1's direction as the visual constraint.

## Stage 3 - Signature Hero + Motion System

Design the hero directly. For the motion system half, invoke **emil-design-eng** if installed - its rules on easing, duration (aim under 300ms for UI motion), restraint, and what not to animate are more reliable than reinventing motion judgment inline.

Hero: composition, typography, imagery or 3D elements, lighting, depth, entrance animation, hover states, cursor interactions, first-scroll transition. Make it instantly captivating while clearly communicating the brand's core value within seconds.

Motion system (via emil-design-eng, or inline if not installed): page-load choreography, scroll reveals, easing curves, parallax, text animations, image transitions, hover states, page transitions, and micro-interactions - all extending the hero's motion language rather than introducing a new one. Prioritise performance, consistency, and storytelling over decoration.

**Output:** hero spec + motion system spec, consistent with each other and with stage 1's motion-intensity dial.

## Stage 4 - Build Sequence

Act as a senior AI web engineer. Produce a step-by-step sequence of Claude prompts to build [WEBSITE] without writing code manually, based on stages 1-3's outputs. Cover architecture, components, responsive design, styling, animations, interactions, smooth scrolling, forms, SEO, accessibility, and performance. Stage the build. Each build prompt should instruct Claude to inspect existing work before changing it, test every update, fix errors, and preserve working features.

When actually executing the build (not just producing the prompt sequence): invoke **impeccable** as the primary code-level quality layer if installed - its detector rules catch AI-slop tells (purple gradients, nested cards, bounce easing) that generic instructions miss. Fall back to **frontend-design** if impeccable isn't installed. If a section needs a specific style/palette/font reference, consult **ui-ux-pro-max**.

**Output:** ordered list of build-stage prompts, ready to run one at a time.

## Stage 5 - Agency-Polish Audit

Invoke **impeccable**'s `/impeccable audit` or `/impeccable critique` commands against [WEBSITE] if installed - purpose-built for this exact pass. If not installed, use this prompt directly:

Act as a premium digital-agency creative director. Audit [WEBSITE] (or screenshots) and identify everything that reads as generic, cheap, or obviously AI-generated. Cover typography, spacing, composition, hierarchy, imagery, motion, transitions, interactions, responsive behaviour, and micro-details. Give specific, actionable changes that add polish and the feel of a custom-built site.

**Output:** ranked punch-list of polish fixes.

## Stage 6 - Final Launch Audit

Act as senior web engineer and creative QA director. Perform a final audit of [WEBSITE] covering animation smoothness, responsiveness, performance, accessibility, navigation, forms, SEO, browser compatibility, visual consistency, and conversion. Rank every issue by impact and priority, then give exact fixes. Finish with a concise launch checklist.

This stage stays inline (technical/QA scope, not aesthetic) - no specialist skill delegation needed here.

**Output:** prioritised issue list + launch checklist.

## Execution notes

- Confirm go-ahead between every stage - don't chain silently.
- If the user only wants one stage (e.g. "just audit my site"), skip straight to stage 5 or 6 rather than running the full sequence.
- Stages 1-3 are direction/spec work - no code. Stage 4 is where code starts.
- Keep outputs specific to [BRAND]/[WEBSITE] - no generic placeholder filler in the actual output.
- Before invoking any specialist skill, confirm it's actually installed (check available skills) rather than assuming - silently fall back to inline instructions if not.
