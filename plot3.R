# read data in

url <- "http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url,"hhp.zip")
unzip("hhp.zip")

hpdata <- read.table("household_power_consumption.txt",sep=";",h=T,na.strings="?")

library(lubridate)

# Create time stamp object from dates and times in the data
hpdata$ts <- dmy_hms(paste(hpdata$Date,hpdata$Time))

logicalDate <- (year(hpdata$ts) == 2007 & month(hpdata$ts) == 2 & day(hpdata$ts) == 1) | (year(hpdata$ts) == 2007 & month(hpdata$ts) == 2 & day(hpdata$ts) == 2) 

hpdatas <- hpdata[logicalDate,]

#create PNG plot
png("plot3.png",width=480,height=480)
with(hpdatas,plot(ts,Sub_metering_1,t='l',xlab="",ylab="Energy sub metering"))
with(hpdatas,lines(ts,Sub_metering_2,col="red"))
with(hpdatas,lines(ts,Sub_metering_3,col="blue"))
with(hpdatas,legend("topright",legend=names(hpdatas)[7:9],lty=1,col=c("black","red","blue")))
dev.off()
