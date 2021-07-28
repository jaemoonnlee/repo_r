# # airquality 에서 특정 달의 날짜와 온도 정보를 추출하여
# # 온도 >= 75인 정보만 gauge 차트 출력.
# # 온도 범위 0 ~ 100
# # 색상 범위 25%(yellow) 50%(green) 75%(red)
# library(googleVis)
# dt = airquality[airquality$Month==5,]
# dt$Day = paste('Day',as.character(dt$Day))
# dt2 = dt[dt$Temp>=75, c('Day', 'Temp')]
# gg = gvisGauge(dt2,
#                labelvar = 'Day',
#                numvar = 'Temp',
#                options = list(min = 0, max = 100,
#                               yellowFrom = 25, yellowTo = 50,
#                               greenFrom = 50, greenTo = 75,
#                               redFrom = 75, redTo = 100,
#                               width = 800, height = 400))
# plot(gg)


# data.go.kr에서 임의의 정보를 추출하여 gvisGeoChart() 출력
## 공공데이터 정보
serviceURL = 'https://api.odcloud.kr/api/15067156/v1/'
operation = 'uddi:4f293dcb-a55b-4f64-b7d1-dab5b0ba56bb'
serviceKey = 'API서비스키'

page = 1
perPage = 10
url_XML = paste0(serviceURL, operation,
                 paste0("?page=",page),
                 paste0("&perPage=",perPage),
                 paste("&returnType=XML"),
                 paste0("&serviceKey=",serviceKey))
cat(url_XML)
# url_JSON = paste0(serviceURL, operation,
#                   paste0("?page=",page),
#                   paste0("&perPage=",perPage),
#                   paste0("&serviceKey=",serviceKey))

## XML
library(XML)
library(RCurl)##

temp_xml = getForm(url_XML, query="")
xmlDoc = xmlTreeParse(temp_xml,
                      useInternalNodes = T, 
                      encoding = 'UTF-8')
rootNode = xmlRoot(xmlDoc)
# rootNode
items = getNodeSet(rootNode, '//item')
xmlData = xmlToDataFrame(items)
numOfRows = as.numeric(xpathSApply(rootNode, "//currentCount", xmlValue))
totalCount = as.numeric(xpathSApply(rootNode, "//totalCount", xmlValue))
loopCount = round(totalCount / numOfRows, 0)
if(loopCount * numOfRows < totalCount) {
  loopCount = loopCount + 1
}
totalData = data.frame()

## for(i in 1:loopCount){
# for(i in 1:5){
#   url = paste0(serviceURL, operation,
#                paste0("?page=",page),
#                paste0("&perPage=",i),
#                paste0("&returnType=XML"),
#                paste0("&serviceKey=",serviceKey))
#   temp_xml = getForm(url, query="")
#   doc = xmlTreeParse(temp_xml, useInternalNodes = T, encoding = 'UTF-8')
#   rootNode = xmlRoot(doc)
#   xmlData = xmlToDataFrame(nodes = getNodeSet(rootNode, '//item'))
#   totalData = rbind(totalData, xmlData)
# }
View(totalData)




# # ds = read.csv('Daegu_air_20200618.csv')
# # str(ds)
# # test = gvisGeoChart(ds, '날짜', '오존',
# #                     options = list(displayMode = 'Markers',
# #                                    region = 'KR'))
# # plot(test)
# 
# library(devtools)
# library(ggmap)
# apikey='서비스키'
# register_google(apikey)
# ggDaegu = get_googlemap('daegu', maptype = 'hybrid')
# plot(ggDaegu)
