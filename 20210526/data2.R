# NLP(Natural Language Process)
# KoNLP: 사전을 통해 문서에 포함된 단어의 품사를 분석.
library(wordcloud2)  # 단어 빈도 시각화
library(Sejong)      # 세종사전
library(hash)        # hash table
library(rJava)       # ?
Sys.setenv(JAVA_HOME="C:\\Program Files\\Java\\jdk1.8.0_281")
library(tau)         # text 분석
library(tm)          # text 가공
library(devtools)    # ?
remotes::install_github('haven-jeon/KoNLP',
                        upgrade = "never",
                        INSTALL_opts = c("--no-multiarch"))
library(KoNLP)
# useSystemDic()  # 시스템 사전
useSejongDic()  # 세종 사전
# useNIADic()     # NIA 사전

docData = '롯데마트가 판매하고 있는 흑마늘 양념 치킨이 논란이 되고 있다.'
extractNoun(docData)    # 명사 추출
SimplePos09(docData)    # 카이스트 9분류
SimplePos22(docData)    # 카이스트 22분류
MorphAnalyzer(docData)  # 

exData = c("아버지께서 방에 스르륵 들어가신다.")
extractNoun(exData)
KoNLP::MorphAnalyzer(exData)

chData = c('스르륵')
# 세종 사전 커스터마이징
buildDictionary(ext_dic = "woorimalsam",
                user_dic = data.frame(chData, c("ncn")),
                replace_usr_dic = T)
txtData = 'R은 오픈소스로 통계, 기계학습, 금융, 생물정보학, 그래픽스에 이르는 다양한 통계 패키지를 갖추고 있는 좋은 프로그램이다.'
extractNoun(txtData)
exData = c("오픈소스", "기계학습", '생물정보학', '다양한')
buildDictionary(ext_dic = "woorimalsam",
                user_dic = data.frame(exData, c("ncn")),
                replace_usr_dic = T)
extractNoun(txtData)

library(dplyr)
library(ggplot2)
txtData2 = '1993년 뉴질랜드에 위치한 오클랜드 대학교에서 개발된 통계 및 그래프 작업을 위한 인터프리터 프로그래밍 언어이다. R이 가지는 특이사항 중 하나로, color를 colour라고 쓰는 것 또한 인정된다. 영국식 영어를 사용하는 뉴질랜드에서 개발돼서 얻은 특징인듯.'
sejongRes = MorphAnalyzer(txtData2)
sum(sapply(sejongRes, length))
# useNIADic()
niaRes = MorphAnalyzer(txtData2)
sum(sapply(niaRes, length))
library(data.table)
rbindRes = rbind(data.table(dic=names(sejongRes),
                            count=sapply(sejongRes, length),
                            kind='Sejong dictionary'),
                 data.table(dic=names(niaRes),
                            count=sapply(niaRes, length),
                            kind='NIA dictionary'))
ggplot(rbindRes,
       aes(dic, count)) + 
  geom_bar(stat='identity', aes(fill=kind), position='stack') + 
  coord_flip() + 
  ggtitle('형태소 분석 결과 빈도')

# ...