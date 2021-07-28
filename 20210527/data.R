library(KoNLP)
library(wordcloud2)
useNIADic()
wordData = readLines('res/애국가(가사).txt')
wordData2 = sapply(wordData, extractNoun, USE.NAMES = F)
wordData2
addWords = c('동해물', '삼천리', '화려강산', '대한사람', '백두산', '닭도록')
buildDictionary(user_dic = data.frame(addWords,
                                      rep('ncn', length(addWords))),
                replace_usr_dic = T)
useSejongDic()
wordData3 = sapply(wordData, extractNoun, USE.NAMES = F)
wordData3
unData = unlist(wordData3)
wordTable = table(unData)

# 2자 이상 단어 추출
unData2 = Filter(function(x) {nchar(x) >= 2}, unData)
wordTable2 = table(unData2)
sort(wordTable2, decreasing = T)
wordcloud2(wordTable2)
wordcloud2(wordTable2, fontFamily='맑은 고딕',
           size=1.0, color='random-light',
           backgroundColor='black', shape='star')
library(tm)
facebook = file('res/facebook_bigdata.txt', encoding = 'utf-8')
facebookData = readLines(facebook)
facebookData
userDic = data.frame(term = c('R프로그래밍', '페이스북', '소셜네트워크'),
                     tag = 'ncn')
buildDictionary(ext_dic = 'sejong',  user_dic = userDic)
exNouns = function(x) {
  paste(extractNoun(as.character(x)), collapse = ' ')
}
fbookNouns = sapply(facebookData, exNouns)

# 말뭉치
myCorpus = Corpus(VectorSource(fbookNouns))
myCorPusPrepro = tm_map(myCorpus,
                        removePunctuation)
myCorPusPrepro = tm_map(myCorpus,
                        removeNumbers)
myCorPusPrepro = tm_map(myCorpus,
                        tolower)
myCorPusPrepro = tm_map(myCorpus,
                        removeWords, stopwords('english'))
myCorPusPrepro
# 연관성 단어 추출
inspect(myCorPusPrepro)

# 
myCorPusPreproTerm = TermDocumentMatrix(myCorPusPrepro,
                                        control = list(wordLengths = c(4,16)))
myCorPusPreproTerm

# matrix -> data.frame
myTermDF = as.data.frame(as.matrix(myCorPusPreproTerm))
wordResult = sort(rowSums(myTermDF), decreasing = T)
wordResult

myName = names(wordResult)
wordDf = data.frame(word=myName, freq=wordResult)
wordDf
wordcloud2(wordDf, fontFamily='맑은 고딕',
           size=1.0, color='random-light',
           backgroundColor='black', shape='diamond')
