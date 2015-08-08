plot4 <- function() {
	## Read the data. Get the first row to get column names, then get the 2,880 rows
	## starting at row 66,637, since these are the rows corresponding to 2007-02-01 and 2007-02-02.
	colnames=read.table("household_power_consumption.txt",nrows=1,sep=";",colClasses="character")
	powerset <- read.table("household_power_consumption.txt", skip=66637, nrows=2880, sep=";", col.names=as.vector(colnames[1,]), na.strings="?")
	
	## Combine the Date and Time columns into a new POSIX DateAndTime column. This will give us
	## the Thu-Fri-Sat ticks for the x-axis.
	powerset$DateAndTime<-strptime(paste(as.character(powerset$Date),as.character(powerset$Time)),"%d/%m/%Y %H:%M:%S")
	
	## Set the device to display 4 plots in a 2x2 arrangement. Then add the 4 plots shown in the
	## 4th image of the assignment ()3 black line graphs, and the one multi-colored one)
	## in the proper order. Send this to the png file device.
	png(filename="plot4.png")
	par(mfrow=c(2,2))
	
	plot(powerset$DateAndTime,powerset$Global_active_power,ylab="Global Active Power",xlab="",type="l")
	plot(powerset$DateAndTime,powerset$Voltage,ylab="Voltage",xlab="datetime",type="l")
	
	plot(powerset$DateAndTime,powerset$Sub_metering_1,ylab="Energy sub metering",xlab="",type="n")
	lines(powerset$DateAndTime,powerset$Sub_metering_1,col="black")
	lines(powerset$DateAndTime,powerset$Sub_metering_2,col="red")
	lines(powerset$DateAndTime,powerset$Sub_metering_3,col="blue")
	legend("topright", lty=c(1,1,1), col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),bty="n")

	plot(powerset$DateAndTime,powerset$Global_reactive_power, ylab="Global_reactive_power", xlab="datetime", type="l")

	dev.off()
}