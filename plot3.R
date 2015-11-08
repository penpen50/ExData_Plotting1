#############Plot 3

dataset_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(dataset_url, "power.zip")
unzip("power.zip", exdir = "power")

list.files("power")

mydata = read.table("power/household_power_consumption.txt",sep=";", dec = ".",stringsAsFactors=F,header=T)


subset=mydata[mydata$Date %in% c("1/2/2007","2/2/2007") ,]

#Create Plot
Sub1=as.numeric(Sub_metering_1)
Sub2=as.numeric(Sub_metering_2)
Sub3=as.numeric(Sub_metering_3)

class(Sub1)

png(file="plot3.png", width=480, height=480)
plot(DT,Sub1,type="l", xlab=" ",ylab="Energy sub metering")
lines(DT,Sub2,type="l", col="red")
lines(DT,Sub3,type="l", col="blue")
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
