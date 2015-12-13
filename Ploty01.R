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

png("plot1.png", width = 480, height = 480, units = "px", bg = "white")
par(mar= c(4, 4, 2, 1))
hist(powerdf$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red")
dev.off()
