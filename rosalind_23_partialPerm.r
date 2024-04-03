#partial permutation
permutation = function(n, k) {
  p <- 1
  for (i in 1 : k){
    p <- p * n
    p <- p %% 1000000
    n <- n - 1
  }
  return(p)
}

perm <- permutation(89, 9)
cat(perm, "\n")