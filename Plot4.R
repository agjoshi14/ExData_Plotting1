data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",colClasses=c("character", "character", rep("numeric",7)), na="?")

data$Time <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

data$Date <- as.Date(data$Date, "%d/%m/%Y")

filter <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")

data <- subset(data, Date %in% filter)

png("plot4.png", width=480, height=480)

par(mfrow=c(2,2))	
	plot(data$Time, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
	plot(data$Time, data$Voltage, type = "l", xlab = "datetime", ylab = "Global Active Power")
	plot(data$Time, data$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
	lines(data$Time, data$Sub_metering_2, type="l", col="red")
	lines(data$Time, data$Sub_metering_3, type="l", col="blue")
	legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=2, col=c("black", "red", "blue"))
	plot(data$Time, data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global Active Power")

dev.off()


