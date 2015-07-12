#Open and process data
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings ="?", quote="")
data$Date <- as.Date(data$Date,format="%d/%m/%Y")
data_short<-data[data$Date=="2007-02-01"|data$Date=="2007-02-02",]
data_short$timestamp<- as.POSIXct(paste(data_short$Date,data_short$Time))

#Plot the required data
png(file="plot3.png")
plot(y=data_short$Sub_metering_1,x=data_short$timestamp,type="l",col="black",ylab="Energy sub metering",xlab="")
lines(x=data_short$timestamp,y=data_short$Sub_metering_2,col="red")
lines(x=data_short$timestamp,y=data_short$Sub_metering_3,col="blue")
legend("topright", lty = 1, col = c("black","red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()