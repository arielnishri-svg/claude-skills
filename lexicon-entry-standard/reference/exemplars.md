# Reference-Grade Exemplar Entries

Five entries rebuilt to the standard. Use as target shape (AUTHOR) and calibration anchor (REVIEW). Match structure and rigor, do not copy content.

---

## Exemplar 1 - Content Selection Bias Under Near-Zero Marginal Cost
(was: "Max Content Razor")

- **Classification**: Behavioral + Information Economics. Status: Empirical (partial) + Theoretical synthesis. Confidence: Moderate.
- **Definition**: When the marginal cost of consuming additional information approaches zero, individuals systematically over-select content volume relative to expected marginal value, leading to signal dilution and decision degradation.
- **Mechanism**: cost asymmetry (acquisition near zero, evaluation above zero); optionality bias (more options perceived as higher EV); attention fragmentation (switching cost underestimated). Competing: novelty-seeking (reward prediction error), platform ranking distortion, FOMO signaling.
- **Predictions**: more available content without more evaluation constraint -> time spent increases; retention per unit -> decreases; downstream decision accuracy -> worsens.
- **Boundary**: high-cost info environments; strong prior filtering (curated briefs); time-constrained decisions.
- **Failure modes**: inverts under information scarcity; inverts when redundancy aids learning (spaced repetition).
- **Decision rules**: hard cap N inputs before decision (e.g. N=3); pre-commit inclusion criteria before exposure; marginal-value check ("what new decision-relevant info will the next item add?").
- **Upgrade note**: no longer a slogan; now carries mechanism, prediction, boundaries, operational use.

## Exemplar 2 - Audience-Weighted Belief Expression
(was: "Opinion Pageant")

- **Classification**: Social Cognition / Signaling Theory. Status: Empirical (indirect) + Theoretical. Confidence: Moderate.
- **Definition**: In environments with visible audience feedback, individuals systematically shift expressed beliefs toward those that maximize social reward weighting rather than epistemic accuracy.
- **Mechanism**: signaling theory (status, group alignment); reputation optimization; audience capture loops. Secondary: pluralistic ignorance, conformity pressure, identity-protective cognition.
- **Predictions**: as audience visibility/feedback increase -> belief extremity increases; cross-context variance increases; private/public belief divergence increases.
- **Boundary**: private decision environments; high-accountability (audited) contexts; expert-only closed systems.
- **Failure modes**: misfires when truth itself is status-enhancing; misfires under strong verification (math, engineering).
- **Decision rules**: private-first (write belief before audience exposure); audience-removal test ("would I hold this without observers?"); delayed expression (separate formation from publication).
- **Upgrade note**: grounded in signaling theory with measurable predictions, not social commentary.

## Exemplar 3 - Proxy Metric Capture (Engagement Variant)
(was: "Engagement Maximisation Capture")

- **Classification**: Systems / Incentives. Status: Empirical (strong analogs) + Theoretical. Confidence: High (as a variant of established laws).
- **Definition**: When a system optimizes for a measurable proxy such as engagement, behavior adapts to maximize the proxy, causing divergence from the intended objective such as user value.
- **Mechanism**: Goodhart's Law; reinforcement learning dynamics; local optimization under misaligned objective.
- **Predictions**: more optimization pressure on engagement -> short-term interaction metrics rise; long-term satisfaction falls in many domains; exploitative content patterns increase.
- **Boundary**: proxy strongly correlates with true objective; multi-metric optimization used; constraints (safety filters) enforced.
- **Failure modes**: overcorrection (cutting engagement too hard reduces utility); misdiagnosis (assuming all engagement misaligned).
- **Decision rules**: metric audit (define what engagement fails to capture); multi-metric control; lag monitoring (long vs short-term divergence).
- **Upgrade note**: now clearly a specific instantiation of an established principle, not a renamed standalone.

## Exemplar 4 - Probabilistic Coherence Without Ground Truth (LLM Failure Mode)
(was: "AI Hallucination")

- **Classification**: AI Systems Behavior. Status: Empirical (strong). Confidence: High.
- **Definition**: Large language models generate outputs optimized for probabilistic coherence, not truth conditions, resulting in fluent but ungrounded or false statements.
- **Mechanism**: next-token prediction objective; lack of external grounding; training-data blending and pattern interpolation.
- **Predictions**: hallucination likelihood rises in low-data domains; rises under forced specificity; rises when asked for citations or rare facts.
- **Boundary**: reduced with retrieval augmentation; reduced when uncertainty surfaced; reduced in well-represented domains.
- **Failure modes**: user overtrust due to fluency; false consistency across iterations.
- **Decision rules**: verification escalation (higher stakes -> more verification layers); cross-model check; uncertainty forcing (prompt for confidence + alternatives).
- **Upgrade note**: technically grounded, predictive, operational.

## Exemplar 5 - Reward Prediction Error Reinforcement Loop
(was: "Dopamine Loop")

- **Classification**: Neuroscience / Behavioral. Status: Empirical (core mechanism) + Applied interpretation. Confidence: Moderate-High (mechanism), Moderate (applications).
- **Definition**: Behavior is reinforced when outcomes exceed expectations (positive prediction error), increasing the likelihood of repeating actions associated with that outcome.
- **Mechanism**: reward prediction error signaling; reinforcement learning processes; habit formation via repeated reward variance. Complementary: basal-ganglia habit systems, social reinforcement, cognitive expectation shaping.
- **Predictions**: variable reward schedules -> stronger behavioral persistence; -> increased resistance to extinction.
- **Boundary**: weak in purely rational decision environments; weak in low emotional-salience contexts.
- **Failure modes**: over-attribution (not all behavior reward-driven); simplification (ignoring cognitive and social layers).
- **Decision rules**: environment design (reduce variable-reward exposure); predictability insertion (stabilize reward structures); interrupt loops (friction at trigger points).
- **Upgrade note**: removes dopamine hype; aligns with actual neuroscience framing.
