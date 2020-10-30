setwd("E:/Open Data/Crime Report")


library(tidyr)
library(dplyr)

seizure.drugs <- read.csv("Seizure of drugs trafficked in the year  2015 (Page 6).csv",header = T,stringsAsFactors = F)
seizure.drugs <- seizure.drugs[-grep("^TOTAL",seizure.drugs$TYPE.OF.DRUG),]
write.csv(seizure.drugs,file = "seizure of drugs trafficked in 2015.csv")
