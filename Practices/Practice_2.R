#Functions

#Practice find 20 more functions in R and make an example of it.

#These are the following 20 functions found in RStudio:

#abs() # - Compute the absolute value of a numeric data object.
x <- c(-5, 9, 3, -1, 2) 
x_abs <- abs(x)
x_abs

#all() # - Check whether all values of a logical vector are TRUE.
x1 <- c(1,5,3,-3, 5,-7,8)
all(x1 < 0) #Output must be FALSE

#any() # - Check whether any values of a logical vector are TRUE.
#Using the same vector in X1
#x1 <- c(1,5,3,-3, 5,-7,8)
any(x1 > 0) #Output must be TRUE

#as.Date() - Convert character strings to Date class.
my_date <- "2021-09-20"
my_date #Print example date
class(my_date) #Checking class of example date, will be STRING
my_newdate <- as.Date(my_date) #Converting to Date
my_newdate #Printing date
class(my_newdate) #Checking class to prove it's Date

#as.double() – Convert integer to double class.
x2 <- 1:5  #Using same vector X
x2 #Print X Vector
x2_double <- as.double(x2) #Convert to Double
x2_double #Printing, output will look the same
is.double(x2) #Will output false
is.double(x2_double) #will output true

#barplot() # – Create a barplot.
barvalues <- c(0.4, 0.75, 0.2, 0.6, 0.5) #Create values for barplot
bargroup <- letters[1:5]
barplot(barvalues, col = "#3DE784", horiz = TRUE, names.arg = bargroup)

#break() #– Break for-loop in R.
for(i in 1:5) {                     # Basic for-loop
  if(i == 3) {
    break                           #Break in step 3
  }
  print(paste("This is step", i))
}

#match() # - Return position of first match between two data objects.
m_example <- c(2, 5, 7, 5, 1) # Create example vector
match(5, m_example) #Value returned will be 2, which is the position in which match was found.

#mean() # – Compute the arithmetic mean.
#Using x1 vector as example
mean(x1) #Apply mean to X1 vector

#max() # – Compute the maximum value of a vector or column.
#Using x1 vector as example
max(x1) #Apply max to X1 vector

#min() # – Compute the minimum value of a vector or column.
#Using x1 vector as example
min(x1) #Apply min to X1 vector

#julian() # – Return the number of days between two date objects.
date1 <- "2020-01-21" #Set date as string
newdate1 <- as.Date(date1) #Convert date string as Date
date2 <- "2021-10-09" #Set Date as String
newdate2 <- as.Date(date2) #Convert date string as Date
julian(newdate2, origin = newdate1) #Difference in days is 627

#hist() # - Create histogram.
rivers #Run this dataset in R to check data, this is an already available dataset in R
hist(rivers, main = "Length of Rivers in NA", col = "#3DE784", breaks = 50) #Apply histogram.

#colSums() # – Compute the sum of each column of a numeric data frame, matrix or array.
set.seed(1234)                                          # Set seed
data <- data.frame(matrix(round(runif(12, 1, 20)),      # Create example data
                          nrow = 3, ncol = 4))
data                                                    # Print data to RStudio console
colSums(data)                                           #Apply Colsums

#colMeans() # - Compute the mean of each column of a numeric data frame, matrix or array.
#Using same data as colsums
colMeans(data)  

#rowSums() # - Compute the sum of each row of a numeric data frame, matrix or array.
#Using same data as colsums
rowSums(data)  

#rowMeans() # - Compute the mean of each row of a numeric data frame, matrix or array.
#Using same data as colsums
rowMeans(data)  

#set.seed() # - Set a random seed.
set.seed(12345)        # Set seed for reproducibility
rpois(5, 3)            # Generate random numbers with seed

#sort() # - Return input in ascending or descending order.
#Using X vector x <- c(-5, 9, 3, -1, 2) 
sort(x) #Apply Sort 

#unique() # - Remove duplicates from data objects.
vec <- c(1, 3, 3, 1, 4, 7, 1) 
vec_unique <- unique(vec) # Apply unique() to vector
vec_unique 