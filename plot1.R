#Exploratory Analysis - Plotting Data
#Course Project 1

#------------------------------------Plot 1
library(lubridate)
library(chron)

#reading in data from file
hpc <- read.delim("household_power_consumption.txt", sep=";", 
                  na.strings="?", stringsAsFactors = FALSE)

#converting Date and Time to date and time classes
hpc$Date <- as.Date(hpc$Date, format= "%d/%m/%Y")
hpcsub$Time <- times(hpcsub$Time)

#subetting the data for 2007-02-01 to 2007-02-01 dates
hpcsub <- subset(hpc, Date == "2007-02-01" | Date == "2007-02-02")
hpcsub$datetime <- as.POSIXct(paste(hpcsub$Date, hpcsub$Time))

#plotting
png(filename = "plot1.png", width = 480, height = 480)
hist(hpcsub$Global_active_power, col="red", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")
dev.off()
