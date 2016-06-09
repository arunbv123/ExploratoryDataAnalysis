#Reading data
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".",na.strings="?")

#subseting the data from the dates 2007-02-01 and 2007-02-02
reqData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#converting the dates to right format
reqData$Datetime <- strptime(paste(reqData$Date, reqData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#ploting data
png("plot2.png", width=480, height=480)
plot(reqData$Datetime, reqData$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()