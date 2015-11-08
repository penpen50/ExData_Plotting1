#############Plot 4

dataset_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(dataset_url, "power.zip")
unzip("power.zip", exdir = "power")

list.files("power")

mydata = read.table("power/household_power_consumption.txt",sep=";", dec = ".",stringsAsFactors=F,header=T)


subset=mydata[mydata$Date %in% c("1/2/2007","2/2/2007") ,]

#Create Plot
png(file="plot4.png", width=480, height=480)
par(mfrow = c(2, 2))

#1
Global_active=as.numeric(subset$Global_active_power)
plot(DT,Global_active,type="l", xlab=" ",ylab="Global Active Power (kilowatts)")

#2
Voltage=as.numeric(subset$Voltage)
plot(DT,Voltage,type="l", xlab="datetime",ylab="Voltage")

#3
Sub1=as.numeric(Sub_metering_1)
Sub2=as.numeric(Sub_metering_2)
Sub3=as.numeric(Sub_metering_3)


plot(DT,Sub1,type="l", xlab=" ",ylab="Energy sub metering")
lines(DT,Sub2,type="l", col="red")
lines(DT,Sub3,type="l", col="blue")
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#4
Reactive=as.numeric(subset$Global_reactive_power)
plot(DT,Reactive,type="l", xlab="datetime",ylab="Global_reactive_power")

dev.off()
