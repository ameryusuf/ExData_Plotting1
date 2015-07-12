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

## Plot the graph to plot3.png file with the three Sub_metering columns and the legend in the top right corner
x<-plotdata$DateTime
y1<-plotdata$Sub_metering_1
y2<-plotdata$Sub_metering_2
y3<-plotdata$Sub_metering_3
  
png("./data/ExData_Plotting1/plot3.png", width = 480, height = 480)

plot(x, y1, type = "l", ylab = "Energy sub metering", xlab="")

points(x, y2, type = "l", xlab = "", ylab = "Energy sub metering", col = "red")
points(x, y3, type = "l", xlab = "", ylab = "Energy sub metering", col = "blue")

legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
