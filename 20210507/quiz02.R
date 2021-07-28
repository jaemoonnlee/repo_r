# quiz
library(hflights)
library(dplyr)
nrow(hflights) # 227469 rows
names(hflights) # 21 columns
# 1. 1월 2일 데이터 추출
hflights[hflights$Month == 1 & hflights$DayofMonth == 2,] # it show its org idx
subset(hflights, Month==1 & DayofMonth==2,)
answer01 = hflights %>% filter(Month == 1 & DayofMonth== 2) # it show new idx


# 2. 1월 or 2월 데이터 추출
answer02 = hflights[hflights$Month == 1 | hflights$Month == 2,]

# 3. 도착시간(ArrTime)을 기준으로 오름차순 정렬
answer03 = arrange(hflights, hflights$ArrTime)

# 4. Year, Month, DepTime, ArrTime 데이터 검색
answer04 = hflights %>% select(Year, Month, DepTime, ArrTime)

# 5. 출발지연 시간(DepDelay), 도착지연 시간(ArrDelay)을 구한 후,
#       새로운 칼럼 도착지연시간(ArrTime - DepTime) 추가.
part = select(hflights, DepDelay, ArrDelay)
answer05 = mutate(part, WholeDelay=(hflights$ArrTime - hflights$DepTime))

# 6. 비행시간 평균(na 제거)
answer06 = mean(hflights$AirTime, na.rm = T)

# 7. 도착시간의 표준편차, 분산
answer07 = c(V = var(hflights$ArrTime, na.rm = T),
             Sd = sd(hflights$ArrTime, na.rm = T))

# answers
answer01
answer02
answer03
answer04
answer05
answer06
answer07
