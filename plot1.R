#read in data set
data <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings = c("?"))

#convert Date using as.Date()
data$Date <- as.Date(data$Date,"%d/%m/%Y")

#subset data set to include specified dates
days <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")

#create graphic device
png("plot1.png")

#create plot
hist(days$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")

#close device
dev.off()