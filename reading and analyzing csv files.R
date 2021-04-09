setwd('C:\\Users\\qwert\\Documents\\Rworkdir')
getwd()

# Reading a CSV file.
data <- read.csv("input.csv")
print(data)

# Analyzing a CSV file.
print(is.data.frame(data))
print(ncol(data))
print(nrow(data))

# Get the max salary from data frame.
sal <- max(data$salary)
print(sal)

# Get the person detail having max salary.
retval <- subset(data, salary == max(salary))
print(retval)

# Get all the people working in IT department
retval <- subset( data, dept == "IT")
print(retval)

# Get the persons in IT department whose salary is greater than 600
info <- subset(data, salary > 600 & dept == "IT")
print(info)

# Get the people who joined on or after 2014
retval <- subset(data, as.Date(start_date) > as.Date("2014-01-01"))
print(retval)

# Writing into a CSV File
# Write filtered data into a new file.
write.csv(retval,"output.csv")
newdata <- read.csv("output.csv")
print(newdata)

# Verify and Load the "xlsx" Package.
# Verify the package is installed.
any(grepl("xlsx",installed.packages()))
# Load the library into R workspace.
library("xlsx")
library('readxl')

# Read the first worksheet in the file input.xlsx.
data <- read_xlsx("input.xlsx", sheetIndex = 1)
print(data)

# Read the first worksheet in the file input.xlsx.
data <- read_xlsx("input.xlsx",1,range = "A1:E9", col_names = TRUE,)
print(data)