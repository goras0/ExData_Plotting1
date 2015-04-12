# plot1.R
# Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
library(datasets)
hhData <- read.csv(file="household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
bar01 <- subset(hhData, Date == "1/2/2007")
bar02 <- subset(hhData, Date == "2/2/2007")
bar <- rbind(bar01,bar02)

png(file = "plot1.png", width = 480, height = 480) ## Open PNG device; create 'plot1.png' in working directory
## Create plot and send to a file (no plot appears on screen)
hist(bar$Global_active_power, main = "Global Active power", col = "red", xlab = "Global Active Power (kilowatts)")
dev.off() ## Close the PNG file device
## Now you can view the file on your computer


