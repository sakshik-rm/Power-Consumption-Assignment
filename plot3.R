#Exploratory Analysis - Plotting Data
#Course Project 1

#------------------------------------Plot 3
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
png(filename = "plot3.png", width = 480, height = 480)
plot(hpcsub$datetime, hpcsub$Sub_metering_1, 
     type = "n", ylab = "Energy sub metering", xlab="")
points(hpcsub$datetime, hpcsub$Sub_metering_1, type="l")
points(hpcsub$datetime, hpcsub$Sub_metering_2, type="l", col="red")
points(hpcsub$datetime, hpcsub$Sub_metering_3, type="l", col="blue")
legend("topright", 
       legend = c("Sub metering 1", "Sub metering 2", "Sub metering 3"), 
       col = c("black", "red", "blue"), lty = c(1,1,1))

