list1 <- list(c(1,2,3), c('홍길동', '김길동', '이길동'), T, 12.5)
list1

# list & names
list2 <- list(c('a', 'b', 'c'), c(20, 30, 40))
names(list2) <- c('이름', '나이')
list2
cat(list2$이름)

member <- list(name=c('홍길동','전우치'),
               age=c(200,300),
               address=c('한양','강원'),
               gender=c('남자','남자'),
               home=c('홍대감댁', '두메산골'))
# show element
member$name
member$name[1]
member$name[2]
# edit element
member$age[1] <- 100
member$age

# data frame
id <- c(1,2,3,4,5)
gender <- c('m','m','m','f','f')
addr <- c('대구','서울','부산','대전','경기')
dataVal <- data.frame(id, gender, addr)
mode(dataVal)
class(dataVal)
View(dataVal)

id_r1 = c('a1','a2','a3','a4')
name_r1 = c('홍길동','김길동','이길동','박길동')
stu_r1 = data.frame(id_r1, name_r1)
stu_r1

stu_r2 <- data.frame(
  id_r2 = c('j1','j2','j3','j4'),
  name_r2 = c('전우치','김우치','이우치','박우치')
)
stu_r2

names(stu_r1) <- c('ID', '이름')
names(stu_r2) <- names(stu_r1)
stu_r1
stu_r2

# rbind (row bind)
studRbind <- rbind(stu_r1, stu_r2)
studRbind

stu_c1 = data.frame(
  id = c('i1','i2','i3'),
  name = c('홍길동','김길동','이길동'))
names(stu_c1) = c('ID', '이름')
stu_c2 = data.frame(
  id = c('92','87','79'),
  name = c('A','B','C'))
names(stu_c1) = c('점수', '성적')

# cbind (column bind)
studCbind = cbind(stu_c1, stu_c2)
studCbind

stu_j1 = data.frame(
  id = c('i1','i2','i3'),
  name = c('홍길동','김길동','이길동'))
names(stu_j1) = c('ID', '이름')
stu_j2 = data.frame(
  id = c('i2','i3','i4'),
  gender = c('M','F','F'))
names(stu_j2) = c('ID', '성별')

# merge
studJoin = merge(x = stu_j1, y = stu_j2, by = 'ID')
studJoin

library(stringr)
# str_extract(string, [pattern]{min,max})
strData = c('Scott35이순신45유관순25홍길동30')
str_extract(strData, '[1-9]{2,10}')
str_extract_all(strData, '[1-9]{2,4}')
str_extract_all(strData, '[A-Za-z]{1,10}')
str_extract_all(strData, '[가-힣]{1,10}')
# str_extract(string, [^pattern]{min,max}): return string except the pattern
str_extract_all(strData, '[^가-힣]{1,10}')

name = '홍길동1234,이순신5678,김길동1011'
str_extract_all(name, '[\\w]{1,}')# \\w means ,(comma)
str_extract_all(name, '[\\d]{1,2}')# \\d means decimal
str_match_all(name, '[\\d]')

size = str_length(name)
cat(size)

index <- str_locate(strData, 'Scott')
strDataSub <- str_sub(strData, index)
cat(strDataSub)

str_to_upper(strData)
str_to_lower(strData)
strData

# reg pattern
id_pattern_kr = '[0-9]{2}[0-1]{1}[1-9]{1}[0-3]{1}[0-9]{1}-?[1-4]{1}.{6}'
str_extract('890620-1xxxxxx', id_pattern_kr)
str_extract('980101-1xxxxxx', id_pattern_kr)
str_extract('150908-4xxxxxx', id_pattern_kr)
str_extract('170504-4xxxxxx', id_pattern_kr)

# 1974년 ?
mtcars
# ...
str(mtcars)# return columns and its type&values
head(mtcars)# return 6 rows from start
tail(mtcars)# return 6 rows from end
length(mtcars)# return column count
length(mtcars$mpg)# return column[mpg] count
names(mtcars)# return column names
class(mtcars)# return type of parameter
sapply(mtcars, class)# show 
