# plot4.R: Script for plotting several parameters from the
# dataset on individual household electrinc power consumption
# on 1st and 2nd of February 2007

# Script should be run from the folder in which the raw data file
# (household_power_consumption.txt) is located

# This will generate a 2 x 2 figure with plots of
#   1. Global active power
#   2. Voltage
#   3. Submetering (3 lines)
#   4. Global reactive power

plot4 <- function(){
    library(dplyr)
    # Read and subset data, convert dates to date classes
    filepath = './household_power_consumption.txt'
    data = read.table(filepath, sep = ';', na.strings = '?', header = TRUE)
    data$DateTime <- as.POSIXct(strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S"))
    to_plot = data[data$Date %in% c('1/2/2007', '2/2/2007'), ]
    
    # Open PNG device
    png('plot4.png', height = 480, width = 480, bg = 'transparent')
    
    # Set plot parameters
    par(mfrow=c(2, 2), cex=2/3)
    
    # Plot global active power
    plot(to_plot$DateTime, to_plot$Global_active_power, type='l', xlab='', ylab='Global Active Power')
    
    # Plot voltage
    plot(to_plot$DateTime, to_plot$Voltage, type='l', xlab='', ylab='Voltage')
    
    # Plot energy sub metering
    with(to_plot, plot(DateTime, Sub_metering_1, type='l', xlab='', ylab='Energy sub metering'))
    with(to_plot, lines(DateTime, Sub_metering_2, type='l', xlab='', ylab='Energy sub metering', col='red'))
    with(to_plot, lines(DateTime, Sub_metering_3, type='l', xlab='', ylab='Energy sub metering', col='blue'))
    legend('topright', col=c('black', 'red', 'blue'), legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lwd=1, bty='n')
    
    # Plot global reactive power
    plot(to_plot$DateTime, to_plot$Global_reactive_power, type='l', xlab='', ylab='Global reactive power')
    
    # Turn off device
    dev.off()
}
