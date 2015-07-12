## Download the zip file from the url

url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

if(!file.exists("./data/Electric Power Consumption.zip")){
  
  download.file(url, destfile = "./data/Electric Power Consumption.zip", method = "internal")
  unzip("./data/Electric Power Consumption.zip", exdir = "./data")
  
}


## Load the dataset into R using the read.table function
powercon<-read.table("./data/household_power_consumption.txt", sep =";", header = TRUE, na.strings = "?")

## Recall the lubridate package by using the library function
library(lubridate)

## Convert Date and Time to POSIXct & Period format using the dmy and hms functions
powercon$Date<-dmy(powercon$Date)
powercon$Time<-hms(powercon$Time)


##Subset the dataset for the two February dates
date1<-as.POSIXct("2007-02-01")
date2<-as.POSIXct("2007-02-03")
plotdata<-subset(powercon, Date >= date1 & Date <= date2)

## Combine the Date and Time columns and add a new column 'DateTime' to the dataframe
plotdata$DateTime<-plotdata$Date+plotdata$Time

## Set the variables to be used in plotting
x<-plotdata$DateTime
u<-plotdata$Global_active_power
v<-plotdata$Voltage
w<-plotdata$Global_reactive_power

y1<-plotdata$Sub_metering_1
y2<-plotdata$Sub_metering_2
y3<-plotdata$Sub_metering_3

## Set the mfrow attribute in par() function to a 2 row by 2 column canvas
par(mfrow = c(2,2))


## Plot the first graph 
plot(x, u, type = "l", ylab = "Global Active Power (kilowatts)", xlab="")

## Plot the second graph
plot(x, v, type = "l",  xlab="datetime", ylab = "Voltage")

## Plot the third graph
plot(x, y1, type = "l", ylab = "Energy sub metering", xlab="")
points(x, y2, type = "l", xlab = "", ylab = "Energy sub metering", col = "red")
points(x, y3, type = "l", xlab = "", ylab = "Energy sub metering", col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Plot the fourth graph
plot(x, w, type = "l",  xlab="datetime", ylab = "Global_reactive_power")

dev.copy(png, "./data/ExData_Plotting1/plot4.png", width = 480, height = 480)

dev.off()
