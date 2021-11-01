# Practice #02

Functions

Practice find 20 more functions in R and make an example of it.

1. Find sum of numbers frm 41 to 68.
   ```r
   print(sum(41:68))
   ```
2. Find mean of numbers from 25 to 82.
   ```r
   print(mean(25:82))
   ```
3. Abbreviate Strings
   ```r
   x <- c("abcd", "efgh", "abce")
   abbreviate(x, 2)
   abbreviate(x, 2, strict = TRUE)
   ```
4. Returns a character string of the current system date and time.
   ```r
   d <- date()
   ```
5. Read or Set the Declared Encodings for a Character Vector
   ```r
   x <- "fa\xE7ile"
   Encoding(x)
   Encoding(x) <- "latin1"
   ```
6. Warning Messages.
   ```r
   testit <- function() warning("Esto esta mal!!!!!")
   testit() ## shows call
   ```
7. Duplicated.
   ```r
   x <- c(9:20, 1:5, 3:7, 0:8)
   (xu <- x[!duplicated(x)])
   ```
8. Message.
   ```r
   message("ABC ", "DEF")
   ```
9. Names and Symbols.
   ```r
   an <- as.name("arrg")
   an
   is.name(an) # TRUE
   mode(an) # name
   typeof(an) # symbol
   ```
10. Character Vectors.

```r
form <- y ~ a + b + c
as.character(form) ## length 3
deparse(form) ## like the input
```

11. Read

```r
fram <- read.csv(file.choose())
```

12. File

```r
fram <- read.csv(file.choose())
```

13. Attach, R defaults to performing actions on this particular data set.

```r
attach(fram)
```

14. Detach, If you finish with an attached data set and want to work with another data set, you should detach the first one.

```r
detach(fram)
```

15. View, is a function that tells R to open a new window so that we can look at the data set.

```r
View(fram)
```

16. Quantile

```r
quantile(salary)
```

17. Summary, Determine the mean, median, and distribution of continuous variables

```r
summary(salary)
```

18. Table, Determine the number and proportion.

```r
table(rank)
```

19. Prop, is proportion of values.

```r
prop.table(table(rank))
```

20. na, let you work with not available values, and here it ommit them.

```r
na.omit(rank)
```
