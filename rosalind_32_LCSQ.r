longest_SubSeq <- function(s, t){
    m <- nchar(s)
    n <- nchar(t)
    dp <- matrix(0, nrow = m + 1, ncol = n + 1)

  for (i in 1:m) {
    for (j in 1:n) {
      if (substr(s, i, i) == substr(t, j, j)) {
        dp[i + 1, j + 1] <- dp[i, j] + 1
      } else {
        dp[i + 1, j + 1] <- max(dp[i, j + 1], dp[i + 1, j])
      }
    }
  }

#print(dp)

  subseq <- ""
  while (m > 0 && n > 0) {
    if (substr(s, m, m) == substr(t, n, n)) {
      subseq <- paste(substr(s, m, m), subseq, sep = "")
      m <- m - 1
      n <- n - 1
    } else if (dp[m, n + 1] > dp[m + 1, n]) {
      m <- m - 1
    } else {
      n <- n - 1
    }
  }
  return(subseq)
}

library(Biostrings)
library(stringr)

fileName <- "D:/Download/rosalind_lcsq (2).txt"
#fileName <- "D:/Download/sample.txt"
fasta_set <- readDNAStringSet(fileName)
seq1 <- as.character(fasta_set[[1]])
seq2 <- as.character(fasta_set[[2]])

#There might be more than 1 answer available, but this is accepted by rosalind
cat(longest_SubSeq(seq2, seq1), "\n")