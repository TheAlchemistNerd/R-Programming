m=15
m
n=17
n
m+n
m/n
17/15
fn1 <- function(x){
  return(x)
}
fn1(66)
mulp=function(a,b){
  result=a*b
  return(result)
}
mulp2=function(a,b){
  return(a*b)
}
mulp(40,80)
mulp(m,n)

# non-linear least square
xvalues <- c(1.6, 2.1, 2, 2.23, 3.71, 3.25, 3.4, 3.86, 1.19, 2.21)
yvalues <- c(5.19, 7.43, 6.94, 8.11, 18.75, 14.88, 16.06, 19.12, 3.21, 21.7)

# plot these values
plot(xvalues, yvalues)

model <- nls(yvalues ~ b1*xvalues^2 + b2, start = list(b1 = 1, b2 = 3))
new.data <- data.frame(xvalues = seq(min(xvalues), max(xvalues), len = 100))
lines(new.data$xvalues, predict(model, new.data))

print(sum(resid(model)^2))
print(confint(model))

# Example 2
x <- seq(0, 10, 0.1)
y <- rnorm(101, 5, 1)

plot(x, y)
m <- nls(y~a*x^3+b*x+c, start = list(a=1, b=2, c=1))
lines(x, predict(m))

x <- seq(0, 100, 1)
y <- ((runif(1, 10, 20)*x)/((runif(1, 0, 10) + x)))
m<-nls(y~a * x/(b + x), start = list(a = 1, b = 2))
cor(y, predict(m))
print(sum(resid(m)^2))
plot(x, y)
lines(x, predict(m))

# Optimization
# One dimensional problems
func <- function(x){
  return((x - 2)^2)
}
(func(-2))

# plot the funtion using the the curve function 
curve(func, -4, 8)

# plot using a grid
grid <- seq(-10, 10, by=.1)
func(grid)
plot(grid, func(grid))

# you can find minimum using the optimize function
optimize(f=func, interval = c(-10, 10))

# BFGS Method
func <- function(x){
  out <- (x[1]-2)^2 * (x[2]-1)^2
  return(out)
}
optim(par = c(0,0), fn=func, gr=NULL,
      method = c("BFGS"),
      lower = -Inf, upper = Inf,
      control = list(), hessian = T) 

# Nelder Mead simplex algorithm
optim(par = c(0,0), fn=func, gr=NULL,
      method = c("Nelder-Mead"),
      lower = -Inf, upper = Inf,
      control = list(), hessian = T)
library(lpSolve)
objective.in <- c(25, 20)
const.mat <- matrix(c(20, 12, 1/15, 1/15), byrow = TRUE)
const.rhs <- c(1800, 8)
const.dir<-c("<=", "<=")
optimum <- lp(direction = "max", objective.in,const.mat,const.dir,
              const.rhs)
optimum$solution
optimum$objval

g <- D()