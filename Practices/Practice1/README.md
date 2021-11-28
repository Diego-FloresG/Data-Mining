## Practice 1 Simple Linear Regression

# We already had the path at downloads
```r
getwd()

```

# Importing the dataset
```r
dataset <- read.csv('Salary_Data.csv')
```

# Splitting the dataset into the Training set and Test set
# Install.packages('caTools')
# Remember to Install it before importing it
```r
library(caTools)
```
# we set the seed to 123
```r
set.seed(123)
```
# then we split the salary sample
```r
split <- sample.split(dataset$Salary, SplitRatio = 2/3)
```
# we train the dataset with split TRUE
```r
training_set <- subset(dataset, split == TRUE)
```
#we train the dataset with split FALSE
```r
test_set <- subset(dataset, split == FALSE)
```

# Fitting Simple Linear Regression to the Training set
```r
regressor = lm(formula = Salary ~ YearsExperience,
               data = dataset)
summary(regressor)
```
# Predicting the Test set results
```r
y_pred = predict(regressor, newdata = test_set)
```

# Visualising the Training set results
# We do a simple plot where we show the salary in comparison of the experience with the trainedset
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
# Visualising the Test set results
# We do a simple plot where we show the salary in comparison of the experience with the testset
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
