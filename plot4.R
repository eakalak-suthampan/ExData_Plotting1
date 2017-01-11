## set working directory
workingDirectory <- "C:/Users/jack/Desktop/DataScience Specialization/4 Exploratory Data Analysis/week1"

if(!file.exists(workingDirectory)) {
        dir.create(workingDirectory)
}

setwd(workingDirectory)
## end set working directory

## download and unzip data
#url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
#download.file(url, destfile = "household_power_consumption.zip", mode = "wb")
#unzip("household_power_consumption.zip")
## end download and unzip data

## load data
rawData <- read.table("household_power_consumption.txt", header = FALSE, sep = ";",skip = 66637, nrows = 2880)
header <- read.table("household_power_consumption.txt", header = FALSE, sep = ";", nrows = 1, colClasses = "character")
names(rawData) <- header[1,]
## end load data

# convert to datetime
dateTime <- strptime(paste(rawData$Date,rawData$Time),"%d/%m/%Y %H:%M:%S")

# open png graphic device
png("plot4.png", width=480, height=480)

## plot 4 
par(mfrow=c(2,2))

plot(dateTime,rawData$Global_active_power, type="l", xlab = "", ylab = "Global Active Power")

plot(dateTime,rawData$Voltage,type="l", xlab = "datetime",ylab = "Voltage")

plot(dateTime, rawData$Sub_metering_1 ,type="l", xlab = "", ylab = "Enery sub metering")
points(dateTime, rawData$Sub_metering_2, type = "l", col="red")
points(dateTime, rawData$Sub_metering_3, type = "l", col="blue")
legend("topright",lty=1,bty = "n",col = c("black","red","blue"), legend = names(rawData[,7:9]))

plot(dateTime,rawData$Global_reactive_power,type="l", xlab = "datetime", ylab = "Global_reactive_power")
## end plot 4

# close png graphic device
dev.off()
