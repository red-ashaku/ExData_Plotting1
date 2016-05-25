# plot2.R: Script for plotting the global active power from the
# dataset on individual household electrinc power consumption
# on 1st and 2nd of February 2007

# Script should be run from the folder in which the raw data file
# (household_power_consumption.txt) is located

# This will plot global active power per timepoint as a line plot

plot2 <- function(){
    library(dplyr)
    # Read and subset data, convert dates to date classes
    filepath = './household_power_consumption.txt'
    data = read.table(filepath, sep = ';', na.strings = '?', header = TRUE)
    data$DateTime <- as.POSIXct(strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S"))
    to_plot = data[data$Date %in% c('1/2/2007', '2/2/2007'), ]
    
    # Open PNG device
    png('plot2.png', height = 480, width = 480, bg = 'transparent')
    # Generate plot
    plot(to_plot$DateTime, to_plot$Global_active_power, type='l', xlab='', ylab='Global Active Power (kilowatts)')
    # Close device
    dev.off()
}