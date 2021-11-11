#Test the Law Of Large Numbers for N random normally distributed numbers with mean = 0, stdev=1:

#Create an R script that will count how many of these numbers fall between -1 and 1 and divide
#by the total quantity of N

#E(X) = 68.2%

#Initialize sample size
size <- 100000

#Initialize counter
counter <- 0

#Loop
for (i in rnorm(size)) {
  if (i > -1 & i < 1) { #Checks if the iterated variable falls
    counter <- counter + 1 #Increase counter if the condition is true
  }
}

#Result
result <- (counter / size)
print(result)