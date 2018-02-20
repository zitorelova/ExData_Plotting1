library(dplyr)
df <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors = FALSE)
df <- df %>% filter(Date == '1/2/2007' | Date == '2/2/2007') %>% mutate(DateTime = as.POSIXct(paste(Date, Time), format='%d/%m/%Y %H:%M:%S'))
with(df, plot(DateTime, Sub_metering_1, type='l', ylab='Energy sub metering', xlab=''))
lines(df$DateTime, df$Sub_metering_2, col='red')
lines(df$DateTime, df$Sub_metering_3, col='blue')
legend("topright", pch = '___', col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))




