# quiz(airquality)
# 1. ozone 합, 평균, 표준편차, 분산: na 제거
sum(airquality$Ozone, na.rm = T)
mean(airquality$Ozone, na.rm = T)
var(airquality$Ozone, na.rm = T)
sd(airquality$Ozone, na.rm = T)

# 2. 모든 na 제거 후, 각 월별로 측정값들의 평균
library(dplyr)
library(reshape2)
aq_melt = melt(airquality, id=c('Month', 'Day'), na.rm = T)
View(aq_melt)
acast(aq_melt, Month~variable, mean)

# 3. 5월달 평균 온도, 풍속
# use dplyr library
airquality %>% filter(Month==5) %>% summarise(Wind_Avg = mean(Wind, na.rm = T),
                                              Temp_Avg = mean(Temp, na.rm = T))
# use subset
test = subset(airquality, Month==5, select=Wind)
mean(test$Wind)

# 4. ozone 5월 합, 평균, 분산, 표준편차
#     -> na 제거
airquality %>% filter(Month==5) %>% summarise(Ozone_Sum = sum(Ozone, na.rm = T),
                                              Ozone_Avg = mean(Ozone, na.rm = T),
                                              Ozone_Var = var(Ozone, na.rm = T),
                                              Ozone_Sd = sd(Ozone, na.rm = T))

delNa = ifelse(!is.na(Ozone5$Ozone), Ozone5$Ozone,
               round(mean(Ozone5$Ozone, na.rm = T), 0))
mean(delNa)
#     -> r 기본함수와 사용자 정의 함수 사용
# ?

# 5. 5월 7일 데이터 출력
airquality %>% filter(Month == 5 & Day == 7) # what i did
airquality[airquality$Month == 5 & airquality$Day == 7, names(airquality)] # another option
airquality[airquality$Month == 5 & airquality$Day == 7,] # same as above

# 6. 5월 1일~ 5월 6일까지 ozone 출력
airquality %>% filter(Month == 5) %>% filter(Day >= 1 & Day <= 6) %>% select(Ozone) # what i did

# 7. 기온이 가장 높은 날짜를 기준으로 출력
airquality[which.max(airquality$Temp), c('Month','Day')]

# 8. 기온이 가장 높은 날의 모든 데이터 출력
airquality[which.max(airquality$Temp), names(airquality)]

# 9. 6월에 발생한 가장 강한 바람의 세기 출력
airquality %>% filter(Month == 6) %>% arrange(desc(Wind)) # what i did
wind6 = subset(airquality, Month=6,) # better one
wind6[which.max(wind6$Wind),]
