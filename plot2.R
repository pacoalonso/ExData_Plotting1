
# Download, unzip and read the data
download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "household_power_consumption.zip")
unzip("household_power_consumption.zip")
datos=read.table("household_power_consumption.txt",na.strings = "?",header=TRUE,sep=";",stringsAsFactors=FALSE)

# Get date-time
time=strptime(paste(datos$Date,datos$Time),format="%d/%m/%Y %H:%M:%S")

# Subset
datos=subset(datos, time>=strptime("1/2/2007",format="%d/%m/%Y") & time<=strptime("3/2/2007",format="%d/%m/%Y"))
time=subset(time, time>=strptime("1/2/2007",format="%d/%m/%Y") & time<=strptime("3/2/2007",format="%d/%m/%Y"))


# Plot 2:  Weekdays in Spanish. Do not blame me, blame my locale! :-)
png("plot2.png")
plot(time,datos[,3],type="l",ylab="Global Active Power (kilowatts)",xlab="")
dev.off()

