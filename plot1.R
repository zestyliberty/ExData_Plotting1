data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
datarange <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

GAP <- as.numeric(datarange$Global_active_power)
hist(GAP, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab = "Frequency")

dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()