# Evaluation 4: K-means

Dataset directory change.

```r
getwd()
setwd("E:/Programas TEC/TEC/Mineria de datos/Practicas/Flores_Practicas/Unit_4/iris-master")
getwd()
```

Import and select iris dataset.

```r
dataset = read.csv('iris.csv')
```

We select all the characteristics of the irises, without the categories.

```r
dt = dataset[1:4]
dt
```

Result:

```r
> dt
    sepal_length sepal_width petal_length petal_width
1            5.1         3.5          1.4         0.2
2            4.9         3.0          1.4         0.2
3            4.7         3.2          1.3         0.2
4            4.6         3.1          1.5         0.2
5            5.0         3.6          1.4         0.2
6            5.4         3.9          1.7         0.4
7            4.6         3.4          1.4         0.3
8            5.0         3.4          1.5         0.2
9            4.4         2.9          1.4         0.2
...
```

Using the elbow method to find the optimal number of groups to use in the kmean model.
To reduce repetition and better legibility we make all this process into a function

```r
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
```

We show the graph that shows the recommendation of possible clusters quantity.

The way this number of clusters is determined is the point on the graph before the plotted line begins to normalize. In this case it would be number 3.

```r
TEM(dt)
```

Result:

![Elbow](../img/Elbow.png)

Fit K-Means to the data set.
Taking in consideration the kmeans, we specifiy the dataset and centers for the clusters.
Set the seed and use the kmeans function

```r
Clusters <- function(dataset, cnt){
  set.seed(29)
  kmeans = kmeans(x = dataset, centers = cnt)
  y_kmeans = kmeans$cluster
}
```

We create a variable of the new k-means model with the selected dataset and the number of clusters.

```r
ykmeans <- Clusters(dt, 3)
```

Visualizing the clusters.Import the cluster library.Espcify the datasource, the k means variable
and show the relation with Components 1 and Components 2

```r
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
```

Result:

It can be seen that the k means prediction shows three data sets that represent the previously eliminated categories, where if it is compared with the visualization of the original data, the very similar relationship that exists can be observed.

![kmeans](../img/kmean_iris.png)

### K-means explication:

K-means clustering (MacQueen 1967) is one of the most commonly used unsupervised machine learning algorithm for partitioning a given data set into a set of k groups (i.e. k clusters), where k represents the number of groups pre-specified by the analyst. It classifies objects in multiple groups (i.e., clusters), such that objects within the same cluster are as similar as possible (i.e., high intra-class similarity), whereas objects from different clusters are as dissimilar as possible (i.e., low inter-class similarity). In k-means clustering, each cluster is represented by its center (i.e, centroid) which corresponds to the mean of points assigned to the cluster.

The basic idea behind k-means clustering consists of defining clusters so that the total intra-cluster variation (known as total within-cluster variation) is minimized.
There are several k-means algorithms available. The standard algorithm is the Hartigan-Wong algorithm (Hartigan and Wong 1979), which defines the total within-cluster variation as the sum of squared distances Euclidean distances between items and the corresponding centroid
