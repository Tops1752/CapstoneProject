## Read file

Dir <- "C:/Users/bzou/Documents/R/CapstoneProject/"
setwd(Dir)


Dat.Twitter <- readLines("final/en_US/en_US.twitter.txt")

Dat.Blogs <- readLines("final/en_US/en_US.Blogs.txt")

Dat.News <- readLines("final/en_US/en_US.news.txt")

## Slice Dat.a to training Dat.a and testing Dat.a

sizeTwitter <- floor(0.75*length(Dat.Twitter))
sizeBlogs <- floor(0.75*length(Dat.Blogs))
sizeNews <- floor(0.75*length(Dat.News))

set.seed(12345)
InTrainTwitter <- sample(seq_len(length(Dat.Twitter)),size = sizeTwitter)
InTrainBlogs <- sample(seq_len(length(Dat.Blogs)),size = sizeBlogs)
InTrainNews <- sample(seq_len(length(Dat.News)),size = sizeNews)

trainTwitter <- Dat.Twitter[InTrainTwitter]
testTwitter <- Dat.Twitter[-InTrainTwitter]

trainBlogs <- Dat.Blogs[InTrainBlogs]
testBlogs <- Dat.Blogs[-InTrainBlogs]

trainNews <- Dat.News[InTrainNews]
testNews <- Dat.News[-InTrainNews]

write(trainTwitter,"final/en_US/Train.Twitter.txt")
write(testTwitter,"final/en_US/Test.Twitter.txt")

write(trainBlogs,"final/en_US/Train.Blogs.txt")
write(testBlogs,"final/en_US/Test.Blogs.txt")

write(trainNews,"final/en_US/Train.News.txt")
write(testNews,"final/en_US/Test.News.txt")

## Create sample Dat.as to play with

sizeTwitter <- floor(0.01*length(Dat.Twitter))
sizeBlogs <- floor(0.01*length(Dat.Blogs))
sizeNews <- floor(0.01*length(Dat.News))

set.seed(12345)
SampleTwitter <- sample(seq_len(length(Dat.Twitter)),size = sizeTwitter)
SampleBlogs <- sample(seq_len(length(Dat.Blogs)),size = sizeBlogs)
SampleNews <- sample(seq_len(length(Dat.News)),size = sizeNews)

trainTwitter <- Dat.Twitter[SampleTwitter]

trainBlogs <- Dat.Blogs[SampleBlogs]

trainNews <- Dat.News[SampleNews]

write(trainTwitter,"final/en_US/Sample.Twitter.txt")

write(trainBlogs,"final/en_US/Sample.Blogs.txt")

write(trainNews,"final/en_US/Sample.News.txt")

