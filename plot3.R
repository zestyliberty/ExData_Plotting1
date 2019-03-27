data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
datarange <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

timeText <- strptime(paste(datarange$Date, datarange$Time), format = "%d/%m/%Y %H:%M:%S" )
timeDate <- as.POSIXct(timeText)

plot(timeDate, datarange$Sub_metering_1, type = "l", xlab = "", ylab = "Energy Submetering")
lines(timeDate,datarange$Sub_metering_2, type = "l", col = "red" )
lines(timeDate,datarange$Sub_metering_3, type = "l", col = "blue" )

legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()