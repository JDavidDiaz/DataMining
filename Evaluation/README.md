# Test - Naive Bayes

Implement the Naive Bayes classification model with the dataset Social_Network_Ads.csv and using the e1071 library with the naiveBayes () function. Once the classifier is obtained, do the data visualization analysis
correspondent.
## 1.- Importing the dataset
```r
dataset = read.csv('Social_Network_Ads.csv')
dataset = dataset[3:5]
```
## 2.- Encoding the target feature as factor
Encoding the catagorical variable as factor
```r
dataset$Purchased = factor(dataset$Purchased, levels = c(0, 1))
```
## 3.- Splitting the Dataset.
For doing the splitting, we need to install the caTools package and import it
```r
install.packages('caTools')
library(caTools)
```
## 4.- Setting the seed
We will separate the data set into the training data set and the test data set, this seed will allow us to make the same partitions in the data sets.
```r
set.seed(123)
```
## 5.- Splitting the dataset into the Training set and Test set
Here the training_set contains 75% of the data and test_set contains 25% of the data.
```r
split = sample.split(dataset$Purchased, SplitRatio = 0.75)
```
## 6.- Assigning subset
the subset with the split = TRUE will be assigned to the training and the subset with the split = FALSE will be assigned to the test
```r
training_set <- subset(dataset, split == TRUE)
test_set <- subset(dataset, split == FALSE)
```
## 7.- Feature Scaling
The Feature scaling is a method used to normalize the range of independent variables whose default method centers and/or scales the columns of a numeric matrix.
```r
training_set[-3] = scale(training_set[-3])
test_set[-3] = scale(test_set[-3])
```
## 8.- Fitting Naive Bayes to Training set
x will be the independent variables (the -3 removes from de dataset the column we don’t need), y is the dependent variable.
```r
install.packages('e1071')
library(e1071)
classifier = naiveBayes(x = training_set[-3],
                        y = training_set$Purchased)
```
## 9.- Predicting the Test set results
The first argument passed in the function is the classifier. The second argument is newdata that specifies which dataset we want to implement our trained model on and predict the results
```r
y_pred = predict(classifier, newdata = test_set[-3])
y_pred
```