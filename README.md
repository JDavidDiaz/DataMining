# Data Mining Unit_3:

In the branch named _"Unit 3"_ we have the following practices:

## Index

[Practice_1](https://github.com/JDavidDiaz/DataMining/blob/Unit_3/Practices/Practice_1.r)

[Practice_2](https://github.com/JDavidDiaz/DataMining/blob/Unit_3/Practices/Practice_2.R)

[Practice_3](https://github.com/JDavidDiaz/DataMining/blob/Unit_3/Practices/Practice_3.r)

[Practice_4](https://github.com/JDavidDiaz/DataMining/blob/Unit_3/Practices/Practice_4.R)

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

# Practice 2 - Multiple Linear Regression

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

# Practice 3 - Logistic Regression
## 1.- Importing the dataset
```r
dataset <- read.csv('Social_Network_Ads.csv')
```
## 2.- Importing Libraries.
For doing the splitting, we need to install the caTools package and import it
```r
install.packages('caTools')
library(caTools)
```
## 3.- Setting the seed
We will separate the data set into the training data set and the test data set, this seed will allow us to make the same partitions in the data sets.
```r
set.seed(123)
```
## 4.- Splitting the dataset into the Training set and Test set
Here the training_set contains 75% of the data and test_set contains 25% of the data.
```r
split <- sample.split(dataset$Purchased, SplitRatio = 0.75)
```
## 5.- Assigning subset
the subset with the split = TRUE will be assigned to the training and the subset with the split = FALSE will be assigned to the test
```r
training_set <- subset(dataset, split == TRUE)
test_set <- subset(dataset, split == FALSE)
```
## 6.- Feature Scaling
The Feature scaling is a method used to normalize the range of independent variables whose default method centers and/or scales the columns of a numeric matrix.
```r
training_set[, 1:2] <- scale(training_set[, 1:2])
test_set[, 1:2] <- scale(test_set[, 1:2])
```
## 7.- Fitting Simple Linear Regression to the Training set
Here we create the classifier for the logistic regression. The gml (generalized linear models) is used because the logistic regression is a linear classifier. The first argument is a formula that takes the dependent variable and then specifies that we want to take all the independent variables. The next argument is the family. For logistic regression, we have to specify the binomial family. 
```r
classifier = glm(formula = Purchased ~ ., family = binomial, data = training_set)
```
## 8.- Predicting the Test set results
The predict function is used to predict the probabilities by using the logistic regression classifier. If the prob_pred value is greater than 0.5 then it predicts the value 1 otherwise it predicts the value 0.
```r
prob_pred = predict(classifier, type = 'response', newdata = test_set[-3])
prob_pred
y_pred = ifelse(prob_pred > 0.5, 1, 0)
y_pred
```
## 9.- Making the Confusion Metrix
the cm (confusion matrix) will count the number of correct predictions and the number of incorrect predictions.
```r
cm = table(test_set[, 3], y_pred)
cm
```
## 10.- Visualizing with ggplot2 
Here are some simple plots using ggplot2. This plot shows the results of the training set for EstimatedSalary and Purchased.    

![imagen](https://github.com/JDavidDiaz/DataMining/blob/Unit_3/Resources/Practice3_Resource1.jpg)    

This plot shows the same results but for Age and Purchased  

![imagen](https://github.com/JDavidDiaz/DataMining/blob/Unit_3/Resources/Practice3_Resource2.jpg)    

Now we do the same but now for the test dataset. One for EstimatedSalary and Purchased and other for Age and Purchased  

![imagen](https://github.com/JDavidDiaz/DataMining/blob/Unit_3/Resources/Practice3_Resource3.jpg)     

![imagen](https://github.com/JDavidDiaz/DataMining/blob/Unit_3/Resources/Practice3_Resource4.jpg) 

## 10.- Visualizing the Training set results with ElemStatLearn
ElemStatLearn a library that refers to a book that allows us to generate plots described in the book as the following form.
```r
install.packages(file.choose(), repos=NULL)
library(ElemStatLearn)
set = training_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
prob_set = predict(classifier, type = 'response', newdata = grid_set)
y_grid = ifelse(prob_set > 0.5, 1, 0)
plot(set[, -3],
     main = 'Logistic Regression (Training set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))
```
The red points on the model are the training set observations for the purchased when is equal to zero and the green points are the training set observations for purchase when is equal to 1.    

![imagen](https://github.com/JDavidDiaz/DataMining/blob/Unit_3/Resources/Practice3_Resource5.jpg)  

## 11.- Visualizing the test set results

Same as above but now for the training set
```r
library(ElemStatLearn)
set = test_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
prob_set = predict(classifier, type = 'response', newdata = grid_set)
y_grid = ifelse(prob_set > 0.5, 1, 0)
plot(set[, -3],
     main = 'Logistic Regression (Test set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))
```   

![imagen](https://github.com/JDavidDiaz/DataMining/blob/Unit_3/Resources/Practice3_Resource6.jpg) 

# Practice 4 - K-NN

## 1.- Importing the dataset
Import the dataset and clean the data to obtain columns 3 to 5. The column "Purchased" is being made factors. 
```r
dataset <- read.csv('Social_Network_Ads.csv')
dataset = dataset[3:5]
dataset$Purchased = factor(dataset$Purchased, levels = c(0, 1))
```
## 2.- Splitting Data
Split the data into 2 different samples, one is used for training and the other for testing. The random seed is used to prevent a sequence of data that will render the practice useless.
```r
# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Purchased, SplitRatio = 0.75)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)
```
## 3.- Scaling the Split Sets
Scale the split sets we just made in order to fit the columns.
```r
# Feature Scaling
training_set[-3] = scale(training_set[-3])
test_set[-3] = scale(test_set[-3])
```
## 4.- Fitting the Training Set in order to make a prediction with the Test Set
In here we fit the K-NN in order to make a prediction with the sets we just made. One of the sets will train the model while the other will be used to test that the model is working.
```r
# Fitting K-NN classifier to the Training set and Predicting the Test set results
# Create your classifier
# install.packages('class')

library(class)
y_pred = knn(train = training_set[, -3],
             test = test_set[, -3],
             cl = training_set[, 3],
             k = 5)
y_pred
```
## 5.- Creating a Confusion Matrix
This matrix will help us by counting the number of correct predictions made.
```r
# Making the Confusion Matrix
cm = table(test_set[, 3], y_pred)
cm
```
## 6.- Installing the ElemStatLearn Package
This is a mandatory package used for the visualization of data in this exercise. Install if not already done before.
```r
# Visualising the Training set results
# install.packages(file.choose(), repos=NULL)
library(ElemStatLearn)
```
## 7.- Visualization of the Training Set
In here we will set the training set results as the ones to be used and create a grid that will allow us to show the data as dots acording to their values. The columns that will be used are Age and EstimatedSalary, which will then be used to trace the grid when the training happens. Then, we will plot the data, so we set up the main title, the labels, range, point size, bg, transparency and color in order to make a clearly understandable plot. 
```r
set = training_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = knn(train = training_set[, -3],
             test = grid_set,
             cl = training_set[, 3],
             k = 5)
plot(set[, -3],
     main = 'K-NN Classifier (Training set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))
```
![imagen](https://github.com/JDavidDiaz/DataMining/blob/Unit_3/Resources/plot1_p4.png) 
## 8.- Visualization of the Test Set
In here we will set the test set results as the ones to be used and create a grid that will allow us to show the data as dots acording to their values. The columns that will be used are Age and EstimatedSalary, which will then be used to trace the grid when the training happens. Then, we will plot the data, so we set up the main title, the labels, range, point size, bg, transparency and color in order to make a clearly understandable plot. 
```r
# Visualising the Test set results
set = test_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = knn(train = training_set[, -3],
             test = grid_set,
             cl = training_set[, 3],
             k = 5)
plot(set[, -3], main = 'K-NN Classifier (Test set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))
```
![imagen](https://github.com/JDavidDiaz/DataMining/blob/Unit_3/Resources/plot2_p4.png) 

### 
# **Collaborators:**

Diaz Urias Jorge David

Lopez Medrano Julio Antonio