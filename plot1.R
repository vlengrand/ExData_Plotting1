setwd("C:/Users/Lengrand/Documents/Coursera/Cours 4 - Exploratory Data Analysis")
#read the data
library(lubridate)
dat <- read.table(file = "household_power_consumption.txt", header=TRUE,
                  sep=";",
                  stringsAsFactors = F,
                  na.strings = "?")

#use data from the dates 2007-02-01 and 2007-02-02
dat$Date<-dmy(dat$Date)
dat<-dat[dat$Date > as.Date("2007-01-31"),]
dat<-dat[dat$Date < as.Date("2007-02-03"),]

#plot first graph
png(filename = "plot1.png",
    width = 480, height = 480, bg = "transparent")

with(dat,hist(Global_active_power, 
              main = "Global Active Power", 
              col = 'red', 
              xlab = "Global Active Power (kilowatt)"))
dev.off()