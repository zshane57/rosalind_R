min_edges_to_complete_tree <- function(n, edges) {
  return(n - (length(unlist(edges))/2) - 1)
}

fileName <- readLines("D:/Download/rosalind_tree.txt")
#fileName <- readLines("D:/Download/sample.txt")

n <- as.integer(fileName[1])
edges_string <- unlist(fileName[2:(length(fileName))], " ")
edges <- list()
for(i in edges_string){
  e <- as.integer(unlist(strsplit(i, " ")))
  edges <- append(edges, list(e))
}

print(min_edges_to_complete_tree(n, edges))
