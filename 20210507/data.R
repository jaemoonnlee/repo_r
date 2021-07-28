# dplyr
#--------------------------------------------------------------
#  1. filter()        조건에 맞는 행 추출
#  2. arrange()       지정한 열을 기준으로 정렬
#  3. select()        열 추출
#  4. mutate()        열 추가
#  5. summarise()     데이터 요약
#  6. distinct()      중복 값 제거
#  7. group_by()      데이터 그룹 생성
#  8. sample_n()      n개의 샘플 추출
#  9. sample_frac()   n% 비율의 샘플 추출
# 10. %>%             함수 연결
library(dplyr)
# mtcars
nrow(mtcars)
names(mtcars)

filter(mtcars, cyl==4)
filter(mtcars, cyl>=6 & mpg > 20)
arrange(mtcars, wt, desc(hp)) # asc(wt) and desc(hp)
select(mtcars, am, gear)
select(mtcars, mpg, cyl, carb)
# mutate(mtcars, years='1974')
distinct(mtcars, cyl)
distinct(mtcars, cyl, gear)
summarise(mtcars, 
          cyl_mean = mean(cyl),
          cyl_min = min(cyl),
          cyl_max = max(cyl))
summarise(mtcars,
          mean(cyl),
          min(cyl),
          max(cyl))
gr_cyl = group_by(mtcars, cyl)
summarise(gr_cyl, n()) # cyl별 개수 요약 정보
summarise(gr_cyl, n_distinct(gear)) # cyl별 개수 요약 정보(gear 중복값 제외)
sample_n(mtcars, 10) # pick some(n) from table randomly
sample_frac(mtcars, 0.25) # pick some percent from table randomly

# cyl 별로 묶고, 개수로 요약
group_by(mtcars, cyl) %>% summarise(Count = n())

# two ways that makes a rank column
# 1.
mp_rank = mutate(mtcars, mpg_rank = rank(mpg))
arrange(mp_rank, mpg_rank)
# 2.
mutate(mtcars, mpg_rank=rank(mpg)) %>% arrange(mpg_rank)