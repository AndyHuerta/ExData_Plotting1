names<-c("Date","Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", 
         "Sub_metering_1", "Sub_metering_2","Sub_metering_3")
data=read.table("household_power_consumption.txt",col.names=names,sep=";",na.strings="?",skip=66637, nrows=2880)
data$Date<-as.Date(data$Date, format="%d/%m/%Y")
dateFull <- paste(data$Date, data$Time)
data$DateFull <- as.POSIXct(dateFull)
plot(data$Sub_metering_1~data$DateFull, type="l", ylab="Energy sub metering", xlab="",cex=.8)
lines(data$Sub_metering_2~data$DateFull, col="red")
lines(data$Sub_metering_3~data$DateFull, col="blue")
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),cex=.8)
dev.copy(png, "plot3.png")
dev.off()