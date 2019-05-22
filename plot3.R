HhPower <- read.csv(file="household_power_consumption.txt", header=TRUE, sep=";")
HhPower$Date <- as.Date(HhPower$Date, "%d/%m/%Y")
SubsetHhPower<-subset(HhPower, Date >="2007-02-01" & Date <= "2007-02-02")
SubsetHhPower$Sub_metering_1 <- as.numeric(as.character(SubsetHhPower$Sub_metering_1))
SubsetHhPower$Sub_metering_2 <- as.numeric(as.character(SubsetHhPower$Sub_metering_2))
SubsetHhPower$Sub_metering_3 <- as.numeric(as.character(SubsetHhPower$Sub_metering_3))
v1 <- c(0,nrow(SubsetHhPower)/2,nrow(SubsetHhPower))
v2 <- c("Thu","Fri","Sat")
png(filename="plot3.png", width = 480, height = 480, units = "px")
plot(SubsetHhPower$Sub_metering_1,type = "l", ylab = "Energy Sub metering", xlab="", xaxt = "n")
lines(SubsetHhPower$Sub_metering_2, col="red")
lines(SubsetHhPower$Sub_metering_3, col="blue")
legend(1, 95, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lty=1:2, cex=0.8)

legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),col=c("black", "red", "blue"), lty=1)

axis(side = 1, at = v1, labels = v2)
dev.off()

