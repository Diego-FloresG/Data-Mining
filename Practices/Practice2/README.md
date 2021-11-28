# Practice 2 Multiple Linear Regression

### I already have the path set
```r
getwd()
```
### Importing the dataset
```r
dataset <- read.csv('50_Startups.csv')
```

### Encoding categorical data 
```r
dataset$State = factor(dataset$State,
                       levels = c('New York', 'California', 'Florida'),
                       labels = c(1,2,3))
```
### Show dataset
```r
dataset
```
### Splitting the dataset into the Training set and Test set
### Install.packages('caTools')
```r
library(caTools)
set.seed(123)
split <- sample.split(dataset$Profit, SplitRatio = 0.8)
training_set <- subset(dataset, split == TRUE)
test_set <- subset(dataset, split == FALSE)
```
### Fitting Multiple Linear Regression to the Training set
### regressor = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend + State)
```r
regressor = lm(formula = Profit ~ .,
               data = training_set )

summary(regressor)
```
![summary](https://github.com/Diego-FloresG/Data-Mining/blob/Unit_3/Practices/Practice1/summary_MLR.PNG)
### Prediction the Test set results
```r
y_pred = predict(regressor, newdata = test_set)
y_pred
```
### Assigment: visualize the simple liner regression model with R.D.Spend 

### this is the plot using the trainingset
```r
library(ggplot2)
ggplot() +
  geom_point(aes(x=training_set$R.D.Spend, y=training_set$Profit),
             color = 'red') +
  geom_line(aes(x = training_set$R.D.Spend, y = predict(regressor, newdata = training_set)),
            color = 'blue') +
  ggtitle('R.DSpend vs Profit') +
  xlab('Spend') +
  ylab('Profit')
```
![summary](https://github.com/Diego-FloresG/Data-Mining/blob/Unit_3/Practices/Practice1/plotMLR1.PNG)
### This is the plot using the testset
```r
ggplot() +
  geom_point(aes(x=test_set$R.D.Spend, y=test_set$Profit),
             color = 'black') +
  geom_line(aes(x = test_set$R.D.Spend, y = predict(regressor, newdata = test_set)),
            color = 'purple') +
  ggtitle('R.DSpend vs Profit') +
  xlab('Spend') +
  ylab('Profit')
```
![summary](https://github.com/Diego-FloresG/Data-Mining/blob/Unit_3/Practices/Practice1/plotMLR2.PNG)
### Building the optimal model using Backward Elimination
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
### Homework analise the follow atomation backwardElimination function 
#### It start by the declaration of backwardElimination giving the x value and sl=0.05
#### numvars is equal to the the lenght of x
#### we iterate with the counting the numvar variable
#### inside we have the MLR formula
#### using maxvar to get the coeficient of the summary of regressor
#### We compare the maxvar value if its greater than sl
#### we use the backward elimination using x and j as the variables
#### a the end we return a summary of the regressor
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
#dataset = dataset[, c(1,2,3,4,5)]
training_set
backwardElimination(training_set, SL)
```
![summary](https://github.com/Diego-FloresG/Data-Mining/blob/Unit_3/Practices/Practice1/summary_B1.PNG)
