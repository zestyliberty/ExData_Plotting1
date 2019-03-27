data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
datarange <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

timeText <- strptime(paste(datarange$Date, datarange$Time), format = "%d/%m/%Y %H:%M:%S" )
timeDate <- as.POSIXct(timeText)

par(mfrow = c(2, 2), mar=c(4,4,2,1))

#graph1
plot(timeDate, datarange$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

#graph2
plot(timeDate, datarange$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

#graph3
plot(timeDate, datarange$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(timeDate,datarange$Sub_metering_2, type = "l", col = "red" )
lines(timeDate,datarange$Sub_metering_3, type = "l", col = "blue" )
legend("topright", lty = 1, col = c("black", "red", "blue"), cex = 0.4,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")

#graph4
plot(timeDate, datarange$Global_reactive_power, type = "l", xlab = "", ylab = "Global_reactive_power")

dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()