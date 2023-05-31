library("quantmod")
library("tidyquant")
library("tidyverse")
library("ggplot2")
library("moments")

# Downloading djia dataset from 2008-01-01 to 2021-12-24
dji <- tq_index("DOW") # getting the holding of the DJI
# complete_cases = TRUE removes symbols that return NA values so no need for extra steps for
# removal of missing values

tickers <- dji$symbol
dji_dat <- tq_get(tickers,
                  get = "stock.prices",
                  complete_cases = TRUE,
                  from = "2008-01-01",
                  to = "2021-12-23")
# store the data
write.csv(dji_dat, file = "dji_dat.csv", sep = ",")
# dji_dat <- read.csv(file.choose())

# Counting the number of observations of each symbol
Symbol_count <- dji_dat %>%
  group_by(symbol) %>%
  count()

# remove the DOW, KD and V Symbols
dji_data <- dji_dat[!(dji_dat$symbol == 'DOW' | dji_dat$symbol == 'KD' | dji_dat$symbol == 'V'),]

# Counting the number of observations of each symbol
Symbol_count <- dji_data %>%
  group_by(symbol) %>%
  count()

# Calculating the monthly returns for all stocks
monthly_returns <- dji_data %>%
  group_by(symbol) %>%     # group stocks by symbols
  tq_transmute(select = adjusted,
               mutate_fun = periodReturn,
               period = "monthly",
               col_rename = "Returns")

monthly_returns %>%
  group_by(symbol) %>%
  slice(1, n())

# Computing  momentum of each stock for every month
# Convert daily prices to monthly prices
prices_monthly <- dji_data %>%
  group_by(symbol) %>%
  tq_transmute(select = adjusted,
               mutate_fun = to.monthly,
               indexAt = "lastof")

prices_monthly %>%
  slice(1, n())

n_lag <- 12

stocks_momentum <- prices_monthly %>%
  group_by(symbol) %>%
  mutate(Momentum = ((adjusted / lag(adjusted, n_lag)) - 1))

stocks_momentum %>%
  slice(1, n())

# In this section we're building a quintile portfolio
# convert the data into wide format
stocks_momentum <- with(stocks_momentum, data.frame(symbol, date, Momentum))
stocks_momentum.wide <- pivot_wider(stocks_momentum, names_from = symbol, values_from = Momentum)
# stocks_momentum.wide$date <- as.numeric(as.POSIXct(stocks_momentum.wide$date))

#quintile_portfolio_fun <- function(df) {
#  X <- df
#  N <- ncol(X)
# design quintile portfolio
#  ranking <- sort(colMeans(X, na.rm = T), decreasing = TRUE, index.return = TRUE)$ix
#  w <- rep(0, N)
#  w[ranking[1:round(N/5)]] <- 1/round(N/5)
#  return(w)
#}
# momentum_portfolio <- quintile_portfolio_fun(stocks_momentum.wide)
df <- select(stocks_momentum.wide, -date)

# monthly ranking of the portfolio according to their momentum
ranked <- list()
for (i in 1:nrow(stocks_momentum.wide))
{
  ranking <- sort(df[i, ], decreasing = T, index.return = T)
  ranked <- append(ranked, ranking)
}

tickers <- unique(stocks_momentum$symbol)
ranked.array <- array(unlist(ranked), dim = c(1, 28, 168), dimnames = list("momentum", tickers, as.character(stocks_momentum.wide$date)))

head(ranked.array)


# Getting the top and bottom momentum portfolios every month
top_momentum.portfolio <- array(dim = c(1, 5, 168), dimnames = list("momentum", 1:5, as.character(stocks_momentum.wide$date)))
for (i in as.character(stocks_momentum.wide$date))
{
  top_momentum.portfolio[,1:5,i] <- ranked.array[1, 1:5, i]
}
bottom_momentum.portfolio <- array(dim = c(1, 5, 168), dimnames = list("momentum", 1:5, as.character(stocks_momentum.wide$date)))

for (i in as.character(stocks_momentum.wide$date))
{
  bottom_momentum.portfolio[,1:5,i] <- ranked.array[1, 24:28, i]
}

