## This R Script reads the household-power-consumpton.txt file and creates a Plot 3 of Course Assignment 1.
## Read the household-power-consumption.txt file
## 
myData <- fread("./Data/household_power_consumption.txt", na.strings = "?", header = TRUE, stringsAsFactors = FALSE)

## Convert imported Date to R Date type
myData$Date <- as.Date(myData$Date, format = "%d/%m/%Y")

## Subset data for 2007-02-01 to 2007-02-02
myData2 <- subset(myData, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(myData) ## Clear memory

datetime <- paste(as.Date(myData2$Date), myData2$Time)
myData2$DateTime <- as.POSIXct(datetime)

## Plot3
## use the "with()" function.  Add lines for second and third sub_metering
## To prevent the legend from being cut off on the right, open a PNG graphic device, do plotting, then close the PNG device.
## Open PNG file graphic device
png(filename = "plot3.png", width = 480, height = 480)

with(myData2, {
        plot(Sub_metering_1~DateTime, type = "l", ylab = "Energy sub metering", xlab = "")
        lines(Sub_metering_2~DateTime, col = "red")
        lines(Sub_metering_3~DateTime, col = "blue")
})
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## The following copy didn't keep the entire legend.  Left this in for reference only.
##dev.copy(png, file = "plot3b.png", width = 480, height = 480)
## 
## Close the PNG graphic device
dev.off()