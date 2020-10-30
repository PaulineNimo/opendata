setwd("E:/Open Data/Crime Report")


library(tidyr)
library(dplyr)



comparative.regional <- read.csv("Comparative regional crime figures for the years 2014 & 2015 (Page 12).csv",header=T,stringsAsFactors = F)
comparative.regional <- comparative.regional[,c(1,2,3,7)]
comparative.regional <- gather(comparative.regional,YEAR,CRIME.FIGURES,X2013:X2015,-REGION)
comparative.regional$YEAR <- gsub("X","",comparative.regional$YEAR)
comparative.regional$REGION <- gsub("RIFT","RIFT VALLEY",comparative.regional$REGION)
comparative.regional$REGION <- gsub("NEP","NORTH EASTERN",comparative.regional$REGION)
comparative.regional$REGION <- gsub("R/WAY","RAILWAY",comparative.regional$REGION)

comparative.regional$DATE <- comparative.regional$YEAR
comparative.regional$DATE <- gsub("2013","12/31/2013",comparative.regional$DATE)
comparative.regional$DATE <- gsub("2014","12/31/2014",comparative.regional$DATE)
comparative.regional$DATE <- gsub("2015","12/31/2015",comparative.regional$DATE)
comparative.regional <- comparative.regional[-grep("^TOTAL",comparative.regional$REGION),]

write.csv(comparative.regional,file="comparative regional crime figures 2013-2015.csv")
