library(tibble)

# output 1
cat("\n --Running test-script-2.R--")
cat("\n test 2a: export the same .txt file")
infile <- readLines("./input.txt")
outfile <- append(infile, "\nand I am using my second script to import it")
writeLines(outfile, "./output/output2a.txt")

# output 2
cat("\n test 2b: export a different .csv file using the tibble package")
set.seed(100)
df = data.frame(a = 4:6, b = letters[1:3], c = Sys.Date() - 1:3)
df_tibble = as_tibble(df)
write.csv(df_tibble, "./output/output2b.csv")