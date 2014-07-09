# read data in

url <- "http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url,"hhp.zip")
unzip("hhp.zip")

hpdata <- read.table("household_power_consumption.txt",sep=";",h=T,na.strings="?")

library(lubridate)

# Create time stamp object from dates and times in the data
hpdata$ts <- dmy_hms(paste(hpdata$Date,hpdata$Time))

logicalDate <- (year(hpdata$Date) == 2007 & month(hpdata$Date) == 2 & day(hpdata$Date) == 1) | (year(hpdata$Date) == 2007 & month(hpdata$Date) == 2 & day(hpdata$Date) == 2) 

hpdatas <- hpdata[logicalDate,]

#create PNG plot

png("plot2.png",width=480,height=480)
with(hpdatas,plot(ts,Global_active_power,t='l',xlab="",ylab="Global Active Power (kilowatts)"))
dev.off()
