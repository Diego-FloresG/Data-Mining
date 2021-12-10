#Dataset directory change
getwd()
setwd("E:/Programas TEC/TEC/Mineria de datos/Practicas/Flores_Practicas/Unit_4/iris-master")
getwd()

#Import and select iris dataset
dataset = read.csv('iris.csv')
#We select all the characteristics of the irises, without the categories
dt = dataset[1:4]
dt

#Using the elbow method to find the optimal number of groups to use in the kmean model
TEM <- function(dataset){
  set.seed(6)
  wcss = vector()
  for (i in 1:10) wcss[i] = sum(kmeans(dataset, i)$withinss)
  plot(1:10,
       wcss,
       type = 'b',
       main = paste('The Elbow Method'),
       xlab = 'Number of clusters',
       ylab = 'WCSS')
}

#We show the graph that shows the recommendation of possible clusters quantity
TEM(dt)

#Fit K-Means to the data set
Clusters <- function(dataset, cnt){
  set.seed(29)
  kmeans = kmeans(x = dataset, centers = cnt)
  y_kmeans = kmeans$cluster
}

#We create a variable of the new k-means model with the selected dataset and the number of clusters
ykmeans <- Clusters(dt, 3)

#Visualizing the clusters
library(cluster)
clusplot(dt,
         ykmeans,
         lines = 0,
         shade = TRUE,
         color = TRUE,
         labels = 2,
         plotchar = FALSE,
         span = TRUE,
         main = paste('Clusters of Iris Plant'),
         xlab = 'Components 1',
         ylab = 'Components 2')
