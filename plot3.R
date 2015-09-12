## plot3.R
## Read household_power_consumption
## the  na.strings = "?"  cast all numeric field
## finally create a png file with the boxplot of Energy sub metering
## for period : 1/2/2007 to 2/2/2007

data <- read.table("data/household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".", na.strings = "?")
subData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

subData$DateTime<-strptime(paste(subData$Date, subData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
png("plot3.png", width=480, height=480)
plot(subData$DateTime, subData$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(subData$DateTime, subData$Sub_metering_2, type="l", col="red")
lines(subData$DateTime, subData$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()