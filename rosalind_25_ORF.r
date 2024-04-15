library(Biostrings)
library(stringr)
library(dplyr)

fileName <- "D:/Download/rosalind_orf.txt"
#fileName <- "D:/Download/sample.txt"
fasta_set <- readDNAStringSet(fileName)
dna <- as.character(fasta_set[[1]])
rc_dna <- reverseComplement(fasta_set)
rc_dna <- as.character(rc_dna[[1]])

find_orfs <- function(dna_sequence) {
  start_codon <- "ATG"
  stop_codons <- c("TAA", "TAG", "TGA")

  orfs <- c()
  seq_len <- nchar(dna_sequence)

  for(i in 1:seq_len) {
    codon <- substr(dna_sequence, i, i + 2)

    if(codon == start_codon) {
      for(j in seq(i, seq_len, by = 3)) {
        next_codon <- substr(dna_sequence, j, j + 2)

        if(next_codon %in% stop_codons) {
          orf <- substr(dna_sequence, i, j + 2)
          orfs <- c(orfs, orf)
          break
        }
      }
    }
  }
  return(orfs)
}

dna2aa <- function(seq) {
  seq_set <- find_orfs(seq)
  prot <- c()
  for(i in seq_set){
    aa <- translate(DNAString(i))
    prot <- c(prot, sub("\\*", "" , as.character(aa)))
  }
  return(prot)
}

print_aa <- function(rc_seq, seqs) {
  rc <- dna2aa(rc_seq)
  ori <- dna2aa(seqs)

  aa_set <- c(rc, ori)
  aa_set <- unique(aa_set)
  writeLines(aa_set, "D:/Download/orf_out.txt")
}

print_aa(rc_dna, dna)
