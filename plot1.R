dataset_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(dataset_url, "power.zip")
unzip("power.zip", exdir = "power")

list.files("power")

mydata = read.table("power/household_power_consumption.txt",sep=";", dec = ".",stringsAsFactors=F,header=T)


subset=mydata[mydata$Date %in% c("1/2/2007","2/2/2007") ,]

#Create Plot
library(datasets)

Global_active=as.numeric(subset$Global_active_power)
png(file="plot1.png", width=480, height=480)
hist(Global_active,col="red",xlab="Global Active Power (kilowatts)")
dev.off()