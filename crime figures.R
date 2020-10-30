setwd("E:/Open Data/Crime Report")


library(tidyr)
library(dplyr)
library(ggplot2)


crime.figures <- read.csv("Crime figures for the years 2013-2014-2015 (Page 11).csv",header = T,stringsAsFactors = F)
crime.figures <- crime.figures[,c(1,2,3,7)]
crime.figures <- gather(crime.figures,YEAR,CRIME.FIGURES,X2013:X2015,-OFFENCES)
crime.figures$YEAR <- gsub("X","",crime.figures$YEAR)
crime.figures$DATE <- crime.figures$YEAR
crime.figures$DATE <- gsub("2013","12/31/2013",crime.figures$DATE)
crime.figures$DATE <- gsub("2014","12/31/2014",crime.figures$DATE)
crime.figures$DATE <- gsub("2015","12/31/2015",crime.figures$DATE)
crime.figures <- crime.figures[-grep("^TOTAL",crime.figures$OFFENCES),]

write.csv(crime.figures,file="crime figures 2013-2015.csv")


#Analysis




#visualisation
ggplot(crime.figures,aes(x = OFFENCES, y = CRIME.FIGURES))+
	geom_point(aes(color = YEAR))+
	theme(axis.text.x = element_text(angle = 45, hjust = 1))+
	ggtitle("Kenyan Crime Figures")

y.2013 <- filter(crime.figures,YEAR == "2013")
ggplot(y.2013,aes(x = CRIME.FIGURES))+
	geom_bar(aes(fill = OFFENCES))+
	coord_polar()

