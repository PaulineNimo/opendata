setwd("E:/Open Data/Crime Report")


library(tidyr)
library(dplyr)


accidents <- read.csv("Accidents reported, Victims per category & Classes of victims (Page 9).csv",header=F,stringsAsFactors = F)

classes.victims <- accidents[13:22,]
classes.victims <- classes.victims[,-4]
classes.victims[3,1] <- "VICTIM.CLASS"
no.2014 <- classes.victims[3:10,1:4]
colnames(no.2014) <- no.2014[1,]
no.2014 <- no.2014[-1,]
no.2014 <- gather(no.2014,CATEGORY,NO.OF.VICTIMS,FATAL:SLIGHT,-VICTIM.CLASS)
no.2014$YEAR <- 2014
no.2015 <- classes.victims[3:10,c(1,5:7)]
colnames(no.2015) <- no.2015[1,]
no.2015 <- no.2015[-1,]
no.2015 <- gather(no.2015,CATEGORY,NO.OF.VICTIMS,FATAL:SLIGHT,-VICTIM.CLASS)
no.2015$YEAR <- 2015
category.victims <- rbind(no.2014,no.2015)
category.victims$DATE <- category.victims$YEAR
category.victims$DATE <- gsub("2014","12/31/2014",category.victims$DATE)
category.victims$DATE <- gsub("2015","12/31/2015",category.victims$DATE)
category.victims$VICTIM.CLASS <- gsub("PED","PEDESTRIAN",category.victims$VICTIM.CLASS)
category.victims$VICTIM.CLASS <- gsub("DRIV","DRIVER",category.victims$VICTIM.CLASS)
category.victims$VICTIM.CLASS <- gsub("^PASS","PASSENGER",category.victims$VICTIM.CLASS)
category.victims$VICTIM.CLASS <- gsub("^P/PASS","PRIVATE PASSENGER",category.victims$VICTIM.CLASS)
category.victims$VICTIM.CLASS <- gsub("P/CYC","PRIVATE CYCLIST",category.victims$VICTIM.CLASS)
category.victims$VICTIM.CLASS <- gsub("M/CYC","MOTORCYCLIST",category.victims$VICTIM.CLASS)
category.victims <- category.victims[-grep("^TOTAL",category.victims$VICTIM.CLASS),]

write.csv(category.victims,file = "classes of victims 2014-2015.csv")
