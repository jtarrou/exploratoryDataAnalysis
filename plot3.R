# Code for Exploratory Data Analysis Proj. 1 Plot 3
# Same code at the start of plot1 and plot2, 

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
