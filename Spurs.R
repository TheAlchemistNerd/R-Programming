# Simple numerical integration
dt <- 0.005
t <-seq(0, pi/6, by = dt)
ft <- cos(t)
(I <- sum(ft)*dt)
I - sin(pi/6)    # error

# Exponential limit
x <- seq(10, 200, by = 10)
y <- (1 + 1/x)^x
exp(1) - y

plot(x, y)

# Matrices
B <- diag(c(1, 2, 3))
B

# Saving objects
save.image(file = "fname")

# Saving specific objects 
save(x, y, file = "fname")

# Saving history
savehistory(file = "fname")
getwd()

# Build 10 by 10 identity matrix. Make 
# al the non-zero elements 5.
M <- diag(rep(5,10))
M

# Running R programs
# 1. source("prog.r")
# 2. source("../scripts/prog.r")
# 3. type R CMD BATCH prog.r into a shell

# Finding the zeros of a polynomial
# a2*x^2 + a1*x + a0 = 0

# input
a2 <- 1
a1 <- 4
a0 <- 2

# Calculation
root1 <- (-a1 + sqrt(a1^2 - 4*a2*a0))/(2*a2)
root2 <- (-a1 - sqrt(a1^2 - 4*a2*a0))/(2*a2)

# output
print(c(root1, root2))


# An advanced approach
# find the zeros of a2*x^2 + a1*x + a0 = 0

# input
a2 <- 1
a1 <- 4
a0 <- 5

# calculate the discriminant
discrim <- a1^2 - 4*a2*a0
# Calculate the roots depending on the value of the discriminant
if(discrim > 0) {
  roots <- c((-a1 + sqrt(a1^2 - 4*a2*a0))/(2*a2),
             (-a1 - sqrt(a1^2 - 4*a2*a0))/(2*a2))
} else {
  if (discrim == 0) {
    roots <- -a1/(2*a2)
  } else {
    roots <- c()
  }
}

# output
show(roots)

# Exercise 
# using additional if statements rewrite the program 
# so that it can deal with the case a2 = 0 

# n factorial
# input 
n <- 6
n_factorial <- 1
for(i in 1:n){
  n_factorial <- n_factorial*i
}

# output
show(n_factorial)

# Forecast pension growth under compound interest
# Inputs 
r <- 0.11         # Annual interest rate
term <- 10        # Forecast duration (years)
period <- 1/12    # Time btn payments (years)
payments <- 100   # Amount deposited each period

# Calculations
n <- floor(term/period)   # Number of payments
pension <- 0
for(i in 1:n) {
  pension[i+1] <- pension[i]*(1 + r*period) + payments
}
time <- (0:n)*period

# Output
plot(time, pension)

# The above implementation is inefficient
# Consider these 2 programs
# Program 1   # preallocation
n <- 1000000
x < rep(0, n)   # makes it faster
for(i in 1:n){
  x[i] <- i
}

# Program 2    # redimensioning
n <- 1000000
x <- 1         # makes it slower
for(i in 2:n) {
  x[i] <- i
}

# The difference comes in, namely changing the size of a vector
# takes just as long as creating a new vector does. Each time the size changes R needs its allocation of memory
# to the object. in the 2nd program, each statement x[i] <- i changes the length of x from i -1 to i

# Fibonacci numbers
# Initialize variables
F <- c(1, 1) # lisst of Fibonacci numbers
n <- 2       # length of F

# iteratively calculate new Fibonacci numbers
while (F[n] <= 100) {
  # cat("n = ", n, " F[n] = ", F[n], "\n") 
  # cat() function allows us to combine text & variables
  n <- n + 1
  F[n] <- F[n - 1] + F[n -2]
}

# output
cat("The first Fibonacci number > 100 is F(", n, ") =", F[n], "\n")
F

# Loan amortization
# How long does it take to pay off a loan
r <- 0.11            # Annual interest rate
period <- 1/12       # Time between repayments (years) 
debt_initial <- 1000 # Amount borrowed 
repayments <- 12     # amount repaid each period

# Calculations
time <- 0
debt <- debt_initial
while (debt > 0) {
  time <- time + period
  debt <- debt*(1 + r*period) - repayments
}

# Output
cat('Loan will be repaid in', time, 'years\n')

# Vector based proogramming
x <- c(-2, -1, 1, 2)
ifelse(x > 0, "Positive", "Negative") # kinda ternary operator in R

pmin(c(1,2,3),c(3,2,1),c(2,2,2))

# Program flow
x <- 3
for (i in 1:3) {
  show(x)
  if (x %% 2 == 0) {
    x <- x/2
  } else {
    x <- 3*x + 1
  }
}
show(x)

# Debugging
# To ask R to convert warning into errors
options(warn = 2)

# To see how variable i changes
x <- 3
for (i in 1:3) {
  show(x)
  cat("i = ", i, "\n") # debugging
  if (x %% 2 == 0) {
    x <- x/2
  } else {
    x <- 3*x + 1
  }
}
show(x)

# Exercise
# input
x.values <- seq(-2, 2, by = 0.1)

# for each x calculate y
n <- length(x.values)

y.values <- rep(0, n)
for (i in 1:n){
  x <- x.values[i]
  if(x <= 0){
    y <- -x^3
  } else if(x > 0 &&  x <= 1){
    y <- x^2
  } else {
    y <- sqrt(x)
  }
  y.values[i] <- y
} 
# output
plot(x.values, y.values, type = "l")

# vectorised form
# input
x.values <- seq(-2, 2, by = 0.1)

# for each x calculate y
n <- length(x.values)

y.values <- rep(0, n)
for (i in 1:n){
  x <- x.values[i]
  ifelse(x <= 0, y <- -x^3, ifelse(x > 0 &&))
  y.values[i] <- y
} 
# output
plot(x.values, y.values, type = "l")


