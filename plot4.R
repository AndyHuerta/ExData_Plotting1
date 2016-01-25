names<-c("Date","Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", 
         "Sub_metering_1", "Sub_metering_2","Sub_metering_3")
data=read.table("household_power_consumption.txt",col.names=names,sep=";",na.strings="?",skip=66637, nrows=2880)
data$Date<-as.Date(data$Date, format="%d/%m/%Y")
dateFull <- paste(data$Date, data$Time)
data$DateFull <- as.POSIXct(dateFull)
par(mfrow=c(2,2), mar=c(4,4,4,1), oma=c(0,0,2,0), cex=.6)

plot(data$Global_active_power~data$DateFull, type="l", ylab="Global Active Power", xlab="")
plot(data$Voltage~data$DateFull, type="l", ylab="Voltage", xlab="datetime")
plot(data$Sub_metering_1~data$DateFull, type="l", ylab="Energy sub metering", xlab="")
lines(data$Sub_metering_2~data$DateFull, col="red")
lines(data$Sub_metering_3~data$DateFull, col="blue")
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),box.lty="blank", xjust=1)
plot(data$Global_reactive_power~data$DateFull, type="l", ylab="Global_reactive_power", xlab="datetime")
dev.copy(png, "plot4.png")
dev.off()