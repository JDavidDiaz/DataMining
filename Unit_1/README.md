# Data Mining Unit_1:

In the branch named _"Unit 1"_ we have the following practices:

## Index

[Practice_1](https://github.com/JDavidDiaz/DataMining/blob/Unit_1/Practices/Practice_1.R)

[Practice_2](https://github.com/JDavidDiaz/DataMining/blob/Unit_1/Practices/Practice_2.R)

[Practice_3](https://github.com/JDavidDiaz/DataMining/blob/Unit_1/Practices/Practice_3.R)


# Practice 1

Test the Law Of Large Numbers for N random normally distributed numbers with mean = 0, stdev=1:

Create an R script that will count how many of these numbers fall between -1 and 1 and divide
by the total quantity of N

E(X) = 68.2%

Instructions:
1. Initialize sample size
2. Initialize counter
3. loop for(i in rnorm(size))
4. Check if the iterated variable falls
5. Increase counter if the condition is true
6. return a result <- counter / N

## Code

```r
size <- 100000

counter <- 0

for (i in rnorm(size)) {
  if (i > -1 & i < 1) { 
    counter <- counter + 1 
  }
}

result <- (counter / size)
print(result)
```
# Practice 2

Functions

Practice find 20 more functions in R and make an example of it.

These are the following 20 functions found in RStudio:

## Code
```r
#abs() - Compute the absolute value of a numeric data object.
x <- c(-5, 9, 3, -1, 2) 
x_abs <- abs(x)
x_abs

#all() - Check whether all values of a logical vector are TRUE.
x1 <- c(1,5,3,-3, 5,-7,8)
all(x1 < 0) #Output must be FALSE

#any() - Check whether any values of a logical vector are TRUE.
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

#barplot() – Create a barplot.
barvalues <- c(0.4, 0.75, 0.2, 0.6, 0.5) #Create values for barplot
bargroup <- letters[1:5]
barplot(barvalues, col = "#3DE784", horiz = TRUE, names.arg = bargroup)

#break() – Break for-loop in R.
for(i in 1:5) {                     # Basic for-loop
  if(i == 3) {
    break                           #Break in step 3
  }
  print(paste("This is step", i))
}

#match() - Return position of first match between two data objects.
m_example <- c(2, 5, 7, 5, 1) # Create example vector
match(5, m_example) #Value returned will be 2, which is the position in which match was found.

#mean() – Compute the arithmetic mean.
#Using x1 vector as example
mean(x1) #Apply mean to X1 vector

#max() – Compute the maximum value of a vector or column.
#Using x1 vector as example
max(x1) #Apply max to X1 vector

#min() – Compute the minimum value of a vector or column.
#Using x1 vector as example
min(x1) #Apply min to X1 vector

#julian() – Return the number of days between two date objects.
date1 <- "2020-01-21" #Set date as string
newdate1 <- as.Date(date1) #Convert date string as Date
date2 <- "2021-10-09" #Set Date as String
newdate2 <- as.Date(date2) #Convert date string as Date
julian(newdate2, origin = newdate1) #Difference in days is 627

#hist() - Create histogram.
rivers #Run this dataset in R to check data, this is an already available dataset in R
hist(rivers, main = "Length of Rivers in NA", col = "#3DE784", breaks = 50) #Apply histogram.

#colSums() – Compute the sum of each column of a numeric data frame, matrix or array.
set.seed(1234)                                          # Set seed
data <- data.frame(matrix(round(runif(12, 1, 20)),      # Create example data
                          nrow = 3, ncol = 4))
data                                                    # Print data to RStudio console
colSums(data)                                           #Apply Colsums

#colMeans() - Compute the mean of each column of a numeric data frame, matrix or array.
#Using same data as colsums
colMeans(data)  

#rowSums() - Compute the sum of each row of a numeric data frame, matrix or array.
#Using same data as colsums
rowSums(data)  

#rowMeans() - Compute the mean of each row of a numeric data frame, matrix or array.
#Using same data as colsums
rowMeans(data)  

#set.seed() - Set a random seed.
set.seed(12345)        # Set seed for reproducibility
rpois(5, 3)            # Generate random numbers with seed

#sort() - Return input in ascending or descending order.
#Using X vector x <- c(-5, 9, 3, -1, 2) 
sort(x) #Apply Sort 

#unique() - Remove duplicates from data objects.
vec <- c(1, 3, 3, 1, 4, 7, 1) 
vec_unique <- unique(vec) # Apply unique() to vector
vec_unique 
```

# Practice 3

Scenario: You are a Data Scientist working for a consulting firm.
One of your colleagues from the Auditing Department has asked you
to help them assess the financial statement of organization X.

You have been supplied with two vector of data: mounthly revenue and
expenses for the financial year in quiestion. Your task is to calculate
the following financial matrics:

- profit for each mounth
- profit after tax for each month (the tax rate is 30%)
- profit margin for each month - equal to profit after tax divided by revenue
- good months - where the profit after tax was greater than the mean for the year
- bad months - where the profit after tax was less then the mean for years
- the best month - where the profit after tax was max for the year
- the worst month - where the profit after tax was min for the year

All results need to be presented as vectors.

Results for dollar values need to be calculate with $0.01 precision, but need to be
presented in Units of $1,000(i.e. 1k) with no decimal point.

Results for the profit margin ratio needed to be presented in units of % with no
decimal points.

Note: Your collegue has warned you that it is okay for tax for any given month to be
negative (in accounting terms, negative tax translates into a deferred tax asset).


## Code

```r
#Data
revenue <- c(14574.49, 7606.46, 8611.41, 9175.41, 8058.65, 8105.44, 11496.28, 9766.09, 10305.32, 14379.96, 10713.97, 15433.50)
expenses <- c(12051.82, 5695.07, 12319.20, 12089.72, 8658.57, 840.20, 3285.73, 5821.12, 6976.93, 16618.61, 10054.37, 3803.96)

#Solution
#Calculate Profit As The Differences Between Revenue And Expenses
profit <- revenue - expenses
profit

#Calculate Tax As 30% Of Profit And Round To 2 Decimal Points
tax<- round(profit * 0.30, 2)
tax

#Calculate Profit Remaining After Tax Is Deducted
profit.after.tax <- profit - tax
profit.after.tax

#Calculate The Profit Margin As Profit After Tax Over Revenue
#Round To 2 Decimal Points, Then Multiply By 100 To Get %
profit.margin <- round(profit.after.tax/revenue, 2)*100
profit.margin

#Calculate The Mean Profit After Tax For The 12 Months
mean_pat <- mean(profit.after.tax)
mean_pat

#Find The Months With Above-Mean Profit After Tax
good.months <- profit.after.tax > mean_pat
good.months

#Bad Months Are The Opposite Of Good Months !
bad.months <- !good.months
bad.months

#The Best Month Is Where Profit After Tax Was Equal To The Maximum
best.month <- profit.after.tax == max(profit.after.tax)
best.month

#The Worst Month Is Where Profit After Tax Was Equal To The Minimum
worst.month <- profit.after.tax == min(profit.after.tax)
worst.month

#Convert All Calculations To Units Of One Thousand Dollars
revenue.1000 <- round(revenue / 1000, 0)
expenses.1000 <- round(expenses / 1000, 0)
profit.1000 <- round(profit / 1000, 0)
profit.after.tax.1000 <- round(profit.after.tax / 1000, 0)

#Print Results
revenue.1000
expenses.1000
profit.1000
profit.after.tax.1000
profit.margin
good.months
bad.months
best.month
worst.month

#Preview Of What's Coming In The Next Section
M <- rbind(
  revenue.1000,
  expenses.1000,
  profit.1000,
  profit.after.tax.1000,
  profit.margin,
  good.months,
  bad.months,
  best.month,
  worst.month
)

#Print The Matrix
M
```


# **Collaborators:**

Diaz Urias Jorge David

Lopez Medrano Julio Antonio


