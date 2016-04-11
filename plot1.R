##Get data and subsetting data
file <- "household_power_consumption.txt"
data <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subData<- subset(data,Date %in% c("1/2/2007","2/2/2007") )

##class(subData$Global_active_power) ##Check the data type of G_a_p
Global_Active_Power <- as.numeric(subData$Global_active_power)
##Create Plot as png
png("plot1.png", width=480, height=480)
hist(Global_Active_Power, main="Global Active Power", xlab="Global Active Power (kilowatts)",col="red")
dev.off()