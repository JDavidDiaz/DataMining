# Data Mining Unit_3:

In the branch named _"Unit 3"_ we have the following practices:

## Index

[Practice_1](https://github.com/JDavidDiaz/DataMining/blob/Unit_3/Practices/Practice_1.r)   
[Practice_2](https://github.com/JDavidDiaz/DataMining/blob/Unit_3/Practices/Practice_2.r)

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

### 
# **Collaborators:**

Diaz Urias Jorge David

Lopez Medrano Julio Antonio