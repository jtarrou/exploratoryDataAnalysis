# Code for Exploratory Data Analysis Proj. 1 Plot 4
# Same code at the start of rest of plots

# The data are saved in my Coursera working directory
# First read the data
myData <- read.csv("./power_cons/h_P_C.txt", header=TRUE, sep=";", na.strings="?", nrows=2075259, check.names=FALSE, stringsAsFactors=FALSE, comment.char= "", quote='\"')

# use as.Date to set $Date variable 
myData$Date <- as.Date(myData$Date, format="%d/%m/%Y")

# get the dates required for the project: Feb. 1-2, 2007
data_for_Dates <- subset(myData, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

# paste date and time
dateTime <- paste(as.Date(data_for_Dates$Date), data_for_Dates$Time)

# the subset, use POSIXct to make sure objects in data_for_Dates$Datetime are proper class
data_for_Dates$Datetime <- as.POSIXct(dateTime)

# set up final plot with 4 sub-plots, combining them with par() function
## might also use layout() function http://www.statmethods.net/advgraphs/layout.html
par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))
with(data_for_Dates, {
    
	# top right plot
	plot(Global_active_power ~ Datetime, type = "l", xlab = "", ylab="Global Active Power (kilowatts)")
    
	# top left plot
	plot(Voltage ~ Datetime, type = "l", xlab = "", ylab = "Voltage (volt)")
    
	# bottom left plot 
	plot(Sub_metering_1 ~ Datetime, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
    lines(Sub_metering_2 ~ Datetime, col = "Red")
    lines(Sub_metering_3 ~ Datetime, col = "Blue")
    legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, bty = "n", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    
	# bottom right plot
	plot(Global_reactive_power ~ Datetime, type = "l", xlab = "", ylab = "Global Rective Power (kilowatts)")
})

# save to file as per directions 
dev.copy(png, "plot4.png", width=480, height=480)
dev.off()
