setwd("/home/kev/R/rdata")
library("stringr")
library("ggplot2")
library("dplyr")

crime <- read.csv("Comparative  monthly crime figures for the year 2013-2014-2015 (Page 13).csv",header = T,stringsAsFactors = F)
#str(crime)
#View(crime)

#remove the total column
crime <- crime[-13,]
View(crime)

#point and density graph for 2013
ggplot(crime, aes(x=MONTH,y=X2013,color=MONTH)) + 
  geom_point() + geom_density() +
  ylab("Year 2013") 

#point and density graph for 2014
ggplot(crime, aes(x=MONTH,y=X2014,color=MONTH)) + 
  geom_point() + geom_density() +
  ylab("Year 2014")

#point and density graph for 2015
ggplot(crime, aes(x=MONTH,y=X2015,color=MONTH)) + 
  geom_point() + geom_density() +
  ylab("Year 2015") 
