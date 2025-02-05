
# 1. Function to compute entropy
compute_entropy <- function(x) {
  freq_table <- table(x)
  probs <- freq_table / sum(freq_table)
  entropy <- -sum(probs * log2(probs))
  return(entropy)
}

# 2. Observed data
numbers <- c(654665, 228258, 018589, 318108, 496465, 966409, 276292, 872798, 790606, 225880, 384753, 380566, 033805, 767658, 902493, 808720, 491476, 852434, 763824, 535193, 791198, 358267, 856442, 702500, 956261, 906910, 010452, 295959, 588784, 748264, 575990, 008650, 044167, 118292, 515368, 672483, 173786, 993161, 542175, 835775, 856056, 974347, 106009, 118917)

obs_entropy <- compute_entropy(numbers)
cat("Observed entropy:", obs_entropy, "bits\n")

# 3. Simulate null distribution of entropy under uniform randomness
set.seed(123)
n <- length(numbers)    # sample size
nsim <- 10000           # number of simulations
sim_entropies <- numeric(nsim)

for (i in 1:nsim) {
  sim_data <- sample(0:999999, n, replace = TRUE)
  sim_entropies[i] <- compute_entropy(sim_data)
}

# 4. Compute the p-value (one-sided: probability of seeing an entropy as low as observed)
p_value <- mean(sim_entropies <= obs_entropy)
cat("P-value:", p_value, "\n")

# 5. Visualize the simulated null distribution with the observed entropy
hist(sim_entropies, breaks = 30, main = "Simulated Entropies under Uniform Randomness",
     xlab = "Entropy (bits)", col = "lightblue", border = "white")
abline(v = obs_entropy, col = "red", lwd = 2)
legend("topright", legend = sprintf("Observed Entropy = %.2f", obs_entropy),
       col = "red", lwd = 2)
