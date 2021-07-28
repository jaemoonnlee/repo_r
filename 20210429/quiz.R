library(stringr)
# 연습문제
# 1.  "2021-04-29 수입3000원",
#     "2021-04-30 수입4500원",
#     "2021-05-01 수입5500원"
# 위 문자열을 이용하여 아래와 같이 출력
# 출력 형태: "3000원" "4500원" "5500원"
str1 = c("2021-04-29 수입3000원","2021-04-30 수입4500원","2021-05-01 수입5500원")
idx1 = str_locate(str1, '수입')
ans1 = str_sub(str1, idx1[length(str1) + 1] + 1)
ans1

# 2. 1번에서 '-'를 '/'로 변경
ans2 = str_replace_all(str1, '-', '/')
ans2

# 3. 임의의 국어, 영어, 수학점수를 갖는 벡터 3개 생성
# ex) kor <- c(90, 85, 95)
kor = sample(0:100, 3, replace = T, prob = NULL)
eng = sample(0:100, 3, replace = T, prob = NULL)
mth = sample(0:100, 3, replace = T, prob = NULL)

# 4. 3번 벡터를 갖는 data.frame 생성
ans4 = data.frame(kor, eng, mth)
ans4

# 5. 국, 영, 수 data.frame에서 최대값 구하기
# apply(object, 1, max): 가로방향
# apply(object, 2, max): 세로방향
max1 = apply(ans4, 1, max) # row max
max2 = apply(ans4, 2, max) # column max
max1
max2