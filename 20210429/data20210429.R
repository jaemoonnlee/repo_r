# read csv
data.csv = read.csv('res\\data_ex.csv')
# read excel
library(readxl)
data.excel = read_excel('res\\data_ex.xlsx')

View(data.csv)
View(data.excel)

studentx <- read.xlsx(file.choose(), sheetIndex = 1, encoding = 'utf-8')
View(studentx)