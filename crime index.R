setwd("E:/Open Data/Crime Report")


library(tidyr)
library(dplyr)

crime.index <- read.csv("Crime index per 100,000 for the  year 2015 (Page 13).csv",header=T,stringsAsFactors = F)
crime.index$COUNTIES <- gsub("TRANSNZOIA","TRANS NZOIA",crime.index$COUNTIES)
crime.index$COUNTIES <- gsub("THARAKA","THARAKA NITHI",crime.index$COUNTIES)
crime.index <- crime.index[-grep("^TOTAL",crime.index$COUNTIES),]
write.csv(crime.index,file="Crime Index per 100,000.csv")
