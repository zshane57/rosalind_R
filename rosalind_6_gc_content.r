library("seqinr")
library("LncFinder")

#read seq files
fileName <- "D:/Download/rosalind_gc.txt"
dnaseq <- read.fasta(file = fileName)

#compute gc content
gc <- compute_GC(dnaseq)

print(gc)
print(rownames(gc)[which.max(gc[,1])])
print((max(gc$GC.content)) * 100)