library(tm)


cleaning <- function(text){

   text.source <- VectorSource(text)

    corpus <- Corpus(text.source)
    corpus <- tm_map(corpus, content_transformer(tolower))
    corpus <- tm_map(corpus, removePunctuation)
    corpus <- tm_map(corpus, stripWhitespace)
   
   return(corpus)

}