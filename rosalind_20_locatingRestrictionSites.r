library(Biostrings)

fileName <- "D:/Download/rosalind_revp.txt"
#fileName <- "D:/Download/sample.txt"
fasta_set <- readDNAStringSet(fileName)
seq <- as.character(fasta_set[[1]])
len <- nchar(seq)

palindrome <- list()

for (i in 1:(len-3)){
    for(j in 3:12){
        if(i+j > len){
            break
        }
        subseq1 <- substr(seq, i, i+j)
        subseq2 <- as.character(reverseComplement(DNAString(subseq1)))

        if (subseq1 == subseq2){
            palindrome <- c(palindrome, list(c(i,nchar(subseq2))))
            #cat("subseq1: ", subseq1, "\n")
            #cat("comp: ", subseq2, "\n")
            #cat(i, j, "\n")
        }
    }
}

for (i in palindrome){
    cat(paste(i, collapse = " "), "\n")
    cat(paste(i, collapse = " "), "\n", file = "D:/Download/out_revp1.txt", append = TRUE)
}
