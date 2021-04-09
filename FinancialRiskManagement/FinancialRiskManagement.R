
#correlogram. acf vs k lag
set.seed(1)
rnorm(1000)
acf(rnorm(1000))

#variance function 
set.seed(1)
var(rnorm(1000, mean=0, sd=1))


#random walk process and its acf
set.seed(4)
x<- w <- rnorm(1000)
for (t in 2:1000)
  x[t] <- x[t-1] + w[t]
plot(x, type="l")
acf(x)
acf(diff(x))

#random walk to model some actual data
require('quantmod')
getSymbols('MSFT', src='yahoo')
MSFT
plot(MSFT, type="l")
acf(diff(Ad(MSFT)), na.action = na.omit)

#Correlogram of the Difference Series from the S&P500 Adjusted Close 
getSymbols('^GSPC', src='yahoo')
acf(diff(Ad(GSPC)), na.action = na.omit)

