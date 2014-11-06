# Code for Exploratory Data Analysis Proj. 1 
# You can load this code to R and run all four of your desired plots provided you have the data in your working directory
# The data are saved in my Coursera working directory
# First read the data
myData <- read.csv("./power_cons/h_P_C.txt", header=TRUE, sep=";", na.strings="?", nrows=2075259, check.names=FALSE, stringsAsFactors=FALSE, comment.char= "", quote='\"')

# let R know what you mean by Dates 
myData$Date <- as.Date(myData$Date, format="%d/%m/%Y")

# get the dates required for the project: Feb. 1-2, 2007
data_for_Dates <- subset(myData, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

# paste date and time
dateTime <- paste(as.Date(data_for_Dates$Date), data_for_Dates$Time)

# the subset, use POSIXct to make sure objects in data_for_Dates$Datetime are proper class
data_for_Dates$Datetime <- as.POSIXct(dateTime)

# get histogram plot
hist(data_for_Dates$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

# save file as directed 	 
dev.copy(png, "plot1.png", width=480, height=480)
dev.off()

######################################

# get line plot
plot(data_for_Dates$Global_active_power ~ data_for_Dates$Datetime, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)") 

# save file as directed 	 
dev.copy(png, "plot2.png", width=480, height=480)
dev.off()

#######################################

# use with for plotting expression: with(x, expr) where x is our dataframe or list and expr evaluates contents of x
## here plot is the expression applied to the following three variables on the given dates 
with(data_for_Dates, {
     plot(Sub_metering_1 ~ Datetime, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
     lines(Sub_metering_2 ~ Datetime, col = "Red")
     lines(Sub_metering_3 ~ Datetime, col = "Blue")
})
# insert legend into upper right-hand corner of plot
legend("topright", col = c("black", "red", "blue"), lty=1, lwd=2, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# send to file as instructed
dev.copy(png, "plot3.png", width=480, height=480)
dev.off()

########################################

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
