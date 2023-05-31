library("zoo")
library("splines")

# Running mean
# Read the dataset, navigate to the cohhpop.csv location on the pc
dataset <- read.csv(file.choose(), header = F)
colnames(dataset) <- c("age", "pop")

# calculating the running mean
running_mean <- as.data.frame(rollmean(dataset, 2))    # rollmean function is in the zoo package

# A scatter plot of pop as a fuction of age
with(dataset, plot(x = age, y = pop, main = "population by age", ylim = c(0, 1800)))
lines(running_mean,col="green")

# loess smoother
smoother <- with(dataset, loess(pop ~ age, span = 0.25))
pop_pred <- with(dataset, predict(smoother, age))
lines(pop_pred,col = "red")    # add to the previous plot

# cubic spline
model <- lm(pop ~ bs(age, knots = c(25, 50, 75)), data = dataset)
pop_smooth <- with(dataset, predict(model))
lines(pop_smooth,col = "yellow")    # add to the previous plot


# A scatter plot of pop as a fuction of age
with(dataset, plot(x = age, y = pop, main = "population by age", ylim = c(0, 1800)))

model <- lm(pop ~ bs(age, knots = c(20, 40, 60, 80)), data = dataset)
pop_smooth <- with(dataset, predict(model))
lines(pop_smooth,col = "purple")    # add to the previous plot

quant <- with(dataset, quantile(age))[2:4]
model <- lm(pop ~ bs(age, knots = quant), data = dataset)
pop_smooth <- with(dataset, predict(model))
lines(pop_smooth,col = "orange")    # add to the previous plot

# previous question
model <- lm(pop ~ bs(age, knots = c(25, 50, 75)), data = dataset)
pop_smooth <- with(dataset, predict(model))
lines(pop_smooth,col = "yellow")    # add to the previous plot
