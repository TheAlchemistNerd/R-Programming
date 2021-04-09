# Simulating the central limit theorem
values <- c(1, 2, 3)
probabilities <- c(1/3, 1/3, 1/3)

# A vector to hold the sample means
smpl.means <- NULL

# reproducible result
set.seed(7637060)

# draw a sample from the pop
# append the mean of the sample 
# to the sample means vector
# loop for 600 samples

for (i in 1:600){
   smpl <- sample(x = values, prob = probabilities,
       size = 3, replace = TRUE)
   smpl.means <- append(smpl.means, mean(smpl))
}

# Visualize your results
library("ggplot2")
ggplot(NULL, aes(x = smpl.means)) +
  geom_histogram()

# list the unique values
uniq.means <- unique(smpl.means)

# round to 2dp
m.values <- round(uniq.means, 2)

# rescaling the x-axis
scale_x_continuous(breaks = m.values, labels = m.values)
# Eliminating the space btn x-axis values and the x-axis
scale_y_continuous(expand = c(0, 0))

# Use expression syntax to display xbar
# as the x-axis and freq(xbar) as y-axis labels
labs(x = expression(bar(X)), y = expression(frequency(bar(X))))

# putting it all together
ggplot(NULL,aes(x=smpl.means)) +
  geom_histogram()+
  scale_x_continuous(breaks=m.values,label=m.values)+
  scale_y_continuous(expand = c(0,0)) +
  labs(x=expression(bar(X)),y=expression
       (frequency(bar(X))))

# Predictions of the CLT
# the mean
E.values <- sum(values*probabilities)
E.values

# the variance
var.values <- sum((values - E.values)^2*probabilities)
var.values

sd.values = (sqrt(var.values))
sd.values

# x-tics of the sampling distribution
mean(smpl.means)
sd(smpl.means)

# Calculating confidence limits
mean.battery <- 60
sd.battery <- 20
N <- 100
error <- qnorm(.025, lower.tail = F)*sd.battery/sqrt(N)
lower <- mean.battery - error
upper <- mean.battery + error
lower
upper

# Use t-dist for small samples(N < 30)
N <- 25
df = N-1
error <- qt(.025, df, lower.tail = F)*sd.battery/sqrt(N)
lower <- mean.battery - error
upper <- mean.battery + error
lower
upper

# Use t.test() with raw data
battery.data <- c(82,64,68,44,54,47,50,85,51,41,61,84,
                  53,83,91,43,35,36,33,87,90,86,49,37,48)
# generate  90 percent confidence limits
t.test(battery.data, conf.level=.90)

# Create a z.test() function
z.test = function(x, mu, popvar){
  one.tail.p <- NULL # a vector to hold one-tailed prob of the z-score
  z.score <- round((mean(x)-mu)/(popvar/sqrt(length(x))), 3)
  one.tail.p <- round(pnorm(abs(z.score), lower.tail = F), 3)
  cat(" z =", z.score, "\n",
      "one-tailed probability =", one.tail.p, "\n",
      "two-tailed probability =", 2*one.tail.p)
}
IQ.data <- c(100,101,104,109,125,116,105,108,110)
z.test(IQ.data,100,15)

# t-testing in R
FarKlempt.data <- c(3,6,9,9,4,10,6,4,12)
t.test(FarKlempt.data,mu = 4, alternative = "greater")

# Working with t-distriutions
t.values <- seq(4, 4, .1)
round(dt(t.values, 12), 2)
round(pt(t.values, 12), 2)

# quartile information
quartiles <- c(0,.25,.50,.75,1)
qt(quartiles,12)

# generating random numbers
round(rt(8,12),2)

# non-centrality
# Useful for the graphical rep of alternative hypothesis
# non-central t-dist df = 12, 4 units to the right of zero
dt(x_values, 12, ncp = 4)

