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

#plot fourth graph

#convert to dates()
dat <- transform(dat, datetime = strptime(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S"))


png(filename = "plot4.png",
    width = 480, height = 480, bg = "transparent")

par(mfrow = c(2, 2))
with(dat, {
  plot(datetime, Global_active_power, 
       type = 'l', 
       ylab = "Global Active Power (kilowatt)",
       xlab = "")
  
  plot(datetime, Voltage, 
       type = 'l', 
       ylab = "Voltage",
       xlab = "datetime")
  
  plot(datetime, Sub_metering_1, 
       type = 'l', 
       ylab = "Energy sub metering",
       xlab = "")
  lines(datetime, Sub_metering_2, col="red")
  lines(datetime, Sub_metering_3, col = "blue")
  legend("topright", 
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
         col = c("black", "red", "blue"),
         lty = 1)
  
  plot(datetime, Global_reactive_power, 
       type = 'l', 
       ylab = "Global_reactive_power",
       xlab = "datetime")

})

dev.off()

