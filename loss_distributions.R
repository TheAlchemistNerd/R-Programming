setwd ("C:/Users/qwert/Documents/RWorkdir")

# simulating 100 values from exponetial dist with lambda = 0.5
rexp(100, rate=0.5)
# graphing the pdf with lambda = 0.5
plot(seq(0:5000), dexp(seq(0:5000), rate = 0.5), type = "p")
# calculating probabilities 
pexp(2, rate=0.5)
# simulating 100 values from gamma dist with alpha = 2, lambda = 0.25
rgamma(100, 2, 0.25)

# there's no built-in R code for pareto distibution
rpareto <- function(n, a, l){
	rp <- l*((1 - runif(n))^(-l/a)-1)
	return(rp)
}

dpareto <- function(x, a, l){
	return(a*l^(a)/((l + x) ^ (a + l)))
}

ppareto <- function(q,a,l){
	return(1-(l/(l+q))^a)
}
qpareto <- function(p, a, l){
	q <- l*((l-p)^(-l/a)-l)
	return(q)
}
