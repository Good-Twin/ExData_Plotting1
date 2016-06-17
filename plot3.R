library(dplyr)

#reading and formating of the data
data = read.csv("household_power_consumption.txt", sep = ';', na.strings = '?', stringsAsFactors = F)
data$newDate <- as.Date(data$Date,'%d/%m/%Y')
data <- filter(data, (newDate == '2007-02-01' | newDate == '2007-02-02') )
data$DateTime <- strptime(paste(data$Date, data$Time),"%d/%m/%Y %H:%M:%S")

#Opening the png device and create the plot
png(file="plot3.png", width=480, height=480)

plot(data$DateTime, as.numeric(data$Sub_metering_1), type="l", xlab="", ylab="Energy sub metering")
lines(data$DateTime,as.numeric(data$Sub_metering_2), col="red")
lines(data$DateTime,as.numeric(data$Sub_metering_3), col="blue")

legend("topright", lty=1, col= c("black","blue","red"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()