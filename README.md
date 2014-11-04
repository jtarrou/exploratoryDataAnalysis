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
