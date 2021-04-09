price<- c(300,250,400,550,317,389,425,289,389,559)
no_of_bedrooms <- c(3,3,4,5,4,3,6,3,4,5)

model <- lm(price~no_of_bedrooms)
plot(no_of_bedrooms,price,abline(model))

summary(model)
# Calculating the T-statistic
beta1 <- coef(model)[2]
betanull <- 60  # x 1000

T <- (beta1 - betanull)/23.76
T
# Calculating the p-value
pt(T,8,lower.tail = F)  # 0.2982273

# Reject the null hypothesis.


