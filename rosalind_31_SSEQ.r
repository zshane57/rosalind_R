library(Biostrings)
library(stringr)

spliced_motif <- function(dna1, dna2){
    dna1_spt <- unlist(strsplit(dna1,""))
    dna2_spt <- unlist(strsplit(dna2,""))
    idx <- c()
    i <- 1
    j <- 1

    while(j <= length(dna2_spt)){
        while(dna1_spt[i] != dna2_spt[j]){
            i <- i + 1
        }
        idx <- c(idx, i)
        i <- i + 1
        j <- j + 1
    }
    return(idx)
}

#fileName <- "D:/Download/rosalind_sseq.txt"
fileName <- "D:/Download/sample.txt"
fasta_set <- readDNAStringSet(fileName)
seq1 <- as.character(fasta_set[[1]])
seq2 <- as.character(fasta_set[[2]])

cat(spliced_motif(seq1, seq2), "\n")
