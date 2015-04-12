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


png(file = "plot3.png", width = 480, height = 480) 

plot(bar$DateTime, as.numeric(bar$Sub_metering_1), type="l", col="black", xlab = "", ylab = "Energy sub metering",  yaxt="n") 
lines(bar$DateTime, as.numeric(bar$Sub_metering_2), col="red") 
lines(bar$DateTime, as.numeric(bar$Sub_metering_3), col="blue") 

axis(side = 2, at = c(0,10,20,30))

legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1), lwd=c(2.5,2.5),col=c("black","red","blue"))

dev.off() 

