setwd("E:/Open Data/New Folder")

library(tidyr)

data <- read.csv("County_Data_Sheet_Indicators_2005___2009.csv")
data2 <- unite(data,New,Year:Indicator,sep = " ")
data3 <- spread(data2,New,Value)
write.csv(data3, file = "Updated County_Data_Sheet_Indicators_2005___2009.csv")


data4 <- read.csv("1999-2013_National_Natural_Disaster_Inventory.csv")
data4 <- data4[-1,]
data5 <- spread(data4,ï..EventÂ.,ï..EventÂ.)

data6 <- read.table("Distribution_of_Pasha_Centers_in_Kenya__2016_Update_ (1).csv",sep = "\t")


data9 <- read.csv("Comparison_of_Pupil_to_Teacher_ratios_at_Public_and_Private_Early_Childhood_Development_Education__ECDE__by_County.csv")
public <- data9[1:47,]
private <- data9[48:94,]
totals <- data9[95:141,]
colnames(public)[3:5] <- c("Public.School.Enrollment","Public.School.Teachers","Public.School.PTR")
colnames(private)[3:5] <- c("Private.School.Enrollment","Private.School.Teachers","Private.School.PTR")
colnames(totals)[3:5] <- c("Total.School.Enrollment","Total.School.Teachers","Total.School.PTR")
final <- data.frame(public$COUNTY,public$Public.School.Enrollment,public$Public.School.Teachers,public$Public.School.PTR,private$Private.School.Enrollment,private$Private.School.Teachers,private$Private.School.PTR,totals$Total.School.Enrollment,totals$Total.School.Teachers,totals$Total.School.PTR,public$County..Centroid.,public$Year)
colnames(final) <- c("COUNTY","Public.School.Enrollment","Public.School.Teachers","Public.School.PTR","Private.School.Enrollment","Private.School.Teachers","Private.School.PTR","Total.School.Enrollment","Total.School.Teachers","Total.School.PTR","County..Centroid.","Year")
write.csv(final,"Updated Comparison_of_Pupil_to_Teacher_ratios_at_Public_and_Private_Early_Childhood_Development_Education__ECDE__by_County.csv")


new <- read.csv("KCSE_Exam_Results_2006_to_2010.csv")
