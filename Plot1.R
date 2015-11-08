data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",colClasses=c("character", "character", rep("numeric",7)), na="?")

data$Time <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

data$Date <- as.Date(data$Date, "%d/%m/%Y")

filter <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")

data <- subset(data, Date %in% filter)

#write.table(data, file = "MyData.csv",row.names=FALSE, na="",col.names=TRUE, sep=",") 

data$Global_active_power<-as.numeric(data$Global_active_power)

png("plot1.png", width=480, height=480)

hist(data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.off()

