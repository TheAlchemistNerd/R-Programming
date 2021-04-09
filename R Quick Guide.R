#Create a vector
apple<-c("red","green","yellow")
print(apple)
# Get the class of the vector.
print(class(apple))
# Create a list.
list1 <- list(c(2,5,3),21.3,sin)
# Print the list.
print(list1)
# Create a matrix.
M = matrix( c('a','a','b','c','b','a'), nrow = 2, ncol = 3, byrow = TRUE)
print(M)
# Create an array.
a <- array(c('green','yellow'),dim = c(3,3,2))
print(a)
# Create a vector.
apple_colors <- c('green','green','yellow','red','red','red','green')
# Create a factor object.
factor_apple <- factor(apple_colors)
# Print the factor.
print(factor_apple)
print(nlevels(factor_apple))
# Create the data frame.
BMI <- data.frame(
gender = c("Male", "Male","Female"),
height = c(152, 171.5, 165),
weight = c(81,93, 78),
Age = c(42,38,26)
)
print(BMI)
# Assignment using equal operator.
var.1 = c(0,1,2,3)
# Assignment using leftward operator.
var.2 <- c("learn","R")
# Assignment using rightward operator.
c(TRUE,1) -> var.3
print(var.1)
cat ("var.1 is ", var.1 ,"\n")
cat ("var.2 is ", var.2 ,"\n")
cat ("var.3 is ", var.3 ,"\n")
var_x <- "Hello"
cat("The class of var_x is ",class(var_x),"\n")
var_x <- 34.5
cat(" Now the class of var_x is ",class(var_x),"\n")
var_x <- 27L
cat(" Next the class of var_x becomes ",class(var_x),"\n")
print(ls())
# List the variables starting with the pattern "var".
print(ls(pattern = "var"))
print(ls(all.name = TRUE))
rm(var.3)
print(var.3)
rm(list = ls())
print(ls())
v <- c( 2,5.5,6)
t <- c(8, 3, 4)
print(v-t)
v <- c( 2,5.5,6)
t <- c(8, 3, 4)
print(v+t)
v <- c( 2,5.5,6)
t <- c(8, 3, 4)
print(v*t)
v <- c( 2,5.5,6)
t <- c(8, 3, 4)
print(v/t)
v <- c( 2,5.5,6)
t <- c(8, 3, 4)
print(v%%t)
v <- c( 2,5.5,6)
t <- c(8, 3, 4)
print(v%/%t)
v <- c( 2,5.5,6)
t <- c(8, 3, 4)
print(v^t)
# Create a function to print squares of numbers in sequence.
new.function <- function(a) {
for(i in 1:a) {
b <- i^2
print(b)
}
}
# Call the function new.function supplying 6 as an argument.
new.function(6)
# Create a function without an argument.
new.function <- function() {
for(i in 1:5) {
print(i^2)
}
}
# Call the function without supplying an argument.
new.function()
# Create a function with arguments.
new.function <- function(a = 3, b = 6) {
result <- a * b
print(result)
}
# Call the function without giving any argument.
new.function()
# Call the function with giving new values of the argument.
new.function(9,5)
# Create a function with arguments.
new.function <- function(a, b) {
print(a^2)
print(a)
print(b)
}
# Evaluate the function without supplying one of the arguments.
new.function(6)
.libPaths()
library()
search()
install.packages("C:\Users\qwert\Downloads\R\elements o statistical learning", repos = NULL, type = "source")
a <- 'Start and end with single quote'
print(a)
b <- "Start and end with double quotes"
print(b)
c <- "single quote ' in between double quotes"
print(c)
d <- 'Double quotes " in between single quote'
print(d)
#Examples of invalid strings
e <- 'Mixed quotes"
print(e)
f <- 'Single quote ' inside single quote'
print(f)
g <- "Double quotes " inside double quotes"
print(g)