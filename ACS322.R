# SEcTION B Q1
# creating objects
m <- 15
n <- 17

# Adding the variables  
m + n

# Dividing the variables
m/n

# Dividing 17 by 15 without storing in variable
17/15

# Creating the function fn1()
fn1 <- function(x){
  return(x)
}

fn1(66)

# Creating the function mulp()
mulp <- function(a, b){
  result = a *b
  return(result)
}

# sending 40 and 80
mulp(40, 80)

# sending m and n
mulp(m, n)

# nesting the output of fn1(4) in mulp()
mulp(fn1(4), 8)

# SECTIONA Q1
x <- c(18, 23, 25, 35, 65, 54, 34, 56, 72, 19, 23, 42, 18, 39, 37)
y <- c(202, 186, 187, 180, 156, 169, 174, 172, 153, 199, 193, 174, 198, 183, 178)

# creating the linear regression model
model <- lm(y~x)

# plotting the results
plot(x,y, xlim = c(15,80), ylim = c(150, 205), 
     xlab = "Age(Years)", ylab = "Max Rate")

# Adding the fitted regression line
abline(lm(y~x))

out <- summary(model)


## Comment 
# by visualization the linear model best fits the data

# Hypothesis testing
# Ho: b = -1
# H1: b <> - 1

# Test statistic
# slope estimate
b <- coef(model)[2]
b

# standard error of the slope
se.b <- out$coefficients[2,2]
se.b

# Test statistic
T <- (b - (-1))/se.b
T

# Degrees of freedom
df <- length(x) - 2
df

# p-value
p.value <- pt(T, df, lower.tail = FALSE)
p.value


# SECTIOA Q2
# loading the dataset
library("datasets", lib.loc="C:/Program Files/R/R-3.6.2/library")

USArrest1 <- USArrests
dim(USArrest1)

crime <- c(USArrest1$Murder+USArrest1$UrbanPop+USArrest1$Rape)
crime
USArrest2 <- cbind(USArrest1, crime)
USArrest2

# subsetting the dataset
USArrests_highpop <- subset(USArrests, UrbanPop > 60)
USArrests_highpop

# ploting using ggplot2
library(ggplot2)

ggplot(USArrest1, aes(x=UrbanPop, y=Assault))+
  geom_bar(stat = "identity",color="black") +
  labs(x="Urban Population",y= "Assaults", title="Urban Population vs Assaults") +
  theme_bw()

# SECB Q3
x <- c(0.22, 0.38, 1.28, 0.54, 0.56, 1.36, 0.55, 0.37, 0.43, 0.46, 0.62,0.54, 0.54, 0.51, 0.44, 0.68, 0.55, 0.30)
xbar <- mean(x)
xbar

sd.x <- sd(x)
sd.x

# critical value
Zcalc <- qnorm(0.025, lower.tail = F)
Zcalc

# margin of error
n <- length(x)
me <- Zcalc*(sd.x/sqrt(n))
me

# lower limit
xbar - me

# upper limit
xbar + me

# Bootstrap Confidence Interval
# bootstrap mean
xbar.boot <- mean(rep(sample(x,n, replace = TRUE), 10000))
xbar.boot

# Bootstrap standard deviation 
sdx.boot <- sd(rep(sample(x,n, replace = TRUE), 10000))
sdx.boot

me.boot <- Zcalc*(sdx.boot/sqrt(n))
me.boot

# lower limit
xbar.boot - me.boot

# upper limit
xbar.boot + me.boot


