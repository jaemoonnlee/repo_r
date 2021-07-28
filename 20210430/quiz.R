# 1. 동전 앞면과 뒷면에 대한 확률 함수 구현
# 랜덤 생성 runif(count, min, max): return numerics(include?)
getPercentage = function(n) {
  return(runif(n, 0,1))
}

# 2. 동전 20회 던졌을 때, 앞&뒤(앞:1, 뒤:0) 출력
tossCoin = function(count) {
  # Head: 1, Tail: 0
  r = getPercentage(count)
  # numeric object
  result = numeric()
  for(i in 1:count){
    if(r[i] > 0.5){
      result[i] = 1;
    } else {
      result[i] = 0;
    }
  }
  return(result)
}
cat(tossCoin(20))

# 3. 몬테-카를로 시뮬레이션
monteTest = function(n){
  cnt = 0
  for(i in 1:n){
    cnt = cnt + tossCoin(1)
  }
  result = cnt / n
  return(result)
}
monteGraph = function(count){
  # init value
  accumulator = tossCoin(1)
  initData = data.frame(1,accumulator)
  names(initData) = c('시행횟수', '평균값')
  # loop
  for(n in 2:count){
    accumulator = accumulator + tossCoin(1)
    temp = c(n,accumulator/n)
    names(temp) = c('시행횟수', '평균값')
    # merge
    initData = rbind(initData, temp)
  }
  return(initData)
}
monteBarGraph = function(count){
  # Head, Tail
  h = 0;
  t = 0;
  for(i in 1:count){
    if(tossCoin(1)==1){
      h = h + 1;
    } else {
      t = t + 1;
    }
  }
  ret = c(h,t)
  # names(ret) = c(Head.Count,Tail.Count)
  names(ret) = c(ret[1],ret[2])
  return(ret)
}
monteTest(100000)
res = monteGraph(10000)
plot(res, ylim=c(0,1))

resBar = monteBarGraph(10000)
barplot(resBar,                               # data
        density = 25,                         # bar density(default=NULL)
        border = NA,                          # bar border(values: color, NA, TRUE)
        # xlab = 'default',                     # name x axis
        # ylab = 'default',                     # name y axis
        col = c('red', 'green'),              # bar color
        main = 'Toss a coin 10k times',       # main title
        # sub = "... idk what it is...",        # sub title
        space = 0.2,                          # space within each bar
        ylim = c(0,6000),                     # determine max limit for y axis
        axisnames = T,                        # show X name(default=TRUE)
        cex.names = 2,                        # size of X-bar's Name
        legend.text = c('Head','Tail'),       # display what each bar means
        args.legend = list(x = "topleft"))    # set location
