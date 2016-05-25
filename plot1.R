# plot1.R: Script for plotting the global active power from the
# dataset on individual household electrinc power consumption
# on 1st and 2nd of February 2007

# Script should be run from the folder in which the raw data file
# (household_power_consumption.txt) is located

# This will plot the histogram of global active power

plot1 <- function(){
    library(dplyr)
    # Read and subset data
    filepath = './household_power_consumption.txt'
    data = read.table(filepath, sep = ';', na.strings = '?', header = TRUE)
    data$DateTime <- as.POSIXct(strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S"))
    to_plot = data[data$Date %in% c('1/2/2007', '2/2/2007'), ]
    
    # Open PNG device
    png('plot1.png', height = 480, width = 480, bg = 'transparent')
    # Generate histogram
    hist(to_plot$Global_active_power, col = 'red', main = 'Global Active Power', xlab = 'Global Active Power (kilowatts)')
    # Close device
    dev.off()
}