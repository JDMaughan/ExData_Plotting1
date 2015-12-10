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
