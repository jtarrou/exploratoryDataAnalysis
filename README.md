exploratoryDataAnalysis
=======================
repo for projects on EDA
######################

First project uses a large data set, but we only need a certain limited timeframe for the ploting we are asked to do on the project. Initially I downloaded and saved the dataset in the working directory I use for coursera under the subfolder "./power_cons" 
The data are saved as a text file: "h_P_C.txt"

The data are read into a file using read.csv()

Next, R is instructed as to what we mean when we want to call a piece of information a date. using as.Date()

Then we subset the data so we don't have to deal with such a large data set using subset() and specifying a date range

The Date and Time variables are pasted together using paste() then given appropriate classes using POSIXct.
#######################

The plots are as follows:
  1 Histogram
  2 Line Graph
  3 Multi-Variable Line Graph with Legend
  4 Combined Layout Displaying 4 Plots
#######################

The primary functions used to combine variables, and later plots are:
  with() which takes 2 arguments x and expression, where x is our data frame or list and expression is how you mean to directly inteact or evaluate variables within the data
  
  par() which can include the option mfrow=c(nrows, ncols) to create a matrix of nrows x ncols plots that are filled in by row. mfcol=c(nrows, ncols) fills in the matrix by columns.
#######################
  
These plots are all saved as .PNGs and named in order as per the directions
######################
There is a fully functioning code that will save to your wd all four .PNGs, but per instructions each of the code segments has been remade so that they are each fully functional individual code sets that will work so long as you give them the correct filepath.

#########################
Introduction

This assignment uses data from the UC Irvine Machine Learning Repository, a popular repository for machine learning datasets. In particular, we will be using the “Individual household electric power consumption Data Set” which I have made available on the course web site:

Dataset: Electric power consumption [20Mb]

Description: Measurements of electric power consumption in one household with a one-minute sampling rate over a period of almost 4 years. Different electrical quantities and some sub-metering values are available.

The following descriptions of the 9 variables in the dataset are taken from the UCI web site:

Date: Date in format dd/mm/yyyy
Time: time in format hh:mm:ss
Global_active_power: household global minute-averaged active power (in kilowatt)
Global_reactive_power: household global minute-averaged reactive power (in kilowatt)
Voltage: minute-averaged voltage (in volt)
Global_intensity: household global minute-averaged current intensity (in ampere)
Sub_metering_1: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered).
Sub_metering_2: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light.
Sub_metering_3: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.
Loading the data

When loading the dataset into R, please consider the following:

The dataset has 2,075,259 rows and 9 columns. First calculate a rough estimate of how much memory the dataset will require in memory before reading into R. Make sure your computer has enough memory (most modern computers should be fine).

We will only be using data from the dates 2007-02-01 and 2007-02-02. One alternative is to read the data from just those dates rather than reading in the entire dataset and subsetting to those dates.

You may find it useful to convert the Date and Time variables to Date/Time classes in R using the strptime() and as.Date() functions.

Note that in this dataset missing values are coded as ?.

Making Plots

Our overall goal here is simply to examine how household energy usage varies over a 2-day period in February, 2007. Your task is to reconstruct the following plots below, all of which were constructed using the base plotting system.

First you will need to fork and clone the following GitHub repository: https://github.com/rdpeng/ExData_Plotting1

For each plot you should

Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.

Name each of the plot files as plot1.png, plot2.png, etc.

Create a separate R code file (plot1.R, plot2.R, etc.) that constructs the corresponding plot, i.e. code in plot1.R constructs the plot1.png plot. Your code file should include code for reading the data so that the plot can be fully reproduced. You should also include the code that creates the PNG file.

Add the PNG file and R code file to your git repository

When you are finished with the assignment, push your git repository to GitHub so that the GitHub version of your repository is up to date. There should be four PNG files and four R code files.

The four plots that you will need to construct are shown below.

Plot 1

ExDataCP1Plot1.png

Plot 2

ExDataCP1Plot2.png

Plot 3

ExDataCP1Plot3.png

Plot 4

ExDataCP1Plot4.png
