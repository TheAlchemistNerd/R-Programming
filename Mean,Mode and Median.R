getwd()
setwd("C:/Users/qwert/Documents/RWorkdir")
getwd()

# Create a vector.
x <- c(12,7,3,4.2,18,2,54,-21,8,-5)
# Find Mean.
result.mean <- mean(x)
print(result.mean)

# Applying Trim Option
# Find Mean.
result.mean <- mean(x,trim = 0.3)
print(result.mean)

# Applying The NA Option
# Create a vector.
x <- c(12,7,3,4.2,18,2,54,-21,8,-5,NA)
# Find mean.
result.mean <- mean(x)
print(result.mean)

# Find mean dropping NA values.
result.mean <- mean(x,na.rm = TRUE)
print(result.mean)

# Create the vector.
x <- c(12,7,3,4.2,18,2,54,-21,8,-5)
# Find the median.
median.result <- median(x)
print(median.result)

# Mode    # R does not have a standard in-built function to calculate mode.
# Create the function.
getmode <- function(v) {     # User-Defined function
   uniqv <- unique(v)
   uniqv[which.max(tabulate(match(v, uniqv)))]
}

# Create the vector with numbers.
v <- c(2,1,2,3,1,2,3,4,1,5,5,3,2,3)
# Calculate the mode using the user function.
result <- getmode(v)
print(result)

# Create the vector with characters.
charv <- c("o","it","the","it","it")

# Calculate the mode using the user function.
result <- getmode(charv)
print(result)
