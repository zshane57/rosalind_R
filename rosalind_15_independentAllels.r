library(Rmpfr)

prob_AaBb <- function(k, N) {
    offsprings <- 2^ k #mpfr(2^k, precBits = 64)
    p <- mpfr(0, precBits = 64)
    for (i in N:offsprings) {
        p_i <- choose(offsprings, i) * mpfr((1/4), precBits = 64)^i  * mpfr(3/4, precBits = 64)^(offsprings - i)
        p <- p + p_i
    }
  
    return(p)
}

print(prob_AaBb(6, 15))
