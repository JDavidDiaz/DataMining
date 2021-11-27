# Data Mining Unit_3:

In the branch named _"Unit 3"_ we have the following practices:

## Index

[Practice_1](https://github.com/JDavidDiaz/DataMining/blob/Unit_3/Practices/Practice_1.r)   
[Practice_2](https://github.com/JDavidDiaz/DataMining/blob/Unit_3/Practices/Practice_2.R)

# Practice 1 - Simple Linear Regression
## 1.- Importing the dataset
```r
dataset <- read.csv('Salary_Data.csv')
```
## 2.- Splitting the Dataset.
For doing the splitting, we need to install the caTools package and import it
```r
install.packages('caTools')
library(caTools
```
## 3.- Setting the seed
We will separate the data set into the training data set and the test data set, this seed will allow us to make the same partitions in the data sets.
```r
set.seed(123)
```
## 4.- Splitting the dataset into the Training set and Test set
Here in this dataset, we are having only 30 rows. So, we are allowing 20 rows(2/3) to the training dataset and 10 rows(1/3) to the test dataset.
```r
split <- sample.split(dataset$Salary, SplitRatio = 2/3)
```
## 5.- Assigning subset
the subset with the split = TRUE will be assigned to the training and the subset with the split = FALSE will be assigned to the test
```r
training_set <- subset(dataset, split == TRUE)
test_set <- subset(dataset, split == FALSE)
```
## 6.- Fitting Simple Linear Regression to the Training set
lm() function is used to make a linear regression model that will fit our training.
```r
regressor = lm(formula = Salary ~ YearsExperience, data = dataset)
```
## 7.- Analyzing the model
To analyze our model. We use the summary command
```r
summary(regressor)
```
## 8.- Predicting the Test set results
The first argument passed in the function is the model. The second argument is newdata that specifies which dataset we want to implement our trained model on and predict the results
```r
y_pred = predict(regressor, newdata = test_set)
```
## 9.- Visualizing the Training set results
Visualization of the training set results using the ggplot2 library.
```r
library(ggplot2)
ggplot() +
  geom_point(aes(x=training_set$YearsExperience, y=training_set$Salary),
             color = 'red') +
  geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, newdata = training_set)),
            color = 'blue') +
  ggtitle('Salary vs Experience (Training Set)') +
  xlab('Years of experience') +
  ylab('Salary')
```
The blue colored straight line in the graph represents the regressor that we have made from the training dataset. The red-colored dots represent the actual training dataset   

![imagen](https://github.com/JDavidDiaz/DataMining/blob/Unit_3/Resources/Practice1_Resource1.jpg)  

## 10.- Visualizing the Test set results
As we have done for visualizing the training dataset,  we are going to do the same for the test dataset.
```r
ggplot() +
  geom_point(aes(x=test_set$YearsExperience, y=test_set$Salary),
             color = 'red') +
  geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, newdata = training_set)),
            color = 'blue') +
  ggtitle('Salary vs Experience (Test Set)') +
  xlab('Years of experience') +
  ylab('Salary')
```

![imagen](https://github.com/JDavidDiaz/DataMining/blob/Unit_3/Resources/Practice1_Resource2.jpg)

# Practice 1 - Simple Linear Regression

## 1.- Importing the dataset
Startup by reading the csv file.
```r
dataset <- read.csv('50_Startups.csv')
```

## 2.- Encoding categorical data, this means we will transform the categorical data into a numerical value which represents that data. 
We assign the values of the cities as numerical in order for the model to understand what each of this cities represent as a numerical value.
```r
dataset$State = factor(dataset$State,
                       levels = c('New York', 'California', 'Florida'),
                       labels = c(1,2,3))
dataset
```

## 3.- Splitting the dataset into the Training set and Test set
To start off, we have to install the caTools package if not already installed.
Following we utilize the library caTools and we set up a random seed to make the splits of the dataset.
Then we decide to split the data in an 80% / 20% ratio for training and testing. TRUE value is for 80% and FALSE for 20%.
```r
install.packages('caTools') // Install if not done yet
library(caTools)
set.seed(123)
split <- sample.split(dataset$Profit, SplitRatio = 0.8)
training_set <- subset(dataset, split == TRUE)
test_set <- subset(dataset, split == FALSE)
```

## 4.- Fitting Multiple Linear Regression to the Training set
Here we create the regressor, which will allow us to fit the MLR into the Training Set.
```r
//regressor = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend + State)
regressor = lm(formula = Profit ~ .,
               data = training_set )
summary(regressor)
```

## 5.- Prediction the Test set results
We add the predict values.
```r
y_pred = predict(regressor, newdata = test_set)
y_pred
```

## 6.- Assignment: visualize the simple linear regression model with R.D.Spend 
We create the Training Set Visualization utilizing R.D.Spend vs Profit. 
```r
library(ggplot2)

//Training Data Set
ggplot() +
  geom_point(aes(x=training_set$R.D.Spend,
                 y=training_set$Profit),
             color = 'red') +
  geom_line(aes(x = training_set$R.D.Spend, y =
                  predict(regressor, newdata = training_set)),
            color = 'blue') +
  ggtitle('R.D.Spend vs Profit (Training Set)') +
  xlab('R.D.Spend') +
  ylab('Profit')
```
![imagen](https://github.com/JDavidDiaz/DataMining/blob/Unit_3/Resources/TrainingSetP2.png) 

We use the Test Set to create the prediction visualization.
```r
//Test Data Set
ggplot() +
  geom_point(aes(x=test_set$R.D.Spend,
                 y=test_set$Profit),
             color = 'red') +
  geom_line(aes(x = test_set$R.D.Spend, y =
                  predict(regressor, newdata = test_set)),
            color = 'blue') +
  ggtitle('R.D.Spend vs Profit (Test Set)') +
  xlab('R.D.Spend') +
  ylab('Profit')
```
![imagen](https://github.com/JDavidDiaz/DataMining/blob/Unit_3/Resources/TestSetP2.png)

## 7.- Building the optimal model using Backward Elimination
We start creating the optimal model for the use of Backward Elimination.
```r
regressor = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend + State,
               data = dataset )
summary(regressor)

regressor = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend,
               data = dataset )
summary(regressor)

regressor = lm(formula = Profit ~ R.D.Spend + Marketing.Spend,
               data = dataset )
summary(regressor)

regressor = lm(formula = Profit ~ R.D.Spend + Marketing.Spend,
               data = dataset )
summary(regressor)

y_pred = predict(regressor, newdata = test_set)
y_pred
```

## 8.- Analyze the following automation backwardElimination function 
We start by declaring the function, this takes the amount of data entries in the dataset as X and sl as 0.05. Following, it iterates the same amount of data entries the dataset has and applies the MLR formula, if the values of the coefficients in maxVar is greater than sl (0.05) then it takes it out as a backward elimination and continues iterating until finished with all the data entries. Finally, it takes the data of the coefficients obtained and prints it on the console.
```r
backwardElimination <- function(x, sl) {
  numVars = length(x)
  for (i in c(1:numVars)){
    regressor = lm(formula = Profit ~ ., data = x)
    maxVar = max(coef(summary(regressor))[c(2:numVars), "Pr(>|t|)"])
    if (maxVar > sl){
      j = which(coef(summary(regressor))[c(2:numVars), "Pr(>|t|)"] == maxVar)
      x = x[, -j]
    }
    numVars = numVars - 1
  }
  return(summary(regressor))
}

SL = 0.05
//dataset = dataset[, c(1,2,3,4,5)]
training_set
backwardElimination(training_set, SL)
```
![imagen](https://github.com/JDavidDiaz/DataMining/blob/Unit_3/Resources/P2.png)


### 
# **Collaborators:**

Diaz Urias Jorge David

Lopez Medrano Julio Antonio