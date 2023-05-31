nothern.teams <-c(86, 74, 69, 59, 59, 45, 39)
southern.teams <-c(67, 66, 65, 62, 61, 55, 45, 44, 43, 41, 28, 26, 23)

wilcox.test(nothern.teams, southern.teams)


## Question 4
setwd("C:/Users/qwert/Downloads")
# import the data 
rut2000_data <- read.csv(file.choose())

# transform columns
rut2000_data$Date <- as.Date(rut2000_data$Date)
# We will use the closing price for analysis
rut2000_data$Close <- as.numeric(rut2000_data$Close)

# remove NAs
rut2000_data <- na.omit(rut2000_data)

# Calculating the log returns
prices <- rut2000_data$Close
prices
n <- length(prices)
log_returns <- log(prices[-1]/prices[-n])
log_returns

res <- log_returns - mean(log_returns)
library("fGarch")
# Fitting the GARCH(1, 1) model
GARCH_rut2000 <- garchFit(data = res, trace = F)
summary(GARCH_rut2000)


## Question 2
# save the table as table.txt file in a relative location
df <- read.delim(file.choose())

# Data Cleaning
df <- read.csv(file.choose())

# some data cleaning
df$X <- NULL
df$X.1 <- NULL
years <- as.character(1981:1990)
years
colnames(df) <- c("Months", years)
row.names(df) <- df$Months
df$Months <- NULL

model <- lm(df$"1990" ~ df$"1981"+df$"1982"+df$"1983"+df$"1983"+df$"1984"+df$"1985"+df$"1986"+df$"1987"+df$"1988"+df$"1989", data = df)
summary(model)

predict(model , newdata = df$"2000")

month<-rep(c("January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"), 10)
year
year<-rep(c(1981, 1982, 1983, 1984, 1985, 1986, 1987, 1988, 1989, 1990), c(12, 12, 12, 12, 12, 12, 12, 12, 12, 12))


# Durbin-Watson test
library("car")
durbinWatsonTest(model)

## Question 3
abs<-rep(c(4, 3, 2, 1, "unrated"), c(239, 554, 97, 18, 67))
abs<-factor(abs)
REF4<-rep(c(4, 3, 2, 1), c(94, 95, 47, 3))
REF3<-rep(c(4, 3, 2, 1), c(80, 296, 150, 28))
REF2<-rep(c(4, 3, 2, 1), c(4, 29, 54, 10))
REF1<-rep(c(4, 3, 2, 1), c(2, 1, 9, 6))
REFunrated<-rep(c(4, 3, 2, 1), c(3, 6, 37, 21))
R<-c(REF4, REF3, REF2, REF1, REFunrated)	
y<-(R-1)/3

model <- glm(y ~ REF4 + REF3 + REF2 + REF1 + REFunrated family = "binomial")
summary(model)
