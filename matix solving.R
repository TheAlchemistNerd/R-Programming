cities<-c("Tokyo","Los Angeles","New York","San Fransisco")
cities
cities[1]
A<-matrix(data=c(6,3,19,3,19,27,13,27,115),nrow=3,ncol=3,byrow=TRUE)
A
B<-matrix(data=c(848,771,3099),nrow=3,ncol=1,byrow=TRUE)
B
round(solve(A,B),3)