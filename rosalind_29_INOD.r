unrooted_tree <- function(n) {
  return(n - 2)
}

fileName <- readLines("D:/Download/rosalind_inod.txt")
#fileName <- readLines("D:/Download/sample.txt")

n <- as.integer(fileName[1])

cat(unrooted_tree(n), "\n")
