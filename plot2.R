#' @title "Plot 2"
#' @description Histogram of watts consumption
#' 
#' @author Javier Gonzalez<javier.gonzalez.grandez@gmail.com>
#' 
#
require(dtplyr)
require(lubridate)

plot2 <- function(fileName = "household_sample.txt") {
    
    # load data and extract period interval
    df = read.csv(fileName, sep=";", head=T, na.strings = "?")
    df$DT <- strptime(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S")
    df <- subset(df, DT > ymd("2007-01-31") & DT < ymd("2007-03-01"))
    
    # Plot the data
    with(df, plot(DT, Global_active_power, type = "l", ylab="Global Active Power (kilowatts)", xlab=""))
    
    dev.copy(png,filename="plot2.png")
    dev.off()
}