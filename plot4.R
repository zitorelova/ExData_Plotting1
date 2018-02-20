#Load libraries
library(dplyr)

#Read in the data
df <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors = FALSE)

#Process the data
df <- df %>% filter(Date == '1/2/2007' | Date == '2/2/2007') %>% mutate(DateTime = as.POSIXct(paste(Date, Time), format='%d/%m/%Y %H:%M:%S'), 
                                                                      Global_active_power = as.numeric(Global_active_power),
                                                                      Voltage = as.numeric(Voltage), Global_reactive_power = as.numeric(Global_reactive_power))

#Create plot
png("plot4.png", width=480, height=480)

#Plot the data
par(mfrow = c(2, 2), mar = c(4,4,2,1))
with(df, {
     plot(DateTime, Global_active_power, type='l', ylab='Global Active Power (kilowatts)', xlab='')
     plot(DateTime, Voltage, type='l', xlab='datetime', ylab='Voltage')
     plot(DateTime, Sub_metering_1, type='l', ylab='Energy sub metering', xlab='')
     lines(df$DateTime, df$Sub_metering_2, col='red')
     lines(df$DateTime, df$Sub_metering_3, col='blue')
     legend("topright", pch = '___', col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty='n')
     plot(DateTime, Global_reactive_power, type='l', xlab='datetime', ylab='Global_reactive_power')
})

#Save the plot
dev.off()

     