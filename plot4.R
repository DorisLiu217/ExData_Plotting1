##Get data and subsetting data
file <- "household_power_consumption.txt"
data <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subData<- subset(data,Date %in% c("1/2/2007","2/2/2007") )

##Combine Date and Time
subData$DataTime<-paste(subData$Date, subData$Time)
dt <- strptime(subData$DataTime, "%d/%m/%Y %H:%M:%S")

##class(subData$Sub_metering_1)
##Change Data Type
sub1 <- as.numeric(subData$Sub_metering_1)
sub2 <- as.numeric(subData$Sub_metering_2)
sub3 <- as.numeric(subData$Sub_metering_3)
Global_Active_Power <- as.numeric(subData$Global_active_power)
Global_Reactive_Power <- as.numeric(subData$Global_reactive_power)
voltage <- as.numeric(subData$Voltage)

#Create Plot as png
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

#p1
plot(dt, Global_Active_Power, xlab="", ylab="Global Active Power", type="l")
#p2
plot(dt, voltage, xlab="datetime", ylab="Voltage", type="l")
#p3
plot(dt, sub1, xlab="", ylab="Energy Submetering", type="l")
lines(dt, sub2, type="l", col="red")
lines(dt, sub3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, col=c("black", "red", "blue"), bty="o")
#p4
plot(dt, Global_Reactive_Power, xlab="datetime", ylab="Global_reactive_power", type="l")

dev.off()
