setwd("E:/Open Data/Crime Report")


library(tidyr)
library(dplyr)



accidents <- read.csv("Accidents reported, Victims per category & Classes of victims (Page 9).csv",header=F,stringsAsFactors = F)
no.accidents <- accidents[1:6,1:3]
no.accidents[2,] <- c("ACCIDENT.REPORTED","X2014","X2015")
no.accidents[1,] <- NA
no.accidents <- na.omit(no.accidents)
colnames(no.accidents) <- no.accidents[1,]
no.accidents <- no.accidents[-1,]
no.accidents <- gather(no.accidents,YEAR,NO.OF.ACCIDENTS,X2014:X2015,-ACCIDENT.REPORTED)
no.accidents$YEAR <- gsub("X","",no.accidents$YEAR)
no.accidents$DATE <- no.accidents$YEAR
no.accidents$DATE <- gsub("2014","12/31/2014",no.accidents$DATE)
no.accidents$DATE <- gsub("2015","12/31/2015",no.accidents$DATE)
no.accidents <- no.accidents[,c(1,2,4,3)]
no.accidents <- no.accidents[-grep("^TOTAL",no.accidents$ACCIDENT.REPORTED),]
write.csv(no.accidents,file="accidents reported 2014-2015.csv")

accidents<-dplyr::full_join(victims,reported,by=NULL)
accidents<-tidyr::unite(accidents,"ACC_TYPE",c(VICTIMS.CATEGORY,VICTIMS.CATEGORY))

