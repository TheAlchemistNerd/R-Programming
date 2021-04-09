
# Create a vector
apple <- c('red', 'green', 'yellow')
apple
print(apple)

# Create a list
list1 <- list(c(2, 5,3), 21.3,sin)
list1

# Create a matrix
a <- c(1,2,3,4,5,6)
A <- matrix(a,nrow = 3)
A
A[2][1]

# Create an array
a <- array(c('green', 'yellow', 'red'), dim = c(3,3,2))

# Create a vector.
apple_colors <- c('green','green','yellow','red','red','red','green')
# create a factor object
factor_apple <-factor(apple_colors)
apple_colors
factor_apple
nlevels(factor_apple)

# R decision making
x<- 30L
if (is.integer(x)){
print("x is an interger")
}

x<- c("what ","is" ,"truth")
if("Truth" %in% x){
print ("Truth is found")
}else {
print("Truth is not found")

x<-c("what", "is", "truth")
if ("Truth" %in% x){
print ("Truth is found the first time")
} else if ("truth"%in% x){
print ("truth is found the second time")
}else {
print ("No truth found")
}
v <- c("Hello", "loop")
cnt <-2
repeat{
print(v)
cnt <- cnt+1
if (cnt > 5){
break
}
}
v <- c("Hello", "while loop")
cnt <-2
while (cnt < 7){
print(v)
cnt= cnt+1
}

x <- 2:7
for (i in 1:length(x)){
   print(x[i]-mean(x))
}

v <- LETTERS [1:4]

for(i in v){
print (i)

v <- LETTERS [1:6]
for (i in v){
if (i=="D"){
next
}
print(i)
}






# Create the data frame.
BMI <- data.frame(
			gender = c("Male", "Male", "Female"),
			height = c(152, 171.5, 165),
			weight = c(81, 93, 78),
			Age = c(42,38,26) )
BMI
head(BMI)
tail(BMI)
str(BMI)
BMI

A

var.1 = c(0,1,2,3)

var.2 <- c("learn", "R")

c(TRUE, 1) -> var.3
var.1

cat ("var.1 is ", var.1 ,"\n")
cat ("var.2 is ", var.2 ,"\n")
cat ("var.3 is ", var.3 ,"\n")

var_x <- 'Hello'
cat("the class of var_x is ", class(var_x),"\n")

ls()
# listing the variables starting with the pattern var
ls(pattern = "var")
rm(var.3)
var.3
rm(list=ls())
print(ls())

# Operators
v <-c(2,5.5,6)
t <-c(8,3,4)
v+t
v*t                      
v%%t

v <- c(2, 5.5,6,9)
t <- c(8, 2.5, 14,9)
v>t
v<-c(3,1, TRUE, 2+3i)
t<- c(4,1, FALSE,2+3i)
v&t
M =matrix(c(2,6,5,1,10,4), nrow=2,ncol=3,byrow=TRUE)
t=M%*% t(M)
t

print(seq(32,44,2))

# crete a function to print squares of numbers in sequence.
new.function <- function(a){
for (i in 1:a){
b<- i^2
print (b)
}
}
new.function(6)

stdev <- function(x){
		n = length(x)
		SSD <- 0
		for (i in 1:n){
		SSD[i] <- (x[i]-mean(x))^2
		}
		Var <- sum(SSD)/n
		result <- sqrt(Var)
		print(result)
	}
x <- c(1,2,3,4,5,6,7,8,9,10)
stdev(x)

 a <- 'start and end with single quote'
print(a)
b <- "start and end with double quotes"
print (b)
c< "single quote ' in between double quotes"
print (c)
d <- 'double
 quote " in between single quote'

a <- "Hello"
b <- 'How'
c <- "are you ?"
 print(paste(a,b,c))
print(paste(a,b,c, sep = "-"))
 print(paste(a,b,c, sep = "", collapse= "")

# Total number of digits displayed. Last digit rounded off.
result <- format(23.123456789, digits=9)
print(result)
 # Display numbers in scientific notation.
result <- format(c(6, 13.14521),scientific = TRUE)
print(result)
 # The minimum number of digits to the right of the decimal point.
result <-format(23.47, nsmall=5)
print(result)
 # Forma treats everything as a string 
result <- format (6)
print(result)
# Numbers are padded with blank in the beginning for width.
reulr <- format(13.7, width=6)
print(result)
 # Left justify strings.
result <- format("Hello",width=8,justify="1")
print (result)
# Justify string with centre.
result <- format("Hello", width=8,justify="c")
print(result)

# changing to upper case
result <- toupper ("Changing To Upper")
print (result)
# changing to lower case
result <- tolower("Changing To Lower")
print(result)

# Extract characters from 5th to 7th position
result <- substring ("Extract", 5,7)
print(result)
 
# Atomic vector of type character
print("abc");
 # Atomic vector of type double.
print(12.5)

#Atomic vector of type integer.
print(63L)

#Atomic vector of type logical.
print(TRUE)

# Atomic vector pf type complex.
print(2+3i)

# Atomic vector of type raw
print('great')

# create vector  with elements from 111.5 to 222.0 incrementing by 0.5
print(seq(111.5,222.0, by 0.5))

# Accessing vector using position.
t <- c("Sun","Mon","Tue", "Wed", "Thur", "Fri", "Sat")
u <- t[c(2,3,6)]
print(u)

# Accessing vector elements using logical indexing 
v<- t[c(TRUE,FALSE,FALSE,FALSE,FALSE, TRUE, FALSE)]
print(v)
 # Accesing vector elementsusing negative indexing
x <- t[c(-2,-5)]
print(x)

# Accessing vector elements using 0\1 indexing
y <- t[c(0,0,0,0,0,0,1)]
print(y)


v1 <- c(3,8,4,5,0,11)
v2 <- c(4,11)
result <- c(v1+v2)
print(result)

# create a list containing strings, numbers, vectors and a logocal values.
list_data <- list("Red","Green", c(21,32,11),TRUE,51.23,119.1)
print(list_data)

# create a list containing a vector, a matrix and a list.
list_data <- list(c("Jan", "Feb", "Mar"),matrix(c(3,9,5,1,-2,8),nrow=2),list("green,12.3"))

# Give names to the elements in the list.
names(list_data) <- c("1st quarter", "A_matrix", "A inner list")

# show the list 
print (list_data2)
# accessing the list element using name of the element 
print(list_data$A_matrix)


 list_data[4]<- "new element"
print(list_data)

list_data[2]<- NULL
list_data
list_data[3] <- "update element"
print(list_data[3])

# create two lists
list1 <- list(1,2,3)
list2 <-list("Sun","Mon","Tue")

# merge the two lists 
merged.list <- c(list1, list2)
print(merged.list)

 #create a list
list1 <- list(1:5)
print(list1)

list2 <- list(10:14)
print(list2)

# convert the lists to vectors
v1<- unlist(list1)
v2 <- unlist(list2)

x <- c(30,60,70,35,80,45,55,61,95)
n= length(x)
grade=0
comment=0
for(i in 1:n)
{
if(x>=0 && x[i]<40)
{
grade[i]= "E"
comment[i]="poor"
}else
if(x[i]>=40 && x[i]<50)
{
grade[i]="D"
comment[i]="Fair"
}else
if(x[i]>=50 && x[i]<60)
{
grade[i]="C"
comment[i]="Good"
}else
if(x[i]>=60 && x[i]<70)
{
grade[i]="B"
comment[i]="Very good"
}else
if(x[i]>=70)
{
grade[i]="A"
comment[i]="Excellent"
}
}

grade
comment
Y<-cbind(x,grade,comment)
Y


# simple linear regression
x <-c(2, 6, 4, 5, 7)
y <-c(3.5,10.5,34.5,23.8, 11.3)
ACS <- lm(y~x)
betanode <- coef(ACS)[1]
betaone <-coef(ACS)[2]
n=length(y)
SSE<-0
for(i in 1:n)
{
  SSE<-(y[i]-betanode-betaone*x[i])^2

}
STE<-sum(SSE)
summary(ACS)

# creating a matrix
# defining row names and column names
rownames= c("row1","row2", "row3")
colnames= c("col1","col2")
N<-matrix(c(2,2,3,4,5,6),nrow=3, byrow=TRUE,dimnames = list(rownames,colnames))
N
# access elent in the 2nd column 3rd row
print(N[3,2])

# create 2 matrices
N
M <-matrix(c(12.3,23.9,11.7,90.7), nrow = 2)
result<-M+N
print(result)
result<- M*N
print(result)


vector1<-c(3,3,4)
vector2<-c(12.3,33.4,67.6,11.3,11.6,12.2)
col.names<- c("col1","col2","col3")
row.names<- c("row1","row2","row3")
matrix.names<-c("matrix1", "matrix2")
result<-array(c(vector1,vector2), dimnames = list(row.names, col.names,matrix.names),dim = c(3,3,2))
print(result)
result[2,2,1]
print(round(result[,,1]))
c = rbind(c(1, -0.25), c(-0.25, 1))
c
det(c)
solve(c)

matrix1<- result[,,1]
matrix2<- result[,,2]
result= matrix1+matrix2
print(result)


vector1 <-c(2,4,6)
vector2 <- c(11,11,34,13,45,32)
array =array(c(vector1,vector2),dim = c(3,3,2))
print(array)
result <-apply(array,c(1),sum)
print(result)

# create a vector
v<- c("monday","monday","tuesday","wednesday","wednesday","tuesday")
print(v)
print(is.factor(v))

# apply the factor function
factor_v <-factor(v)
print(factor_v)
print(is.factor(factor_v))


 # create a vector for data frame
age <- c( 34,56,23,56,23)
salary <-c(456,678,345,345,345)
dept <-c("HR","Finance","Finance","IT","HR")
input_data<- data.frame(age,salary,dept)
print(input_data)
print(is.factor(input_data$dept))
print(input_data$dept)
with(input_data, print(dept))

data <- c("HR","Finance","Finance","IT","HR")
factor_data<- factor(data)
print(factor_data)
new_order_data <- factor(factor_data,levels = c("IT","Finance","HR"))
print(new_order_data)
v <- gl(4,4,labels = c("polyne","faith","sharon","novem"))
print(v)
# create the data frame
friends.data <- data.frame(friends_id=c(1:5),
                      friends_names=c("polyne","faith","sharon","novem","phelly"),
                      salary= c(465,768,987,123,342),
                      height=c(120,123,145,123,190),
                      weight=c(80,45,76,56,24))
stringAsFactor=FALSE
#print the data frame
 print(friends.data)
 # get the structure of the data frame
 str(friends.data)

summary(friends.data)
result <-data.frame(friends.data$friends_name,friends.data$salary)
print(result)
result <- data.frame(friends.data$weight,friends.data$height)
print(result)
result <- friends.data[c(3,4),c(2,3)]
print(result)
# add the heights column
friends.data$height <-c(120,123,145,123,190)
v<- friends.data
print(v)
# create the second data frame
friends.newdata <- data.frame(friends_id=c(6:8),
                              friends_names=c("julia","aisha","joanne"),
                              salary=c(261,109,165),
                              height=c(120,167,11),
                              weight=c(87,65,55))

# bind the two data frames
friends.finaldata<- rbind(friends.data,friends.newdata)
print(friends.finaldata)

# Packages
.libPaths()
library("MASS")
require("MAss")
install.packages("Chainladder")

v <- c("sharon","polyne", "faith")
class <-c("comp","ird","acs")
codes<-c(400,404,401)
students<-cbind(v,class,codes)
cat("the first dataframe\n")
print(students)

# create another data frame
new.students<-data.frame(v=c("novem","phelly"),
                         class=c("sta","math"),
                         codes=c(404,406),
                         stringsAsFactors =FALSE )
cat("the second data frame\n")
print(new.students)
all.students<-rbind(students,new.students)
cat("the combined data frames\n")
print(all.students)



library(MASS)
head(anorexia)
merge.anorexia <- merge(x = anorexia$Prewt,
                        y = anorexia$Postwt)
merge.anorexia
head(Pima.te)
head(Pima.tr)

merged.Pima <- merge(x = Pima.te, y = Pima.tr,
                     by.x = c("bp", "bmi"),
                     by.y = c("bp", "bmi")
                     )
merged.Pima
nrow(merged.Pima)

# Create a vector of values in the cells.
rev.values <-
  c(1000,1300,1300,1100,1400,800,1200,1500,1850,
    2330,860,1300,1400,1600,1970,570,380,450,465,580,
    155,190,210,250,300)
# turn the vector into matrix.
space.rev <- matrix(rev.values,nrow=5,byrow = T)

# supply column names and row names to the matrix
colnames(space.rev) <-
  c("1990","1991","1992","1993","1994")
rownames(space.rev) <- c("Commercial Satellites
                         Delivered","Satellite Services","Satellite Ground
                         Equipment","Commercial Launches","Remote Sensing Data")
space.rev
library(reshape2)
space.melt <- melt(space.rev)
head(space.melt)

getwd()
setwd("C:/Users/qwert/Documents/Rworkdir")
getwd()

#inputting csv data
data <- read.csv("input.csv")
data
View(data)

setwd("E:/Downloads/IFOA actuarial exams/Excel workbooks and Solution")
data <- read.csv("CS1B__datatrain.csv")
data
View(data)
print(ncol(data))
print(nrow(data))
print(is.data.frame(data))
str(data)
head(data)
tail(data)

setwd("C:/Users/qwert/Documents/Rworkdir")
data <- read.csv("input.csv")
data
View(data)
sal <- max(data$salary)
sal

average_sal <- mean(data$salary)
average_sal

as.Date(data$start_date)

details<-subset(data,salary==max(salary))
details
details<-subset(data,dept=="IT")
details
details<-subset(data,salary>600 & dept=="IT")
details
details<-subset(data,as.Date(start_date)>as.Date("2014-01-01"))
details

write.csv(details,"output.csv")
newdata<-read.csv("output.csv")
print(newdata)

# Verify the package is installed.
any(grepl("xlsx",installed.packages()))
library("xlsx")
data<-read.xlsx("input.xlsx", sheetIndex = 1)
data

setwd("E:/Downloads/IFOA actuarial exams/Excel workbooks and Solution")
data <- read.csv("CS1B__datatrain.csv")
data

write.xlsx(data,file = "E:/Downloads/IFOA actuarial exams/Excel workbooks and Solution/CS1B__datatrain.xlsx",
           sheetName = "CS1B__datatrain", col.names = TRUE, row.names = FALSE)

library("XML")
library("methods")
result<-xmlParse(file="input.xml")
print(result)
View(result)
rootnode <- xmlRoot(result)
rootsize<-xmlSize(rootnode)
print(rootsize)
print(rootnode[1])
print(rootnode[5])
print(rootnode[[3]][[2]])
xmldataframe<-xmlToDataFrame("input.xml")
print(xmldataframe)
View(xmldataframe)

library(rjson)
result<-fromJSON(file="input.json")
print(result)
json_data_frame<- as.data.frame(result)
print(json_data_frame)


x <- seq(-2,2,0.1)
y<- x^2
plot(x,y, col = "red", type = "l", main = "Quadratic curve", sub = "y = x^2")
library(plotrix)
x<- c(12,23,56,29)
labels<- c("polne","faith","sharon", "novem")
pie(x,labels,)
pie(x,labels,main = "names of the pie chart",col=rainbow(length(x)))
pie3D(x,labels=labels,explode=0.1,
main="pie chart of classmates")
# creating a bar plot
x <- c(23,34,54,45,67)
barplot(x)
L <- c("mond", "tues","wed", "thur", "fri")
barplot(x,names.arg=L, xlab="days", ylab="classes",col="purple",
main="barplot of classes", border="yellow")


colors<-c("green", "red", "blue")
days<-c("mond", "tue", "wed", "thur", "fri")
places <-c("eldoret", "nairobi", "kisii")
values<-matrix(c(23,45,12,11,16,18,5,6,13,20,12,14,15,22,3),
nrow=3,ncol=5,byrow=TRUE)
barplot(values,main="total days",names.arg = places,xlab="days",
ylab="places",col=colors)
legend("topleft",places,cex=1.3,fill=colors)

input<- mtcars[, c('mpg','cyl')]
print(head(input))
boxplot(mpg~cyl, data=mtcars,
                 xlab="Number of Cylinders",
                 ylab="Miles per Gallon",
                 main="mileage data",
                 notch=TRUE,
                 varwidth=TRUE,
                 col=c("red", "blue","green"),
                 names=c("high","medium", "low"))

library(MASS)
hist(Cars93$Price, xlab = "Price(x $1000)", xlim = c(0,70),
main = "Prices of 93 models of 1993 cars", prob = TRUE)
lines(density(Cars93$Price))

rev.values <- c(1000,  1300, 1300, 1100, 1400,
		   800, 1200, 1500, 1850, 2330,
                860, 1300, 1400, 1600, 1970,
                570, 380, 450, 465, 580,
                155, 190, 210, 250, 300)
col.names <- c("1990", "1991", "1992", "1993", "1994")
row.names <- c("Commercial Satellites Delivered", "Satellite Services", 
		"satellite Ground Equipment", "Commercial Launches", 
		"Remote Sensing Data" )
space.rev <- matrix(rev.values,nrow = 5, byrow = TRUE, dimnames = list( row.names,
                     col.names))

color.names = c("black", "grey25", "grey50", "grey75", "white")
barplot(space.rev, beside = T, xlab = "Year", ylab = "Revenue(X $1000)",
color = color.names)
legend(1,2000, rownames(space.rev),cex=0.7,fill=color.names,bty="n")

plot(Cars93$MPG.city~Cars93$Horsepower,
xlab="Horsepower",ylab="MPG City",main="MPG City vs Horsepower", pch = 16)

plot(Cars93$MPG.city~Cars93$Horsepower,
     xlab="Horsepower",ylab="MPG City",main="MPG City vs Horsepower", pch = as.character(Cars93$Cylinders))

any(grepl("RCurl", installed.packages()))
install.packages("pylr", dependencies = T)


library("RCurl")
library("XML")
library("stringr")
library("plyr")
url <- "http://www.geos.ed.ac.uk/~weather/jcmb_ws/"
links<- getHTMLLinks(url)
filenames<- links[str_detect(links,"JCM_2015")]
filenames_list<- as.list(filenames)



url <-"https://www.data.gov/media"
.libPaths()

library(MASS)
head(Cars93 ,3)

hist(Cars93$Price)
hist(Cars93$Price, xlab ="frequency",ylab = "Cars$Price", main = "histogram of cars93$price", ylim=c(0,50), xlim=c(0,70))
hist(Cars93$Price, xlab ="frequency", main = "histogram of cars93$price", ylim=c(0,50), xlim=c(0,70),probability = TRUE )
lines(density(Cars93$Price))
View(Cars93)
str(Cars93)

# barplots
table(Cars93$Type)
barplot(table(Cars93$Type), col = c("blue","red","orange","green","yellow"),cex.names = 1.5)

barplot(table(Cars93$Type), ylim=c(0,25), xlab="Type", ylab="Frequency"
         , axis.lty="solid", space=0.05)

cars.subset <- subset(Cars93, select=c(MPG.city, Price, Horsepower))
pairs(cars.subset)

x <- c(NA, 24,25,34,65,NaN)
result<- mean(x, na.rm = T)
result

x <-c(23,78,12,45,67,NA,90, 12,7.9,9)
result=median(x,na.rm = TRUE,trim=0.3)
result
x <- c(2,2,2,2,2,2,2,2,3,3,3,3,5,5,1)
result <- mfv(x)
result
x <- c(2,6,8,9,5,5)
y <-c(45,78,56,12,90,67)
relation <- lm(y~x)
relation 
print(summary(relation))

plot(x,y, cex = 1.3, pch = 16)
abline(lm(x~y))

# Create the predictor and response variable. 
x <- c(151, 174, 138, 186, 128, 136, 179, 163, 152, 131) 
y <- c(63, 81, 56, 91, 47, 57, 76, 72, 62, 48) 
relation <- lm(y~x) 

plot(x,y,col = "blue", main = "Height and Weight Regression",
     abline(lm(y~x)),cex = 1.3, pch = 16, xlab = "Weight in kg",
     ylab = "Height in cm")

input <- mtcars[, c("mpg", "disp", "hp","wt")]
print(head(input))
model <- lm(mpg~disp+hp+wt,data=input)
cat("The coefficient values","\n")
a <-coef(model)[1]
xdisp <-coef(model)[2]
xhp <- coef(model)[3]
xwt <- coef(model)[4]

a
xdisp
xhp
xwt

input <- mtcars[, c("am","cyl", "hp","wt")]
am.data = glm(formula=am~cyl+ hp+ wt, data= input, family=binomial)
summary(am.data)


head(Default)
input<-Default[,c("balance","default")]
head(input)
boxplot(balance~default, data = input)
default1 <- glm(default~balance, data = input, family =binomial)
summary(default1)

# Normal distribution
dnorm(100,100,15)
pnorm(100,100,15)


x <- seq(-10,10,by=.0001)
y <-dnorm(x,2.5,0.5)
plot(x,y)

x <- seq(-10,10,by=.2)
y <-pnorm(x,2.5,0.5)
plot(x,y)


x.values <- seq(40, 160, 1)
y <-pnorm(x.values,100,15)
plot(x.values,y, type = "l",main = "The cdf of ~N(100,225)",ylab = expression(f(x)))

pnorm(85,100,15,lower.tail = FALSE)
qnorm(0.1586553,100,15,lower.tail = F)

x<- rnorm(1000)
x
plot(x)
acf(x)
acf(diff(x),lag.max = 15)

x <-seq(0,50,1)
y <-dbinom(x,50,0.5)
barplot(y)

Y <-pbinom(x, 50,0.5)

pbinom(26,50,0.6)
x <-pbinom(26,50,0.6)
x
pbinom(26,51,0.5)
qbinom(0.25, 51,0.5)
rbinom(8,150,0.4)

success <- seq(0,10)
probability <-dbinom(success,10,1/6)
cumulative <-pbinom(success,10,1/6)

library(ggplot2)
ggplot(NULL, aes(x=success,y=cumulative))+
  geom_step()

rm(list=ls())

sum(dnbinom(seq(0,5),4,1/6))

binom.test(5,10,1/6, alternative = "greater")
qnbinom(seq(.10,.95,.05),4, 1/6)
x <- seq(0,7)
y <- dpois(x,3)
barplot(y,x)

predicted <-dpois(x,3)*200
predicted

x.values<-seq(0,7)
observed <- c(10,30,44,44,36,18,10,8)
predicted

data <- data.frame(
  Hits.hr = x.values,
  Observed = observed,
  Predicted = predicted
)
data
data.matrix <- as.matrix(data)

data.melt <- melt(data, id = "Hits.hr")
colnames(data.melt)<-c("Hits.hr","Category","Hours")
barplot(t(data.matrix[,c(2,3)]), beside = T, xlab = "Hits.hr",ylab = "Hours")

# Continuous distributions.
x <-seq(40,160,1)
y<-dnorm(x,100,15)
plot(x,y,type="l",main = "NORMAL DISTRIBUTION CURVE", xlab="x.values", ylab="f(x)" )                 

dnorm(100,100,15)
pnorm(85,100,15,lower.tail = F)
qnorm(0.1586553,100,15)


x <-seq(0,7)
y <-dexp(x,1/3)
plot(x,y,type = "l")

dexp(10,1/3)
pexp(10,1/3)
qexp(0.964326,1/3)
rexp(15,0.1)

par(mfrow=c(2,2))
x<- seq(0,1,0.01)
fx <-dbeta(x,2,3)
plot(x,fx,type="l",main="a=2 b=3",col="red")
fx <-dbeta(x,0.5,2)
plot(x,fx,type = "l",main = "a=0.5 b=2",col="red")
fx<-dbeta(x,2,0.5)
plot(x,fx,type="l",main="a=2 b=0.5",col="red")
fx <- dbeta(x,0.5,0.5)
plot(x,fx,type="l",main="a=0.5 b=0.5", col="red")

x.values <- seq(0,10,0.05)
y <- dlnorm(x)
plot(x.values,y,type = "l")



# Sampling distributions
# Mean
# Simulating the CLT
values <- c(1,2,3)
probabilities <-c(1/3,1/3,1/3)
smpl.means <- NULL
for(i in 1:600){
  smpl<- sample(x=values, prob=probabilities,size=3, replace=TRUE)
  smpl.means <- append(smpl.means, mean(smpl))
}
unique(smpl.means)
m.values <-round(unique(smpl.means),2)

hist(smpl.means,probability = T)
lines(density(smpl.means))

E.values <- sum(values*probabilities)
E.values
 var.values <- sum((values-E.values)^2*probabilities)                                   
var.values 
sd.values <- sqrt(var.values)
mean(smpl.means)
sd(smpl.means)
mean.battery <- 60
sd.battery <-20
N <- 100
error <- qnorm(0.025,lower.tail = FALSE)*sd.battery/sqrt(N)
lower <- mean.battery- error
upper <- mean.battery+ error
upper
lower

input <- warpbreaks
print(head(input))
output<- glm(formula = breaks~wool+tension,
             data = warpbreaks,family=poisson)
print(summary(output))

# analysis of covariance
input <- mtcars[, c("am", "mpg", "hp")]
print(head(input))

#with interaction effects
result1 <- aov(mpg ~hp*am,data = input)
print(summary(result))

#without interaction
result2<- aov( mpg~hp+am, data=input)


print(summary(result))

# Comparison of the two models
print(anova(result1,result2))
