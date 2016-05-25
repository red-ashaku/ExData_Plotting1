# plot3.R: Script for plotting energy submetering from the
# dataset on individual household electrinc power consumption
# on 1st and 2nd of February 2007

# Script should be run from the folder in which the raw data file
# (household_power_consumption.txt) is located

# This will generate line plot of energy submetering

plot3 <- function(){
    library(dplyr)
    # Read and subset data, convert dates to date classes
    filepath = './household_power_consumption.txt'
    data = read.table(filepath, sep = ';', na.strings = '?', header = TRUE)
    data$DateTime <- as.POSIXct(strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S"))
    to_plot = data[data$Date %in% c('1/2/2007', '2/2/2007'), ]
    
    # Open PNG device
    png('plot3.png', height = 480, width = 480, bg = 'transparent')
    
    # Plot energy sub metering
    with(to_plot, plot(DateTime, Sub_metering_1, type='l', xlab='', ylab='Energy sub metering'))
    with(to_plot, lines(DateTime, Sub_metering_2, type='l', xlab='', ylab='Energy sub metering', col='red'))
    with(to_plot, lines(DateTime, Sub_metering_3, type='l', xlab='', ylab='Energy sub metering', col='blue'))
    legend('topright', col=c('black', 'red', 'blue'), legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lwd=1)
    
    # Turn off device
    dev.off()
}
