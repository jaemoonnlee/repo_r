library(ggplot2)
library(lattice)
library(caret)
library(readxl)

creditData = read.csv('res/credit.csv', stringsAsFactors = T)

# 대출기간
summary(creditData$months_loan_duration)
# 대출액
summary(creditData$amount)
# default = no: 미상환, yes: 상환
table(creditData$default)

set.seed(12345)
# order(): asc sort, 결측치 제거
creditRandData = creditData[order(runif(1000)),]

# 학습용 900개, 테스트 100개 랜덤 추출
creditTrain = creditRandData[1:900,]
creditTest = creditRandData[901:1000,]

prop.table(table(creditTrain$default))
prop.table(table(creditTest$default))

library(C50)
creditModel = C5.0(creditTrain[-17],
                   creditTrain$default)
summary(creditModel)
creditPred = predict(creditModel, creditTest)
table(creditPred)

library(gmodels)
gmodels::CrossTable(creditTest$default, creditPred,
                    dnn = c('Actual', 'Predict'))

# chi-square(카이스퀘어) 검정: 교차 분석으로 얻어진 교차 분할표를 대상으로
# 유의 확률(p)을 적용하여 변수들 간의 독립성 및 관련성 여부 등을 검정하는 분석.

# 앙상블 기법
# 단독 모델로 예측하는 것이 아닌 여러 모델을 생성하여 예측을 하고, 평균을 통해 이 결과를 예측
# 1. boosting: 가중치를 이용하여 약한 학습기를 강한 학습기로 만드는 방법.
# 2. bagging: 부트스트랩(random sampling)을 집계하는 것.
creditBoost10 = C5.0(creditTrain[-17],
                     creditTrain$default,
                     trials = 10)
# summary(creditBoost10)
creditBoost10Pred = predict(creditBoost10,
                            creditTest)
CrossTable(creditTest$default, creditBoost10Pred,
           dnn = c('Actual', 'Predict'))
# ---------------------------------------------------
creditBoost100 = C5.0(creditTrain[-17],
                     creditTrain$default,
                     trials = 100)
# summary(creditBoost100)
creditBoost100Pred = predict(creditBoost100,
                            creditTest)
CrossTable(creditTest$default, creditBoost100Pred,
           dnn = c('Actual', 'Predict'))
