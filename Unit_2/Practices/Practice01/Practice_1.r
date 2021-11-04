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


#theme
o <- ggplot(cars, aes(x=Horsepower))
h <- o + geom_histogram(binwidth = 10, aes(fill=Acceleration), color="Black")

h +
  xlab("Horsepower (HP)") +
  ylab("Count") +
  ggtitle("Distribution") +
  theme(axis.title.x = element_text(color = "Green", size=30),
        axis.title.y = element_text(color = "Blue", size=30),
        axis.text.x = element_text(size = 20),
        axis.text.y = element_text(size = 20),
        legend.title = element_text(size = 30),
        legend.text = element_text(size = 20),
        legend.position = c(1,1),
        legend.justification = c(1,1),
        plot.title = element_text(color = "DarkBlue",
                                  size = 25,
                                  family = "Courier"))
        
h
