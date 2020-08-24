## plot 1

library(data.table)
## Load the data set into R and then subset it to the years we need
HouseholdPower <- read.table("D:/Dokumenty/R - John Hopkins/data/household_power_consumption.txt", header = TRUE, dec = ".", stringsAsFactors = FALSE, sep = ";")
HouseHoldPower <- HouseholdPower[HouseholdPower$Date %in% c("1/2/2007","2/2/2007") ,]
## let it read the global active power as a numeric
globalActivePower <- as.numeric(HouseHoldPower$Global_active_power)
## making the graph
hist(globalActivePower, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", col = "Red")

dev.copy(png, file = "D:/Dokumenty/R - John Hopkins/Programmig Assignment Exploratory Data Analysis/First/plot1.png", height = 480, width = 480)
dev.off()
