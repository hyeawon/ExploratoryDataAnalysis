## data file (df) get a text file

df <- "household_power_consumption.txt"

## read text file into a power data file

powerdf<-read.table(df, header = FALSE, sep = ";", skip = 1, colClasses = c(rep("character",2), rep("numeric", 7)), na.strings = "?")

## read column names to cnames

cnames <- readLines(df, 1)

cnames <- strsplit(cnames, ";", fixed = TRUE)

names(powerdf) <- cnames[[1]]

## grep two days only 1/2/2007 and 2/2/2007

powerdf <- powerdf[powerdf$Date %in% c("1/2/2007", "2/2/2007"),]

powerdf$Date_Time <- paste(powerdf$Date, powerdf$Time)

powerdf$Date_Time<-strptime(powerdf$Date_Time, "%d/%m/%Y %H:%M:%S")

#str(subSetData)

png("plot3.png", width = 480, height = 480, units = "px", bg = "white")

plot(x = powerdf$Date_Time, y = powerdf$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering") 
lines(x = powerdf$Date_Time, y = powerdf$Sub_metering_1) 
lines(x = powerdf$Date_Time, y = powerdf$Sub_metering_2, col = "red") 
lines(x = powerdf$Date_Time, y = powerdf$Sub_metering_3, col = "blue") 
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black", "red", "blue")) 
dev.off()

