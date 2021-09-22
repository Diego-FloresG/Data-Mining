# Practice #03

Scenario: You are a Data Scientist working for a consulting firm.
One of your colleagues from the Auditing Department has asked you
to help them assess the financial statement of organization X.

You have been supplied with two vector of data: mounthly revenue and
expenses for the financial year in quiestion. Your task is to calculate
the following financial matrics:

- profit for each mounth
- profit after tax for each month (the tax rate is 30%)
- profit margin for each month - equal to profit after tax divided by revenue
- good months - where the profit after tax was greater than the mean for the year
- bad months - where the profit after tax was less then the mean for years
- the best month - where the profit after tax was max for the year
- the worst month - where the profit after tax was min for the year

All results need to be presented as vectors.

Results for dollar values need to be calculate with $0.01 precision, but need to be
presented in Units of $1,000(i.e. 1k) with no decimal point.

Results for the profit margin ratio needed to be presented in units of % with no
decimal points.

Note: Your collegue has warned you that it is okay for tax for any given month to be
negative (in accounting terms, negative tax translates into a deferred tax asset).

Data

```r
revenue <- c(14574.49, 7606.46, 8611.41, 9175.41, 8058.65, 8105.44, 11496.28, 9766.09, 10305.32, 14379.96, 10713.97, 15433.50)
expenses <- c(12051.82, 5695.07, 12319.20, 12089.72, 8658.57, 840.20, 3285.73, 5821.12, 6976.93, 16618.61, 10054.37, 3803.96)

```

Solution
Calculate Profit As The Differences Between Revenue And Expenses

```r
profit <- revenue - expenses
profit

> profit
 [1]  2522.67  1911.39 -3707.79 -2914.31  -599.92  7265.24  8210.55  3944.97  3328.39 -2238.65   659.60
[12] 11629.54
```

Calculate Tax As 30% Of Profit And Round To 2 Decimal Points

```r
tax <- round(0.30 * profit, 2)
tax

> tax
 [1]   756.80   573.42 -1112.34  -874.29  -179.98  2179.57  2463.17  1183.49   998.52  -671.60   197.88
[12]  3488.86
```

Calculate Profit Remaining After Tax Is Deducted

```r
profit.after.tax <- profit - tax
profit.after.tax

> profit.after.tax
 [1]  1765.87  1337.97 -2595.45 -2040.02  -419.94  5085.67  5747.38  2761.48  2329.87 -1567.05   461.72
[12]  8140.68
```

Calculate The Profit Margin As Profit After Tax Over Revenue
Round To 2 Decimal Points, Then Multiply By 100 To Get %

```r
profit.margin <- round(profit.after.tax / revenue, 2) * 100
profit.margin

> profit.margin
 [1]  12  18 -30 -22  -5  63  50  28  23 -11   4  53
```

Calculate The Mean Profit After Tax For The 12 Months

```r
mean_pat <- mean(profit.after.tax)
mean_pat

> mean_pat
[1] 1750.682
```

Find The Months With Above-Mean Profit After Tax

```r
good.months <- profit.after.tax > mean_pat
good.months

> good.months
 [1]  TRUE FALSE FALSE FALSE FALSE  TRUE  TRUE  TRUE  TRUE FALSE FALSE  TRUE
```

Bad Months Are The Opposite Of Good Months !

```r
bad.months <- !good.months
bad.months

> bad.months
 [1] FALSE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE  TRUE  TRUE FALSE
```

The Best Month Is Where Profit After Tax Was Equal To The Maximum

```r
best.month <- profit.after.tax == max(profit.after.tax)
best.month

> best.month
 [1] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE
```

The Worst Month Is Where Profit After Tax Was Equal To The Minimum

```r
worst.month <- profit.after.tax == min(profit.after.tax)
worst.month

> worst.month
 [1] FALSE FALSE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
```

Convert All Calculations To Units Of One Thousand Dollars

```r
revenue.1000 <- round(revenue / 1000, 0)
expenses.1000 <- round(expenses / 1000, 0)
profit.1000 <- round(profit / 1000, 0)
profit.after.tax.1000 <- round(profit.after.tax / 1000, 0)
```

Print Results

```r
revenue.1000
expenses.1000
profit.1000
profit.after.tax.1000
profit.margin
good.months
bad.months
best.month
worst.month


> #Print Results
> revenue.1000
 [1] 15  8  9  9  8  8 11 10 10 14 11 15
> expenses.1000
 [1] 12  6 12 12  9  1  3  6  7 17 10  4
> profit.1000
 [1]  3  2 -4 -3 -1  7  8  4  3 -2  1 12
> profit.after.tax.1000
 [1]  2  1 -3 -2  0  5  6  3  2 -2  0  8
> profit.margin
 [1]  12  18 -30 -22  -5  63  50  28  23 -11   4  53
> good.months
 [1]  TRUE FALSE FALSE FALSE FALSE  TRUE  TRUE  TRUE  TRUE FALSE FALSE  TRUE
> bad.months
 [1] FALSE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE  TRUE  TRUE FALSE
> best.month
 [1] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE
> worst.month
 [1] FALSE FALSE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
```

BONUS:
Preview Of What's Coming In The Next Section

```r
M <- rbind(
  revenue.1000,
  expenses.1000,
  profit.1000,
  profit.after.tax.1000,
  profit.margin,
  good.months,
  bad.months,
  best.month,
  worst.month
)
```

Print The Matrix

```r
  M


> #Print The Matrix
> M
                      [,1] [,2] [,3] [,4] [,5] [,6] [,7] [,8] [,9] [,10] [,11] [,12]
revenue.1000            15    8    9    9    8    8   11   10   10    14    11    15
expenses.1000           12    6   12   12    9    1    3    6    7    17    10     4
profit.1000              3    2   -4   -3   -1    7    8    4    3    -2     1    12
profit.after.tax.1000    2    1   -3   -2    0    5    6    3    2    -2     0     8
profit.margin           12   18  -30  -22   -5   63   50   28   23   -11     4    53
good.months              1    0    0    0    0    1    1    1    1     0     0     1
bad.months               0    1    1    1    1    0    0    0    0     1     1     0
best.month               0    0    0    0    0    0    0    0    0     0     0     1
worst.month              0    0    1    0    0    0    0    0    0     0     0     0
```
