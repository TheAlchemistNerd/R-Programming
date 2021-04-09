
A <- matrix(c(1:9), nrow = 3, ncol = 3, byrow = F)
A
colnames(A) <- c("col1", "col2", "col3")
rownames(A) <- c("row1", "row2", "row3")
A
B<-matrix(c(10:18),nrow=3,ncol=,byrow=T)

B
colnames(B)<-c("col1","col2","col3")
rownames(B)<-c("row1","row2","row3")
B

list1 <- list(c("olpha", "nevil"), matrix(c(1:9), nrow = 3),list(c(10:18),letters, LETTERS))
list1
list2<-list(matrix(c(27:35),nrow=3,byrow=T),c(19:27))
list2

Arr1 <- array(c(1:9), dim = c(3,3,3))
Arr1
Array2<-array(c(10:21),dim=c(4,3,3))
Array2

apple_colors <- c("green", "green", "yellow", "red", "red", "green")
color_factors <- factor(apple_colors)
color_factors
nlevels(color_factors)

gender<-c("male","female","female","male","male")
genderfactor<-factor(gender)
genderfactor
nlevels(genderfactor)
