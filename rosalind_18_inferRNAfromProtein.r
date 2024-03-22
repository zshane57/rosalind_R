library(gmp)

codons <- c("F"  = 2, "L"  = 6, "S"  = 6, "Y"  = 2, "*"  = 3, 
            "C"  = 2, "W"  = 1, "P"  = 4, "H"  = 2, "Q"  = 2, 
            "R"  = 6, "V"  = 4, "A"  = 4, "D"  = 2, "E"  = 2, 
            "G"  = 4, "I"  = 3, "M"  = 1, "T"  = 4, "N"  = 2, "K"  = 2)

fileName <- "D:/Download/rosalind_mrna.txt"
aaseq <- readLines(fileName)
aaseq <- as.character(unlist(strsplit(aaseq, split="")))

combi <- as.bigz(0)

for(i in aaseq){
    for(j in names(codons)){
        if(combi == 0 && i == j){
            combi <- combi + as.numeric(codons[j])
        }
        if(i == j){
            combi <- combi * as.numeric(codons[j])
        }
    }
}

combi <- combi * as.numeric(codons["*"]) 
modulo <- combi %% 1000000

cat("Combination:\n", as.character(combi), "\n")
cat("Modulㅐ:\n", as.character(modulo), "\n")
