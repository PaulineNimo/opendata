setwd("E:/Open Data/Data Science")

library(data.table)
library(dplyr)
library(ggplot2)
library(dtplyr)
### Get the data ###

data = fread("loan book_updated.csv")
names(data)

tokeep = c("LDATE_DATE", "CATEGORY", "YREND", "ACCOUNTSTATUS", "MATDATE_DATE", "NADJMONTHSGONEBY", "NADJPENALTYTOTAL",  "LOAN" , "CURRENTBAL", "LASTEMPCODE", "LASTPAYDATE_DATE", "STARTPAY_DATE", "BILLRATE", "BILLEXPDATE_DATE", "CUMLCHARGE" , "INTRATE", "YRSTART", "REGNO", "ACCINT", "INSURANCE", "DATEBIRTH_DATE", "UNCODE", "TOTAINDPAID", "COUNTEDINSTALS",  "TOTAINDPAID", "OVERDUEDAYS" , "OVERDUEBALANCE", "EMPLOYER", "PENPAID")

datax = data[,tokeep, with=FALSE]
datas = data.frame(table(datax[,UNCODE]))
datas = datas[order(datas$Freq, decreasing = TRUE),]


#get the top 8 universities
topunis = as.character(datas[1:10,"Var1"])

#Split the university code 
splitter = function(name){
  d = as.character(name)
  d = strsplit(d,"/")[[1]][1]
  d = strsplit(d, "-")[[1]][1]
  d
}


#the data
datax = datax %>% filter(ACCOUNTSTATUS %in% c("CLEARED", "OK") & UNCODE %in% topunis) %>% mutate(CCODE = lapply(REGNO,splitter))

dx = data.frame(prop.table(table(datax$UNCODE, datax$ACCOUNTSTATUS )))
names(dx) = c("university", "lstatus", "percentage")

dx2 = dx %>% group_by(university) %>% summarise(total = sum(percentage))

library(scales)
ggplot(dx,aes(university, percentage, fill=lstatus)) + geom_bar(stat="identity", position="fill") + scale_y_continuous(labels = percent_format()) + coord_flip()

## Top Courses with Default

topcodes = data.frame(table(as.character(datax$CCODE)))
topcodes = topcodes[order(topcodes$Freq, decreasing = TRUE),]

top100 = topcodes[1:100,]


codes = read.csv("./loan files/course codes helb.csv", stringsAsFactors = FALSE)
codes$CCODEUN = paste0(codes$course.code,codes$university.code)

codesx = merge(top100, codes, by.x="Var1", by.y="course.code")
######### merge datax #####3
datax$CCODE = as.character(datax$CCODE)
datax$CCODEUN = paste0(datax$CCODE,datax$UNCODE)

fdata = merge(as.data.frame(datax),codesx,by = "CCODEUN")
