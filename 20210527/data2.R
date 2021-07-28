library(KoNLP)
library(wordcloud2)
library(httr)
library(XML)

useNIADic()
url = 'https://news.daum.net'
web = GET(url)
tail(web)

html = htmlTreeParse(web, useInternalNodes = T,
                     trim = T, encoding = 'utf-8')
rootNode = xmlRoot(html)

news = xpathApply(rootNode,
                  '//a[@class="link_txt"]',
                  xmlValue)
news
newsPre = gsub("[\r\n\t]", " ", news)
newsPre = gsub("[[:punct:]]", " ", newsPre)
newsPre = gsub("[[:cntrl:]]", " ", newsPre)
newsPre = gsub("[a-z]", " ", newsPre)
newsPre = gsub("[A-Z]", " ", newsPre)
newsData = newsPre[1:46]
newsData

write.csv(newsData, 'res/daum0527_news.csv', quote = F)
newsData2 = read.csv('res/daum0527_news.csv', header = T,
                     stringsAsFactors = F)
names(newsData2) = c('num', 'content')
newsData2

newsTitle = newsData2$content
exNouns = function(x) {
  paste(extractNoun(x), collapse = " ")
}
newsNouns = sapply(newsTitle, exNouns)
newsNouns
library(tm)
newsCorpus = Corpus(VectorSource(newsNouns))
inspect(newsCorpus)
tdm = TermDocumentMatrix(newsCorpus,
                         control = list(wordLengths=c(4,16)))
tdmDF = as.data.frame(as.matrix(tdm))
wordResult = sort(rowSums(tdmDF), decreasing = T)
head(wordResult)

myNames = names(wordResult)
wordDf = data.frame(word=myNames, freq=wordResult)
wordDf
wordcloud2(wordDf, fontFamily='맑은 고딕',
           size=1.0, color='random-light',
           backgroundColor='black', shape='circle')
