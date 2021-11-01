# Functions

# Practice find 20 more functions in R and make an example of it.

# 1. Find sum of numbers frm 41 to 68.
print(sum(41:68))

# 2. Find mean of numbers from 25 to 82.
print(mean(25:82))

# 3. Abbreviate Strings
x <- c("abcd", "efgh", "abce")
abbreviate(x, 2)
abbreviate(x, 2, strict = TRUE)

# 4. Returns a character string of the current system date and time.
d <- date()
d

# 5. Read or Set the Declared Encodings for a Character Vector
x <- "fa\xE7ile"
Encoding(x)
Encoding(x) <- "latin1"
x

# 6. Warning Messages
testit <- function() warning("Esto esta mal!!!!!")
testit() ## shows call

# 7. Duplicated
x <- c(9:20, 1:5, 3:7, 0:8)
(xu <- x[!duplicated(x)])

# 8. Message
message("ABC ", "DEF")

# 9. Names and Symbols
an <- as.name("arrg")
an
is.name(an) # TRUE
mode(an)   # name
typeof(an) # symbol

# 10. Character Vectors
form <- y ~ a + b + c
as.character(form)  ## length 3
deparse(form)       ## like the input

#11.12. read and file 
fram <- read.csv(file.choose())

#13 attach, R defaults to performing actions on this particular data set.
attach(fram)

#14 detach, If you finish with an attached data set and want to work with another data set, you should detach the first one
detach(fram)

#15 view, is a function that tells R to open a new window so that we can look at the data set.
View(fram)

#16.17 quantile,summary,Determine the mean, median, and distribution of continuous variables
quantile(salary)
summary(salary)

#18 table, Determine the number and proportion
table(rank)

#19 prop, is proportion of values
prop.table(table(rank))

#20 na, let you work with not available values, and here it ommit them
na.omit(rank)
