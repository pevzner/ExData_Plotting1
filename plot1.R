plot1 <- function() {
	## Read the data. Get the first row to get column names, then get the 2,880 rows
	## starting at row 66,637, since these are the rows corresponding to 2007-02-01 and 2007-02-02.
	colnames=read.table("household_power_consumption.txt",nrows=1,sep=";",colClasses="character")
	powerset <- read.table("household_power_consumption.txt", skip=66637, nrows=2880, sep=";", col.names=as.vector(colnames[1,]), na.strings="?")
	
	## Create the red Global Active Power histogram from the first image in the homework assignment,
	## and send it to the png file device.
	png(filename="plot1.png")
	hist(powerset$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
	dev.off()
}