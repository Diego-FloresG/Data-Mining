#We already had the path at downloads
getwd()

# Importing the dataset
dataset <- read.csv('Salary_Data.csv')

# Splitting the dataset into the Training set and Test set
# Install.packages('caTools')
# Remember to Install it before importing it
library(caTools)
#we set the seed to 123
set.seed(123)
#then we split the salary sample
split <- sample.split(dataset$Salary, SplitRatio = 2/3)
#we train the dataset with split TRUE
training_set <- subset(dataset, split == TRUE)
#we train the dataset with split FALSE
test_set <- subset(dataset, split == FALSE)

# Fitting Simple Linear Regression to the Training set
regressor = lm(formula = Salary ~ YearsExperience,
               data = dataset)
summary(regressor)

# Predicting the Test set results
y_pred = predict(regressor, newdata = test_set)

# Visualising the Training set results
# We do a simple plot where we show the salary in comparison of the experience with the trainedset
library(ggplot2)
ggplot() +
  geom_point(aes(x=training_set$YearsExperience, y=training_set$Salary),
             color = 'red') +
  geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, newdata = training_set)),
            color = 'blue') +
  ggtitle('Salary vs Experience (Training Set)') +
  xlab('Years of experience') +
  ylab('Salary')

# Visualising the Test set results
# We do a simple plot where we show the salary in comparison of the experience with the testset

ggplot() +
  geom_point(aes(x=test_set$YearsExperience, y=test_set$Salary),
             color = 'red') +
  geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, newdata = training_set)),
            color = 'blue') +
  ggtitle('Salary vs Experience (Test Set)') +
  xlab('Years of experience') +
  ylab('Salary')