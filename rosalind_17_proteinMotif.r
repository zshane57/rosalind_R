library(Biostrings)
library(httr)

# Function to fetch protein sequence
fetch_protein <- function(uniprot_id) {
  url <- paste0("http://www.uniprot.org/uniprot/", uniprot_id, ".fasta")
  fasta_seq <- readAAStringSet(url)
  seq <- unlist(strsplit(as.character(fasta_seq[[1]]), split = ""))
  return(seq)
}

# Function to find the motif
find_motif <- function(protein_seq) {
  int <- length(protein_seq)
  loc <- c()
  for (i in 1:int){
    if(protein_seq[i] == "N" && protein_seq[i+1] != "P" && protein_seq[i+2] %in% c("S","T") && protein_seq[i+3] != "P"){
      loc <- c(loc, i)
    }
  }
  return(loc)
}

#uniprot_ids <- readLines("D:/Download/sample.txt") 
uniprot_ids <- readLines("D:/Download/rosalind_mprt.txt") 

# Ammendment on uniprot ID to match the recent fasta file location in uniprots
uids <- c()
for(i in 1:length(uniprot_ids)){
  if (grepl("_",uniprot_ids[i])){
    uids <- c(uids, sub("_.*", "", uniprot_ids[i]))
    #print(uniprot_ids[i])
  }else{uids <- c(uids, uniprot_ids[i])}
}


for (j in 1:length(uids)) {
  protein_seq <- fetch_protein(uids[j])
  motif_positions <- find_motif(protein_seq)

  if(length(motif_positions) != 0){
    cat(uniprot_ids[j], "\n", file = "D:/Download/out_mprt.txt", append = TRUE)
    cat(motif_positions, "\n",file = "D:/Download/out_mprt.txt", append = TRUE)
    }
}