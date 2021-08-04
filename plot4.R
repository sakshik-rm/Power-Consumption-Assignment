#Exploratory Analysis - Plotting Data
#Course Project 1

#------------------------------------Plot 4
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
png(filename = "plot4.png", width = 480, height = 480)

par(mfrow = c(2,2))
#1
plot(hpcsub$datetime, hpcsub$Global_active_power, 
     type="line", ylab="Global Active Power", xlab="")
#2
plot(hpcsub$datetime, hpcsub$Voltage, 
     type ="line", ylab="Voltage", xlab="datetime")
#3
with(hpcsub, {
  plot(hpcsub$datetime, hpcsub$Sub_metering_1, 
       type="l", ylab="Energy sub metering", xlab="")
  points(hpcsub$datetime, hpcsub$Sub_metering_2, type="l", col="red")
  points(hpcsub$datetime, hpcsub$Sub_metering_3, type="l", col="blue")
  legend("topright", 
         legend = c("Sub metering 1", "Sub metering 2", "Sub metering 3"), 
         col = c("black", "red", "blue"), lty = c(1,1,1))
})
#4
plot(hpcsub$datetime, hpcsub$Global_reactive_power, 
     type ="line", ylab="Global Reactive Power", xlab="datetime")

