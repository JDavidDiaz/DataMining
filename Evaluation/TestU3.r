# Importing the dataset
dataset = read.csv('Social_Network_Ads.csv')
dataset = dataset[3:5]

# Encoding the target feature as factor
dataset$Purchased = factor(dataset$Purchased, levels = c(0, 1))

# For doing the splitting, we need to install the caTools package and import it
library(caTools)

# Setting the seed
set.seed(123)

# Splitting the dataset into the Training set and Test set
split = sample.split(dataset$Purchased, SplitRatio = 0.75)

# Subset assigned
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Feature Scaling
training_set[-3] = scale(training_set[-3])
test_set[-3] = scale(test_set[-3])

install.packages('e1071')
library(e1071)

# Fitting Naive Bayes to Training set
classifier = naiveBayes(x = training_set[-3],
                        y = training_set$Purchased)

# Predicting the Test set results
y_pred = predict(classifier, newdata = test_set[-3])
y_pred

# Making the Confusion Metrix
cm = table(test_set[, 3], y_pred)
cm
