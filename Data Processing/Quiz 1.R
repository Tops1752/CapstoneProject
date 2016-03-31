## Read file

Dir <- "C:/Users/bzou/Documents/R/CapstoneProject/final/en_US/"
setwd(Dir)


datTwitter <- readLines("en_US.twitter.txt")
dim(datTwitter)

datBlog <- readLines("en_US.blogs.txt")

datNews <- readLines("en_US.news.txt")


## find the longest line

getLength <- function(str){
    len <- sapply(gregexpr("\\W+", str), length) + 1
    return (len)
}



lineLengthTwitter <- sapply(datTwitter,FUN = nchar)
max(lineLengthTwitter)

lineLengthBlog <- sapply(datBlog,FUN = nchar)
max(lineLengthBlog)

lineLengthNews <- sapply(datNews,FUN = nchar)
max(lineLengthNews)


## grep centence with "love" and "hate"

loveIndex <- length(grep("love",datTwitter))
hateIndex <- length(grep("hate",datTwitter))
loveIndex / hateIndex

biostatsIndex <- grep("biostats",datTwitter)
datTwitter[biostatsIndex]

matchIndex <- length(grep("A computer once beat me at chess, but it was no match for me at kickboxing",datTwitter))
matchIndex
s