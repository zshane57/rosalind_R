library(Biostrings)
dss2df <- function(dss) {
  data.frame(
    seq = as.character(dss)
  )
}

fileName <- "D:/Download/rosalind_splc.txt"
#fileName <- "D:/Download/sample.txt"
fasta_set <- readDNAStringSet(fileName)
fasta_df <- dss2df(fasta_set)
exons <- c()

for(i in 1 : nrow(fasta_df)) {
    if (i == 1) { seq <- fasta_df$seq[i]}
    else{
        exons <- c(exons, fasta_df$seq[i])
    }
}

for ( i in exons ) { seq <- sub(i , "", seq)}

aa <- as.character(translate(DNAString(seq), if.fuzzy.codon = "X"))
aa <- sub("\\*", "", aa)

cat(aa, "\n")