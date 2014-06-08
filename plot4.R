
# Download, unzip and read the data
download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "household_power_consumption.zip")
unzip("household_power_consumption.zip")
datos=read.table("household_power_consumption.txt",na.strings = "?",header=TRUE,sep=";",stringsAsFactors=FALSE)

# Get date-time
time=strptime(paste(datos$Date,datos$Time),format="%d/%m/%Y %H:%M:%S")

# Subset
datos=subset(datos, time>=strptime("1/2/2007",format="%d/%m/%Y") & time<=strptime("3/2/2007",format="%d/%m/%Y"))
time=subset(time, time>=strptime("1/2/2007",format="%d/%m/%Y") & time<=strptime("3/2/2007",format="%d/%m/%Y"))

# plot 4
png("plot4.png")
par(mfrow=c(2,2))
plot(time,datos[,3],type="l",ylab="Global Active Power (kilowatts)",xlab="")
plot(time,datos$Voltage,type="l",ylab="Voltage",xlab="datetime")
plot(time,datos[,7],type="l",xlab="",ylab="Energy sub metering")
lines(time,datos[,8],type="l",col="red")
lines(time,datos[,9],type="l",col="blue")
legend(time[800],39,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=c(1,1,1),box.lty=0)
plot(time,datos$Global_reactive_power,type="l",ylab="Global_reactive_powe",xlab="datetime")
dev.off()


