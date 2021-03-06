HhPower <- read.csv(file="household_power_consumption.txt", header=TRUE, sep=";")
HhPower$Date <- as.Date(HhPower$Date, "%d/%m/%Y")
SubsetHhPower<-subset(HhPower, Date >="2007-02-01" & Date <= "2007-02-02")
SubsetHhPower$Global_active_power <- as.numeric(as.character(SubsetHhPower$Global_active_power))
v1 <- c(0,nrow(SubsetHhPower)/2,nrow(SubsetHhPower))
v2 <- c("Thu","Fri","Sat")
png(filename="plot2.png", width = 480, height = 480, units = "px")
plot(SubsetHhPower$Global_active_power,type = "l", ylab = "Global Active Power (Kilowatts)", xlab="", xaxt = "n")
axis(side = 1, at = v1, labels = v2)
dev.off()

