#read in data set
data <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?")

#convert Date using as.Date()
data$Date <- as.Date(data$Date,"%d/%m/%Y")

#subset data set to include specified dates
days <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")

#merge date and time into datetime field
days$datetime <- as.POSIXct(paste(days$Date,days$Time))


#create graphic device
png("plot4.png")

#create plot

#define 2 x 2
par(mfrow = c(2,2))
with(days, {

#global active power
plot(datetime,Global_active_power, type="l", ylab="Global Active Power", xlab="")

#voltage
plot(datetime,Voltage, type="l", ylab="Voltage", xlab="datetime")

#sub_metering
plot(datetime,Sub_metering_1, ylab="Energy sub metering", type="l", xlab="")
lines(datetime,Sub_metering_2, col ="red")
lines(datetime,Sub_metering_3, col ="blue")
legend("topright", lty=c(1,1,1), bty="n", col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#voltage
plot(datetime,Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")
})


#close device
dev.off()