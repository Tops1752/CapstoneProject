corpus <- cleaning(Sample.News)

dataframe<-data.frame(text=unlist(sapply(corpus, `[`, "content")), stringsAsFactors=F)


dtm <- DocumentTermMatrix(corpus)
dtm2 <- as.matrix(dtm)
frequency <- colSums(dtm2)
frequency <- sort(frequency, decreasing=TRUE)
head(frequency)


BigramTokenizer <- function(x) unlist(lapply(ngrams(words(x), 2), paste, collapse = " "), use.names = FALSE)
dtmDouble <- TermDocumentMatrix(corpus, control = list(tokenize = BigramTokenizer))
frequency <- colSums(as.matrix(dtmDouble))
frequency <- sort(frequency, decreasing=TRUE)
head(frequency)


dfFreq <- data.frame(words = names(frequency))
dfFreq$freq <- frequency
dfFreq$per <- frequency/sum(frequency)
dfFreq$cumsum <- cumsum(dfFreq$per)
dfFreq$wordPer <- 1/length(dfFreq$words)
dfFreq$cumWordPer <- cumsum(dfFreq$wordPer)


library(ngram)
str <- concat(Sample.Blogs,Sample.News, Sample.Twitter)

ng2 <- ngram(str,n=2)

str(ng2)

uniqueW <- get.ngrams(ng2)



## data cleaning


## To start a centence - go with the highest frequent word of starting a centence.

str <- "To start a centence - go with the highest frequent word of starting a centence"
ng <- ngram(str)
babble(ng, genlen=2, seed=1234)
