
#AR(1) Plots
x<-rnorm(100)
sim1<-arima.sim(list(ar=c(0.5)),n=100,innov=x)
sim2<-arima.sim(list(ar=c(0.9)),n=100,innov=x)
sim3<-arima.sim(list(ar=c(0.99)),n=100,innov=x)
par(mfrow=c(2,2))
ts.plot(x)
ts.plot(sim1)
ts.plot(sim2)
ts.plot(sim3)

#AR(1) ACFs
acf(x); acf(sim1); acf(sim2); acf(sim3)

#AR(1) PACFs
pacf(x); pacf(sim1); pacf(sim2); pacf(sim3)

#Fit an AR(1)
arima(sim1,order=c(1,0,0))

#Fit Diagnostics
fit<-arima(sim1,order=c(1,0,0))
tsdiag(fit)

#Prediction
predict(fit,n.ahead=8)

#Prediction Plot
pred<-predict(fit,n.ahead=8)
plot(sim1,xlim=c(1,110))
lines(pred$pred,col="blue", lwd=5)
lines(pred$pred+2*pred$se,col="red",lty=3, lwd=5)
lines(pred$pred-2*pred$se,col="red",lty=3, lwd=5)

#AR(p) Plots
x<-rnorm(200)
sim1<-arima.sim(list(ar=c(-0.5)),n=200,innov=x)
sim2<-arima.sim(list(ar=c(.5,-0.5)),n=200,innov=x)
sim3<-arima.sim(list(ar=c(.2,-.4,.6)),n=200,innov=x)
sim4<-arima.sim(list(ar=c(.5,.4,-.6,.4)),n=200,innov=x)
par(mfrow=c(2,2))
ts.plot(sim1); ts.plot(sim2); ts.plot(sim3); ts.plot(sim4)

#AR(p) ACFs
acf(sim1); acf(sim2); acf(sim3); acf(sim4)

#AR(p) PACFs
pacf(sim1); pacf(sim2); pacf(sim3); pacf(sim4)

#AR(p) Estimates
ar(sim1); ar(sim2); ar(sim3); ar(sim4)
par(mfrow=c(2,1)); acf(spots); pacf(spots)
ar(spots)


##################################################################3
#AR(1) Process
n<-1000;
error<-rep(0,n);
a1<-0.7;
# simulating white noise;
set.seed(9999);
noise<-rnorm(n,0,2);
# simulating AR(1);
error = filter(noise,filter=(0.7),method="recursive",init=0);
plot(error[-n],error[-1],xlab="errors",
     ylab="shifted errors");
title("AR(1) errors, a=0.7" );
acf(error);

acf(error,plot=FALSE)[0:4];


#case 1 AR(1)

n<-100;
error<-rep(0,n);
a1<- -0.9;
set.seed(9999);
noise<-rnorm(n,0,2);
error <- filter(noise,filter=(a1),method="recursive",
                init=0);
plot.ts(error,main="a = -0.9, n =100");
acf(error);

#case 1 AR(2)
n<-100;
error<-rep(0,n);
a1<- 0.5;
set.seed(9999);
noise<-rnorm(n,0,2);
error <- filter(noise,filter=(a1),method="recursive",
                init=0);
plot.ts(error,main="a = 0.5, n =100");
acf(error);

#case 3 AR(1)
n<-100;
error<-rep(0,n);
a1<- 1.1;
set.seed(9999);
noise<-rnorm(n,0,2);
error <- filter(noise,filter=(a1),method="recursive",
                init=0);
plot.ts(error,main="a = 1.1, n =100");
acf(error);
