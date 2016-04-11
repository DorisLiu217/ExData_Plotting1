##Get data and subsetting data
file <- "household_power_consumption.txt"
data <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subData<- subset(data,Date %in% c("1/2/2007","2/2/2007") )

##Combine Date and Time
subData$DataTime<-paste(subData$Date, subData$Time)
dt <- strptime(subData$DataTime, "%d/%m/%Y %H:%M:%S") 
##Change Data Type
Global_Active_Power <- as.numeric(subData$Global_active_power)
png("plot2.png", width=480, height=480)
plot(dt, Global_Active_Power, xlab="", ylab="Global Active Power (kilowatts)", type="l")
dev.off()