# Visualizing non-centrality
ggplot(data.frame(x = c(-5, 15)), aes(x)) +
  stat_function(fun = dt, args = list(df = 12,ncp = 0),
                aes(linetype="0")) +
  stat_function(fun = dt, args = list(df = 12,ncp = 2),
                aes(linetype="2"))+
  stat_function(fun = dt, args = list(df = 12,ncp = 4),
                aes(linetype="4"))+
  stat_function(fun = dt, args = list(df = 12,ncp = 6),
                aes(linetype="6"))+
  scale_linetype_manual("ncp", values = c(1,5,2,4))+
  labs(x="t",y="f(t)")+
  theme_bw()

# Visualizing t-Distributions
# set up a vector of values
t.values <- seq(-4,4,.1)

any(grepl("grDevices", installed.packages()))
library("grDevices") # adds expression(infinity)

# base R graphics
plot(x = t.values, y = dt(t.values,3), type = "l", lty =
       "dotted", ylim = c(0,.4), xlab = "t", ylab = "f(t)")
lines(t.values,dt(t.values,10),lty = "dashed")
lines(t.values,dnorm(t.values))

# legend
legend("topright", title = "df", legend = 
         c(expression(infinity),"10","3"), lty = 
         c("solid", "dashed", "dotted"),bty = "n")

# grammar of graphics(ggplot2)
# put relevant numbers in a dataframe
t.frame = data.frame(t.values,
                     df3 = dt(t.values,3),
                     df10 = dt(t.values,10),
                     std_normal = dnorm(t.values))
head(t.frame)
any(grepl("reshape2", installed.packages()))
library("reshape2") # to melt the data
t.frame.melt <- melt(t.frame, id = "t.values")
head(t.frame.melt)
# assign meaningful columns
colnames(t.frame.melt)= c("t","df","density")
head(t.frame.melt)
x.axis.values <- seq(-4,4,2)

ggplot(t.frame.melt, aes(x = t, y = density,group=df))+
  geom_line(aes(linetype = df))+
  scale_x_continuous(breaks=x.axis.values,labels = 
                       x.axis.values)+
  scale_linetype_manual(values = c("dotted","dashed","solid"),
  labels("3","10",expression(infinity)))+
  guides(linetype = guide_legend(reverse = TRUE))

# Testing Variance
install.packages("EnvStats")
library("EnvStats") # for the varTest() function
FarKlempt.data2 <- c(12.43, 11.71, 14.41, 11.05, 9.53,
                      11.66, 9.33,11.71,14.35,13.81)
varTest(FarKlempt.data2,alternative="greater",conf.level
        = 0.95,sigma.squared = 2.25)
# How high would chi_square(df = 9) have to be in order 
# to reject?

# Working with chi-square Distributions
qchisq(.05, df = 9, lower.tail = F) # Answers the question above

chisq.values <- seq(0, 16, 2)
# densities
round(dchisq(chisq.values,9),3)
# Cumulative densities
round(pchisq(chisq.values,9),3)
# Six random numbers
round(rchisq(n=6,df=9),3)

# Visualizing Chi-square Distributions
# Base R graphics
chi.values <- seq(0,25,.1)
plot(x = chi.values,
     y = dchisq(chi.values, df = 4),
     type = "l",
     xlab = expression(chi^2),
     ylab = "")
mtext(side = 2, expression(f(chi^2)), line = 2.5)
lines(x = chi.values,
      y = dchisq(chi.values, df = 10))
text(x = 6, y= .15, label = "df = 4")
text(x = 16, y= .07, label = "df = 10")

# ggplot2
ggplot(NULL, aes(x = chi.values))+
  geom_line(aes(y = dchisq(chi.values, 4)))+
  geom_line(aes(y = dchisq(chi.values, 10)))+
  labs(x = expression(chi^2), y = expression(f(chi^2)))+
  annotate(geom = "text", x = 6, y = .15, label = "df = 4")+
  annotate(geom = "text", x = 16, y = .07, label = "df = 10")+
  theme_bw()

# Two-Sample Hypothesis Testing
# Z-testing for two samples in R
sample1 <- c(100, 118, 97, 92, 118, 125, 135, 136, 95, 111)
sample2 <- c(91, 109, 83, 88,115,108,127,102,86)

