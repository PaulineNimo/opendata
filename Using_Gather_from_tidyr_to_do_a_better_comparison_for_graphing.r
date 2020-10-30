setwd("/home/kev/R/rdata")
library(ggplot2)
library(dplyr)
library(tidyr)

crime <- read.csv("crime/Comparative  monthly crime figures for the year 2013-2014-2015 (Page 13).csv")
#str(crime)

#remove the total column
crime <- crime[-13,]
View(crime)

#stack the 3 year columns and have a single column for crimes for the year
crime <- gather(crime, year, no_of_crimes, X2013:X2015)
View(crime)

#point and line graph on the data
ggplot(crime, aes(x=MONTH,y=no_of_crimes,group=year,color=year,fill=year),alpha = 0.3) + 
  geom_line() + geom_point() +
  ylab("Year") 
