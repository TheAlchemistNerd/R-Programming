x<-c(30,60,70,35,80,45,55,61,95)
x
n=length(x)
grade=0
comment=0
for(i in 1:n)
{
if(x>=0 && x[i]<40)
{
grade[i]="E"
comment[i]="fail"
}else
if(x[i]>=40 && x[i]<50)
{
grade[i]="D"
comment[i]="poor"
}else
if(x[i]>=50 && x[i]<60)
{
grade[i]="C"
comment[i]="fair"
}else
if(x[i]>=60 && x[i]<70)
{
grade[i]="B"
comment[i]="good"
}else
if(x[i]>=70)
{
grade[i]="A"
comment[i]="very good"
}
}
grade
comment
Y<-cbind(x,grade,comment)
Y
