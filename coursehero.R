data <- c(0, 7, 1, 29,25, 8, 5, 1, 25, 98, 9, 0, 26,
          8, 118, 72, 0, 92, 52, 14, 3, 3, 44, 5, 42)
boxplot(data)
png(file = "boxplot.png") # give the file a name
boxplot(data)
dev.off() # save the file


group <- c('8-10', '10-12', '12-14', '14-16')
mid_point <- c(9, 11, 13, 15)
freq <- c(3, 7, 4, 1)
data <- data.frame(mid_point, freq, row.names = group, stringsAsFactors = F)
cummul.freq <- cumsum(freq)
cummul.freq
data$cummul.freq <- cummul.freq

# plotting the cumulative frequency distribution
plot(x = mid_point, y = cummul.freq, xlab = group, type = "l")


Y <- rbinom(1000, 20, .5)
pihat <- Y/20

U <- sqrt(20)*(pihat - .5)/(sqrt(.5*(1 - .5)))
par(mfrow = c(1,2))     # partitions the plotting screen into two
hist(U, nclass = 25, probability = T)
lines(density(U))    # plots the smooth density line

W <- sqrt(20)*((pihat/(1 - pihat)) - .5)/(sqrt(.5*(1 - .5)))
hist(W, nclass = 25, probability = T)
lines(density(W))

 
data <- c(45, 48, 62, 70, 73, 74, 74, 78, 78, 79, 79, 80, 80, 80, 80, 80, 80, 81, 82, 82)
data
plot(data, ylim = c(40, 85))
boxplot(data, ylim = c(40, 85))
fivenum(data)

library(tigerstats)
pnormGC(c(25, 30), region = "between", mean = 22, sd = 4, graph = T)

pnormGC(30, region = "above", mean = 22, sd = 4, graph = T)
qnormGC(0.1, region = "between",mean = 7.62, sd = 1.77/sqrt(40), graph = T)
pnormGC(50, region = "above", mean = 49, sd = 0.559, graph = T)
pnormGC(8, region = "below", mean = 7.65, sd = 0.1954, graph = T)
pnormGC(8, region = "below", mean = 7.65, sd = 2.15, graph = T)


par(mfrow = c(3, 4))
# top panel
qqnorm(rnorm(10)); qqnorm(rnorm(10)); qqnorm(rnorm(10)); qqnorm(rnorm(10))
# middle panel
qqnorm(rnorm(100)); qqnorm(rnorm(100)); qqnorm(rnorm(100)); qqnorm(rnorm(100))
# bottom panel
qqnorm(rnorm(1000)); qqnorm(rnorm(1000)); qqnorm(rnorm(1000)); qqnorm(rnorm(1000))