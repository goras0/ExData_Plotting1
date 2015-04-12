# plot2.R
# Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
library(datasets)
hhData <- read.csv(file="household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
bar01 <- subset(hhData, Date == "1/2/2007")
bar02 <- subset(hhData, Date == "2/2/2007")
bar <- rbind(bar01,bar02)

bar$Date <- as.Date(bar$Date, format = "%d/%m/%Y")
bar$Time <- as.character(bar$Time)
bar$DateTime <- as.POSIXct(paste(bar$Date, bar$Time))

png(file = "plot2.png", width = 480, height = 480) 
plot(bar$DateTime, as.numeric(bar$Global_active_power), type="l", xlab = "", ylab = "Global Active Power (kilowats)") 
dev.off() 



