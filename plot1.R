# read data in

url <- "http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url,"hhp.zip")
unzip("hhp.zip")

hpdata <- read.table("household_power_consumption.txt",sep=";",h=T,na.strings="?")

library(lubridate)

# Create time stamp object from dates and times in the data
hpdata$ts <- dmy_hms(paste(hpdata$Date,hpdata$Time))

#Subset data to only include 2207/2/1 and 2007/2/2
logicalDate <- (year(hpdata$ts) == 2007 & month(hpdata$ts) == 2 & day(hpdata$ts) == 1) | (year(hpdata$ts) == 2007 & month(hpdata$ts) == 2 & day(hpdata$ts) == 2) 

#subsetted data set
hpdatas <- hpdata[logicalDate,]

#Create Plot

png("plot1.png",width=480,height=480)
with(hpdatas,hist(Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power"))
dev.off()

