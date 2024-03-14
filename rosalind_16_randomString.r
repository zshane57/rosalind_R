calculate_probability <- function(s, gc_content) {
  at_content <- 1 - gc_content
  prob <- 1
  for (nucleotide in unlist(strsplit(s, ""))) {
    if (nucleotide %in% c('G', 'C')) {
      prob <- prob * (gc_content / 2)
    } else if (nucleotide %in% c('A', 'T')) {
      prob <- prob * (at_content / 2)
    }
  }
  return(prob)
}


s <- "TGGTAAGTCCCGCAAGTTACGCCATCCCCTATCAGGCGTGGGAGCAGAGGGGATGAATACCCGATTTCTTCTACTATATAGCACAAACGGACCCGCGGTG"
A <- "0.072 0.126 0.222 0.257 0.329 0.416 0.496 0.548 0.570 0.663 0.747 0.810 0.840 0.918"
A <- as.numeric(unlist(strsplit(A, split = " ")))

B <- sapply(A, function(gc_content) log10(calculate_probability(s, gc_content)))

cat(B, "\n")
