HhPower <- read.csv(file="household_power_consumption.txt", header=TRUE, sep=";")
HhPower$Date <- as.Date(HhPower$Date, "%d/%m/%Y")
SubsetHhPower<-subset(HhPower, Date >="2007-02-01" & Date <= "2007-02-02")
SubsetHhPower$Global_active_power <- as.numeric(as.character(SubsetHhPower$Global_active_power))
png(filename="plot1.png", width = 480, height = 480, units = "px")
hist(SubsetHhPower$Global_active_power,main="Global Active Power", xlab = "Global Active Power (Kilowatts)", col="red")
dev.off()

