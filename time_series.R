R code
# Use arima.sim() to generate WN data
white_noise <- arima.sim(model = list(order = c(0,0,0)), n = 100)

# Use cumsum() to convert your WN data to RW
random_walk <-cumsum(white_noise)

# Use arima.sim() to generate WN drift data

wn_drift <- arima.sim(model = list(order = c(0, 0,0)), n = 100, mean = 0.4)

# Use cumsum() to convert your WN drift data to RW drift
rw_drift <- cumsum(wn_drift)

# Plot all four data objects
plot.ts(cbind(white_noise, random_walk, wn_drift, rw_drift))



 