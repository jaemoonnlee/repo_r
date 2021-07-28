library(readxl)
exdata1 = read_excel('res\\sample1.xlsx')
# View(exdata1)
str(exdata1)
dim(exdata1) # show its objects(row) and variables(column)
ls(exdata1) # show its columns (asc)

library(dplyr)
exdata1 = rename(exdata1, Y17_AMT = AMT17, Y16_AMT = AMT16)
# View(exdata1)

exdata1$AMT_NEW = exdata1$Y17_AMT + exdata1$Y16_AMT
exdata1$CNT_NEW = exdata1$Y17_CNT + exdata1$Y16_CNT
# View(exdata1)

exdata1$AVG_AMT = exdata1$AMT_NEW / exdata1$CNT_NEW
# View(exdata1)

exdata1$AVG_GR = ifelse(exdata1$AGE >= 50, 'A1',
                       ifelse(exdata1$AGE >= 40, 'A2',
                              ifelse(exdata1$AGE >= 30, 'A3',
                                     ifelse(exdata1$AGE >= 20, 'A4'))))
# View(exdata1)

exdata1 %>% select(-AREA)
exdata1 %>% select(-ID, -GENDER, -AGE)
# exdata1 %>% filter(AREA == '서울')
# exdata1 %>% filter(AREA == '서울' & Y17_CNT >= 10)
exdata1 %>% arrange(AGE)
exdata1 %>% arrange(desc(AGE))
exdata1 %>% summarise(TOTAL_Y17_AMT = sum(Y17_AMT))
exdata1 %>% group_by(AREA) %>%
  summarise(TOTAL_Y17_AMT_BY_AREA = sum(Y17_AMT))

fData = read_excel('res\\sample1_f.xlsx')
mData = read_excel('res\\sample1_m.xlsx')
exdata1_bindjoin = bind_rows(mData, fData)
# View(exdata1_bindjoin)

jeju_y17 = read_excel('res\\sample1_jeju_17.xlsx')
jeju_y16 = read_excel('res\\sample1_16.xlsx')
bind_col = left_join(jeju_y17, jeju_y16, by='ID')
# View(bind_col)
bind_col_inner = inner_join(jeju_y17, jeju_y16, by='ID')
# View(bind_col_inner)
bind_col_full = full_join(jeju_y17, jeju_y16, by='ID')
# View(bind_col_full)
bind_col_right = right_join(jeju_y17, jeju_y16, by='ID')
# View(bind_col_right)

# na
data = c(10,20,5,4,40,7,NA,6,3,NA,2,NA)
na = function(x) {
  print(x)
  print(mean(x,na.rm=T))
  
  data = ifelse(!is.na(x), x, 0)
  print(data)
  print(mean(data))
  
  data2 = ifelse(!is.na(x), x, round(mean(x, na.rm=T), 1))
  print(data2)
  print(mean(data2))
}
na(data)

x1 = c(1,2,3,4,5,6,10)
mean(x1) # avg
max(x1) # max
min(x1) # min
range(x1) # min, max
quantile(x1) # 분포도
quantile(x1, probs = 0.25)
quantile(x1, probs = 0.5)
# sd() 표준편차: 평균에 대한 오차
# var() 분산: 표준편차의 제곱
cat('분산', var(x1), '\n')
cat('표준편차', sd(x1), '\n')

var_sd = function(x){
  n = length(x)
  var = sum((x-mean(x))^2) / (n-1)
  sd = sqrt(var)
  cat('분산', var, '\n')
  cat('표준편차', sd, '\n')
}
var_sd(x1)

library(fBasics)
# 통계량이 0보다 크면 정규분포 대비 뾰족한 형태.
#          0보다 작으면 정규분포 대비 평평한 형태.
kurtosis(x1)
# x 변수 왜도: 데이터 분포의 비대칭성
# 통계량의 절대값이 클 수록 비대칭이 심함.
# + 값이면 오른쪽으로 꼬리가 길고,
# - 값이면 왼쪽으로 꼬리가 긴 형태.
skewness(x1)

library(reshape2)
airquality
head(airquality)
names(airquality) = tolower(names(airquality))
melt_test = melt(airquality)
head(melt_test)
str(airquality)
airquality
melt_test2 = melt(airquality,
                  id.vars = c('month','wind'),# 기준열
                  measure.vars = 'ozone')# 변환열
melt_test2

melt_test3 = melt(airquality,
                  id.vars = c('month','wind'),# 기준열
                  variable.name = 'climate_variables',
                  value.name = 'climate_value')
melt_test3

# acast(): vector, matrix, array 변환
# dcast(): data frame 변환
aq_melt = melt(airquality, id=c('month', 'day'), na.rm=T)
head(aq_melt)
aq_dcast = dcast(aq_melt, month+day~ variable)
class(aq_dcast)
head(aq_dcast)
head(airquality)
head(aq_melt)

acast(aq_melt, day~month~variable)
acast(aq_melt, month~variable, mean)
dcast(aq_melt, month~variable, mean)
