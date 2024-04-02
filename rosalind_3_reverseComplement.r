library("Biostrings")
fileName <- "C:/Users/shane/Desktop/master/rosalind/rosalind_revc.txt"

str <- readLines(fileName)
dna <- DNAString(str)
dna_rc <- reverseComplement(dna)
dna_rc <- toString(dna_rc)
cat(dna_rc,file = "C:/Users/shane/Desktop/master/rosalind/dna_rc.txt")
