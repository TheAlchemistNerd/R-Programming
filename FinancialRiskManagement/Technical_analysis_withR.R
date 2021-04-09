# Handling dates in R
as.Date("21Jan2004", "%d%b%Y")
as.Date("21/01/04", "%d/%m/%y")
as.Date("21-01-04", "%d-%m-%y")

# Financial data
#Converting date-time data from character
# as.POSIXct("03-12-2014", format = "%d-%m-%Y")

library(xts)
# Create an object using xts() function
dates <- as.Date(c("2016-01-01", "2016-01-02","2016-01-03"))
prices <- c(1.1, 2.2, 3.3)
x <- xts(prices, order.by = dates )

# Each observation has a time stamp
x[1]
first(x)
last(x)

# getting the timestamp
time(x[1])
as.numeric(x[1])

# lag(). used to move your data ahead
lag1_x <- lag(x, 1)
lag1_x


lag2_x <- lag(x, 2)
lag2_x

# The reason to use lag is that the first difference can't
# be calculated on x[i]-x[i-1]. instead use x - lag(x)

# To transfer timestamp use reclass() fuction
y <- c(1, 0, -1)
y <- reclass(y, x)
y

# Combine two xts objects with the same timestamp
z <- cbind(x, y)
z

# Dealing with missing entry in the data
# this leads calculation problems for the time series 
# Use the following ways to deal with problem:
# 1. na.omit() - take way those data points
# 2. na.approx() - take linear approx. Only available for tseries data.

# 
