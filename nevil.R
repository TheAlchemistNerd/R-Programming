Ourdata<-read.table("C:\\users\\Qwert\\Documents\\gender.txt",header=TRUE)
Ourdata
plot(x=Ourdata$male,y=Ourdata$female,xlab="male",ylab="female",xlim=c(19,24),ylim=c(21,30),main="performance by gender")
abline(h=26)
abline(v=20)
Mydata<-read.table("C:\\users\\Qwert\\Documents\\biodata.txt",header=TRUE)
Mydata
mean(Mydata$weight)
range(Mydata$weight)
plot(x=Mydata$weight,y=Mydata$age,xlab="weight",ylab="age",xlim=c(51,199),ylim=c(2,20),main="Information on biodata")

