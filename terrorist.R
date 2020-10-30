setwd("E:/Open Data/Crime Report")


library(tidyr)
library(dplyr)


terrorist <- read.csv("Terrorist related incidents in the year 2013, 2014 and 2015 (Page 3).csv",header = T,stringsAsFactors = F)
terrorist$DATE <- terrorist$YEAR
terrorist$DATE <- gsub("2013","12/31/2013",terrorist$DATE)
terrorist$DATE <- gsub("2014","12/31/2014",terrorist$DATE)
terrorist$DATE <- gsub("2015","12/31/2015",terrorist$DATE)
write.csv(terrorist,file = "terrorist related incidents 2013-2015.csv")
