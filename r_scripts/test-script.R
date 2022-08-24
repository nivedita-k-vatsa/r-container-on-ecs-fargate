library(tibble)

# output 1
cat("\n test 1a: export a .txt file")
infile <- readLines("./input.txt")
outfile <- append(infile, "\nand this should be exported from my container")
writeLines(outfile, "./output/output1a.txt")

# output 2
cat("\n test 1b: export a .csv file using the tibble package")
set.seed(100)
df = data.frame(a = 1:3, b = letters[1:3], c = Sys.Date() - 1:3)
df_tibble = as_tibble(df)
write.csv(df_tibble, "./output/output1b.csv")