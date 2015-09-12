## plot2.R
## Read household_power_consumption
## the  na.strings = "?"  cast all numeric field
## finally create a png file with the plot of Power consumption by time
## for period : 1/2/2007 to 2/2/2007

data <- read.table("data/household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".", na.strings = "?")
subData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

subData$DateTime<-strptime(paste(subData$Date, subData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
png("plot2.png", width=480, height=480)
plot(subData$DateTime, subData$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
