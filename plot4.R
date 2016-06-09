#Reading data
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".",na.strings="?")

#subseting the data from the dates 2007-02-01 and 2007-02-02
reqData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#converting the dates to right format
reqData$Datetime <- strptime(paste(reqData$Date, reqData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#ploting data
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(reqData$Datetime, reqData$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

plot(reqData$Datetime, reqData$Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(reqData$Datetime, reqData$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(reqData$Datetime, reqData$Sub_metering_2, type="l", col="red")
lines(reqData$Datetime, reqData$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

plot(reqData$Datetime, reqData$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()