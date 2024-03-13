library(Rmpfr)

fibo_mortal <- function(n, m) {
    living <- mpfr(c(1, 1), precBits = 1024)
    for(i in 2 : n) {
        #fibonacci
        tmp <- living[i] + living[i - 1]
        #death
        if (i == (m)) {
            tmp <- tmp - 1
        }
        if (i > (m)) {
           tmp <- tmp - living[i - m]
        }
        living <- c(living, tmp)
    }
    num <- living[n]
    format(num, scientific = FALSE)
    return(num)
}

print(fibo_mortal(97, 19))