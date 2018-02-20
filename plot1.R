#Load libraries
library(dplyr)

#Read in the data
df <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors = FALSE)

#Process the data
df <- df %>% filter(Date == '1/2/2007' | Date == '2/2/2007') %>% mutate(Date = as.Date(Date, format="%d/%m/%Y"), Global_active_power = as.numeric(Global_active_power))

#Create plot
png("plot1.png", width=480, height=480)

#Plot the data
hist(df$Global_active_power, col='red', main='Global Active Power', xlab='Global Active Power(kilowatts)', ylab='Frequency') 

#Save the plot
dev.off()
