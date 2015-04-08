#First we have to load the packages for filter data. this line is optional if you have the 
#packages installed
install.packages("sqldf")
#After that we load the library
library(sqldf) 
#We load data from file with the next commands
myfile <- file("household_power_consumption.txt") 
DF <- sqldf("select * from myfile where Date = '1/2/2007' or Date = '2/2/2007'", file.format = list(sep = ";"))
#we create the device png
png("plot1.png", width = 480, height = 480,units = "px")
#now we have the data in object DF. then we generate the histogram.
hist(DF$Global_active_power, col="red", main="Global Acive Power", xlab = "Global Acive Power(Kilowats)")
#finally we have to close de dev
dev.off()
