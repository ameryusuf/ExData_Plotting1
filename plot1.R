
## Download the zip file from the url

url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

if(!file.exists("./data/Electric Power Consumption.zip")){

download.file(url, destfile = "./data/Electric Power Consumption.zip", method = "internal")
unzip("./data/Electric Power Consumption.zip", exdir = "./data")

}


## Load the dataset into R using the read.table function
powercon<-read.table("./data/household_power_consumption.txt", sep =";", header = TRUE, na.strings = "?")


## Convert Date and Time to Date & Time format
powercon$Date<-as.Date(powercon$Date, "%m/%d/%Y")



##Subset the dataset for the two February dates
date1<-as.Date("2007-02-01")
date2<-as.Date("2007-02-02")
plotdata<-subset(powercon, Date >= date1 & Date <= date2)

## Plot the graph to plot1.png file
x<-plotdata$Global_active_power
png("./data/ExData_Plotting1/plot1.png", width = 480, height = 480)

hist(x, col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylim = c(0,1200), xlim = c(0,6), xaxp = c(0,6,3))

dev.off()

