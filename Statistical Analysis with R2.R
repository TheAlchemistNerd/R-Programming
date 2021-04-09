heights <- c(36, 42, 43, 37, 40, 45)
mean(heights)
library(MASS)
# Average horsepower of the cars made in the US Cars93 dataframe.
Horsepower.USA <- Cars93$Horsepower[Cars93$Origin == "USA"]
mean(Horsepower.USA)

# Eliminate $-signs forth with()
with(Cars93, mean(Horsepower[Origin == "USA"]))
with(Cars93, mean(Horsepower[Origin == "non-USA"]))

# Multiple Conditions.
with(Cars93, mean(Horsepower[Origin == "USA" & Cylinders ==4]))

library(ggplot2)

#Exploring the data.
ggplot(Cars93, aes(x=Horsepower))+
  geom_histogram(color="black", fill="red",binwidth = 10)+
  facet_wrap(~Origin)

# Trimmed mean, dealing with outliers.
with(Cars93, mean(Horsepower[Origin == "USA"], trim = .05))

# Geometric Mean
invest <- c(1.10,1.15,1.10,1.20,1.05)
gm.invest <- (prod(invest))^(1/(length(invest)))
gm.invest
# Harmonic Mean.
speeds <- c(30,50)
1/speeds
hm.speeds <- 1/mean(1/speeds)
hm.speeds

# Medians
reading.speeds <- c(56, 78, 45, 49, 55, 62)
mean(reading.speeds)

reading.speeds.new <- replace(reading.speeds,reading.speeds == 78,180)
reading.speeds.new
mean(reading.speeds.new) # The new mean is misleading except for the new value

median(reading.speeds)
median(reading.speeds.new)

# Replication of Scores
with(Cars93, Horsepower.Four <- Horsepower[Cylinders == 4])
sort(Horsepower.Four)

any(grepl("modeest",installed.packages()))

# Variance in R
heights <- c(50, 47, 52, 46, 45)
var(heights) #Calculates the Sample variance(N-1 in the denominator).

# Population variance
var(heights)*(length(heights)-1)/length(heights)

# User-defined function.
var.p = function(x){
		var(x)*(length(x)-1)/length(x)
}

var.p(heights)

# Standard Deviations
sd(heights) # Sample Standard deviation.

# Population Standard deviation
sd(heights)*(sqrt((length(heights)-1)/length(heights)))

# User-defined function.
sd.p = function(x){
		sd(x)*sqrt((length(x)-1)/length(x))
}
sd.p(heights)

# Conditions
# the variance of the horsepowers of cars that originated in the USA
with(Cars93, var(Horsepower[Origin == "USA"]))

# How many of those cars are in this group?
with(Cars93, length(Horsepower[Origin == "USA"]))

# How about the non-USA cars?
with(Cars93, var(Horsepower[Origin == "non-USA"]))
with(Cars93, length(Horsepower[Origin == "non-USA"]))

# Standard Deviations 
with(Cars93, sd(Horsepower[Origin == "USA"]))
with(Cars93, sd(Horsepower[Origin == "non-USA"]))

# Standard Scores
Horsepower.USA.Eight <- Cars93$Horsepower[Cars93$Origin == "USA" & Cars93$Cylinders == 8]
Horsepower.USA.Eight
scale(Horsepower.USA.Eight)

# Ranking in R
Horsepower.USA.Eight
rank(Horsepower.USA.Eight)	# The Default order is Ascending
# Descending put a minus sign (?) in front of the vector name:
rank(-Horsepower.USA.Eight)

# Dealing with tied Scores
# Replace the 6th value(210) in horsepwer.USA.Eight with 200
tied.Horsepower <- replace(Horsepower.USA.Eight,6,200)
tied.Horsepower
# give each tied score the average of the ranks they would have attained
rank(tied.Horsepower, ties.method = "average")
# Assign the minimum of the rank
rank(tied.Horsepower, ties.method = "min")
# Assign the maximum of the rank
rank(tied.Horsepower, ties.method = "max") 

# Nth Smallest, Nth largest

sort(Horsepower.USA.Eight)
# Second lowest
sort(Horsepower.USA.Eight)[2]

# Second highest
N <- length(Horsepower.USA.Eight)
sort(Horsepower.USA.Eight)[N-1]

# Percentiles   work on sorted data
# Default type= 7
# Consistent with "inclusive" and (if necesssary) interpolates values for the percetiles
quantile(Horsepower.USA.Eight)

# Percentiles Consistent with "exclusive" type = 6
quantile(Horsepower.USA.Eight, type = 6)

quantile(Horsepower.USA.Eight, c(.54, .68, .91))

percent.ranks <-function(x){
			round((rank(x)/length(x))*100,
			digits = 2)
}
percent.ranks(Horsepower.USA.Eight)

# A neat trick
# Knowing only the percent rank of a single score in a set of scores
mean(Horsepower.USA.Eight <= 273)*100

