df <- read.csv2("household_power_consumption.csv",na.strings='?')
data <- subset(df, df$Date == "1/2/2007" | df$Date == "2/2/2007")
global_active_power <- as.numeric(as.character(data$Global_active_power)
hist(global_active_power, col='red')