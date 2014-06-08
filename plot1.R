
# Download, unzip and read the data
download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "household_power_consumption.zip")
unzip("household_power_consumption.zip")
datos=read.table("household_power_consumption.txt",na.strings = "?",header=TRUE,sep=";",stringsAsFactors=FALSE)

# Get date-time
time=strptime(paste(datos$Date,datos$Time),format="%d/%m/%Y %H:%M:%S")

# Subset
datos=subset(datos, time>=strptime("1/2/2007",format="%d/%m/%Y") & time<=strptime("3/2/2007",format="%d/%m/%Y"))

#Histogram
png("plot1.png")
hist(datos[,3],main="Global Active Power",xlab="Global Active Power (kilowatts)",col="red")    
dev.off()
