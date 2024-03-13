library(Biostrings)
library(stringr)
library(PTXQC)

dss2df <- function(dss) {
  data.frame(
    seq = as.character(dss)
  )
}

fileName <- "D:/Download/rosalind_lcsm.txt"
#fileName <- "D:/Download/sample.txt"

fasta_set <- readDNAStringSet(fileName)
fasta_df <- dss2df(fasta_set)
seqs <- as.character(fasta_df$seq)

cat(LCSn(seqs), "\n")