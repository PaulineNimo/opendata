setwd("E:/Open Data/Crime Report")


library(tidyr)
library(dplyr)



cattle.rustling <- read.csv("Cattle rustling incidents year 2014 & 2015 (Page 5).csv",header=T,stringsAsFactors = FALSE)
cattle.rustling$DATE <- cattle.rustling$YEAR
cattle.rustling$DATE <- gsub("2014","12/31/2014",cattle.rustling$DATE)
cattle.rustling$DATE <- gsub("2015","12/31/2015",cattle.rustling$DATE)
write.csv(cattle.rustling,file="Cattle rustling 2014-2015.csv")
