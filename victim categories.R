setwd("E:/Open Data/Crime Report")


library(tidyr)
library(dplyr)

accidents <- read.csv("Accidents reported, Victims per category & Classes of victims (Page 9).csv",header=F,stringsAsFactors = F)

victims <- accidents[7:12,1:3]
victims[2,] <- c("VICTIMS.CATEGORY","X2014","X2015")
victims[1,] <- NA
victims <- na.omit(victims)
colnames(victims) <- victims[1,]
victims <- victims[-1,]
victims <- gather(victims,YEAR,NO.OF.VICTIMS,X2014:X2015,-VICTIMS.CATEGORY)
victims$YEAR <- gsub("X","",victims$YEAR)
victims$DATE <- victims$YEAR
victims$DATE <- gsub("2014","12/31/2014",victims$DATE)
victims$DATE <- gsub("2015","12/31/2015",victims$DATE)
victims <- victims[,c(1,2,4,3)]
victims <- victims[-grep("^TOTAL",victims$VICTIMS.CATEGORY),]
write.csv(victims,file="accident victims per category 2014-2015.csv")
