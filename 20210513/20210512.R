library(readxl)
exdata1 <- read_excel('res/sample1.xlsx')
exdata1

library(descr)
freq(exdata1$AREA, plot=F)

# 통계적 자료를 줄기, 잎, 도수로 표현
stem(exdata1$AGE)
exdata1$AGE

#histogram : 구간변 빈도수
hist(exdata1$AGE) #차트보기
hist(exdata1$AGE,xlim=c(0,100),
     ylimc(0,10),main-'나이 분포')
hist(exdata1$AGE,main='계좌이용 나이 분포',
     xlab='나이 구간',ylab='나이 분보', xlim=c(1,100),col='blue',probability=T)
hist(exdata1$AGE,main='계좌이용 나이분포', xlab='나이 구간',ylab='나이 빈도',col='green',freq=T,breaks=10)
#-------------------------------------------
#whisiker : 상자의 좌우, 상하로 뻗어나간 선
#박스 내의 가로선 " 중앙값
#lower whisker : 최소값
#->중앙값 - 1.5xIQR보다 큰 데이터 중 가장 작은 값

boxplot(exdata1$Y17_CNT,exdata1$Y16_CNT)
quantile(exdata1$Y17_CNT)
quantile(exdata1$Y16_CNT)


boxplot(exdata1$Y17_CNT,exdata1$Y16_CNT,
        ylim=c(0,60),main='BoxPlot',
        names=c('17년 데이터 계좌 건수','16년 데이터 계좌 건수'),
        col=c('green','yellow'))

chart_data<-c(305,450,320,460,330,480,380,520)
names(chart_data)<-c('2018년 1분기','2019 1분기',
                     '2018년 2분기','2019 2분기',
                     '2018년 3분기','2019 3분기',
                     '2018년 4분기','2019 4분기')
barplot(chart_data,ylim=c(0,600),
        col=rainbow(7),
        main='2018년 vs 2019년 매출 현황 비교')

barplot(chart_data,xlim=c(0,600),horiz=T,
        ylab='매출액(단유ㅣ:백만원)',
        xlab='년도별 분기 현황',
        col=rep(c(5,6,7,8),2),
        space=1, cex.names=0.8,
        main='2018년 vs 2019년 매출 현황 비교')

data('VADeaths')
par(mfrow=c(1,1))
barplot(VADeaths, beside=T,col=rainbow(5),
        main='버지니아주 하위 계층 사망 비율')
legend(19,71,c('50-54','55-59','60-64','65-69','70-74'),
       cex=0.8,fill = rainbow(5))

par(mfrow=c(1,1))
dotchart(chart_data, color=c('blue','red'),
         lcolor='black',pch=3:4,
         labels=names(chart_data),
         xlab='매출액',
         main='분기별 판매현황 : Dot chart',
         cex=1.2)
par(mfrow=c(1,1))
pie(chart_data, labels=names(chart_data),
    col=rainbow(8),cex=1.2)
title('2018~2019년도 분기별 매출현황')

boxplot(VADeaths, range=0)
boxplot(VADeaths, range=0,notch=T)

data(iris)
str(iris)
summary(iris$Sepal.Length)
hist(iris$Sepal.Length,xlab = '꽃받침 길이',col='magenta',main='iris 꽃받침 길이 Histogram',
     xlim=c(4.3,7.9))
summary(iris$Sepal.Width)
hist(iris$Sepal.Width,xlab = '꽃받침 너비',col='yellow',main='iris 꽃받침 너비 Histogram',
     xlim=c(2.0,4.5))
part(mfrow=c(1,2))
hist(iris$Sepal.Width,xlab = '꽃받침 너비',
     col='yellow',
     main='iris 꽃받침 너비 Histogram',
     xlim=c(2.0,4.5))
#밀도
lines(density(iris$Sepal.Width),col='red')

par(mfrow = c(2,2))
plot(price,type='o',pch=5)
plot(price,type='o',pch=15)
plot(price,type='o',pch=20, col='blue')
plot(price,type='o',pch='*', col='orange',cex=1.5)
plot(price,type='o',pch='+', col='green',cex=3.0,lwd=3)

data("wwusage")
str(wwusage)
plot(wwusage)
kwData<-c(200,300,230,700,180,270,400,46,76)
plot(kwData)
tskData<-ts(kwData,start=1)
plot(tskData)

