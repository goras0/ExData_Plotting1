# plot2.R
# Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
library(datasets)
hhData <- read.csv(file="household_power_consumption.txt", header=TRUE, sep=";")
bar01 <- subset(hhData, Date == "1/2/2007")
bar02 <- subset(hhData, Date == "2/2/2007")
bar <- rbind(bar01,bar02)

bar$DateTime <- as.POSIXct(paste(as.Date(bar$Date, format = "%d/%m/%Y"), as.character(bar$Time)))
bar$Voltage <- as.numeric(bar$Voltage)

png(file = "plot4.png", width = 480, height = 480) 

par(mfrow = c(2, 2))


with(bar, {
  plot( DateTime, as.numeric(bar$Global_active_power)/1000, type="l", xlab = "", ylab = "Global Active Power") 
  plot( DateTime, Voltage, type="l", xlab = "datetime", ylab = "Voltage") 
  
  plot( DateTime, as.numeric(bar$Sub_metering_1), type="l", col="black", xlab = "", ylab = "Energy sub metering",  yaxt="n") 
  lines( DateTime, as.numeric(bar$Sub_metering_2), col="red") 
  lines( DateTime, as.numeric(bar$Sub_metering_3), col="blue") 
  
  axis(side = 2, at = c(0,10,20,30))
  
  legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1), lwd=c(2.5,2.5),col=c("black","red","blue"))
  
  plot( DateTime, as.numeric(bar$Global_reactive_power)/100, type="l", xlab = "datetime", ylab = "Global_reactive_power") 
  
})

dev.off()







