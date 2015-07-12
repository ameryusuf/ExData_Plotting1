## Download the zip file from the url

url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

if(!file.exists("./data/Electric Power Consumption.zip")){
  
  download.file(url, destfile = "./data/Electric Power Consumption.zip", method = "internal")
  unzip("./data/Electric Power Consumption.zip", exdir = "./data")
  
}


## Load the dataset into R using the read.table function
powercon<-read.csv("./data/household_power_consumption.txt", sep =";", header = TRUE, na.strings = "?", stringsAsFactors = FALSE)

## Convert Date and Time to Date & Time format
powercon$Date<-as.Date(powercon$Date, "%m/%d/%Y")
powercon$Time<-strptime(powercon$Time, "%H:%M:%S")


##Subset the dataset for the two February dates
date1<-as.Date("2007-02-01")
date2<-as.Date("2007-02-02")
plotdata<-subset(powercon, Date >= date1 & Date <= date2)

## Plot the graph to plot1.png file
x<-plotdata$Datetime
y<-plotdata$Global_active_power

png("./data/ExData_Plotting1/plot2.png", width = 480, height = 480)

plot(x, y, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

dev.off()
