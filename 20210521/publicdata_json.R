library(jsonlite)
library(ggplot2)
# default info
req_addr = 'https://api.odcloud.kr/api/15067156/v1/'
service_name = 'uddi:4f293dcb-a55b-4f64-b7d1-dab5b0ba56bb'
key_enc = 'vAKxTImpUrXiOK2HkBp384EO9UhzKiVKj0FeXgJuELlBPKUszFsE1dSc86O78Hajl5Fj3C32LG3cym%2FpkjOntQ%3D%3D'
key_dec = 'vAKxTImpUrXiOK2HkBp384EO9UhzKiVKj0FeXgJuELlBPKUszFsE1dSc86O78Hajl5Fj3C32LG3cym/pkjOntQ=='
param_service = paste0('?serviceKey=', key_enc)
param_row = '&perPage='
param_page = '&page='
# variables
input_ret = 'json'
input_row = 10000
input_page = 1

req_str = paste0(req_addr,
                 service_name,
                 param_service,
                 paste0(param_row, input_row),
                 paste0(param_page, input_page))
# cat(req_str)
jsonData = fromJSON(req_str)
# str(jsonData)
df = data.frame(jsonData$data)
df$일자 = as.Date(df$일자)
df$사용횟수 = as.numeric(df$사용횟수)

# 2019년도 데이터
df_arranged = df[df$일자>='2019-01-01' & df$일자<='2019-12-31',]
# 2019년 이전 데이터
df_arranged = df[df$일자<'2019-01-01',]
ggplot(data = df_arranged, aes(x = 일자, y = 사용횟수, fill = 충전소ID)) +
  geom_bar(stat = "identity") +
  theme(axis.text.x = element_text(angle = 90)) +
  labs(title = '[대구]날짜별 각 충전소 사용 횟수', x = '월', y = '사용횟수') +
  scale_fill_manual(values = rainbow(30))
