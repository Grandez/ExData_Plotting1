#' @title "Plot 4"
#' @description Multiple plots 
#' 
#' @author Javier Gonzalez<javier.gonzalez.grandez@gmail.com>
#' 
#
require(dtplyr)
require(lubridate)

plot4 <- function(fileName = "household_sample.txt") {
    
    # load data and extract period interval
    df = read.csv(fileName, sep=";", head=T, na.strings = "?")
    df$DT <- strptime(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S")
    df <- subset(df, DT > ymd("2007-01-31") & DT < ymd("2007-03-01"))
     
    # Adjust margins
    par(mfrow=c(2,2), mar=c(2,4,2,3))
    
    # Plot the first graph
    with(df, plot(DT, Global_active_power, type = "l", ylab="Global Active Power", xlab=""))
    
    # Plot the second one
    with(df, plot(DT, Voltage, type = "l", ylab="Voltage", xlab=""))
    
    # Plot the third one
    with(df, plot(DT, Sub_metering_1, type="l", xlab = "", ylab="Energy sub metering"))
    with(df, points(DT, Sub_metering_2, type="l", col="red"))
    with(df, points(DT, Sub_metering_3, type="l", col="blue"))  
    
    legend("topright"
           ,legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
           , col=c("black","red", "blue")
           ,pch="_")

    # Plot the last one
    with(df, plot(DT, Global_reactive_power, type = "l", ylab="Global Reactive Power", xlab=""))

 
    dev.copy(png, filename="plot4.png", width=480, height=480)
    dev.off()
}