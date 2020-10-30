setwd("E:/Open Data/Crime Report")


library(tidyr)
library(dplyr)


firearms <- read.csv("Firearms-ammunition recovered-surrendered in Kenya in 2014 & 2015 (Page 6).csv",header = F,stringsAsFactors = F)
firearms1 <- t(firearms)
firearms1 <- as.data.frame(firearms1,row.names = NULL,stringsAsFactors = F)
colnames(firearms1) <- c("ACTIVITY","YEAR","NUMBER.RECOVERED/SURRENDERED")
firearms1 <- firearms1 %>%
	fill(ACTIVITY,.direction = "down")


firearms1$DATE <- firearms1$YEAR
firearms1$DATE <- gsub("2014","12/31/2014",firearms1$DATE)
firearms1$DATE <- gsub("2015","12/31/2015",firearms1$DATE)
firearms1$ACTIVITY <- gsub("\n"," ",firearms1$ACTIVITY)

write.csv(firearms1,file="firearms-ammunition recovered-surrendered 2014-2015.csv")



#firearms1 <- firearms %>%
#gather(`ACTIVITY`,`NUMBER_RECOVERED/SURRENDERED`,RECOVERED..FIREARMS:X.3)
#firearms1$`NUMBER_RECOVERED/SURRENDERED` <- as.character(firearms1$`NUMBER_RECOVERED/SURRENDERED`)
#firearms1 <- separate(firearms1,col = YEAR,into = c("YEAR","NUMBER.RECOVERED/SURRENDERED"),sep = "(^2014)|(^2015)")
#firearms1 <- firearms1 %>%
#extract_(firearms1$`NUMBER_RECOVERED/SURRENDERED`,into = "YEAR",regex = "^2014|^2015")

