library(gtools)

fileName <- readLines("D:/Download/rosalind_lexf.txt")
#fileName <- readLines("D:/Download/sample.txt")

string <- unlist(strsplit(fileName[1], " "))
n <- as.integer(fileName[2])

result <- permutations(n = length(string), r = n, v = string, repeats.allowed = TRUE)

cat(apply(result, 1, paste, collapse = ""), sep = "\n")#, file = "D:/Download/out_lexf.txt")
