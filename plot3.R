#' @title "Plot 3"
#' @description Compare sub metering
#' 
#' @author Javier Gonzalez<javier.gonzalez.grandez@gmail.com>
#' 
#
require(dtplyr)
require(lubridate)

plot3 <- function(fileName = "household_sample.txt") {
    
    # load data and extract period interval
    df = read.csv(fileName, sep=";", head=T, na.strings = "?")
    df$DT <- strptime(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S")
    df <- subset(df, DT > ymd("2007-01-31") & DT < ymd("2007-03-01"))
    
    # Plot the data
    with(df, plot(DT, Sub_metering_1, type="l", xlab = "", ylab="Energy sub metering"))
    with(df, points(DT, Sub_metering_2, type="l", col="red"))
    with(df, points(DT, Sub_metering_3, type="l", col="blue"))  
    
    legend("topright"
           ,legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
           , col=c("black","red", "blue")
           ,pch="_")
    
    dev.copy(png, filename="plot3.png")
    dev.off()
    

}