# Summarizing
fivenum(Horsepower.USA.Eight)
summary(Horsepower.USA.Eight)

#Summarizing it All
length(Cars93) # Returns the umber of variables in the data frame
ncol(Cars93) # Does the same

nrow(Cars93) # no of cases(rows)

sum(Cars93$Origin == "USA") # to count number of USA-originated cars,
sum(Cars93$Origin != "USA") # to count the number of non-USA cars

sum(Cars93$Origin == "USA" & Cars93$Cylinders == 4) # 4-cylinder USA cars
with(Cars93, sum(Origin == "USA" & Cylinders == 4)) # no $-signs

Horsepower.USA.Four <- Cars93$Horsepower[Cars93$Origin == "USA" & Cars93$Cylinders == 4]
length(Horsepower.USA.Four)

#The High and the Low
max(Horsepower.USA.Four)
min(Horsepower.USA.Four)

range(Horsepower.USA.Four)

# Living in moments
cen.mom <-function(x,y){ # x-the vector y- the order
		mean((x - mean(x))^y)
}

Horsepower.USA <- Cars93$Horsepower[Cars93$Origin == "USA"]
cen.mom(Horsepower.USA,2)
cen.mom(Horsepower.USA,3)
cen.mom(Horsepower.USA,4)

with(Cars93, var.p(Horsepower[Origin == "USA"])) # same as the 2nd central moment.

# Skewness
cen.mom(Horsepower.USA,3)/cen.mom(Horsepower.USA,2)^1.5

# Requires moments package 
any(grepl("moments",installed.packages()))
library("moments")
skewness(Horsepower.USA) # Positive skewness

# Comparison with NonUSA cars
Horsepower.NonUSA <- Cars93$Horsepower[Cars93$Origin == "non-USA"]
skewness(Horsepower.NonUSA)

ggplot(Cars93, aes(x=Horsepower)) +
geom_histogram(color="black", fill="white",binwidth = 10)+
facet_wrap(~Origin)

# It?s sometimes easier to see trends in a density plot rather than in a histogram

ggplot(Cars93, aes(x=Horsepower)) +
  geom_density() +
  facet_wrap(~Origin)

# Kurtosis
cen.mom(Horsepower.USA,4)/cen.mom(Horsepower.USA,2)^2

# from the moments package
kurtosis(Horsepower.USA)

kurtosis(Horsepower.NonUSA)

# Nominal variables
car.types <-table(Cars93$Type)
car.types

prop.table(car.types) # Expresses these frequencies as proportins of the whole amount
round(prop.table(car.types),2) # round off to 2 decimal places.

margin.table(car.types) # adds up the frequencies

# Numerical variables
# To creae a table of frequencies, use the graphic function hist()
# Set the plot argument to false
# Returns a list of components

prices <- hist(Cars93$Price, plot=F, breaks=5)
prices

# Use mids(interval-midpoints) and counts to make matrix of frequencies
# then a data frame
prices.matrix <- matrix(c(prices$mids, prices$counts), ncol = 2)
prices.frame <- data.frame(prices.matrix)
colnames(prices.frame) <- c("Price Midpoint (x $1000)", "Frequency")
prices.frame

# Cumulative Frequency
prices$counts
cumsum(prices$counts)

#To plot a cumulative frquency histogram substitute the cumulative frequencies vector for the original one.
prices$counts <- cumsum(prices$counts)

plot(prices, main = "Cumulative Histogram", xlab = "Price", ylab = "Cumulative Frequency")

# Empirical cumulative distribution function(ecdf)
# Shows the proportion of scores that are less than or equal to each scores
# y-axis label cold also be "Percentile(Price)"
plot(ecdf(Cars93$Price), xlab = "Price", ylab = "Fn(Price)") # Fn means cumulative function

ggplot(NULL, aes(x=Cars93$Price)) +
  geom_step(stat="ecdf") +
  labs(x= "Price X $1,000",y = "Fn(Price)")

# Adding a dashed vertical line at each quartile
# First put the quartile info in a vector
price.q <-quantile(Cars93$Price)

ggplot(NULL, aes(x=Cars93$Price)) +
  geom_step(stat="ecdf") +
  labs(x= "Price X $1,000",y = "Fn(Price)")+
  geom_vline(aes(xintercept = price.q),linetype = "dashed")

# Implementing on base r graphics
plot(ecdf(Cars93$Price), xlab = "Price", ylab = "Fn(Price)")
abline(v = price.q,linetype = "dashed")

# Put the quartile values on the axis
ggplot(NULL, aes(x=Cars93$Price)) +
  geom_step(stat="ecdf") +
  labs(x= "Price X $1,000",y = "Fn(Price)")+
  geom_vline(aes(xintercept = price.q),linetype = "dashed")+
  scale_x_continuous(breaks = price.q,labels = price.q)

#Stem-and-leaf plot

# An example with prices in Cars93 rounded off to the nearest whole number
rounded <- (round(sort(Cars93$Price),0))