# A UDF function for Z-test for two means
z.test2 <- function(x,y, popsd1, popsd2){
  one.tail.p <- NULL
  std.error <- sqrt((popsd1^2/length(x)+popsd2^2/length(y)))
  z.score <- round((mean(x)-mean(y))/std.error,3)
  one.tail.p <- round(pnorm(abs(z.score), lower.tail = FALSE), 3)
  cat("mean1 = ", mean(x)," ", "mean2 =", mean(y), "\n",
      "standard error =", std.error, "\n",
      "z =", z.score, "\n",
      "one-tailed probability =", one.tail.p,"\n",
      "two-tailed probability =", 2*one.tail.p)}

# perform the test
z.test2(sample1,sample2,15,15)

# t-testing in R
machine1 <-c(24.58, 22.09, 23.70, 18.89, 22.02, 28.71, 24.44,
             20.91, 23.83, 20.83)
machine2 <- c(21.61, 19.06, 20.72, 15.77, 19, 25.88, 21.48,
              17.85, 20.86, 17.77)

# Working with two vectors and the equal variance assumption
t.test(machine1, machine2, var.equal = TRUE, alternative = "two.sided", mu = 0)

# Working with a dataframe and a formula
# create a dataframe in long format
prod.time <- c(machine1, machine2)

# avector of the two machine names
machine <-c("machine1","machine2")

# Replicate the vector
machine <- rep(machine, times = c(10,10))

# The dataframe
FarKlempt.frame <-data.frame(machine,prod.time)

head(FarKlempt.frame)

# The t-test function
with (FarKlempt.frame,t.test(prod.time~machine,
                             var.equal = TRUE,
                             alternative="two.sided",
                             mu=0))

# Visualizing the results
# boxplots
# base R graphics
with(FarKlempt.frame, boxplot(prod.time~machine, xlab = 
                                "Machine", ylab = "Production Time (minutes)"))

# gggplot2
ggplot(FarKlempt.frame, aes(x = machine, y = prod.time))+
  stat_boxplot(geom = "errorbar", width = .5)+
  geom_boxplot()

# bar graphs
machine.names <- c("machine1", "machine2")
mean.times <- c(mean(machine1), mean(machine2))
se.times <- c(sd(machine1)/sqrt(length(machine1)),
             sd(machine2)/sqrt(length(machine2)))
# data frame
FKmeans.frame <- data.frame(machine.names, mean.times, se.times)
FKmeans.frame

ggplot(FKmeans.frame, aes(x=machine.names, y = mean.times))+
  geom_bar(stat = "identity", width = .4, color = "black",
           fill= "white")+
  geom_errorbar(aes(ymin=mean.times-se.times, ymax = mean.times+se.times),
                width=.1)

# Unequal variances
with (FarKlempt.frame,t.test(prod.time~machine,
                             var.equal = FALSE,
                             alternative="two.sided",
                             mu=0))
before <- c(198, 201, 210, 185, 204, 156, 167, 197, 220, 186)
after <- c(194, 203, 200, 183, 200, 153, 166, 197, 215, 184)
  
t.test(before,after,alternative = "greater",paired=TRUE)

# Working with f-distributions
# A two-tailed test with alpha = 0.05
qf(.025,9,14,lower.tail = FALSE)  # critical value

F.scores <- seq(0,5,1)

# rounded densities for the values
round(df(F.scores, 9, 14), 3)

# Rounded cumulative densities
round(pf(F.scores,9,14),3)

# generating 5 random numers
rf(5,9,14)

# Visualizing F-distributions
F.values <- seq(0, 5, .05)
F5.15 <- df(F.values, 5, 15)
F10.20 <- df(F.values, 10, 20)
F.frame <- data.frame(F.values, F5.15, F10.20)
head(F.frame)

library(reshape2)
F.frame.melt <- melt(F.frame,, id = "F.values")
colnames(F.frame.melt)=c("F","deg.fr","density")
head(F.frame.melt)

