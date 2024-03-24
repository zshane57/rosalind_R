permutations <- function(n) {
    if (n == 1) {
        return(matrix(1))
    } else {
        sp <- permutations(n - 1)
        p <- nrow(sp)
        A <- matrix(nrow = n * p, ncol = n)
        for (i in 1:n) {
            A[(i - 1) * p + 1:p, ] <- cbind(i, sp + (sp >= i))
        }
        return(A)
    }
}

perm <- permutations(6)

cat(nrow(perm), "\n", file = "D:/Download/out_perm.txt")
for (r in 1:nrow(perm)) {
  cat(perm[r,], "\n", file = "D:/Download/out_perm.txt", append = TRUE)
}