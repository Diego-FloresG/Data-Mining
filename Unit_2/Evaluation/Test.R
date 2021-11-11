setwd("E:/Programas TEC/TEC/Mineria de datos/Practicas/Flores_Practicas/Unit 2/Test")
getwd()

# The CSV data is declared in a variable
movies <- read.csv("Project-Data.csv")
head(movies)

# The columns are renamed to better define the names

colnames(movies) <- c("DayofWeek","Director","Genre","MovieTitle",
                      "ReleaseDate","Studio","AdjustedGrossinMillions",
                      "BudgetinMillions","GrossinMillions","IMDBRating",
                      "MovieLensRating","OverseasinMillions","OverseasPercent",
                      "ProfitinMillions","ProfitPercent","RuntimeinMin",
                      "USinMillions","GrossPercentUS")

# Change studio and genre from character to factors
movies$Studio <- factor(movies$Studio)
movies$Genre <- factor(movies$Genre)

# We filter the specific genres of the movies
movies_filter <- (movies$Genre=="action") | (movies$Genre=="adventure")|
  (movies$Genre=="animation") | (movies$Genre == "comedy") |
  (movies$Genre == "drama")
movies_filter

# We filter specific movie studios
movies_filter2 <- (movies$Studio=="Buena Vista Studios") | (movies$Studio=="Fox")|
  (movies$Studio=="Paramount Pictures") | (movies$Studio=="Sony") |
  (movies$Studio=="Universal") | (movies$Studio=="WB")
movies_filter2

# A variable is declared to join the variables that contain the genre and study filters
movies_filtered <- movies[movies_filter & movies_filter2,]
head(movies_filtered)

str(movies_filtered)

# The display library is initialized
library(ggplot2)

# It is initialized from the data of the filtered movies, as well as the variable "X" with the genre and "Y" for the gross percentage
w <- ggplot(data=movies_filtered,aes(x=Genre, y=GrossPercentUS))

# Components of the graph are changed so that it is the same as the previous image of the exam
w <- w + geom_jitter(aes(size=BudgetinMillions,colour=Studio))+
  #y tag
  ylab("Gross % US")+
  #title
  ggtitle("Domestic Gross % by Genre") +
  #the box plot characteristics
  geom_boxplot(alpha=0.7,outlier.colour=NA) +
  theme(
    # the x and y axis title colours and size
    axis.title.x = element_text(colour="Purple",size=20),
    axis.title.y = element_text(colour="Purple",size=20),
    #the x and y axis interval text size
    axis.text.x=element_text(size=10),
    axis.text.y=element_text(size=10),
    #the description size text
    plot.title=element_text(size=25),
    legend.title=element_text(size=10),
    legend.text=element_text(size=10),
    #the font 
    text=element_text(family="Comic Sans MS")
  )
#call the plot
w$labels$size <- "Budget $M"
w
