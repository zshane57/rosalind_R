library(gtools)

file_content <- readLines("D:/Download/rosalind_lexf.txt")
#file_content <- readLines("D:/Download/sample.txt")

string <- unlist(strsplit(file_content[1], " "))
n <- as.integer(file_content[2])

result <- permutations(n = length(string), r = n, v = string, repeats.allowed = TRUE)

cat(apply(result, 1, paste, collapse = ""), sep = "\n", file = "D:/Download/out_lexf.txt")
