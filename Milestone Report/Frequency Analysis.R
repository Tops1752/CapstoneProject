## split a centence into word pair vector
splitToWordPair <- function(Line, pairNum){
    
    ## split lines into words
    words <- unlist(strsplit(Line, "[[:space:]]|(?=[,.!?;-])", perl=TRUE))
    ## remove empty charactors in words
    words <- words[words != ""]
    
    if(pairNum == 1)
        return (words)
    
    ## create word pairs by defining number of words in the pair
    prev <- NULL
    wPair<- NULL
    for(w in words){
        if(is.null(prev))
            prev <- w
        else
            prev <- c(prev,w)
        
        if(length(prev) < pairNum)
            next
        
        pair <- paste(prev,collapse = " ")
        
        ##record the word pair
        if(is.null(wPair))
            wPair <- pair
        else
            wPair <- c(wPair,pair)
        
        ##remove the first record in the pair
        prev <- prev[-c(1)]
        
    }
    
    return(wPair)
    
}


# Input the lines and number of word pairs
# Output the word pair frequency in the lines


FreqAnalyzer <- function(Lines, wordPairNum){
    
    ## get the word pairs - each line is a list
    wordPairs <- unlist(unname(sapply(Lines,FUN = splitToWordPair, pairNum = wordPairNum)))
    
    ## generate frequency table
    tb <- table(wordPairs)
    
    ##  sort the table by frequency
    df <- as.data.frame(tb) 
    df <- df[order(-df$Freq),]
    rownames(df) <- c()
    
    ## add percentage and accumulated percentage column
    df$Percentage <- df$Freq / sum(df$Freq)
    df$cumPer <- cumsum(df$Percentage)

    return(df)
}

## Draw plots to show the frequcy 
drawFreqPlot <- function(FreqResult,top){
    
    library(ggplot2)
    
    ##remove row names
    rownames(FreqResult) <- c()
    
    ##get the top lines to plot
    plotDat<- FreqResult[1:top,]
    plotDat$wordPairs <- factor(plotDat$wordPairs,levels = plotDat$wordPairs)
    
    plot <- ggplot(plotDat, aes(x=wordPairs,y=Freq)) + 
        geom_bar(stat="identity") + 
        coord_flip() +
        ggtitle(paste("Word Pair Frequancy - Top",top,collapse = " "))
    
    return(plot)
}



## Read file

Dir <- "C:/Users/bzou/Documents/R/CapstoneProject/final/"
setwd(Dir)

Tran.Twitter <- readLines("en_US/Train.Twitter.txt")
Tran.Blogs <- readLines("en_US/Train.Blogs.txt")
Tran.News <- readLines("en_US/Train.News.txt")


Freq1.Twitter <- FreqAnalyzer(Tran.Twitter,1)
Freq1P.Twitter <- drawFreqPlot(Freq1.Twitter,20)

Freq1.Blogs <- FreqAnalyzer(Tran.Blogs,1)
Freq1P.Blogs <- drawFreqPlot(Freq1.Blogs,20)

Freq1.News <- FreqAnalyzer(Tran.News,1)
Freq1P.News <- drawFreqPlot(Freq1.News,20)



##Testing

TestDat <- Tran.Twitter[50:350]
TestResult <- FreqAnalyzer(TestDat,3)
drawFreqPlot(TestResult,10)

PopularCount <- nrow(TestResult[TestResult$cumPer>0.8,])
TotalCount <- nrow(TestResult)
PopularPer <- PopularCount/TotalCount
PopularPer












