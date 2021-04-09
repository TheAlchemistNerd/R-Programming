#Inputing the x,y vectors
x<-c(1,2,1.5,-2,3)
y<-c(4,-1,3,5,2)
#Fittin a simple linear regression model
ACSModel<-lm(y~x)
Betanode<-coef(ACSModel)[1]
Betanode
Betaone<-coef(ACSModel)[2]
Betaone
#Determining SSE using loop
SSE<-0
for(i in 1:length(y))
{
SSE[i]<-(y[i]-Betanode-Betaone*x[i])^2
}
#summing SSE
Totalerror<-sum(SSE)
Totalerror
Summary(ACSModel)
