#' @title "Plot 1"
#' @description Histogram of watts consumption
#' 
#' @author Javier Gonzalez<javier.gonzalez.grandez@gmail.com>
#' 
#
require(dtplyr)
require(lubridate)

plot1 <- function(fileName = "household_sample.txt") {
    
    # load data and extract period interval
    df = read.csv(fileName, sep=";", head=T, na.strings = "?")
    df$DT <- strptime(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S")
    df <- subset(df, DT > ymd("2007-01-31") & DT < ymd("2007-03-01"))
    
    # Plot the histogram
    hist(df$Global_active_power, col="red"
                               , main="Global Active Power"
                               , xlab="Global Active Power (kilowatts")
    dev.copy(png, filename="plot1.png")
    dev.off()
}