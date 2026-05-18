---
layout: page
title: Neural Operator Accelerated BOED
description: Making BOED scalable for expensive PDE-governed systems
importance: 2
category: research
related_publications: true
img: assets/img/neural_operator.png
---

**Goal:** make Bayesian optimal experimental design practical for large-scale scientific
models.

BOED often requires thousands of forward and derivative evaluations. For
PDE-governed systems, this cost quickly becomes prohibitive. My approach is to
replace expensive solvers with neural operator surrogates that preserve the
quantities needed for design optimization.

### Derivative-Informed Neural Operators for BOED

A key bottleneck in BOED is evaluating the parameter-to-observable (PtO) map
and its derivatives repeatedly during design optimization. We apply
**derivative-informed neural operators (DINO)**, which use derivative-informed
dimension reduction to compress high-dimensional parameter spaces into compact
latent representations and are trained with Jacobian information for accurate
surrogate modeling. DINO enables efficient computation of MAP estimates,
posterior covariance eigenvalues, and standard optimality criteria (A-, D-,
E-optimal), achieving over **1000× speedup** compared to high-fidelity solvers
for a 3D nonlinear convection-diffusion-reaction system with tens of thousands
of parameters {% cite go2025accurate %}.

<div class="row">
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.liquid path="assets/img/dino_framework.png"
           title="DINO Framework" class="img-fluid rounded z-depth-1" %}
    </div>
</div>
<div class="caption">
    DINO-based BOED framework. Derivative-informed dimension reduction compresses
    high-dimensional parameter and observable spaces into compact latent
    representations, enabling efficient surrogate-based design optimization.
</div>

### Sequential BOED with Latent Attention Neural Operators

Extending to **sequential** settings introduces additional challenges: the
surrogate must capture temporal dynamics and support posterior updates across
design stages. We propose a **latent-variable attention-based neural operator
(LANO)** that combines derivative-informed dimension reduction with an attention
mechanism to model dynamics in latent space. LANO supports efficient computation
of MAP points, posterior eigenpairs, and posterior sampling, enabling adaptive
sequential BOED for time-dependent PDE systems. We demonstrate **180× amortized
speedup** on an MRI observation scheduling problem for for monitoring tumor growth
{% cite go2025sequential %}.

<div class="row">
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.liquid path="assets/img/lano_architecture.png"
           title="LANO Architecture" class="img-fluid rounded z-depth-1" %}
    </div>
</div>
<div class="caption">
    LANO architecture combining derivative-informed latent encoding with
    an attention mechanism for temporal dynamics in sequential BOED.
</div>

<div class="row">
    <div class="col-sm-3 mt-3 mt-md-0">
        {% include figure.liquid path="assets/img/unc-prior.png"
           title="Prior std" class="img-fluid rounded z-depth-1" %}
    </div>
    <div class="col-sm-3 mt-3 mt-md-0">
        {% include figure.liquid path="assets/img/static-design.png"
           title="Static optimal observations" class="img-fluid rounded z-depth-1" %}
    </div>
    <div class="col-sm-3 mt-3 mt-md-0">
        {% include figure.liquid path="assets/img/unc-dec-uni.png"
           title="Posterior std with uniform observation" class="img-fluid rounded z-depth-1" %}
    </div>
    <div class="col-sm-3 mt-3 mt-md-0">
        {% include figure.liquid path="assets/img/adaptive-design.png"
           title="Adaptive optimal observations" class="img-fluid rounded z-depth-1" %}
    </div>
</div>
<div class="caption">
    MRI-based tumor growth monitoring. (Left to right) Prior uncertainty,
    optimal static observation design, posterior uncertainty under uniform
    observation, and adaptive sequential design. The adaptive design
    concentrates observations on informative regions, achieving greater
    uncertainty reduction than uniform or static baselines.
</div>

### Key takeaways

- Neural operator surrogates make BOED tractable for large-scale PDE-governed
  systems without sacrificing accuracy
- Derivative information is critical for both dimension reduction and
  surrogate training
- LANO generalizes naturally to sequential and time-dependent settings
