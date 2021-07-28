# 로지스틱 회귀분석(Logistic Regression Analysis)
# 지도학습으로 분류되며, 특정 결과의 분류 및 예측 가능.
# mtcars dataset
summary(mtcars)
# mpg   수치형  갤런당 마일(연비)
# cyl   수치형  실린더 개수
# disp  수치형  배기량
# hp    수치형  마력
# drat  수치형  리어액슬(후륜제어기술) 비율
# wt    수치형  무게
# qsec  수치형  ?
# vs    범주형  엔진 종류(0=v-shaped, 1=straight)
# am    범주형  변속기 종류(0=automatic 1=manual)
# gear  수치형  전진기어 개수
# carb  수치형  기화기 갯수

# famaily 옵션 분류
# 정규분포: gaussian, 이항분포: binomial
# 포아손분포: poisson, 역정규분포: inverse.gaussian, 감마 분포: gamma
vsGlm = glm(vs ~ mpg + am, data = mtcars, family = binomial)
# 회귀분석 결과는 오즈(odds)로 해석
# ex1)  mpg(연비)의 회귀계수가 0.6809, mpg가 한 단계 증가하면
#       vs=1일 오즈가 exp(0.6809) = e^0.6809
# ex2)  am(변속기)의 회귀계수가 -3.0073, mpg가 한 단계 증가하면
#       vs=1일 오즈가 exp(-3.0073) = e^-3.0073

# 선형회귀분석: Y(-∞ ~ ∞) = ax + b(-∞ ~ ∞)
# 로지스틱 회귀분석: P(0~1) = ax + b(-∞ ~ ∞)
# P의 성공범위(1: 성공, 0: 실패)와 ax + b 범위가 다름.
# P의 성공범위를 (-∞ ~ ∞)로 변환: Logit = Log(odds)
# 오즈(odds): 성공할 확률 / 실패할 확률 = P / (1 - P)
# 오즈비(odds ratio): 성공확률이 실패확률에 비례해서 몇 배 더 높은지 나타내는 수식.
# Log(odds) ∈ (-∞ ~ ∞)
summary(vsGlm)

vsGlm2 = glm(vs ~ mpg + am + wt, data = mtcars, family = binomial)
summary(vsGlm2)
# par(mfrow=c(2,2))
# plot(vsGlm2)

# 유의하지 않은 독립변수 제거(후진 소거법)
stepVs = step(vsGlm2, direction = 'backward')

# 분산 분석(ANOVA)
# 10대, 20대, 30대, 40대, 50대 간의 혈압 차이
# 3개 이상의 다수 집단을 비교할때 사용.

# 연속형 자료 검정: T-test(이항), anova(다항)
#   -> 수치화 가능: 키, 몸무게
# 범주형 자료 검정: 카이제곱(Chisquare)검정, 피셔의 정확검정법
#   -> 수치 불가능: 성별, 혈액형
anova(vsGlm2, test = "Chisq")

# 사전 확률: 특정 사건 발생 전의 확률
# 사후 확률: 특정 사건 발생 후의 확률
# 근본 원인이 무엇인지 불확실한 상황? 기준 설정을 0.5로 설정.
# 사후 확률이 0.5 초과면 straight 엔진으로 예측.
# 사후 확률이 0.5 이하면 v-shaped 엔진으로 예측.
rawData = mtcars
predict_prob = predict(stepVs, newdata = rawData, type = 'response')
predictVs = ifelse(predict_prob > 0.5, 1, 0)
result = data.frame(actual = rawData$vs, 
                    predicted = predictVs,
                    pred_prob = predict_prob)
head(result)

# 혼동행렬(confusion matrix)
# 특정 분류 모델의 성능을 평가하는 지표
# 실제값과 모델이 예측한 예측값을 한눈에 알아볼 수 있게 배열한 행렬
library(caret)
library(e1071)
confusionMatrix(as.factor(rawData$vs),        # 예측값
                as.factor(result$predicted))  # 결과값
