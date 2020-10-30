setwd("E:/Open Data/Crime Report")


library(tidyr)
library(dplyr)

comparative.monthly <- read.csv("Comparative  monthly crime figures for the year 2013-2014-2015 (Page 13).csv",header = T,stringsAsFactors = F)
comparative.monthly <- gather(comparative.monthly,YEAR,CRIME.FIGURES,X2013:X2015,-MONTH)
comparative.monthly$YEAR <- gsub("X","",comparative.monthly$YEAR)
#short <- c("JAN","FEB","MAR","APR","MAY","JUN","JUL","AUG","SEP","OCT","NOV","DEC")
#full <- c("JANUARY","FEBRUARY","MARCH","APRIL","MAY","JUNE","JULY","AUGUST","SEPTEMBER","OCTOBER","NOVEMBER","DECEMBER")
#comparative.monthly$MONTH <- mapply(gsub,short,full,comparative.monthly$MONTH)

comparative.monthly$MONTH <- gsub("JAN","JANUARY",comparative.monthly$MONTH)
comparative.monthly$MONTH <- gsub("FEB","FEBRUARY",comparative.monthly$MONTH)
comparative.monthly$MONTH <- gsub("MAR","MARCH",comparative.monthly$MONTH)
comparative.monthly$MONTH <- gsub("APR","APRIL",comparative.monthly$MONTH)
comparative.monthly$MONTH <- gsub("JUN","JUNE",comparative.monthly$MONTH)
comparative.monthly$MONTH <- gsub("JUL","JULY",comparative.monthly$MONTH)
comparative.monthly$MONTH <- gsub("AUG","AUGUST",comparative.monthly$MONTH)
comparative.monthly$MONTH <- gsub("SEP","SEPTEMBER",comparative.monthly$MONTH)
comparative.monthly$MONTH <- gsub("OCT","OCTOBER",comparative.monthly$MONTH)
comparative.monthly$MONTH <- gsub("NOV","NOVEMBER",comparative.monthly$MONTH)
comparative.monthly$MONTH <- gsub("DEC","DECEMBER",comparative.monthly$MONTH)

comparative.monthly$DATE <- comparative.monthly$YEAR
comparative.monthly$DATE <- gsub("2013","12/31/2013",comparative.monthly$DATE)
comparative.monthly$DATE <- gsub("2014","12/31/2014",comparative.monthly$DATE)
comparative.monthly$DATE <- gsub("2015","12/31/2015",comparative.monthly$DATE)
comparative.monthly <- comparative.monthly[,c(1,2,4,3)]
comparative.monthly <- comparative.monthly[-grep("^TOTAL",comparative.monthly$MONTH),]
write.csv(comparative.monthly,file="comparative monthly crime figures 2013-2015.csv")
