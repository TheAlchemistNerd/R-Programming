# datatypes
# vectors
x <- c(1,2,3,4,5)
x
names <- c("nevil", "sharon")
names
xters <- c("nevil", 25, TRUE)
xters
# list
list1 <- list(c(1:10), xters, names,x, list2 = list(names,x))
list1

# matrices
A <- matrix(c(1:10),nrow = 5,ncol = 2)
B <- matrix(c(1:10), 5,2,byrow=TRUE)
B
colnames(B)<- c("col1", "col2")
rownames(B)<- c("row1","row2","row3", "row4","row5")
B
rownames<- c("row1","row2","row3", "row4","row5")
colnames<-c("col1", "col2")
A <-matrix(c(1:10), nrow = 5,dimnames = list(rownames, colnames))
A

z<-matrix(c(1:20),nrow=10,ncol=2)
z
colnames(z)<-c("col1","col2")
rownames(z)<-c("row1","row2","row3","row4","row5","row6","row7","row8
","row9","row10")
z
x <- seq(1,10,1)
x
x <- seq(-2,2,0.1)
x
y <- x^2
y
plot(x,y, col = "blue", type = "b")
x <- 1:9

# arrays
arr1 <- array(x,dim = c(3,3,2))
arr1

# factors
gender <- c("male", "male","female","male","female","female","male")
gender
fact_gender <- factor(gender)
fact_gender
nlevels(fact_gender)

# Dataframes
ACS <- data.frame(Student_ID = c(1,2,3,4,5),
			names = c("nevil", "evans", "vincent", "tonny","john"),
			points = factor(c("A","B","B","A","C")),
	gender = factor(c("male", "female","female","male","male")),
       stringsAsFactors = FALSE)
ACS
View(ACS)
edit(ACS)
str(ACS)
head(ACS,3)
tail(ACS,3)
head(iris,10)
tail(iris,15)
str(iris)

ACS
ACS2 <- data.frame(Student_ID = c(6,7,8),
			names = c("brian","kevo","carol"),
			points = factor(c("B","C","B")),
			gender = factor(c("male","male","female")),
			height = c(123,145,167))
ACS2
Students <- rbind(ACS,ACS2)
Students
is.data.frame(Students)
students2 <- cbind(names = c("brian","kevo","carol"),
			points = factor(c("B","C","B")),
			gender = factor(c("male","male","female")),
			height = c(123,145,167))
students2
is.data.frame(students2)
is.matrix(students2)
df1 <- as.data.frame(students2)
is.data.frame(df1)

# Variables
var_1 <- "hello"
class(var_1)
var.2 <- "17"
class(var.2)
.var3_ <-24
class(.var3_)
var_4 <- 56.45
class(var_4)
var.5 <- 48L
class(var.5)
is.integer(var.5)
is.integer(.var3_)
is.numeric(.var3_)
var6<- as.integer(.var3_)
class(var6)

cat("the class of var_1 is ", class(var_1), "\n")

ls()
ls(pattern = "var")
ls(all.names = TRUE)
rm(var6)
var6

# dataframe
ACS <- data.frame(StudentID = c(1,2,3,4,5,6,7,8,9,10)
			,names = c("sharon", "serah", "janet", "anne", "Eve", "Faith", "Harriet", "Pauline", "Joan", "Mercy"),
			points = c("A","B", "C", "B","D", "B","C", "A", "C","D")
			)


rm(list = ls())
ls()

x <- 1:10
y <- 11:20
result <- x + y
result
x*y

x/y

6<4
6>=4
4<=6
6==4
2.5!=5
x=4

TRUE | FALSE
TRUE & FALSE

!T


x <- rep(2,4)
x
y <- c(2,2,3,3)
y

x&&y
x&y
z <- c(2,3,0,0)
z&y
c(TRUE,0)-> boolean
boolean

#  assignment operators
<-, = , ->, <<-, ->>

x <- seq(from = -2,to = 2,by = 0.5)
x
seq(from = -2,to = 2,by = 0.5)->y

x <- 1:100
x

y <- c(12,13,25,35)
y
y%in%x

x <- 1:15
x

result <- x[5]
result
result <- x[c(2:7)]
result

res <- x[-14]
res
res <- x[-c(5:12)]
res

num <- 35:45
num

num2 <- 1:11
num2

rest <-num*num2
rest

# matices
# addition, subtraction, multiplication and division, transpose, determinant, inverse
A <- matrix(c(2,3,4,5,2,4,5,6,4),nrow=3,ncol=3)
A
B<- matrix(c(6,9,7,8,4,3,2,1,7),nrow=3,ncol=3)

A+B
B

A*B # not the right multiplication

A%*%B

A-B

A/B
A%/%B

t(A)
det(A)

solve(A)

C <- matrix(c(2,6,4,8), nrow = 2)
C
det(C)
solve(C)

A[2,3]
A[1,]
A[,3]

A[,c(1,3)]
A[c(1,3),]

# List
list_data <- list("green", "red", c(2:7), TRUE, 45.6, 48.99)
list_data

list2 <- list(matrix(c(1:6),nrow = 2, byrow = T), list_data, letters[-c(1:16)])
list2
list2$list_data[3]
names(list2) <- c("matrixA", "list_data", "10letters")
list2
list2$matrixA
list2$list_data[3]

list2[3] <- NULL
list2

list2[3]<- "letters"
list2

list3 <- c(list_data,list2)



unlisted2 <- unlist(list2)
unlisted2
list3


# Arrays
arr3 <- array(1:15, dim= c(5,3,3))
arr3
row.names <- c("one", "two", "three", "four", "five")
col.names <- c("col1","three","four")
matrix.names <- c("matrix1", "matrix2", "matrix3")
arr3 <- array(1:15, dim= c(5,3,3), dimnames = list(row.names, col.names, matrix.names))
arr3

arr3[3,,2]
arr3[1,3,1]
arr3[,,2]
arr3$matrix3

# control Structures
a <- 15L
if(is.integer(a)==TRUE){
	print(a)
}

# if-else
x <- runif(2,0,10)
if(x[1] > 3 && x[2] > 3){
	y <- 10
}else{
	y <- 0
}
y

y <- if(x >3){
	10
}else{
	0
}
y

x <- c("what","is","truth")
if("Truth" %in% x){
	print("Truth is found")
} else {
	print("Truth is not found")
}

x <- c("what","is","truth")
if("Truth" %in% x){
	print("Truth is found the first time")
} else if ("truth" %in% x) {
	print("truth is found the second time")
} else {
	print("No truth found")
}


x<-switch(
3,
"first",
"second",
"third",
"fourth"
)
print(x)

for(i in 1:10){
	print(i)
}

x <- seq(-2,2,0.1)
x^2
n = length(x)
for(i in 1:n){
	print(x^2)
}

x <- c("a", "b", "c", "d")
n = length(x)
for(i in 1:n){
	print(x[i])
}

# looping along the elements of a matrix
x <- matrix(1:6,2,3)
x
for(i in seq_len(nrow(x))){
	for(j in seq_len(ncol(x))){
		print(x[i,j])
	}
}

count<-0
while(count<10){
	print(count)
count<-count+1
}

z <-5
set.seed(1)
while(z>=3&&z<=10){
	coin<-rbinom(1,1,0.5)
if(coin==1){
z<-z+1
}else{
z<-z-1
 }
}
print(z)


v <-c("Hello","loop")
cnt <- 2
repeat{
	print(v)
	if(cnt >5){
		break
	}
	cnt <- cnt +1
}


x <- c(30,45,76,55,90,67,54,44)
grade <- 0
comment <- 0
n <- length(x)
for(i in 1:n){
	if(x[i]>0 && x[i]<40){
		grade[i] = "E"
		comment[i] = "Fail"
	}else if(x[i]>=40 && x[i]<50){
		grade[i] = "D"
		comment[i] = "Pass"
	}else if(x[i]>=50 && x[i]<60){
		grade[i] = "C"
		comment[i] = "Average"
	}else if(x[i]>=60 && x[i]<70){
		grade[i] = "B"
		comment[i] = "Good"
	}else {
		grade[i] = "A"
		comment[i] = "Excellent"
	}
}
grade
comment
Y <- cbind(x,grade,comment)
Y
as.integer(Y[,1])
Y		
students <- data.frame(marks = x,
				grade = grade,
				comment = comment)
student.csv <- write.csv(students)


fn1 <-function(a){
  return(a)
}

fn1(66)

mulp <- function(a,b){
  result = a*b
  return(result)
}

mulp(40, 60)
d = 45
f= 20
mulp(d,f)

stdev <- function(x){
  n = length(x)
  SSD = 0
  for(i in 1:n){
    SSD[i] <- (x[i]-mean(x))^2
  }
  Var = sum(SSD)/(n-1)
  result = sqrt(Var)
  return(result)
}          

area.trapezium<-function(a,b,c){
               Area=1/2*((a+b)*c)
               return(Area)
      }
area.trapezium(a=2,b=3,c=6)


# Importing and exporting data
getwd()
setwd("C://Users//qwert//Documents//RWorkdir")

data <- read.csv("input.csv", sep = ",",header = TRUE)
data
data2 <- read.table("biodata.txt",sep = "", header = TRUE)
data2
data_train <- read.csv(file = "E:\\Downloads\\IFOA actuarial exams\\Excel workbooks and Solution\\CS1B__datatrain.csv",
				sep = ",", header = TRUE)
data_train
str(data_train)


any(grepl("xlsx",installed.packages()))
library("xlsx")
data4 <-read.xlsx(file = "E:\\Excel Workbooks\\Form 4 end Term 2019.xlsx",sheetIndex = 1,header = TRUE)
head(data4)
average <- colMeans(data4[,-1], na.rm = TRUE)
average
data5 <- rbind(data4, average)
View(data5)
readxl

library(foreign)

getwd()
form4.txt <- write.table(data5, sep = " ", row.names = FALSE,col.names = TRUE)
form4.csv <-write.csv(data5,sep = ",",row.names = FALSE,col.names = TRUE)
form4.xlsx <- write.xlsx2(data5,file = "C:/Users/qwert/Desktop/", sheetName = "Sheet1", row.names = FALSE,col.names = TRUE,showNA = T)


dbinom(x=25,size=50,p=0.5)
pbinom(25,size=50,p=0.5,lower.tail = TRUE)
pbinom(25,50,0.5,lower.tail = FALSE)

x <- 0:100
y <- dbinom(x,100,0.5)
plot(x,y,main = "x~BINOM(n = 10,p = 0.5)",
     ylab= "expression(f(x))",sub = "x = 0,1,2,...,10",col = "blue",type = "l")

qbinom(0.55,50,0.5)
mean(rbinom(1000000,50,0.5)) # simulating law of large numbers

x.values<- seq(0,7,1)
y <- dpois(x.values,3)
plot(x,y)
barplot(y,x)

predicted <- y*200
predicted
observed <- c(10,30,44,44,36,18,10,8)

data6 <- data.frame(hitshr=x.values,observed=observed,predicted=predicted)
library(reshape2)
data6.melt <- melt(data6,id = "hitshr")

data6.matrix <- as.matrix(data6)
data6.matrix
row.names(data6.matrix)<-data6.matrix[,1]
data6.matrix2 <- data6.matrix[,-1]
data6.matrix2
barplot(t(data6.matrix2),beside = T, ylab = "Hours", xlab = "Hitshr")
color.names <- c("Black","white")
legend("topright",colnames(data6.matrix2), fill=color.names, cex=0.7,bty="o")
