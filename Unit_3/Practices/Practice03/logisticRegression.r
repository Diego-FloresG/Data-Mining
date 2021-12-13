# Practice 3 Simple Logistic Regression

#In this practice, an example of logistic regression will be carried out, first we need to import the dataset.

getwd()


#The data will be stored in a variable using the “read” method, to have a better use of the data it is necessary to select only the “Age, Estimated Salary and Purchased” fields.

# Importing the dataset
dataset <- read.csv('Social_Network_Ads.csv')
dataset <- dataset[, 3:5]

#To perform the division of the dataset for training and testing we use the "caTools" library, specifying the randomness coefficient as 123. The data will be divided into a 75% margin for training and the remainder for testing, each percentage of dataset will have its own independent variable.

# Splitting the dataset into the Training set and Test set
# Install.packages('caTools')
library(caTools)
set.seed(123)
split <- sample.split(dataset$Purchased, SplitRatio = 0.75)
training_set <- subset(dataset, split == TRUE)
test_set <- subset(dataset, split == FALSE)

#We scale the training and test data to perform better on predictions.

# Feature scaling
training_set[, 1:2] <- scale(training_set[, 1:2])
test_set[, 1:2] <- scale(test_set[, 1:2])

#Adaptation of the logistic regression to the training set, we define a new classification variable, where we take as a parameter the “Purchased” formula with respect to the other fields and the results are defined as binomial, this when using the training dataset.

# Fitting Logistic Regression to Training set
classifier = glm(formula = Purchased ~ .,
                 family = binomial,
                 data = training_set)

#By having the variable with the classification values, we can now do a prediction test where the test dataset, which is type response and the variable obtained previously, are taken as parameters. With the values obtained in the prediction it is now possible to define the condition that shows if the value is greater than 0.5 it is one type of the classification and if it is not, it is the other type.

# Predicting the Test set results
prob_pred = predict(classifier, type = 'response', newdata = test_set[-3])
prob_pred
y_pred = ifelse(prob_pred > 0.5, 1, 0)
y_pred


# Making the Confusion Metrix
cm = table(test_set[, 3], y_pred)
cm

#The following graphs show the linear model of the relationship of the “Purchased” with all the other fields of the dataset.

library(ggplot2)
ggplot(training_set, aes(x=EstimatedSalary, y=Purchased)) + geom_point() +
  stat_smooth(method="glm", method.args=list(family="binomial"), se=FALSE)

ggplot(training_set, aes(x=Age, y=Purchased)) + geom_point() +
  stat_smooth(method="glm", method.args=list(family="binomial"), se=FALSE)

ggplot(test_set, aes(x=EstimatedSalary, y=Purchased)) + geom_point() +
  stat_smooth(method="glm", method.args=list(family="binomial"), se=FALSE)

ggplot(test_set, aes(x=Age, y=Purchased)) + geom_point() +
  stat_smooth(method="glm", method.args=list(family="binomial"), se=FALSE)

#Finally we will show a graph using the "ElemStatLearn" library that allows a better visualization of the logistic regression model with the training data.

#1. We import the library
#2. In a new variable we define the data of the training dataset
#3. We create 2 new variables with the transformation of the values ​​of the “Age” field for “X1” and the “Estimated Salary” field for “X2”
#4. We create a “Grid_set” data frame from all the combinations of the vectors or factors provided previously
#5. The names of the fields are changed to their previous ones
#6. We generate a new variable "prob, set" for the prediction, which is performed with the training dataset, and the value of "Classifier" obtained previously and with another variable we show the values ​​as categorical with the use of a condition
#7. We start the visualization of the data, defining the main name as well as the X axis and the Y axis, marking the limits of both with the values ​​obtained from the variables X1 and X2
#8. We add a contour line to the existing graph, using the "contour" method with the parameters of the sequences X1 and X2, as well as the values ​​obtained in the prediction "y_grid"
#9. Ending with the "points" methods that allow to make a change in the design of the graph to visually show the separation of the categories by sections and the points as such in different colors

# Visualising the Training set results
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


#Similarly for the test dataset we use the "ElemStatLearn" library that allows a better visualization of the logistic regression model with the test data.

#1. We import the library
#2. In a new variable we define the data of the test dataset
#3. We create 2 new variables with the transformation of the values ​​of the “Age” field for “X1” and the “Estimated Salary” field for “X2”
#4. We create a “Grid_set” data frame from all the combinations of the vectors or factors provided previously
#5. The names of the fields are changed to their previous ones
#6. We generate a new variable "prob, set" for the prediction, which is performed with the training dataset, and the value of "Classifier" obtained previously and with another variable we show the values ​​as categorical with the use of a condition
#7. We start the visualization of the data, defining the main name as well as the X axis and the Y axis, marking the limits of both with the values ​​obtained from the variables X1 and X2
#8. We add a contour line to the existing graph, using the "contour" method with the parameters of the sequences X1 and X2, as well as the values ​​obtained in the prediction "y_grid"
#9. Ending with the "points" methods that allow to make a change in the design of the graph to visually show the separation of the categories by sections and the points as such in different colors

# Visualising the Test set results
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

