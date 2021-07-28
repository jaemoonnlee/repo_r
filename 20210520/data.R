# 회귀분석(p.477)
# : 독립 변수가 다른 변수에 어떠한 영향을 미치는가를 분석
library(ggplot2)

head(diamonds)
# lm(종속변수~독립변수, 데이터)
dia = lm(price ~ carat, data=diamonds)
# summary(dia)
# names(dia)
# fitted.values(dia)[1:2]
# head(diamonds, 1)

par(mfrow=c(2,2)) # plot 2행 2열 표시
plot(dia)

library(car)
outlierTest(dia)

library(readxl)
csvIns = read.csv('res/insurance.csv')
summary(csvIns)
par(mfrow=c(1,1))
hist(csvIns$charges)
hist(csvIns$bmi)

library(psych)
scaMatrix = csvIns[c('age','bmi','children','charges')]
pairs.panels(scaMatrix)

cor(scaMatrix)

# 다중 회귀분석
lmins = lm(charges ~ age + children + bmi + sex + smoker + region, data = csvIns)
lmins
# par(mfrow=c(2,2))
# plot(lmins)
csvIns$age2 = csvIns$age^2
csvIns$bmi30 = ifelse(csvIns$bmi >= 30, 1, 0)
lmins2 = lm(charges ~ age+age2+children+bmi+sex+(bmi30*smoker)+region, csvIns)
summary(lmins2)

lmins3 = step(lmins2, direction = "backward")
summary(lmins3)
