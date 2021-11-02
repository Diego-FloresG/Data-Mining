setwd("E:/Programas TEC/TEC/Mineria de datos/Practicas/Flores_Practicas/Unit 2/Practica 1")
getwd()
cars <- read.csv("cars.csv")
colnames(cars) <- c("Car", "MPG", "Cylinders" ,"Displacement", "Horsepower", "Weight" ,"Acceleration", "Model" ,"Origin")
head(cars)
summary(cars)

library(ggplot2)
#Scatterplots:
w <- ggplot(cars, aes(x=Displacement, y=Horsepower,
                      color=Origin))
w + geom_point(size=3)

w + geom_point(size=3) + facet_grid(Origin~.)

#Facets:
v <- ggplot(cars, aes(x=Horsepower))
v + geom_histogram(binwidth = 10, aes(fill=Origin),color="Black")
v + geom_histogram(binwidth = 10, aes(fill=Origin),color="Black") + facet_grid(Origin~., scales="free")