library(Biostrings)
library(stringr)

dss2df <- function(dss) {
  data.frame(
    seq = as.character(dss)
  )
}

fileName <- "D:/Download/rosalind_grph (1).txt"
#fileName <- "D:/Download/sample.txt"

fasta_set <- readDNAStringSet(fileName)
fasta_df <- dss2df(fasta_set)
seqs <- as.character(fasta_df$seq)

k <- 3
iter <- length(seqs)

for(i in 1 : iter){
    suffix <- str_sub(seqs[i], -k, -1)
    for (j in 1 : iter){
        if(seqs[i] == seqs[j]){ next }
        prefix <- str_sub(seqs[j], 1, k)
        if (suffix == prefix) {
            id1 <- rownames(fasta_df)[i]
            id2 <- rownames(fasta_df)[j]
            cat(id1, id2, "\n")
            comb_id <- paste(id1, id2, sep = " ")
            write(comb_id,file="D:/Download/out_grph.txt",append=TRUE)
        }
    }
}