# Data Mining Unit_1:

In the branch named _"Unit 1"_ we have the following practices:

## Index

[Practice_1](https://github.com/JDavidDiaz/DataMining/blob/Unit_1/Practices/Practice_1.R)

[Practice_2]()

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




# **Collaborators:**

Diaz Urias Jorge David

Lopez Medrano Julio Antonio


