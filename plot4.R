#Open and process data
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings ="?", quote="")
data$Date <- as.Date(data$Date,format="%d/%m/%Y")
data_short<-data[data$Date=="2007-02-01"|data$Date=="2007-02-02",]
data_short$timestamp<- as.POSIXct(paste(data_short$Date,data_short$Time))

#Plot the required data
#Create 2 by 2 matrix
png(file="plot4.png")
par(mfrow = c(2, 2))

#Graph 1,1
plot(y=data_short$Global_active_power,x=data_short$timestamp,type="l",ylab="Global Active Power (kilowatts)",xlab="")

#Graph 1,2
plot(y=data_short$Voltage,x=data_short$timestamp,type="l",ylab="Voltage",xlab="datetime")

#Graph 2,1
plot(y=data_short$Sub_metering_1,x=data_short$timestamp,type="l",col="black",ylab="Energy sub metering",xlab="")
lines(x=data_short$timestamp,y=data_short$Sub_metering_2,col="red")
lines(x=data_short$timestamp,y=data_short$Sub_metering_3,col="blue")
legend("topright", lty = 1, col = c("black","red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#Graph 2,2
plot(y=data_short$Global_reactive_power,x=data_short$timestamp,type="l",ylab="Global_reactive_power",xlab="datetime")

dev.off()
