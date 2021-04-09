help(readxl)
??readxl
library(readxl)
Ourdata=read_xlsx("C:\\Users\\qwert\\Documents\\ACTUARIAL STUFF\\New folder\\sta 217\\STA217.xlsx",1,range = "A1:H101", col_names = TRUE,)
Ourdata
edit(Ourdata)
summary(Ourdata)
hist(Ourdata)