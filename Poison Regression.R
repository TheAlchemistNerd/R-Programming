# Poisson Regression    # glm(formula,data,family)

input <- warpbreaks
print(head(input))

# Create Regression Model.
output <-glm(formula = breaks ~ wool+tension, data = warpbreaks,
family = poisson)
print(summary(output))