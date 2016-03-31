

#### Read Training Data #####
Dir <- "C:/Users/bzou/Documents/R/CapstoneProject/"
Dir <- "F:/Certifications/Data Scientist Coursera/10 CapstoneProject/"
setwd(Dir)

Tran.Twitter <- readLines("final/en_US/Train.Twitter.txt")
Tran.Blogs <- readLines("final/en_US/Train.Blogs.txt")
Tran.News <- readLines("final/en_US/Train.News.txt")


##### Read all data #####
Dir <- "C:/Users/bzou/Documents/R/CapstoneProject/"
setwd(Dir)

Dat.Twitter <- readLines("final/en_US/en_US.Twitter.txt")
Dat.Blogs <- readLines("final/en_US/en_US.blogs.txt")
Dat.News <- readLines("final/en_US/en_US.News.txt")


##### Read sample data #####
Dir <- "C:/Users/bzou/Documents/R/CapstoneProject/"
setwd(Dir)

Sample.Twitter <- readLines("final/en_US/Sample.Twitter.txt")
Sample.Blogs <- readLines("final/en_US/Sample.blogs.txt")
Sample.News <- readLines("final/en_US/Sample.News.txt")


#####Data cleaning function#####

source('Data Processing/Data Cleaning.R')

####Word Pair ####
BigramTokenizer <- function(x) NGramTokenizer(x, Weka_control(min = 2, max = 2))

