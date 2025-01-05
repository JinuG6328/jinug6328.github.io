import numpy as np
import matplotlib.pyplot as plt
from scipy.stats import norm

# Create points for x-axis
x = np.linspace(-3, 5, 600)

# Calculate PDFs
prior = norm.pdf(x, loc=0, scale=1)  # Standard normal (mean=0, std=1)
posterior_1 = norm.pdf(x, loc=2, scale=0.5)  # Mean=2, std=0.5
posterior_2 = norm.pdf(x, loc=0.5, scale=0.9)  # Mean=0.5, std=0.9

plt.rcParams.update({'font.size': 20})

# Create the plot
plt.figure(figsize=(10, 6))
plt.plot(x, prior, 'b-', label='prior', linewidth=2)
plt.plot(x, posterior_1, 'r-', label='experiment_1', linewidth=2)
plt.plot(x, posterior_2, 'g-', label='experiment_2', linewidth=2)

# Add labels and title
plt.xlabel('x')
plt.ylabel('Probability density')
plt.title('Updated posterior distributions comparison')
plt.legend()
plt.grid(True)

# Show the plot
plt.show()