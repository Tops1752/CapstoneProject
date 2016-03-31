library(ngram)


##Read file
Dir <- "C:/Users/bzou/Documents/R/CapstoneProject/final/en_US/"
setwd(Dir)

Tran.Twitter <- readLines("Train.Twitter.txt")
Tran.Blogs <- readLines("Train.Blogs.txt")
Tran.News <- readLines("Train.News.txt")

str <- concat(Tran.Twitter, Tran.Blogs,Tran.News,collapse = " ")

ng1 <- ngram(s)