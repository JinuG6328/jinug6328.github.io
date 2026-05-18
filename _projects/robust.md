---
layout: page
title: Robust and Decision-Focused BOED
description: Designing experiments that remain useful when priors are imperfect and decisions matter
importance: 3
category: research
related_publications: true
img: assets/img/reig.png
---

**Goal:** design experiments that are useful, not just informative.

Classical BOED maximizes expected information gain. But information gain alone
does not answer two practical questions:

1. What if the prior is wrong?
2. What if only part of the uncertainty matters for the final decision?

This project addresses both issues.

### Two complementary directions

| Direction  | Question                                             | Method                                                           |
| ---------- | ---------------------------------------------------- | ---------------------------------------------------------------- |
| Robust EIG | Can the design survive prior misspecification?       | Minimax design over an ambiguity set                             |
| GoBOED     | Does the experiment improve the downstream decision? | Decision-focused design with a differentiable optimization layer |

### Robustness to Prior Uncertainty

EIG rankings are sensitive to the prior distribution, and sampling-based EIG
estimators behave similarly to EIG under a perturbed prior. We propose
**robust expected information gain (REIG)**, which replaces the standard EIG
objective with a minimax formulation over an ambiguity set of distributions
close to the nominal prior in KL-divergence. We show that REIG corresponds to
a log-sum-exp stabilization of the samples used to estimate EIG, making it
efficient to implement as a drop-in replacement for standard estimators. REIG
improves robustness to prior misspecification and also compensates for the
variability of under-sampled EIG estimators {% cite go2022robust %}.

### Decision-Focused Design

Even with a well-specified prior, maximizing EIG does not necessarily improve
downstream decision quality. Only the parameter directions that govern the
constraints of a control problem truly matter. We propose **GoBOED
(Goal-driven BOED)**, a framework that couples BOED with a differentiable
convex decision layer equipped with plug-in risk functionals. GoBOED directly
optimizes experimental designs for a specified downstream decision objective,
rather than maximizing information gain alone.

### Key takeaways

- REIG provides robustness to prior misspecification with minimal computational
  overhead over standard EIG estimators
- GoBOED targets the parameter directions that matter for downstream decisions,
  rather than reducing all uncertainty uniformly
- Near-optimal design windows are substantially wider under GoBOED than under
  EIG maximization, offering practical flexibility in experiment design
