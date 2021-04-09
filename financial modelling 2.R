#Inputing the x,y vectors
x1<-c(5,7,10,12,15)
y1<-c(20,25,30,40,60)
#Fittin a simple linear regression model
Predict<-lm(y1~x1)
Betanode<-coef(Predict)[1]
Betanode
Betaone<-coef(Predict)[2]
Betaone
#Determining SSE using loop
SSE<-0
for(i in 1:length(y1))
{
SSE[i]<-(y1[i]-Betanode-Betaone*x1[i])^2
}
#summing SSE
Totalerror<-sum(SSE)
Totalerror
summary(lm(y1~x1))