# run a single line: ctrl + enter
# run whole line: ctrl + alt + R
# run until current row: ctrl + alt + B
# run after current row: ctrl + alt + E
n = 100
n <- 90
# <<- means 'static' declare
n <<- 80
cat(n)
print(n)
n
sprintf('점수: %d', n)
cat('점수: ',n)

x <- 10
y <- 2
z <- x * y
cat('x * y = ',z)

tf <- F
cat(tf)

4/3
#몫 %/%
5%/%3
#나머지 %%
5%%3
2^3

cat('숫자를 입력하세요.')
num <- scan()
cat(num)
class(num)
# R array index start with 1
cat(num[1])
cat(num[2])

cat('문자열을 입력하세요.')
str <- scan(what='')

df <- data.frame()
df <- edit(df)
df


x <- 8
# condition
if(x > 0 && x < 10) {
  cat('1~10 사이의 숫자입니다.')
} else {
  cat('1~10 사이의 숫자가 아닙니다.')
}

# %in% 문자열 검색?
data <- c('홍길동', '이길동', '김길동', '박길동')
if('박길동' %in% data){
  cat('박길동이 존재합니다.')
} else {
  cat('박길동이 없습니다.')
}

# for in loop
for(d in data){
  cat(d, '\n')
}

# while loop
i <- 0
while (i < 5){
  i <- i + 1
  cat(i,'\n')
}

#
sum <-0
for(i in 1:10){
  if(i%%2==0){
    next
  }
  if(i==7){
    break
  }
  sum <- sum + i
}
cat(sum)

# sequance
index <- seq(1, 10, by=3)
for (i in index){
  cat(i,'\n')
}

# function
func1 <- function(start, end){
  sum <-0
  for(i in start:end){
    sum<-sum+i
  }
  return(sum)
}

func1(1,100)

func2 <- function(num1,num2,op){
  if(op == '+'){
    return(num1 + num2)
  } else if(op == '-'){
    if(num1 > num2){
      return(num1 - num2)
    } else {
      return(num2 - num1)
    }
  }
}

func2_2 <- function(num1, num2, op){
  return(num1 - num2)
}

func2_1 <- function(...){
  res <- func2(...)
  val <- func2_2(...)
  return(res + val)
}

func2_1(10,5,'+')

func_var <- function(...) {
  var <- c(...)
  for(i in var){
    cat(i, '\t')
  }
}

func_var(1,2)
func_var(1,2,3)
func_var(1,2,3,4)

add_x <- function(x) {
  cat('x =',x,'\n')
  function(y){
    cat('y =',y,'\n')
    return(x+y)
  }
}
addx <- add_x(3)
addx(4)