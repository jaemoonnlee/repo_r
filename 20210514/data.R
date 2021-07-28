library(googleVis)
# gvisGauge()
gauge = gvisGauge(CityPopularity, labelvar = 'city',
                  numvar = 'Plpularity', options = list(min = 0, max = 1000))
# plot(gauge)
# CityPopularity
gauge2 = gvisGauge(CityPopularity,
                   options = list(min = 0, max = 1000,
                                  greenFrom = 800, greenTo = 1000,
                                  yellowFrom = 500, yellowTo = 800,
                                  redFrom = 0, redTo = 500,
                                  width = 400, height = 300))
# plot(gauge2)

# gvisGeoChart()
g1a = gvisGeoChart(Exports,
                   locationvar = 'Country',
                   colorvar = 'Profit')
# plot(g1a)
g1a2 = gvisGeoChart(Exports,
                   locationvar = 'Country',
                   colorvar = 'Profit',
                   options = list(projection = 'kavrayskiy-vii'))
# plot(g1a2)
g2b = gvisGeoChart(Exports,
                   'Country',
                   'Profit',
                   options = list(region = '150'))
# plot(g2b)
city = c('Seoul', 'Daegu', 'Busan', 'Gwangju')
val = c(12,8,10,6)
kor = data.frame(city, val)
g3b = gvisGeoChart(kor,
                   'city', 'val',
                   options = list(region = 'KR',
                                  displayMode = 'regions',
                                  resolution = 'provinces',
                                  width = 600,
                                  height = 400))
# plot(g3b)

library(datasets)
states = data.frame(state.name, state.x77)
gStates = gvisGeoChart(states, 'state.name', 'Illiteracy',
                       options=list(region='US',
                                    displayMode = 'regions',
                                    resolution = 'provinces'))
# plot(gStates)
library(readxl)
eq = read.csv('http://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/2.5_week.csv')
eq$loc = paste(eq$latitude, eq$longitude, sep=':')
head(eq$loc)
g3 = gvisGeoChart(eq, 'loc', 'depth', 'mag',
                  options = list(gvis.editor='Edit',
                                 width=1024, height=768,
                                 displayMode='Markers',
                                 colorAxis='{color:["purple","red","orange","gray"]}',
                                 backgroundColor='lightblue',
                                 charid='EQ'))
plot(g3)