# load the grid package for the arrow
library(grid)
ggplot(F.frame.melt, aes(x = F, y = density, group = deg.fr))+
  geom_line(stat = "identity", aes(linetype= deg.fr))+
  scale_linetype_manual(values = c("solid", "dashed"),
  labels = c("5,15","10,20"))+
  guides(linetype = FALSE)+
  annotate(geom = "text", x = 1.98, y = .78, label = "df = 10, 20")+
  annotate(geom = "segment", x = 2.0,xend = 1.15, y = 0.75, yend = .6,
           arrow = arrow())+
  annotate(geom="text",x=3.3,y=.28,label="df=5,15")+
  annotate(geom="segment",x = 3.35, xend=2.45,y =0.25,
           yend=.1,arrow=arrow())

# ANOVA in R
# a vector for each column
method1.scores <- c(95,91,89,90,99,88,96,98,95)
method2.scores <- c(83,89,85,89,81,89,90,82,84,80)
method3.scores <- c(68,75,79,74,75,81,73,77)
score <- c(method1.scores, method2.scores, method3.scores)
# A vector of names
Method <- rep(c("method1", "method2", "method3"),
              times = c(length(method1.scores),
              length(method2.scores), length(method3.scores)))
# Dataframe.
Training.frame <- data.frame(Method,score)
analysis <- aov(score ~ Method, data = Training.frame)
summary(analysis)

# Visualizing the results
ggplot(Training.frame, aes(x = Method, y = score))+
  stat_boxplot(geom = "errorbar", width = .5) +
  geom_boxplot()

# Contrasts in R
# Create a matrix of the oefficients
contrasts(Training.frame$Method) <- matrix(c(0,1,-1,2,-1,-1),3,2)
contrasts(Training.frame$Method)
Anova.w.Constrasts <- aov(score ~ Method, data = Training.frame,
                          contrasts = contrasts(Training.frame$Method))
Anova.w.Constrasts
summary(Anova.w.Constrasts, split = list(Method = list("2 vs 3"= 1, "1 vs 2 & 3" = 2)))

# Unplanned Comparisons
TukeyHSD(analysis)

# Working with repeated measures anova
Person <-c("Al", "Bill", "Charlie", "Dan", "Ed", "Fred",
           "Gary","Harry","Irv","Jon")
Before <- c(198,201,210,185,204,156,167,197,220,186)
OneMonth <- c(194,203,200,183,200,153,166,197,215,184)
TwoMonths <- c(191,200,192,180,195,150,167,195,209,179)
ThreeMonths <- c(188,196,188,178,191,145,166,192,205,175)

Weight.frame <- data.frame(Person, Before, OneMonth,
                           TwoMonths, ThreeMonths)
Weight.frame

library(reshape2)
Weight.frame.melt <- melt(Weight.frame,id="Person")
colnames(Weight.frame.melt) = c("Person","Time","Weight")
head(Weight.frame.melt)

# As independent samples
ind.anova <- aov(Weight ~ Time, data=Weight.frame.melt)
summary(ind.anova)    # The analysis shows no significant differences among levels
                      # of the time
# repeated measures/randomized blocks/ within-subjects
rm.anova <- aov(Weight ~ Time + Error(Person/Time),
                data = Weight.frame.melt)
summary(rm.anova)

# visualizing the results
time <- c(0,1,2,3)
mean.weight <- c(mean(Before),mean(OneMonth),
                 mean(TwoMonths),mean(ThreeMonths))
se.weight <- c(sd(Before), sd(OneMonth), sd(TwoMonths),
               sd(ThreeMonths))/sqrt(length(Person))
wt.means.frame <- data.frame(time,mean.weight,se.weight)
wt.means.frame

# plotting in ggplot2
ggplot(wt.means.frame,aes(x = time, y = mean.weight))+
  geom_point(size = 3)+
  geom_errorbar(aes(ymin = mean.weight-se.weight,
                    ymax = mean.weight+se.weight),width = .1)


# Trend analysis
# create a contrast matrix
contrasts(Weight.frame.melt$Time) <- matrix(c(-3,-1,1,3,1,-1,
                                              -1,1,-1,3,-3,1), 4, 3)
rm.anova <- aov(Weight ~ Time + Error(factor(Person)/Time),
                data=Weight.frame.melt,
                contrasts = contrasts(Weight.frame.melt$Time))

summary(rm.anova,split=list(Time=list("Linear" =1,
                                      "Quadratic"=2,"Cubic" =3)))
