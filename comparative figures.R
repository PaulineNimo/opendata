setwd("E:/Open Data/Crime Report")


library(tidyr)
library(dplyr)

comparative.figures <- read.csv("Four year comparative figures 2012-2013-2014-2015 (Page 17,18 & 19).csv",header=T,stringsAsFactors = F)
comparative.figures <- comparative.figures[,c(1,2,3,4,8,12)]

