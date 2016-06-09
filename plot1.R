#Reading data
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".",na.strings="?")

#subseting the data from the dates 2007-02-01 and 2007-02-02
reqData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#ploting the data
png("plot1.png", width=480, height=480)
hist(reqData$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
dev.off()