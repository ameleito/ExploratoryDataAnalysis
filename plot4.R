#First we have to load the packages for filter data. this line is optional if you have the 
#packages installed
#install.packages("sqldf")
#After that we load the library
library(sqldf) 
#We load data from file with the next commands
myfile <- file("household_power_consumption.txt") 
DF <- sqldf("select * from myfile where Date = '1/2/2007' or Date = '2/2/2007'", file.format = list(sep = ";"))
#we create the device png
png("plot4.png", width = 480, height = 480,units = "px")
#add the parameter.
par(mfrow = c(2,2))
#Add the first plot
plot(DF$Global_active_power,  xaxt = "n",type="l", xlab="", ylab="Global Active Power (kilowatts)", main=NULL)
#add axis to plot.
axis(1,at = c(1,1400,2800), labels=c("Thu","Fri","Sat"))
#Add the second plot
plot(DF$Voltage,  xaxt = "n",type="l", xlab="datetime", ylab="Voltage", main=NULL)
#add axis to plot.
axis(1,at = c(1,1400,2800), labels=c("Thu","Fri","Sat"))
#now we have the data in object DF. then we generate the histogram.
plot(DF$Sub_metering_1,  xaxt = "n",type="l", xlab="", ylab="Energy sub metering", main=NULL)
#add the points for Sub_metering_2
points(DF$Sub_metering_2, col="red", type="l")
#add the points for Sub_metering_3
points(DF$Sub_metering_3, col="blue", type="l")
#add axis to plot.
axis(1,at = c(1,1400,2800), labels=c("Thu","Fri","Sat"))
#Add the legend to the plot
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1),lwd=c(2.5,2.5,2.5),col=c("black","red","blue"),cex=0.35)
#
plot(DF$Global_reactive_power,  xaxt = "n",type="l", xlab="datetime", ylab="Global_reactive_power", main=NULL)
#add axis to plot.
axis(1,at = c(1,1400,2800), labels=c("Thu","Fri","Sat"))
#finally we have to close de dev
dev.off()
