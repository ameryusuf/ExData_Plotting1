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

## Plot the graph to plot2.png file
x<-plotdata$DateTime
y<-plotdata$Global_active_power

png("./data/ExData_Plotting1/plot2.png", width = 480, height = 480)

plot(x, y, type = "l", ylab = "Global Active Power (kilowatts)")

dev.off()
