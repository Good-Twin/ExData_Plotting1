library(dplyr)

#reading and formating of the data
data = read.csv("household_power_consumption.txt", sep = ';', na.strings = '?')
data$Date <- as.Date(data$Date,'%d/%m/%Y')
data <- filter(data, (Date == '2007-02-01' | Date == '2007-02-02') )

#Opening the png device and create the plot
png(file="plot1.png", width=480, height=480)
hist(data$Global_active_power, col = "red", xlab= "Global Active Power (kilowatts)",main = "Global Active Power")
dev.off()