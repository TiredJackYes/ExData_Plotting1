## plot 2

library(data.table)

## Load the data set into R and then subset it to the days we need

HouseholdPower <- read.table("D:/Dokumenty/R - John Hopkins/data/household_power_consumption.txt", header = TRUE, dec = ".", stringsAsFactors = FALSE, sep = ";")
HouseHoldPower <- HouseholdPower[HouseholdPower$Date %in% c("1/2/2007","2/2/2007") ,]
## let it read the global active power as a numeric

globalActivePower <- as.numeric(HouseHoldPower$Global_active_power)
HouseHoldPowerdate <- as.Date(HouseHoldPower$Date, format("%A, %m, %y"),)
HouseHoldPower$Date <- strptime(HouseHoldPower$Date, format = "%A")
plot(globalActivePower, xlab = "", ylab = "Global Active Power (kilowatts)",  type = "l")  

dev.copy(png, file = "D:/Dokumenty/R - John Hopkins/Programmig Assignment Exploratory Data Analysis/First/plot2.png", height = 480, width = 480)
dev.off()
