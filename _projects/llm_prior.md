---
layout: page
title: LLM-Elicited Priors for Model Predictive Control
description: Turning domain knowledge in language models into structured priors for decision-making under data scarcity
importance: 5
category: research
related_publications: true
---

Bayesian methods need a prior, but in many emerging scientific settings there is
not enough target-regime data to estimate one reliably. This project asks whether
large language models can help elicit structured prior knowledge before new
observations arrive.

### What the LLM provides

Rather than a single point estimate, the LLM supplies a **prior ensemble** of
plausible causal structures, parameter ranges, and scenario-conditioned samples
that reflect uncertainty across possible regimes.

### Application

I study this idea in **epidemic control**, a setting where historical data from
a new pathogen is scarce by definition. LLM-elicited scenarios serve as a prior
ensemble for model-predictive control of non-pharmaceutical interventions,
allowing the controller to act before surveillance data accumulates.

### Main message

The goal is not to replace data with an LLM, but to turn available domain
knowledge into an explicit prior that can later be updated with data.
