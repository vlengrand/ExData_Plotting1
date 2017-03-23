setwd("C:/Users/Lengrand/Documents/Coursera/Cours 4 - Exploratory Data Analysis")
#read the data
library(lubridate)
dat <- read.table(file = "household_power_consumption.txt", header=TRUE,
                  sep=";",
                  stringsAsFactors = F,
                  na.strings = "?")

#use data from the dates 2007-02-01 and 2007-02-02
dat$Date2<-dmy(dat$Date)
dat<-dat[dat$Date2 > as.Date("2007-01-31"),]
dat<-dat[dat$Date2 < as.Date("2007-02-03"),]

#plot second graph

#convert to dates()
dat <- transform(dat, datetime = strptime(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S"))


png(filename = "plot2.png",
    width = 480, height = 480, bg = "transparent")

with(dat, plot(datetime, Global_active_power, 
               type = 'l', 
               ylab = "Global Active Power (kilowatt)",
               xlab = ""))

dev.off()
