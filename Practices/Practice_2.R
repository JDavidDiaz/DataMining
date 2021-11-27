getwd()
setwd("/Users/Julio/DataMining/Practices")
getwd()

# Importing the dataset
dataset <- read.csv('50_Startups.csv')

# Encoding categorical data 
dataset$State = factor(dataset$State,
                       levels = c('New York', 'California', 'Florida'),
                       labels = c(1,2,3))

dataset
# Splitting the dataset into the Training set and Test set
install.packages('caTools')
library(caTools)
set.seed(123)
split <- sample.split(dataset$Profit, SplitRatio = 0.8)
training_set <- subset(dataset, split == TRUE)
test_set <- subset(dataset, split == FALSE)

# Fitting Multiple Linear Regression to the Training set
#regressor = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend + State)
regressor = lm(formula = Profit ~ .,
               data = training_set )

summary(regressor)

# Prediction the Test set results
y_pred = predict(regressor, newdata = test_set)
y_pred

# Visualize the simple linear regression model with R.D.Spend 
library(ggplot2)

#Training Data Set
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

# Test Data Set
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

# Building the optimal model using Backward Elimination
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

# Homework analise the follow atomation backwardElimination function 
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
#dataset = dataset[, c(1,2,3,4,5)]
training_set
backwardElimination(training_set, SL)