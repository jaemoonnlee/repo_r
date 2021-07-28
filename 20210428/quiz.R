# 1. 'R'문자가 5회 반복 처리되는 벡터 *rep() 사용
temp1 <- c(rep('R', times=5)) # rep('R', 5)

# 2. 1~10까지 3간격으로 연속되는 벡터
temp2 <- c(seq(1, 10, by=3)) # seq(1, 10, 3)

# 3. 1~10까지 3간격으로 연속된 정수가 3회 반복
temp3 <- c(rep(temp2, each=3)) # 1 1 1 4 4 4 7 7 7 10 10 10
temp3 <- rep(temp2, 3) # 1 4 7 10 1 4 7 10 1 4 7 10

# 4. 2번, 3번이 모두 포함되는 벡터
temp4 <- c(temp2, temp3)

# 5. 4번에서 홀수번째 값들만 저장하는 벡터
temp5 <- temp4[seq(from=1, to=length(temp4), by=2)]
