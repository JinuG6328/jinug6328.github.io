---
layout: page
title: Bayesian Optimal Experimental Design
description: Designing experiments for inference and decisions under uncertainty
importance: 1
category: research
related_publications: false
img: assets/img/boed.png
---

My research asks a simple question:

> **Which experiment should we run next, and why?**

I study Bayesian optimal experimental design (BOED) for scientific systems where
data are expensive, models are uncertain, and the ultimate goal is often a
decision rather than parameter estimation alone.

Classical BOED is powerful but difficult to apply in modern scientific settings.
My work targets four practical bottlenecks:

| Bottleneck | My direction |
|---|---|
| Expensive simulations | Neural operator surrogates for scalable BOED |
| Misspecified priors | Robust design under prior uncertainty |
| High-dimensional parameters | Diffusion- and flow-based posterior sampling |
| Downstream decisions | Decision-focused experimental design |

Together, these projects aim to make BOED practical for large-scale inverse
problems, PDE-governed systems, and scientific decision-making.

### Project directions

#### Scalable BOED with Neural Operators

Large-scale BOED requires repeated forward-model evaluations, which quickly
become prohibitive for PDE-governed systems. I use neural operator surrogates
to make Bayesian design tractable at scale.

[Read more →](/jinug6328-dev2/projects/no/)

#### Robust and Decision-Focused BOED

Standard information gain can fail when the prior is misspecified or when not
all parameter uncertainty is relevant to the final decision. I develop robust
and goal-aware design objectives that target only the information that matters.

[Read more →](/jinug6328-dev2/projects/robust/)

#### Generative Priors for High-Dimensional BOED

For high-dimensional inverse problems, posteriors are often non-Gaussian and
difficult to sample. I use diffusion and flow-based generative models to enable
scalable posterior sampling and information-gain estimation.

[Read more →](/jinug6328-dev2/projects/diffusion_boed/)

#### LLM-Elicited Priors

Specifying a prior is often the hardest step in Bayesian inference. I study how
large language models can help elicit structured prior knowledge for
experimental design and decision-making.

[Read more →](/jinug6328-dev2/projects/llm_prior/)