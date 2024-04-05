library(Biostrings)
library(gmp)
library(stringr)

perfect_match <- function(rna){
    cnt_AU <- as.bigz(str_count(rna, pattern = "A"))
    cnt_GC <- as.bigz(str_count(rna, pattern = "G"))

    match <- factorial(cnt_AU) * factorial(cnt_GC)

    return(match)
}

fileName <- "D:/Download/rosalind_pmch.txt"
#fileName <- "D:/Download/sample.txt"
fasta_set <- readRNAStringSet(fileName)
rna <- as.character(fasta_set[[1]])

cat(format(perfect_match(rna), scientific = FALSE), "\n")
