library("Biostrings")

fileName <- "D:/Download/rosalind_prot.txt"
rnafile <- readLines(fileName)

rna <- RNAString(rnafile)

protein <- translate(rna)
protein <- as.character(protein)
protein <- str_replace_all(protein, "\\*", "")

outfile <- file("D:/Download/out_prot.txt")
writeLines(protein, outfile)
close(outfile)
