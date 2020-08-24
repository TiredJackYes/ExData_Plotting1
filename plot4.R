## plot 4

library(data.table)

## Load the data set into R and then subset it to the days we need

HouseholdPower <- read.table("D:/Dokumenty/R - John Hopkins/data/household_power_consumption.txt", header = TRUE, dec = ".", stringsAsFactors = FALSE, sep = ";")
SubSetPower <- HouseholdPower[HouseholdPower$Date %in% c("1/2/2007","2/2/2007") ,]

DateAndTime <- strptime(paste(SubSetPower$Date, SubSetPower$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(SubSetPower$Global_active_power)
globalReactivePower <- as.numeric(SubSetPower$Global_reactive_power)
voltage <- as.numeric(SubSetPower$Voltage)
subMetering1 <- as.numeric(SubSetPower$Sub_metering_1)
subMetering2 <- as.numeric(SubSetPower$Sub_metering_2)
subMetering3 <- as.numeric(SubSetPower$Sub_metering_3)

par(mfrow = c(2, 2)) 

plot(DateAndTime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(DateAndTime, voltage, type="l", xlab="DateAndTime", ylab="Voltage")

plot(DateAndTime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(DateAndTime, subMetering2, type="l", col="red")
lines(DateAndTime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(DateAndTime, globalReactivePower, type="l", xlab="DateAndTime", ylab="Global_reactive_power")


dev.copy(png, file = "D:/Dokumenty/R - John Hopkins/Programmig Assignment Exploratory Data Analysis/First/plot4.png", height = 480, width = 480)
dev.off()