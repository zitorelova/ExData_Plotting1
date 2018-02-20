library(dplyr)
df <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors = FALSE)
df <- df %>% filter(Date == '1/2/2007' | Date == '2/2/2007') %>% mutate(DateTime = as.POSIXct(paste(Date, Time), format='%d/%m/%Y %H:%M:%S'))
with(df, plot(DateTime, Global_active_power, type='l', ylab='Global Active Power (kilowatts)', xlab=''))
