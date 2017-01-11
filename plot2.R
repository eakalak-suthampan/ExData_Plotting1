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
png("plot2.png", width=480, height=480)

# plot 2 
plot(dateTime,rawData$Global_active_power, type="l", xlab = "", ylab = "Global Active Power (kilowatts)")

# close png graphic device
dev.off()
