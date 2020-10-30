setwd("E:/Open Data/Crime Report")


library(tidyr)
library(dplyr)
library(stringr)

seizure.smuggled <- read.csv("Seizure of smuggled contraband goods in the  year 2015 (Page 7 & 8).csv",header = T,stringsAsFactors = F)
seizure.smuggled[11,2] <- str_c(seizure.smuggled[11,2],seizure.smuggled[12,2],sep="\n")
seizure.smuggled <- na.omit(seizure.smuggled)

seizure.smuggled$QUANTITY.SEIZED <- strsplit(seizure.smuggled$QUANTITY.SEIZED,"\n")
seizure.smuggled <- seizure.smuggled %>%
	unnest(QUANTITY.SEIZED)
seizure.smuggled$QUANTITY.SEIZED[14] <- gsub("([0-9])([A-Z])","\\1 \\2",seizure.smuggled$QUANTITY.SEIZED[14])

seizure.smuggled <- seizure.smuggled %>% 
	separate(QUANTITY.SEIZED,into = c("QUANTITY SEIZED","PACKAGING"),sep = "\\s",extra = "merge")

seizure.smuggled$PACKAGING <- gsub("(^[[:alpha:]])", "\\U\\1",seizure.smuggled$PACKAGING, perl=TRUE)

seizure.smuggled$YEAR <- "2015"
seizure.smuggled$DATE <- seizure.smuggled$YEAR
seizure.smuggled$DATE <- gsub("2015","12/31/2015",seizure.smuggled$DATE)

write.csv(seizure.smuggled,file = "seizure of smuggled contraband goods in 2015.csv")
