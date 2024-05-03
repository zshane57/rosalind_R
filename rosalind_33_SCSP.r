shortest_commonSupSeq <- function(seq1, seq2) 
{
    if (nchar(seq1) > nchar(seq2)){
        s <- seq1
        t <- seq2
    }else{
        t <- seq1
        s <- seq2
    }
    m <- nchar(s)
    n <- nchar(t)
    dp <- matrix(0, nrow = m + 1, ncol = n + 1)

    for (i in 1:m) {
        for (j in 1:n) {
            if (substr(s, i, i) == substr(t, j, j)) {
            dp[i + 1, j + 1] <- dp[i, j] + 1
            } else {
            dp[i + 1, j + 1] <- max(dp[i, j + 1], dp[i + 1, j])
            }
        }
    }

    ss_len <- dp[m+1, n+1]
    ss_len <- ss_len + (m - ss_len) + (n - ss_len)
    #print(ss_len)

    supseq <- vector("character", ss_len)
    while (m > 0 && n > 0) {
    if (substr(s, m, m) == substr(t, n, n)) {
        supseq[ss_len] <- substr(s, m, m)
        m <- m - 1
        n <- n - 1
        ss_len <- ss_len - 1
    } else if (dp[m, n + 1] > dp[m + 1, n]) {
        supseq[ss_len] <- substr(s, m, m)
        m <- m - 1
        ss_len <- ss_len - 1
    } else {
        supseq[ss_len] <- substr(t, n, n)
        n <- n - 1
        ss_len <- ss_len - 1
    }
    }
    while(m > 0){
        supseq[ss_len] <- substr(s, m, m)
        m <- m - 1
        ss_len <- ss_len - 1
    }

    supseq <- paste(supseq, collapse = "")
    return(supseq)
}

fileName <- "D:/Download/rosalind_scsp.txt"
#fileName <- "D:/Download/sample.txt"
seq_set <- readLines(fileName)
dna1 <- seq_set[1]
dna2 <- seq_set[2]

#cat("Seq1: ",dna1, "\nSeq2: ", dna2, "\n")
cat(shortest_commonSupSeq(dna1, dna2), "\n")
