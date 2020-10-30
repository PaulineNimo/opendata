setwd("E:/Open Data/Crime Report")


library(tidyr)
library(dplyr)

offences <- read.csv("Offences per county  for  the year 2015 (Page 15 & 16).csv",header = T,stringsAsFactors = F)
offences$COUNTIES <- gsub("T/NZOIA","TRANS NZOIA",offences$COUNTIES)
offences$COUNTIES <- gsub("U/GISHU","UASIN GISHU",offences$COUNTIES)
offences$COUNTIES <- gsub("T/TAVETA","TAITA TAVETA",offences$COUNTIES)
offences$COUNTIES <- gsub("W/POKOT","WEST POKOT",offences$COUNTIES)
offences$COUNTIES <- gsub("T/RIVER","TANA RIVER",offences$COUNTIES)
offences$COUNTIES <- gsub("THARAKA","THARAKA NITHI",offences$COUNTIES)
offences$COUNTIES <- gsub("E/MARAKWET","ELGEYO MARAKWET",offences$COUNTIES)
offences$COUNTIES <- gsub("RAILAYS","RAILWAYS",offences$COUNTIES)
offences <- offences %>% 
	gather(OFFENCES,NO.OF.OFFENCES,HOMICIDE:GRAND.TOTAL,-COUNTIES)
offences$YEAR <- "2015"
offences$DATE <- "12/31/2015"
offences <- offences[-grep("^TOTAL",offences$COUNTIES),]
offences <- offences[-grep("^GRAND",offences$OFFENCES),]
offences$OFFENCES <- gsub("\\."," ",offences$OFFENCES)
write.csv(offences,file = "Offences per county for 2015.csv")


library(ggplot2)
#kiambu
kiambu <- filter(offences, COUNTIES == "KIAMBU")
ggplot(kiambu,aes(x = OFFENCES, y = NO.OF.OFFENCES))+
	geom_point(color = "blue")+
	theme(axis.text.x = element_text(angle = 45, hjust = 1))+
	ggtitle("Kiambu Crimes")

ggplot(kiambu)	


