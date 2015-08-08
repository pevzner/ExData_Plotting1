plot2 <- function() {
	## Read the data. Get the first row to get column names, then get the 2,880 rows
	## starting at row 66,637, since these are the rows corresponding to 2007-02-01 and 2007-02-02.
	colnames=read.table("household_power_consumption.txt",nrows=1,sep=";",colClasses="character")
	powerset <- read.table("household_power_consumption.txt", skip=66637, nrows=2880, sep=";", col.names=as.vector(colnames[1,]), na.strings="?")
	
	## Combine the Date and Time columns into a new POSIX DateAndTime column. This will give us
	## the Thu-Fri-Sat ticks for the x-axis.
	powerset$DateAndTime<-strptime(paste(as.character(powerset$Date),as.character(powerset$Time)),"%d/%m/%Y %H:%M:%S")
	
	## Create a line graph showing how Global Active Power changes over time, and send it to 
	## the png file device.
	png(filename="plot2.png")
	plot(powerset$DateAndTime,powerset$Global_active_power,ylab="Global Active Power (kilowatts)",xlab="",type="l")
	dev.off()
}