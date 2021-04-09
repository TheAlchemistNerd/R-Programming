# Exploring tidyverse


# Reading the Iris dataset from UCI ML repository
iris.uci <- read.csv(url("http://archive.ics.uci.edu/ml/machine-learning-
                         databases/iris/iris.data"), header = FALSE)
colnames(iris.uci)<- c("sepal.length", "sepal.width", "petal.length", "petal.width", "species")

iris.uci <- read.csv("C:\\Users\\qwert\\Downloads\\iris.data", header = FALSE, col.names = c("sepal.length", "sepal.width", "petal.length", "petal.width", "species"))
iris.uci
View(iris.uci)
head(iris.uci)

## Cleaning the dataset

# correcting errors
# 35th sample
iris.uci[35,]
# change the 4th feature to 0.2
iris.uci[35,4] = 0.2
iris.uci[35,]
# 38th sample
iris.uci[38,]
# change the 2nd and the 3rd features to 3.6 and 1.4
iris.uci[38,2:3] = c(3.6, 1.4)
iris.uci[38,]

library(plyr)
iris.uci$species <- mapvalues (iris.uci$species, from = c("Iris-setosa", "Iris-versicolor", "Iris-virginica"),to =                                 c("setosa", "versicolor", "virginica"))
head(iris.uci)

## Exploring the data
summary(iris.uci)

# Visualizing the summary of the data
par(mfrow = c(2, 2))
for(i in 1:4){
  hist(iris.uci[,i], xlab = colnames(iris.uci[i]), cex.lab = 1.2,
       main = "")
}

# adding density plots
for(i in 1:4){
 par(xpd = NA)
 lines(density(iris.uci[, i]))
}
  

# Scatterplot matrix
pairs(iris.uci, lower.panel = NULL, cex = 2, pch = 21, cex.labels = 2,
      bg = c("black", "grey", "white")[iris.uci$species])

# Adding the legend
par(xpd = NA)
legend("bottomleft", inset = c(-.5, 0), legend = levels(iris.uci$species),
       pch = 21, pt.bg = c("black", "grey", "white"), pt.cex = 2,
       y.intersp = .2, cex = 1.5, bty = "n" )

# ggplot version
library(ggplot2)
library(GGally)
ggpairs(iris.uci, aes(color = species))

# Three shades of grey
plot.matrix <-ggpairs(iris.uci,aes(color= species))
for(i in 1:5) {
  for(j in 1:5){
    plot.matrix[i,j] <- plot.matrix[i,j] +
      scale_color_grey() +
      scale_fill_grey()
  }
}

plot.matrix

library(RGtk2)
library(rattle)
rattle()

# A dendrogram plot from rattle log
ddata <- dendro_data(crs$hclust, type="rectangle")
g <- ggplot(segment(ddata))
g <- g + geom_segment(aes(x = y, y = x, xend = yend, yend = xend))
g <- g + scale_y_discrete(labels = ddata$label$label)
g <- g + labs(x="Height", y="Observation")
g <- g + ggtitle(expression(atop("Cluster Dendrogram iris.uci", atop(italic("Rattle 2020-Feb-14 19:24:01 qwert")))))
print(g)