# Use cat() to display the rounded values  
# because the value of its fill argument limits the no of xters 
# including spaces  on each line
rounded <- (round(sort(Cars93$Price),0))
cat(rounded, fill = 50)

stem(Cars93$Price) # produces the stem-and-leaf plot

# Summarizing a Data Frame
autos <- subset(Cars93, select = c(MPG.city,Type, Cylinders,Price, Horsepower))
summary(autos)

any(grepl("Hmisc",installed.packages()))
library(Hmisc)
describe.data.frame(autos)
datadensity(autos) # gives the graphic functions

# normal distribution
# Density function
dnorm(100,m=100,s=15)

# plotting a normal curve
x.values <- seq(40,160,1) # creates a sequence of 121 members
sd.values <- seq(40,160,15) # a vector of the 9 standard deviation values
zeros9 <- rep(0,9) # for creating the vertical dashed lines

ggplot(NULL,aes(x=x.values,y=dnorm(x.values,m=100,s=15))) +
  geom_line() +
  labs(x="IQ",y="f(IQ)") +
  scale_x_continuous(breaks=sd.values,labels = sd.values) +
  geom_segment((aes(x=sd.values,y=zeros9,xend =
		sd.values,yend=dnorm(sd.values,m=100,s=15))),
		linetype = "dashed") +
  scale_y_continuous(expand = c(0,0))

# cumulative density function
pnorm(100,m=100,s=15) # returns the probality of a score less than x
pnorm(85,m=100,s=15)
pnorm(85,m=100,s=15, lower.tail = FALSE) # returns probaility of a score greater than x

# finding the probability of a score between a lowwer bound and upper boound
any(grepl("tigerstats",installed.packages()))
library("tigerstats")
pnormGC(c(85,100),region="between",m=100,s=15,graph=TRUE)

# Plotting the cdf
ggplot(NULL,aes(x=x.values,y=pnorm(x.values,m=100,s=15))) +
  geom_line() +
  labs(x="IQ",y="f(IQ)") +
  scale_x_continuous(breaks=sd.values,labels = sd.values) +
  geom_segment((aes(x=sd.values,y=zeros9,xend =
		sd.values,yend=pnorm(sd.values,m=100,s=15))),
		linetype = "dashed") +
  scale_y_continuous(expand = c(0,0))

# Quantiles of normal distributions
# find a score that cuts off the area(to the left)
qnorm(0.1586553,m=100,s=15) # Inverse of the pnorm() function
qnorm(0.1586553,m=100,s=15, lower.tail = FALSE) # a score that cuts off area to the right
 
qnormGC(.1586553, region = "below",m=100,s=15, graph=TRUE) # tigerstats package
qnorm(c(0,.25,.50,.75,1.00),m=100,s=15) # quartiles # cdf never touches x-axis nor reache exact maximum
round(qnorm(c(.25,.50,.75),m=100,s=15)) # best if rounded off

# plotting cdf with quartiles
# replace the standard deviation values with quartiles
q.values <-round(qnorm(c(.25,.50,.75),m=100,s=15))
zeros3 <- c(0,0,0)

ggplot(NULL,aes(x=x.values,y=pnorm(x.values,m=100,s=15))) +
  geom_line() +
  labs(x="IQ",y="f(IQ)") +
  scale_x_continuous(breaks=q.values,labels = q.values) +
  geom_segment((aes(x=q.values,y=zeros3,xend =
		q.values,yend=pnorm(sd.values,m=100,s=15))),
		linetype = "dashed") +
  scale_y_continuous(expand = c(0,0))

# Random sampling
rnorm(5,m=100,s=15)# generates 5 random numbers
rnorm(5,m=100,s=15)

set.seed(7637060) # for reproducing randomization results
rnorm(5,m=100,s=15)

set.seed(7637060) 
rnorm(5,m=100,s=15)

# Standard normal distribution
# Don't specify the mean and te standard deviation
dnorm(0)
pnorm(0)
qnorm(c(.25,.50,.75))
# Standard normal distribution
# Don't specify the mean and te standard deviation
dnorm(0)
pnorm(0)
qnorm(c(.25,.50,.75))
rnorm(5)

library("tigerstats")    # loading the tigerstats package
# tigerstat functions
pnormGC(c(-1,0),region="between")
qnormGC(.50, region = "below")

# Plotting the standard normal distribution
z.values <-seq(-4,4,.01)
z.sd.values <- seq(-4,4,1)

ggplot(NULL,aes(x=z.values,y=dnorm(z.values))) +
  geom_line() +
  labs(x="z",y="f(z)")+
  scale_x_continuous(breaks=z.sd.values,labels=z.sd.values) +
  geom_segment((aes(x=z.sd.values,y=zeros9,xend =
		z.sd.values,yend=dnorm(z.sd.values))),linetype =
		"dashed")+
  scale_y_continuous(expand=c(0,0))

