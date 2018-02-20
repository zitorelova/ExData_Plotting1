#Load libraries
library(dplyr)

#Read in the data
df <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors = FALSE)

#Process the data
df <- df %>% filter(Date == '1/2/2007' | Date == '2/2/2007') %>% mutate(DateTime = as.POSIXct(paste(Date, Time), format='%d/%m/%Y %H:%M:%S'))

#Create plot
png("plot2.png", width=480, height=480)

#Plot the data
with(df, plot(DateTime, Global_active_power, type='l', ylab='Global Active Power (kilowatts)', xlab=''))

#Save the plot
dev.off()
