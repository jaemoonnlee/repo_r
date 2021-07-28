# header: 데이터에서 1행이 변수명인지 판별
# ex) 1행이 변수명이면 header = T

# skip: 특정 행까지 제외하고 데이터 가져오기
# ex) 3행부터 3ㅔ이터 가져오기
#     skip = 2

# nrows: 특정 행까지 데이터 가져오기
# ex) 7행까지 데이터 가져오기
#     nrows = 7

# sep: 데이터 구분자 지정
# ex) 쉼표로 구분된 데이터 집합 -> ','

# .rda(통계용 파일)
# id = c(1,2,3,4,5)
# name = c('a','b','c','d','e')
# rdaData = data.frame(ID=id, NAME=name)
# save(rdaData, file='res\\data_ex.rda')

load('res\\data_ex.rda')
# View(rdaData)

titanic = read.csv('https://vincentarelbundock.github.io/Rdatasets/csv/COUNT/titanic.csv')
dim(titanic)
str(titanic)

table(titanic$age)
table(titanic$sex)
table(titanic$survived)

head(titanic)
tail(titanic)

# 교차 분할표
tab = table(titanic$survived, titanic$sex)
tab

plot(tab, col=c('green', 'blue'), main='성별에 따른 생존 여부')
barplot(tab, col=c('red', 'blue'), main='성별에 따른 생존 여부')

write.table(titanic, 'res\\titanic.txt', row.names = F)
titanicdf = read.table('res\\titanic.txt', sep = '', header = T)
View(titanicdf)
write.csv(titanicdf, 'res\\titanic.csv', row.names = F, quote = F)

library(writexl)
write_xlsx(x=titanicdf, path='res\\titanic.xlsx', col_names = T)

