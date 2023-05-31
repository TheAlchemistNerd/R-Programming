library(MASS)
library(ISLR)
fix(Boston)
names(Boston)
lm.fit=lm(medv~lstat, data=Boston)
lm.fit
summary(lm.fit)

# finding pieces of information stored in lm.fit
names(lm.fit)

# extractor functions
coef(lm.fit)
confint(lm.fit)

# producing CIs and PIs for the 
# prediction of medv for a given value of lstat
predict(lm.fit, data.frame(lstat=(c(5, 10, 15))),
        interval = "confidence")

predict(lm.fit, data.frame(lstat=(c(5, 10, 15))),
        interval = "prediction")

attach(Boston)
plot(lstat, medv)
abline(lm.fit)

# Additional plotting objects
abline (lm.fit ,lwd =3)
abline (lm.fit ,lwd =3, col ="red ")
plot(lstat ,medv ,col ="red ")
plot(lstat ,medv ,pch =20)
plot(lstat ,medv ,pch ="+")
plot (1:20 ,1:20, pch =1:20)

# Diagnostic plots
par(mfrow =c(2,2))
plot(lm.fit)

plot(predict (lm.fit), residuals (lm.fit))
plot(predict (lm.fit), rstudent (lm.fit))

# Multiple Regression
lm.fit = lm(medv~lstat + age, data=Boston)
summary(lm.fit)

# short hand on all the variables contained in the Boston dataset
lm.fit=lm(medv~., data = Boston)
summary(lm.fit)

# calculating the Variance Inflation Factor using Car package
if(any(grepl("car", installed.packages())))
{
  library("car")
} else {
  install.packages("car")
  library("car")
}

vif(lm.fit)

# short hand on all the variables contained in the Boston dataset
# except age
lm.fit1 = lm(medv~.-age, data=Boston)
summary(lm.fit1)

# Alternatively you can use the update() function
lm.fit1 = update(lm.fit, ~.-age)

# Interaction terms
summary(lm(medv~lstat*age, data = Boston))

# Non-linear Transformation of the Predictors
lm.fit2 = lm(medv~lstat+I(lstat^2))
summary(lm.fit2)

lm.fit = lm(medv~lstat)

anova(lm.fit, lm.fit2)

par(mfrow=c(2, 2))
plot(lm.fit2)
