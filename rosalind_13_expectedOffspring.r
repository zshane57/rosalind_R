int <- "17867 18796 17773 18167 19908 17109"
int <- as.integer(unlist(strsplit(int, split = " ")))

dorm <- 2 * (int[1] + int[2] + int[3] + int[4] * 0.75 + int[5] * 0.5)
cat(dorm, "\n")