library(XML)
library(ggplot2)
# default info
req_addr = 'http://apis.data.go.kr/B552584/ArpltnInforInqireSvc/'
service_name = 'getMinuDustFrcstDspth'
key_enc = 'vAKxTImpUrXiOK2HkBp384EO9UhzKiVKj0FeXgJuELlBPKUszFsE1dSc86O78Hajl5Fj3C32LG3cym%2FpkjOntQ%3D%3D'
key_dec = 'vAKxTImpUrXiOK2HkBp384EO9UhzKiVKj0FeXgJuELlBPKUszFsE1dSc86O78Hajl5Fj3C32LG3cym/pkjOntQ=='
param_service = paste0('?serviceKey=',key_enc)
param_ret = '&returnType=' # xml, json
param_row = '&numOfRows='  # 100 (조회 날짜로 검색 시 사용 안함)
param_page = '&pageNo='  # 1 (조회 날짜로 검색 시 사용 안함)
param_date = '&searchDate='  #'2020-11-14' (조회 날짜 입력이 없을 경우 한달동안 예보통보 발령 날짜의 리스트 정보를 확인)
param_inform = '&InformCode='  #'PM10'
# variables
input_ret = 'xml'
input_row = 100
input_page = 1
input_date = '2021-05-20'
input_inform = 'PM10'

req_str = paste0(req_addr,
                 service_name,
                 param_service,
                 paste0(param_ret, input_ret),
                 paste0(param_row, input_row),
                 paste0(param_page, input_page),
                 paste0(param_date, input_date),
                 paste0(param_inform, input_inform))
xmlFile = xmlParse(req_str)
xmlRoot(xmlFile)
df = xmlToDataFrame(getNodeSet(xmlFile, "//items/item"))

ggplot(data = df, aes(x = dataTime, y = informCode)) +
  geom_bar(stat = "identity", fill = "green")

ggplot(data = df, aes(x = dataTime, y = informCode)) +
  geom_bar(stat = "identity", fill = "green") +
  # x축 눈금 라벨 90도 회전
  theme(axis.text.x = element_text(angle = 90)) +
  labs(title = "대기질 예보통보 조회", x = '통보날짜', y = '통보코드')

ggplot(data = df, aes(x = dataTime, y = informCode, fill = informCode)) +
  geom_bar(stat = "identity") +
  theme(axis.text.x = element_text(angle = 90)) +
  labs(title = "대기질 예보통보 조회", x = '통보날짜', y = '통보코드') +
  scale_fill_manual(values = rainbow(7))

ggplot(data = df, aes(x = dataTime, y = informCode, fill = informCode)) +
  geom_bar(stat = "identity") +
  theme(axis.text.x = element_text(angle = 90)) +
  labs(title = "대기질 예보통보 조회", x = '통보날짜', y = '통보코드') +
  scale_fill_manual(values = rainbow(7)) + 
  coord_flip()