library(Biostrings)

dss2df <- function(dss) {
  data.frame(
    seq = as.character(dss)
  )
}
#fileName <- "D:/Download/rosalind_cons.txt"
fileName <- "D:/Download/sample.txt"

fasta_set <- readDNAStringSet(fileName)
fasta_df <- dss2df(fasta_set)
seqs <- as.character(fasta_df$seq)

letters <- c("A", "C", "G", "T")
profile_matrix <- matrix(0, nrow = 4, ncol = nchar(seqs[1]), dimnames = list(letters, 1:nchar(seqs[1])))

for (i in 1:nchar(seqs[1])) {
  nucleotides <- substr(seqs, i, i)
  for (j in letters) {
    profile_matrix[j, i] <- sum(nucleotides == j)
  }
}

consensus <- ""
for (i in 1:ncol(profile_matrix)) { # nolint
  consensus <- paste0(consensus, letters[which.max(profile_matrix[, i])])
}

cat(consensus, "\n")

rownames(profile_matrix) <- letters
rownames(profile_matrix) <- paste0(rownames(profile_matrix), ":")
colnames(profile_matrix) <- 1:ncol(profile_matrix) # nolint
print(profile_matrix)

consensus_string <- paste(consensus)
writeLines(consensus_string, "D:/Download/output.txt")

write.table(profile_matrix, "D:/Download/output.txt", quote = FALSE, row.names = TRUE, col.names = FALSE, append = TRUE, sep = " ")
