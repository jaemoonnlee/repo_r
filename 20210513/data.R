attributes(iris)
pairs(iris[iris$Species == 'virginica', 1:4])
pairs(iris[iris$Species == 'setosa', 1:4])
pairs(~ Sepal.Width + Sepal.Length + Petal.Width + Petal.Length,
      data = iris, col=iris$Species)

# 상관분석
# 두 변수가 서로 어떤 관계에 있는지 파악하는 분석 기법

# 공분산
# 각 확률변수들이 어떻게 퍼져있는지를 나타내는 것
# x의 편차와 y의 편차를 곱한 것의 평균값

# 귀무 가설: 두 변수는 서로 상관 관계가 없음. (R==0)
# 대립 가설: 두 변수를 서로 상관 관계가 있음. (R!=0)

# 상관계수: 상관관계의 정도를 파악
# pearson 상관계수(r)
#   -> 상관분석에서 기본 사용
#   -> -1 ~ +1 사이의 값
#   -> +-0.9 이상: 매우 높은 상관 관계
#   -> +-0.2 이하: 상관 관계가 없음.

# 상관계수 식
# x바: 표본집단 x의 평균
# y바: 표본집단 y의 평균
# sx: 표본집단 x의 표준편차
# sy: 표본집단 y의 표준편차
# n: 표본집단의 갯수


# Kendall 상관계수
# Spearman 상관계수
# - 순위, 등급으로 변경해서 사용(학교등급, 졸업학위, 성적)

# 공분산
cov(mtcars$mpg, mtcars$cyl)
# 상관계수
cor(mtcars$mpg, mtcars$cyl)

plot(mtcars$mpg, mtcars$cyl)

n = length(mtcars$mpg)
mean_x = mean(mtcars$mpg)
mean_y = mean(mtcars$cyl)
s_x = sd(mtcars$mpg)
s_y = sd(mtcars$cyl)
z_x = (mtcars$mpg - mean_x) / s_x
z_y = (mtcars$cyl - mean_y) / s_y
sum(z_x * z_y) / (n-1)

# 결측치가 포함된 상관관계
cor(mtcars$mpg, mtcars$cyl,
    method = 'spearman',
    use = 'complete.obs')

# 3차원 산점도
library(scatterplot3d)
iris$Species
iris_setosa = iris[iris$Species == 'setosa', ]
iris_versicolor = iris[iris$Species == 'versicolor', ]
iris_virginica = iris[iris$Species == 'virginica', ]
d3 = scatterplot3d(iris$Petal.Length,
                   iris$Sepal.Length,
                   iris$Sepal.Width, type = 'n')
d3$points3d(iris_setosa$Petal.Length,
            iris_setosa$Sepal.Length,
            iris_setosa$Sepal.Width,
            bg = 'orange', pch = 21)
d3$points3d(iris_versicolor$Petal.Length,
            iris_versicolor$Sepal.Length,
            iris_versicolor$Sepal.Width,
            bg = 'blue', pch = 23)
d3$points3d(iris_virginica$Petal.Length,
            iris_virginica$Sepal.Length,
            iris_virginica$Sepal.Width,
            bg = 'red', pch = 25)

str(trees)
scatterplot3d(trees, type = 'h', highlight.3d = T,
              angle = 55, scale.y = 0.8, pch = 1,
              main = '3차원 산점도 Trees')

exdata = c(17,12,4,7,11,5)
lab = c('한국','미국','일본','프랑스','영국')
library(plotrix)
pie3D(exdata, labels=lab, explode=0.05, cex=0.5,main='3D Pie 차트')
legend('bottom', legend = lab, cex = 0.9,
       fill = rainbow(length(exdata)))

# 화산자료 투사도
library(lattice)
wireframe(volcano, shade = T, aspect = c(61/87, 0.4),
          light.source = c(10,0,10))
wireframe(volcano, shade = T, aspect = c(61/87, 2),
          light.source = c(60,10,10))

# 산점도
library(ggplot2)
str(airquality)
# ggplot(airquality, aes(x=Day, y=Temp))
# ggplot(airquality, aes(x=Day, y=Temp)) + geom_point()
# ggplot(airquality, aes(x=Day, y=Temp)) + geom_point(size = 2, color = 'red')
ggplot(airquality, aes(x=Day, y=Temp)) + geom_line() + geom_point()

# 실린더 빈도수
ggplot(mtcars, aes(x=cyl)) + geom_bar(width = 0.5)
ggplot(mtcars, aes(x=factor(cyl))) + geom_bar(width = 0.5)
ggplot(mtcars, aes(x=factor(cyl))) + geom_bar(aes(fill = factor(gear)))

# 선버스트 차트
# 1. 평면 위의 위치를 각도로 거리를 사용하여 표시
# 2. 두 점 사이의 관계를 각이나 거리로 표현
# 3. 게층 구조 표현
ggplot(mtcars, aes(x=factor(cyl))) + # cyl를 x축 변수
  geom_bar(aes(fill = factor(gear))) + # cyl종류별 gear빈도
  coord_polar()
ggplot(mtcars, aes(x=factor(cyl))) +
  geom_bar(aes(fill = factor(gear))) +
  coord_polar(theta = 'y')
ggplot(airquality, aes(x=Day, y=Temp, group=Day)) +
  geom_boxplot()
ggplot(airquality, aes(x=Temp)) + geom_histogram(binwidth = 1)

# 구글 차트
library(googleVis)
mydf = data.frame(country=c('US','GB','BR'),
                  val1 = c(10,13,14),
                  val2 = c(20,23,12))
line = gvisLineChart(mydf)
plot(line)
line2 = gvisLineChart(mydf, 'country', c('val1','val2'),
                      option = list(
                        series='[{targetAxisIndex: 0},
                        {targetAxisIndex:1}]',
                        vAxes='[{title:"val1"}, {title:"val2"}]'
                      ))
plot(line2)
bar = gvisBarChart(mydf)
plot(bar)

column = gvisColumnChart(mydf)
plot(column)
