# Weighted die

die <- 1:6
die
# Rolling the dice
sample(x  = die, size = 1)  # Sampling without replacement
sample(die, size = 2)


# looking up about the names to use with functions
# use args()

# Sampling with replacement
dice <- sample(die, size = 2, replace = TRUE) # A good way to create independent random samples
dice
sum(dice)

# A User-defined function to reroll the dice whenever called.
# Each time the function is called it returns the sum of rolling two dice
roll <- function(){  # no arguments
  die <- 1:6
  dice <- sample(die, size = 2, replace = TRUE)
  sum(dice)
}
roll()
roll2 <- function(bones){  # arguments # works as long a you supply bones when you call the functions
  dice <- sample(bones, size = 2, replace = TRUE)
  sum(dice)
}

roll2(bones = 1:4)
roll2(bones = 1:6)
roll2(1:20)

roll2 <- function(bones = 1:6){  # default parameters # works as long a you supply bones when you call the functions
  dice <- sample(bones, size = 2, replace = TRUE)
  sum(dice)
}

roll2()

library("ggplot2") # loading ggplot2 package for qplot(quick plots) function

x <- c(-1, -0.8, -0.6, -0.4, -0.2, 0, 0.2, 0.4, 0.6, 0.8, 1)
x
y <- x^3
y
qplot(x,y) # Scatter plot

x <-c(1,2,2,2,3,3)
qplot(x, binwidth = 1) # histogram

x2 <- c(1, 1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 4)
qplot(x2, binwidth = 1)

x3 <- c(0, 1, 1, 2, 2, 2, 3, 3, 4)
qplot(x3, binwidth = 1)

replicate(3, 1 + 1)
replicate(10, roll()) # an easy way to repeat r commands many times

# Simulating 10,000 dice rolls  
rolls <- replicate(10000, roll())

# plot the results 
qplot(rolls, binwidth = 1)

# Using the R help pages to search an info aboout na R object
# sample function is our object
# searching for anything that could help us change the probalities involved in the sampling process
?sample

# Rewrite the roll function to roll a pair of weighted dice
roll <- function() {
  die <- 1:6
  dice <- sample(die, size = 2, replace = TRUE,
    prob = c(1/8, 1/8, 1/8, 1/8, 1/8, 3/8))
  sum(dice)
}

# Simulating 10,000 dice rolls  
rolls <- replicate(10000, roll())

# plot the results 
qplot(rolls, binwidth = 1)

# Playing cards
# Create an atomic vector that stores the face name of the cards in a royal flush
hand <-c("ace", "king", "queen", "jack", "ten")
hand
typeof(hand)

# Attributes

names(die) <-c("one", "two", "three", "four", "five", "six")
die
names(die)
attributes(die)
names(die) <-c("uno", "dos", "tres", "quatro", "cinco","seis") # Change the name attribute
die
names(die) <- NULL # Removing attributes
die

dim(die) <-c(2,3) # Organise die into a 2 x 3 matrix
die

dim(die) <- c(3,2) # Organise die into 3 x 2 matrix
die

dim(die) <-c(1, 2, 3) # 1 x 2 x 3 hypercube
die

# Matrices
m <- matrix(die, nrow = 2) # fills up the matrix column by column by default
m

m <- matrix(die, nrow = 2, byrow = TRUE) # filling the matrix row by row.
m

# Arrays
ar <- array(c(11:14, 21:24, 31:34), dim = c(2, 2, 3))
ar

# A matrix that stores the name and the suit of every card in a royal flush
hand1 <- c("ace", "king", "queen", "jack", "ten", "spades", "spades", "spades", "spades", "spades")
# Create a matrix with one of the following ways 
matrix(hand1, nrow = 5)
# matrix(hand1, ncol = 2)
# dim(hand1) <- c(5, 2)

# A different approach
hand2 <- c("ace", "spades", "king", "spades", "queen", "spades", "jack","spades", "ten", "spades")
matrix(hand2, nrow = 5, byrow = TRUE)
matrix(hand2, ncol = 2, byrow = TRUE)

# Class
dim(die) <- c(2, 3)
typeof(die)
## "double"

class(die)
## "matrix"

# Date and Time
now <- Sys.time()
now

typeof(now)
class(now)

# R creates a time vector by builing a double vector with one element
unclass(now)

# Factors
gender <- factor(c("male", "female", "female", "male"))
typeof(gender)
attributes(gender)
unclass(gender)    # see exactly how R is storing your factor with unclass
gender

# Converting a factor to a character string
as.character(gender)

# atomic vectors,matrices can only store one type of datatype
# coercion
# If character strings are present, everything will be coerced to a character string
# otherwise, logicals are converted to numerics

# Lists
list1 <- list(100:130, "R", list(TRUE, FALSE))   # group data into one dimensional set
list1                                            # group together R objects, such as atmic vectors and other lists

# using a list store a single playing carde e.g ace o hearts,with a point value of one
card <- list("ace", "hearts", 1)
card

# Dataframes
# A special class of lists: two-dimensional
# R's equivalent to excel spreadsheets
# Group vectors together into a two-dimensional tables
# Each vector becomes a column in the table;as a result each column can contain a different type of data;
# but within a column, every cell must be the sametype of data.finally the vectors should be of the same length.

df <- data.frame(face = c("ace", "two", "six"),
suit = c("clubs", "clubs", "clubs"), value = c(1, 2, 3))
df

typeof(df)
class(df)
str(df) # R saves character strings as factors

df <- data.frame(face = c("ace", "two", "six"),
suit = c("clubs", "clubs", "clubs"), value = c(1, 2, 3),
stringsAsFactors = FALSE)
df

# A dataframe is a great wy to build an entire deck of cards
# Make each row a playing card and in each column a type of value

deck <- data.frame(
face = c("king", "queen", "jack", "ten", "nine", "eight", "seven", "six",
  "five", "four", "three", "two", "ace", "king", "queen", "jack", "ten",
  "nine", "eight", "seven", "six", "five", "four", "three", "two", "ace",
  "king", "queen", "jack", "ten", "nine", "eight", "seven", "six", "five",
  "four", "three", "two", "ace", "king", "queen", "jack", "ten", "nine",
  "eight", "seven", "six", "five", "four", "three", "two", "ace"),
suit = c("spades", "spades", "spades", "spades", "spades", "spades",
  "spades", "spades", "spades", "spades", "spades", "spades", "spades",
  "clubs", "clubs", "clubs", "clubs", "clubs", "clubs", "clubs", "clubs",
  "clubs", "clubs", "clubs", "clubs", "clubs", "diamonds", "diamonds",
  "diamonds", "diamonds", "diamonds", "diamonds", "diamonds", "diamonds",
  "diamonds", "diamonds", "diamonds", "diamonds", "diamonds", "hearts",
  "hearts", "hearts", "hearts", "hearts", "hearts", "hearts", "hearts",
  "hearts", "hearts", "hearts", "hearts", "hearts"),
value = c(13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 13, 12, 11, 10, 9, 8,
  7, 6, 5, 4, 3, 2, 1, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 13, 12, 11,
  10, 9, 8, 7, 6, 5, 4, 3, 2, 1)
)
deck
head(deck) # default returns the first six rows of the dataset
tail(deck) # default returns the last six rows of the dataset
head(deck, 10) # Give head or tails a second argument
tail(deck, 10) # to get the number of rows you would like to view

# Saving the data as CSV
write.csv(deck, file = "cards.csv", row.names = FALSE)

