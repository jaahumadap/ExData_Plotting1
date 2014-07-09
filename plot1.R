# read datan

url <- "http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url,"hhp.zip")
unzip("hhp.zip")

hpdata <- read.table("household_power_consumption.txt",sep=";",h=T,na.strings="?")

library(lubridate)

hpdata$Date <- dmy(hpdata$Date)
hpdata$Time <- hms(hpdata$Time)

logicalDate <- (year(hpdata$Date) == 2007 & month(hpdata$Date) == 2 & day(hpdata$Date) == 1) | (year(hpdata$Date) == 2007 & month(hpdata$Date) == 2 & day(hpdata$Date) == 2) 

hpdatas <- hpdata[logicalDate,]

#Create Plot

png("plot1.png",width=480,height=480)
with(hpdatas,hist(Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power"))
dev.off()

