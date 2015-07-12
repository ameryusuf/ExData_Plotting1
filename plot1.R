
## Download the zip file from the url
url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, destfile = "./data/Electric Power Consumption.zip", method = "internal")

## Unzip the contents of the file to the working directory
unzip("./data/Electric Power Consumption.zip", exdir = "./data")

## Load the dataset into R using the read.table function
powercon<-read.table("./data/household_power_consumption.txt", sep =";", header = TRUE)

##
