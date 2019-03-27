data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
datarange <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

timeText <- strptime(paste(datarange$Date, datarange$Time), format = "%d/%m/%Y %H:%M:%S" )
timeDate <- as.POSIXct(timeText)

plot(timeDate, datarange$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()