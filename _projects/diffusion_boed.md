---
layout: page
title: Generative Priors for High-Dimensional BOED
description: Pretrained diffusion models as flexible priors for scalable BOED in non-Gaussian, high-dimensional inverse problems
importance: 4
category: research
related_publications: true
---

Classical EIG estimation becomes computationally prohibitive when the unknown
parameter is high-dimensional and the posterior is non-Gaussian. This ongoing
work addresses this by using **pretrained diffusion models** as flexible priors
for sequential BOED.

The key idea is to interpret posterior sampling as a guided diffusion trajectory,
where the accumulated likelihood guidance along the latent path serves as a
tractable surrogate for information gain. Building on mutual information estimation
via score-based diffusion {% cite franzese2024minde --file references %}, the **MINDE-DPS** estimator
enables efficient EIG estimation alongside posterior sampling.

We validate the approach on source localization and Darcy flow parameter
estimation, including high-dimensional PDE-constrained settings where classical
methods struggle. For the function-space setting, we leverage FunDPS
{% cite yao2025fundps --file references %}, enabling posterior sampling over PDE solution fields
from extremely sparse observations. Ongoing work explores **flow matching** as a
faster alternative for posterior sampling and EIG accumulation.