head(top_momentum.portfolio)
head(bottom_momentum.portfolio)
# weights
top_w <- array(dim = c(1, 5, 168), dimnames = list("weight", 1:5, as.character(stocks_momentum.wide$date)))
for (i in as.character(stocks_momentum.wide$date))
{
  top_w[, 1:5, i] <- top_momentum.portfolio[, 1:5, i]/(sum(top_momentum.portfolio[, 1:5, i]))
}
# top_w

bottom_w <- array(dim = c(1, 5, 168), dimnames = list("weight", 1:5, as.character(stocks_momentum.wide$date)))
for (i in as.character(stocks_momentum.wide$date))
{
  bottom_w[, 1:5, i] <- bottom_momentum.portfolio[, 1:5, i]/(sum(bottom_momentum.portfolio[, 1:5, i]))
}
# bottom_w

# Weighted Portfolios Average returns
Weighted_return_top <- rep(0, 168)
for (i in 1:168)
{
  Weighted_return_top[i] <- mean((top_momentum.portfolio[, 1:5, i])*(top_w[,1:5, i]))
}

Weighted_return_bottom <- rep(0, 168)
for (i in 1:168)
{
  Weighted_return_bottom[i] <- mean((bottom_momentum.portfolio[, 1:5, i])*(bottom_w[,1:5, i]))
}

# Plotting the weighted portfolio returns
#plot(x = 1:168, y = Weighted_return_top, type = "l", col ="green")
#plot(x = 1:168, y = Weighted_return_bottom, type = "l", col = "red")

plot(x = 1:168, y = Weighted_return_top, type = "l", 
     col = "green", ylim = c(-0.4, 1), 
     ylab = "Weighted Average Returns", xlab = "time", 
     main = "Plot of top (green) and bottom (red) momentum portfolio")
lines(x = 1:168, y = Weighted_return_bottom, col = "red")

# Long- Short Portfolio
LSPort <- Weighted_return_top - Weighted_return_bottom
plot(x = 1:168, y = LSPort, 
     type = "l", col = "blue", xlab = "time",
     main = "Plot of Long-Short Portfolio")

plot(x = 1:168, y = Weighted_return_top, 
     type = "l", col = "green", ylim = c(-1, 1), 
     ylab = "Weighted Returns", xlab = "time",
     main = "Plot of top (green), bottom (red) and Long-Short (blue) momentum portfolio")
lines(x = 1:168, y = Weighted_return_bottom, col = "red")
lines(x = 1:168, y = LSPort, type = "l", col = "blue", xlab = "time")

# Performance Measures
performance.measures <- function(x)
{
  annualized_return <- prod((1 + x), na.rm =T)^(12/length(x))
  annualized_volatility <- sd(x)*sqrt(12)
  sharpe_ratio <- mean(x, na.rm = T)*sqrt(12)/sd(x, na.rm = T)
  skew <- moments::skewness(x, na.rm = T)
  kurt <- moments::kurtosis(x, na.rm = T)
  measures <- c(annualized_return, annualized_volatility,
                sharpe_ratio, skew, kurt)
  return(measures)
}

Weighted_returns <- data.frame(LSPort, Weighted_return_top, Weighted_return_bottom)
colnames(Weighted_returns) <- c("Long-Short", "top-momentum", "bottom-momentum")
# date <- as.POSIXct(stocks_momentum.wide$date, origin = "2008-01-3")
# date

# Weighted_returns <- xts(date,Weighted_returns)
stats_table <- t(data.frame(apply(Weighted_returns, 2, performance.measures)))
colnames(stats_table) <- c("a_return", "a_volatility",
                           "sharpeRatio", "skew", "kurt")
stats_table

# equally weighted portfolio
monthly_returns.wide <- pivot_wider(monthly_returns, names_from = symbol, values_from = Returns)
df_ <- select(monthly_returns.wide, -date)
N <- ncol(df_)    # number of assets
weight <- 1/N
col_names <- colnames(df)

monthly.weighted_returns <- (as.matrix(df_))*weight

equally_weighted.portflio <- rowMeans(monthly.weighted_returns)

stats <- t(data.frame(performance.measures(equally_weighted.portflio)))
colnames(stats) <- c("a_return", "a_volatility",
                     "sharpeRatio", "skew", "kurt")
row.names(stats) <- "equally_wgt_port"



