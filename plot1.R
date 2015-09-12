## plot1.R
## Read household_power_consumption
## the  na.strings = "?"  cast all numeric field
## finally create a png file with the histogram of Power consumption
## for period : 1/2/2007 to 2/2/2007

data <- read.table("data/household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".", na.strings = "?")
subData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

png("plot1.png", width=480, height=480)
hist(subData$Global_active_power,col="#ff2300",xlab="Global Active Power (kilowats)",main="Global Active Power")
dev.off()