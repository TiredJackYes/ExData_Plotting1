## plot 3

library(data.table)

## Load the data set into R and then subset it to the days we need

HouseholdPower <- read.table("D:/Dokumenty/R - John Hopkins/data/household_power_consumption.txt", header = TRUE, dec = ".", stringsAsFactors = FALSE, sep = ";")
SubSetPower <- HouseholdPower[HouseholdPower$Date %in% c("1/2/2007","2/2/2007") ,]

#str(SubSetPower)
datetime <- strptime(paste(SubSetPower$Date, SubSetPower$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(SubSetPower$Global_active_power)
SubSetMetering <- as.numeric(SubSetPower$Sub_metering_1)
SubSetMetering2 <- as.numeric(SubSetPower$Sub_metering_2)
SubSetMetering3 <- as.numeric(SubSetPower$Sub_metering_3)

plot(datetime, SubSetMetering, type="l", ylab="Energy SubSetMetering", xlab="")
lines(datetime, SubSetMetering2, type="l", col="red")
lines(datetime, SubSetMetering3, type="l", col="blue")
legend("topright", col = c("black", "red", "blue"), legend = c("sub_metering_1", "sub_metering_2", "sub_metering_3" ), lty = 1)

dev.copy(png, file = "D:/Dokumenty/R - John Hopkins/Programmig Assignment Exploratory Data Analysis/First/plot3.png", height = 480, width = 480)
dev.off()