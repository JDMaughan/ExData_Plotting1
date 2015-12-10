## This R Script reads the household-power-consumpton.txt file and creates a Plot 4 of Course Assignment 1.
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

## Plot4
## Open up PNG Graphic Device (Comment this line out if to use screen graphic device)
png(filename = "plot4.png", width = 480, height = 480)

## Set up plot area
par(mfrow = c(2,2))



## Upperleft plot (row 1, col 1)
plot(myData2$DateTime, myData2$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")

## Upperright plot (row 1, col 2)
plot(myData2$DateTime, myData2$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")

## Lowerleft plot (row 2, col 1)
with(myData2, {
        plot(Sub_metering_1~DateTime, type = "l", ylab = "Energy sub metering", xlab = "")
        lines(Sub_metering_2~DateTime, col = "red")
        lines(Sub_metering_3~DateTime, col = "blue")
})
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Lowerright plot (row 2, col 2)
plot(myData2$DateTime, myData2$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")


## Save plot to a PNG device by closing the PNG device.
## The following line is not used unless graphic device is the screen, in which case PNG line above must be comment out.
##dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off()