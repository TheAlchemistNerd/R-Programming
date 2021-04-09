# adds two numbers
2+2
num_10 <- 1:10
num_10
print("nevil")

# character vectors
students <-c("nevil", "frank", "victor")
students
num1 <-(c(2.54, 6.97))
num1

logs <-c(TRUE,FALSE)
logs

# Creating a dataframe
students <- c("victor", "Tom", "Frank")
marks <- c(50, 70, 65)
age <- c(21, 22 , 23)
gender <- c("MALE", "FEMALE", "MALE")

df1<- data.frame(students,
                 marks,
                 age,
                 gender)

df1[2,]
df1[,2]

library("readr")
# Loading the CS2B_machinelearn.csv file.
CS2B_machinelearn = read.csv('E:\\Downloads\\IFOA actuarial exams\\Excel workbooks and Solution\\CS2B_machinelearn.csv')
CS2B_machinelearn
view(CS2B_machinelearn)
str(CS2B_machinelearn)
