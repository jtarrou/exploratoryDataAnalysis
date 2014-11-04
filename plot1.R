# Code for Exploratory Data Analysis Proj. 1 Plot 1
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
