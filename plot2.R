#read in data set
data <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?")

#convert Date using as.Date()
data$Date <- as.Date(data$Date,"%d/%m/%Y")

#subset data set to include specified dates
days <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")

#merge date and time into datetime field
days$datetime <- as.POSIXct(paste(days$Date,days$Time))


#create graphic device
png("plot2.png")

#create plot
plot(days$datetime,days$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")

#close device
dev.off()