#read in data set
data <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?")

#convert Date using as.Date()
data$Date <- as.Date(data$Date,"%d/%m/%Y")

#subset data set to include specified dates
days <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")

#merge date and time into datetime field
days$datetime <- as.POSIXct(paste(days$Date,days$Time))


#create graphic device
png("plot3.png")

#create plot
with (days, plot(datetime,Sub_metering_1, ylab="Energy sub metering", type="l", xlab=""))
with (days, lines(datetime,Sub_metering_2, col ="red"))
with (days, lines(datetime,Sub_metering_3, col ="blue"))
legend("topright", lty=c(1,1,1), col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))


#close device
dev.off()