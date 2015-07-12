#Open and process data
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings ="?", quote="")
data$Date <- as.Date(data$Date,format="%d/%m/%Y")
data_short<-data[data$Date=="2007-02-01"|data$Date=="2007-02-02",]
data_short$timestamp<- as.POSIXct(paste(data_short$Date,data_short$Time))

#Plot the required data
png(file="plot2.png")
plot(y=data_short$Global_active_power,x=data_short$timestamp,type="l",ylab="Global Active Power (kilowatts)",xlab="")
dev.off()