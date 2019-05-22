HhPower <- read.csv(file="household_power_consumption.txt", header=TRUE, sep=";")
HhPower$Date <- as.Date(HhPower$Date, "%d/%m/%Y")
SubsetHhPower<-subset(HhPower, Date >="2007-02-01" & Date <= "2007-02-02")
SubsetHhPower$Global_active_power <- as.numeric(as.character(SubsetHhPower$Global_active_power))
SubsetHhPower$Sub_metering_1 <- as.numeric(as.character(SubsetHhPower$Sub_metering_1))
SubsetHhPower$Sub_metering_2 <- as.numeric(as.character(SubsetHhPower$Sub_metering_2))
SubsetHhPower$Sub_metering_3 <- as.numeric(as.character(SubsetHhPower$Sub_metering_3))
SubsetHhPower$Voltage <- as.numeric(as.character(SubsetHhPower$Voltage))
SubsetHhPower$Global_reactive_power <- as.numeric(as.character(SubsetHhPower$Global_reactive_power))

v1 <- c(0,nrow(SubsetHhPower)/2,nrow(SubsetHhPower))
v2 <- c("Thu","Fri","Sat")
png(filename="plot4.png", width = 480, height = 480, units = "px")
par(mfrow=c(2,2))
plot(SubsetHhPower$Global_active_power,type = "l", ylab = "Global Active Power (Kilowatts)", xlab="", xaxt = "n")
axis(side = 1, at = v1, labels = v2)

plot(SubsetHhPower$Voltage,type = "l", ylab = "Voltage", xlab="", xaxt = "n")
axis(side = 1, at = v1, labels = v2)

plot(SubsetHhPower$Sub_metering_1,type = "l", ylab = "Energy Sub metering", xlab="", xaxt = "n")
lines(SubsetHhPower$Sub_metering_2, col="red")
lines(SubsetHhPower$Sub_metering_3, col="blue")
legend(1, 95, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lty=1:2, cex=0.8)

legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),col=c("black", "red", "blue"), lty=1)

axis(side = 1, at = v1, labels = v2)

plot(SubsetHhPower$Global_reactive_power,type = "l", ylab = "Global_reactive_power", xlab="", xaxt = "n")
axis(side = 1, at = v1, labels = v2)
dev.off()

