dominant_prob <- function(k, m, n) {
  total <- k + m + n
  
  # Probabilities of each genotype
  prob_kk <- k / total * (k - 1) / (total - 1)
  prob_km <- k / total * m / (total - 1) + m / total * k / (total - 1)
  prob_kn <- k / total * n / (total - 1) + n / total * k / (total - 1)
  prob_mm <- m / total * (m - 1) / (total - 1)
  prob_mn <- m / total * n / (total - 1) + n / total * m / (total - 1)
  
  # Probability of dominant phenotype
  prob_dominant <- prob_kk + prob_km + prob_kn + 0.75 * prob_mm + 0.5 * prob_mn
  
  return(prob_dominant)
}

print(dominant_prob(23, 19, 17))
