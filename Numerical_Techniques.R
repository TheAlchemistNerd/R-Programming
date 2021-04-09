big.matrix <- matrix(1:1e6, nrow=1000)
colsums <- rep(NA, dim(big.matrix)[2])

# A double loop of summations
system.time({
  for (i in 1:dim(big.matrix)[2]){
    s <- 0
    for (j in 1:dim(big.matrix)[1]){
      s <- s + big.matrix[j, i]
    }
    colsums[i] <- s
  }
})

# The use of apply
system.time(
  colsums <- apply(big.matrix, 2, sum)
)

# a single loop of sums
system.time(
  for(i in 1:dim(big.matrix)[2]){
    colsums[i] <- sum(big.matrix[, i])
  }
)

# Using R dedicated function
system.time(
  colsums <- colSums(big.matrix)
)

# Parallel processing
library(parallel)
detectCores()

mc <- makeCluster(2)
clusterCall(mc, function(x) print("Pick me!"))

waste.of.time <- function(x) for (i in 1:1000) i
system.time(lapply(1:1000, waste.of.time))

system.time(parLapply(cl = mc, 1:1000, waste.of.time))

stopCluster(mc)

prime <- function(n) {
  # returns TRUE if n is prime
  # assumes n is a positive integer
  if(n == 1){
    is.prime <- FALSE
  } else if(n == 2) {
    is.prime = TRUE
  } else {
    is.prime <- TRUE
    m <- 2
    m.max <- sqrt(n)   # only want to calculate this once
    while(is.prime && m <= m.max) {
      if(n %%  m == 0) is.prime <- FALSE
      m <- m + 1
    }
  }
  return(is.prime)
}


prime100 <- prime(100)
prime100

# Root finding
fixedpoint <- function(ftn, x0, tol = 1e-9, max.iter = 100) {
  # applies the fixed point algorithm to find x such that ftn(x) == x
  # we assume that ftn is a function of a singlle variable
  #
  # x0 is the initial guess at the fixed point
  # the algorithm terminates when successive iterations are
  # within distance tol of each other
  # or the number of iterations exceed max.iter
  
  # do first iteration
  xold <- x0
  xnew <- ftn(xold)
  iter <- 1
  cat("At iteration 1 value of x is:", xnew, "\n")
  
  # continue iterating until stopping conditions are met
  while((abs(xnew-xold) > tol) && (iter < max.iter)) {
    xold <- xnew
    xnew <-ftn(xold);
    iter <- iter + 1
    cat("At iteration 1 value of x is:", xnew, "\n")
  }
    
  # output depends on the success of the algorithm
    if (abs(xnew - xold) > tol) {
      cat("Algorithm failed to converge\n")
      return(NULL)
    } else {
      cat("Algorithm converged\n")
      return(xnew)
    }
}

# Example
ftn1 <- function(x) return(exp(exp(-x)))
fixedpoint(ftn1, 2, tol = 1e-6)

ftn2 <- function(x) return(x-log(x) + exp(-x))
fixedpoint(ftn2, 2, tol = 1e-6)

ftn3 <- function(x) return(x+log(x) + exp(-x))
fixedpoint(ftn3, 2, tol = 1e-6, max.iter = 20)
