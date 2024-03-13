library("Biostrings")

#read seq files
fileName <- "D:/Download/rosalind_prot.txt"
rnafile <- readLines(fileName)

#read file as RNA
rna <- RNAString(rnafile)

#translate RNA to protein
protein <- translate(rna)
protein <- as.character(protein)
protein <- str_replace_all(protein, "\\*", "")

outfile <- file("D:/Download/out_prot.txt")
writeLines(protein, outfile)
close(outfile)