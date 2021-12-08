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
## 10.- Making the Confusion Matrix
the cm (confusion matrix) will count the number of correct predictions and the number of incorrect predictions.
```r
cm = table(test_set[, 3], y_pred)
cm
```
## 11.- Visualizing the Training set results with ElemStatLearn Library
```r
library(ElemStatLearn)
# declare set as the training set
set = training_set
```
Here we create the background region red/green. Each 0.01 is interpreted as 0 or 1 and is either green or red. The -1 and +1 give us the space around the edges.
```r
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
```
giving a name to the X and Y 
```r
colnames(grid_set) = c('Age', 'EstimatedSalary')
```
here we use the classifier to predict the result of each of each of the pixel bits noted above
```r
y_grid = predict(classifier, newdata = grid_set)
```
now we plat the actual data
```r
plot(set[, -3],
     main = 'Naive Bayes (Training set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2)) # this creates the limits to the values plotted and it creates the line between green and red
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
```
here we run through all the y_pred data and ifelse to color the dots
note the dots are the real data, the background is the pixel by pixel determination of purchased (0/1)
```r
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))
```
The red points on the model are the training set observations for the purchased when is equal to zero and the green points are the training set observations for purchase when is equal to 1.

![imagen](https://github.com/JDavidDiaz/DataMining/blob/Unit_3/Resources/Test_Resource1.jpg)

## 11.- Visualizing the test set results 
Same as above but now for the training set
```r
library(ElemStatLearn)
set = test_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = predict(classifier, newdata = grid_set)
plot(set[, -3], main = 'Naive Bayes (Test set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))
```
![imagen](https://github.com/JDavidDiaz/DataMining/blob/Unit_3/Resources/Test_Resource2.jpg)