# we get the directory we are using and then we change it and verify it changes
getwd()
setwd("E:/Programas TEC/TEC/Mineria de datos/Clone/DataMining/MachineLearning")
getwd()

# We import the dataset
dataset <- read.csv('Social_Network_Ads.csv')
dataset <- dataset[, 3:5]

# we encode the data from the column Purchased 
dataset$Purchased = factor(dataset$Purchased, levels = c(0, 1))

# import the library caTools and split the the dataset into training and testing set .75 and .25 respectively 
library(caTools)
split <- sample.split(dataset$Purchased, SplitRatio = 0.75)
training_set <- subset(dataset, split == TRUE)
test_set <- subset(dataset, split == FALSE)

# Scale the third column so it normalize the data, so it's more accurate when we use the predictive algorithm
training_set[-3] = scale(training_set[-3])
test_set[-3] = scale(test_set[-3])

# we import the library e1071 and implemente the function naiveBayes
# where the independent values X are the third column of the training set
# and Y is the trainingset where we will try the prediction
library(e1071)
classifier = naiveBayes(x = training_set[-3], y = training_set$Purchased)

# Classify the testset, and specify the prediction to the third column 
y_pred = predict(classifier, newdata = test_set[-3])
y_pred

# Apply the confusion table, where we evaluate the precision of the test
cm = table(test_set[, 3], y_pred)
cm

# Visualize the training set using the library ElemStatLearn
library(ElemStatLearn)
set = training_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = predict(classifier, newdata = grid_set)
plot(set[, -3],
     main = 'Naive Bayes (Training set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))

# Visualize the testing set using the ElemStatLearn
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
