dnorm(x, mean = 0, sd = 1, log = FALSE)
pnorm(q, mean = 0, sd = 1, lower.tail = TRUE, log.p = FALSE)
qnorm(p, mean = 0, sd = 1, lower.tail = TRUE, log.p = FALSE)
rnorm(n, mean = 0, sd = 1)
#######
library(datasets)
data(airquality)
head(airquality)

set.seed(20)
idx <- seq_len(nrow(airquality))
samp <- sample(idx, 6)
airquality[samp, ]

x <- runif(1, 0, 10)
if(x > 3) {
  y <- 10
} else {
  y <- 0
}
y

y <- if(x > 3) {
10
} else {
0
}
y

for(i in 1:10){
          print(i)
}

x <- c("a", "b", "c", "d")
for(i in 1:4) {
## Print out each element of 'x'
    print(x[i])
}

for(i in seq_along(x)) {
    print(x[i])
}

x <- matrix(1:6, 2, 3)
for(i in seq_len(nrow(x))) {
for(j in seq_len(ncol(x))) {
print(x[i, j])
}
}
count <- 0
while(count < 10) {
      print(count)
      count <- count + 1
}

z <- 5
set.seed(1)
while(z >= 3 && z <= 10) {
coin <- rbinom(1, 1, 0.5)
if(coin == 1) { ## random walk
z <- z + 1
} else {
z <- z - 1
}
}
print(z)

for(i in 1:100) {
if(i <= 20) {
## Skip the first 20 iterations
next
}
## Do something here
}

for(i in 1:100) {
print(i)
if(i > 20) {
## Stop loop after 20 iterations
break
}
}
